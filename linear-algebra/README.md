# MATLAB 등고선·벡터장 실습

2018년 가을 선형대수학개론(MAS109)에서 다변수 함수를 격자 위에 계산하고 등고선과 gradient 벡터를 시각화했습니다.

| 파일 | 내용 |
|---|---|
| `contour_plot.m` | 이차함수의 등고선 20개와 높이 표시 |
| `gradient_field.m` | 비선형 함수의 등고선과 수치 gradient 벡터장 |

MATLAB에서 이 폴더로 이동한 뒤 실행합니다.

```matlab
contour_plot
gradient_field
```

수업의 MATLAB 실습 틀을 바탕으로 함수 계산과 시각화를 구현했습니다. `meshgrid`, `contour`, `gradient`, `quiver`를 사용하며 별도 입력 데이터는 필요하지 않습니다.
