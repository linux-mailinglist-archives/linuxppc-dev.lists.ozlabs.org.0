Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 756BE6172F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:42:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2k2y2cZBz3fBR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:42:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qayOPbuA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3hptiywykdl8xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qayOPbuA;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXZ64M0z3bdC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:58 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-36fc0644f51so611827b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CzSf5zn0WCjHNHnOQoVFnBDZCb0UJEWJAWP5e8x7mpU=;
        b=qayOPbuABiIuhyUyS81pM4aIXP0zbbDCyOAoStlcDM54io6H46scG/b+AOJZ083vkp
         7VUQSDA3F1PV+eczWk9jhX07na0Ee5Y/y96fcuWnjX0SDylBmMM507BoItRwczIvX47w
         quWZbFbuSFsnuRxvRxHTWN2VK6E9IoRaN3Rn0730zHfCEZF81HBccJpL9kyZIy1KxZA/
         662DkzEQNlhCKGQQORLsI62wqsjL9SN7t5eET3UjVYfrxzuz8jEkm9iuoDgYatGUaOSX
         hwFfEfHx7Y5bc5lWLW7ELIceyIhTn7UMBpI42o+ooA3Zs7kMfZ0227v/cGHQHHsdYmrl
         HIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzSf5zn0WCjHNHnOQoVFnBDZCb0UJEWJAWP5e8x7mpU=;
        b=Vs6Cwp70KJ3WoLW/8E6ULA+1GSygXxNjvlkH+e4wFRwwQ9g7VnzfCdKradONEcmHIa
         mToz3Lm5eutJNfGE0uPs8yHYyR50dIY78W4IQXRqeqWJOuBenWKS3iFRZ/GrsMOJlT3R
         xQX5Dls5J4gcHBuB6V7Mj0riIhknXhtqf3CAxKS2mXOb+v3RNeEQC8u34v2A3t//AJA+
         7eJzQBh+KDBetKrysjLxsWc+YtEZv9pTzeWFxbEVs8KmZvyEtKse6UcZUTxu3wyVUtGQ
         vVbU7oPKrMbADU3HbRXXuHq6Twi9MDWMXTEadHvkamkMeWRx647LK90QHs6FSVMXUhZd
         KgLw==
X-Gm-Message-State: ACrzQf0mBmLdFfLPhzjgRS6GIejehJXg6p6wNe5B0m3fG4vKm23gg3AJ
	W/t5Qg/HdFvTsCVJDtMABhHy8ee/I0M=
X-Google-Smtp-Source: AMsMyM5QAC+6uL9KNRnm9M5TXJQCSY2aBJVNt4dTDVzjRpTyYTEDmCTYsEFvvoqsJQdz2eHBvIeRC0Fos4c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:2544:0:b0:360:c270:15a1 with SMTP id
 l65-20020a812544000000b00360c27015a1mr24717446ywl.67.1667431196650; Wed, 02
 Nov 2022 16:19:56 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:52 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-26-seanjc@google.com>
Subject: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
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

Move the guts of kvm_arch_init() into a new helper, __kvm_s390_init(),
and invoke the new helper directly from kvm_s390_init() instead of
bouncing through kvm_init().  Invoking kvm_arch_init() is the very
first action performed by kvm_init(), i.e. this is a glorified nop.

Moving setup to __kvm_s390_init() will allow tagging more functions as
__init, and emptying kvm_arch_init() will allow dropping the hook
entirely once all architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 7fcd2d3b3558..e1c9980aae78 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -461,7 +461,7 @@ static void kvm_s390_cpu_feat_init(void)
 	 */
 }
 
-int kvm_arch_init(void *opaque)
+static int __kvm_s390_init(void)
 {
 	int rc = -ENOMEM;
 
@@ -519,7 +519,7 @@ int kvm_arch_init(void *opaque)
 	return rc;
 }
 
-void kvm_arch_exit(void)
+static void __kvm_s390_exit(void)
 {
 	gmap_unregister_pte_notifier(&gmap_notifier);
 	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
@@ -533,6 +533,16 @@ void kvm_arch_exit(void)
 	debug_unregister(kvm_s390_dbf_uv);
 }
 
+int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+
+}
+
 /* Section: device related */
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
@@ -5634,7 +5644,7 @@ static inline unsigned long nonhyp_mask(int i)
 
 static int __init kvm_s390_init(void)
 {
-	int i;
+	int i, r;
 
 	if (!sclp.has_sief2) {
 		pr_info("SIE is not available\n");
@@ -5650,12 +5660,23 @@ static int __init kvm_s390_init(void)
 		kvm_s390_fac_base[i] |=
 			stfle_fac_list[i] & nonhyp_mask(i);
 
-	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	r = __kvm_s390_init();
+	if (r)
+		return r;
+
+	r = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (r) {
+		__kvm_s390_exit();
+		return r;
+	}
+	return 0;
 }
 
 static void __exit kvm_s390_exit(void)
 {
 	kvm_exit();
+
+	__kvm_s390_exit();
 }
 
 module_init(kvm_s390_init);
-- 
2.38.1.431.g37b22c650d-goog

