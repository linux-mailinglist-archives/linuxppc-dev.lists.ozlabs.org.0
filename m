Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8166531561
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 19:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6Q8F50HGz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 03:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EK1j1RLu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EK1j1RLu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Q4Z17Gzz3bqg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 03:56:29 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NFUmeI027671;
 Mon, 23 May 2022 17:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i5RmRP/UH1mWrSQFsa6HrM9CKsDExZYIFAOg2rjZ7yo=;
 b=EK1j1RLuml3Fm86jB+cnCLFNo7Xz3XTRo0Y5jso730/cSdVkP0sEvbpAFV943vGow36F
 nxXc9JX5I2T4TzEqPzcn/shT7lyGFBzhVM+POWoBfc+BBmhzfv12hBYMetwsOUa9uteG
 S1vh//+sqgUXR0V25PwS2Aq31kU2jOLIm6mCfAIvaWQJCDHefTX+ITTxXL5MxIWA4SjV
 Wu+1hsvLRYLxT8pv45CrDamUnrO4+TKQqWLzh5MKrGceIubVoRDyVP9um9DZEPYSZTnE
 BIq9gIBwsWSxNYiSRhF64lUEuH3FE8XAEeCB/tclQScsQJYbNjdXtK+2BLoAeKmtiWNW cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g88yvs48s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 17:56:19 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24NHXA12018113;
 Mon, 23 May 2022 17:56:18 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g88yvs480-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 17:56:18 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NHgoWG011584;
 Mon, 23 May 2022 17:56:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3g6qq93jqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 17:56:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24NHtRwC31916520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 17:55:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 631B952050;
 Mon, 23 May 2022 17:56:14 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown
 [9.43.16.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2D30B5204F;
 Mon, 23 May 2022 17:56:10 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific implementation
Date: Mon, 23 May 2022 23:25:48 +0530
Message-Id: <20220523175548.922671-5-sv@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220523175548.922671-1-sv@linux.ibm.com>
References: <20220523175548.922671-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: buX_qKCr5AM5AFX50afFueyUjRwiaumN
X-Proofpoint-GUID: 9x78_XVgk9THSzak1_eAXXWTob5GjxeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_07,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=731 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205230099
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, aik@ozlabs.ru,
 sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch enables objtool --mcount on powerpc, and
adds implementation specific to powerpc.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/Kconfig                |  1 +
 tools/objtool/arch/powerpc/decode.c | 14 ++++++++++++++
 tools/objtool/check.c               | 12 +++++++-----
 tools/objtool/elf.c                 | 13 +++++++++++++
 tools/objtool/include/objtool/elf.h |  1 +
 5 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 732a3f91ee5e..3373d44a1298 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -233,6 +233,7 @@ config PPC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
 	select HAVE_OBJTOOL			if PPC64
+	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index e3b77a6ce357..ad3d79fffac2 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -40,12 +40,26 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			    struct list_head *ops_list)
 {
 	u32 insn;
+	unsigned int opcode;
 
 	*immediate = 0;
 	memcpy(&insn, sec->data->d_buf+offset, 4);
 	*len = 4;
 	*type = INSN_OTHER;
 
+	opcode = (insn >> 26);
+
+	switch (opcode) {
+	case 18: /* bl */
+		if ((insn & 3) == 1) {
+			*type = INSN_CALL;
+			*immediate = insn & 0x3fffffc;
+			if (*immediate & 0x2000000)
+				*immediate -= 0x4000000;
+		}
+		break;
+	}
+
 	return 0;
 }
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 056302d58e23..fd8bad092f89 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -832,7 +832,7 @@ static int create_mcount_loc_sections(struct objtool_file *file)
 
 		if (elf_add_reloc_to_insn(file->elf, sec,
 					  idx * sizeof(unsigned long),
-					  R_X86_64_64,
+					  elf_reloc_type_long(file->elf),
 					  insn->sec, insn->offset))
 			return -1;
 
@@ -2183,7 +2183,7 @@ static int classify_symbols(struct objtool_file *file)
 			if (arch_is_retpoline(func))
 				func->retpoline_thunk = true;
 
-			if (!strcmp(func->name, "__fentry__"))
+			if ((!strcmp(func->name, "__fentry__")) || (!strcmp(func->name, "_mcount")))
 				func->fentry = true;
 
 			if (is_profiling_func(func->name))
@@ -2259,9 +2259,11 @@ static int decode_sections(struct objtool_file *file)
 	 * Must be before add_jump_destinations(), which depends on 'func'
 	 * being set for alternatives, to enable proper sibling call detection.
 	 */
-	ret = add_special_section_alts(file);
-	if (ret)
-		return ret;
+	if (opts.stackval || opts.orc || opts.uaccess || opts.noinstr) {
+		ret = add_special_section_alts(file);
+		if (ret)
+			return ret;
+	}
 
 	ret = add_jump_destinations(file);
 	if (ret)
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index c25e957c1e52..95763060d551 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -793,6 +793,19 @@ elf_create_section_symbol(struct elf *elf, struct section *sec)
 	return sym;
 }
 
+int elf_reloc_type_long(struct elf *elf)
+{
+	switch (elf->ehdr.e_machine) {
+	case EM_X86_64:
+		return R_X86_64_64;
+	case EM_PPC64:
+		return R_PPC64_ADDR64;
+	default:
+		WARN("unknown machine...");
+		exit(-1);
+	}
+}
+
 int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
 			  unsigned long offset, unsigned int type,
 			  struct section *insn_sec, unsigned long insn_off)
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index adebfbc2b518..c43e23c0b3c8 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -144,6 +144,7 @@ static inline bool has_multiple_files(struct elf *elf)
 struct elf *elf_open_read(const char *name, int flags);
 struct section *elf_create_section(struct elf *elf, const char *name, unsigned int sh_flags, size_t entsize, int nr);
 
+int elf_reloc_type_long(struct elf *elf);
 int elf_add_reloc(struct elf *elf, struct section *sec, unsigned long offset,
 		  unsigned int type, struct symbol *sym, s64 addend);
 int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
-- 
2.25.1

