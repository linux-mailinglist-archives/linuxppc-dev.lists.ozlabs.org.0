Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4B459DAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 09:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyxnF2684z2yy3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 19:16:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=ak/2RnAp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DF4iA32r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=ak/2RnAp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DF4iA32r; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyxmS2F4Jz2xrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 19:16:07 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 525245C018F;
 Tue, 23 Nov 2021 03:16:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 23 Nov 2021 03:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=yZdCPksYWqrlMi9ckF8b/5HNKm
 q5VmNZLYbPzTq90ME=; b=ak/2RnApbl1GDHznqdvVaNJl8YGToYbPv6JK6t2gFN
 NHeyDVHjdwIuSlWnD3luMXUY0DvFVi9Z8BXPxs3LK8DFD5CoOCUpXPeELlMmkQWZ
 rq8hwmL0xLYIoRL3/U8OUPSBwi9w9Ef/R8yYMjp/r8vRIcheJEiMCqGyahlafmK0
 qjNGlaUoiof9tFApHMR+LpCWMmABe9u3EumK1urFUJu4IpcpvWfPMEjC78a9oK21
 6/byNbTCpnXtcOr9tgG2ZPaOfb20Brb9GINRSbXnfCdfJshjwotz9bvzXtcnzFmS
 DNsg+x2dHqEStbMklztb7vIMGqC/ArxzgzKij3agrukQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yZdCPksYWqrlMi9ck
 F8b/5HNKmq5VmNZLYbPzTq90ME=; b=DF4iA32rMs56ItgYZLq/SQ7nTuNCnqlRx
 d0B6k0wMh8MZB80aMNZRN1HIlQKqKfrpBqPCRF/q+bCC3PGlgnnzGE2k3AY+v8Li
 n1jCPH3a38e2dyqihyMIuBZw1yw7iOQiAnvF/pfZM2GTbk45fOqxvWCodAi7su9u
 gP8DWTPDcTA2USPb34/rgN9D5UeKoW3D1zwqK5F3SDXY8r7zOO9kL7ZlNDRjxKGV
 lwCWyRGUoufWn1ROkyCaLU6KRSd6ozcmYzr2KwGTB6wxPIdw8HWwjiktKN+P6pMc
 NCyLqlnXSKk0VghTgtvLsFySa4N435Ldi4TPSvOSps+eiSeyeqG8A==
X-ME-Sender: <xms:QaOcYfDBj0P_UViPmiZGQwQBfJxIXsbGNvNkBkhlkGfZOr1mLGtehA>
 <xme:QaOcYVhPqR2XWq8X276J_609Crwh-7EhcVY0tbP5dSQa_9fCUYeiyaHJb09ovPYBd
 FY0UD7whp8r2XKk9w>
X-ME-Received: <xmr:QaOcYakw4Cpd6O1s7mrM7FBod-XokltnaEacd_EXFqZdUV1EmOo7k6co0wT7zecEtwb9uozBnFxoLONrXvXCOzkRDefiaLXZ_LWcKjxNOLR47dP_wC4_GsE5Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeehgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdluddtmdenucfjughrpefhvffufffkofgggfestdekredtredttden
 ucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhsshgvlh
 hlrdgttgeqnecuggftrfgrthhtvghrnhepleegleefvdffkeegveefleevfedtieelgfdu
 geekueehhfevgfffkeeugfffkeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:QaOcYRz621vXJNAm73UJJpU0JCZMetodvSBQocXmAavgCtdjEdr9_w>
 <xmx:QaOcYURqctWHqRpO8iUqTnTZFfFiQAuekzhfYX4cCrqwZLK3B9KW1A>
 <xmx:QaOcYUbzxhzAkrsaHW_LI6e46XVXkAEvJ6DcnNDPVXIP8kAbUUF7Zw>
 <xmx:RKOcYZIQCSAS1Mt1W74wCabVpYT4AOnNOiFo9Q_k6mH7BmBmjiZH_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Nov 2021 03:15:59 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/module_64: Fix livepatching for RO modules
Date: Tue, 23 Nov 2021 18:15:20 +1000
Message-Id: <20211123081520.18843-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Joe Lawrence <joe.lawrence@redhat.com>, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Livepatching a loaded module involves applying relocations through
apply_relocate_add(), which attempts to write to read-only memory when
CONFIG_STRICT_MODULE_RWX=y.  Work around this by performing these
writes through the text poke area by using patch_instruction().

R_PPC_REL24 is the only relocation type generated by the kpatch-build
userspace tool or klp-convert kernel tree that I observed applying a
relocation to a post-init module.

A more comprehensive solution is planned, but using patch_instruction()
for R_PPC_REL24 on should serve as a sufficient fix.

This does have a performance impact, I observed ~15% overhead in
module_load() on POWER8 bare metal with checksum verification off.

Fixes: c35717c71e98 ("powerpc: Set ARCH_HAS_STRICT_MODULE_RWX")
Cc: stable@vger.kernel.org # v5.14+
Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
Intended to be a minimal fix that can go to stable.

 arch/powerpc/kernel/module_64.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 6baa676e7cb6..c25ef36c3ef4 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -422,11 +422,16 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			      const char *name)
 {
 	long reladdr;
+	func_desc_t desc;
+	int i;
 
 	if (is_mprofile_ftrace_call(name))
 		return create_ftrace_stub(entry, addr, me);
 
-	memcpy(entry->jump, ppc64_stub_insns, sizeof(ppc64_stub_insns));
+	for (i = 0; i < sizeof(ppc64_stub_insns) / sizeof(u32); i++) {
+		patch_instruction(&entry->jump[i],
+				  ppc_inst(ppc64_stub_insns[i]));
+	}
 
 	/* Stub uses address relative to r2. */
 	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
@@ -437,10 +442,19 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	}
 	pr_debug("Stub %p get data from reladdr %li\n", entry, reladdr);
 
-	entry->jump[0] |= PPC_HA(reladdr);
-	entry->jump[1] |= PPC_LO(reladdr);
-	entry->funcdata = func_desc(addr);
-	entry->magic = STUB_MAGIC;
+	patch_instruction(&entry->jump[0],
+			  ppc_inst(entry->jump[0] | PPC_HA(reladdr)));
+	patch_instruction(&entry->jump[1],
+			  ppc_inst(entry->jump[1] | PPC_LO(reladdr)));
+
+	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
+	desc = func_desc(addr);
+	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
+		patch_instruction(((u32 *)&entry->funcdata) + i,
+				  ppc_inst(((u32 *)(&desc))[i]));
+	}
+
+	patch_instruction(&entry->magic, ppc_inst(STUB_MAGIC));
 
 	return 1;
 }
@@ -496,7 +510,7 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 		return 0;
 	}
 	/* ld r2,R2_STACK_OFFSET(r1) */
-	*instruction = PPC_INST_LD_TOC;
+	patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC));
 	return 1;
 }
 
@@ -636,9 +650,9 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			}
 
 			/* Only replace bits 2 through 26 */
-			*(uint32_t *)location
-				= (*(uint32_t *)location & ~0x03fffffc)
+			value = (*(uint32_t *)location & ~0x03fffffc)
 				| (value & 0x03fffffc);
+			patch_instruction((u32 *)location, ppc_inst(value));
 			break;
 
 		case R_PPC64_REL64:
-- 
2.34.0

