Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53993DCB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:44:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bzCzZJ3E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5VN1F16z3dKF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bzCzZJ3E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3xzekzgykdjom84hd6aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PY5vlJz3dWF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:13 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e02b5792baaso429111276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038112; x=1722642912; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hy7goaarUlwaWZyx1m4yCokRE7UoQ8eGBMKWJ4Hgr8=;
        b=bzCzZJ3EFn1rGCpLtmrzaKhOoHtz2vdJ4iRZ9gz5PHxNIn/W/9ekpEPXdmRssWxTHU
         bW8/AEp/qeIXpF/czgOAFZwgVSBEYzQXCHhaPTqLaQwFQrEmNnBabOZBaUvpdKnlnKYQ
         HInmjjuxifXRdC/klMFf5ritjouKaav78+QoBYiTJMCTBd9v5CK7Bp8tX04LGvCfB8GG
         8rUnZqjjGbVo0RbB8enYP3VIBGjr1nQJ3YAAfkfJxw+z0wGKL9kT2fvsBHrHOt10P8Te
         gtqPWJ9uA0ub64T0itFyOi8WEsZS8dCtYHPBXcGZbHcuhYDBwfh7E0ugCM044bdkxLBu
         zgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038112; x=1722642912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hy7goaarUlwaWZyx1m4yCokRE7UoQ8eGBMKWJ4Hgr8=;
        b=fmNO2lExtlKiDKPIdl4HV/4kpxLWlet/EDvGAyP8JhY82iRoW7keb4ZPsH1jxlYOOg
         dXY/8mYo/8wD6Fv5Gv74EHD2BxQSx8e/b2ZBqEoVkkWmJU9eP4KDPwKE4XaTTP2IArjm
         cMs++kn/SJbf1meX1L4iXj34sRSrIEN10iRgiRB1B2FiCS4mXxs5rOopkEm7qxqZFha8
         Wm6E1fXXpR3CMm/KevCZS6AUJm4yaI+Dg/P0CIRxifV53JUKfzAixhPd+4IIO5lTvbOu
         p70/E73LlQYNKrvMTAL+dZUBYf+llm9XdRBoVGQNPKc7CfRfJX1vSxDIrU1Kd+HLXJbu
         iJZw==
X-Forwarded-Encrypted: i=1; AJvYcCWSCXhDNcBhifDKPTRPUCYkXjZFO+uk7S+VJLqiG1lIqI/+HzlrxvLJJ7QJ+xlHOTEVcXaa8vXHcA0d94U/0rNe62AXKrRj/LAdMZ2XlA==
X-Gm-Message-State: AOJu0YyqVpDCfoZXSmp9tvuecoiYDrt0Lbd7t4T6K8aTJdMYl4oCJzo6
	KpzW0XEC1qYA043bGSukeLKoEwTmoCnip7d0xewn623/RqYVqq+wi1qZsgpZXEy/aoEmB9haGuW
	D3w==
X-Google-Smtp-Source: AGHT+IH925MpsiY9ahug77TjXa70fcvLwqDVLsDqA/3N0vd70sZBQGqqpgNL91Lx+sGl/PSva06bFRo6+6A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b8c:b0:e03:b0b4:9456 with SMTP id
 3f1490d57ef6-e0b5454ca99mr43273276.7.1722038111873; Fri, 26 Jul 2024 16:55:11
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:23 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-75-seanjc@google.com>
Subject: [PATCH v12 74/84] KVM: Convert gfn_to_page() to use kvm_follow_pfn()
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

Convert gfn_to_page() to the new kvm_follow_pfn() internal API, which will
eventually allow removing gfn_to_pfn() and kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6dc448602751..d0f55a6ecb31 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3181,14 +3181,16 @@ EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct page *refcounted_page = NULL;
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &refcounted_page,
+	};
 
-	pfn = gfn_to_pfn(kvm, gfn);
-
-	if (is_error_noslot_pfn(pfn))
-		return NULL;
-
-	return kvm_pfn_to_refcounted_page(pfn);
+	(void)kvm_follow_pfn(&kfp);
+	return refcounted_page;
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

