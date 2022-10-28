Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCE96114F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 16:45:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzQMM40jNz3fGJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 01:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ow9s89/9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ow9s89/9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzQ7g0FRWz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 01:35:26 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SECAHI037660;
	Fri, 28 Oct 2022 14:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tH/3WVMpKHjWraIsrGnLdVHaYnfDvxhJwmwvSoSfkxc=;
 b=ow9s89/9QIp7OkgBVJ7B46ogRxas3wL4RJ6Q26rHC6x+JuzH2Ta+jVTjpCTf9yZbZFMP
 YAJb9PS0XN7S1GO67KR1ncPObFL74rl/g+pjMDFrUPpkXWbIkhEvmiF1zFZQNtio5X7j
 qbBgSmH1AgFUz+hyxOsjgnrF3fkKAom/3rC6EdW8TxqCDRzV0Akxl55IFcp2VwMZEIce
 EGhm2PHZplCzQWcCetu1ddW/n5wOO/9oSPMIwBuOCpV6E1o5M1vWCkaGhOCINS+Aefik
 vkvXwbv49gRtTxHlTfnElzMCluZzKZ4m5en8Jehbihrr3GDAkgWEP0lCIG//+sqhFy71 HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kggmqgv59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 14:35:10 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SEDUh8003192;
	Fri, 28 Oct 2022 14:35:09 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kggmqgv35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 14:35:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SEJpRP031635;
	Fri, 28 Oct 2022 14:35:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3kfbg2anck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 14:35:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SEZ4j55702286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 14:35:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC53CA4053;
	Fri, 28 Oct 2022 14:35:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14821A4040;
	Fri, 28 Oct 2022 14:35:01 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.124.163])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 14:35:00 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 11/16] objtool: Add --mnop as an option to --mcount
Date: Fri, 28 Oct 2022 20:03:41 +0530
Message-Id: <20221028143346.183569-12-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221028143346.183569-1-sv@linux.ibm.com>
References: <20221028143346.183569-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iMnTQX1bTIgft0Huroh3GXGQOsE6Wb7-
X-Proofpoint-GUID: anbve1ZHBYAQ4wi3kib1d_w-0d8mrH57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280090
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures (powerpc) may not support ftrace locations being nop'ed
out at build time. Introduce CONFIG_HAVE_OBJTOOL_NOP_MCOUNT for objtool, as
a means for architectures to enable nop'ing of ftrace locations. Add --mnop
as an option to objtool --mcount, to indicate support for the same.

Also, make sure that --mnop can be passed as an option to objtool only when
--mcount is passed.

Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 Makefile                                |  4 +++-
 arch/x86/Kconfig                        |  1 +
 kernel/trace/Kconfig                    |  7 +++++++
 scripts/Makefile.lib                    |  3 +++
 tools/objtool/builtin-check.c           | 14 ++++++++++++++
 tools/objtool/check.c                   | 19 ++++++++++---------
 tools/objtool/include/objtool/builtin.h |  1 +
 7 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index d148a55bfd0f..53c2b715d0bf 100644
--- a/Makefile
+++ b/Makefile
@@ -933,7 +933,9 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_CC
   endif
 endif
 ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
-  CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
+  ifdef CONFIG_HAVE_OBJTOOL_NOP_MCOUNT
+    CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
+  endif
 endif
 ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
   ifdef CONFIG_HAVE_C_RECORDMCOUNT
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 67745ceab0db..4be7c06a5d18 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -195,6 +195,7 @@ config X86
 	select HAVE_CONTEXT_TRACKING_USER_OFFSTACK	if HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
+	select HAVE_OBJTOOL_NOP_MCOUNT		if HAVE_OBJTOOL_MCOUNT
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index e9e95c790b8e..2b782321376a 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -82,6 +82,13 @@ config HAVE_OBJTOOL_MCOUNT
 	help
 	  Arch supports objtool --mcount
 
+config HAVE_OBJTOOL_NOP_MCOUNT
+	bool
+	help
+	  Arch supports the objtool options --mcount with --mnop.
+	  An architecture can select this if it wants to enable nop'ing
+	  of ftrace locations.
+
 config HAVE_C_RECORDMCOUNT
 	bool
 	help
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3aa384cec76b..658f541c2782 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -256,6 +256,9 @@ objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
 objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
 objtool-args-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
 objtool-args-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
+ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+objtool-args-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
+endif
 objtool-args-$(CONFIG_UNWINDER_ORC)			+= --orc
 objtool-args-$(CONFIG_RETPOLINE)			+= --retpoline
 objtool-args-$(CONFIG_RETHUNK)				+= --rethunk
diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 24fbe803a0d3..9bd347d3c244 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -82,6 +82,7 @@ const struct option check_options[] = {
 	OPT_BOOLEAN(0, "dry-run", &opts.dryrun, "don't write modifications"),
 	OPT_BOOLEAN(0, "link", &opts.link, "object is a linked object"),
 	OPT_BOOLEAN(0, "module", &opts.module, "object is part of a kernel module"),
+	OPT_BOOLEAN(0, "mnop", &opts.mnop, "nop out mcount call sites"),
 	OPT_BOOLEAN(0, "no-unreachable", &opts.no_unreachable, "skip 'unreachable instruction' warnings"),
 	OPT_BOOLEAN(0, "sec-address", &opts.sec_address, "print section addresses in warnings"),
 	OPT_BOOLEAN(0, "stats", &opts.stats, "print statistics"),
@@ -150,6 +151,16 @@ static bool opts_valid(void)
 	return false;
 }
 
+static bool mnop_opts_valid(void)
+{
+	if (opts.mnop && !opts.mcount) {
+		ERROR("--mnop requires --mcount");
+		return false;
+	}
+
+	return true;
+}
+
 static bool link_opts_valid(struct objtool_file *file)
 {
 	if (opts.link)
@@ -198,6 +209,9 @@ int objtool_run(int argc, const char **argv)
 	if (!file)
 		return 1;
 
+	if (!mnop_opts_valid())
+		return 1;
+
 	if (!link_opts_valid(file))
 		return 1;
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index b64518c7c7b4..71cf4b4ba1da 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1256,17 +1256,18 @@ static void annotate_call_site(struct objtool_file *file,
 	if (opts.mcount && sym->fentry) {
 		if (sibling)
 			WARN_FUNC("Tail call to __fentry__ !?!?", insn->sec, insn->offset);
+		if (opts.mnop) {
+			if (reloc) {
+				reloc->type = R_NONE;
+				elf_write_reloc(file->elf, reloc);
+			}
 
-		if (reloc) {
-			reloc->type = R_NONE;
-			elf_write_reloc(file->elf, reloc);
-		}
-
-		elf_write_insn(file->elf, insn->sec,
-			       insn->offset, insn->len,
-			       arch_nop_insn(insn->len));
+			elf_write_insn(file->elf, insn->sec,
+				       insn->offset, insn->len,
+				       arch_nop_insn(insn->len));
 
-		insn->type = INSN_NOP;
+			insn->type = INSN_NOP;
+		}
 
 		list_add_tail(&insn->call_node, &file->mcount_loc_list);
 		return;
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index 42a52f1a0add..0785707c5a92 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -31,6 +31,7 @@ struct opts {
 	bool backup;
 	bool dryrun;
 	bool link;
+	bool mnop;
 	bool module;
 	bool no_unreachable;
 	bool sec_address;
-- 
2.31.1

