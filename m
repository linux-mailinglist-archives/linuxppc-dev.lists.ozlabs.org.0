Return-Path: <linuxppc-dev+bounces-16722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PbXI56fiWlU/wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:49:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBAF10D311
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8dfX6gBDz30Lw;
	Mon, 09 Feb 2026 19:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770626964;
	cv=none; b=RDXHeoDDTK8ycCTaxQTXn+yn5LSaEha2OhQl0MkchOl+SUqkzSEO66TLIcy3jesJYaPf1Lft9TxltzxP4BZ7H2waXnwp8SB+39hWCgf0fcTPrtNXepwZqzmaATl8yAvuyakMLkTyTV7ZoInp1wKGG+qLSgPmV+KIShSDbo2aJ6ZtYczedw6prHh0vrLMn+OcQvKLGovaFrOXRqAhzLlI3YsPt4k1nXFejWn4veB3C+BylpqHUqNTdC8veqWIKX/XjI97AgfcC9Aoc5FKl+YG/0YJyQOra67UnlDy2ILtpFpN2UTSy6gPnKT4c7gn05vB+3uyAcWtswWEKFizzfKhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770626964; c=relaxed/relaxed;
	bh=QMaUEur+Isf/QckwIRFYY2tM7AcZD+C785AUJtOzoNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RT/qhsFAzULPyxbmv9j8TDPip3D3fNju5kXKbFkMqCPDA3DlK4N78yJXyuuz4pTXpI+YDSCaFHOcSSTgXafxYrxz9DXO9hkoOEjRzpL/N0laTxCYj1zD4IBBa+8Op7aXGF1+tiDxTBGR2jrbouAukZvxJC5czV6qXfVvf+R6446ZJyjvMCFZbyMw/r5sqjn64ZupnSSqcZ3D4K8eti6PNDjkEXHR4FfoesY1xam8T+dbhY+Q4cR9Cv6Id9PSWxTaWl7YnV8GdpE2Z14BQw6RoUGV85Thp/DEf9w06+XEjHX+vAg4O1xKoKFkEfmQgvKuow2me3v1fGPZptES+rTQhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e7kGzWOv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e7kGzWOv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8dfV5TY6z2yFm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 19:49:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6190RsWA608141;
	Mon, 9 Feb 2026 08:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QMaUEur+Isf/QckwI
	RFYY2tM7AcZD+C785AUJtOzoNw=; b=e7kGzWOvZ4/ca9Vy2l6s8809ggCfzmTZq
	n8P7dDm/og+j8UzRPk3QA4ABf2/oFJ03BACJl3SX2FGJYqUMFPokZy+n21d6PhMm
	xAWXGUvwYr9i50v0LYMnLtsr8MOW1Swo9XY70e8LEL2Qf7dcCvlOeV/1Lr94jIEV
	UKZaArMeIU46Z4GAxvcnDOoue5q4JN8Cysh/Wsrvo+iSU14aXvn2WeVTc9k1Q8OH
	lXBqzC4K1mBNvSZU8eGevVGjpK0H9pt4YqO1Qpkmw2NP6sqfUBIQL2z2Z+WWgAey
	OKnNicoFWFOCh1J4K16yTz7ruYtQ2V3628cyX9idiFTOmKv8ZvoVQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696uvydr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6198LsKS001420;
	Mon, 9 Feb 2026 08:48:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6gqmvewa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198mndr50397490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:48:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BDEE2004E;
	Mon,  9 Feb 2026 08:48:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB4162004B;
	Mon,  9 Feb 2026 08:48:45 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:45 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 1/6] objtool/powerpc: Add build-time fixup of alternate feature branch targets
Date: Mon,  9 Feb 2026 14:18:15 +0530
Message-ID: <20260209084820.57298-2-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260209084820.57298-1-sv@linux.ibm.com>
References: <20260209084820.57298-1-sv@linux.ibm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: CNM14htUYtoaIZk_O3Vaj2-PdjX2R3mN
X-Proofpoint-ORIG-GUID: DkGN-_zHF46_Sn2aNJ4hpd2QSFd3DsX-
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=69899f76 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=5klgpdlFSnDGvnxfnF4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX/Qoql/1mzS7D
 GE+Mg0QExoWn69fE0wMnl0Qi174OG+VEg8KGM8M8zrsjYw0B55Qi77kdCpRtzl3kiGFPO1U4nwu
 Z5HYCPNXKfB4JW0hhWMdFO6/ao7g9xDyj6+6S43KOrhjwOs1Xf/u+0Mr1S+IMZnOMlQNeLHaS/8
 moDSNldg+KNo81LBZmf5qXoWJfG65FY9UQUoTvXQqcI8XI5G2zXSQNXH9js4ovzW/6eNGY8ZK3z
 MdukfExeznk0Zk/Xx/0S+PUP37JFipzxzdmxb2Vm8V3rhgedXgGYjgGlQFeN3btYLHC5rvUVcOs
 sr9+SZjRffNJP31DL7OJt32Ne/QoEiaMp6KWi+DGu8ptI16nJJFkd03+zorq+eXLZP38bNjRDtU
 dvS2Ll62+noNxzO6xBo75ldJGlvqmlSAULiO1X+2zuG2QKjjMsWqhPKn2I2un4YNPA1XfyfHuuO
 JtBa7QdApIbv+2VwAlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:kees@kernel.org,m:naveen@kernel.org,m:jpoimboe@kernel.org,m:peterz@infradead.org,m:npiggin@gmail.com,m:maddy@linux.ibm.com,m:segher@kernel.crashing.org,m:christophe.leroy@csgroup.eu,m:mingo@kernel.org,m:mpe@ellerman.id.au,m:sv@linux.ibm.com,m:nsc@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16722-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BBAF10D311
X-Rspamd-Action: no action

PowerPC __ftr_alt* sections must currently be placed near .text because
they lack the executable attribute, preventing the linker from inserting
stubs. Branches in the alternate code must reach their targets directly.
This can cause build failures as the kernel grows.

Fix this by processing alternate feature relocations at build time with
objtool. Link with --emit-relocs to preserve relocation information,
mark __ftr_alt* sections executable ("ax") so the linker can insert
stubs, then use objtool --ftr-fixup to recompute branch offsets based
on their runtime locations.

objtool already has ELF parsing and instruction patching infrastructure,
so this avoids introducing a separate tool as was originally proposed [1].

[1] https://lore.kernel.org/linuxppc-dev/20170521010130.13552-1-npiggin@gmail.com/

Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/arch/powerpc/decode.c     |  15 +-
 tools/objtool/arch/powerpc/special.c    | 437 ++++++++++++++++++++++++
 tools/objtool/builtin-check.c           |   2 +
 tools/objtool/check.c                   |  29 +-
 tools/objtool/elf.c                     |   1 +
 tools/objtool/include/objtool/builtin.h |   1 +
 tools/objtool/include/objtool/special.h |  56 +++
 tools/objtool/special.c                 |  29 ++
 8 files changed, 568 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index e534ac1123b3..f6e69d074f28 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -59,13 +59,26 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
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
@@ -77,7 +90,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
-		imm |= ins & 2;	/* AA flag */
+		insn->immediate = imm | aa;
 		break;
 	}
 
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index 8f9bf61ca089..b837b8d7dfeb 100644
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
@@ -23,3 +33,430 @@ const char *arch_cpu_feature_name(int feature_number)
 {
 	return NULL;
 }
+
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
+	for_each_sec(file->elf, sec) {
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
index b780df513715..5ee0880baec5 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -78,6 +78,7 @@ static const struct option check_options[] = {
 	OPT_STRING_OPTARG('d',	 "disas", &opts.disas, "function-pattern", "disassemble functions", "*"),
 	OPT_CALLBACK_OPTARG('h', "hacks", NULL, NULL, "jump_label,noinstr,skylake", "patch toolchain bugs/limitations", parse_hacks),
 	OPT_BOOLEAN('i',	 "ibt", &opts.ibt, "validate and annotate IBT"),
+	OPT_BOOLEAN('f',	 "ftr-fixup", &opts.ftr_fixup, "feature fixup"),
 	OPT_BOOLEAN('m',	 "mcount", &opts.mcount, "annotate mcount/fentry calls for ftrace"),
 	OPT_BOOLEAN(0,		 "noabs", &opts.noabs, "reject absolute references in allocatable sections"),
 	OPT_BOOLEAN('n',	 "noinstr", &opts.noinstr, "validate noinstr rules"),
@@ -181,6 +182,7 @@ static bool opts_valid(void)
 	    opts.disas			||
 	    opts.hack_jump_label	||
 	    opts.hack_noinstr		||
+	    opts.ftr_fixup		||
 	    opts.ibt			||
 	    opts.mcount			||
 	    opts.noabs			||
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3f7999317f4d..667d95431793 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1594,9 +1594,11 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
+
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
-				   offstr(dest_sec, dest_off));
+				offstr(dest_sec, dest_off));
 			return -1;
+
 		}
 
 		if (!dest_sym || is_sec_sym(dest_sym)) {
@@ -4966,6 +4968,31 @@ int check(struct objtool_file *file)
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
+
 	if (opts.retpoline)
 		warnings += validate_retpoline(file);
 
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 6a8ed9c62323..94370a470cbb 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1158,6 +1158,7 @@ struct elf *elf_open_read(const char *name, int flags)
 		cmd = ELF_C_WRITE;
 
 	elf->elf = elf_begin(elf->fd, cmd, NULL);
+
 	if (!elf->elf) {
 		ERROR_ELF("elf_begin");
 		goto err;
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index b9e229ed4dc0..3578ec174a59 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -13,6 +13,7 @@ struct opts {
 	bool checksum;
 	bool dump_orc;
 	bool hack_jump_label;
+	bool ftr_fixup;
 	bool hack_noinstr;
 	bool hack_skylake;
 	bool ibt;
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 121c3761899c..0a5efbfa29d0 100644
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
 	unsigned int orig_len, new_len, feature; /* group only */
 };
 
+int process_alt_data(struct objtool_file *file);
+
 int special_get_alts(struct elf *elf, struct list_head *alts);
 
 void arch_handle_alternative(struct special_alt *alt);
@@ -40,4 +77,23 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     unsigned long *table_size);
 const char *arch_cpu_feature_name(int feature_number);
 
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
+
 #endif /* _SPECIAL_H */
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 2a533afbc69a..43b60bf789dd 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -167,3 +167,32 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
 
 	return 0;
 }
+
+int __weak process_alt_data(struct objtool_file *file)
+{
+	return 0;
+}
+
+int __weak process_fixup_entries(struct objtool_file *file)
+{
+	return 0;
+}
+
+void __weak check_and_flatten_fixup_entries(void)
+{
+}
+
+int __weak process_exception_entries(struct objtool_file *file)
+{
+	return 0;
+}
+
+int __weak process_bug_entries(struct objtool_file *file)
+{
+	return 0;
+}
+
+int __weak process_alt_relocations(struct objtool_file *file)
+{
+	return 0;
+}
-- 
2.43.0


