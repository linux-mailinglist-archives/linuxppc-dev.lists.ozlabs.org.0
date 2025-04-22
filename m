Return-Path: <linuxppc-dev+bounces-7905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3567BA96C2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjM50HKXz3btX;
	Tue, 22 Apr 2025 23:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327536;
	cv=none; b=KyOT/uq6Rs/T8NTTTxY17FErEQ/kA+a1uLiFYUYM3vEWMVJIxHO7Ig6+iK4zWclJ6cE0+mjaPWLT26Tv4FU05tOUbz0PUsm5EeEAP3M0mMvWUvKM03VQKafx8CFI7cIjr/dORXSnwGtyFJ9TVTi97gdxoh5QYDv48Melvt4m7JIOy3uqQg3ZnvK5XQm798VHykKMFOv85lFW5Raj/FXZuiKgrs6Ln7/IJLSGO9Ap6Q8Fg+nVkYqdJOb1wYp8AGoF2UevkAHWptOaANyThoRv0bQHi8eiaHcq0B67ukP7r01MbcAqbSBBylJpMPnUdr1JFKWAuafxRONTvtvlP7HGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327536; c=relaxed/relaxed;
	bh=3ENofPg0Le02klO2BBkBWkjf+BlKtztwPU+SXxF2wrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiA1WO/9n/kcp8vCOJwWPn3Q6jfQ6fxaMV8GPbqh6Crfb3HghweqmbmVTHXhBV9UOg2KBME+kcVSA23ZfrU/CAPxPm31P+wMe26p9RKn6LWR/ZmRzZosKNihGvx77wl27WWj4mTYwBXVW3Yyre93YrlthjUAyGX6mXi8xRhW5IGYLF2I9KKCHnAephsU34dSqcYqrhCNtczMaDQcyjbBqoDrKJEeAxErTSLAHuiaOfJ8mQ+JNAC1eUKwDreuVIzW1lfhoDc6TBdHLf7QWWNxiyARePq6DHpXbL4XDj3rV0SdzEEo6XcRShm7I8ubBzqODA6qwooRjJDtDGLEhgqL2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rcXaxnAc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rcXaxnAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjM41pJHz3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:12:16 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MC63pt026790;
	Tue, 22 Apr 2025 13:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3ENofPg0Le02klO2B
	BkBWkjf+BlKtztwPU+SXxF2wrU=; b=rcXaxnAc9VMhOwJk4AlzB5gEnXfi15jy0
	raNunw/nhp3urCO58qE5R2ML9h2SFyD1t14XmExav21oZBsIJVw273iDXw8qUxcA
	Z4bJA2lVCQhQfJi5Cz6km9IF122WR4JkIS4tuR2o5Ne61+plz7/IqwFgoF/IMKAw
	R31fjVIUAWoy6FROtW/Y9/Or+zdMVI5g6qtUZdLWWudO4DaMP+rddvDKEVCnZQi7
	ByJu8GU6hCXtnPgQYNjJRP4pz0HI2eaXAvG77/jsPuN2hDtGLArM4N6pcD+TZ9ZW
	RUbL7LuxTAzWZp5VD+YRPMnhX+zTGuXXEp0kUphXoavbySwaup/AQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4669jrrp5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:12:05 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MDAMDe002227;
	Tue, 22 Apr 2025 13:12:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4669jrrp5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:12:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCOV0U001791;
	Tue, 22 Apr 2025 13:12:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rck2qvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:12:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDC2B332375472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:12:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04B6F20067;
	Tue, 22 Apr 2025 13:12:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE0520040;
	Tue, 22 Apr 2025 13:11:51 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:11:51 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 5/6] powerpc/prom_init: Fix shellcheck warnings
Date: Tue, 22 Apr 2025 18:40:39 +0530
Message-ID: <20250422131040.374427-6-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422131040.374427-1-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -2pMI8VWi5f53vbjTJjocScPg0UZC8ZR
X-Authority-Analysis: v=2.4 cv=f8RIBPyM c=1 sm=1 tr=0 ts=680795a5 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=ksR2oIC-PuAIPJEDuLAA:9
X-Proofpoint-GUID: orV2tOJ4bPljQC9T6wxqEf9Gq8lTmXWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=908 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix "Double quote to prevent globbing and word splitting."
warning from shellcheck

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/kernel/prom_init_check.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index 69623b9045d5..3090b97258ae 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -15,8 +15,8 @@
 
 has_renamed_memintrinsics()
 {
-	grep -q "^CONFIG_KASAN=y$" ${KCONFIG_CONFIG} && \
-		! grep -q "^CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y" ${KCONFIG_CONFIG}
+	grep -q "^CONFIG_KASAN=y$" "${KCONFIG_CONFIG}" && \
+		! grep -q "^CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y" "${KCONFIG_CONFIG}"
 }
 
 if has_renamed_memintrinsics
@@ -42,15 +42,15 @@ check_section()
 {
     file=$1
     section=$2
-    size=$(objdump -h -j $section $file 2>/dev/null | awk "\$2 == \"$section\" {print \$3}")
+    size=$(objdump -h -j "$section" "$file" 2>/dev/null | awk "\$2 == \"$section\" {print \$3}")
     size=${size:-0}
-    if [ $size -ne 0 ]; then
+    if [ "$size" -ne 0 ]; then
 	ERROR=1
 	echo "Error: Section $section not empty in prom_init.c" >&2
     fi
 }
 
-for UNDEF in $($NM -u $OBJ | awk '{print $2}')
+for UNDEF in $($NM -u "$OBJ" | awk '{print $2}')
 do
 	# On 64-bit nm gives us the function descriptors, which have
 	# a leading . on the name, so strip it off here.
@@ -87,8 +87,8 @@ do
 	fi
 done
 
-check_section $OBJ .data
-check_section $OBJ .bss
-check_section $OBJ .init.data
+check_section "$OBJ" .data
+check_section "$OBJ" .bss
+check_section "$OBJ" .init.data
 
 exit $ERROR
-- 
2.49.0


