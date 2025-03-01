Return-Path: <linuxppc-dev+bounces-6588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6452A4AD4F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 19:23:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4tkN0BQBz2ygS;
	Sun,  2 Mar 2025 05:23:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740853419;
	cv=none; b=AwWyfxaVElEGQXZ2tW2/T2J+jXDx3MU/185Zww7bFQZDTwoyi3vQFTjsVJcXWsE7KXSg2fDmiFujr3Ou5tXf0Z9YPuRdD3Ke9FcWNmkyo87jN/1wDOdHO8Vx+YZoM22cSDjkdYD+sRYrmC3vTieUCFzSr8Azfnqb5UE9plb4CNm8FVfUy2yOavzTuq4BIQukz3vzna2RYpLuts6dhyfpguS4ZcM4kklROUwXvn/HLt33I9yFjo8JAX/zBk3TAlPHiyf1VouoGB64+a/LNy6C+CwHISMKbw+0WSWwgs+//nSWN+mwMau0syfqDSOuXXig/5AvPHmoEbvUxzoXGRrJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740853419; c=relaxed/relaxed;
	bh=2S6C2H0ry8McN5j+4A48MxKOlNnjSD3Qb0R4qoZwYOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UF5ZZ8+AcIIBzyLCplu3kDKEa7xdigWAdyiGtFvJed5A1X7EKQB1eBVqvbdwXjiOGoQB4Yf3CkKmONnAh5UrTv358PWg61sUnJFgiChtZrGeBRXTCa/EqMrFVNldeGPPTUVVzjYD9QR4p/DZFEXxGyh/4GQ82W6/5d1m3CHG+3MmZWz3C16swpAJIIIF9EUNo/uTtMOoMwpAfBDJil0g4AVpDbGqIg2Rytyi5dJ/a8T6OYEWF8RSMFJFP/5FVddmIDtC+VlBXvUbRoO7bXQgM7oaHcmcADK4/qwDZ7rci9dxpVg/YzfFMof1/wLe6M/5Iutyn4pSoclA8QJ2SCmLZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aEKtcWd0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aEKtcWd0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4tkL4cqZz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 05:23:38 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 521706kV031692;
	Sat, 1 Mar 2025 18:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=2S6C2H0ry8McN5j+4A48MxKOlNnjSD3Qb0R4qoZwY
	OI=; b=aEKtcWd0/MujoLdx3f7F04j3yUzPQCUwNpHTOfixN95Zh/IT1vO2NwZDS
	HBdEgkFP+9maZQx+861ddp9KOFoP0y3AwPTWByNWd/IcbH96O/+Qkp9/hXAKvh+F
	+ZOInmivx1p23Y2nqBg4r/Z6WdoNbFQTth11nG1yQ8MGIOGLcq3DSlLjEgNLkypz
	D++aPJ5lCBKIdc7M5S2we2ZCJ1Q04G+Xy9CM81JnqKY8pGRO/fawUAQmW/iDNYSF
	Qfn1655QVDJheaOoR6oPuSGp3DZxx3/Act5ep7N1n5/vKQ/72dUHQPDrTsOW1olB
	jCpGSZ6IUn9hiTJbmGKzQmY9c1waw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 453uhx21hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:26 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 521INQMn003340;
	Sat, 1 Mar 2025 18:23:26 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 453uhx21hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 521G6Vta002570;
	Sat, 1 Mar 2025 18:23:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yu4kckxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 521INONL34538192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Mar 2025 18:23:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0876D20043;
	Sat,  1 Mar 2025 18:23:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF6C120040;
	Sat,  1 Mar 2025 18:23:20 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.6.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Mar 2025 18:23:20 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform pmu driver during dump kernel
Date: Sat,  1 Mar 2025 23:53:07 +0530
Message-ID: <20250301182310.6832-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-GUID: hbnrssgDpU04n9KJ57cXMg8HXDwEun48
X-Proofpoint-ORIG-GUID: 0UHH5z4__asnQUrPibC8uGoRzwtl_WKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_07,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503010145
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Platform pmu driver are built-in and these does not
have a commandline parameter to avoid loading them
during the kdump kernel. Add check for kdump and fadump
kernel to avoids loading them.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Added more details to commmit message

 arch/powerpc/perf/core-book3s.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 2b79171ee185..9a009dff63b3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -22,6 +22,8 @@
 
 #ifdef CONFIG_PPC64
 #include "internal.h"
+#include <asm/fadump.h>
+#include <asm/kexec.h>
 #endif
 
 #define BHRB_MAX_ENTRIES	32
@@ -2571,6 +2573,12 @@ static int __init init_ppc64_pmu(void)
 		return 0;
 	}
 
+	/*
+	 * If the dump kernel is active, skip loading these drivers
+	 */
+	if (is_kdump_kernel() || is_fadump_active())
+		return 0;
+
 	/* run through all the pmu drivers one at a time */
 	if (!init_power5_pmu())
 		return 0;
-- 
2.47.0


