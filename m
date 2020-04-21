Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D91B2E7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:42:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4969rM49VMzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 03:42:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4969hs1FlbzDqgP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 03:36:13 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LHXeTV140402
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:36:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmuyvkw8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:36:10 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 21 Apr 2020 18:36:03 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Apr 2020 18:35:59 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03LHa4os66519080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 17:36:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 276AE11C04A;
 Tue, 21 Apr 2020 17:36:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9E6F11C050;
 Tue, 21 Apr 2020 17:36:02 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.72.246])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Apr 2020 17:36:02 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/module_64: Simplify check for -mprofile-kernel
 ftrace relocations
Date: Tue, 21 Apr 2020 23:05:44 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042117-0028-0000-0000-000003FC7135
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042117-0029-0000-0000-000024C23599
Message-Id: <7d9c316adfa1fb787ad268bb4691e7e4059ff2d5.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_07:2020-04-20,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=1 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210133
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
Cc: Qian Cai <cai@lca.pw>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For -mprofile-kernel, we need special handling when generating stubs for
ftrace calls such as _mcount(). To faciliate this, we check if a
R_PPC64_REL24 relocation is for a symbol named "_mcount()" along with
also checking the instruction sequence. The latter is not really
required since "_mcount()" is an exported symbol and kernel modules
cannot use it. As such, drop the additional checking and simplify the
code. This helps unify stub creation for ftrace stubs with
-mprofile-kernel and aids in code reuse.

Also rename is_mprofile_mcount_callsite() to is_mprofile_ftrace_call()
to reflect the checking being done.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 54d9d830f4a4..7f4cc5346387 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -414,19 +414,9 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 }
 
 #ifdef CONFIG_MPROFILE_KERNEL
-static bool is_mprofile_mcount_callsite(const char *name, u32 *instruction)
+static bool is_mprofile_ftrace_call(const char *name)
 {
-	if (strcmp("_mcount", name))
-		return false;
-
-	/*
-	 * Check if this is one of the -mprofile-kernel sequences.
-	 */
-	if (instruction[-1] == PPC_INST_STD_LR &&
-	    instruction[-2] == PPC_INST_MFLR)
-		return true;
-
-	if (instruction[-1] == PPC_INST_MFLR)
+	if (!strcmp("_mcount", name))
 		return true;
 
 	return false;
@@ -450,7 +440,7 @@ static void squash_toc_save_inst(const char *name, unsigned long addr)
 #else
 static void squash_toc_save_inst(const char *name, unsigned long addr) { }
 
-static bool is_mprofile_mcount_callsite(const char *name, u32 *instruction)
+static bool is_mprofile_ftrace_call(const char *name)
 {
 	return false;
 }
@@ -462,7 +452,7 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 {
 	u32 *prev_insn = instruction - 1;
 
-	if (is_mprofile_mcount_callsite(name, prev_insn))
+	if (is_mprofile_ftrace_call(name))
 		return 1;
 
 	/*
-- 
2.25.1

