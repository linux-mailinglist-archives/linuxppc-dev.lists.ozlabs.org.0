Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77463E5DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:57:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMx2q6f5mz3g9m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:57:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ffiAil8t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3_okhywykdauxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ffiAil8t;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw196RB3z3bg0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:53 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id a33-20020a630b61000000b00429d91cc649so89787pgl.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=X0tmq9TjsMbdzf016NYPEZWLDrtJgEerkZwlPByjvHs=;
        b=ffiAil8tYfi3nQXQblraVPD6jbdbOOCVG7uQkkKJrYkDL25R/TkQAeFRDogqa/QMMv
         6wZOWt9R/eeSPWTlpWV3IYmrtl04WJOPJAhS7DhGuKTgLTJnehBcyBsLWlgRsCVFi/Ix
         ksxZjkBOqqqo9hOr9qKhrYgS8WLlfTE4UM6Vkkhhf880kZVvVEdvLhl4X0FaFYBb/6vC
         1lACz1AHExA2AbJQILx7vCyuTDoL44EAFEV/X6CifJwvfMkGg0ai47n8Yg94c4IO+cHQ
         jlRTeSXfVKpq0j3GPFNIBJZpOCvznvIZyM5DfqXmXJnRlhyCma48IFWCHmjS0A3NCAbs
         hdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0tmq9TjsMbdzf016NYPEZWLDrtJgEerkZwlPByjvHs=;
        b=3t92o+PXYwT056Pb1nZLFxv3Ai02OqwQvPNBtHAzR9Qnzez9J6MosSeyKZzprxGPKa
         Kx/zh0s3DbEeqKCtZKsZlxdpG3VJJ5r9MBGQW0hqZfegnt1eoKH6btrcs/oW4dK+cJpM
         Lnzo7tgX87AlH6FRFMq3tjLzANqX/VyYu2oKt4u4pS6nyioJMcMsRmEjq6Mv8jHwKsV/
         FpmUJYVcN0sUu5kHprGU8REuId4PqmbmBj0xgZ2Nk3VE/ANqxPoT7Ftow9GEzKkKAVyD
         xQ5+BvnfLHftcIQ5CnFYl9SNug4Kp8z1nbZYOhbpzj9O88+ApPkR7dCZoq9ZzhPJn38K
         94tQ==
X-Gm-Message-State: ANoB5pnpQro8QrSvkg7bahOiWueaI0uGqXov3Hj8ggkjtScGAOalt6zX
	U7cB1RYDJUPkxdEKB30iIkmgaOgpXO0=
X-Google-Smtp-Source: AA0mqf4tYdOmumtBwzOsj2b757evhXiqjnmJBxVweHABwP7YhX6XXp+28OecLtWsiEbLYyMEiAceUWRYidE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8487:0:b0:56c:3bb4:28a8 with SMTP id
 u7-20020aa78487000000b0056c3bb428a8mr44633084pfn.83.1669849852226; Wed, 30
 Nov 2022 15:10:52 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:27 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-44-seanjc@google.com>
Subject: [PATCH v2 43/50] KVM: Ensure CPU is stable during low level hardware enable/disable
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

Use the non-raw smp_processor_id() in the low hardware enable/disable
helpers as KVM absolutely relies on the CPU being stable, e.g. KVM would
end up with incorrect state if the task were migrated between accessing
cpus_hardware_enabled and actually enabling/disabling hardware.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d985b24c423b..a46d61e9c053 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5028,7 +5028,7 @@ static struct miscdevice kvm_dev = {
 
 static void hardware_enable_nolock(void *junk)
 {
-	int cpu = raw_smp_processor_id();
+	int cpu = smp_processor_id();
 	int r;
 
 	if (cpumask_test_cpu(cpu, cpus_hardware_enabled))
@@ -5070,7 +5070,7 @@ static int kvm_online_cpu(unsigned int cpu)
 
 static void hardware_disable_nolock(void *junk)
 {
-	int cpu = raw_smp_processor_id();
+	int cpu = smp_processor_id();
 
 	if (!cpumask_test_cpu(cpu, cpus_hardware_enabled))
 		return;
-- 
2.38.1.584.g0f3c55d4c2-goog

