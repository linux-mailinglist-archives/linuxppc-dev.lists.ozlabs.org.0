Return-Path: <linuxppc-dev+bounces-12614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF1BA8595
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 10:05:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZtzR5F5nz3cYy;
	Mon, 29 Sep 2025 18:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759133139;
	cv=none; b=h8DQc/BNeA3z+ayC8AxJLnDV9qH6H/GOWyiS4Kn2HkKfGehOJx6XgaNZWNNFrlGz1WvcchWt4gvk8Col4pO+0Z1VbUfM2eOi3CmkWj8JwiKJfeiZLYYorw7HU3tQvPjrY/0wHuRqUoKY8dcuK26YUs0ejqglz6DoBiaSs3q2qc1pxcMIjCGj14e9so04H10oDqCgvLvQplFreqXRh22kWJqdMW6botVl8uk6qdxt1sWDQyL4GpnT32r/2TAZrVqaqyGaA8OaGVhzQpZ0do8F74wUKfPTa4iWBl/cwWvfhURDaQuA/lcAhdm4a93+haQ0Ayxy2wq74y9jR2WrFkjzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759133139; c=relaxed/relaxed;
	bh=P28kKO+P0uBoAzYzrY2Q9IkqBqAtdaF0JLiJIQ5n+QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sj0VkS1BVyfCmRbC1Dqv4nrKM/tG4XcGQ5SNfnizjwxmgRkv3a5BMXrnaI4fzrgE21+WGQvVCEvSsEhsHVXRCD2Djxeevj0ZQJR55TK5F5A93PSegD9KQ9tB2I3rx10YDPTm8DdiHNma+NRCMu/wiLHo4hJyYtFC+43q1CRelvw9HXo/Bj7vu+aI9f8nXGf7o47x/VdRU5WrNY5QTTHjZ71HrwK72c1vzGhLQstff9o15Kf+5wiDqglTTgDJqWd8qGgiPMg+BLbapzFWjuVSVOR2rh39m0LmytoY52bnMYdEiDLngNcqNveH6DOG4fqYl7Yq4FpvluxULrYMChMWKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sH99n/jl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sH99n/jl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZtzQ106Zz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 18:05:37 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T5MA4X002106;
	Mon, 29 Sep 2025 08:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=P28kKO+P0uBoAzYzr
	Y2Q9IkqBqAtdaF0JLiJIQ5n+QA=; b=sH99n/jls1GB2NcI9m9WMVeLN0lo1ebCy
	4wFqPt8QOrQY7Gq9hSZG7vkiEe76pAdL1+oI7LbrutREukiAgyC9yf+8SfrqGYiw
	syDgj5dCUy29qsjXVG9iqyPQ2SixTwVDkl/qitirl5uX7UTSILIRugqnB4RMBaSH
	QUFLCefBn1iWUEkHr3gzuUyWPKxmqlmhP2hfHJOFthkLUL+diATNAE3ZqAW0vUda
	ykwayuAFwPwoAdGndAR5FaiIQN+a6UwFsIAKvDFibSC66Q3/nTA4MxfqUtbZdmyX
	sK1I+QIcur8LYBTRxSr/p0Wk+W//Ho5PWLtXPZyRutc2rQsTeHE6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7jw8rc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:14 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58T7wNVl018166;
	Mon, 29 Sep 2025 08:05:13 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7jw8rc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58T84GnZ020064;
	Mon, 29 Sep 2025 08:05:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49et8rw8t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58T858jP59703586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Sep 2025 08:05:09 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9EC620043;
	Mon, 29 Sep 2025 08:05:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A02C20040;
	Mon, 29 Sep 2025 08:05:05 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.ibm.com (unknown [9.39.16.189])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Sep 2025 08:05:04 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        mahesh@linux.ibm.com, sv@linux.ibm.com
Subject: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup alternate feature relative addresses
Date: Mon, 29 Sep 2025 13:34:54 +0530
Message-ID: <20250929080456.26538-2-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929080456.26538-1-sv@linux.ibm.com>
References: <20250929080456.26538-1-sv@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX/9+Cbg0uqnaK
 AitwEWQX3qL+YnuB7M39NOwbdO46hrkskF3ozZ6wNBREG4ttY8zDp93iynA05krCQoYCNvn5/iA
 aHN22h7E7Ol4KDyaec1mpma3BsUmoklawvq5fAVPbqXHLIIL+a8mtfXlOopL8x4TNqmhbG4sTI8
 8YSdSxaIEl3ntkPI5Ut00PpYdSIGosxA6/kTEbbSvRjOcn5mYd5E3uBtAYB7t9G+LO0LLhxD4YE
 reikWL1S8naM7KNY45VrNPmW/28LADJig2ZL7vbQe9uDlchoYOHV9ttOIjPVhiONQA7b9bwpZah
 6j/Pm/+dLQAVdqIJDvROY9oN7oyLIMGZ3moRME6xusuMdYZBu2d4VO4+QGUR5Hoy3a6kTm1fKvy
 8KA0L72jo1XAnOAliXlpi074KgFGhw==
X-Proofpoint-ORIG-GUID: mtLnY0nyD4Vk3iBYXD15Mef3DL2yEj36
X-Proofpoint-GUID: EvLxJhJMH9_cy5MKayXdK16qUmCLjml9
X-Authority-Analysis: v=2.4 cv=GdUaXAXL c=1 sm=1 tr=0 ts=68da3dba cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=QIDJXCojQL2gH2ywyFYA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Implement build-time fixup of alternate feature relative addresses for
the out-of-line (else) patch code. Initial posting to achieve the same
using another tool can be found at [1]. Idea is to implement this using
objtool instead of introducing another tool since it already has elf
parsing and processing covered.

Introduce --ftr-fixup as an option to objtool to do feature fixup at
build-time.

Couple of issues and warnings encountered while implementing feature
fixup using objtool are as follows:

1. libelf is creating corrupted vmlinux file after writing necessary
changes to the file. Due to this, kexec is not able to load new
kernel.

It gives the following error:
        ELF Note corrupted !
        Cannot determine the file type of vmlinux

To fix this issue, after opening vmlinux file, make a call to
elf_flagelf (e, ELF_C_SET, ELF_F_LAYOUT). This instructs libelf not
to touch the segment and section layout. It informs the library
that the application will take responsibility for the layout of the
file and that the library should not insert any padding between
sections.

2. Fix can't find starting instruction warnings when run on vmlinux

Objtool throws a lot of can't find starting instruction warnings
when run on vmlinux with --ftr-fixup option.

These warnings are seen because find_insn() function looks for
instructions at offsets that are relative to the start of the section.
In case of individual object files (.o), there are no can't find
starting instruction warnings seen because the actual offset
associated with an instruction is itself a relative offset since the
sections start at offset 0x0.

However, in case of vmlinux, find_insn() function fails to find
instructions at the actual offset associated with an instruction
since the sections in vmlinux do not start at offset 0x0. Due to
this, find_insn() will look for absolute offset and not the relative
offset. This is resulting in a lot of can't find starting instruction
warnings when objtool is run on vmlinux.

To fix this, pass offset that is relative to the start of the section
to find_insn().

find_insn() is also looking for symbols of size 0. But, objtool does
not store empty STT_NOTYPE symbols in the rbtree. Due to this,
for empty symbols, objtool is throwing can't find starting
instruction warnings. Fix this by ignoring symbols that are of
size 0 since objtool does not add them to the rbtree.

3. Objtool is throwing unannotated intra-function call warnings
when run on vmlinux with --ftr-fixup option.

One such example:

vmlinux: warning: objtool: .text+0x3d94:
                        unannotated intra-function call

.text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4

c0000000000081d4: 45 24 02 48  bl c00000000002a618
<system_reset_exception+0x8>

c00000000002a610 <system_reset_exception>:
c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
                        c00000000002a610: R_PPC64_REL16_HA    .TOC.
c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
                        c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
c00000000002a618:       a6 02 08 7c     mflr    r0

This is happening because we should be looking for destination
symbols that are at absolute offsets instead of relative offsets.
After fixing dest_off to point to absolute offset, there are still
a lot of these warnings shown.

In the above example, objtool is computing the destination
offset to be c00000000002a618, which points to a completely
different instruction. find_call_destination() is looking for this
offset and failing. Instead, we should be looking for destination
offset c00000000002a610 which points to system_reset_exception
function.

Even after fixing the way destination offset is computed, and
after looking for dest_off - 0x8 in cases where the original offset
is not found, there are still a lot of unannotated intra-function
call warnings generated. This is due to symbols that are not
properly annotated.

So, for now, as a hack to curb these warnings, do not emit
unannotated intra-function call warnings when objtool is run
with --ftr-fixup option.

[1]
https://lore.kernel.org/linuxppc-dev/20170521010130.13552-1-npiggin@gmail.com/

Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/arch/powerpc/decode.c     |  15 +-
 tools/objtool/arch/powerpc/special.c    | 436 ++++++++++++++++++++++++
 tools/objtool/builtin-check.c           |   2 +
 tools/objtool/check.c                   |  48 ++-
 tools/objtool/elf.c                     |   4 +
 tools/objtool/include/objtool/builtin.h |   1 +
 tools/objtool/include/objtool/special.h |  56 +++
 7 files changed, 553 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index c851c51d4bd3..a508d50a54d6 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -47,13 +47,26 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	enum insn_type typ;
 	unsigned long imm;
 	u32 ins;
+	unsigned int aa;
 
 	ins = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
 	opcode = ins >> 26;
 	typ = INSN_OTHER;
 	imm = 0;
+	aa = ins & 2;
 
 	switch (opcode) {
+	case 16:
+		if (ins & 1)
+			typ = INSN_OTHER;
+		else
+			typ = INSN_JUMP_CONDITIONAL;
+		imm = ins & 0xfffc;
+		if (imm & 0x8000)
+			imm -= 0x10000;
+		insn->immediate = imm | aa;
+		break;
+
 	case 18: /* b[l][a] */
 		if (ins == 0x48000005)	/* bl .+4 */
 			typ = INSN_OTHER;
@@ -65,7 +78,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
-		imm |= ins & 2;	/* AA flag */
+		insn->immediate = imm | aa;
 		break;
 	}
 
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index 51610689abf7..028ffe39e2a8 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -3,7 +3,17 @@
 #include <stdlib.h>
 #include <objtool/special.h>
 #include <objtool/builtin.h>
+#include <objtool/warn.h>
+#include <asm/byteorder.h>
+#include <errno.h>
 
+struct section *ftr_alt;
+
+struct fixup_entry *fes;
+unsigned int nr_fes;
+
+uint64_t fe_alt_start = -1;
+uint64_t fe_alt_end;
 
 bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
@@ -18,3 +28,429 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 {
 	exit(-1);
 }
+
+int process_alt_data(struct objtool_file *file)
+{
+	struct section *section;
+
+	section = find_section_by_name(file->elf, ".__ftr_alternates.text");
+	ftr_alt = section;
+
+	if (!ftr_alt) {
+		WARN(".__ftr_alternates.text section not found\n");
+		return -1;
+	}
+
+	fe_alt_start = ftr_alt->sh.sh_addr;
+	fe_alt_end = ftr_alt->sh.sh_addr + ftr_alt->sh.sh_size;
+
+	return 0;
+
+}
+
+static int is_le(struct objtool_file *file)
+{
+	return file->elf->ehdr.e_ident[EI_DATA] == ELFDATA2LSB;
+}
+
+static int is_64bit(struct objtool_file *file)
+{
+	return file->elf->ehdr.e_ident[EI_CLASS] == ELFCLASS64;
+}
+
+static uint32_t f32_to_cpu(struct objtool_file *file, uint32_t val)
+{
+	if (is_le(file))
+		return __le32_to_cpu(val);
+	else
+		return __be32_to_cpu(val);
+}
+
+static uint64_t f64_to_cpu(struct objtool_file *file, uint64_t val)
+{
+	if (is_le(file))
+		return __le64_to_cpu(val);
+	else
+		return __be64_to_cpu(val);
+}
+
+static uint32_t cpu_to_f32(struct objtool_file *file, uint32_t val)
+{
+	if (is_le(file))
+		return __cpu_to_le32(val);
+	else
+		return __cpu_to_be32(val);
+}
+
+int process_fixup_entries(struct objtool_file *file)
+{
+	struct section *sec;
+	int i;
+
+	for_each_sec(file, sec) {
+		Elf_Data *data;
+		unsigned int nr;
+
+		if (strstr(sec->name, "_ftr_fixup") == NULL)
+			continue;
+
+		if (strstr(sec->name, ".rela") != NULL)
+			continue;
+
+		data = sec->data;
+		if (!data || data->d_size == 0)
+			continue;
+
+		if (is_64bit(file))
+			nr = data->d_size / sizeof(struct fixup_entry_64);
+		else
+			nr = data->d_size / sizeof(struct fixup_entry_32);
+
+		for (i = 0; i < nr; i++) {
+			unsigned long idx;
+			unsigned long long off;
+			struct fixup_entry *dst;
+
+			if (is_64bit(file)) {
+				struct fixup_entry_64 *src;
+
+				idx = i * sizeof(struct fixup_entry_64);
+				off = sec->sh.sh_addr + data->d_off + idx;
+				src = data->d_buf + idx;
+
+				if (src->alt_start_off == src->alt_end_off)
+					continue;
+
+				fes = realloc(fes, (nr_fes + 1) * sizeof(struct fixup_entry));
+				dst = &fes[nr_fes];
+				nr_fes++;
+
+				dst->mask = f64_to_cpu(file, src->mask);
+				dst->value = f64_to_cpu(file, src->value);
+				dst->start_off = f64_to_cpu(file, src->start_off) + off;
+				dst->end_off = f64_to_cpu(file, src->end_off) + off;
+				dst->alt_start_off = f64_to_cpu(file, src->alt_start_off) + off;
+				dst->alt_end_off = f64_to_cpu(file, src->alt_end_off) + off;
+			} else {
+				struct fixup_entry_32 *src;
+
+				idx = i * sizeof(struct fixup_entry_32);
+				off = sec->sh.sh_addr + data->d_off + idx;
+				src = data->d_buf + idx;
+
+				if (src->alt_start_off == src->alt_end_off)
+					continue;
+
+				fes = realloc(fes, (nr_fes + 1) * sizeof(struct fixup_entry));
+				dst = &fes[nr_fes];
+				nr_fes++;
+
+				dst->mask = f32_to_cpu(file, src->mask);
+				dst->value = f32_to_cpu(file, src->value);
+				dst->start_off = (int32_t)f32_to_cpu(file, src->start_off) + off;
+				dst->end_off = (int32_t)f32_to_cpu(file, src->end_off) + off;
+				dst->alt_start_off = (int32_t)f32_to_cpu(file,
+								src->alt_start_off) + off;
+				dst->alt_end_off = (int32_t)f32_to_cpu(file,
+								src->alt_end_off) + off;
+			}
+		}
+	}
+	return 0;
+}
+
+struct fixup_entry *find_fe_altaddr(uint64_t addr)
+{
+	unsigned int i;
+
+	if (addr < fe_alt_start)
+		return NULL;
+	if (addr >= fe_alt_end)
+		return NULL;
+
+	for (i = 0; i < nr_fes; i++) {
+		if (addr >= fes[i].alt_start_off && addr < fes[i].alt_end_off)
+			return &fes[i];
+	}
+	return NULL;
+}
+
+int set_uncond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target)
+{
+	uint32_t i = *insn;
+	int64_t offset;
+
+	offset = target;
+	if (!(i & BRANCH_ABSOLUTE))
+		offset = offset - addr;
+
+	/* Check we can represent the target in the instruction format */
+	if (offset < -0x2000000 || offset > 0x1fffffc || offset & 0x3)
+		return -EOVERFLOW;
+
+	/* Mask out the flags and target, so they don't step on each other. */
+	*insn = 0x48000000 | (i & 0x3) | (offset & 0x03FFFFFC);
+
+	return 0;
+}
+
+int set_cond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target)
+{
+	uint32_t i = *insn;
+	int64_t offset;
+
+	offset = target;
+
+	if (!(i & BRANCH_ABSOLUTE))
+		offset = offset - addr;
+
+	/* Check we can represent the target in the instruction format */
+	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
+		return -EOVERFLOW;
+
+	/* Mask out the flags and target, so they don't step on each other. */
+	*insn = 0x40000000 | (i & 0x3FF0003) | (offset & 0xFFFC);
+
+	return 0;
+}
+
+void check_and_flatten_fixup_entries(void)
+{
+	static struct fixup_entry *fe;
+	unsigned int i;
+
+	i = nr_fes;
+	while (i) {
+		static struct fixup_entry *parent;
+		uint64_t nested_off; /* offset from start of parent */
+		uint64_t size;
+
+		i--;
+		fe = &fes[i];
+
+		parent = find_fe_altaddr(fe->start_off);
+		if (!parent) {
+			parent = find_fe_altaddr(fe->end_off);
+			continue;
+		}
+
+		size = fe->end_off - fe->start_off;
+		nested_off = fe->start_off - parent->alt_start_off;
+
+		fe->start_off = parent->start_off + nested_off;
+		fe->end_off = fe->start_off + size;
+	}
+}
+
+
+static struct symbol *find_symbol_at_address_within_section(struct section *sec,
+				unsigned long address)
+{
+	struct symbol *sym;
+
+	sec_for_each_sym(sec, sym) {
+		if (sym->sym.st_value <= address && address < sym->sym.st_value + sym->len)
+			return sym;
+	}
+
+	return NULL;
+}
+
+static int is_local_symbol(uint8_t st_other)
+{
+	return (st_other & 0x3) != 0;
+}
+
+static struct symbol *find_symbol_at_address(struct objtool_file *file,
+					unsigned long address)
+{
+	struct section *sec;
+	struct symbol *sym;
+
+	list_for_each_entry(sec, &file->elf->sections, list) {
+		sym = find_symbol_at_address_within_section(sec, address);
+		if (sym)
+			return sym;
+		}
+	return NULL;
+}
+
+int process_alt_relocations(struct objtool_file *file)
+{
+	struct section *section;
+	size_t n = 0;
+	struct reloc *relocation;
+	struct symbol *sym;
+	struct fixup_entry *fe;
+	uint64_t addr;
+	uint64_t scn_delta;
+	uint64_t dst_addr;
+	const char *insn_ptr;
+	unsigned long target;
+	struct symbol *symbol;
+	int is_local;
+	int j;
+	uint32_t new_insn;
+	uint32_t file_insn;
+	struct instruction decoded_insn = {0};
+	uint32_t *insn_ptr_raw;
+	uint32_t insn;
+
+	section = find_section_by_name(file->elf, ".rela.__ftr_alternates.text");
+	if (!section) {
+		printf(".rela.__ftr_alternates.text section not found.\n");
+		return 0;
+	}
+
+	for (j = 0; j < sec_num_entries(section); j++) {
+
+		relocation = &section->relocs[j];
+		sym = relocation->sym;
+		addr = reloc_offset(relocation);
+		target = sym->sym.st_value + reloc_addend(relocation);
+		symbol = find_symbol_at_address(file, target);
+
+		if (symbol) {
+			is_local = is_local_symbol(symbol->sym.st_other);
+			if (!is_local)
+				target = target + 0x8;
+		}
+
+		n++;
+		fe = find_fe_altaddr(addr);
+		if (!fe)
+			continue;
+
+		if (target >= fe->alt_start_off && target < fe->alt_end_off)
+			continue;
+
+		if (target >= ftr_alt->sh.sh_addr &&
+			target < ftr_alt->sh.sh_addr + ftr_alt->sh.sh_size)
+			return -1;
+
+		scn_delta = addr - ftr_alt->sh.sh_addr;
+		dst_addr = addr - fe->alt_start_off + fe->start_off;
+
+		if (arch_decode_instruction(file, ftr_alt, scn_delta, 4, &decoded_insn) < 0)
+			continue;
+
+		insn_ptr_raw = (uint32_t *)(ftr_alt->data->d_buf + scn_delta);
+		if (!insn_ptr_raw || !ftr_alt->data->d_buf)
+			continue;
+
+		insn = f32_to_cpu(file, *insn_ptr_raw);
+		new_insn = insn;
+
+		switch (decoded_insn.type) {
+		case INSN_JUMP_CONDITIONAL:
+			if (set_cond_branch_target(&new_insn, dst_addr, target) != 0)
+				continue;
+			break;
+
+		case INSN_JUMP_UNCONDITIONAL:
+			if (set_uncond_branch_target(&new_insn, dst_addr, target) != 0)
+				continue;
+			break;
+
+		case INSN_CALL:
+			if (set_uncond_branch_target(&new_insn, dst_addr, target) != 0)
+				continue;
+			break;
+		default:
+			continue;
+		}
+
+		if (new_insn == insn)
+			continue;
+
+		file_insn = cpu_to_f32(file, new_insn);
+		insn_ptr = (const char *)&file_insn;
+		elf_write_insn(file->elf, ftr_alt, scn_delta, sizeof(file_insn), insn_ptr);
+	}
+	return 0;
+}
+
+int process_exception_entries(struct objtool_file *file)
+{
+	struct section *section;
+	Elf_Data *data;
+	unsigned int nr, i;
+
+	section = find_section_by_name(file->elf, "__ex_table");
+	if (!section) {
+		printf("__ex_table section not found\n");
+		return 0;
+	}
+
+	data = section->data;
+	if (!data || data->d_size == 0)
+		return 0;
+
+	nr = data->d_size / sizeof(struct exception_entry);
+
+	for (i = 0; i < nr; i++) {
+		struct exception_entry *ex;
+		unsigned long idx;
+		uint64_t exaddr;
+		unsigned long long off;
+
+		idx = i * sizeof(struct exception_entry);
+		off = section->sh.sh_addr + data->d_off + idx;
+		ex = data->d_buf + idx;
+
+		exaddr = off + (int32_t)f32_to_cpu(file, ex->insn);
+
+		if (exaddr < fe_alt_start)
+			continue;
+		if (exaddr >= fe_alt_end)
+			continue;
+
+		return -1;
+	}
+	return 0;
+}
+
+int process_bug_entries(struct objtool_file *file)
+{
+	struct section *section;
+	Elf_Data *data;
+	unsigned int nr, i;
+
+	section = find_section_by_name(file->elf, "__bug_table");
+	if (!section) {
+		printf("__bug_table section not found\n");
+		return 0;
+	}
+
+	data = section->data;
+	if (!data || data->d_size == 0)
+		return 0;
+
+	if (data->d_size % sizeof(struct bug_entry) != 0)
+		return -1;
+
+	nr = data->d_size / sizeof(struct bug_entry);
+	for (i = 0; i < nr; i++) {
+		struct bug_entry *bug;
+		unsigned long idx;
+		uint64_t entry_addr;
+		uint64_t bugaddr;
+		int32_t bug_disp;
+
+		idx = i * sizeof(struct bug_entry);
+		entry_addr = section->sh.sh_addr + data->d_off + idx;
+		bug = (struct bug_entry *)(data->d_buf + idx);
+		bug_disp = f32_to_cpu(file, bug->bug_addr_disp);
+		bugaddr = entry_addr + bug_disp;
+
+		if (bugaddr < fe_alt_start)
+			continue;
+		if (bugaddr >= fe_alt_end)
+			continue;
+
+		return -1;
+	}
+	return 0;
+}
diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 80239843e9f0..d081e07b0e93 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -75,6 +75,7 @@ static const struct option check_options[] = {
 	OPT_GROUP("Actions:"),
 	OPT_CALLBACK_OPTARG('h', "hacks", NULL, NULL, "jump_label,noinstr,skylake", "patch toolchain bugs/limitations", parse_hacks),
 	OPT_BOOLEAN('i', "ibt", &opts.ibt, "validate and annotate IBT"),
+	OPT_BOOLEAN('f', "ftr-fixup", &opts.ftr_fixup, "feature fixup"),
 	OPT_BOOLEAN('m', "mcount", &opts.mcount, "annotate mcount/fentry calls for ftrace"),
 	OPT_BOOLEAN('n', "noinstr", &opts.noinstr, "validate noinstr rules"),
 	OPT_BOOLEAN(0,   "orc", &opts.orc, "generate ORC metadata"),
@@ -160,6 +161,7 @@ static bool opts_valid(void)
 
 	if (opts.hack_jump_label	||
 	    opts.hack_noinstr		||
+	    opts.ftr_fixup		||
 	    opts.ibt			||
 	    opts.mcount			||
 	    opts.noinstr		||
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d14f20ef1db1..38f8f21051ad 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -514,7 +514,11 @@ static int decode_instructions(struct objtool_file *file)
 			if (func->embedded_insn || func->alias != func)
 				continue;
 
-			if (!find_insn(file, sec, func->offset)) {
+			if (func->len == 0)
+				continue;
+
+			if (!find_insn(file, sec, opts.ftr_fixup ?
+						func->offset - sec->sym->offset : func->offset)) {
 				ERROR("%s(): can't find starting instruction", func->name);
 				return -1;
 			}
@@ -1558,9 +1562,11 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
-			ERROR_INSN(insn, "can't find jump dest instruction at %s+0x%lx",
-				   dest_sec->name, dest_off);
-			return -1;
+			if (!opts.ftr_fixup) {
+				ERROR_INSN(insn, "can't find jump dest instruction at %s+0x%lx",
+					   dest_sec->name, dest_off);
+				return -1;
+			}
 		}
 
 		/*
@@ -1664,7 +1670,7 @@ static int add_call_destinations(struct objtool_file *file)
 			if (func && func->ignore)
 				continue;
 
-			if (!insn_call_dest(insn)) {
+			if (!insn_call_dest(insn) && !opts.ftr_fixup) {
 				ERROR_INSN(insn, "unannotated intra-function call");
 				return -1;
 			}
@@ -2568,9 +2574,11 @@ static int decode_sections(struct objtool_file *file)
 			return ret;
 	}
 
-	ret = add_jump_destinations(file);
-	if (ret)
-		return ret;
+	if (!opts.ftr_fixup) {
+		ret = add_jump_destinations(file);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Must be before add_call_destination(); it changes INSN_CALL to
@@ -4698,6 +4706,30 @@ int check(struct objtool_file *file)
 	if (!nr_insns)
 		goto out;
 
+	if (opts.ftr_fixup) {
+		ret = process_alt_data(file);
+		if (ret < 0)
+			return ret;
+
+		ret = process_fixup_entries(file);
+		if (ret < 0)
+			return ret;
+
+		check_and_flatten_fixup_entries();
+
+		ret = process_exception_entries(file);
+		if (ret < 0)
+			return ret;
+
+		ret = process_bug_entries(file);
+		if (ret < 0)
+			return ret;
+
+		ret = process_alt_relocations(file);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (opts.retpoline)
 		warnings += validate_retpoline(file);
 
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index ca5d77db692a..860c0cde1b11 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1052,6 +1052,10 @@ struct elf *elf_open_read(const char *name, int flags)
 		cmd = ELF_C_WRITE;
 
 	elf->elf = elf_begin(elf->fd, cmd, NULL);
+
+	if (opts.ftr_fixup)
+		elf_flagelf(elf->elf, ELF_C_SET, ELF_F_LAYOUT);
+
 	if (!elf->elf) {
 		ERROR_ELF("elf_begin");
 		goto err;
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index 6b08666fa69d..629af3c22f56 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -11,6 +11,7 @@ struct opts {
 	/* actions: */
 	bool dump_orc;
 	bool hack_jump_label;
+	bool ftr_fixup;
 	bool hack_noinstr;
 	bool hack_skylake;
 	bool ibt;
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 72d09c0adf1a..407bb87a26ad 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -12,6 +12,41 @@
 
 #define C_JUMP_TABLE_SECTION ".data.rel.ro.c_jump_table"
 
+#define BRANCH_SET_LINK 0x1
+#define BRANCH_ABSOLUTE 0x2
+
+struct bug_entry {
+	int32_t  bug_addr_disp;
+	int32_t  file_disp;
+	uint16_t line;
+	uint16_t flags;
+};
+
+struct exception_entry {
+	int32_t insn;
+	int32_t fixup;
+};
+
+struct fixup_entry_64 {
+	uint64_t mask;
+	uint64_t value;
+	uint64_t start_off;
+	uint64_t end_off;
+	uint64_t alt_start_off;
+	uint64_t alt_end_off;
+};
+
+#define fixup_entry fixup_entry_64
+
+struct fixup_entry_32 {
+	uint32_t mask;
+	uint32_t value;
+	uint32_t start_off;
+	uint32_t end_off;
+	uint32_t alt_start_off;
+	uint32_t alt_end_off;
+};
+
 struct special_alt {
 	struct list_head list;
 
@@ -28,6 +63,8 @@ struct special_alt {
 	unsigned int orig_len, new_len; /* group only */
 };
 
+int process_alt_data(struct objtool_file *file);
+
 int special_get_alts(struct elf *elf, struct list_head *alts);
 
 void arch_handle_alternative(struct special_alt *alt);
@@ -38,4 +75,23 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn,
 				     unsigned long *table_size);
+
+int process_fixup_entries(struct objtool_file *file);
+
+void check_and_flatten_fixup_entries(void);
+
+int process_exception_entries(struct objtool_file *file);
+
+int process_bug_entries(struct objtool_file *file);
+
+int process_alt_relocations(struct objtool_file *file);
+
+struct fixup_entry *find_fe_altaddr(uint64_t addr);
+
+int set_uncond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target);
+
+int set_cond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target);
+
 #endif /* _SPECIAL_H */
-- 
2.43.0


