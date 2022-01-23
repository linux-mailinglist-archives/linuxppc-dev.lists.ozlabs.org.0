Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DC497166
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWvf3tpVz30Qy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:02:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dxku5Mx0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dxku5Mx0; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWsk0NLrz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:00:57 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id u11so12919744plh.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WsM1O1SmhS+Q5BxZooQqZIh0bZC9gDWNm5Vzgf860WU=;
 b=dxku5Mx02oN/PJ51FmoGpPGfIPIXPJi1ujXuHb9impfoMGv4gvateL+i8i0CqOL86b
 4Vy6CHYJfdEq0JRmxJfDM5K6cVaoiTk+Tw0WMt57yW+MhrDFIxP1+yVt+4Lx0MR8ETGZ
 9J9wo+G97EWQjtZY0RmwZA3ZVdslNsTlVzcZ2jFPxy3V/eDXujpVmKSqq/gW76ntJJg0
 mVZPWb6Xn1AJjhzWriGEAHo6qvkXPqmM2Tr9flQHwv0wDZcv8DRbo9Dq5zWGR6DEY4oJ
 SUWEw/NMvM8QXCrdyClkNksXQV6rINdR6hGj9u5NbmUZCpzsXlO5m3s7Kac2wKG2JPPt
 1SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WsM1O1SmhS+Q5BxZooQqZIh0bZC9gDWNm5Vzgf860WU=;
 b=ingicai/Rr+pOO3a0jcul0d2C2W7Xy3x1XZDUD9EU/ablIHJa3uTlell0yFGIyRYAu
 1g5BSjju2eG+XAY6wFbg/sj8D0ion0DWZNpKbR5PczchPbZBt8zBwxt8TFv82kFh2JhH
 TRdNzkN3XqcFC+GfuLcAeAVFwfSdiz5SaTgqZPAw0XvXvjMXoGWtuuM1HCeuZ8F9Nco3
 2bOj+HBR62OIFGE9i4ebcuDL7Vo78X2bOabQ4BADJTh0J9WvgTTpXpKqBMvfA6OtzRZ5
 xWF82fsFLj6Uh9irXcGSvzFvOPlvUKLDOD+lX0mN/y4i8xV0jilZcxtgCUHD//104n8b
 JgEw==
X-Gm-Message-State: AOAM531xr9nSOYNYb53OG3/dTHzeKaI5hS8tMHq0xcC2YOt03o0lNQdh
 OhNK3623cjr67R1MVzWwZKqsC/F3P+U=
X-Google-Smtp-Source: ABdhPJwHyqBdLVL4ZxWon0ViUxpjTCqZ2zK874HzgWFpZ88S5ZVLPFux1RBVZDvaidfN2lUJmz5UGg==
X-Received: by 2002:a17:902:830c:b0:14a:dffe:d2f2 with SMTP id
 bd12-20020a170902830c00b0014adffed2f2mr11045862plb.24.1642939255632; 
 Sun, 23 Jan 2022 04:00:55 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:00:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] KVM: PPC: Book3S HV: Update LPID allocator init for
 POWER9, Nested
Date: Sun, 23 Jan 2022 22:00:39 +1000
Message-Id: <20220123120043.3586018-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220123120043.3586018-1-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LPID allocator init is changed to:
- use mmu_lpid_bits rather than hard-coding;
- use KVM_MAX_NESTED_GUESTS for nested hypervisors;
- not reserve the top LPID on POWER9 and newer CPUs.

The reserved LPID is made a POWER7/8-specific detail.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
 arch/powerpc/include/asm/reg.h            |  2 --
 arch/powerpc/kvm/book3s_64_mmu_hv.c       | 29 ++++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  8 +++++++
 arch/powerpc/mm/init_64.c                 |  3 +++
 5 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index b6d31bff5209..e6bda70b1d93 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -15,7 +15,7 @@
 #define XICS_IPI		2	/* interrupt source # for IPIs */
 
 /* LPIDs we support with this build -- runtime limit may be lower */
-#define KVMPPC_NR_LPIDS			(LPID_RSVD + 1)
+#define KVMPPC_NR_LPIDS			(1UL << 12)
 
 /* Maximum number of threads per physical core */
 #define MAX_SMT_THREADS		8
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1e14324c5190..1e8b2e04e626 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -473,8 +473,6 @@
 #ifndef SPRN_LPID
 #define SPRN_LPID	0x13F	/* Logical Partition Identifier */
 #endif
-#define   LPID_RSVD_POWER7	0x3ff	/* Reserved LPID for partn switching */
-#define   LPID_RSVD		0xfff	/* Reserved LPID for partn switching */
 #define	SPRN_HMER	0x150	/* Hypervisor maintenance exception reg */
 #define   HMER_DEBUG_TRIG	(1ul << (63 - 17)) /* Debug trigger */
 #define	SPRN_HMEER	0x151	/* Hyp maintenance exception enable reg */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 09fc52b6f390..5be92d5bc099 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -256,7 +256,7 @@ void kvmppc_map_vrma(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 int kvmppc_mmu_hv_init(void)
 {
-	unsigned long rsvd_lpid;
+	unsigned long nr_lpids;
 
 	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE))
 		return -EINVAL;
@@ -264,16 +264,29 @@ int kvmppc_mmu_hv_init(void)
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		if (WARN_ON(mfspr(SPRN_LPID) != 0))
 			return -EINVAL;
+		nr_lpids = 1UL << mmu_lpid_bits;
+	} else {
+		nr_lpids = KVM_MAX_NESTED_GUESTS;
 	}
 
-	/* POWER8 and above have 12-bit LPIDs (10-bit in POWER7) */
-	if (cpu_has_feature(CPU_FTR_ARCH_207S))
-		rsvd_lpid = LPID_RSVD;
-	else
-		rsvd_lpid = LPID_RSVD_POWER7;
+	if (nr_lpids > KVMPPC_NR_LPIDS)
+		nr_lpids = KVMPPC_NR_LPIDS;
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+		/* POWER7 has 10-bit LPIDs, POWER8 has 12-bit LPIDs */
+		if (cpu_has_feature(CPU_FTR_ARCH_207S))
+			WARN_ON(nr_lpids != 1UL << 12);
+		else
+			WARN_ON(nr_lpids != 1UL << 10);
+
+		/*
+		 * Reserve the last implemented LPID use in partition
+		 * switching for POWER7 and POWER8.
+		 */
+		nr_lpids -= 1;
+	}
 
-	/* rsvd_lpid is reserved for use in partition switching */
-	kvmppc_init_lpid(rsvd_lpid);
+	kvmppc_init_lpid(nr_lpids);
 
 	return 0;
 }
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d185dee26026..0c552885a032 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -50,6 +50,14 @@
 #define STACK_SLOT_UAMOR	(SFS-88)
 #define STACK_SLOT_FSCR		(SFS-96)
 
+/*
+ * Use the last LPID (all implemented LPID bits = 1) for partition switching.
+ * This is reserved in the LPID allocator. POWER7 only implements 0x3ff, but
+ * we write 0xfff into the LPID SPR anyway, which seems to work and just
+ * ignores the top bits.
+ */
+#define   LPID_RSVD		0xfff
+
 /*
  * Call kvmppc_hv_entry in real mode.
  * Must be called with interrupts hard-disabled.
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 35f46bf54281..ad1a41e3ff1c 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -371,6 +371,9 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 
 #ifdef CONFIG_PPC_BOOK3S_64
 unsigned int mmu_lpid_bits;
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+EXPORT_SYMBOL_GPL(mmu_lpid_bits);
+#endif
 unsigned int mmu_pid_bits;
 
 static bool disable_radix = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
-- 
2.23.0

