Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E531B93DC89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:25:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XkNgNNjh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW54k68gBz3fTT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:25:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XkNgNNjh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jzekzgykdgiseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NT1kxmz3dX4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:17 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-665a6dd38c8so7216637b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038055; x=1722642855; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=;
        b=XkNgNNjh5BgTjEcR3Lds6LjZkRIk/uZCGTiF7QEflZyPBVb7UUhOG/fMm9vjDeysxC
         SOkrfHuEpzV4NntVwb90qkd9A3qwONbXNN8iOvXgV0olc7MZBCceW7qlLNNHOWQco1OS
         r9aLSexH5Uw2otUKHI5hCDnxuqXl9+gjn//A9Zg9f7a7FeCfF9DgHeZlCyuxe2SwbH4M
         E5Rl9876eVbFk0EGMf7V0BjSRGOkWo+27/b/4bi+7DLuKL2cJXIA2dxsZQFifbjvd2EJ
         UnmcaZsQWVQFbKE5hech8lX0qKwaTumT1FlrkU94ySCb8i+12Zk3KwcbSUT5YuplMSBO
         LaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038055; x=1722642855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=;
        b=Yez2Kdpqmy5nIF1PKnY7iwg/StryV6PNGWQT6Wq/8NdEMpJZiQWJ97Bx7x/zM/R96v
         ItZZl7sC6cftJlpQwCfSXChg9XYEKqrblhhbsuwquL5RxIFFhI/S8Y8e0+L/CPWpkN/J
         hvDXqP4lcwe+uyLfHAdSoOPsAGRNw0b0JXtPXJico9GochcCDbLMGGSKWE5Cd0OYoICl
         xDVfw+qMCUrljxaToN+FU1c6kJ/wD4WUiyyooH1XuMaKtXAkQIRhLKOpPWa0ei0ja60M
         9Xze/LbFyoFzSEfZvng2dwxYIqZoBdWzzeQKwGgL4o7UfJ1qeqhwRgvzoffkWpdE/ysf
         keuA==
X-Forwarded-Encrypted: i=1; AJvYcCWhy6yUo4L+ZKsFcvIvekdcFrdqk1uEDMo/Z7iX3Z39I/RgDgJTZqZMvBWLMFF/DUsYS1bxPVPKqdMnxq1rC8fgRTTPTzyLhNQE5JJgXg==
X-Gm-Message-State: AOJu0Yx8Pm307+ocCIOF5HsRd2vYLVKqj0nm4YRqKS8bj9wI8uPvcii0
	AjuOfIfFe9I8o7JcP59oMmdTH8HyRzA0PVzKS7g+lYMaCMg159EnNn3u6zeqaD7f3Dtyoif1xTs
	PSQ==
X-Google-Smtp-Source: AGHT+IFpeG9OHD4NFko0QV+s2bLKC/mOPhRZ2kdDMQUp9/Z6e7qKWnbHym6UcCLJKsXB8YuZDTrWfSN5tHI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:14:b0:66a:764f:e57f with SMTP id
 00721157ae682-67a0abd50e9mr49107b3.7.1722038055008; Fri, 26 Jul 2024 16:54:15
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:56 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-48-seanjc@google.com>
Subject: [PATCH v12 47/84] KVM: x86/mmu: Don't mark unused faultin pages as accessed
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

When finishing guest page faults, don't mark pages as accessed if KVM
is resuming the guest _without_ installing a mapping, i.e. if the page
isn't being used.  While it's possible that marking the page accessed
could avoid minor thrashing due to reclaiming a page that the guest is
about to access, it's far more likely that the gfn=>pfn mapping was
was invalidated, e.g. due a memslot change, or because the corresponding
VMA is being modified.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3cdb1bd80823..95beb50748fc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4339,7 +4339,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * fault handler, and so KVM must (somewhat) speculatively mark the
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
-	if (!fault->map_writable || r == RET_PF_RETRY)
+	if (r == RET_PF_RETRY)
+		kvm_release_page_unused(fault->refcounted_page);
+	else if (!fault->map_writable)
 		kvm_release_page_clean(fault->refcounted_page);
 	else
 		kvm_release_page_dirty(fault->refcounted_page);
-- 
2.46.0.rc1.232.g9752f9e123-goog

