Return-Path: <linuxppc-dev+bounces-5042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D75A09F1F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:15:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJtt14yWz3cyf;
	Sat, 11 Jan 2025 11:15:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534497;
	cv=none; b=DezC7xw0W1xR1TU88LaXS03Y2F5Drve+Bpjd8CO6USifUl+ITZPf+ofpUhC1KwppNc5Aqli+gx98leluzAzhH3WFQ7C28zQmOeOflCKJhucdrDbf2XVDPfA+jcHtFIgZFBfHTufUtd3c1XossZ/VNa34qMjsAKvl+iBxDqNuVGn8WWeJV2xp8GNm03NDx3pN71KzL9LSRN6rqd6NYdio/ChsZiyFGSJqbJ3DRHY75zOOPUNv7IkClid8pGST2zgMAQeKcVm6XSIiZRkgFI8vi1QgaEibJPCMw603V4hDVu2YN1uHbNFuP/cOsgLiDGj9dAvAimVeu41F+EwqeFzAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534497; c=relaxed/relaxed;
	bh=0rBDGQyJzQ3zE+AnCN6b+fGLld6jYpPH9L4MwLLlvpM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EIUGlhVsy0vb9pWJ2tl/UtnwA4lrqxM6/GisHMUpNd3DcBMaOg1ApzkHWL7Nzdp9Za2gl2zysmE3NxbDkSa36Sizk0pzvwgo6mH1wlEn/g1dbyS0y/0/Cc+qKgPW9Vk+pFdeyViYPQa9wSowrZhJ0ShKjRyH97JXkRKgyEbRq76mA8PuzoWZRMS8lHusaadlGm5Q0VxGNHD9Nkj3dlmCpb0zEBsEctSzgGZ3i02JGFS/MTLW4rA1CK8PzpdDcSPOYwqfoubCrJZtVODvl4f1VKCmKfvpCpHPU9oIXeit62AE4P3TjppXZhdQV1+vnz/OFB1aAMz+9EKUhHBWMLTPJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uFhTgKXY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=33gmbzwgkdpcizbjlzmafnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uFhTgKXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=33gmbzwgkdpcizbjlzmafnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9V80Hyyz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:36 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43625ceae52so12794515e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534493; x=1737139293; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rBDGQyJzQ3zE+AnCN6b+fGLld6jYpPH9L4MwLLlvpM=;
        b=uFhTgKXYCMwmJ0oFb4yDzOovBXEmIxsNFF4SiNylZi3N3G8lAO88lOdJvu3mVVY2Uq
         Cy2J2XvhteP3cSaizx/zYS2ydz0vaMQwLE+zZqqJaGikkBv1VTNVl/eZKBgkj9tvr1rT
         ZzDr+x1vsDvyqOTQz4wXZrEe+4UhPzf1tGid0OQREcAoB1g+wjCgeeKc8bsjdyBZG2Rp
         2a5zdN8CNnH1oIjCN2R2PUivnKfmBQtawhirB/uuDYwqh+EeWoMyQ5vMf2vPplYCdScS
         VTjA5pMfxDdVvq+LiSnVmmwks/F8hDGPvvFuY95qlI4WQ5+t7yym6I5mT6NJfhnk9Gf4
         +T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534493; x=1737139293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rBDGQyJzQ3zE+AnCN6b+fGLld6jYpPH9L4MwLLlvpM=;
        b=jPBp6SQv6bL66Eyj7L+FFYjOvwBJCj0d6pJC3tXO3to0CiBc606lQllgkMILsoq0Sn
         SjDzKixyPZXm6bWZoP1ckWZkTQe3CIuT3rzntBJm3THJSEotINJ2CoBp9iS2u9c26auT
         EU1BeZ74MfkP6H6KmmcSlR+03Qo6HVFfE1J2i3HQBdUOjib/yANk0nfab7Tyl6ET8eEg
         50lK83Y+XBCjUtCxOd9mSzP3IWc065YgZ1d0B305rc6jzipabbnHMqyGnFiG2Sr7m3kX
         4BMyMsw/zcGEBIcsufWulqPC82kc0CZxObzsWv+Uc6krWq+KjDMnPXn4EXfL8njsj1EF
         wfRw==
X-Forwarded-Encrypted: i=1; AJvYcCX1qg8CvJdjbUByIri5yxXm0rK3KlVmaodv9X0aGj+cNDbsVh2DulrbmlF8OYxofyh66di+xfjA2qY+skQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzzy5FaEIsnlr0l5YedeNeT+yYp8AmoE0DlD+gCG9SunkuyuBzZ
	alUco+c4TmiE8nQE8P1fEuv8eK7x0MBML6tH8WFyV0QbsGIrUsnZzOz+VN1f3exbb85p21defKx
	Yk51wj2XNgQ==
X-Google-Smtp-Source: AGHT+IGSdZ2gZJ+03Djx+zc677EB8kBOQn6jxeBFpWfFWpyM+wf7VvlfzHG8+toKsNSgpgcgyJMUn+Q1Gcn1Dw==
X-Received: from wmbfc10.prod.google.com ([2002:a05:600c:524a:b0:434:e9fe:f913])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba4:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-436e26f4805mr96359685e9.24.1736534492849;
 Fri, 10 Jan 2025 10:41:32 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:47 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
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
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-21-8419288bc805@google.com>
Subject: [PATCH RFC v2 21/29] KVM: x86: asi: Restricted address space for VM execution
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

An ASI restricted address space is added for KVM. This protects the
userspace from attack by the guest, and the guest from attack by other
processes. It doesn't attempt to prevent the guest from attack by the
current process.

This change incorporates an extra asi_exit at the end of vcpu_run. We
expect later iterations of ASI to drop that call as we gain the
ability to context switch within the ASI domain.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 ++
 arch/x86/kvm/svm/svm.c          |  2 ++
 arch/x86/kvm/vmx/vmx.c          | 38 ++++++++++++--------
 arch/x86/kvm/x86.c              | 77 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 105 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6d9f763a7bb9d5db422ea5625b2c28420bd14f26..00cda452dd6ca6ec57ff85ca194ee4aeb6af3be7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -37,6 +37,7 @@
 #include <asm/kvm_vcpu_regs.h>
 #include <asm/hyperv-tlfs.h>
 #include <asm/reboot.h>
+#include <asm/asi.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
 
@@ -1535,6 +1536,8 @@ struct kvm_arch {
 	 */
 #define SPLIT_DESC_CACHE_MIN_NR_OBJECTS (SPTE_ENT_PER_PAGE + 1)
 	struct kvm_mmu_memory_cache split_desc_cache;
+
+	struct asi *asi;
 };
 
 struct kvm_vm_stat {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9df3e1e5ae81a1346409632edd693cb7e0740f72..f2c3154292b4f6c960b490b0773f53bea43897bb 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4186,6 +4186,7 @@ static noinstr void svm_vcpu_enter_exit(struct kvm_vcpu *vcpu, bool spec_ctrl_in
 	guest_state_enter_irqoff();
 
 	amd_clear_divider();
+	asi_enter(vcpu->kvm->arch.asi);
 
 	if (sev_es_guest(vcpu->kvm))
 		__svm_sev_es_vcpu_run(svm, spec_ctrl_intercepted,
@@ -4193,6 +4194,7 @@ static noinstr void svm_vcpu_enter_exit(struct kvm_vcpu *vcpu, bool spec_ctrl_in
 	else
 		__svm_vcpu_run(svm, spec_ctrl_intercepted);
 
+	asi_relax();
 	guest_state_exit_irqoff();
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d28618e9277ede83ad2edc1b1778ea44123aa797..181d230b1c057fed33f7b29b7b0e378dbdfeb174 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -49,6 +49,7 @@
 #include <asm/mwait.h>
 #include <asm/spec-ctrl.h>
 #include <asm/vmx.h>
+#include <asm/asi.h>
 
 #include <trace/events/ipi.h>
 
@@ -7282,14 +7283,34 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 					unsigned int flags)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned long cr3;
 
 	guest_state_enter_irqoff();
+	asi_enter(vcpu->kvm->arch.asi);
+
+	/*
+	 * Refresh vmcs.HOST_CR3 if necessary.  This must be done immediately
+	 * prior to VM-Enter, as the kernel may load a new ASID (PCID) any time
+	 * it switches back to the current->mm, which can occur in KVM context
+	 * when switching to a temporary mm to patch kernel code, e.g. if KVM
+	 * toggles a static key while handling a VM-Exit.
+	 * Also, this must be done after asi_enter(), as it changes CR3
+	 * when switching address spaces.
+	 */
+	cr3 = __get_current_cr3_fast();
+	if (unlikely(cr3 != vmx->loaded_vmcs->host_state.cr3)) {
+		vmcs_writel(HOST_CR3, cr3);
+		vmx->loaded_vmcs->host_state.cr3 = cr3;
+	}
 
 	/*
 	 * L1D Flush includes CPU buffer clear to mitigate MDS, but VERW
 	 * mitigation for MDS is done late in VMentry and is still
 	 * executed in spite of L1D Flush. This is because an extra VERW
 	 * should not matter much after the big hammer L1D Flush.
+	 *
+	 * This is only after asi_enter() for performance reasons.
+	 * RFC: This also needs to be integrated with ASI's tainting model.
 	 */
 	if (static_branch_unlikely(&vmx_l1d_should_flush))
 		vmx_l1d_flush(vcpu);
@@ -7310,6 +7331,8 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 
 	vmx->idt_vectoring_info = 0;
 
+	asi_relax();
+
 	vmx_enable_fb_clear(vmx);
 
 	if (unlikely(vmx->fail)) {
@@ -7338,7 +7361,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, bool force_immediate_exit)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned long cr3, cr4;
+	unsigned long cr4;
 
 	/* Record the guest's net vcpu time for enforced NMI injections. */
 	if (unlikely(!enable_vnmi &&
@@ -7381,19 +7404,6 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, bool force_immediate_exit)
 		vmcs_writel(GUEST_RIP, vcpu->arch.regs[VCPU_REGS_RIP]);
 	vcpu->arch.regs_dirty = 0;
 
-	/*
-	 * Refresh vmcs.HOST_CR3 if necessary.  This must be done immediately
-	 * prior to VM-Enter, as the kernel may load a new ASID (PCID) any time
-	 * it switches back to the current->mm, which can occur in KVM context
-	 * when switching to a temporary mm to patch kernel code, e.g. if KVM
-	 * toggles a static key while handling a VM-Exit.
-	 */
-	cr3 = __get_current_cr3_fast();
-	if (unlikely(cr3 != vmx->loaded_vmcs->host_state.cr3)) {
-		vmcs_writel(HOST_CR3, cr3);
-		vmx->loaded_vmcs->host_state.cr3 = cr3;
-	}
-
 	cr4 = cr4_read_shadow();
 	if (unlikely(cr4 != vmx->loaded_vmcs->host_state.cr4)) {
 		vmcs_writel(HOST_CR4, cr4);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 83fe0a78146fc198115aba0e76ba57ecfb1dd8d9..3e0811eb510650abc601e4adce1ce4189835a730 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -85,6 +85,7 @@
 #include <asm/emulate_prefix.h>
 #include <asm/sgx.h>
 #include <clocksource/hyperv_timer.h>
+#include <asm/asi.h>
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
@@ -9674,6 +9675,55 @@ static void kvm_x86_check_cpu_compat(void *ret)
 	*(int *)ret = kvm_x86_check_processor_compatibility();
 }
 
+#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
+static inline int kvm_x86_init_asi_class(void)
+{
+	static struct asi_taint_policy policy = {
+		/*
+		 * Prevent going to the guest with sensitive data potentially
+		 * left in sidechannels by code running in the unrestricted
+		 * address space, or another MM.
+		 */
+		.protect_data =  ASI_TAINT_KERNEL_DATA | ASI_TAINT_OTHER_MM_DATA,
+		/*
+		 * Prevent going to the guest with branch predictor state
+		 * influenced by other processes. Note this bit is about
+		 * protecting the guest from other parts of the system, while
+		 * data_taints is about protecting other parts of the system
+		 * from the guest.
+		 */
+		.prevent_control = ASI_TAINT_OTHER_MM_CONTROL,
+		.set = ASI_TAINT_GUEST_DATA,
+	};
+
+	/*
+	 * Inform ASI that the guest will gain control of the branch predictor,
+	 * unless we're just unconditionally blasting it after VM Exit.
+	 *
+	 * RFC: This is a bit simplified - on some configurations we could avoid
+	 * a duplicated RSB-fill if we had a separate taint specifically for the
+	 * RSB.
+	 */
+	if (!cpu_feature_enabled(X86_FEATURE_IBPB_ON_VMEXIT) ||
+	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) ||
+	    !cpu_feature_enabled(X86_FEATURE_RSB_VMEXIT))
+		policy.set = ASI_TAINT_GUEST_CONTROL;
+
+	/*
+	 * And the same for data left behind by code in the userspace domain
+	 * (i.e. the VMM itself, plus kernel code serving its syscalls etc).
+	 * This should eventually be configurable: users whose VMMs contain
+	 * no secrets can disable it to avoid paying a mitigation cost on
+	 * transition between their guest and userspace.
+	 */
+	policy.protect_data |= ASI_TAINT_USER_DATA;
+
+	return asi_init_class(ASI_CLASS_KVM, &policy);
+}
+#else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
+static inline int kvm_x86_init_asi_class(void) { return 0; }
+#endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
+
 int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
 	u64 host_pat;
@@ -9737,6 +9787,10 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kvm_caps.supported_vm_types = BIT(KVM_X86_DEFAULT_VM);
 	kvm_caps.supported_mce_cap = MCG_CTL_P | MCG_SER_P;
 
+	r = kvm_x86_init_asi_class();
+	if (r < 0)
+		goto out_mmu_exit;
+
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		kvm_host.xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		kvm_caps.supported_xcr0 = kvm_host.xcr0 & KVM_SUPPORTED_XCR0;
@@ -9754,7 +9808,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 
 	r = ops->hardware_setup();
 	if (r != 0)
-		goto out_mmu_exit;
+		goto out_asi_uninit;
 
 	kvm_ops_update(ops);
 
@@ -9810,6 +9864,8 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 out_unwind_ops:
 	kvm_x86_ops.enable_virtualization_cpu = NULL;
 	kvm_x86_call(hardware_unsetup)();
+out_asi_uninit:
+	asi_uninit_class(ASI_CLASS_KVM);
 out_mmu_exit:
 	kvm_mmu_vendor_module_exit();
 out_free_percpu:
@@ -9841,6 +9897,7 @@ void kvm_x86_vendor_exit(void)
 	cancel_work_sync(&pvclock_gtod_work);
 #endif
 	kvm_x86_call(hardware_unsetup)();
+	asi_uninit_class(ASI_CLASS_KVM);
 	kvm_mmu_vendor_module_exit();
 	free_percpu(user_return_msrs);
 	kmem_cache_destroy(x86_emulator_cache);
@@ -11574,6 +11631,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	r = vcpu_run(vcpu);
 
+	/*
+	 * At present ASI doesn't have the capability to transition directly
+	 * from the restricted address space to the user address space. So we
+	 * just return to the unrestricted address space in between.
+	 */
+	asi_exit();
+
 out:
 	kvm_put_guest_fpu(vcpu);
 	if (kvm_run->kvm_valid_regs)
@@ -12705,6 +12769,14 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		goto out_uninit_mmu;
 
+	ret = asi_init(kvm->mm, ASI_CLASS_KVM, &kvm->arch.asi);
+	if (ret)
+		goto out_uninit_mmu;
+
+	ret = static_call(kvm_x86_vm_init)(kvm);
+	if (ret)
+		goto out_asi_destroy;
+
 	INIT_HLIST_HEAD(&kvm->arch.mask_notifier_list);
 	atomic_set(&kvm->arch.noncoherent_dma_count, 0);
 
@@ -12742,6 +12814,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	return 0;
 
+out_asi_destroy:
+	asi_destroy(kvm->arch.asi);
 out_uninit_mmu:
 	kvm_mmu_uninit_vm(kvm);
 	kvm_page_track_cleanup(kvm);
@@ -12883,6 +12957,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_destroy_vcpus(kvm);
 	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
 	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
+	asi_destroy(kvm->arch.asi);
 	kvm_mmu_uninit_vm(kvm);
 	kvm_page_track_cleanup(kvm);
 	kvm_xen_destroy_vm(kvm);

-- 
2.47.1.613.gc27f4b7a9f-goog


