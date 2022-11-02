Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD126172A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:29:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jlz6d7Yz3f93
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:29:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Y+WCubtq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3bptiywykdkczlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Y+WCubtq;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jX51m1Lz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:33 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id p66-20020a257445000000b006ca0ba7608fso375677ybc.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hsvwPn56EufMwWrr4BQ3wXsJaNpmOPQxZWWpLewxvhQ=;
        b=Y+WCubtqC448k8BS6Mqnaj28SHAW+AQfgFNGCLm2bJu3u1mJtG3sPN/6hEm3u5WKxX
         gjm0xAmdiy0BNLmCTgESqNLWBkKXwZKx8x3UovP6tMr0tuTqm6uAbtXaFSg2tQ6IY8UY
         VXa2F9flrbUexIM+erBgHE9ssHvFwc+slKWkiJrFDAVzrbJZgmqNXlASKZWSF88G1RsF
         3WXrtRdOPomKp62p5k4CbApbNG6yrgaBuDlDbRhFN/CbQ2b9hIJBRdTCZXqQmNDbMEE4
         ZnCQdPnQlkYKD1izSyGfMR40m61f2ixRTRCzDV7N9xc1b7MsAKZPHOhhZhsGAWMnpSoY
         ov8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsvwPn56EufMwWrr4BQ3wXsJaNpmOPQxZWWpLewxvhQ=;
        b=PI6OcDxCCJaAnjc8SuET54X+q6+EVMcC7GMi5tf/ViXmux+w+KK477SZbVwzBkpNl8
         4b+e7hilnHSgvStobGu8lUj8TBYRNVv4koRLKNr2rTSJ1uDmPqe7AoI0PZzivdhsXUnN
         4engidVT+YN6pDZB58k1PcK2N6Yhy6VEa/C2qHTV3Y/PMIAPiElrG744dod5tGZwjN3J
         8GSSJvHZ9lb6aba9dN36ewMx8sYH0gHfsKNf70Sn53e5YCmRotZw0FjRqg6ki47e4zl+
         ABEyabFHviUzldY8N2tO1Bb15LHeoaVvGa+drrbWIoVps1xf+dhlvdqPNLvmZfpq5eQd
         Cm4A==
X-Gm-Message-State: ACrzQf2qieU5S0+WdlQ5CPBL4NYauJr7X5ipdEDb1wqCY8M41Imh+bCi
	ERLpZuU8U/OmWKn8MzfmzqtmkBKvPeM=
X-Google-Smtp-Source: AMsMyM6oJohPpBax4v0z1oNOFbI9XApbw28cX6E9TB+pABT2BMMHd99IJfTyuxyKkWfVMC7TDoAu4jEMuqY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:550:0:b0:6ca:5991:1abf with SMTP id
 77-20020a250550000000b006ca59911abfmr26235720ybf.371.1667431172753; Wed, 02
 Nov 2022 16:19:32 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:38 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-12-seanjc@google.com>
Subject: [PATCH 11/44] KVM: x86: Move guts of kvm_arch_init() to standalone helper
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
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
 arch/x86/kvm/vmx/vmx.c          |  9 ++++++++-
 arch/x86/kvm/x86.c              | 15 +++++++++++++--
 4 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 415113dea951..58a7cb8d8e96 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1695,6 +1695,9 @@ extern struct kvm_x86_ops kvm_x86_ops;
 #define KVM_X86_OP_OPTIONAL_RET0 KVM_X86_OP
 #include <asm/kvm-x86-ops.h>
 
+int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops);
+void kvm_x86_vendor_exit(void);
+
 #define __KVM_HAVE_ARCH_VM_ALLOC
 static inline struct kvm *kvm_arch_alloc_vm(void)
 {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d22a809d9233..f48d07bfc3d7 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5132,15 +5132,34 @@ static struct kvm_x86_init_ops svm_init_ops __initdata = {
 
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
index b3fd4049de01..118d9b29b339 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8501,6 +8501,7 @@ static void vmx_exit(void)
 #endif
 
 	kvm_exit();
+	kvm_x86_vendor_exit();
 
 	hv_cleanup_evmcs();
 
@@ -8516,13 +8517,17 @@ static int __init vmx_init(void)
 
 	hv_setup_evmcs();
 
+	r = kvm_x86_vendor_init(&vmx_init_ops);
+	if (r)
+		goto err_x86_init;
+
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
 
 	/*
-	 * Must be called after kvm_init() so enable_ept is properly set
+	 * Must be called after common x86 init so enable_ept is properly set
 	 * up. Hand the parameter mitigation value in which was stored in
 	 * the pre module init parser. If no parameter was given, it will
 	 * contain 'auto' which will be turned into the default 'cond'
@@ -8559,6 +8564,8 @@ static int __init vmx_init(void)
 err_l1d_flush:
 	vmx_exit();
 err_kvm_init:
+	kvm_x86_vendor_exit();
+err_x86_init:
 	hv_cleanup_evmcs();
 	return r;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 40d4bfaa17a4..a0ca401d3cdf 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9272,7 +9272,16 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 
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
 
@@ -9404,8 +9413,9 @@ int kvm_arch_init(void *opaque)
 	kmem_cache_destroy(x86_emulator_cache);
 	return r;
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
 
-void kvm_arch_exit(void)
+void kvm_x86_vendor_exit(void)
 {
 	kvm_unregister_perf_callbacks();
 
@@ -9434,6 +9444,7 @@ void kvm_arch_exit(void)
 	WARN_ON(static_branch_unlikely(&kvm_xen_enabled.key));
 #endif
 }
+EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
 
 static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
 {
-- 
2.38.1.431.g37b22c650d-goog

