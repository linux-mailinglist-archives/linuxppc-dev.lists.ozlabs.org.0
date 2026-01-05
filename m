Return-Path: <linuxppc-dev+bounces-15264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9087BCF37C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 13:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlD021Gtxz2yRM;
	Mon, 05 Jan 2026 23:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767615618;
	cv=none; b=nY6CdUsZ+owemEhdtfLpHNCIRDjiIulRckL9wQ3tFqLkRx50RLShydKdRipdht8qyUx/nYRctJ9dgivJvSiRq0QgBX2MOKnR//2/l4RN6oMdilVeVuGxKRMkuSa8mbzWorMwt8JdKqw8Ky+94V08JvLBhc1GVWxf8KXRMvRYKAcdR0hShjGUu6PZ7latpMmbJVKEQuQUSGBD0oJdLq5lEBts8prjxJbc/Beg8c/nV5zd1j/R5icRhKwe0IIoc9AKxm37OXP7Z0rmjgcnKOquqvqqV6kdROeAsWS85df3U4cMfBkNb6xytYQsIEzMAwqGcw5v3410Mh1yIO/xDKBbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767615618; c=relaxed/relaxed;
	bh=5O9DEEahiOq8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDFrMiKW9JF3mWSDc8RpEtdxuYD9hhryKA8Bak7VaRUe/sUVgwvwpQevo2xKrZ38i+6hIYM4O6KlLu2ckOgBONjZvum7VuYqYHL+NeV2yCTafOL6SWYaBzK92/I2iLOQCDmorOfjQ9oI8ysChSXofWkUZK/XmHr1aETZTgPGdZ96KyUQQZykANyHxBRLz52i8qfSKTpe3d3zptiO/VJ8nvVhAmXPPmS93PcnBnBBMYRt85hnnH4m5FiDay1RK/n8zQmj/f0rFPqX1KS1wJK3TkxbiI3fbT1fhm4+N+PzWTAEvheAfPyL7SI1ZqW/rYnXhlsLjxd1wMNygeqkdbMHkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B3UKGm+4; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGm6jYR9; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B3UKGm+4;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGm6jYR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlD004hQsz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:20:16 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AYTiQ936749
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5O9DEEahiOq
	8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=; b=B3UKGm+4JyuBQJphvYW/e3Yj8m9
	Nr8VMQSXIn02IEOkvSJFprhdOorIorjRcUVbxHphfzaTC//cvjhlChlFaHACh5k6
	PiS6vah+Y9jlh3iy+mOfa+UhSBURIjt3RgvOHfTDVl3h43XB7JSbS5Exys90GWrx
	yqG/SDYzTil0WIENYzIkskpCh1msvLTWlpbtpAej7+F0uI1jHPUdsjRtgWPolA/q
	VNfM57+CAHRzYZsHAj1Hh7ssZMdDBUMQzdZ9wZ0Z6GIUE0slKnTRuibQOAy2LAZH
	MZRX/84Sq0Nj/zim0eQAngNNH6k2CTAbPiLBpbXy4kWr1ZuC2cr/f2bn2Kw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgbnv889b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 12:20:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d7ac8339so567369091cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 04:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767615613; x=1768220413; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O9DEEahiOq8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=;
        b=AGm6jYR9fc1Tdow7T7s4soDXCHIDrqQzqTQmUjSleD99ZT/rE8GE77ZxqcOoClNlov
         azTHbxQjs3ApUnVezKXbfNM/Xs829hAGrChdTq5xhjXOpZODL08Ykh2Hkko+TC0iSoN/
         BaR4hgW6boLZT30S4LPt9XJ1qXE9Qi2po4xrD3CGzSymyYIxDBe1kYfTesEabNmFouo1
         IVZppIbZ7z9SdCwMeCTVf+l2z+m1jnrLRvJV53TgS8+4mRZQVCnX7jaVaXhNUzAbSZHo
         JbU/2m5zTVnzGIFLeXRn3lVa0BIi+0cjLps5m3f4akWoDSJh3xr2/F9MA3dKYEEJlZ1i
         BABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615613; x=1768220413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5O9DEEahiOq8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=;
        b=MJCaGuPNy270IprxiayBeRoLr68B7e6eK819N0lAXu6ei7unGlMXt8YmfJlqmzjoug
         mM6bxikm2U0p7tAS8r92H2xlhfqHO2U0AevfDNOtfX4DoBRNUqVHaNPAOycSjup4rNRc
         9ZevFGuM51/V6u4UhpHQIqoLZDPYOlX0Cmj+V+bDtCXbqfByY2PB0OUyxQ2DtIzxHLjx
         bfHGxIYsVRXRDZpP1A6EWFhSmfSLinwWW/b/aZ3UViprAu0yl/pYg2a3tjSWOgpYUHdT
         eslhNbRXfsZOhH75pukvEKA36nR6xBId6MMVhfohXzSW0JSyQV7iln2HAUMt/Bm4yLKx
         PyXg==
X-Forwarded-Encrypted: i=1; AJvYcCUvLdXTCUarwTehnhrnn+dVfG8rMq1Dqgyq5eYiHAAOGiioQKgQSzKl34uxSHaSp1JLNKUsXQAANk1v5a0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqxVO1Vjhaq7vViFJa69szxo8kNELKmaXPHSL5hVUXkm2lgEBc
	ycdFqiCjyUVIPAzHcxZihIswCqJGvwQWeIuIj6ZX1oE+6Tj8Id71o3xhXlgW2DfI72ReMjgvpc7
	it1ZRLMgvjDPjQgcXGi7Oea57/MzrVICZmRJwGkSXWs1w6f1Ynny0C6mjkHRGyvDwfNCk
X-Gm-Gg: AY/fxX7Vxw+nCKtzPwaxANB5k0bDnRc2/sMjXEGSqUqh/xnnFv/f/qlj3p9RpxvN/EF
	/JMZxlF4t45F8nyjkYPSQB3GHMnVzeCRL0PhfCyHa8LXxhsrBZLfa/WVWihf4E/uA2G67auipeL
	yQinzbjDV4JI5Jol6K1QO8xj00cL/AdPIj9jv+lAdxRnu44preDgf2IauhbckCD29NYcAmW3G4B
	95l0ua4Mc2plR5CyDqU3fCmmi0d31jzF9RULR22pEwInSQ/bFc+GezFnqU1yyhsHX5fQpg/+byR
	zxB2t6hnL+kCXJ2et9nnmmdhYBNZgK71Xx6tUZ2leLrhfEM+zOhsr9kTu4UsiTpsuwrlvE2Csxf
	gPciCUA4THnS341tUPUW3EgluGw==
X-Received: by 2002:a05:622a:2b46:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4f4abcb609amr716071051cf.7.1767615613548;
        Mon, 05 Jan 2026 04:20:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVqMkvkbOQOtX9mucHXNqT1EemGMuXyPNH4gZ+0U3NyW4QmVX2YkF/y6kPMfBTJNdislg0Tg==
X-Received: by 2002:a05:622a:2b46:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4f4abcb609amr716070711cf.7.1767615613017;
        Mon, 05 Jan 2026 04:20:13 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm95467266f8f.2.2026.01.05.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:20:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] powerpc/pasemi: Drop redundant res assignment
Date: Mon,  5 Jan 2026 13:20:07 +0100
Message-ID: <20260105122005.130449-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105122005.130449-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105122005.130449-3-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4jOeG2CBahkA9uGMPQpbdq3BO1OwJNjMXBCeURlKH44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW6x2lMjcKPfqEAEnOwzj/mmHTcff8BVcGS2wv
 /eZBFcvoSqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVusdgAKCRDBN2bmhouD
 10eOEACK2dHfvV/c+dLmn813THxz+/INoXY+FFUiowbT/HbKqi3I+SoJfP1jV5Khditw2VIpdtZ
 BPsqD5IjzRypv5B6shENgQdWGOhkKfkd7DVuxtBKntr2esrTO8b94lO9A56DFlhIDtxXJrlAXiD
 bUxZRUeokfScn8XxNLyl5yayn+oZMXhEIAtVRZ4kHruQ/E1aVT0+BxuH5v39lnCfyPiK6YGhvWH
 aLxmRV39P+jvA39JQcM/44ZUNzvZD/ind99FtRAzquTSguzUfZm6crFQvVX87Jbor97tw/cNPKD
 j1NrMu/uYA65wUR/5kBLlvN/1nfCgQp+Cq8KGI/lglFeBUgvSd7s8xWeM91nFFo/ankBIMz6gdZ
 8dPFehYPglo81t08pGF1R5mmuUr5N9PqGixIGDPYm6mNPd3uXBSRzbH1+bqt4qVrj1yNlWGYy19
 rhT3uCr9/r/7x0RTdtWRBvpvSD+sRVpKOgTHJs/mSOC7B3O4RjOioXbpOcyNy9rQ8+74rB+DuWg
 DGpIHHD6uCqWLgiGlTYHQDj5V++09egONoAj6u/uhRsGanHypjUVB1RCNfQxBth3ndxQ2XzAcvB
 0WEEYbehNYGuz20wy4AiKtevK29lqylGZ+vqw6ky4sLGt+IqjCylbQ0DaGrVvd8qjPVD0RwQvUA Zorfdjy0CaEvWjQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=695bac7e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1PZ5zuzDT7_94hxZgQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BVZQkUXdqmTkvjzsPd0OZdI_T59sQE_l
X-Proofpoint-ORIG-GUID: BVZQkUXdqmTkvjzsPd0OZdI_T59sQE_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOCBTYWx0ZWRfX8TJcMseSrtBM
 sAC/DdYQvjJjMRZJmwmNDE0tzrCNDX9CDRZpQ4QlGijWhcM64Q0YVpW3IJTEESqhCPYDOsoPj/N
 8pwYNQ4JeIGTo1v9+DiYiRmcr7aKDlfKQJLHvvLTP5V2oNodaENu7TiSCAHL0wQMVR4+hsXMra5
 o5x72mKZ/2a7xzdnR92S3U1w3gaSS6k4yVo5wt0aRU3Xg9aGkRUUX/P1P7wSV9JKO5cV79X+Sd4
 p9Dk/Le7vIswO0V+8ZCgvKb2mI5+SFJxxYbC4gd+SNhaZK+XOuXLi61cgIYqWOZYkgdg6HsPEMV
 IgcQs0N0vQ+3QddSiCDQculy6/Uu6gQeKG2x2/wyLvJN0hI02vky2KpodKKVGDg1KNOqORmJd5q
 Z64vOolxyK+fZRe3d99ubmok+fmAesn8+adG21chh1yLU1oDFhJZXso3Y1MD4Edx4jaZETYHFM/
 JB+LsxnfEzk60dw1Eqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050108
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Return value of pas_add_bridge() is not used, so code can be simplified
to fix W=1 clang warnings:

  arch/powerpc/platforms/pasemi/pci.c:275:6: error: variable 'res' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/powerpc/platforms/pasemi/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index 60f990a336c4..2df955274652 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -272,13 +272,12 @@ void __init pas_pci_init(void)
 {
 	struct device_node *root = of_find_node_by_path("/");
 	struct device_node *np;
-	int res;
 
 	pci_set_flags(PCI_SCAN_ALL_PCIE_DEVS);
 
 	np = of_find_compatible_node(root, NULL, "pasemi,rootbus");
 	if (np) {
-		res = pas_add_bridge(np);
+		pas_add_bridge(np);
 		of_node_put(np);
 	}
 	of_node_put(root);
-- 
2.51.0


