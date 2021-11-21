Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2034583B1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 14:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hxr9y4Shpz3dl4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 00:00:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JD9cQyYl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=desiato.srs.infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=batv+485698b98e86d7fb73c6+6664+infradead.org+dwmw2@desiato.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=JD9cQyYl; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hxr4G2fR8z2yP0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 23:55:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=G37/BXwBbO12qoWQX4NnszYh9zVH3UVeyBIJn+2R4aE=; b=JD9cQyYlj+W5TB6WMpsgkdF1A3
 lckDprksXoBNRjXhASB/77BiS5aIQMdJsqFZAM2r2V50z/AxsKbwPrH1068TV0RnchaLQrnzToD91
 M60FWV/dEiuXe+jPs9vHPU8j0LHQCIL8QLO12sWstP+R+TkFi3jVusg4+izng5PA5uhgUGdYD0Tun
 /PJtQGs/UgmdJ67BWKd9m1JI0R40I66od2U4SDlu9kyBveyZI/eZLbf02yIorr10DC7Am7C0KX3q4
 NJa8QlqM2dw89VT3gFnRWHs5whZXWS598sT3cLBv1CFA2ieI1sIyNhm/ad4OKba5de8DJjP667znA
 RKYPPrhQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1momMx-00HIgM-AJ; Sun, 21 Nov 2021 12:54:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1momMw-0002XY-VB; Sun, 21 Nov 2021 12:54:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH v5 11/12] KVM: x86: Fix wall clock writes in Xen shared_info
 not to mark page dirty
Date: Sun, 21 Nov 2021 12:54:50 +0000
Message-Id: <20211121125451.9489-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211121125451.9489-1-dwmw2@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Woodhouse <dwmw@amazon.co.uk>

When dirty ring logging is enabled, any dirty logging without an active
vCPU context will cause a kernel oops. But we've already declared that
the shared_info page doesn't get dirty tracking anyway, since it would
be kind of insane to mark it dirty every time we deliver an event channel
interrupt. Userspace is supposed to just assume it's always dirty any
time a vCPU can run or event channels are routed.

So stop using the generic kvm_write_wall_clock() and just write directly
through the gfn_to_pfn_cache that we already have set up.

We can make kvm_write_wall_clock() static in x86.c again now, but let's
not remove the 'sec_hi_ofs' argument even though it's not used yet. At
some point we *will* want to use that for KVM guests too.

Fixes: 629b5348841a ("KVM: x86/xen: update wallclock region")
Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c |  2 +-
 arch/x86/kvm/x86.h |  1 -
 arch/x86/kvm/xen.c | 62 +++++++++++++++++++++++++++++++++++-----------
 3 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fa56c590d8db..6cb022d0afab 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2118,7 +2118,7 @@ static s64 get_kvmclock_base_ns(void)
 }
 #endif
 
-void kvm_write_wall_clock(struct kvm *kvm, gpa_t wall_clock, int sec_hi_ofs)
+static void kvm_write_wall_clock(struct kvm *kvm, gpa_t wall_clock, int sec_hi_ofs)
 {
 	int version;
 	int r;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 997669ae9caa..0260836b42ff 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -306,7 +306,6 @@ static inline bool kvm_vcpu_latch_init(struct kvm_vcpu *vcpu)
 	return is_smm(vcpu) || static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
 }
 
-void kvm_write_wall_clock(struct kvm *kvm, gpa_t wall_clock, int sec_hi_ofs);
 void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip);
 
 u64 get_kvmclock_ns(struct kvm *kvm);
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index ceddabd1f5c6..0e3f7d6e9fd7 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -25,8 +25,11 @@ DEFINE_STATIC_KEY_DEFERRED_FALSE(kvm_xen_enabled, HZ);
 static int kvm_xen_shared_info_init(struct kvm *kvm, gfn_t gfn)
 {
 	struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
+	struct pvclock_wall_clock *wc;
 	gpa_t gpa = gfn_to_gpa(gfn);
-	int wc_ofs, sec_hi_ofs;
+	u32 *wc_sec_hi;
+	u32 wc_version;
+	u64 wall_nsec;
 	int ret = 0;
 	int idx = srcu_read_lock(&kvm->srcu);
 
@@ -35,32 +38,63 @@ static int kvm_xen_shared_info_init(struct kvm *kvm, gfn_t gfn)
 		goto out;
 	}
 
-	ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true, gpa,
-					PAGE_SIZE, false);
-	if (ret)
-		goto out;
+	do {
+		ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true,
+						gpa, PAGE_SIZE, false);
+		if (ret)
+			goto out;
+
+		/*
+		 * This code mirrors kvm_write_wall_clock() except that it writes
+		 * directly through the pfn cache and doesn't mark the page dirty.
+		 */
+		wall_nsec = ktime_get_real_ns() - get_kvmclock_ns(kvm);
+
+		/* It could be invalid again already, so we need to check */
+		read_lock_irq(&gpc->lock);
+
+		if (gpc->valid)
+			break;
+
+		read_unlock_irq(&gpc->lock);
+	} while (1);
 
 	/* Paranoia checks on the 32-bit struct layout */
 	BUILD_BUG_ON(offsetof(struct compat_shared_info, wc) != 0x900);
 	BUILD_BUG_ON(offsetof(struct compat_shared_info, arch.wc_sec_hi) != 0x924);
 	BUILD_BUG_ON(offsetof(struct pvclock_vcpu_time_info, version) != 0);
 
-	/* 32-bit location by default */
-	wc_ofs = offsetof(struct compat_shared_info, wc);
-	sec_hi_ofs = offsetof(struct compat_shared_info, arch.wc_sec_hi);
-
 #ifdef CONFIG_X86_64
 	/* Paranoia checks on the 64-bit struct layout */
 	BUILD_BUG_ON(offsetof(struct shared_info, wc) != 0xc00);
 	BUILD_BUG_ON(offsetof(struct shared_info, wc_sec_hi) != 0xc0c);
 
-	if (kvm->arch.xen.long_mode) {
-		wc_ofs = offsetof(struct shared_info, wc);
-		sec_hi_ofs = offsetof(struct shared_info, wc_sec_hi);
-	}
+	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
+		struct shared_info *shinfo = gpc->khva;
+
+		wc_sec_hi = &shinfo->wc_sec_hi;
+		wc = &shinfo->wc;
+	} else
 #endif
+	{
+		struct compat_shared_info *shinfo = gpc->khva;
+
+		wc_sec_hi = &shinfo->arch.wc_sec_hi;
+		wc = &shinfo->wc;
+	}
+
+	/* Increment and ensure an odd value */
+	wc_version = wc->version = (wc->version + 1) | 1;
+	smp_wmb();
+
+	wc->nsec = do_div(wall_nsec,  1000000000);
+	wc->sec = (u32)wall_nsec;
+	*wc_sec_hi = wall_nsec >> 32;
+	smp_wmb();
+
+	wc->version = wc_version + 1;
+	read_unlock_irq(&gpc->lock);
 
-	kvm_write_wall_clock(kvm, gpa + wc_ofs, sec_hi_ofs - wc_ofs);
 	kvm_make_all_cpus_request(kvm, KVM_REQ_MASTERCLOCK_UPDATE);
 
 out:
-- 
2.31.1

