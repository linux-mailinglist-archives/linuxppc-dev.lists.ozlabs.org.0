Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3A63E4F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:14:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMw4r5kMSz3bnZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:14:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DS5tl3JZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3uokhywykdl8xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DS5tl3JZ;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMvzt68yTz3bZ8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:09:46 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id x11-20020a056a000bcb00b0056c6ec11eefso168931pfu.14
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E8JVGgtDpa1adQbcFKdjF0h5x+zc5eW3OzNDv17W+I0=;
        b=DS5tl3JZt5ENZ41z8LWoU7l/LLAZg0bKxr9NB64mArQBR7Z4xQ54gwA8E1Foi7ucUI
         WLpYLHet6DIopxUbH10y1vLmghI4adUhheVz2l+sfpolKRTogMb2+JXMX5kC+1I07F/z
         xq02cwtlNoKx8xWnfdsY/DFfLTDmRaQZCHvCCDtocOPTXWGXE+6cy/K/TTmkXZECJ1T5
         UPbbMU++Q0JdnDp6PdsJU4We1R6snVfDObMmpUXwD7SotdnLb3fRUaZHvapd0uWqxFq9
         B+vmtfzyaE3KTk8T/zN+WUL7QMUukMAgZHVrZIfnA64+0ySQ/W2zwvQkWpKfKL7fFmQx
         zvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8JVGgtDpa1adQbcFKdjF0h5x+zc5eW3OzNDv17W+I0=;
        b=LNQASbIrb71LTUobBr8gA1HvdWfsNvMAStJDfsX8OsSRQVWmsiM0MNSjv6pRHHnTIM
         mHU1n3PPwhhJ21zjOv1+M8KbZyCRZ8Imd74fPEyAS/4pu7ptgKA/YFqhHjyilt+jKVkv
         GZFlZiOtXw1x05AT5pn9nM0jxKJjdnLmbEjOtvqJ3fvq1A4juk40w/gJ29qT3RJttTer
         /D4jQyXGvZPXmWsBX+579u9PIOTpVtz3nn/9JFful4CbbRMf2xI8+mcUIhHlYeulKh3r
         YLy0kCiLoyJROPgpsZZxpSn3a1yoI4drCmtIvkPBWbv43ufOjlMBI93u/cUYJEFsrh3V
         8tIg==
X-Gm-Message-State: ANoB5pmC3OvHz4RWY3DX0cKMAu2iaZfwwUZ3bKyNEPSxd2PKuEWq1035
	nkqdhnA/X62tc+sVR382dBfxsFcV/4A=
X-Google-Smtp-Source: AA0mqf6Q0BFR2rWNLKbL3PfSbJ45azh4M9K0FqaT09LmFusT3iMI987lBa2MWHLHJI40i8Y0hHfQV/M7a6M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e887:b0:189:1fcf:6ceb with SMTP id
 w7-20020a170902e88700b001891fcf6cebmr43466277plg.45.1669849784316; Wed, 30
 Nov 2022 15:09:44 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:48 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-5-seanjc@google.com>
Subject: [PATCH v2 04/50] KVM: Teardown VFIO ops earlier in kvm_exit()
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

Move the call to kvm_vfio_ops_exit() further up kvm_exit() to try and
bring some amount of symmetry to the setup order in kvm_init(), and more
importantly so that the arch hooks are invoked dead last by kvm_exit().
This will allow arch code to move away from the arch hooks without any
change in ordering between arch code and common code in kvm_exit().

That kvm_vfio_ops_exit() is called last appears to be 100% arbitrary.  It
was bolted on after the fact by commit 571ee1b68598 ("kvm: vfio: fix
unregister kvm_device_ops of vfio").  The nullified kvm_device_ops_table
is also local to kvm_main.c and is used only when there are active VMs,
so unless arch code is doing something truly bizarre, nullifying the
table earlier in kvm_exit() is little more than a nop.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ded88ad6c2d8..988f7d92db2e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5980,6 +5980,7 @@ void kvm_exit(void)
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
+	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
@@ -5989,7 +5990,6 @@ void kvm_exit(void)
 	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.584.g0f3c55d4c2-goog

