Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B752C617315
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:56:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2kLj4ZFwz3g6c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:56:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=igGQ2Ish;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3nvtiywykdnkn95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=igGQ2Ish;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jY44Nt8z3bjJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:20:24 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id m2-20020a17090a730200b0021020cce6adso2495732pjk.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7o9E6ByEEHcjl3SJug2mMi0pvOLBLqCZLDtYGdzM9zU=;
        b=igGQ2Ishg8aW6R16oe+upaVPlGZAayIzpaWDE8opgJQMS6iOjhkUCLTlEhQKtzbBll
         IdlAKyPdahqXXt0dn4MTEFgukQG0ZCIqNyG5cI01/hw0JIAYQcoPp2BpnzUD0jxS7Ya/
         +nFRYynF3Dt5MSnjg1t4pKoFk0Qf9803yI4SDdLZfxDyQop67DTJX+MNPzB4mGdTHTI/
         UetXl5t7icKMI/ai8krB+aFqS3nK2vJC9U3C1mIJKmfCvYut3D46hBaxcevJzvvlHDGm
         CTwO6YCLjzVqPj4Wwm3tv83DTC33l/N5jui9O7iqtMw8SKOspotJDO5ne6iRoF09KXOw
         O2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7o9E6ByEEHcjl3SJug2mMi0pvOLBLqCZLDtYGdzM9zU=;
        b=X6IiE6WNYM0gpJu5ucJFkZksDMuxvTNfazf4DyHlr3CDpqCJbpefJ3pewpztMF4URw
         y9/fKzgizJAOa5K2svoucdzXvm3Kq47Efp/9xswArOErvUnQjBIc89S4dwo63yB5sy+h
         JfirNHHE6mMX5JThcE6+/tRp2MB5jpbCnijDopZPM8JDjoxPSlD76aIt0ykdqZGMo3BJ
         A2zXKvkD8to31a3stIKWv48zKvQNFX8p/TqBGZDlvLVJQrHVXTB7nXWH0GdHZmudJ89U
         TVAZWT+W5yB08rczlpzUPXB5pHCM2679VL3D0ZKt9y01mpi5VehmZj/OBlqt4N6Is3FW
         4Qxg==
X-Gm-Message-State: ACrzQf164iBUyqoA3pH74ubr4eiri1VqoGmfzTkzRnUu6H0MuY2/9Bvi
	47dVShkpbMYI5luNqENOuejm8iwRrKs=
X-Google-Smtp-Source: AMsMyM6niBK+tgCsXQRPRS+/qtLS7kuATd90vG4p7xHoZHYxFybBPWfrbfk513VrCr/GCHaNPNf0pglufE4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c7c4:b0:186:5ebe:38e with SMTP id
 r4-20020a170902c7c400b001865ebe038emr27249054pla.33.1667431222881; Wed, 02
 Nov 2022 16:20:22 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:07 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-41-seanjc@google.com>
Subject: [PATCH 40/44] KVM: Remove on_each_cpu(hardware_disable_nolock) in kvm_exit()
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

Drop the superfluous invocation of hardware_disable_nolock() during
kvm_exit(), as it's nothing more than a glorified nop.

KVM automatically disables hardware on all CPUs when the last VM is
destroyed, and kvm_exit() cannot be called until the last VM goes
away as the calling module is pinned by an elevated refcount of the fops
associated with /dev/kvm.  This holds true even on x86, where the caller
of kvm_exit() is not kvm.ko, but is instead a dependent module, kvm_amd.ko
or kvm_intel.ko, as kvm_chardev_ops.owner is set to the module that calls
kvm_init(), not hardcoded to the base kvm.ko module.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
[sean: rework changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c8d92e6c3922..4a42b78bfb0e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5966,7 +5966,6 @@ void kvm_exit(void)
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
-	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
 }
-- 
2.38.1.431.g37b22c650d-goog

