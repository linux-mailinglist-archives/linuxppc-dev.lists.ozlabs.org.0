Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E7849716C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWxz52h6z3dh7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:04:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IXwz+jZ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IXwz+jZ5; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWsq63sSz3bT6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:01:03 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so12966908pju.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x01Niqq4R3YNDZjgNcrK5Tu7K/civd4HHH8QIiSIp8o=;
 b=IXwz+jZ5cT1SbW8tVKUJkU+Vo+JkyN0eRDc58g52xkk+pTPJ6HHI7N7UTsOIJSJ78b
 DmVun06VNYYvDw8TIlVFbAuiILf1+u9+n6EsRMWJA9IEKgMjv9/DFYVsMS1ADEY/7mPy
 8GuHbgY58Ok9rhK98/80BXrPFzSm3MVvQUL5bLdcwvDh+HiTTXb0Dh8TlUfMHBTuwYrQ
 57hGzNVsW/Gm7AerKjER4WHx61jI2fdanMZou8GwELrTkqOEcYcC3EXKj2Ax6CuaQKwD
 sVQ0KfJrBz4w9WFRjyIu+PJ+sZgoALBZOECf7Qev1IjEIsd806R9kNUOA/sS2P9kVqKO
 WC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x01Niqq4R3YNDZjgNcrK5Tu7K/civd4HHH8QIiSIp8o=;
 b=TMIdP1J4Ct3KxvAhSP1ppS8LgCwTdNc61RsPNiiRSTha6NUmQvee+X7g3myawoY2+4
 MaEfF0izAiPqxdCBARmayPqW8BUTBCNspqW/0DWt8fdP1li39z9Yy/+7nBBlhw84Uw0M
 gyqENUxzH34vdqfwfxKlhNX07rqpgNK6MpHOwMwISQ17rT2GVzIH3zhoSMmhzNmOcKG7
 xenEXc583N9gKlseB+aHSJfBfxaQBhfgZzswZEsjiNilYPVRHEhPw7e3Y2I0fIdLOj+2
 gUl2uhlZ5PRev3zPEOnZBhoT9/ZPZ0VhnoEbKxUqZTWdVv3R5Iwamb6noRrVZJ/PWtLQ
 izzQ==
X-Gm-Message-State: AOAM531SnJgJMdvpnw3XA1fsOyn5BcTaMF+chsuD5RkigSe8AV7u9g5x
 7AIav2uziWjm1FND+bPmYX/ObaDd+xY=
X-Google-Smtp-Source: ABdhPJzjJ8H29yNLRTLxCCVYQyWdF+olZM9IlU99ovd4XYJmz1wwZUF67jOcbctdvOeQJlmypH+0OA==
X-Received: by 2002:a17:902:7143:b0:14a:62ed:c2a7 with SMTP id
 u3-20020a170902714300b0014a62edc2a7mr10898186plm.80.1642939261511; 
 Sun, 23 Jan 2022 04:01:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:01:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] KVM: PPC: Book3S Nested: Use explicit 4096 LPID maximum
Date: Sun, 23 Jan 2022 22:00:42 +1000
Message-Id: <20220123120043.3586018-6-npiggin@gmail.com>
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

Rather than tie this to KVMPPC_NR_LPIDS which is becoming more dynamic,
fix it to 4096 (12-bits) explicitly for now.

kvmhv_get_nested() does not have to check against KVM_MAX_NESTED_GUESTS
because the L1 partition table registration hcall already did that, and
it checks against the partition table size.

This patch also puts all the partition table size calculations into the
same form, using 12 for the architected size field shift and 4 for the
shift corresponding to the partition table entry size.

Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h |  7 ++++++-
 arch/powerpc/kvm/book3s_64_mmu_hv.c |  2 +-
 arch/powerpc/kvm/book3s_hv_nested.c | 24 +++++++++++-------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 5fd0564e5c94..e6fb03884dcc 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -34,7 +34,12 @@
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 #include <asm/kvm_book3s_asm.h>		/* for MAX_SMT_THREADS */
 #define KVM_MAX_VCPU_IDS	(MAX_SMT_THREADS * KVM_MAX_VCORES)
-#define KVM_MAX_NESTED_GUESTS	KVMPPC_NR_LPIDS
+
+/*
+ * Limit the nested partition table to 4096 entries (because that's what
+ * hardware supports). Both guest and host use this value.
+ */
+#define KVM_MAX_NESTED_GUESTS_SHIFT	12
 
 #else
 #define KVM_MAX_VCPU_IDS	KVM_MAX_VCPUS
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 5be92d5bc099..f983fb36cbf2 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -266,7 +266,7 @@ int kvmppc_mmu_hv_init(void)
 			return -EINVAL;
 		nr_lpids = 1UL << mmu_lpid_bits;
 	} else {
-		nr_lpids = KVM_MAX_NESTED_GUESTS;
+		nr_lpids = 1UL << KVM_MAX_NESTED_GUESTS_SHIFT;
 	}
 
 	if (nr_lpids > KVMPPC_NR_LPIDS)
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 1eff969b095c..75169e0753ce 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -439,10 +439,11 @@ long kvmhv_nested_init(void)
 	if (!radix_enabled())
 		return -ENODEV;
 
-	/* find log base 2 of KVMPPC_NR_LPIDS, rounding up */
-	ptb_order = __ilog2(KVMPPC_NR_LPIDS - 1) + 1;
-	if (ptb_order < 8)
-		ptb_order = 8;
+	/* Partition table entry is 1<<4 bytes in size, hence the 4. */
+	ptb_order = KVM_MAX_NESTED_GUESTS_SHIFT + 4;
+	/* Minimum partition table size is 1<<12 bytes */
+	if (ptb_order < 12)
+		ptb_order = 12;
 	pseries_partition_tb = kmalloc(sizeof(struct patb_entry) << ptb_order,
 				       GFP_KERNEL);
 	if (!pseries_partition_tb) {
@@ -450,7 +451,7 @@ long kvmhv_nested_init(void)
 		return -ENOMEM;
 	}
 
-	ptcr = __pa(pseries_partition_tb) | (ptb_order - 8);
+	ptcr = __pa(pseries_partition_tb) | (ptb_order - 12);
 	rc = plpar_hcall_norets(H_SET_PARTITION_TABLE, ptcr);
 	if (rc != H_SUCCESS) {
 		pr_err("kvm-hv: Parent hypervisor does not support nesting (rc=%ld)\n",
@@ -534,16 +535,14 @@ long kvmhv_set_partition_table(struct kvm_vcpu *vcpu)
 	long ret = H_SUCCESS;
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	/*
-	 * Limit the partition table to 4096 entries (because that's what
-	 * hardware supports), and check the base address.
-	 */
-	if ((ptcr & PRTS_MASK) > 12 - 8 ||
+	/* Check partition size and base address. */
+	if ((ptcr & PRTS_MASK) + 12 - 4 > KVM_MAX_NESTED_GUESTS_SHIFT ||
 	    !kvm_is_visible_gfn(vcpu->kvm, (ptcr & PRTB_MASK) >> PAGE_SHIFT))
 		ret = H_PARAMETER;
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	if (ret == H_SUCCESS)
 		kvm->arch.l1_ptcr = ptcr;
+
 	return ret;
 }
 
@@ -639,7 +638,7 @@ static void kvmhv_update_ptbl_cache(struct kvm_nested_guest *gp)
 
 	ret = -EFAULT;
 	ptbl_addr = (kvm->arch.l1_ptcr & PRTB_MASK) + (gp->l1_lpid << 4);
-	if (gp->l1_lpid < (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 8))) {
+	if (gp->l1_lpid < (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 12 - 4))) {
 		int srcu_idx = srcu_read_lock(&kvm->srcu);
 		ret = kvm_read_guest(kvm, ptbl_addr,
 				     &ptbl_entry, sizeof(ptbl_entry));
@@ -809,8 +808,7 @@ struct kvm_nested_guest *kvmhv_get_nested(struct kvm *kvm, int l1_lpid,
 {
 	struct kvm_nested_guest *gp, *newgp;
 
-	if (l1_lpid >= KVM_MAX_NESTED_GUESTS ||
-	    l1_lpid >= (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 12 - 4)))
+	if (l1_lpid >= (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 12 - 4)))
 		return NULL;
 
 	spin_lock(&kvm->mmu_lock);
-- 
2.23.0

