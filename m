Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16272617285
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jgx6KsLz3f82
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:26:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eS+ADSAU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3_vpiywykdketfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eS+ADSAU;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jX01LdDz3c2g
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:28 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id c1-20020a170902d48100b0018723580343so215635plg.15
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2jZZfFf52GmkjzF4UkJBFUQx8TRwCaNEoxRzKdccz/c=;
        b=eS+ADSAUDBr+3HDHnDb3Fr9sF+Jb8/UT2oH309j3Rm/86ObG6TRCn9IyhpjUkKBdpE
         kcCNHyv3vwGiHYQRvOqDpsz+Ka9M2XEJCdBD1BDMQE+yHelvK5eIZBtBOFMFVOay6VLL
         HRD1UaccDMN8QRmrJzaFGA2kakGK5P4xJGBM94BuLtDJAAqDK7hBLTZ7oOdfic4lXqK4
         Fr39ZfZInLrcHKiM8fxmsZrdE64FtenP1A0FKcDrTDJZkpQ1QUJo1/Y5EttLt8eZYz9U
         +9QTVq6+Q+Y4pZ8EkuhDPhDFtAlj3OJomhnuiK5WjSAlU9kpBh9BdzMjPScyheuXuiwK
         D0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jZZfFf52GmkjzF4UkJBFUQx8TRwCaNEoxRzKdccz/c=;
        b=Pv/byq0/Xfi1cXG7JSYI8F44QWCMPvAXm2uCK5Y7toKumV1rT3yT3/6wtlL2vLNVqp
         Blz4jYbovjgdAro4PmoUcnjW6yvvHGxzrWfDAVvuhLEbw+7O/JC++Tinc8BpfibcId14
         1/xGgvdlD91P1oS/2RaAbf1HtnabidHSxEZgCshMJbIvZfQ353TQV2PLI3bP83vxGor5
         tYOxhdtN8s3QE4dy8KdlrRygda58IeJRDLAWq8cP71lq6f0S5rcjUXL7kGcyddxAd0Jq
         alNYEK5uAzkONW7PjeuoyHR0Akt4P1CRyyEgZefYlsWWf6qUQzWCOY8rw02QXXUMNnCh
         vY5g==
X-Gm-Message-State: ACrzQf26JGFuKTqiU7T3U8KRPQ46qY0WPa2ugx9uDW2Zs1T4BFMZsvpN
	vQY06wpwOqm0HYvk63qLuTxbELjN6Fg=
X-Google-Smtp-Source: AMsMyM6vYYJQBYlQiDcX1wj97hZ9g1pk+rDBzdLxVoyiEkvTNhgYg+UmvFixquw/EG51V/dsQ+i+Sr9IedQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e7c5:b0:213:b7d8:1c4c with SMTP id
 kb5-20020a17090ae7c500b00213b7d81c4cmr25473196pjb.114.1667431166266; Wed, 02
 Nov 2022 16:19:26 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:34 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-8-seanjc@google.com>
Subject: [PATCH 07/44] KVM: x86: Do timer initialization after XCR0 configuration
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

Move kvm_arch_init()'s call to kvm_timer_init() down a few lines below
the XCR0 configuration code.  A future patch will move hardware setup
into kvm_arch_init() and slot in vendor hardware setup before the call
to kvm_timer_init() so that timer initialization (among other stuff)
doesn't need to be unwound if vendor setup fails.  XCR0 setup on the
other hand needs to happen before vendor hardware setup.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cd9eb13e2ed7..9a7702b1c563 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9320,13 +9320,13 @@ int kvm_arch_init(void *opaque)
 	if (r)
 		goto out_free_percpu;
 
-	kvm_timer_init();
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
 	}
 
+	kvm_timer_init();
+
 	if (pi_inject_timer == -1)
 		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
 #ifdef CONFIG_X86_64
-- 
2.38.1.431.g37b22c650d-goog

