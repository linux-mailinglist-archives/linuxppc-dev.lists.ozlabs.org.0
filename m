Return-Path: <linuxppc-dev+bounces-5424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2453A17205
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 18:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcHYF0lBcz30Sw;
	Tue, 21 Jan 2025 04:35:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737394529;
	cv=none; b=FFXFGb9Uk3TlV3KS/TG0m6WjSczmMufzY55Jz37zWjBpT1MlpOvWQlA7gHLM0pzNy3qjTqdup+tE+6YAhlB0NCgZ2Bgs+D/JDFTjnIJTSs4w1Md5coPzSJuUuFct9g5udU9D7Tg6+uR3gvvczoY+yVgLt3BNqRtmLTC1sHklwBDgdQ+xBeuh7ntLhxMTmH/AmjQEZDXC5DqBLocrGB1eHjJs5aNYoDZzqkMGvLK9MU5+kNmjVUTHgm24xu8Zypa89C0ZoAsS48JffQ5coATn2+4c1Hlk1RHjvdY3YXEIzX8e6vEgOBWBdjM/5eWlDuWtY05nNYmgp1TrYujR/N7bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737394529; c=relaxed/relaxed;
	bh=7Vg7Rm0vpt4dTLsAm8vmWVb0rRRjBcAALRMkroj5N8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0F6fzbLEACuZAh+PgToFSKF+E0qAiNHr7THArM5a3vZFnJ0jLunWouJVv9ycalCQSItZGqjdLekNocLbp0FzPgO6T3XgSMzH21+/acgSQH9rvCAE0h+vPqGduYTngxlpmimfqQsXUe+sODN5b+YKDTolLiNW5byhupe9aAERWkjlT3Kqr+3wljX+UsSoPy/dzYNbDGohFnIMY2fT0ciRl11t8Txk51K8WJ6WjT1q38UseI3rxsseANJjTkk5tqdyLCPPz1NveGl6yCKaZ9sDEiLfD35wDqkr0W6h30qBAXdR5nF4Hrn5X09Ju1hzTkd+ibj8epHIqf/Ao8I338Nbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h/9o7V11; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h/9o7V11;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcHYD3CL7z30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 04:35:28 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K7XOdU011145;
	Mon, 20 Jan 2025 17:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7Vg7Rm0vpt4dTLsAm
	8vmWVb0rRRjBcAALRMkroj5N8w=; b=h/9o7V11wIq/hX7psg674A/doJfSskXgX
	ka4TdgjB6IdKYjRpQI5wGob0LqcEec+Sx70MYT7ZELQv8Z/qPaYntc+VhbRaoy7r
	7duf1pIsMJgs4EsZYcvzIO8edEf8Rze4kwFSGPTqOB4mNwYuEZVtQ7+niy287aqJ
	siGPK01K5HqeQtr/X6CuKiqzqLG/4sj9TqVOsRf+/qLPcRQaQ8qn3DDbb3MPPshj
	4rbY03mjqdGH7Jg+d9OmY5cFWstzvIMIVnGkS3t+xPqs55CTjFeDXvU70ipA7wUJ
	bvf0j31ZwZ+SPnwsnHcEVJjsEeqFtars0CgJgPhQCBnVM5xuxusdg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449j6nakd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 17:35:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50KGV19l022378;
	Mon, 20 Jan 2025 17:35:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4jy9jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 17:35:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50KHZGwP51773768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 17:35:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9684220040;
	Mon, 20 Jan 2025 17:35:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16EAF20043;
	Mon, 20 Jan 2025 17:35:14 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.123.118])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jan 2025 17:35:13 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/fadump: fix additional param memory reservation for HASH MMU
Date: Mon, 20 Jan 2025 23:05:00 +0530
Message-ID: <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: fxVR2v7ZzVlm0xD4MgqXl6aibfAxZnD8
X-Proofpoint-ORIG-GUID: fxVR2v7ZzVlm0xD4MgqXl6aibfAxZnD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_04,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=678 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200143
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
dump capture kernel") introduced the additional parameter feature in
fadump for HASH MMU with the understanding that GRUB does not use the
memory area between 640MB and 768MB for its operation.

However, the patch ("powerpc: increase MIN RMA size for CAS
negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
memory up to 768MB. This makes the fadump reservation for the additional
parameter feature for HASH MMU unreliable.

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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..5831f3ec8561 100644
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
+		 *    up to RMA size. So it should be avoided.
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
2.47.1


