Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DADF6172D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jzn2Kd4z3fcj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:40:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jpZ4+tq6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3f_tiywykdloxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jpZ4+tq6;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXT6bRvz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:53 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-36f8318e4d0so533367b3.20
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/lqn4M/Too7/hLjEdNjj07wzHVUwU9le6KZacsTk8SY=;
        b=jpZ4+tq6rgM4hZWXweQJqfxuirRlrRpN+o4JwlpzpCNTf2A1sJCTA6DFTlQxCFhgbt
         sLPS4JguQacCAQKGId9cUa8Po003/wEsvkFZ2dOMw9iNk7lA7jWRoh5OFZzRfWNs6e3X
         DneEijHQrn4rLICnTKWJFk513kvZJ3K123XsKZ8FoBZdWOMtOvWDKENXD0/AJPQsCKjG
         rrWvKtMA58cnJHMchHTeytkk5Oc3RF3YtWKf69zqcXqxFh7WlsD0FI+Jf5mEVKngU/vv
         wyh2CqSaqQR9rkwiquK7nfr1sE2Ot7UFYqlBaM19WPnwV+Bbr0Tz+aWWsDk+unGGDNDW
         oUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lqn4M/Too7/hLjEdNjj07wzHVUwU9le6KZacsTk8SY=;
        b=g/3q+UtZnHAGM45JJwQQAPzsEmo3XjDLjEYadTrAOLk1j/T8p7qdRVUx3RQ3ZFncF4
         t2251YMt2sUiVs3Jery0rCaTNMhZl5eFaeCaCPW9YiE6xltNf0luQFYxe8KBf0I8FUBt
         WdzjEu7dKuNn4I2/uTZtZDnEEKqSVENK0Zqn+LoLTTrJGK+urI6Hgjs0Hk6ji8v3KaXw
         LNaBBTfIG3rYBE3L2QZvUEocZCVKE5c42mnXidMCKTuoh8Y/Uzg0Bvd+Wdna+9KYApEI
         gED4pTQi+Uf12Vyum4Z6Fh2EpXWXKlXceNSMkmjxddNRJmmXVEDcxknWSvBKGi9YsqHx
         KIuA==
X-Gm-Message-State: ACrzQf1u/f4rLNlck9uCSdGFsmwZF3+ICq59T43QyEwPgodgc1Ahv8Gr
	/zWCprmeGxQTfWcHAY8LazWME/8Od+U=
X-Google-Smtp-Source: AMsMyM7jpwGuIU1urFbOZ+g44WVeQ15lWGU4IrnR1FfXK34lSVgumwGfDAw7vRfyWzKVx0s/7WxU/xcerg8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e694:0:b0:6ca:2610:76fd with SMTP id
 d142-20020a25e694000000b006ca261076fdmr171916ybh.607.1667431191239; Wed, 02
 Nov 2022 16:19:51 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:49 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-23-seanjc@google.com>
Subject: [PATCH 22/44] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
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

Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Moving setup to riscv_kvm_init(), which is tagged __init, will allow
tagging more functions and data with __init and __ro_after_init.  And
emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index a146fa0ce4d2..cb063b8a9a0f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
 }
 
 int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+}
+
+static int __init riscv_kvm_init(void)
 {
 	const char *str;
 
@@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
-static int __init riscv_kvm_init(void)
-{
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
 module_init(riscv_kvm_init);
-- 
2.38.1.431.g37b22c650d-goog

