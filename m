Return-Path: <linuxppc-dev+bounces-14966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CFDCDAD04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:13:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW5X1lnrz2yG2;
	Wed, 24 Dec 2025 10:13:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486540;
	cv=none; b=BOngsRHm1faInOtoRdbtxOjQFPzVcIu89nuXUUJMxBxfO2VoRmG2hELSepIdiVjbSbsPRdI6e5XcsJv7ZptLeFTwzfsTcc0tyn8u1OAc2ZBoE0x2EgK+oFLn4K0UogwN5wer+Q1Tin/IoPYiOTqatLLUaTtK2gyfIc89daUHxuc5kgZnfjKM/07maSWelq/bJavahmFv5SSgrPfr8RXIrjMViBF7jNf+i5vQPSEMM/z28Q/DsdwzFZWw2TkjJ3gqE62m/uqcWLpP0B3QV2Fjj92E6a1k+rr0dilJwR5AMz2OkO1elkhwZ0oxEVbF4WBa0F7QI22/OtIypF3ClFX9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486540; c=relaxed/relaxed;
	bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MB4OsNPEStnDlUo2+EuBU/c6z/ib7pKiNeVkvl2Z915GcG6V2AVUJr0VoSymzYMlzUWb2ZY1d5gRLaX4KWRLLsfgjABO7oNcc0scSvb0LbwQ0Q9gN7hKr3Pu6uKHNhEeydOUX03yRljN/Ab2vfJXgkofauycFzMvVCpZfc/XOtuaYIxu1pvE5bVNXHMVgUkmGettpThb/7kOG70nGE5njUsw+ubjf70cMHkpVvTNjtAg5YWmYIe16G8LUCeJtTJGTd7EI7Z9BQRjAlmmGuyDBgu9C1h0unw2XVg29Ga9X3Wx6w9z98p3TqVjx6ZqK3sq5mQkMUZUAvSWREEFfdkEEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2GLm8R2; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emwFbOcn; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F2GLm8R2;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emwFbOcn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBQz4q9rz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:42:18 +1100 (AEDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9qDSU1894975
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=F2GLm8R2dREg5sck
	zgwCv6IffFw5EQxdkz6nZX9+TnNyy8LZcekauJxst7CNm8WdkKpH/ZVHkj+qS/px
	GDbP6yrTQNayaiBAkb/FwCXjoYPP4IeJ8jjaPBc2jMUIXkL/lj7vMWlD/Axn4D0l
	rCjL/MvYhL3NNd9iF8EdRvRVZwxSfaUUqhuOFLiDDWRKnPWgf2q9DzEnYJJmF03b
	zH9+8N8WFL6TFMqn7tqwZIo/0lxAR0ZA8mh77yxxGs1g2ItJ1k99KAFxIAjftPcN
	XKqKe/l9ArxoAmdi6nrgzWDkW/iV6O7Gldkg6pYtMi4shkzKgT5f0vUZaj8iT+bE
	ZOwRmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takekh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:03:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so69426481cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484182; x=1767088982; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=emwFbOcnmxjy867F07lX76fW8jaakhVZDInpF7tST+ZqQlGVVX6VzSwgTsAqA80hz4
         k788EhkbwUIYahI9h5R5OOvQIweJiNIcFmv3Sv7DM6VwSJi6UFT889JQfd0ZoTBocXH3
         KUBFLB1Cy09EvKRAaU/tW/mLKLD7rHrpPV0j5zZMCiaAP0K+/ghRO+JIYTsJLTg3sKlq
         ygkX78QfHguI0/tGe4ImAr14QxBH34p6p+na4n62WH89CuP/GcSWVSL8rnJAcMajcUq9
         w8vZVGVgr1Pf+ncE9WUuQSTM0Ni33ZZFz0hqBQsp1hsgxCnIoakR7V5mhKqlQbnKVZ45
         BkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484182; x=1767088982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=iveAKJp41ofG975DGahSalL/iD81uCSQu0Vyf8NvVRJ9Zs4W/PMHQXwBuiz2GIcG3J
         dbtyoxT+1hqyfjrUqWxaDQSdvsFkx1Ws9d8xNCgASbRsE2I8xt4yewbWW4urBUy8xuaP
         NGZciu/7B20Ku3YkYTAW3jyKAfxSnX5hl+fMtBQXspwqfgi4dT/9oxRzhFqHZdi/jrGg
         DT6OjwNWTQ1tmW5bT2RGn9uwpoXlZbvUnWPbFirzB6D09mrJUfUmzTVjMXbPuvdJb2gC
         SrnI1QOCoPfr9RZ02Yl0gy0cQUuGpnu6/R3tJXdp/aYd72tJPnc2QaBKmMYpx9eN0K+f
         Gjfw==
X-Forwarded-Encrypted: i=1; AJvYcCWe7ewDHPkQW3a70lOLJEVHTQfh34H528VmUDWTT+OicGnKN8/64yZZv5fCAC1uhHPVRHx7plcvRXTne2I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywgj6Iu2+DgNmjf3GWkL/jvATjntGgAcYxsDkpzi7KenXW/JJaB
	5yD3Piul3NTFdt3CvA7IAnBLatfbJYZIxjxs+Fv03vBn9miv3Z/j+3fKozGbHzcdAdq8N+PlBBd
	+l/W7284RO96TNZIB+l9M867uIdK6+5azc7pGmWAavpDXrZKpv1Q/RIZVVOhOS6KTOfaN
X-Gm-Gg: AY/fxX6lzV4vKpGBrJSlbNs7PgzylcAG9coxZ/xzgmU1D+C43OT2thUedK51BNekZIu
	3UInOPbtZCx8c1zGQSXTyy4fowLmDLdXnKOYK7zFqf3ZHF4QDZlb9OfuoKokPwNzREoHveX1U8I
	IciX+GalcWBizeJcEXKTSV49vgbog+dziifER1lfnXx3eO2Fxe9r6SKBVVmTJ4w+LYmu+zEALLa
	zjlVzafUbRO3yvckgXa2midfFzZijmKozSK983sGdzLYB3sgqSpSLo/Arm189Ce4lJ8Xi0PNbIb
	mP3snOZuPVo3+W20svx5NhOaNLG1Ud3xi3038amIdb8oPubIVYyMzjqWJhdKZ19nIpENNKesOC2
	KaZ5xpSrTKYiVCm0Bn7C3Dbr5uNh7G3dwboYSfg==
X-Received: by 2002:a05:622a:2609:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f4abcdf56emr174601951cf.26.1766484182016;
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYmKh9q3TVpBvPGG04xNQnPAJXRKn+MV5cm9azWZmmq9WoPxX1CHwGyf0VG3WWqkcEF5gNgg==
X-Received: by 2002:a05:622a:2609:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f4abcdf56emr174601651cf.26.1766484181594;
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:33 +0100
Subject: [PATCH 11/12] i2c: amd756: use i2c_adapter-specific printk helpers
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
Message-Id: <20251223-i2c-printk-helpers-v1-11-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjB5UVNcmc611VKtySZweLgh03lH4CqLyep8
 HN5EDTCCTaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowQAKCRAFnS7L/zaE
 w7K7D/4+c+Fz0nx+enSy+0T4yYkJZdn0nkZfXEFvgWl9SaytNp+VrFeIZFFCXXMRHJLHzQ9F6yE
 6grb+AXEzou95fx6/DnPZnO4gmcgKK1vIR5ea8WocpwnbE0BV8n5SCeDwJtTMqb/i7ESl/L6Uw9
 7YdYJWNS2IXMX7FN7fE/Nc+ibmyHtIv5QHZQbD4L4NEDUBDXt3L/u1EKGsqMyUp5C/3qAtSkXH1
 ix1sU8F1hiF4ppon9nlTAxe6MOmla3QRgWCA0i6WoPuIYU+LtfFBSz9PlLMFSQi3/Tb9pTJojmv
 sZyt0uBuvEPgfDyh9D4q5y8scZeFgW6/roKmrAmktmOPfu69d600IhvNzHX1/53yk2+ruS4HAWe
 jr2xoMOReoaIb6zkzEE0K90I4fJNM8eFCx08mnXqg1typ4jMHuTRK26+T2kLlreUWiNAHYXbg8W
 NintnTN9h/k5RLXA8M0Imm1bBI1yXyxIp7EejP6p+7y4WMjVDx+KmJsnYtWI5qwSIgG0EGvrG8n
 HzEAMhq4EHGZ21GoCeWNKI0uXpcwJSls/9lQfmgT29CNmnigZgBM8/PW8iEsLmgHAFwlt1BpTZn
 VIO7KE9o3UipYVObALa592Fk9Ye+4KVwPvy4fepnLyrsTInjb15j8hoaKeYzfo7Zei9+IYYPHAR
 cv/14KJKs7ruXCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a68d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IUzV_G_aAFXi5cZUTYgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: H_WQpO0x-d51Euj9kBDiztU_aF6QyABP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxCsm+YWxAEGX
 MUq8+dXrzzC8YGdmHBeRh1R+54oIwTqat5GyF7O3XGvgBrBdqPrVw0b/yH9abZR67HjfGfQhlbB
 BoYNtJhvjo/ji5qu8vQDP9kt3RtQtWTJObwC1oYeLjr6lHDkSbebaQrWfO2aIkatOOYM356BGzQ
 bPL5BXPLDWyW+cz3+hgIrgG/8+m1x6i4Cpz1apqYjOhb78G8XMv+PK+g4Zwgs4Wh+SuTbn5/m0W
 GxSaAdV8WDX7KBoA5PpbI+q5hQvAvGjBo+tBTEFKMBBXGufCdPT/FFgPY032icTJaa+eWXFPA9h
 FmtngpnhBrXxcye37xPZ/SNKC/WK+RxsBSKB1qxwT9JD9vxmDqzDuUlcq6ozoBojC1QjVRGmpei
 cygGwzl5kWWdcsg5zCu0LUFoHz4nAyt9sy8WFFPjMMHaxiwhDrLlYKBajNUd/qK8+RJzGHph5dY
 whNhbLtbsmTJFRwICTA==
X-Proofpoint-ORIG-GUID: H_WQpO0x-d51Euj9kBDiztU_aF6QyABP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-amd756.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 3621c02f1cbabd8c5e9d8a4ae1494ada78726b15..629da0b8024b88cc4d51ea5e785147b462a1281c 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -99,14 +99,14 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
+	i2c_dbg(adap, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
 		inw_p(SMB_GLOBAL_ENABLE), inw_p(SMB_HOST_ADDRESS),
 		inb_p(SMB_HOST_DATA));
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
-		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+		i2c_dbg(adap, "SMBus busy (%04x). Waiting...\n", temp);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
@@ -114,7 +114,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 		         (timeout++ < MAX_TIMEOUT));
 		/* If the SMBus is still busy, we give up */
 		if (timeout > MAX_TIMEOUT) {
-			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
+			i2c_dbg(adap, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
 		timeout = 0;
@@ -131,38 +131,38 @@ static int amd756_transaction(struct i2c_adapter *adap)
 
 	/* If the SMBus is still busy, we give up */
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "Completion timeout!\n");
+		i2c_dbg(adap, "Completion timeout!\n");
 		goto abort;
 	}
 
 	if (temp & GS_PRERR_STS) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev, "SMBus Protocol error (no response)!\n");
+		i2c_dbg(adap, "SMBus Protocol error (no response)!\n");
 	}
 
 	if (temp & GS_COL_STS) {
 		result = -EIO;
-		dev_warn(&adap->dev, "SMBus collision!\n");
+		i2c_warn(adap, "SMBus collision!\n");
 	}
 
 	if (temp & GS_TO_STS) {
 		result = -ETIMEDOUT;
-		dev_dbg(&adap->dev, "SMBus protocol timeout!\n");
+		i2c_dbg(adap, "SMBus protocol timeout!\n");
 	}
 
 	if (temp & GS_HCYC_STS)
-		dev_dbg(&adap->dev, "SMBus protocol success!\n");
+		i2c_dbg(adap, "SMBus protocol success!\n");
 
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
 
 #ifdef DEBUG
 	if (((temp = inw_p(SMB_GLOBAL_STATUS)) & GS_CLEAR_STS) != 0x00) {
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Failed reset at end of transaction (%04x)\n", temp);
 	}
 #endif
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (post): GS=%04x, GE=%04x, ADD=%04x, DAT=%04x\n",
 		inw_p(SMB_GLOBAL_STATUS), inw_p(SMB_GLOBAL_ENABLE),
 		inw_p(SMB_HOST_ADDRESS), inb_p(SMB_HOST_DATA));
@@ -170,7 +170,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	return result;
 
  abort:
-	dev_warn(&adap->dev, "Sending abort\n");
+	i2c_warn(adap, "Sending abort\n");
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_ABORT, SMB_GLOBAL_ENABLE);
 	msleep(100);
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
@@ -233,7 +233,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		size = AMD756_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


