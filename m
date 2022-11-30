Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A1263E60D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 01:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMxB84524z3gM2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 11:03:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=svX1/fce;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3coohywykdbe9vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=svX1/fce;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw1Q4ZQwz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:11:06 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3c2837e751fso114283547b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8x0ZXn3EDc/IXE10wWIHQ6grwXVgVE97mHwl4hbdeQk=;
        b=svX1/fceR089wUbhSQhk/jDIM6Hb1O6OQ2qpyY/bxODwo2l21O/+lF2M/oWYVFopBL
         9iVSjpUD4ByvxHNMTLm2+Aqi3jkHju8zeyRE0QQ4MXEVtGJlbaZInZtfd0vZlRTxGrzq
         JsifAxPm+HxofD/VWF9T5VpkTs3QrcfDSrRCCx24sbFpCjTOTpcatd79jNfZI53OekTV
         PFymG/ZoNTP1yqeAIkXfkfQrmLz6NqML76C7vkqujoT5hbToc0RUrI+jh/dGR+3upHWw
         Pv5WHPynR7w4dPeVQ7wg5KdVd27yXGQS19WxO6GBAvU3VTI/56EGnkKmcDKvptaKWmKb
         82JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8x0ZXn3EDc/IXE10wWIHQ6grwXVgVE97mHwl4hbdeQk=;
        b=AbrtpDoEift1RgFmKnh+aqXcuzdfPHlNQR2/IZZOVQvD0Z3UDSYPkID4ePrN+6+GHU
         iK2UVQ4o6DDKtLohndoll4pYJx8fuZFh5lUUa9nHQ69iEQV2L6KdlX2jZEfrzClvNNBB
         yx2tYDqw4xcMW7yysqOR4PUP62SgJ+VKdLTVHANFrt6Idipqnmk543kHJHOBEABKZ7Il
         xmeqtBQFM01DgD5siiVnUo+fBAOF+jqQm+KYeKBpuvsvv5gdYS+D17rjg+LHjGx+QMrt
         SYg+DYg1D/IQsex6lTFvDdj33IOaDIWkrhi/gIo+aqCMub94dNBqtJ/the/PJdcAYicR
         7azg==
X-Gm-Message-State: ANoB5pnfVUqHS4GODYe0FejWDUoLrgZqpWby8fWUZTxkaEvVXT6PinC1
	F9851rcXbkqm+5I/NPjlp9nW5CF3CZI=
X-Google-Smtp-Source: AA0mqf52TAnX1cWAQ96XDuvwPCxCy8n4wLWV5o+6wUepr4pO9rnWPI1F+BmGpVuyqa0Tukjf36JFuFHSLuw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d40f:0:b0:6fb:a7f8:8b62 with SMTP id
 m15-20020a25d40f000000b006fba7f88b62mr1103250ybf.313.1669849864582; Wed, 30
 Nov 2022 15:11:04 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:34 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-51-seanjc@google.com>
Subject: [PATCH v2 50/50] KVM: Clean up error labels in kvm_init()
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

Convert the last two "out" lables to "err" labels now that the dust has
settled, i.e. now that there are no more planned changes to the order
of things in kvm_init().

Use "err" instead of "out" as it's easier to describe what failed than it
is to describe what needs to be unwound, e.g. if allocating a per-CPU kick
mask fails, KVM needs to free any masks that were allocated, and of course
needs to unwind previous operations.

Reported-by: Chao Gao <chao.gao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6a2be96557c2..b8c6bfb46066 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5907,14 +5907,14 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 					   NULL);
 	if (!kvm_vcpu_cache) {
 		r = -ENOMEM;
-		goto out_free_3;
+		goto err_vcpu_cache;
 	}
 
 	for_each_possible_cpu(cpu) {
 		if (!alloc_cpumask_var_node(&per_cpu(cpu_kick_mask, cpu),
 					    GFP_KERNEL, cpu_to_node(cpu))) {
 			r = -ENOMEM;
-			goto out_free_4;
+			goto err_cpu_kick_mask;
 		}
 	}
 
@@ -5956,11 +5956,11 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 err_async_pf:
 	kvm_irqfd_exit();
 err_irqfd:
-out_free_4:
+err_cpu_kick_mask:
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
-out_free_3:
+err_vcpu_cache:
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
-- 
2.38.1.584.g0f3c55d4c2-goog

