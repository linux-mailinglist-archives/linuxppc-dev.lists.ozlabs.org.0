Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1165DB00B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:58:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T64j3Gv1zF2D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:58:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4gP736ZzDqxZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:54:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4gP4rZ8z8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:54:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4gP24TRz9sNT; Thu, 12 Sep 2019 00:54:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4gN4KNlz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:54:40 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEiqPA140037
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:54:38 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy0caxpae-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:54:38 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:54:36 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:54:33 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8BEs7Iq27591094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:54:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4380A405E;
 Wed, 11 Sep 2019 14:54:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7779A4040;
 Wed, 11 Sep 2019 14:54:29 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:54:29 +0000 (GMT)
Subject: [PATCH v6 24/36] powerpc/fadump: make use of memblock's bottom up
 allocation mode
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:24:28 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146C11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D844
Message-Id: <156821364211.5656.14336025460336135194.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=832 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Earlier, memblock_find_in_range() was not used to find the memory to
be reserved for FADump as bottom up allocation mode was not supported.
But since commit 79442ed189acb8b ("mm/memblock.c: introduce bottom-up
allocation mode") bottom up allocation mode is supported for memblock.
So, use it to find the memory to be reserved for FADump.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Avoid hacky code and use memblock_find_in_range with bottom up
    allocation mode supported now.


 arch/powerpc/kernel/fadump.c |   26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 852ac47..da75140 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -342,7 +342,8 @@ static void __init fadump_reserve_crash_area(unsigned long base,
 
 int __init fadump_reserve_mem(void)
 {
-	u64 base, size, mem_boundary;
+	bool is_memblock_bottom_up = memblock_bottom_up();
+	u64 base, size, mem_boundary, align = PAGE_SIZE;
 	int ret = 1;
 
 	if (!fw_dump.fadump_enabled)
@@ -362,10 +363,11 @@ int __init fadump_reserve_mem(void)
 		fw_dump.boot_memory_size =
 			PAGE_ALIGN(fadump_calculate_reserve_size());
 #ifdef CONFIG_CMA
-		if (!fw_dump.nocma)
+		if (!fw_dump.nocma) {
+			align = FADUMP_CMA_ALIGNMENT;
 			fw_dump.boot_memory_size =
-				ALIGN(fw_dump.boot_memory_size,
-							FADUMP_CMA_ALIGNMENT);
+				ALIGN(fw_dump.boot_memory_size, align);
+		}
 #endif
 	}
 
@@ -419,19 +421,15 @@ int __init fadump_reserve_mem(void)
 	} else {
 		/*
 		 * Reserve memory at an offset closer to bottom of the RAM to
-		 * minimize the impact of memory hot-remove operation. We can't
-		 * use memblock_find_in_range() here since it doesn't allocate
-		 * from bottom to top.
+		 * minimize the impact of memory hot-remove operation.
 		 */
-		while (base <= (mem_boundary - size)) {
-			if (memblock_is_region_memory(base, size) &&
-			    !memblock_is_region_reserved(base, size))
-				break;
+		memblock_set_bottom_up(true);
+		base = memblock_find_in_range(base, mem_boundary, size, align);
 
-			base += size;
-		}
+		/* Restore the previous allocation mode */
+		memblock_set_bottom_up(is_memblock_bottom_up);
 
-		if (base > (mem_boundary - size)) {
+		if (!base) {
 			pr_err("Failed to find memory chunk for reservation!\n");
 			goto error_out;
 		}

