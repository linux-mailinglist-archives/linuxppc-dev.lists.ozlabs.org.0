Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1591A93DB58
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 01:56:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lG54BrDC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4QW00Bwz3dSp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 09:56:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lG54BrDC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3ztakzgykdag0mivrkowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Ll5qn6z3dCm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:52:47 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d2e68f5c3so1460219b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037966; x=1722642766; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=lG54BrDCWUIxb2npNKstj0dXQYTQmk8MyeDV8wgc2xzBiWJw0De3YPFZjvI2ctGkK5
         P6K2yWKtTN9bdXdxRs3aWjstDiiHUxi6yOJTNRqG98WHLDKfm7pG+nvrNjqBuC3eidh8
         13aR4gzkcjKBrT6lWHNElOOpveUnFvgfLdSOiV0jdXBiYdITs3E9wJArT6lwI8DfO9uv
         0T7b8Gn39OhLbRkHec10Jcth7WIf9eY2jxZDj3x77+V7TCLUfwydCEmwYqVeSKROWwk1
         BokG/PNOsA4ef7npnLuFUQ305aV16IiLDPRVs/v//Zb5cY2YhQadqnl+OWYmgk25f6k3
         mPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037966; x=1722642766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=llejoZrdon57W9xsVhvYm+Y3TlGXrlI82zAzYPdXkSZZWb832kCqKXPKSINRxDxxU/
         b8X1brKhKW/NfUq4qg4b+lxE6R/pXnLO4fSn7gaSXM5JgB16ymaRGyQs/UH/Pdh+Pk69
         jpZerdAYmI1XDphAz+0cTbm9g705sgeeNYSa9AxD0aJq3DLyf4p8WePTTFFnpIIL7/Vg
         PopK7eVmDSXsxX6gk3ecnOewljj42u0ilfcECozPzbkmAIa8EX0dhZDUhG+r2YcRYGM1
         puWX7X6/5CtjFRN1vU9wGySboyB2sLP4sm1stU76mY++GmqZgANUvP3b/arsHPH+sA2v
         aa9w==
X-Forwarded-Encrypted: i=1; AJvYcCXHJoXugkt6WlUZjdLEctpCEyz29V6u8cQ1TXxOhUVXTk7XeVHIrAtNE08rhdBJL0VQyxjHMPCejAGH4F0yrL+xTNL7jLUrmCYXBJvJHg==
X-Gm-Message-State: AOJu0Yz4JNrOupuhC+IOYNRBLXk0KjFnrUZZlTjtpZdpE9k0nX4wbbNz
	Z5uO31QWv2xllh+gySvI5WPFF2XmX0LOSKBNmq9jVrI4Tg8EYh/TQM+z52xmx8KzLrAyktAOIP/
	ssQ==
X-Google-Smtp-Source: AGHT+IFeDzTSYc0yloJqv412y/9OHddQLGngXAZq8SjSSTQr+cl72qk3J3BVbl3XjHWFKDqTN/CvEh64V1I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8703:b0:70d:1285:bbcf with SMTP id
 d2e1a72fcca58-70ece93a09amr3050b3a.0.1722037965825; Fri, 26 Jul 2024 16:52:45
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-5-seanjc@google.com>
Subject: [PATCH v12 04/84] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd8c212b8de7..656e931ac39e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3186,7 +3186,7 @@ static void kvm_set_page_accessed(struct page *page)
 
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_accessed(page);
@@ -3211,7 +3211,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_dirty(page);
-- 
2.46.0.rc1.232.g9752f9e123-goog

