Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9165617239
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:23:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jcn3Rhmz3cLg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:23:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pj8ZAUMz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3-fpiywykdjwoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pj8ZAUMz;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jWv49GXz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:23 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id f19-20020a63f113000000b0046fde69a09dso90837pgi.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=c745/GhVAupZOShsaNtc5Y0Jm7uB9ydr3S2itBPefjM=;
        b=pj8ZAUMzpQAWjfpeZGv/CFSzOSSwAiDNlmMCeDtMJXA3Ia6uRvLVcV16Cymca0aHXC
         PM6wRe31jjgcVPugCvX2WsyNtqvMLIJF0v+Ys/n5Nq2k4svZOYnhn3INYaYp+USpd+G1
         514pS4WDUrP9flgT5BLdl+/qUHO2eNFQZVTslZCWnmYA53yd76i4Ah4L5OS7bjh89Kxd
         agD1FqGzCkHp/1xQ5FePUye1+JugXCV19Z37h3h0SVTeBVE4gWePoOlMN/4jX90JcqtQ
         h9Xz7vnqCR6lnYHkhGhaSKxff5kFMXnt6v8GUJMP6nlzvcT1qM4okUu+0Q4ETJu9vS+7
         8iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c745/GhVAupZOShsaNtc5Y0Jm7uB9ydr3S2itBPefjM=;
        b=2guIdtoxsucKxEGZPdyftbXbDu9SPKufjEn+Cd9fARs672tb7DtZZOd5yrZo3P5vHH
         7puoqh3E2FHkVJhTReI7/xuLkfB31ZwkmAeKhqsNyr8od6Xxj8IZzXXK+7Fy45ZtEx00
         UTCF/rx2FA/75/G2gu1/kRSzrnJTdpDYsBJRD0HXn06KoNehb9ns0OLOrp4ElfFqzLR2
         uOJCSZkq83ahXykjnZu7E6gzvNVu9GvXh2f57E1e+AOO7V8QOLpqwGpkgCur/FiZ+p0+
         nuOGS/nFyt3ZvYkhdZ/G894i0VD1doITxKBsLG5QCBkmZLQgZWpe8ASrPGKR5aZN/6w7
         3BKQ==
X-Gm-Message-State: ACrzQf17MGN5HYNhLQcKsgTJ+z1wZY7trIP7dNvmIiViuSjWyvBm+wBa
	etB/atdSF1DTrf2QDCJ112QYHGldm88=
X-Google-Smtp-Source: AMsMyM50bKDX4r1Ac7K4343Hy6JzbUn/G7PmXwa6NG1xDlxuMg48/hoXRC8GNkJYnpu6i2NofBL/D0pMfb0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:8a97:b0:178:1939:c721 with SMTP id
 p23-20020a1709028a9700b001781939c721mr27564226plo.108.1667431161027; Wed, 02
 Nov 2022 16:19:21 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:31 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-5-seanjc@google.com>
Subject: [PATCH 04/44] KVM: Teardown VFIO ops earlier in kvm_exit()
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
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8b7534cc953b..f592dd4ce8f2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5961,6 +5961,7 @@ void kvm_exit(void)
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
+	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
@@ -5970,7 +5971,6 @@ void kvm_exit(void)
 	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.431.g37b22c650d-goog

