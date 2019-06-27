Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889C58AEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 21:24:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZVGJ0kzgzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZVBQ4YmhzDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45ZVBQ0C1xz8vhn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:21:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45ZVBP6v00z9s7h; Fri, 28 Jun 2019 05:21:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45ZVBP2tqtz9s3l
 for <linuxppc-dev@ozlabs.org>; Fri, 28 Jun 2019 05:21:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RJGXlZ044032
 for <linuxppc-dev@ozlabs.org>; Thu, 27 Jun 2019 15:21:31 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td3p38hy6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 27 Jun 2019 15:21:31 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Thu, 27 Jun 2019 20:21:29 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 20:21:26 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5RJLEm132702764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 19:21:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259D8A4054;
 Thu, 27 Jun 2019 19:21:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D422A405B;
 Thu, 27 Jun 2019 19:21:22 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.28])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jun 2019 19:21:21 +0000 (GMT)
Subject: [PATCH 2/2] powerpc: avoid adjusting memory_limit for capture
 kernel memory reservation
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Fri, 28 Jun 2019 00:51:19 +0530
In-Reply-To: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
References: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062719-0020-0000-0000-0000034E23C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062719-0021-0000-0000-000021A1A0BC
Message-Id: <156166327993.13320.10788410344711883330.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=988 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270220
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, if memory_limit is specified and it overlaps with memory to
be reserved for capture kernel, memory_limit is adjusted to accommodate
capture kernel. With memory reservation for capture kernel moved later
(after enforcing memory limit), this adjustment no longer holds water.
So, avoid adjusting memory_limit and error out instead.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c        |   16 ----------------
 arch/powerpc/kernel/machine_kexec.c |   22 +++++++++++-----------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4eab972..a784695 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -476,22 +476,6 @@ int __init fadump_reserve_mem(void)
 #endif
 	}
 
-	/*
-	 * Calculate the memory boundary.
-	 * If memory_limit is less than actual memory boundary then reserve
-	 * the memory for fadump beyond the memory_limit and adjust the
-	 * memory_limit accordingly, so that the running kernel can run with
-	 * specified memory_limit.
-	 */
-	if (memory_limit && memory_limit < memblock_end_of_DRAM()) {
-		size = get_fadump_area_size();
-		if ((memory_limit + size) < memblock_end_of_DRAM())
-			memory_limit += size;
-		else
-			memory_limit = memblock_end_of_DRAM();
-		printk(KERN_INFO "Adjusted memory_limit for firmware-assisted"
-				" dump, now %#016llx\n", memory_limit);
-	}
 	if (memory_limit)
 		memory_boundary = memory_limit;
 	else
diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
index c4ed328..fc5533b 100644
--- a/arch/powerpc/kernel/machine_kexec.c
+++ b/arch/powerpc/kernel/machine_kexec.c
@@ -125,10 +125,8 @@ void __init reserve_crashkernel(void)
 		crashk_res.end = crash_base + crash_size - 1;
 	}
 
-	if (crashk_res.end == crashk_res.start) {
-		crashk_res.start = crashk_res.end = 0;
-		return;
-	}
+	if (crashk_res.end == crashk_res.start)
+		goto error_out;
 
 	/* We might have got these values via the command line or the
 	 * device tree, either way sanitise them now. */
@@ -170,15 +168,13 @@ void __init reserve_crashkernel(void)
 	if (overlaps_crashkernel(__pa(_stext), _end - _stext)) {
 		printk(KERN_WARNING
 			"Crash kernel can not overlap current kernel\n");
-		crashk_res.start = crashk_res.end = 0;
-		return;
+		goto error_out;
 	}
 
 	/* Crash kernel trumps memory limit */
 	if (memory_limit && memory_limit <= crashk_res.end) {
-		memory_limit = crashk_res.end + 1;
-		printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
-		       memory_limit);
+		pr_err("Crash kernel size can't exceed memory_limit\n");
+		goto error_out;
 	}
 
 	printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
@@ -190,9 +186,13 @@ void __init reserve_crashkernel(void)
 	if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
 	    memblock_reserve(crashk_res.start, crash_size)) {
 		pr_err("Failed to reserve memory for crashkernel!\n");
-		crashk_res.start = crashk_res.end = 0;
-		return;
+		goto error_out;
 	}
+
+	return;
+error_out:
+	crashk_res.start = crashk_res.end = 0;
+	return;
 }
 
 int overlaps_crashkernel(unsigned long start, unsigned long size)

