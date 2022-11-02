Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1A617272
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:25:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jfx2bwBz3f9m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:25:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UkZGnXGm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3_ppiywykdj8rd9mibfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UkZGnXGm;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jWy6YRhz3bbl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:26 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id w191-20020a6382c8000000b0045bf92a0b5aso75237pgd.22
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp3PbLfGlbPMUpUfY94YYIKSvd3QEyEjimXY5GHh7Do=;
        b=UkZGnXGmq2elzgV9DLUz74QXF30iTWbFGDiWfdaXhQTrFX8aiqCFVBpq5xcu6/5CJ0
         6CAeS4zBndyLbi6uL4aOTOJPom/GUXPjp+wnaiLNi/IOKHaUUiAdDM0lQqJcKi8lJ3vx
         vnARJXxit3idHJ3CVkd3Epv6mh/Uh5po1QC+vmSMzcdxDA+trq8VPV/HTVpleuhXsuBJ
         gB5evBsfkJOotXoUamKJrE8Yp7t9k0CZooSYyZMUGEw+wssTud1LYZ35nFOFQX6SsKf7
         8kThfTBVhIqoMM2+KcJViQg4ABdkLDTwvbAbS0YvwKJ8JO2nHVa2hjZQKtmcKqW09CRW
         6M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp3PbLfGlbPMUpUfY94YYIKSvd3QEyEjimXY5GHh7Do=;
        b=SdX98JQDn6Eih2GFJG7fWM8tnbqXr/P9/ycKhQK16Fp669Tdo+G8Se/4f7Kx8Npcor
         Zg1QU1Xma4mmEMXvU3x/K6H+nqxPH8q4mZ9iK+GBN9woWl4T59kxBoSUER5Rxw2XehD2
         VjfefvEiOq3YDJ+1mFiSEpIziouIKnj1HjYuWxBAoBh1CCQ/FTpevTH27dsNKa0+2MPm
         YlivlGhVASV9GOvMjd8ECx6DJ704o2/ozu9pw/osanu0jw5fBnlgv3CJBx3ODhWaebNV
         MFhzf7GuDDIFqrYvT76QTDHxfhWD/3XUEINqfu38lGYD8s/TMrGEldWe86vTGjixP010
         Rk3A==
X-Gm-Message-State: ACrzQf17EbfI2GuC9VTU4/aoVC0CHQjLS6hxY9IZG8Ut1Jur97Bfthbl
	ufQ2h7wysSQt3vLLqjqFOJktmJjSR/k=
X-Google-Smtp-Source: AMsMyM5BN48AgcZOI4nVxc2uFg8TXUQwjAkA5TEHVSI5KiQDtZoUe78o5/c87/pf9J/oxQANcuw7e+pFPCs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:1206:0:b0:470:18c:1489 with SMTP id
 h6-20020a631206000000b00470018c1489mr6904894pgl.357.1667431164538; Wed, 02
 Nov 2022 16:19:24 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:33 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-7-seanjc@google.com>
Subject: [PATCH 06/44] KVM: s390: Move hardware setup/unsetup to init/exit
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

Now that kvm_arch_hardware_setup() is called immediately after
kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
kvm_arch_{init,exit}() as a step towards dropping one of the hooks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 8395433a79b2..1aaee15211f2 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -323,21 +323,12 @@ static struct notifier_block kvm_clock_notifier = {
 
 int kvm_arch_hardware_setup(void *opaque)
 {
-	gmap_notifier.notifier_call = kvm_gmap_notifier;
-	gmap_register_pte_notifier(&gmap_notifier);
-	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
-	gmap_register_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
-				       &kvm_clock_notifier);
 	return 0;
 }
 
 void kvm_arch_hardware_unsetup(void)
 {
-	gmap_unregister_pte_notifier(&gmap_notifier);
-	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
-					 &kvm_clock_notifier);
+
 }
 
 static void allow_cpu_feat(unsigned long nr)
@@ -517,6 +508,13 @@ int kvm_arch_init(void *opaque)
 	if (rc)
 		goto err_gib;
 
+	gmap_notifier.notifier_call = kvm_gmap_notifier;
+	gmap_register_pte_notifier(&gmap_notifier);
+	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
+	gmap_register_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
+				       &kvm_clock_notifier);
+
 	return 0;
 
 err_gib:
@@ -533,6 +531,11 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	gmap_unregister_pte_notifier(&gmap_notifier);
+	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
+					 &kvm_clock_notifier);
+
 	kvm_s390_gib_destroy();
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
 		kvm_s390_pci_exit();
-- 
2.38.1.431.g37b22c650d-goog

