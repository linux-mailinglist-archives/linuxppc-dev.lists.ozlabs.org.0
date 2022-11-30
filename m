Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F963E56D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:27:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwNW38pFz3f9k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:27:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IzqZX1vp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=30ukhywykdnkn95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IzqZX1vp;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0M61Ckz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:11 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id x11-20020a170902ec8b00b00189986d9381so8794303plg.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3q8g1I3CG/zN/S6yfEuz3UEYEnVKGNtIkvlUCCz4wMk=;
        b=IzqZX1vpqBRD6eqp/m2lCIonVBr9d0e0dYh+rnORdsBouvRr/LJHoAVFCGYwduLpYW
         OTMMo4gprlzO/u6ojuhJyOc3wk8iW8vMqSUKMIfurZ/dESMUEks0XD0dELDo/XLaovGl
         EKo5NrbtnviyIeCdpV2+U1bLcQY9lYskXKPUNJWsxtd+ecYNZC7sEQkVg+anA/T0XgVe
         YvNoKh5i6BiC33HYuQOVTGAT9N1QTpRLVSSatOGlZCfv03s8ZzOwEte840f58eQcGUDe
         h1+xBUE24TMAZ61kNCycVQsK/JxxPJO1UMM34/IR0XeCfuqHb2uwlievzCRoo9MRdbjv
         0jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3q8g1I3CG/zN/S6yfEuz3UEYEnVKGNtIkvlUCCz4wMk=;
        b=vKfxG7jAKO0G3pkdZZBHk0fCnhi4fgJdynoG4+YLw1PJgQ6MFwnHFjN1Y0KajKjb/Y
         PMGyKAVwHBcmYRtOB9StV7VoSRjjZ69yDLBsD7mlllA5LvRCnLi/cpjS2WHUDrgCCBY2
         TIgK9ldRIm/kOaq3/eIFiVEm29dKp76QLAfiLunM1ZobFpOEz1jomrMDiGEVyAbP7mcs
         Qmk1DyTElysSuYhxVO60/VP4WM7e18du4fQULvNWm4dd2s7ujfbRFs6p2s927HiavfxO
         5VEHWEvhke858XlRLkYqmwsIesOSZWgJpaeXoSrTmOM3LMY+pSPCtRM6vCV+nBjwM+6f
         jWaw==
X-Gm-Message-State: ANoB5pkCDlvJpHrMJuG5TeSvWXqCZgIJP47SeEWg9OBl/TPndZF/LDUE
	uVlFOVBV4wESQvjgu5V9LeLxtxtEwHo=
X-Google-Smtp-Source: AA0mqf4/tiOg+xYgcsoY9u5fwhXNPg1RVdsGA6s6X0UqfvBtJFvF15IrbdNSIgjSxdrgTr0k96rlZxXDdGM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8bc1:0:b0:575:bfb9:b1fa with SMTP id
 s1-20020aa78bc1000000b00575bfb9b1famr7674415pfd.62.1669849810052; Wed, 30 Nov
 2022 15:10:10 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:03 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-20-seanjc@google.com>
Subject: [PATCH v2 19/50] KVM: arm64: Do arm/arch initialization without
 bouncing through kvm_init()
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

Do arm/arch specific initialization directly in arm's module_init(), now
called kvm_arm_init(), instead of bouncing through kvm_init() to reach
kvm_arch_init().  Invoking kvm_arch_init() is the very first action
performed by kvm_init(), so from a initialization perspective this is a
glorified nop.

Avoiding kvm_arch_init() also fixes a mostly benign bug as kvm_arch_exit()
doesn't properly unwind if a later stage of kvm_init() fails.  While the
soon-to-be-deleted comment about compiling as a module being unsupported
is correct, kvm_arch_exit() can still be called by kvm_init() if any step
after the call to kvm_arch_init() succeeds.

Add a FIXME to call out that pKVM initialization isn't unwound if
kvm_init() fails, which is a pre-existing problem inherited from
kvm_arch_exit().

Making kvm_arch_init() a nop will also allow dropping kvm_arch_init() and
kvm_arch_exit() entirely once all other architectures follow suit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e6f6fcfe6bcc..d3a4db1abf32 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2195,7 +2195,7 @@ void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *cons)
 /**
  * Initialize Hyp-mode and memory mappings on all CPUs.
  */
-int kvm_arch_init(void *opaque)
+int kvm_arm_init(void)
 {
 	int err;
 	bool in_hyp_mode;
@@ -2269,6 +2269,14 @@ int kvm_arch_init(void *opaque)
 		kvm_info("Hyp mode initialized successfully\n");
 	}
 
+	/*
+	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
+	 * hypervisor protection is finalized.
+	 */
+	err = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (err)
+		goto out_subs;
+
 	return 0;
 
 out_subs:
@@ -2281,10 +2289,15 @@ int kvm_arch_init(void *opaque)
 	return err;
 }
 
+int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
 /* NOP: Compiling as a module not supported */
 void kvm_arch_exit(void)
 {
-	kvm_unregister_perf_callbacks();
+
 }
 
 static int __init early_kvm_mode_cfg(char *arg)
@@ -2325,10 +2338,4 @@ enum kvm_mode kvm_get_mode(void)
 	return kvm_mode;
 }
 
-static int arm_init(void)
-{
-	int rc = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-	return rc;
-}
-
-module_init(arm_init);
+module_init(kvm_arm_init);
-- 
2.38.1.584.g0f3c55d4c2-goog

