Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872A597DD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 07:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7XvN6vjyz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 15:07:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LUrbeEVa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Xtj65K0z2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 15:07:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LUrbeEVa;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M7Xtf59hVz4x1d;
	Thu, 18 Aug 2022 15:07:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660799226;
	bh=5Vov1fmvbGTMUL1OdaxriLrJnUsQ8nyZWUrX5z7TPsI=;
	h=From:To:Subject:Date:From;
	b=LUrbeEVaPpih+VQTKIwCpifPmMmi/rWQyUBH+QsO3pp8tg5qyin9kYS/C+xZzg7s3
	 H1f9MBjvcPdeD0+gVdy9lUCYyk9co2lX1FVNsC9fLrGzEdkN3uy/qJAsA/Omw60id+
	 Mbd3JTYlXylRy+Y/EeJer9+xw1eeckUyEkCFL0NWs1vI7xiVZAUpXDNZmnxY5nP2Lf
	 sGBsQAkUGOm/XPRIKDeZNqMdGrJb2I5Y5n0CNNpLwa9hQuiXx8tk77a3X/Wl9Agg3q
	 Yi7cwSnyLwSJ6xQKlVYhsRZwgedS2m7r3aFARQw620NCSQZNUXvNwEw5rbeC+8fjEa
	 hIZUgsCMKkZyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Move patch sites out of asm-prototypes.h
Date: Thu, 18 Aug 2022 15:06:59 +1000
Message-Id: <20220818050659.187181-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The definitions for the patch sites etc. don't belong in
asm-prototypes.h, they are not EXPORT'ed asm symbols.

Move them into sections.h which is traditionally used for asm symbols.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/asm-prototypes.h | 13 -------------
 arch/powerpc/include/asm/sections.h       | 13 +++++++++++++
 arch/powerpc/kernel/security.c            |  1 +
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 81631e64dbeb..e1b3e90eec94 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -55,19 +55,6 @@ struct kvm_vcpu;
 void _kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu, u64 guest_msr);
 void _kvmppc_save_tm_pr(struct kvm_vcpu *vcpu, u64 guest_msr);
 
-/* Patch sites */
-extern s32 patch__call_flush_branch_caches1;
-extern s32 patch__call_flush_branch_caches2;
-extern s32 patch__call_flush_branch_caches3;
-extern s32 patch__flush_count_cache_return;
-extern s32 patch__flush_link_stack_return;
-extern s32 patch__call_kvm_flush_link_stack;
-extern s32 patch__call_kvm_flush_link_stack_p9;
-extern s32 patch__memset_nocache, patch__memcpy_nocache;
-
-extern long flush_branch_caches;
-extern long kvm_flush_link_stack;
-
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 void kvmppc_save_tm_hv(struct kvm_vcpu *vcpu, u64 msr, bool preserve_nv);
 void kvmppc_restore_tm_hv(struct kvm_vcpu *vcpu, u64 msr, bool preserve_nv);
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 8be2c491c733..183e6b8af392 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -14,6 +14,19 @@ typedef struct func_desc func_desc_t;
 
 extern char __head_end[];
 
+/* Patch sites */
+extern s32 patch__call_flush_branch_caches1;
+extern s32 patch__call_flush_branch_caches2;
+extern s32 patch__call_flush_branch_caches3;
+extern s32 patch__flush_count_cache_return;
+extern s32 patch__flush_link_stack_return;
+extern s32 patch__call_kvm_flush_link_stack;
+extern s32 patch__call_kvm_flush_link_stack_p9;
+extern s32 patch__memset_nocache, patch__memcpy_nocache;
+
+extern long flush_branch_caches;
+extern long kvm_flush_link_stack;
+
 #ifdef __powerpc64__
 
 extern char __start_interrupts[];
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index d96fd14bd7c9..b562a1d2c750 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -16,6 +16,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/code-patching.h>
 #include <asm/security_features.h>
+#include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
 
-- 
2.37.1

