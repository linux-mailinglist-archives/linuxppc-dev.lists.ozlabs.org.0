Return-Path: <linuxppc-dev+bounces-2065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A29999087
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXc4Nzgz3cVB;
	Fri, 11 Oct 2024 05:27:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584864;
	cv=none; b=UuuL8XGumEsfDrwbcU1gyQ0dsMQcNpqVxheHOLW42coMKAYCQMtFDNJZccb+Yf+DFAmOGXxWNVIc4/1uK9efCgeeQ5yDxYj/OTLuks481WrUjHabk3zEFqx3J888oKWudMkltFN9eilN+Ij4yUZeGCgJkh2SmVHRYThgTxLLHOayQmKQsXxVe6BKHhtbL0eD7dSDFXsDtHw3Y6l3RYUNXf3pqsgS37hmR0/rusaP9IBCPUoDrc0mQS/SQJ3G0LtpRhrfVLH7LoCjCcbgXvmJleEwWGFnXAWYBKR89+DWaPE+MWEIIXJFjkTuAHZNDDbee47nHwi8RHvZ+1bh3ZIUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584864; c=relaxed/relaxed;
	bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ipQm8eNgkQTLxoOrtDNHqelRQBYRLwyU8Q03UfgvwtJcoARmQ3aLqFkzY+vv28uZkcHXlyxy+I9Wrd3iggVHgkY9Mw8Wt+UkiBIyEDM8IDmSeL9NuI9VX0X512UBfj6GOP9iF+F/IxMwcUfyqu9vYcF7BewzYPVEoQrr1k9RjsI81zBrrLmG3xUacbYi9ZTm/kc+9iZAv3fgrXl1OmTPrNWTcBu2pGxlJcPurDYRm5nVAzM4QY1+YNI3HraMQrBu1jREuQ4jR/95NwEvoL5/B0fZZNNB9NYX5sr9lT+5q8m4XAVosJGIsCAxsIqj1+s9ODUShFC11pWhURRHFVn6DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yhpIbq53; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3nrwizwykddykwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yhpIbq53;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3nrwizwykddykwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXb5FhFz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:43 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e1ed58e9bso1479501b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584862; x=1729189662; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=yhpIbq53wPab7wRM3f0NRcDLKtbqTNzwEvkMvFRkYW/KvTGfYdBXBhxTJyo+QaO5SS
         Wo4nXtZXsdpZyiMn05VSp648K2T1zF7lSGgN1c7OgdIq8tZMuVzfjCOGMrIBaBX3B1jk
         hwVElDjSXYaeZ78myd64iR1CrX2C67pbp/njIgEMtorMNMW+YMq0Ir3R19lxx9lsEgaf
         RioOKOFg/iCidF7jOg/euJxMMmhtpFqZvidHRUV1ajP0gn9fupiGUO91j8DIjgnV0xjZ
         eST7xW1FZthsqOjpti72gQ/O8AeNJwmPH3BVHybL24p8BCz150W+yEFWqu7HmCXjK+Q1
         AtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584862; x=1729189662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=rHXz1qZucWt5wlNeexKyvwAkRN+94ZlvXTwdwAhiVP8a7DNsZBF/rZwMyqY3dkayrN
         M4mHdYhODxmPO+TIoRp3QefMaT3OSSBSBMmzTfOmiR/TIXxwrtGYqo9RrwPrWzHeNECc
         Y+M5JVK3jkgfjvhtggFI2OjdiJiuOmqsqWij7s6AOhUOQrjFZJoGxD1forjo/Xgo/aoK
         W6RZBvnzEiDEd/Iy0XNcqvLj1tjNDS9+B7bHNgOYn9DSk951sU/nR2LtgXSoazErF2tV
         LwFdeI34EDoaU441G/g+wWq2UBFEmd+9Q4IXFfvm97E0p+/2WuKzlPZWo25KaqFKE9Om
         WodQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzPTqaFlCzAJ4fAUO2L0NaQJKWEESg60o/Z0e58AVRuMNfaPijWWWzNc5sy7acuyWdMTfBwcI9NueaHNE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMHIvbwFizkMtMFUfRCA/TqUjZkj8iq3MM4B2BWaZXIgYsSKa2
	94hNv20MFmOA3PbAIGKzbjCkFQlNT9bWxgqhn35FDhjciP/9j7iX7tFIzYfSf7/9yDuXjPzaSkD
	0EQ==
X-Google-Smtp-Source: AGHT+IFRVsKTyvnlBUrQtNNg8zvYT0OU1qw5Av8a7Gq/P6vdrCxit4uLl8sEcLrSKXXTWA/vla3myJTtPpY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9443:b0:71d:ff10:7c4 with SMTP id
 d2e1a72fcca58-71e1dbd1d0fmr15196b3a.4.1728584861919; Thu, 10 Oct 2024
 11:27:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:22 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-81-seanjc@google.com>
Subject: [PATCH v13 80/85] KVM: s390: Use kvm_release_page_dirty() to unpin
 "struct page" memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use kvm_release_page_dirty() when unpinning guest pages, as the pfn was
retrieved via pin_guest_page(), i.e. is guaranteed to be backed by struct
page memory.  This will allow dropping kvm_release_pfn_dirty() and
friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/vsie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 763a070f5955..e1fdf83879cf 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -670,7 +670,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 /* Unpins a page previously pinned via pin_guest_page, marking it as dirty. */
 static void unpin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t hpa)
 {
-	kvm_release_pfn_dirty(hpa >> PAGE_SHIFT);
+	kvm_release_page_dirty(pfn_to_page(hpa >> PAGE_SHIFT));
 	/* mark the page always as dirty for migration */
 	mark_page_dirty(kvm, gpa_to_gfn(gpa));
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


