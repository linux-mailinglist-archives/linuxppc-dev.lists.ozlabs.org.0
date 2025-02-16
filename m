Return-Path: <linuxppc-dev+bounces-6221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 893DFA37635
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 18:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ywsmy1H83z2xk1;
	Mon, 17 Feb 2025 04:13:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739725986;
	cv=none; b=CofTF6zizH5e9aSrYhjT74rCs5RLtlwO5SNmCGKuhPta3oM1txFSUf4syXIobN6Vz/K2TMd1WbjY25kZElHdAYvc3M+yCUB+ZY9UvwCbX1NdkFJXTVAIcH7st+t0D7MYwU3ZnC+oes+rgG6p6ZnINwmCNvIDNuyAXUPKuRn0J40GUUTwLGL7hfKGoziKX1F5lFA2pb2GmUnfC6prLN4Q2wLLXrMlET+Qx9edevyvIQlxDZ7reH1dmes6ot0r57LAibO5UHsd+ad3mJD7l7megp6VLpRgiviyESiMnrEDtEqhyte+6CbumBb6xWGVPXqmhYCk63Wh6vycQtRcxxH4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739725986; c=relaxed/relaxed;
	bh=OIkV3SlH4E+eHDjXACgFzGAhsHZPruKs8No4vhZJsMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VU10EhO01oJuHmj8aaaatUEvXwx5ZZixo38KuSoFT+axrkkU/uIJXfaePtt12PxPrgy6GCvCRCHPVnOzw+27VZEWWSRbksAVzgNRdU41k+UyMWMOJxDgBZ3eIUyS/Vi5KVeGcRA7qCMQm0YRbr6gk2fX3UCE+fV2gOtNeESaC+krAOQi4sVns6aEOHsfd2Ta9GTB13Mh+0fcB3ebOX4BSxHB5chZ+gqLEtcNRwwl08bKvXs0mA+XGFF6Qguehaz24vwi+3mnKX+YoQTcIQHgzf9GhJ6xrl+ERSxCvAeZoHQPSq7js4Xf0WwA+0Iw2g8qzyy1ox8yIRb7IR5RKR4yOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Scg5pH5x; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Scg5pH5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywsmw715Rz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 04:13:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GBtm1m014937;
	Sun, 16 Feb 2025 17:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=OIkV3SlH4E+eHDjXACgFzGAhsHZPruKs8No4vhZJs
	MM=; b=Scg5pH5xtXzeATmK8qXVbgih3W57mC0SSLZ4f/8y7LYFFyTiWNqi4VhjL
	TXG0igvX9IRpC9cuiNHe4AgB7+nAHKyTxSMlMFTX2T3opwimaYR4LIm31pvy3+YA
	m1zGDb7tHb3MDCKYADyG40woFluZJbE2c16lmHN5sPeqmrum0aaSyzJ1tnZM2JuW
	VTPUpaaAqRH0GkffdNIBV0Oz9FXM06eUk+LykMbUI1wOobT70boFyDpwri1ZMEye
	mYBF+rhiEgZxJyjRnweyPzpi2K02HeebhgfsT5Qcc0ODJ25+ebAU31eVDWWpKaHq
	DueM6SvtOSgrr+/BmFYRvPAcosZ1A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ubqnsj10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:47 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51GHCkgR012808;
	Sun, 16 Feb 2025 17:12:47 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ubqnsj0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51GCp9ax000498;
	Sun, 16 Feb 2025 17:12:46 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u6rkjevc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51GHCglu47055324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 16 Feb 2025 17:12:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 602CD20049;
	Sun, 16 Feb 2025 17:12:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89D4120040;
	Sun, 16 Feb 2025 17:12:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.47.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 16 Feb 2025 17:12:38 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 1/4] powerpc/perf/core-book3s: Avoid loading platform pmu driver during dump kernel
Date: Sun, 16 Feb 2025 22:42:23 +0530
Message-ID: <20250216171226.432906-1-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: siL-VGnGckH0ViHWVFR7cX-jb0nIamIo
X-Proofpoint-ORIG-GUID: bgYP3vRQoKjcXY3qpHDwBN3k_V6hNgSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-16_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502160154
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Platform pmu driver may not be used in the dump kernel.
Avoid loading it.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
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


