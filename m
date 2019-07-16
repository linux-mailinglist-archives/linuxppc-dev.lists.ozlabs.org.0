Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 860616B028
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:57:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pB522ktRzDqgW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 05:57:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=desnesn@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p9vK425SzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 05:48:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GJkkln073587; Tue, 16 Jul 2019 15:48:47 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsmyeg7xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 15:48:47 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6GJjLmD031930;
 Tue, 16 Jul 2019 19:48:45 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 2tq6x61q7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 19:48:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GJmjpG12387074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 19:48:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 086AB112067;
 Tue, 16 Jul 2019 19:48:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F36CA112074;
 Tue, 16 Jul 2019 19:48:42 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.85.198.208])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 19:48:42 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: mark __boot_from_prom and start_here_common as
 __ref
Date: Tue, 16 Jul 2019 16:48:29 -0300
Message-Id: <20190716194829.15483-1-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=810 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160242
X-Mailman-Approved-At: Wed, 17 Jul 2019 05:56:01 +1000
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
Cc: desnesn@linux.ibm.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functions `__boot_from_prom` and `start_here_common` are "init code" in
the sense that they are only executed at boot time, nevertheless they
should not be tagged as __init since this will carry them to a different
section located at the very end of kernel text. If the TOC is not set up,
the kernel may not be able to tolerate a branch trampoline to reach the
init function.

Thus, these functions should be marked as `__ref` and the assembler must
be reminded to insert the code that follows into the last active section
by the use of the `.previous` directive. This will allow the powerpc
kernel to be built with CONFIG_SECTION_MISMATCH_WARN_ONLY disabled and
quieten the following modpost warnings during compilation:

    WARNING: vmlinux.o(.text+0x2ad4): Section mismatch in reference from the variable __boot_from_prom to the function .init.text:prom_init()
    The function __boot_from_prom() references
    the function __init prom_init().
    This is often because __boot_from_prom lacks a __init
    annotation or the annotation of prom_init is wrong.

    WARNING: vmlinux.o(.text+0x2cd0): Section mismatch in reference from the variable start_here_common to the function .init.text:start_kernel()
    The function start_here_common() references
    the function __init start_kernel().
    This is often because start_here_common lacks a __init
    annotation or the annotation of start_kernel is wrong.

Credits: code is based on commit <9c4e4c90ec24> ("powerpc/64: mark
start_here_multiplatform as __ref") and message is based on 2016 patch by
Nicholas Piggin: https://lore.kernel.org/linuxppc-dev/20161222131419.18062-1-npiggin@gmail.com/

Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
---
 arch/powerpc/kernel/head_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 259be7f6d551..04b34397b656 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -540,6 +540,7 @@ __start_initialization_multiplatform:
 	b	__after_prom_start
 #endif /* CONFIG_PPC_BOOK3E */
 
+__REF
 __boot_from_prom:
 #ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
 	/* Save parameters */
@@ -577,6 +578,7 @@ __boot_from_prom:
 	/* We never return. We also hit that trap if trying to boot
 	 * from OF while CONFIG_PPC_OF_BOOT_TRAMPOLINE isn't selected */
 	trap
+	.previous
 
 __after_prom_start:
 #ifdef CONFIG_RELOCATABLE
@@ -983,6 +985,7 @@ start_here_multiplatform:
 	.previous
 	/* This is where all platforms converge execution */
 
+__REF
 start_here_common:
 	/* relocation is on at this point */
 	std	r1,PACAKSAVE(r13)
@@ -1003,6 +1006,7 @@ start_here_common:
 
 	/* Not reached */
 	BUG_OPCODE
+	.previous
 
 /*
  * We put a few things here that have to be page-aligned.
-- 
2.18.1

