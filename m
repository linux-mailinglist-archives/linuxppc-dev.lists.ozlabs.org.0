Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC958AEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 21:23:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZVD112CszDqX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:22:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZVBD2DvwzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:21:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45ZVBC48ggz8t3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:21:23 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45ZVBC3hNLz9s3l; Fri, 28 Jun 2019 05:21:23 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45ZVBC05TNz9s7h
 for <linuxppc-dev@ozlabs.org>; Fri, 28 Jun 2019 05:21:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RJGXOk044107
 for <linuxppc-dev@ozlabs.org>; Thu, 27 Jun 2019 15:21:20 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td3p38hsr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 27 Jun 2019 15:21:20 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Thu, 27 Jun 2019 20:21:18 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 20:21:15 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5RJL4o740304972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 19:21:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EAD011C050;
 Thu, 27 Jun 2019 19:21:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8447F11C058;
 Thu, 27 Jun 2019 19:21:11 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.28])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jun 2019 19:21:11 +0000 (GMT)
Subject: [PATCH 1/2] powerpc: reserve memory for capture kernel after
 hugepages init
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Fri, 28 Jun 2019 00:51:09 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062719-0016-0000-0000-0000028D1D89
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062719-0017-0000-0000-000032EA9D84
Message-Id: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Sometimes, memory reservation for KDump/FADump can overlap with memory
marked for hugepages. This overlap leads to error, hang in KDump case
and copy error reported by f/w in case of FADump, while trying to
capture dump. Report error while setting up memory for the capture
kernel instead of running into issues while capturing dump, by moving
KDump/FADump reservation below MMU early init and failing gracefully
when hugepages memory overlaps with capture kernel memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/prom.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 7159e79..454e19cf 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -731,14 +731,6 @@ void __init early_init_devtree(void *params)
 	if (PHYSICAL_START > MEMORY_START)
 		memblock_reserve(MEMORY_START, 0x8000);
 	reserve_kdump_trampoline();
-#ifdef CONFIG_FA_DUMP
-	/*
-	 * If we fail to reserve memory for firmware-assisted dump then
-	 * fallback to kexec based kdump.
-	 */
-	if (fadump_reserve_mem() == 0)
-#endif
-		reserve_crashkernel();
 	early_reserve_mem();
 
 	/* Ensure that total memory size is page-aligned. */
@@ -777,6 +769,14 @@ void __init early_init_devtree(void *params)
 #endif
 
 	mmu_early_init_devtree();
+#ifdef CONFIG_FA_DUMP
+	/*
+	 * If we fail to reserve memory for firmware-assisted dump then
+	 * fallback to kexec based kdump.
+	 */
+	if (fadump_reserve_mem() == 0)
+#endif
+		reserve_crashkernel();
 
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */

