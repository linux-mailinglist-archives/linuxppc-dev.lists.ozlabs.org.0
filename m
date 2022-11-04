Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3E6191B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 08:18:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3X6V28T3z3dsK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:18:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BBZsjNO1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BBZsjNO1;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3X5Z40Xzz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 18:17:53 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id u6so4089493plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W23pabEUt9UT3m96J/wXQrFDRtY2GakEItww0qjsSlg=;
        b=BBZsjNO1j2I9XyaCh+1C/QplBxwDB5vhB+H7e4gqHEmyQuF09JOrwCCVKtCrWle/V9
         chEyO5+47qEl+CAwKw4HczIJoOXA4u45YQ4pFc+tm1m/PYd7/pDyPWWmGXcEaYOG5WOG
         km826IeGruUsR1J8w/qHNbzrKwDEGoOOeidLlN+lT1AI7WAXrqVt3wu+X7a7S3qChiiQ
         +PoxgUS5+oRknQ7tcAC7hLCL+ws/LhR0FvDQv4v+gajs4KG64mX3ZIq6NdgF0X7pw0TH
         Nqp2Puq0UKysdQS/Q19gKjy2epUVXKYiN5tLrpvE0wCKlIsupCTYYxKngeigPBT/YDAE
         4rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W23pabEUt9UT3m96J/wXQrFDRtY2GakEItww0qjsSlg=;
        b=hOgStiEH+2sOWhet7uTHF5mIYB9hc1YWXMIhSbRWeyNhKFI3liSlzCgSOD3JfFDyT2
         bN60VL9YSflfXK+VTKIA/A7oyxLIoLvmrgq2LfEivj1T+JH4yHQUm16Ga8jVli8OsWVS
         2Rb1rbaW8AzaDZI/vgVrnXMJI822YBAjZsFu7Gwc+z9Z66G7TFzUEgFY8NT/5Qx+SrT3
         Kn80/vIgUa8lqBCWCfm7zuTF5kd9CryjGbgDyojP19ajM+9YvcucpgYosLDpvawscTD7
         Wy7ai/ADxp7+lntNZNWW/uny5jJzgSI1BhGxZWR9NW99FwR459woR9NnHLtlRc7uMuYd
         890g==
X-Gm-Message-State: ACrzQf0tS1fqlB7jPba3PXnkFkUCcQdcLkuZ9A+HaR2pXxru0KoTVc10
	xMKUuw1Rgt/9mKZvN6mhEiU=
X-Google-Smtp-Source: AMsMyM590YqBBuU8ntwjS0byOPhDdbEQtOmQylRukKVmf0RiQ9hBMt6zvQhScFlRTTpMvabF9XrhuA==
X-Received: by 2002:a17:902:6542:b0:187:27fa:eef1 with SMTP id d2-20020a170902654200b0018727faeef1mr22696721pln.2.1667546271367;
        Fri, 04 Nov 2022 00:17:51 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id m5-20020a170902db0500b001708c4ebbaesm1787361plx.309.2022.11.04.00.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 00:17:50 -0700 (PDT)
Date: Fri, 4 Nov 2022 00:17:49 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <20221104071749.GC1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, isaku.yamahata@gmail.com, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas
  <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 11:18:27PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> Non-x86 folks, please test on hardware when possible.  I made a _lot_ of
> mistakes when moving code around.  Thankfully, x86 was the trickiest code
> to deal with, and I'm fairly confident that I found all the bugs I
> introduced via testing.  But the number of mistakes I made and found on
> x86 makes me more than a bit worried that I screwed something up in other
> arch code.
> 
> This is a continuation of Chao's series to do x86 CPU compatibility checks
> during virtualization hardware enabling[1], and of Isaku's series to try
> and clean up the hardware enabling paths so that x86 (Intel specifically)
> can temporarily enable hardware during module initialization without
> causing undue pain for other architectures[2].  It also includes one patch
> from another mini-series from Isaku that provides the less controversial
> patches[3].
> 
> The main theme of this series is to kill off kvm_arch_init(),
> kvm_arch_hardware_(un)setup(), and kvm_arch_check_processor_compat(), which
> all originated in x86 code from way back when, and needlessly complicate
> both common KVM code and architecture code.  E.g. many architectures don't
> mark functions/data as __init/__ro_after_init purely because kvm_init()
> isn't marked __init to support x86's separate vendor modules.
> 
> The idea/hope is that with those hooks gone (moved to arch code), it will
> be easier for x86 (and other architectures) to modify their module init
> sequences as needed without having to fight common KVM code.  E.g. I'm
> hoping that ARM can build on this to simplify its hardware enabling logic,
> especially the pKVM side of things.
> 
> There are bug fixes throughout this series.  They are more scattered than
> I would usually prefer, but getting the sequencing correct was a gigantic
> pain for many of the x86 fixes due to needing to fix common code in order
> for the x86 fix to have any meaning.  And while the bugs are often fatal,
> they aren't all that interesting for most users as they either require a
> malicious admin or broken hardware, i.e. aren't likely to be encountered
> by the vast majority of KVM users.  So unless someone _really_ wants a
> particular fix isolated for backporting, I'm not planning on shuffling
> patches.
> 
> Tested on x86.  Lightly tested on arm64.  Compile tested only on all other
> architectures.

Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
Since cpu offline needs to be rejected in some cases(To keep at least one cpu
on a package), arch hook for cpu offline is needed.
I can keep it in TDX KVM patch series.

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 23c0f4bc63f1..ef7bcb845d42 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -17,6 +17,7 @@ BUILD_BUG_ON(1)
 KVM_X86_OP(hardware_enable)
 KVM_X86_OP(hardware_disable)
 KVM_X86_OP(hardware_unsetup)
+KVM_X86_OP_OPTIONAL_RET0(offline_cpu)
 KVM_X86_OP(has_emulated_msr)
 KVM_X86_OP(vcpu_after_set_cpuid)
 KVM_X86_OP(is_vm_type_supported)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 496c7c6eaff9..c420409aa96f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1468,6 +1468,7 @@ struct kvm_x86_ops {
 	int (*hardware_enable)(void);
 	void (*hardware_disable)(void);
 	void (*hardware_unsetup)(void);
+	int (*offline_cpu)(void);
 	bool (*has_emulated_msr)(struct kvm *kvm, u32 index);
 	void (*vcpu_after_set_cpuid)(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2ed5a017f7bc..17c5d6a76c93 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12039,6 +12039,11 @@ void kvm_arch_hardware_disable(void)
 	drop_user_return_notifiers();
 }
 
+int kvm_arch_offline_cpu(unsigned int cpu)
+{
+	return static_call(kvm_x86_offline_cpu)();
+}
+
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
 {
 	return vcpu->kvm->arch.bsp_vcpu_id == vcpu->vcpu_id;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 620489b9aa93..4df79443fd11 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1460,6 +1460,7 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
 #endif
+int kvm_arch_offline_cpu(unsigned int cpu);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f6b6dcedaa0a..f770fdc662d0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5396,16 +5396,24 @@ static void hardware_disable_nolock(void *junk)
 	__this_cpu_write(hardware_enabled, false);
 }
 
+__weak int kvm_arch_offline_cpu(unsigned int cpu)
+{
+	return 0;
+}
+
 static int kvm_offline_cpu(unsigned int cpu)
 {
+	int r = 0;
+
 	mutex_lock(&kvm_lock);
-	if (kvm_usage_count) {
+	r = kvm_arch_offline_cpu(cpu);
+	if (!r && kvm_usage_count) {
 		preempt_disable();
 		hardware_disable_nolock(NULL);
 		preempt_enable();
 	}
 	mutex_unlock(&kvm_lock);
-	return 0;
+	return r;
 }
 
 static void hardware_disable_all_nolock(void)

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
