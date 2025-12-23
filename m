Return-Path: <linuxppc-dev+bounces-14971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F96CDAD1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW7d3bJTz2yFw;
	Wed, 24 Dec 2025 10:15:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766485096;
	cv=none; b=fiBKgGgKcfbaRBJXulrTuIMAgz1oA0M0hnMojvwinO89NtIUamo5dsZDOjj362ShiDAmRC9+vYwxRhutv37apsMkPTZuJg5+bk4bkTNOA+Ayy8dj1Fbi9MEGus2Q7HzYzE2zJcLLWO4hRyeaF6B9ZEezdP3Q7fYvyp3YRqbtehC727+VnqImxvX/JWO5LABuo8ABcqAM2PvsfLX/naxM60bhOH6oo9kzZWfNALqnJOJZxhQLRjktTpvqksDoRuFuA6HO3D+PQ6JkVQVP2myxkHnM16RsPeFm3BEwSHk7cAsTgitT6yJSpYSmZdavVTJo9bnQOqHhYwYO5/bGz6DgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766485096; c=relaxed/relaxed;
	bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtlJdPa+3Yv5H+9yK9z+sQlsm5atV6Uc3qZ6sE6/98meSEcVFYrBsVvD7Abva1h2nztH01AgyEq8toxq8P1sgbeZp70rvjt3WNc6ZIgKU7VayaRZvvVF+sQEFDryw8pqQkPFL8Kfj6xjwE2gAt/SpvoT/8m2IUt1O0gyqfxp2MLGJRF2Yyq3hTtthom9E+KCa2YAl0VWOGaT0HGzQ7QzI9OWDebNWeVhPzI9hYaNQ/fFlCL1t5m3ZzHCfuLnkq6m2UtylOHSsDTYBavlMNrT6CVq2NCazjdqkNTyfINfK7W0BG1j9IYJJOeqqca7+JMN0WR1v9UG+EPv7PkYTIQS/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG3y2eBh; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyNfrL/U; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG3y2eBh;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TyNfrL/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4db9vC6Vxsz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:18:15 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5wkmg1901861
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=; b=hG3y2eBhBYv6LK+z
	1gL0yrBRHY36kK6tWsTAZs50z93bty8jefw0oJk2zhNokRswgV3Vu0zE0e0pU+01
	K8xNvRQoWxZkFlv0ohVF+xl4CxuTiz0CeskCHnmGDfa7zJAYJ5wsECLupZN1+WCa
	EIGTJV1DUwjeBWdszzlplx8YYqbH6yshlF0CXRi2xJMIfTj4hwljaK/uQ2OzCrs0
	qlNfZ2iaCLz/lQb+dJpEQzzmirkg49C0m1UONoGOSEYhoMHmj9o1Pi73+4JkTf5u
	rfK5s3fH+6/mrrs24LERc2HyagXov0pf/WPkZTqqF9m94mL/z4QJ3kTZqRc1RT3+
	YLgXZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so1243698985a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484168; x=1767088968; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=TyNfrL/U1PDPAnd6I30QN6G3GKKbB06uuo/v4gXJ/z/ElKaoor1IyPDxwE/QZDFBMX
         sKEgku5JARbInb0qMHPM2ulotySQJJAd0MOt3X27s9UNWDF2tE6Yh3UMXjQW6QnXLLR6
         7VOD66VoiIbhBRyANZK2ppXz9u/NwpMjXKhLU3H95vGBIbtcGpP5dONpgXUW0iHJps6J
         M+b/PMTzThkw/yciWfC3647QlMeSVNQsw5n0mBDUUtAlIzXMtjXhenuvE+R7GJwn8r9N
         M+IQoTg2iqe7dKTJA5lMwEnAf9/onqJ0zgvl5c2xkOy9kdDThaSS+Cr5jOqqXqknDT69
         h+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484168; x=1767088968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=L+Xi1dFOUmw1h/aYcy/DSH7liviNWQCr7RVGtGxh817VquSp3ETgOEdoGzx7g0ge/S
         060u+4y8xxXeuqIWwTfLFDsV4F7mSPXGjykEvX3wvf/lpNIawy2FwT06otdEa1B5VvPR
         aIAaBft2oF6pMCCysWrdHGWqg7slORqCzPAUiKY9CHVfIxOeLwMPw4pHqhTvH3nU/RMO
         lqRvjKD/vRnDHcdqHRaqvWIfBfqDXp61MZocNwow4IX2V3yDlCpFzoDVB/rLUMW8OBP1
         5BS/P7td558tPVVT8fmQeRDR76MPVI0kvF1boFlpQfLJRyoCaqcQdNqP3zHdZ/kwGTbI
         8mtg==
X-Forwarded-Encrypted: i=1; AJvYcCX8O1F1k8pqzNAUxZLLWNFJ1S91eoUvLX8XT8dVgVWuy+5uPbCwG2JusTHkVlI/GKSUGREsmGTd2lqOpQo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzP+loaSSjahfy5dPBClnRixVK8fKEk+R1GqrL/soDgoFTt35SW
	p8UtRctyk9+H1ZgN8g+K/ro4YonaHMKkLndM7V4EW4A9PeE0jOKcQF//3jPQVh6eTQ8UxKg+2Sp
	x0Q02MzLPRrQUN477dKihCt1FwH3tEPObtqEfvnqJkrLHbN1CjnZSNJd/2DMr4KFe8s4e
X-Gm-Gg: AY/fxX6Krd7WCl2m5HchbQV3pHNDurK2abC0dFmKKZPMgtn5GoQ2OCCoi68WZhdmizi
	xCDsJPbts/1GGymSxacqmbr1m7+BmzC+chy30oVhO/uY8/dIUBS4D8nPDGquxg+WcslSi9WlVC9
	/xS+Rdc5BaQ2o/ThRIsCe0dKkT9fUaFDJR3UC92pY6zj3Fn6WkMaibnNu2k4vnceHAQ/lymnTEc
	1NoVh/Fs/lsVNLgOc2HQuVfo8FqZkIrnGyuTB5hNiENUv/5EZOQwkqqnF30cfq86TaeoT1pPznC
	rZp+MxYO+RBW9Z2402gcm/KP25dl24WoBnXwtoH5swt7En8V4SsqOk+91Lu3mv7E5B7rd518GVv
	xtr7QYv1z11KB+8D6TyB4st56LJushWVK27nysw==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204127281cf.39.1766484168125;
        Tue, 23 Dec 2025 02:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCbCcOwt7PwsENXNFXjD41YHGkGJlBJ34XwvIgIwyJ9Q2n14TG1CsoAxoooPIxMGGgm4WVfg==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204126911cf.39.1766484167633;
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:24 +0100
Subject: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk
 helpers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cKutYeAHpo6nJsViJWxWS7S+6Sn49J6bFof6YwzIKbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi4lDcQCifG3TxNlV3pNhaduY0Sn/XzxO1IX
 6KkowPlTIiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpouAAKCRAFnS7L/zaE
 w3gBD/0Vl8pDykw6ETOkKFQljl3UM1M3CJbnY+yo0kZT+SiECA8eRrap87iHfm19c6mC1Qcm42T
 fPEtfuni5DTWZzzF26TvLyz4l7ZEcMg4Q6UAEZVAc8Jybc7WaVUeRzf8P5rwSki+HdZ0W59W/XQ
 tkJ2GtOGSQ52XE7I5wmASiDxxX7bp58IR/I31WfS005D6EqhpvQAwKdTw8gYYkkxrY6ZwBe07BD
 kae+CXffjmnWs8IFesCbYHseao9A95f2UvZEajaOvCjrES9W44cGVaOCP5nGRkHwN/bnw7qzwSh
 N6n750a0l8S4etcjcnFPB7Zc9n5xNi1P2y4T/bU2WrBBFjdph7PiXgS3ihaM0CEWiriP2QIYzjo
 jk0daF/965GEziSPEoFBLEF6McW4lhbsKxmAczTkG7A4UHMU3OTc5iu6IN2YgVs/uD8bMeN71QL
 C/np0FOY3cMZ8FkJpMSHXO9JA79KmO4grADmcJ4tsK/H/9c8Og6oDho35TdruxQaOq4TSjxqOrp
 ihqJqL0ogTI0cNTl05hoyvBy+uCPa4qWxn032QvCPq65yamv8Ry8abNAW85T8Ai4ipoyuFAztmY
 drDCsNvroTIdVEEfDq6tyj1ZxfrH35z+7tA0DKl41RuWwf8WOfeeOVrdH63KV5Dtvpq09ygIY2k
 pKhjZl4zQIk8Vyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2SUyKogNtN7H
 RA4BTUEHVWRIxPbKMiNSE3ZcDXu/oF89tMm0HtOnuuk7yUwBgSTYzFS+KzRvTFGBE3dKlryaaCV
 5plR7lhZZcZ17Q9w4xMoZLI6wmcwGN4IHkRqEIqnXUMHSQJ6iFg4nvboT33bD8bSaPTjKJEgdag
 ltS8gceAaKicRA0/4Gz6CekDMLES7N0UDQnIwsSeY2yjGfiTOPo4bzcnkekfRa5QLQU9EsjAkIg
 4MlDh/7LI8Hsvl9bnCNFuBjcgFXUegSsR8AO+jRBOw720hp87TCNT734tqv4Smev+Ix+U75TOvW
 Q6S4zht45x1pcn09OOqJdquRGU7ckPRZicz+Pjd2o2pW1SXAFwgIM3vb7FzzAA4LbDLb2rY7vwF
 Q0n851cURUAK0SwS28xqWjMvvYEBaakH8A2n/p2b1Y2A72rsNIbXX5c7pyGHaHMMElQry5q+h9V
 ULP57/iNFLBKfDB3DWA==
X-Proofpoint-GUID: qxURCqTiJirVeWE8_abCDDLC26gArqK2
X-Proofpoint-ORIG-GUID: qxURCqTiJirVeWE8_abCDDLC26gArqK2
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a68c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3lqC0MzlwKypD_ZaiT8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648c082f319d955b5e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
 	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
-		dev_err(&adap->dev, "invalid P2WI address\n");
+		i2c_err(adap, "invalid P2WI address\n");
 		return -EINVAL;
 	}
 
@@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	writel(dlen, p2wi->regs + P2WI_DLEN);
 
 	if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
@@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	wait_for_completion(&p2wi->complete);
 
 	if (p2wi->status & P2WI_INTS_LOAD_BSY) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
 	if (p2wi->status & P2WI_INTS_TRANS_ERR) {
-		dev_err(&adap->dev, "P2WI bus xfer error\n");
+		i2c_err(adap, "P2WI bus xfer error\n");
 		return -ENXIO;
 	}
 

-- 
2.47.3


