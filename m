Return-Path: <linuxppc-dev+bounces-12093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538CB5516C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 16:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNcGY3Hkdz3dTD;
	Sat, 13 Sep 2025 00:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757687285;
	cv=none; b=IRsivSssZWzw+XD+WtmAeGr6gfwTEspURHfUJN0iLfpSP2I8VT5h/wPQHsTYWfJK1uLGDCxopzrxT4aKW0AhPFzY7pM/8e2fVXCbDpmxUT4eiFoYQCm/lvepSB67mzchKsjtZQB6yU8mUuK7gdf3ihNl4tpomo0tR0A//rvl3Ygu0e8KVgCAaSzKxUkLziTb78LIdrTWBLIqsb0uQb4u1DJ1bTZsTh9yEeckmBWalnyZ2hyXJot3kZRpVDU9zpl+R537gdO4LeBmdiE7O7v6Ht7wmSK9rU76iWYrjL1J4jm3HUTe2ehnVSvD1l/QQKZYNA12Wm2LuOYJS7gIz/WC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757687285; c=relaxed/relaxed;
	bh=+dEHsoW6rv9lhHPqGYaopsnJbjdZ8LscRXBGWnkIRTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=g4IF8UqjaHR//a6YALWm4B0fThC09WE8K2nhOvCNndlsmfWWsVMvW9WoCn3u4WZbiIOJ67k7ebXvrlBn4j5+bfEv9iYDw/leS84aqgntMVaNsS/HniIfIrqPXX3pnMMra+BL/lbPXGBvaG644TKM03XWt6gLWAyXfPYsB5DC7Se5NbWeBCkLwmt3gyPDrpICy1BiCIxnNqM53XlAQ59+fEUG1i3h5fPvG+eQxnF7TL98UCKbxiB+ZNofeHQn6tcGvXxz7ZPA+CEEhOgEBaN6tULosCfxFnrZQJI5hWY5r4QD7qS4wmny4DnZsr1cRkZ6XpcejC7XpivUBihl+5waVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BokLxKtA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BokLxKtA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BokLxKtA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BokLxKtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNcGX4hv0z3dT8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 00:28:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dEHsoW6rv9lhHPqGYaopsnJbjdZ8LscRXBGWnkIRTQ=;
	b=BokLxKtAgGnHtJPnPbK/Muo7uaLpbpLyGMa799+Qw0uoPR3HC+43FGUP+4D1SRWa4DK5X0
	030rX0bGU2Zp6x0xLJfgPaRm4ExCPC1UtL5QgsZN4qIYkTdAeUFM0/+dfBdpBgduKQXbc6
	+v0yqfX2iLN7uiy4ZfAv7Qj0knaDo3Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dEHsoW6rv9lhHPqGYaopsnJbjdZ8LscRXBGWnkIRTQ=;
	b=BokLxKtAgGnHtJPnPbK/Muo7uaLpbpLyGMa799+Qw0uoPR3HC+43FGUP+4D1SRWa4DK5X0
	030rX0bGU2Zp6x0xLJfgPaRm4ExCPC1UtL5QgsZN4qIYkTdAeUFM0/+dfBdpBgduKQXbc6
	+v0yqfX2iLN7uiy4ZfAv7Qj0knaDo3Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-Kige88aJPO-f0WLa7VFVRA-1; Fri,
 12 Sep 2025 10:27:56 -0400
X-MC-Unique: Kige88aJPO-f0WLa7VFVRA-1
X-Mimecast-MFC-AGG-ID: Kige88aJPO-f0WLa7VFVRA_1757687275
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C2161800451;
	Fri, 12 Sep 2025 14:27:54 +0000 (UTC)
Received: from jolawren-thinkpadp1gen7.ibmlowe.csb (unknown [10.22.81.60])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6C231800452;
	Fri, 12 Sep 2025 14:27:52 +0000 (UTC)
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 3/3] powerpc64/modules: replace stub allocation sentinel with an explicit counter
Date: Fri, 12 Sep 2025 10:27:40 -0400
Message-ID: <20250912142740.3581368-4-joe.lawrence@redhat.com>
In-Reply-To: <20250912142740.3581368-1-joe.lawrence@redhat.com>
References: <20250912142740.3581368-1-joe.lawrence@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The logic for allocating ppc64_stub_entry trampolines in the .stubs
section relies on an inline sentinel, where a NULL .funcdata member
indicates an available slot.

While preceding commits fixed the initialization bugs that led to ftrace
stub corruption, the sentinel-based approach remains fragile: it depends
on an implicit convention between subsystems modifying different
struct types in the same memory area.

Replace the sentinel with an explicit counter, module->arch.num_stubs.
Instead of iterating through memory to find a NULL marker, the module
loader uses this counter as the boundary for the next free slot.

This simplifies the allocation code, hardens it against future changes
to stub structures, and removes the need for an extra relocation slot
previously reserved to terminate the sentinel search.

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
index 0e45cac4de76..2a44bc8e2439 100644
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
-		if (patch_u32((void *)&stub[i].funcdata, PPC_RAW_NOP()))
-			return -1;
+	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
+	me->arch.ool_stubs = (struct ftrace_ool_stub *)(stub + me->arch.stub_count);
+	me->arch.stub_count += num_stubs;
 #endif
 
 	return 0;
-- 
2.51.0


