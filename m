Return-Path: <linuxppc-dev+bounces-15265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B520CF37CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 13:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlD021SyZz2yRm;
	Mon, 05 Jan 2026 23:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767615618;
	cv=none; b=RYZjnCIup4tz0yCm3w+1dSE5dsjOnfWMgBzEmk6xkD+xevluSNjhFr1+P4UkTYNo7T4bUOgrUgiYJn0umgqFZYBOMSiAOLicrY4rq+Jsj8hiKilejVLpHqMD2n7PGF24XdPxghvMWWckBIDNZLEueYJYYGAnq33zLNGCusm24Ls9BwNvAr9O1GXVK5o2k3KC+IX5UK2VsyI6ltNNPHJEdxEHnojdvpnPUt/8vqr72t5/RQ+IJvwJs/xHe01yKsemJrEEdkVsr9gkg7RyzZtafPeekZdoEviCesMOUurkms3FtmYoIRBPDuFrHz5aiGa7QO0NSxsuctzG30i/iQFYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767615618; c=relaxed/relaxed;
	bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJBcBn5HkZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7wSf1ttDkc93sVBDNQVECDYhVnPzzeU8KX9p3Z6d+rySBhaw3/bv2QU9uzqMpoyVg+aUy2zQBcWnl2CRd2D71kGjBloiZAReEXactA8nqEVpMPu7vwIhZ1INx8Q9sMT3DHNQWRH4RjKLtYPW5QGxzVkrM0Apo7WLh4G2wbw7NJE3+aCTVRNnIofSz2a3YIgzEPPQF8TCWZr8FLklW04SImtbkkN2d0IPdYQ2qT1KXbRlo7djTWda4PN711MSYTHBnBoi4ruZM7QGr4tDhcxhnFIFGVfY8JnbPwcV4/JXzNFZos4fchWv+Mf8eu2FLdaOuTNKKjrQWb8KGzPu3+5Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+yezn0W; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYYETa7d; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+yezn0W;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYYETa7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlD005wdMz2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:20:15 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60585CfQ978934
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Jan 2026 12:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJB
	cBn5HkZs=; b=e+yezn0WLbtG/0D8yFEAPm7beZpEby05uLzJZ4mTBJDzt6483wk
	i7ZM4NYRBULvAYvIKnav+PJALvmTf/pVFpVz3DCGBUXJRDrguTL3v8N/R6EWXsVV
	acRGxUvATipI9UeZO7eQnoF8txzx/5raLaeF/rwTV10gCWN0IZDpa91AaEe8lKZ6
	v1JL9bcPJ5dsTxeQQwsL82p0pqP3NT3vxTjVmiFrcoUUOzdlHhY1+wsUc5RtgsEg
	H6PpW/0MejkhGJa3n8acynlJm8VVbwDDPgx8EIXdR7disAga88wZE+pnvY8jLil/
	VYteAr9UhNUov7f784YEdIuckYFP/nPwU4Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftgqh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 12:20:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so521525771cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 04:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767615611; x=1768220411; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJBcBn5HkZs=;
        b=UYYETa7dbvVvJ/BTYB7YY7dQ5orx9hrm+ECItmI06xucyPKZhX+c1vGAy1NdleJgPf
         T0FqOq59AMAh5koa+I2129z333nZeepKuNoSo/BuXOYIDtjMapv6fvAH+fhoHYxwWZUe
         bOD0+gQ4lEdWEqb+qqBw92afO8YSWrOxQZI2gLKCAuHq/0NbbwtfV33sZvop8OygNyTE
         vrRa//lqGbjAKVncZ31dzI3gC9jEsg5rjq9KhebgmeWt1/zbGv+7hczcp4iuTzIHU1t1
         Z4joppWKKBVgbjKgUmCBFRAnCfOZMMkJ68SM9ok0euN1rgkqkmenQ2bIwF+lhvrLGKjC
         w/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615611; x=1768220411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJBcBn5HkZs=;
        b=I/1lp7g6rfJ2gMIWWxy2HlVoqzdA1v5c543dZagk4J6cQ/54YZ4IlqWRA2ZxV3Na2G
         U2VFrE5pZuc/GdmRmH3/dzxNezwgBh41GixwqRMvRrW1JLHHs7+9vWg5Pi1LGvFGRk+T
         Z9sll6KC7OHNXjRs6YVBG9zZoY0feXiRIc5nkLi0c2m1yhLEdqqferiSZZ+I4PkjXNk3
         1jx4ApgS+DLDru0CiX8laZGclQLfarxp00g3lIabNR0sqqLN2giFH6Pl49lGKzyxl7+u
         5q1A8xdU8FkuKVIpZjHAdvR2nURASYbloApcCUQjtvuIfLlpQJK4VvOlQYhVcZ7MwuYQ
         hDxg==
X-Forwarded-Encrypted: i=1; AJvYcCUH9C4KnegpaWOpGxw38E3FASR2LzsZ0zlrfKaBaYwqrtFMs5YNBVyUCqsF4+xno/Dk9XhuqCVqXgeQdaE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxMMAsEhylQizssqIXLv4gyDxbU9u1lhIahTr1kYP8pecPAf/D
	ptWhLV+QZy9slfgcogClUELRXkSZiDfWHG9+Lk49bvR5B3Ejp3TBOGp1s40JkSi//Uz0jUAWAt7
	RK5WqYyNRJSCh4l6MYTVChbVk/9f8mfzdO7nNq6aCeTT8tSFpRRjKiwmN8JJGpg7JfUoV
X-Gm-Gg: AY/fxX6ow1RzqpIfRkfqFm7VbXH8Eq8B1rmyhDnJabJOFQXL5rvcF9BoeKj2rsC+e5X
	HL+Ib4iJfOOk+RUWfW1raDGk2D5lWTqFBc0SZ1gLKG//rEiszRqKvkYv7BYLj5wyQTH79DEG9WE
	/dYpz+gniCb5UcL/bvpaL1SZ3aCKmpZAOv67kOeoBv7rA4PuO007+LSq0mSdIbiFOW/NY1X7Hzc
	hgzhwgyIkk0XyjNfLjoE4jcxBR+Ts87DXC7aKZe4gNUhY1vJS2Cj4mOdkxWrECCxQ0VeQBLnDUM
	oHCMg1pfIeVd3hSGZ1zaDrT6OsQ1BhghoeSxqY7ad7MUlSKwuibCNPklmE+N5FbPbWZfERmn99y
	eGPJsLgry4cUgoIcQfFkJns97dA==
X-Received: by 2002:a05:622a:41c3:b0:4fb:f92d:bc8b with SMTP id d75a77b69052e-4fbf92dbfaemr177037041cf.18.1767615611616;
        Mon, 05 Jan 2026 04:20:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiXk6WzEWxpsp/D38WOTClmOKqYEW5uwRDvmLLQhUeX+3nrB/Q919pNYmXR0aBWy3IZu3dcg==
X-Received: by 2002:a05:622a:41c3:b0:4fb:f92d:bc8b with SMTP id d75a77b69052e-4fbf92dbfaemr177036701cf.18.1767615611067;
        Mon, 05 Jan 2026 04:20:11 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm95467266f8f.2.2026.01.05.04.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:20:10 -0800 (PST)
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
Subject: [PATCH 1/2] powerpc/ps3: Drop redundant result assignment
Date: Mon,  5 Jan 2026 13:20:06 +0100
Message-ID: <20260105122005.130449-3-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iSes7NtggCn9rDTi47Zj5IlDGgC6owxwceTMoGtsOuM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW6x1ve0G7zzWPLkVMTQao552w1nzbW3QZQ4AS
 IM+Jx1TlnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVusdQAKCRDBN2bmhouD
 1+BJD/9u84ujTaomEfOILbLgHUm5i+2BLe6EE7dMcZBuJyMrPbHOuJH34yy1JXs99mLQkSSwEbB
 VW0aV1KTdPhzlyZCumj/QMMzpWi8giZoDNVWXlsh3ErnETjBMY6lsi8pJgWfsfLr3rI3BT1NtM6
 QBJSF/LEpYx0kVTB2LyGaGa0eHWRTS+i7XsVL1dsZxIkF6DHWjySf3f4bA7kG0YEgupQQaekDJT
 iaFoXjRzNvCcFNk/mrDFw09TKOK1aowdmg76RFErqVxEe8zcUDj4shP5Z0V+1sx/kJRLpn5g8tD
 SDOjYZ/wXiC3x4VLAfYkFFPTtsaG+RdfXcHlD1iFcbXcs4C7nRxNPRQQnqbqt6PLjEeo5OcGb9T
 5ySR1H9oRab2fsWYhIuK60YWZYoa143FlWa1siWgjFaWSRgRF1GuW1b6O/fDaIJ9QFhEqAS+8sM
 qgpK5BNvstxNw7TaySwqiaKY0Pt7BIpVeNn75+Hb4AJn179Zn8PoeeOHxcBgxvHQBc2W2spEOTy
 zhhpMNx9ApD4C3OJoznFQwP3lD8RFDXp6gjR1uFlZjq2dXX28KRk8I9k0WAjpZjHdb7qARrw6gO
 +qx53BZ+X0vyKyCVtTHwsBYeylXIwXjAOEBVV/L6l7w7SLRHVscZlm6RRveoPbd9uFRDdZVyx4d 08rbYC28fRApO7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J-Vw9CYjohbo5kjfWQ-v7CvZBF3gQlPl
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695bac7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AlWDwjukKM133PY4UH8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: J-Vw9CYjohbo5kjfWQ-v7CvZBF3gQlPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOCBTYWx0ZWRfX/LoveblM3Ejw
 V2uK6tjt4BxZbT7izV/vp3dpzPR8sgWlPpbxiCqeXjueIIADLM2EMekdOBAgcKenmkK4hvGDSA+
 xaucQZ20cp1mkfuzPaV7KixHrqpVvWpeiBCM4YYAI8q2XF005Qkxossy6wH2bxh9kZ4YWft0N3o
 ZspCCwZm32FCjrJXUY/62kK3tQrGhkBz46TnoJki0Ndt8iaaRaV8hEjIbAl6n4F/V45utQP62Vl
 NiFvSiQccq7SIODiFHepGKagOcA0P+ToicxevctdMqchCB3Z6SVvsQMhkjxwAaFR2aOskomGI3c
 KO4CMSDQNsX4pNRZx6OIcSjKtw8tJ3zSTLim7EJ2ZZSHa1gEzJ7SBEYdd56xo+X6BuhvvCKNlEA
 ioGnJUUKN1JOF7faRZwiOid78VmlbwMVLDgjGmYFFs0t7zpmJns4w7p1RgKrMQkMS2hk1W5/U8N
 SUYk50MxiK9vvUq7a6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050108
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Return value of ps3_start_probe_thread() is not used, so code can be
simplified to fix W=1 clang warnings:

  arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/powerpc/platforms/ps3/device-init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 22d91ac424dd..3ee77f0b42af 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -950,8 +950,6 @@ static int __init ps3_start_probe_thread(enum ps3_bus_type bus_type)
 
 static int __init ps3_register_devices(void)
 {
-	int result;
-
 	if (!firmware_has_feature(FW_FEATURE_PS3_LV1))
 		return -ENODEV;
 
@@ -959,7 +957,7 @@ static int __init ps3_register_devices(void)
 
 	/* ps3_repository_dump_bus_info(); */
 
-	result = ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
+	ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
 
 	ps3_register_vuart_devices();
 
-- 
2.51.0


