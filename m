Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F070793DBE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:09:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UcgSgP6h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4kH6KPhz3fpF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:09:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UcgSgP6h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=39zakzgykddigsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4MY0zCcz3dV9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:29 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5acc1b96so12420495ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038007; x=1722642807; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=UcgSgP6hXAjygCXpG3MGTQ7124MpOmEwxVGIbHPdTx807yVx8k+8U+EQLEc8+gEkiG
         7KWI7oEgO0fsdLr+uHP7EWaqNLNbT5zq5W/kRNpJ7vgGiUfiHSbFMhRBboApLDOEeVA8
         LiXrigGkBdvj5Bw7fC+j04F+QRxo3EpFMTjP1WJGr9g4LuTm1ZGvuE2P5NUyrBwa8uVa
         /mz7Wx1EDT/WGYcZHmB+GOOYrdUkMgtahYVU6p6pBL10MU0uq9mYSnVDuy2T1rV3QMWC
         wgfrHRuXnhLMO7uYr6VwBfEpJvSMdkrPApTKKgmPKxjvnmONmLgy0GJOG3JZThzsqvHi
         5/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038007; x=1722642807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=Bx21JaG31dJ7N38qTxT//0BhtkIUFuG+AKBjqdjlI5y1XW9eWWzrfIixMqVtVzhSqc
         RiYyrp/pjP24/Qy4UJNb+eHZjIOqW6PkaPczO2uuDPWZ7zBEkn6UPJSUUCZDmnqg86jo
         Dr1yd0wn7ciEeVR140vJTzkscGrWSKZXmg4T4rsYRAKKGGd2OPIavAGLAS8T47MTqZUM
         IJhO2bUCEng4pSvZAJIqpFJ/f7BQHjm4sFuLwSgMIJAEVn80PRIsS0yrqRFkc5u2/8nq
         SyOL40Jqd3kOg1lVI9Q3SoDaCOQxBjSXm02w2aZc+sRDxACaNqCYjxw7g5hDDuFukR8u
         5vnw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7ozhAu75SfnXkYkmdBh2LEiAA0fjdvYYo4o0+UXLEvkH8XqHzOZb46u8qOwBs1L+y1letcFcqBXwmIDSASIZehp8J786jIAbIdvHqw==
X-Gm-Message-State: AOJu0Yyh11ytJztlgqwybv/EtVztMWSwSGk1vuK67oJ7xhSpVtVK80L6
	h+6o/Ow8+R/sobb2y7A4IHa3yhaxV91Y+nfUVFSbP98aXw0jQfUOt642LLtJxr3KSHf70bH+7t9
	Lbw==
X-Google-Smtp-Source: AGHT+IFyTmAdCKGjl4Efd/ur3Lgpr5WGUo8BVtVPeI74QsMUPNsZhPnU9qRmgrxg08u1lYU5BCnREsvFCzc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41ce:b0:1fa:acf0:72d6 with SMTP id
 d9443c01a7336-1ff0483372emr764645ad.3.1722038007284; Fri, 26 Jul 2024
 16:53:27 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:33 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-25-seanjc@google.com>
Subject: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead of
 single-entry array
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

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3d717a131906..8e83d3f043f1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2763,7 +2763,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2773,8 +2773,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn = page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable = true;
 		return true;
-- 
2.46.0.rc1.232.g9752f9e123-goog

