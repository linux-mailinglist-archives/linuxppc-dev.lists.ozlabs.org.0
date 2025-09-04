Return-Path: <linuxppc-dev+bounces-11697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05897B42FBF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 04:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHNk94B24z2yrZ;
	Thu,  4 Sep 2025 12:30:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756953025;
	cv=none; b=Kxx+2fxS1xW9ETXJQqrFManKPhTRsU4XR3EAmOC0XJqsP0DF7vWLKulTQZUVrdErEEoD7FOwUlMRNQKLOlmdfXouipTa0XE0P4dpjf8SDyQtOWntRqBXU6XOKYAprxhcyRDZgSvSiocoUWEiwoCk6I/YlIC6FJflzPfXWU2q/42DBH90uIrGlogUvlf7+CkmYPOTc6UBzHAU2xy0CpGmNokkWRNQ5NuL4F8Dyug9ZRq1cLV0H60NHWtlrF7ZYtRY9s9ckN1w+UkcXXAgaQ33ddP/eGJoVTypLUZzq2auuytBpDjR/wdoeaho89497lNw4OqIHj5+GXZSmKCbzTITKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756953025; c=relaxed/relaxed;
	bh=d9d0qR7kdpBDGnSSt5NKtI3LOAZpt19g7mKuK9CIaxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=QQq+/++VW463jUrAH2TxdOB4AuvpDLsPn+g63qP6AekoI3fnBWYgxLr3dK3n/iTrfI1yLqTMbtA5lGRzVrIfUn0gz0ePeZCKfvdTAKtIMHPS+oj3IiUI+etj2eOt01N/oHohLhsSS1QiwBFJzI3BF1B0ubafXVjfQvUw5NkhofFXQcJX9MF2GRANcmI9J5g9tNtezM6ZZOSxvrHFVCX16AE7A9l07pLgot6XONj9Z2elEfMrh7QYaEQvn0BsVQfOKYS0pF2nu59ehuLjFPNW6a/Z7JF6YjEeQNBflGoxuMH2IBaYaWGt4CLIPGdk+rnaOPZoJhia0kjI2BdGfL5u8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W8g0N0sR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W8g0N0sR; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W8g0N0sR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W8g0N0sR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHNk76Qxcz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 12:30:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756953017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d9d0qR7kdpBDGnSSt5NKtI3LOAZpt19g7mKuK9CIaxI=;
	b=W8g0N0sRkS2ICM4tzmhcV7VBTXZMULFf5T3HHFYi3ga/uEfsqC+OO4w+VSTul/daWYLOCW
	u4miSVgxyOhnQ/yL1fUAi3qtO/2npPJF1Z5NffOGQfQiAMGHZptdbyAD22/NJ5aeBUwjn/
	6bF+QgQqdUZubdqrisFWR0bAZ2wgBlk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756953017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d9d0qR7kdpBDGnSSt5NKtI3LOAZpt19g7mKuK9CIaxI=;
	b=W8g0N0sRkS2ICM4tzmhcV7VBTXZMULFf5T3HHFYi3ga/uEfsqC+OO4w+VSTul/daWYLOCW
	u4miSVgxyOhnQ/yL1fUAi3qtO/2npPJF1Z5NffOGQfQiAMGHZptdbyAD22/NJ5aeBUwjn/
	6bF+QgQqdUZubdqrisFWR0bAZ2wgBlk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-156-P5Dsf6L0PKCxL2PHZBzv7w-1; Wed,
 03 Sep 2025 22:30:10 -0400
X-MC-Unique: P5Dsf6L0PKCxL2PHZBzv7w-1
X-Mimecast-MFC-AGG-ID: P5Dsf6L0PKCxL2PHZBzv7w_1756953006
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78B94180048E;
	Thu,  4 Sep 2025 02:30:05 +0000 (UTC)
Received: from jolawren-thinkpadp1gen7.ibmlowe.csb (unknown [10.22.64.201])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A118A1800446;
	Thu,  4 Sep 2025 02:30:03 +0000 (UTC)
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH] powerpc64/modules: fix ool-ftrace-stub vs. livepatch relocation corruption
Date: Wed,  3 Sep 2025 22:29:50 -0400
Message-ID: <20250904022950.3004112-1-joe.lawrence@redhat.com>
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
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The powerpc64 module .stubs section holds ppc64_stub_entry[] code
trampolines that are generated at module load time. These stubs are
necessary for function calls to external symbols that are too far away
for a simple relative branch.

Logic for finding an available ppc64_stub_entry has relied on a sentinel
value in the funcdata member to indicate a used slot. Code iterates
through the array, inspecting .funcdata to find the first unused (zeroed)
entry:

  for (i = 0; stub_func_addr(stubs[i].funcdata); i++)

To support CONFIG_PPC_FTRACE_OUT_OF_LINE, a new setup_ftrace_ool_stubs()
function extended the .stubs section by adding an array of
ftrace_ool_stub structures for each patchable function. A side effect
of writing these smaller structures is that the funcdata sentinel
convention is not maintained. This is not a problem for an ordinary
kernel module, as this occurs in module_finalize(), after which no
further .stubs updates are needed.

However, when loading a livepatch module that contains klp-relocations,
apply_relocate_add() is executed a second time, after the out-of-line
ftrace stubs have been set up.

When apply_relocate_add() then calls stub_for_addr() to handle a
klp-relocation, its search for the next available ppc64_stub_entry[]
slot may stop prematurely in the middle of the ftrace_ool_stub array. A
full ppc64_stub_entry is then written, corrupting the ftrace stubs.

Fix this by explicitly tracking the count of used ppc64_stub_entrys.
Rather than relying on an inline funcdata sentinel value, a new
stub_count is used as the explicit boundary for searching and allocating
stubs. This simplifies the code, eliminates the "one extra reloc" that
was required for the sentinel check, and resolves the memory corruption.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 arch/powerpc/include/asm/module.h |  1 +
 arch/powerpc/kernel/module_64.c   | 26 ++++++++------------------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index e1ee5026ac4a..864e22deaa2c 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -27,6 +27,7 @@ struct ppc_plt_entry {
 struct mod_arch_specific {
 #ifdef __powerpc64__
 	unsigned int stubs_section;	/* Index of stubs section in module */
+	unsigned int stub_count;	/* Number of stubs used */
 #ifdef CONFIG_PPC_KERNEL_PCREL
 	unsigned int got_section;	/* What section is the GOT? */
 	unsigned int pcpu_section;	/* .data..percpu section */
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 126bf3b06ab7..2a44bc8e2439 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -209,8 +209,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 				    char *secstrings,
 				    struct module *me)
 {
-	/* One extra reloc so it's always 0-addr terminated */
-	unsigned long relocs = 1;
+	unsigned long relocs = 0;
 	unsigned i;
 
 	/* Every relocated section... */
@@ -705,7 +704,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 
 	/* Find this stub, or if that fails, the next avail. entry */
 	stubs = (void *)sechdrs[me->arch.stubs_section].sh_addr;
-	for (i = 0; stub_func_addr(stubs[i].funcdata); i++) {
+	for (i = 0; i < me->arch.stub_count; i++) {
 		if (WARN_ON(i >= num_stubs))
 			return 0;
 
@@ -716,6 +715,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 	if (!create_stub(sechdrs, &stubs[i], addr, me, name))
 		return 0;
 
+	me->arch.stub_count++;
 	return (unsigned long)&stubs[i];
 }
 
@@ -1118,29 +1118,19 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr, struct module *me)
 {
 #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
-	unsigned int i, total_stubs, num_stubs;
+	unsigned int total_stubs, num_stubs;
 	struct ppc64_stub_entry *stub;
 
 	total_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*stub);
 	num_stubs = roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
 			    sizeof(struct ppc64_stub_entry)) / sizeof(struct ppc64_stub_entry);
 
-	/* Find the next available entry */
-	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
-	for (i = 0; stub_func_addr(stub[i].funcdata); i++)
-		if (WARN_ON(i >= total_stubs))
-			return -1;
-
-	if (WARN_ON(i + num_stubs > total_stubs))
+	if (WARN_ON(me->arch.stub_count + num_stubs > total_stubs))
 		return -1;
 
-	stub += i;
-	me->arch.ool_stubs = (struct ftrace_ool_stub *)stub;
-
-	/* reserve stubs */
-	for (i = 0; i < num_stubs; i++)
-		if (patch_u32((void *)&stub->funcdata, PPC_RAW_NOP()))
-			return -1;
+	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
+	me->arch.ool_stubs = (struct ftrace_ool_stub *)(stub + me->arch.stub_count);
+	me->arch.stub_count += num_stubs;
 #endif
 
 	return 0;
-- 
2.50.1


