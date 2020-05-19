Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0901D8C77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 02:39:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qxpk3kx1zDqRs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 10:39:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QxgT4J8XzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 10:33:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QxgT2t7Xz9sTd;
 Tue, 19 May 2020 10:33:09 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/7] powerpc: Add support for ISA v3.1
Date: Tue, 19 May 2020 10:31:52 +1000
Message-Id: <20200519003157.31946-3-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519003157.31946-1-alistair@popple.id.au>
References: <20200519003157.31946-1-alistair@popple.id.au>
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
Cc: mikey@neuling.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Newer ISA versions are enabled by clearing all bits in the PCR
associated with previous versions of the ISA. Enable ISA v3.1 support
by updating the PCR mask to include ISA v3.0. This ensures all PCR
bits corresponding to earlier architecture versions get cleared
thereby enabling ISA v3.1 if supported by the hardware.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/include/asm/cputable.h | 1 +
 arch/powerpc/include/asm/reg.h      | 3 ++-
 arch/powerpc/kvm/book3s_hv.c        | 3 ---
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 40a4d3c6fd99..36f894dea9e7 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -213,6 +213,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_TIDR			LONG_ASM_CONST(0x0000800000000000)
 #define CPU_FTR_P9_TLBIE_ERAT_BUG	LONG_ASM_CONST(0x0001000000000000)
 #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
+#define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 773f76402392..1931b1142599 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -485,10 +485,11 @@
  * determine both the compatibility level which we want to emulate and the
  * compatibility level which the host is capable of emulating.
  */
+#define   PCR_ARCH_300	0x10		/* Architecture 3.00 */
 #define   PCR_ARCH_207	0x8		/* Architecture 2.07 */
 #define   PCR_ARCH_206	0x4		/* Architecture 2.06 */
 #define   PCR_ARCH_205	0x2		/* Architecture 2.05 */
-#define   PCR_LOW_BITS	(PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205)
+#define   PCR_LOW_BITS	(PCR_ARCH_207 | PCR_ARCH_206 | PCR_ARCH_205 | PCR_ARCH_300)
 #define   PCR_MASK	~(PCR_HIGH_BITS | PCR_LOW_BITS)	/* PCR Reserved Bits */
 #define	SPRN_HEIR	0x153	/* Hypervisor Emulated Instruction Register */
 #define SPRN_TLBINDEXR	0x154	/* P7 TLB control register */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 93493f0cbfe8..532215040f3e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -344,9 +344,6 @@ static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
 	vcpu->arch.pvr = pvr;
 }
 
-/* Dummy value used in computing PCR value below */
-#define PCR_ARCH_300	(PCR_ARCH_207 << 1)
-
 static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 {
 	unsigned long host_pcr_bit = 0, guest_pcr_bit = 0;
-- 
2.20.1

