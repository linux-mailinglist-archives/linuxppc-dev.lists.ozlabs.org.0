Return-Path: <linuxppc-dev+bounces-16727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I4zKsafiWlU/wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:50:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A09B10D35B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8dfs4FZxz3cCM;
	Mon, 09 Feb 2026 19:49:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770626981;
	cv=none; b=odZUhUV8L9+o/RVfjOhdzzDg9r0KNpjrBnMG4yuOKiXAT/oKjlEFLXmFn7go2AAHAz8R6HmVxH3amE+BBt8rH1raEdites2/Yk53jdmbZipXhb57BIybisBSgO6vIwM2z4F2QPUyWouZlCskIDcpx8HQDnFY7t0TqQFfzcwhySC1SzAALK4Awpat7FSFbjum1n8nvmHyebxiGhHb5DckhlhljLtB40acMZn6wc7YH1HqgNokhOp5e4D/HXT3AgsyhAL6m2mjeqNmWeg8OGR8RhGFpdnbFdjhK03sRNP8BwI5guLr7kp6ry84vHUbX6GdKzjpftLLn/b2iqrGUb/Dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770626981; c=relaxed/relaxed;
	bh=swzmicMpwiMbx8mDSbwNndtctxSKq8Ub8sOhW5HI1og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czmrDFN69Yo7rNNv0ikXu45hTFOqdX3lKGxnrZDZ1b6E33t5E6t+E37N9j5aC7MouXmtdsdNNeKVcniGQxWg2yRUinstE/nrOfzV5yBiFrbbnu3x/f1ldq178aZUN/CWpgxdkGEv38YET3al4fMOrhxbsEC3hKpN4HB5M3qV+Q7TIvUCJ5anobs2P7zF50bh3JnRHsWi5bLuE1wdqD6Yi4n7soxo8DifZo3UyTEJ4gw+woK0lND4YxokxZbM9B3khUObKSL0CgbGkcFEW4LermPcdc3sYcJu1s9kXgYQ2gJ3iJTFMxcROHOnjvs5PcxcOCKITbxk8v2ZinZsX3urzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fF1AoKqL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fF1AoKqL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8dfq1qTNz3c9M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 19:49:39 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618MsFKb369791;
	Mon, 9 Feb 2026 08:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=swzmicMpwiMbx8mDS
	bwNndtctxSKq8Ub8sOhW5HI1og=; b=fF1AoKqLfdckc6vWgvjkz+PHgASRx8aRT
	kq7waiXEZ3Fm+TipOyUA9tnie5ar1mRydD+O2H6D7ugu7a+lDTfrRs0jq6PD1MA6
	FltUBiKh0gWkGZhctJolKtuxhFBdt9w88ZrYxO0hAKURpw0XNV1yGwv6ylMHazuw
	K+8NWNkxEpNyuKZLZI4DhTOMXzuTEhChNIDh7Y0Zc0HfCZ6htnR0uoHyMCdgMx2v
	BPuQZ/yFE4r3T8fToa50w2tQU2sSlvLmbI4X4DNej6RmkHUdIWEhrOE4DnaLG/uU
	WSpses+2nSPa4jveyXFFiO71aP6tkV4hoJFCpA1XluCUmiLcQ4q6w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696wn121-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6193F7Ef012996;
	Mon, 9 Feb 2026 08:49:19 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6h7k4bc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:19 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198nE9129557040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:49:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 159FA2005A;
	Mon,  9 Feb 2026 08:49:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DEB320043;
	Mon,  9 Feb 2026 08:49:10 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:49:09 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 6/6] powerpc: Enable build-time feature fixup processing by default
Date: Mon,  9 Feb 2026 14:18:20 +0530
Message-ID: <20260209084820.57298-7-sv@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=WZYBqkhX c=1 sm=1 tr=0 ts=69899f90 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=CCpqsmhAAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=VskAbI2hzQZqgVltqkQA:9 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: OKeoAZ_qGQIChqA9D9J6OY22ZY98-8Pe
X-Proofpoint-ORIG-GUID: _e2wpXSxv9mlaPRqxf5o3pOZrAJ7h1if
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX4sKG2cWTbN0G
 aAfUTY1xWxqWq89QeCu8Jv3K7bEYb0FFWTMsLcY6U6xxy37EsVI5LUC3mAk+407DqyOy+8Nv07K
 uYccfshHtpMRJe/aJ4VdXi64BG+waABEFT65T2m6Xq8Mnv1xGc7dhQWxW8WuT5IqPjwRY3eMeUT
 LQN+JSbKAXIWTQq0+9GrJURg29Q6cel16U17Txck3+8IDgFzWHw13Rm4zsv94AtJyoDFP7zEie9
 Z4BFF/NTOw7B2y0O+gweRBw/Nt5tLUfRaVgydPGRZsU2fzSd/oNzH1SKmhx4fWBiSHEKLS2TuU2
 zqNEg/wMVUlss9bacH1O2ozdaT1jLvFiygq8OWSpkdlAg9Ny1rUaTUh1ZQ0Mh3ju5xqewOF4b5G
 M5EMsPjuekHjZjJFSsWDwOR/7R6Im23bVIjwF+TCXsPJNCYLWW4NbhtNdtLARVz1NtABjh9prxb
 vke6nj6QTp48jeHXxeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16727-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:kees@kernel.org,m:naveen@kernel.org,m:jpoimboe@kernel.org,m:peterz@infradead.org,m:npiggin@gmail.com,m:maddy@linux.ibm.com,m:segher@kernel.crashing.org,m:christophe.leroy@csgroup.eu,m:mingo@kernel.org,m:mpe@ellerman.id.au,m:sv@linux.ibm.com,m:nsc@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0A09B10D35B
X-Rspamd-Action: no action

Enable HAVE_OBJTOOL_FTR_FIXUP by default on PowerPC architecture.

- Remove runtime branch translation logic from patch_alt_instruction()
- Add --emit-relocs linker flags for post-link fixup processing
- Update ftr_alt section attributes to include executable flag
- Strip the --emit-relocs relocation sections (.rel*) from the final
  vmlinux after processing

Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/Kconfig                      |  3 +++
 arch/powerpc/Makefile                     |  5 +++++
 arch/powerpc/include/asm/feature-fixups.h |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S         |  8 ++++++--
 arch/powerpc/lib/feature-fixups.c         | 12 ------------
 scripts/Makefile.vmlinux                  |  5 +++++
 6 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8d36a261009..aedb11912672 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -23,6 +23,9 @@ config 64BIT
 	bool
 	default y if PPC64
 
+config HAVE_OBJTOOL_FTR_FIXUP
+        def_bool y
+
 config LIVEPATCH_64
 	def_bool PPC64
 	depends on LIVEPATCH
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..8e1dab5f3c9a 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -105,6 +105,11 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie --no-dynamic-linker
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
+# --emit-relocs required for post-link fixup of alternate feature
+# text section relocations.
+LDFLAGS_vmlinux        += --emit-relocs
+KBUILD_LDFLAGS_MODULE += --emit-relocs
+
 ifdef CONFIG_PPC64
 ifndef CONFIG_PPC_KERNEL_PCREL
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
index 756a6c694018..d6ae92a292ec 100644
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -32,7 +32,7 @@
 
 #define FTR_SECTION_ELSE_NESTED(label)			\
 label##2:						\
-	.pushsection __ftr_alt_##label,"a";		\
+	.pushsection __ftr_alt_##label, "ax";		\
 	.align 2;					\
 label##3:
 
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 15850296c0a9..70a4de464b34 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -99,8 +99,8 @@ SECTIONS
 	.text : AT(ADDR(.text) - LOAD_OFFSET) {
 		ALIGN_FUNCTION();
 #endif
-		/* careful! __ftr_alt_* sections need to be close to .text */
-		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely .text.unlikely.* .fixup __ftr_alt_* .ref.text);
+		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely
+			.text.unlikely.* .fixup .ref.text);
 		*(.tramp.ftrace.text);
 		NOINSTR_TEXT
 		SCHED_TEXT
@@ -267,6 +267,10 @@ SECTIONS
 		_einittext = .;
 	} :text
 
+	.__ftr_alternates.text : AT(ADDR(.__ftr_alternates.text) - LOAD_OFFSET) {
+		*(__ftr_alt*);
+	}
+
 	/* .exit.text is discarded at runtime, not link time,
 	 * to deal with references from __bug_table
 	 */
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 587c8cf1230f..269e992b1631 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -53,22 +53,10 @@ static u32 *calc_addr(struct fixup_entry *fcur, long offset)
 
 static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u32 *alt_end)
 {
-	int err;
 	ppc_inst_t instr;
 
 	instr = ppc_inst_read(src);
 
-	if (instr_is_relative_branch(ppc_inst_read(src))) {
-		u32 *target = (u32 *)branch_target(src);
-
-		/* Branch within the section doesn't need translating */
-		if (target < alt_start || target > alt_end) {
-			err = translate_branch(&instr, dest, src);
-			if (err)
-				return 1;
-		}
-	}
-
 	raw_patch_instruction(dest, instr);
 
 	return 0;
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index e3dd7fc62f20..3d2a203b8908 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -88,6 +88,11 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
 # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
 
+# --emit-relocs produces .rela.* sections needed by objtool --ftr-fixup;
+# strip them from vmlinux after fixup processing is complete.
+remove-section-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)    += '.rel*' '!.rel*.dyn'
+remove-section-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)    += '.rel.*'
+
 remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
 
 # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
-- 
2.43.0


