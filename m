Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1F63E55F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwGB4Djhz3fCX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:22:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZO3Ftedn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3x-khywykdm4cyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZO3Ftedn;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0B23Bjz3bbh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:01 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id l7-20020a170902f68700b001890d921b36so19021951plg.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MJave+Z+CqVOQlKYNh+9u1XLbNgTtvhVtL4XdeBXq3U=;
        b=ZO3Ftedng5ZXtAj1HLjLejIkXeEuGF++TCmzhSGUO/jffRhjc4H+xBEcj7yIeqEdat
         0U3Y+Ads6LzFvxNp27Uo8B2HMacUCZIv0pSE92rlIHxzWTi7f9KsRULC+bwhGX87ZVPR
         vnMRqpKsuzzrvEbFNarvM7whj/3tQRNLMCHwuLgw98CUXaVYGXJOn+GNNpcbHsAkPmeN
         tXU852Btu7ns0KpVR55ygwmLkYJEnvUvyvy5iEVsL5b//kXV7FWMRdutGQwiv7w9+h2Y
         WeYcLiKtjVQOAjeb0ZzTx4wnLQ7dUbOEoRqTrEQ9fS/dnvpncahogy2siy31VVqOiND3
         XFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJave+Z+CqVOQlKYNh+9u1XLbNgTtvhVtL4XdeBXq3U=;
        b=nvleldejDeV/htbE18tlU2Ak3rOTYeitQjkSfS8CX7rf1eu1OoRVDsZoku8MhAqoRA
         Qs8frPdn2SUy8/Whel7I7yamTxP/viMzWKpvJ6phhZIQHxjQNlozTTRsz0NE70W01H3X
         2uUjVobTbhLTbJHT0SORC5XUJGIaJcuLV/eE7bBZD6DogLUT0cVSA52eo8943XCvOiGw
         GcKa+nKmpZ1jvGRr2xnRLcb1ej1oGjMG1lNgX80/18eVWn42fs+XKeHqEWSfagkWSDgg
         5EyBk4GU7PYSJMNiM9Nw34Z9FSY4t+ZW8Vfx+oSNDBbs+0e8xi6KsfjijPimZ2CNG6wB
         9kfQ==
X-Gm-Message-State: ANoB5pmZGZ02ykSkgX3K3C0tVE4/3NT41DPycl17G/1ZgTf2qp+/610t
	ijTSuunvI98WJTi/2A9iIk4peGJIUdU=
X-Google-Smtp-Source: AA0mqf5OF5+sS7pzLlgqnJtqaKfzLdsx3EOQi2ZpWetSPzJEZYu9zjdDHGwAbdG5EGES6Cvu/KbnbnXMVFE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8090:0:b0:575:4e92:189e with SMTP id
 v16-20020aa78090000000b005754e92189emr14689428pff.59.1669849799328; Wed, 30
 Nov 2022 15:09:59 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:57 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-14-seanjc@google.com>
Subject: [PATCH v2 13/50] KVM: x86: Move guts of kvm_arch_init() to standalone helper
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the guts of kvm_arch_init() to a new helper, kvm_x86_vendor_init(),
so that VMX can do _all_ arch and vendor initialization before calling
kvm_init().  Calling kvm_init() must be the _very_ last step during init,
as kvm_init() exposes /dev/kvm to userspace, i.e. allows creating VMs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/svm/svm.c          | 23 +++++++++++++++++++++--
 arch/x86/kvm/vmx/vmx.c          | 21 +++++++++++++++------
 arch/x86/kvm/x86.c              | 15 +++++++++++++--
 4 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 70af7240a1d5..04a9ae66fb8d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1758,6 +1758,9 @@ extern struct kvm_x86_ops kvm_x86_ops;
 #define KVM_X86_OP_OPTIONAL_RET0 KVM_X86_OP
 #include <asm/kvm-x86-ops.h>
 
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops);
+void kvm_x86_vendor_exit(void);
+
 #define __KVM_HAVE_ARCH_VM_ALLOC
 static inline struct kvm *kvm_arch_alloc_vm(void)
 {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 91352d692845..19e81a99c58f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5091,15 +5091,34 @@ static struct kvm_x86_init_ops svm_init_ops __initdata = {
 
 static int __init svm_init(void)
 {
+	int r;
+
 	__unused_size_checks();
 
-	return kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
-			__alignof__(struct vcpu_svm), THIS_MODULE);
+	r = kvm_x86_vendor_init(&svm_init_ops);
+	if (r)
+		return r;
+
+	/*
+	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
+	 * exposed to userspace!
+	 */
+	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
+		     __alignof__(struct vcpu_svm), THIS_MODULE);
+	if (r)
+		goto err_kvm_init;
+
+	return 0;
+
+err_kvm_init:
+	kvm_x86_vendor_exit();
+	return r;
 }
 
 static void __exit svm_exit(void)
 {
 	kvm_exit();
+	kvm_x86_vendor_exit();
 }
 
 module_init(svm_init)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b8bf95b9710d..8e81cd94407d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8529,6 +8529,7 @@ static void vmx_exit(void)
 #endif
 
 	kvm_exit();
+	kvm_x86_vendor_exit();
 
 	vmx_cleanup_l1d_flush();
 
@@ -8546,23 +8547,25 @@ static int __init vmx_init(void)
 	 */
 	hv_init_evmcs();
 
+	r = kvm_x86_vendor_init(&vmx_init_ops);
+	if (r)
+		return r;
+
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
-		return r;
+		goto err_kvm_init;
 
 	/*
-	 * Must be called after kvm_init() so enable_ept is properly set
+	 * Must be called after common x86 init so enable_ept is properly set
 	 * up. Hand the parameter mitigation value in which was stored in
 	 * the pre module init parser. If no parameter was given, it will
 	 * contain 'auto' which will be turned into the default 'cond'
 	 * mitigation mode.
 	 */
 	r = vmx_setup_l1d_flush(vmentry_l1d_flush_param);
-	if (r) {
-		vmx_exit();
-		return r;
-	}
+	if (r)
+		goto err_l1d_flush;
 
 	vmx_setup_fb_clear_ctrl();
 
@@ -8587,5 +8590,11 @@ static int __init vmx_init(void)
 		allow_smaller_maxphyaddr = true;
 
 	return 0;
+
+err_l1d_flush:
+	vmx_exit();
+err_kvm_init:
+	kvm_x86_vendor_exit();
+	return r;
 }
 module_init(vmx_init);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 915d57c3b41d..b33932fca36e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9278,7 +9278,16 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 
 int kvm_arch_init(void *opaque)
 {
-	struct kvm_x86_init_ops *ops = opaque;
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+
+}
+
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
+{
 	u64 host_pat;
 	int r;
 
@@ -9410,8 +9419,9 @@ int kvm_arch_init(void *opaque)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
 
-void kvm_arch_exit(void)
+void kvm_x86_vendor_exit(void)
 {
 	kvm_unregister_perf_callbacks();
 
@@ -9440,6 +9450,7 @@ void kvm_arch_exit(void)
 	WARN_ON(static_branch_unlikely(&kvm_xen_enabled.key));
 #endif
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
 
 static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
 {
-- 
2.38.1.584.g0f3c55d4c2-goog

