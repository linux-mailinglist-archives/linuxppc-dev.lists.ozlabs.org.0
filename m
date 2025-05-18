Return-Path: <linuxppc-dev+bounces-8649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2BABADEE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 06:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0Sp43C45z30NF;
	Sun, 18 May 2025 14:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747543308;
	cv=none; b=aOAPbvgXwT3b9pLDp0t7UP6t260wr0NQ+DogImOPM+r5pMQFF+Y7kfNuh4xJvCpAQa+lTJNr2mWLlwsyiDjHB0+ZR3thTYCd47wZ7/Gtv0jjXhxsbdksxbcyBVBXg1kE7Zgl9e/AA7lY/8grg3yWWd1ZGlp01JELwkJl+TUllQlYMZs/MdbohAytXPfvt1Sb54yy2nUSw3fcWQr+1khCT7oyrjxA9hO6lypz3KWTBB2wkwYChTbuvNxFA6MA5Rs+XYtMBdnRZqse3+8s7T9d8EmnAQloR5MbDWZvKYt/4KGPvn+YRZMK0lzMDpgrz89/K/KpNiwbHEJjiewNjZ/lMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747543308; c=relaxed/relaxed;
	bh=JQJh6sNIlvv1GM+qb9UPC5+GNW/zcPsNyFf5GpfIUUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZpiBTkKCZkOo2WSjRM1uJq6B6eV1gmkcg2ILzMqfMVqFocvFDoHEHfcAkQdhm9xbxB+MJhh7P2aRoHQLoxeDR1Ggy/TBG7RDzDN+tD8khz1saQ0qW0FG2DoKHosHjYORZTYeomJchjLTIxA+O7hpNbqVSIW85T5mfrJzGIweL7drWec1kMHycHUNlGHytaOkGeaGEeSD+h0AsBmDz8wZXQJi5/m2C0MaNAsk5jTf40LNy7rhsiGtkRdAh2fGNF0AOuGvqfF4O0sgyljfOcnEraao/V5FlOJgtsgCIBgcGGiqEajICbaa0vRPGRCjsI8SAiKK07QMF+aEh81AbQD5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b5X1i9Ai; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b5X1i9Ai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0Sp34MnKz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 14:41:47 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3ahUb011708;
	Sun, 18 May 2025 04:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JQJh6sNIlvv1GM+qb
	9UPC5+GNW/zcPsNyFf5GpfIUUQ=; b=b5X1i9Ai2+7smywBsYqEjq/YQQMduwfi5
	HPTcbulG+YDS/3+1lesb17PeH3Dk/GxiSYXRTF4a0ZnFfNpmvD7RQ1vHPpeXYaq5
	11xD5vB/H/8cJXCBbkc/0dbrljeFxQKUuhEs6F4TpRCWc7gjHFNo48PyZN72Hoon
	7KCnboHdDTldFVKhyzxK+6Ly3uWRXN2Rz6TO7boJjS3+BA5jAn3gvOAXXawGz74b
	9ZvbRtLN5oKCwCtLEO+aydyIFfcwCo36NTxwk/ID3pQnh7u8abmHZCnF8514QAq7
	qbA3OsJSSWJzs+QonDsUpG0DAbf0FdmujBavS5zgDIDFVw1TFYYNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0389d91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:33 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I4fWH3030702;
	Sun, 18 May 2025 04:41:32 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0389d8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1JVsD002486;
	Sun, 18 May 2025 04:41:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q5snghjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I4fS9u17170844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 04:41:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEAA520040;
	Sun, 18 May 2025 04:41:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 711422004B;
	Sun, 18 May 2025 04:41:23 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 04:41:22 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@cab.auug.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v2 3/4] powerpc/prom_init: Fix shellcheck warnings
Date: Sun, 18 May 2025 10:11:06 +0530
Message-ID: <20250518044107.39928-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518044107.39928-1-maddy@linux.ibm.com>
References: <20250518044107.39928-1-maddy@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zZxz-Gy9SwlNnUrxpJsE3u079amgXG4a
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=682964fd cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=ksR2oIC-PuAIPJEDuLAA:9 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzOSBTYWx0ZWRfX6zIFaCb8TLNk D8orgSB33oHUA4md+tb1bxQMVqdUqNvwYlCr/95uhxcrP3ztSIWs78hMylS4sKmbxixLvFQfTs9 I2Z5tkOltGgJ7lYCQ/LPJMILUzId1nM7yZWUfA7ax+gKvwnuEb4DnyyM2Vaa9b0g6AWfGptGg9y
 45mOz0LqA7AxjivratmLpypA87mBNEynUvyqjxBqQT6tjGGZ78B21KfrDYxs9Mv+oE1plc0OhlU 7Ifo5sMqdIPJERsshHTNhGATvjkSy6DytrmRuFgefNQwZl/T8DeQ9wmIYiyW1wH9YpEJsflMHpV awyeYSw23BVtXy7STw0EnAZjTOLV6SoWE3q7sqPnG9lv65pjZNmW0qtZyabrLMqsKljp4F4C/Ir
 n6jAbpXEvJy1Np1pQqbSzUoyvmHuKYgSy0sapRji4O7Ml4lcEQVOAD3d+2qvbH2abfghFT1P
X-Proofpoint-ORIG-GUID: xz_guxOGYk4609GqUO2iDLQcQGUy-5uR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix "Double quote to prevent globbing and word splitting."
warning from shellcheck

Reviewed-by: Stephen Rothwell <sfr@cab.auug.org.au>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Added tags

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


