Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68972353A8E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCX46hk9z30Jb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:20:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=th0OZH/9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=th0OZH/9; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWc4g3zz2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:11 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id m11so4564796pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4shQOl+Q9zLkUpe6/3smaSERBWGUCH93NF6hRCaZmCU=;
 b=th0OZH/9x9mShOnc54csEq70tg6C1O4x7QUndQFrobPuPB1XdjNcROTl884w3SFCF0
 pEfgxzwbdtPcQw6EsAuxqBdltNE71PnIOknAKMUwuR0kF5SutUr9HKwbddt+oLzcYsNq
 qW3hk6O+vxR1oiMFXsgUvaiBcjtgbOBtHRjRCYKef5pelovd99K9v1b9JoPZfuegsW2T
 7ffyNNQEwO98vYeqIZ97a10hg+MEWOyd9D6WPmimwyS0QaVe9wN6+Zs3gBhPiOuQOO5X
 gxpNzZZMbriLyHlK26p69QIQQjrJ3DaydBbDlVL57/AYrMEIjWRtqeUgxA+fewcD9Cae
 LDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4shQOl+Q9zLkUpe6/3smaSERBWGUCH93NF6hRCaZmCU=;
 b=guHh9Hyyfl5UgZCXEGyyjdsA0Yuek2T2XjFZqapNDCmc2dscnqgNGuvo4UvXO0qB2v
 9HClfD35zWZGlSBiz4QyjaIoACwJHMkgjmuSjkOLN+H+eA2j9ZNRrvdZw9jikbGSQCin
 M0YA47o0fiNB+/CaUXcaeMX/Vt907mUea4kqvI1HnW/5dyWxGjmM1n3B+To49fyXYjzj
 ZCU9rNioUSi6BqTtGkBjdPcwMF8tZEaMjf23scXmXOR5gm82S20Cei7isMIzZ7Bfz8sm
 fhzJ2nR5cC7Fq6LxKP0xr1/tOldI5u2WCgfY0wYXLE/OxKMT0Mo9gg1n8UsihfY11Psc
 VkbQ==
X-Gm-Message-State: AOAM5300LXNDq5LCTHHSkgPy0V9CgCYXm1aX4qwHQZ0bMWbS9/TrDB4y
 WLKdWGl9hWBNN/2QFnxg0HjVLxK5aH75Cw==
X-Google-Smtp-Source: ABdhPJycHBq9I5qXlQdZhewoKKU+807zBbgRSx1anlvMLsekt0HZUWdJq7ZyxFLIxrgsXXFajVneNA==
X-Received: by 2002:a63:2507:: with SMTP id l7mr21149858pgl.198.1617585606814; 
 Sun, 04 Apr 2021 18:20:06 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 02/48] KVM: PPC: Book3S HV: Add a function to filter guest
 LPCR bits
Date: Mon,  5 Apr 2021 11:19:02 +1000
Message-Id: <20210405011948.675354-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guest LPCR depends on hardware type, and future changes will add
restrictions based on errata and guest MMU mode. Move this logic
to a common function and use it for the cases where the guest
wants to update its LPCR (or the LPCR of a nested guest).

This also adds a warning in other places that set or update LPCR
if we try to set something that would have been disallowed by
the filter, as a sanity check.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s.h |  2 +
 arch/powerpc/kvm/book3s_hv.c          | 68 ++++++++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_nested.c   |  8 +++-
 3 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 2f5f919f6cd3..c58121508157 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -258,6 +258,8 @@ extern long kvmppc_hv_get_dirty_log_hpt(struct kvm *kvm,
 extern void kvmppc_harvest_vpa_dirty(struct kvmppc_vpa *vpa,
 			struct kvm_memory_slot *memslot,
 			unsigned long *map);
+extern unsigned long kvmppc_filter_lpcr_hv(struct kvm *kvm,
+			unsigned long lpcr);
 extern void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr,
 			unsigned long mask);
 extern void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 13bad6bf4c95..d2c7626cb960 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1635,6 +1635,35 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+/*
+ * Enforce limits on guest LPCR values based on hardware availability,
+ * guest configuration, and possibly hypervisor support and security
+ * concerns.
+ */
+unsigned long kvmppc_filter_lpcr_hv(struct kvm *kvm, unsigned long lpcr)
+{
+	/* On POWER8 and above, userspace can modify AIL */
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		lpcr &= ~LPCR_AIL;
+
+	/*
+	 * On POWER9, allow userspace to enable large decrementer for the
+	 * guest, whether or not the host has it enabled.
+	 */
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
+		lpcr &= ~LPCR_LD;
+
+	return lpcr;
+}
+
+static void verify_lpcr(struct kvm *kvm, unsigned long lpcr)
+{
+	if (lpcr != kvmppc_filter_lpcr_hv(kvm, lpcr)) {
+		WARN_ONCE(1, "lpcr 0x%lx differs from filtered 0x%lx\n",
+			  lpcr, kvmppc_filter_lpcr_hv(kvm, lpcr));
+	}
+}
+
 static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 		bool preserve_top32)
 {
@@ -1643,6 +1672,23 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 	u64 mask;
 
 	spin_lock(&vc->lock);
+
+	/*
+	 * Userspace can only modify
+	 * DPFD (default prefetch depth), ILE (interrupt little-endian),
+	 * TC (translation control), AIL (alternate interrupt location),
+	 * LD (large decrementer).
+	 * These are subject to restrictions from kvmppc_filter_lcpr_hv().
+	 */
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD;
+
+	/* Broken 32-bit version of LPCR must not clear top bits */
+	if (preserve_top32)
+		mask &= 0xFFFFFFFF;
+
+	new_lpcr = kvmppc_filter_lpcr_hv(kvm,
+			(vc->lpcr & ~mask) | (new_lpcr & mask));
+
 	/*
 	 * If ILE (interrupt little-endian) has changed, update the
 	 * MSR_LE bit in the intr_msr for each vcpu in this vcore.
@@ -1661,25 +1707,8 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 		}
 	}
 
-	/*
-	 * Userspace can only modify DPFD (default prefetch depth),
-	 * ILE (interrupt little-endian) and TC (translation control).
-	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt loc.).
-	 */
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC;
-	if (cpu_has_feature(CPU_FTR_ARCH_207S))
-		mask |= LPCR_AIL;
-	/*
-	 * On POWER9, allow userspace to enable large decrementer for the
-	 * guest, whether or not the host has it enabled.
-	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
-		mask |= LPCR_LD;
+	vc->lpcr = new_lpcr;
 
-	/* Broken 32-bit version of LPCR must not clear top bits */
-	if (preserve_top32)
-		mask &= 0xFFFFFFFF;
-	vc->lpcr = (vc->lpcr & ~mask) | (new_lpcr & mask);
 	spin_unlock(&vc->lock);
 }
 
@@ -4641,8 +4670,10 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
 		struct kvmppc_vcore *vc = kvm->arch.vcores[i];
 		if (!vc)
 			continue;
+
 		spin_lock(&vc->lock);
 		vc->lpcr = (vc->lpcr & ~mask) | lpcr;
+		verify_lpcr(kvm, vc->lpcr);
 		spin_unlock(&vc->lock);
 		if (++cores_done >= kvm->arch.online_vcores)
 			break;
@@ -4970,6 +5001,7 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		kvmppc_setup_partition_table(kvm);
 	}
 
+	verify_lpcr(kvm, lpcr);
 	kvm->arch.lpcr = lpcr;
 
 	/* Initialization for future HPT resizes */
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 3060e5deffc8..d14fe32f167b 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -151,7 +151,13 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	 */
 	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
 		LPCR_LPES | LPCR_MER;
-	hr->lpcr = (vc->lpcr & ~mask) | (hr->lpcr & mask);
+
+	/*
+	 * Additional filtering is required depending on hardware
+	 * and configuration.
+	 */
+	hr->lpcr = kvmppc_filter_lpcr_hv(vcpu->kvm,
+			(vc->lpcr & ~mask) | (hr->lpcr & mask));
 
 	/*
 	 * Don't let L1 enable features for L2 which we've disabled for L1,
-- 
2.23.0

