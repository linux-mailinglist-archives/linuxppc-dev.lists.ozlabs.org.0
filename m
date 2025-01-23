Return-Path: <linuxppc-dev+bounces-5507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DBA1A354
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:43:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzbW1tcGz3064;
	Thu, 23 Jan 2025 22:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632599;
	cv=none; b=HCo4KhsXxhfPxKWwXPesztSfKq/SvtLEVg8L1UKa9W3xnG5q3eBZfSGP8dTPqji2LOvDN/UGxqNYRl5wMKLWlPgA2mZoTy/W7h+9WXH6WFgr9chT7wsNIBGgszcVANUJ7HzWJzHOjPjeMaiMNTRv5DfqGKeiKBKjx1OW5i8vJC/oCcC4t5Bv7VQ6YfD9Ifc29VF9BbAqiWDblfrmboQ6MPuIO796CbRm1BEdi/V1RxcStoQ0kp0Teo8l0I0+k+IAzU8bgztA4O98ZWhj5bRdAATSn3rgUNuBSZuYxH8CdUILyA6OOcGK3XzQDxmWSGC5SUQHKb01i/yNP58m0ITuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632599; c=relaxed/relaxed;
	bh=V99xEjoyVsWB7pNPxvZGxYeFkOGi9kJSCeHsx3DsIc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=je/NxL3yKb5SW/BUDR2V00C/YzS1t7DXDRkfy/0xnOxrJpCvfNIgoBFNinx5d7HaQKExVfQF7OrEIoW6wUAdYA+xUAVRgogFw84DSWssuoEXAKcCQhnR1mjpcdXTCrMB7QaoiJWcpyAmWY+JBi1gkX+UrYsuIoFsUbTERPkONJsYIFqGqjEpVSz+5elsE4em3HRS13cZsPPZk7Hk5qWNI6zBBcAuWdBYuw2QKHzTpt7VUS6fq5mhkFB0fzBZgrrDtAhEvxm8zS0XXU17mMGiyPPTpZSa+ZUy5z1TZQ4eGO0TwJIl1YVfPs8pbTSsvyJYEwLHfhLLD2l2t24tmdDSOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nS7ORprr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nS7ORprr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzbV3P31z304C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:43:18 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N214oF014986;
	Thu, 23 Jan 2025 11:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=V99xEjoyVsWB7pNPx
	vZGxYeFkOGi9kJSCeHsx3DsIc4=; b=nS7ORprrjGDPSlFj5aQBJgvQwq1sXxypU
	/sowLv29sSRI8cu6hVVTdo/T04O1EH5DRIjMx9CZHZiwTzr0XkhVIFcSfXP89KJz
	MC3GjO7aizZxztbEWAFWuXeihGpDhPvxzJL5e87zsQ3i4YOlC4gRaP06JjHB7hDm
	l7IEZXiUqaUIUpz+AthzPyrOEEftLBjd7Fr+0yDs30cfz4Os3xt6y2+zutHK+Arc
	SaBcVTxX9aIDFimut+5Z9nNNLkKR0KvF2eLVR36ofdxc1hyVvfSzXn8RZ3IEcINJ
	rPSG/CJHBEb9jaApsHuI9xa31mJsoJiZsBNguHKha7kGo1RtN5t2A==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bckyta9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N8bJIh021002;
	Thu, 23 Jan 2025 11:43:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1my5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBh54R61276658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:43:05 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A470B20040;
	Thu, 23 Jan 2025 11:43:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2AD120043;
	Thu, 23 Jan 2025 11:43:03 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:43:03 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v3 2/4] powerpc/fadump: fix additional param memory reservation for HASH MMU
Date: Thu, 23 Jan 2025 17:12:52 +0530
Message-ID: <20250123114254.200527-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: F6ZtgbSeb3teF5NOkyiSluzm_xFtBzo6
X-Proofpoint-ORIG-GUID: F6ZtgbSeb3teF5NOkyiSluzm_xFtBzo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxlogscore=651 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
dump capture kernel") introduced the additional parameter feature in
fadump for HASH MMU with the understanding that GRUB does not use the
memory area between 640MB and 768MB for its operation.

However, the third patch in this series ("powerpc: increase MIN RMA
size for CAS negotiation") changes the MIN RMA size to 768MB, allowing
GRUB to use memory up to 768MB. This makes the fadump reservation for
the additional parameter feature for HASH MMU unreliable.

To address this, adjust the memory range for the additional parameter in
fadump for HASH MMU. This will ensure that GRUB does not overwrite the
memory reserved for fadump's additional parameter in HASH MMU.

The new policy for the memory range for the additional parameter in HASH
MMU is that the first memory block must be larger than the MIN_RMA size,
as the bootloader can use memory up to the MIN_RMA size. The range
should be between MIN_RMA and the RMA size (ppc64_rma_size), and it must
not overlap with the fadump reserved area.

Cc: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..26e3d151e048 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -33,6 +33,7 @@
 #include <asm/fadump-internal.h>
 #include <asm/setup.h>
 #include <asm/interrupt.h>
+#include <asm/prom.h>
 
 /*
  * The CPU who acquired the lock to trigger the fadump crash should
@@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
 		range_end = memblock_end_of_DRAM();
 	} else {
 		/*
-		 * Passing additional parameters is supported for hash MMU only
-		 * if the first memory block size is 768MB or higher.
+		 * Memory range for passing additional parameters for HASH MMU
+		 * must meet the following conditions:
+		 * 1. The first memory block size must be higher than the
+		 *    minimum RMA (MIN_RMA) size. Bootloader can use memory
+		 *    upto RMA size. So it should be avoided.
+		 * 2. The range should be between MIN_RMA and RMA size (ppc64_rma_size)
+		 * 3. It must not overlap with the fadump reserved area.
 		 */
-		if (ppc64_rma_size < 0x30000000)
+		if (ppc64_rma_size < MIN_RMA*1024*1024)
 			return;
 
-		/*
-		 * 640 MB to 768 MB is not used by PFW/bootloader. So, try reserving
-		 * memory for passing additional parameters in this range to avoid
-		 * being stomped on by PFW/bootloader.
-		 */
-		range_start = 0x2A000000;
-		range_end = range_start + 0x4000000;
+		range_start = MIN_RMA * 1024 * 1024;
+		range_end = min(ppc64_rma_size, fw_dump.boot_mem_top);
 	}
 
 	fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,
-- 
2.48.1


