Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF725BF23A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKH43J8bz3fDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:36:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=grJuuh2+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3uvsqywykddooawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=grJuuh2+;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBh11ktz3c2N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:32:59 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id f4-20020a636a04000000b0043a18cf1a5aso2507916pgc.14
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=;
        b=grJuuh2+k9rqNemRgEr/i3C9qelUa8pmjrIwpZzOZWsob4m9BMj0id2HZJEYNqX2vk
         IyiBqggCegoMniVIEZ7ve0Pcy1+h2jKB9+MbFtK10I6z6o71JeWojaaos6m7WE8fir0j
         heFLVTWw3UN27mkc0NRFrTsxNKdJe5TptRVjlgbhxvmnLYxPIxj71ZtTzy+8U9psEbMq
         /DJvRQaVwnNJl+52DMbtmS4ycyYoramkBPdq9kNpcRPXozDD2tMcpY+VTWl4f/e0cZ1u
         xUxifAHZRm7LM+0f4tqB8q/MJPB9s8lTaVH0t++C99WkByoXTjU2cYt2Zh/7y53Gwmu9
         hSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=MbPfwZWv+I6kc3yY72JCQSO5yCJ8JCb5ELGKfLOjwok=;
        b=X0f6GTfJmke1eA9ZgeiJ40kguNGO3YOquz/1tnI+Q8wCSvYwJmr2x7yGRt15ydpyUJ
         t9UMZC7HZjMQzmpaaXP6Eex75tCfpT6UktF+X49hxgXobLGRGvHAae+ZhT6ndPRTDVef
         K656P9jT+SRnd/lboc9dnpGp/68VYJZsKe3XhLey+iQWv1JJDg8NsGtD06bQYoQcr7XR
         PRbOMAmTqG9wjYbgSNJ0z4fDmh/SVSDyMSS+bmuUbg4C9zFgOsUAEZKk2Q3QwFt7qRoI
         Xd74S9OuKwt49z0Hc//VuOcyscxw+LvLrKx1N9/BLxwJpr58NyyivZyNs1AjzS7+/cv3
         oW6A==
X-Gm-Message-State: ACrzQf1jCxcF9Smze1Xh9wo45lbOln6SOgVVMvrEAsNiZ/YLaluSelO0
	wd1XxwFig2aHLn30sUo8XCQKkD0bqLw=
X-Google-Smtp-Source: AMsMyM7f/RJC1MtdX6LkmKjLrG4mZov+EsK6V2BR+rQVSc6X+vDgdbpWXXujI7vaEWcw3mjY8BTW5lUZVRw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac7:b0:178:b5e0:3627 with SMTP id
 q7-20020a170902dac700b00178b5e03627mr2094501plx.147.1663720377687; Tue, 20
 Sep 2022 17:32:57 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:55 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-7-seanjc@google.com>
Subject: [PATCH v4 06/12] KVM: SVM: Make an event request if INIT or SIPI is
 pending when GIF is set
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Maxim Levitsky <mlevitsk@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Set KVM_REQ_EVENT if INIT or SIPI is pending when the guest enables GIF.
INIT in particular is blocked when GIF=0 and needs to be processed when
GIF is toggled to '1'.  This bug has been masked by (a) KVM calling
->check_nested_events() in the core run loop and (b) hypervisors toggling
GIF from 0=>1 only when entering guest mode (L1 entering L2).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index dd599afc85f5..58f0077d9357 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2339,7 +2339,8 @@ void svm_set_gif(struct vcpu_svm *svm, bool value)
 		enable_gif(svm);
 		if (svm->vcpu.arch.smi_pending ||
 		    svm->vcpu.arch.nmi_pending ||
-		    kvm_cpu_has_injectable_intr(&svm->vcpu))
+		    kvm_cpu_has_injectable_intr(&svm->vcpu) ||
+		    kvm_apic_has_pending_init_or_sipi(&svm->vcpu))
 			kvm_make_request(KVM_REQ_EVENT, &svm->vcpu);
 	} else {
 		disable_gif(svm);
-- 
2.37.3.968.ga6b4b080e4-goog

