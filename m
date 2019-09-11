Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD674AFC22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 14:05:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T0vZ24yyzF33J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 22:04:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T0mf6Dq2zF33Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 21:58:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="UjzxfiFJ"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46T0mf4R9Xz9sNx; Wed, 11 Sep 2019 21:58:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46T0mf2MRsz9sNk; Wed, 11 Sep 2019 21:58:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568203138;
 bh=fHjG4/rFIJyvNhfaY19rGTqzVCkA1AYWYNztpmSsp18=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UjzxfiFJ7FhuznCIGG4+n4xmA/0/K6q7djCB/2+qWQuzVNRUJwmnOiQgITWxlGNFf
 40z8cVNQrFLpD8lrvZWyF53+mMk+mYXQgLbpgwK2z0IHd38DPYWjjj4oIP7LCTBbg6
 VmMLOb1xh/D+xag0pXCzV5/CwsUEkKt6qc33u+iflVjK3oa4OQ9LZ0dj/11RK/FzIO
 +HWUVAOgGzGjr2HsTJA8yf3LX/I1lXYTdOJjJZkrIqZTmi+VyQYKGbQvkZOhdfSjgW
 j5axSvQH+4XowTxGKUlpx1cxzXNpSFNDvq3MRDaM8vfnuUn62OnSqx/6SYCqVv6/Xj
 W52opOarVoUnQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/4] powerpc/kvm: Explicitly mark kvm guest code as __init
Date: Wed, 11 Sep 2019 21:57:45 +1000
Message-Id: <20190911115746.12433-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911115746.12433-1-mpe@ellerman.id.au>
References: <20190911115746.12433-1-mpe@ellerman.id.au>
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
Cc: cai@lca.pw, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All the code in kvm.c can be marked __init. Most of it is already
inlined into the initcall, but not all. So instead of relying on the
inlining, mark it all as __init. This saves ~280 bytes of text for my
configuration.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/kvm.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
index e3b5aa583319..617eba82531c 100644
--- a/arch/powerpc/kernel/kvm.c
+++ b/arch/powerpc/kernel/kvm.c
@@ -68,13 +68,13 @@ extern char kvm_tmp[];
 extern char kvm_tmp_end[];
 static int kvm_tmp_index;
 
-static inline void kvm_patch_ins(u32 *inst, u32 new_inst)
+static void __init kvm_patch_ins(u32 *inst, u32 new_inst)
 {
 	*inst = new_inst;
 	flush_icache_range((ulong)inst, (ulong)inst + 4);
 }
 
-static void kvm_patch_ins_ll(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_ll(u32 *inst, long addr, u32 rt)
 {
 #ifdef CONFIG_64BIT
 	kvm_patch_ins(inst, KVM_INST_LD | rt | (addr & 0x0000fffc));
@@ -83,7 +83,7 @@ static void kvm_patch_ins_ll(u32 *inst, long addr, u32 rt)
 #endif
 }
 
-static void kvm_patch_ins_ld(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_ld(u32 *inst, long addr, u32 rt)
 {
 #ifdef CONFIG_64BIT
 	kvm_patch_ins(inst, KVM_INST_LD | rt | (addr & 0x0000fffc));
@@ -92,12 +92,12 @@ static void kvm_patch_ins_ld(u32 *inst, long addr, u32 rt)
 #endif
 }
 
-static void kvm_patch_ins_lwz(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_lwz(u32 *inst, long addr, u32 rt)
 {
 	kvm_patch_ins(inst, KVM_INST_LWZ | rt | (addr & 0x0000ffff));
 }
 
-static void kvm_patch_ins_std(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_std(u32 *inst, long addr, u32 rt)
 {
 #ifdef CONFIG_64BIT
 	kvm_patch_ins(inst, KVM_INST_STD | rt | (addr & 0x0000fffc));
@@ -106,17 +106,17 @@ static void kvm_patch_ins_std(u32 *inst, long addr, u32 rt)
 #endif
 }
 
-static void kvm_patch_ins_stw(u32 *inst, long addr, u32 rt)
+static void __init kvm_patch_ins_stw(u32 *inst, long addr, u32 rt)
 {
 	kvm_patch_ins(inst, KVM_INST_STW | rt | (addr & 0x0000fffc));
 }
 
-static void kvm_patch_ins_nop(u32 *inst)
+static void __init kvm_patch_ins_nop(u32 *inst)
 {
 	kvm_patch_ins(inst, KVM_INST_NOP);
 }
 
-static void kvm_patch_ins_b(u32 *inst, int addr)
+static void __init kvm_patch_ins_b(u32 *inst, int addr)
 {
 #if defined(CONFIG_RELOCATABLE) && defined(CONFIG_PPC_BOOK3S)
 	/* On relocatable kernels interrupts handlers and our code
@@ -129,7 +129,7 @@ static void kvm_patch_ins_b(u32 *inst, int addr)
 	kvm_patch_ins(inst, KVM_INST_B | (addr & KVM_INST_B_MASK));
 }
 
-static u32 *kvm_alloc(int len)
+static u32 * __init kvm_alloc(int len)
 {
 	u32 *p;
 
@@ -152,7 +152,7 @@ extern u32 kvm_emulate_mtmsrd_orig_ins_offs;
 extern u32 kvm_emulate_mtmsrd_len;
 extern u32 kvm_emulate_mtmsrd[];
 
-static void kvm_patch_ins_mtmsrd(u32 *inst, u32 rt)
+static void __init kvm_patch_ins_mtmsrd(u32 *inst, u32 rt)
 {
 	u32 *p;
 	int distance_start;
@@ -205,7 +205,7 @@ extern u32 kvm_emulate_mtmsr_orig_ins_offs;
 extern u32 kvm_emulate_mtmsr_len;
 extern u32 kvm_emulate_mtmsr[];
 
-static void kvm_patch_ins_mtmsr(u32 *inst, u32 rt)
+static void __init kvm_patch_ins_mtmsr(u32 *inst, u32 rt)
 {
 	u32 *p;
 	int distance_start;
@@ -266,7 +266,7 @@ extern u32 kvm_emulate_wrtee_orig_ins_offs;
 extern u32 kvm_emulate_wrtee_len;
 extern u32 kvm_emulate_wrtee[];
 
-static void kvm_patch_ins_wrtee(u32 *inst, u32 rt, int imm_one)
+static void __init kvm_patch_ins_wrtee(u32 *inst, u32 rt, int imm_one)
 {
 	u32 *p;
 	int distance_start;
@@ -323,7 +323,7 @@ extern u32 kvm_emulate_wrteei_0_branch_offs;
 extern u32 kvm_emulate_wrteei_0_len;
 extern u32 kvm_emulate_wrteei_0[];
 
-static void kvm_patch_ins_wrteei_0(u32 *inst)
+static void __init kvm_patch_ins_wrteei_0(u32 *inst)
 {
 	u32 *p;
 	int distance_start;
@@ -364,7 +364,7 @@ extern u32 kvm_emulate_mtsrin_orig_ins_offs;
 extern u32 kvm_emulate_mtsrin_len;
 extern u32 kvm_emulate_mtsrin[];
 
-static void kvm_patch_ins_mtsrin(u32 *inst, u32 rt, u32 rb)
+static void __init kvm_patch_ins_mtsrin(u32 *inst, u32 rt, u32 rb)
 {
 	u32 *p;
 	int distance_start;
@@ -400,7 +400,7 @@ static void kvm_patch_ins_mtsrin(u32 *inst, u32 rt, u32 rb)
 
 #endif
 
-static void kvm_map_magic_page(void *data)
+static void __init kvm_map_magic_page(void *data)
 {
 	u32 *features = data;
 
@@ -415,7 +415,7 @@ static void kvm_map_magic_page(void *data)
 	*features = out[0];
 }
 
-static void kvm_check_ins(u32 *inst, u32 features)
+static void __init kvm_check_ins(u32 *inst, u32 features)
 {
 	u32 _inst = *inst;
 	u32 inst_no_rt = _inst & ~KVM_MASK_RT;
@@ -659,7 +659,7 @@ static void kvm_check_ins(u32 *inst, u32 features)
 extern u32 kvm_template_start[];
 extern u32 kvm_template_end[];
 
-static void kvm_use_magic_page(void)
+static void __init kvm_use_magic_page(void)
 {
 	u32 *p;
 	u32 *start, *end;
-- 
2.21.0

