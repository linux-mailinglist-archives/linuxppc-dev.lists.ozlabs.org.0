Return-Path: <linuxppc-dev+bounces-15173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D5CEF62D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 22:57:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djcxZ4pvXz2xHt;
	Sat, 03 Jan 2026 08:57:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767361152;
	cv=none; b=mhcz3xm2RZnnrFiEUdDOgrZvpE5W1hSiFyhCxd2ReJZfGREODUgYRVHFzBxarZVVWhZyG+QZrjg2/McYgw28WAv4kEieDTswLy2nkkiIk1oih1JWa2kmD2RKIpxqnSyBA3KFJg5jg9Ce6DK+vi0R49JVQbtxULcaR7cdBa6cwH1FXHkyttWf5/pf83Rbe3XkMDKQZ6G1wLbNLgCbQgo2Ys0iGiYH33Mt1aZ0Q8HfiXaPSehEq24NgyYi0gVuH3Xk3Wo9DjPlwi1RfqQ6soLU5+oWY94S2e2YAifP44zcwPu98doK5pBGu42n/DNAjVaKI9fYJPIlpevmQX5cR+4tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767361152; c=relaxed/relaxed;
	bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKBqxGA0kOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwcvBlOhf2mYL33HaeP5ok9yi6JeIQvGPUk1QUPV/TrHgQ3bnG+pqRJMcCEu/r1ZKhVPM8XLn1IIUtz3ZtThwW7lgWVniOUQ9xVYakTDSiiVGBQnl/NGhHiuribyMndy7ChQdIDXa7rm5C6Lam8N1grrji1D+6Zj8/C7dm1Zo8l+jwtd+msDWtj/XOen9RIOG29qqvoR75x0wP9VSAVAcGkeiwwe+zq0Gtr9ayPeleOaJCHED0W+MKEO/0PzS2Wv4wd6iOSUbmX/QR5qp6b9oSdXQ1QJ8NzBZ4kBw0ekvLjKLQd8iBQJftM2JXaEvhLJxXMIZ9wI2zlfqxPmC4JKJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RE3plvr8; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjuWOn6I; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RE3plvr8;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjuWOn6I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3068 seconds by postgrey-1.37 at boromir; Sat, 03 Jan 2026 00:39:10 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djPtQ6bM7z2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 00:39:10 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W0ix637589
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Jan 2026 12:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKB
	qxGA0kOA=; b=RE3plvr8h6rM1ecLb9HQA4myYXVKSWq0f8+rHt1kkFZcCd/PUN0
	KUJu+Jn+T7L/0+E/K4R8wjnOTa20Z7ZBd42JSC1C73EAUbAz7E4gkTz3VPzPGQOh
	c5nkTc+fgN7YqrQSnj4QfM3Tc5KmUE/rRx0Cyc9bUXlbyPY35CTZY1mSgkus0Lng
	yqrgl7d8FdSMwqevIKigXfzqJfMhwyO2vtwVShpmVoWZBOz/ViEXmh4QXcN+qmIK
	ukg3v7rkKAV4V21qK3UvIXfNw9j0n959HJzKS0rQIVw/ov5KQQfzmdgHIS6lX8F6
	TkLjzGv8m1KuLfBHfww/5gzCAFmrhnTuFbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8utf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 12:47:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09693109so248498181cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358078; x=1767962878; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKBqxGA0kOA=;
        b=HjuWOn6IHcTrmnzokIVJoAjA84KMAid99C+PFMUbNFAW1RiL3ULObDkhWaDJGtxQVm
         g67Vz+X6nTDifqM8ijsmSXnSTdin9qN7+VbqarGmUbI66A61msPiLaUb+9X9SPftQ4Yb
         21g2HnsZUFK9Nbt6AEtRLRe/s5kp5JI8r1ZkUhxGE8OutfmEpk9iBnVJqa33W8zX7Hdh
         feLEcFpRU/7JGAwRFdExxUTQA0K4IMoBb6Pexgse04VFozW6AmgvstlJE35GgTW9jlyf
         aeBviBKoxi7m+wlBJ4NxPfwT74QmDebM8TvyMFRKUjDm9FuS2VFcwh6VoF/nd5JKtB3N
         KRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358078; x=1767962878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQrbwl6SmdVqWhNW1JcN758niEOl9CpKuKBqxGA0kOA=;
        b=A6jArumkIo11boQO4lt2/9AI4A+R2zVvl8xvt3/rYc9UCtc7r42L9W0S77m/WDA3BZ
         4wYbceuV/pAIQD2jGHnUBbBc6gXMi8jh3FG3m1qoBvt1oudDUoA9aZc63JQWgSGDIKyi
         qGJ3o8LzcrJLCIcafF9bmagpYi+6xzO7pCKvwfUDYT9m5LuhMwdPC4z0Q/ZyXQb6HURC
         8zmcNML7/NDBUIAgBV0kS16vmVWw5Eyn1bdR2j/Nxst9KBhlrNXayO97bp1ik9mV3rAV
         Hg8DXb5f15Hko+JWyRgxmeS+xBJexkLiNEIRME7roinhIfspxIgbmIeheVEhG380vZbl
         nnyw==
X-Forwarded-Encrypted: i=1; AJvYcCVIImBi3bYeU8kr8SJ915f7PhSoEC9eQAfbQ6GZh1nk10NKYGrmKDHDh88PMGgnfsUxaoVRNjYWFOusWeU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxCkA3+OJZn67HLVN/m1HOxzM0UihFebFKAVnT2liTF/RqsHtBX
	jMXtNb2mX63WFm/vzCxi+JH4VIiWKDCtZzF+JAM0wSOVTQvkjjLAFFxxbGmnG1vsSDAJJBtS/Ka
	EtaZIhaKfDzRMhIlItEdcPLQ946CSYnRCzXVfUgAZtN/8oiD8MXKqQrM93Oe3TpPe1TLL
X-Gm-Gg: AY/fxX6YZdTg8/j5IHJ80rxsO2mo6v9Nw3rLsNj6qDB0qBNifNnzLbZZ+RUZqVpcvs8
	s5I618bBXNt+/Zjma4b7zAi3raRvyBdMSmv3Be6Uzx4ARCNF2vfTQ6SZBaN4IZGCtXno5kxItlF
	mGoJliOl7TaU1e2GKt83pXcfuP9Hnres2fPPqrOihkaHq5mnkf9jEGM1RcmGQcqq3sf9K7eKMIg
	VMDCfBUqorSjUHtMycXc+mvu0FlDJraW9Qzw1OQncn1MqP08PrBYP2mNf331GTkO3bGuB85EOdv
	f7Z/0YVXQjwDhxqaPiNPF9v7yrl+1fLdftfqj7Ka0WiqMwK4gvhS9gx66amHjsTVz/UuASukTX5
	VIGd10j1wzckesK/CDHTq8hyqLw==
X-Received: by 2002:ac8:7dc6:0:b0:4ee:b4b:a4db with SMTP id d75a77b69052e-4f4abdf1570mr562010311cf.82.1767358078490;
        Fri, 02 Jan 2026 04:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt5R2wR9jhv6LNUtPbAFm5e41MAtMTk2OQVaV00K4MpUB0p78vFUF5TlqbcNz+3hdxbBi+cg==
X-Received: by 2002:ac8:7dc6:0:b0:4ee:b4b:a4db with SMTP id d75a77b69052e-4f4abdf1570mr562010141cf.82.1767358078087;
        Fri, 02 Jan 2026 04:47:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm84197536f8f.31.2026.01.02.04.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soc: fsl: qe: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:47:55 +0100
Message-ID: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BwMUVIqgHsSLXsWLr/yHkduFe3TEnk8MGFxiheJTEoQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV756G8AhvfrUbvLgeAdmB00yW+jqEhRSn5I3U
 MvBeDKFz22JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+egAKCRDBN2bmhouD
 1163D/9yjVKt1NJDhqAFymdk+oeVkcbK/AvZYdXTCE9keCAp5fzJlxteLIkJFXXRwSHiVoVgBJu
 iLzmVZTllS2CdQYt8HoXw6afnlJds3WT/bU4xf8SnnufL3XiV6dI6sEatblrTkZgVIWQd+FE7Ho
 xVdq71lHc3Xkn8O55KDWUiQad0rUdxvRWKNzxkfIArwchQt7Eac6QXrq5Rxyng8c9fXPXhAAGkg
 xpmy6NZd5tjSPPw+LKS6WY5AKMRoWsIbhDJACnwhHqDBwVFrjYSQvtpCZSk+pp4NFnv9N0/Mu90
 Uyaj3xZAf/CkYYGQTdz0s7bLO8vk5HplDfEMUXxq6b2jUM5qUyPR43E+4XXMJYDVjC3MNqdC/k0
 2AxH64OiTaoq2y/Fnpff5Mti6ezV6keRQNgM6sR0zzNf4pYHogY7QvcPzXoN3ddxs/yvEi+6aGh
 9OQJcFCXho7mYWWlNo/ED9EJ5go/zffcC16e6pjInkzSRxOwfj6vIlHmVrYz1JejD71AIMuuopM
 5rrjcNKBcNoXvJhlZrZo8oDPP+m2QV1KIlY8xWSIoMbdL0kCePRO33UP/l+u/L8ya+jrPfOdkea
 r/fzuaq84mIZvSZBA7ZIDDNWCvwc+obMDHI5Svx7A4N9wL4UJTjPdZApZkJC5XABAgRxE90qCDo WpmAC7x5E9svkRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXymgl4nokZaAQ
 Aq4N8e6WqJNCXX1Z7rvhaO1fSd3JcnOjvSZGLZLWxVgarq85XaKkjXvlrCdBAy75FZFSeDzMG34
 74YARkBEJUFdc0CvgOJEbIWHBM2BBZKLf6vqHW2dgVKuUvoWpgi3ViTjziSRtXXU+keQx/eBEnp
 OtMYwoX9jWgTVBUzHLatrr8CURMGeoKsQOu+GfSrt4x/xVyFP8Sb0wPJreXFVCaBHfZnwo/eW8p
 88oZr+8CyJLZ8/wf/N0yxqpqn2nhIVnufjFAXdMwhAKeGSw5vR4MP8Xr3Cb3VMA7pNoThGkvjMu
 X035DW+Uza7vLGoQzH/vL1wh5tSifO8eYiHn7MmZdNRrKPVzghB8m36DjviYe+7XcIhwUx7qeFf
 2H9AT/RammYTJaANH7rB0GBcVOoxzPfSzw53A4F6x7AqqACFF8cQ3Aysy8gRfazuxLCrDU5Gs7l
 oqI8/51O1uemEmiTh9g==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6957be7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1gcOjtyiWqLwmlW-95EA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cYce2KaQpD2jF9QCNvHVAzSUKcPhkf7h
X-Proofpoint-ORIG-GUID: cYce2KaQpD2jF9QCNvHVAzSUKcPhkf7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/fsl/qe/qmc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index da5ea6d35618..c4587b32a59b 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1284,31 +1284,26 @@ static unsigned int qmc_nb_chans(struct qmc *qmc)
 
 static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 {
-	struct device_node *chan_np;
 	struct qmc_chan *chan;
 	const char *mode;
 	u32 chan_id;
 	u64 ts_mask;
 	int ret;
 
-	for_each_available_child_of_node(np, chan_np) {
+	for_each_available_child_of_node_scoped(np, chan_np) {
 		ret = of_property_read_u32(chan_np, "reg", &chan_id);
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read reg\n", chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (chan_id > 63) {
 			dev_err(qmc->dev, "%pOF: Invalid chan_id\n", chan_np);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
 		chan = devm_kzalloc(qmc->dev, sizeof(*chan), GFP_KERNEL);
-		if (!chan) {
-			of_node_put(chan_np);
+		if (!chan)
 			return -ENOMEM;
-		}
 
 		chan->id = chan_id;
 		spin_lock_init(&chan->ts_lock);
@@ -1319,7 +1314,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,tx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->tx_ts_mask_avail = ts_mask;
@@ -1329,7 +1323,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,rx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->rx_ts_mask_avail = ts_mask;
@@ -1340,7 +1333,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret && ret != -EINVAL) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,operational-mode\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (!strcmp(mode, "transparent")) {
@@ -1350,7 +1342,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		} else {
 			dev_err(qmc->dev, "%pOF: Invalid fsl,operational-mode (%s)\n",
 				chan_np, mode);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
-- 
2.51.0


