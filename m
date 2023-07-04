Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27450746B29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:53:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AN1PbDYI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFQc0fsjz3c3n
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AN1PbDYI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFNp65XSz2yxK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:51:38 +1000 (AEST)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-55e04a83465so3639106eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688457095; x=1691049095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kK+di2LH2O2PIVMiKS4D/tuGXEaFYURT1f0nc5afMRA=;
        b=AN1PbDYID8uXga3qYegkFGjesKwc0Hlh/fi8AmJAU1/smu162cLbw0Y60BCvXS/NQa
         xxi7dK9Xc3uBscDPa3brvsKzNqz2xE6KDB/zQ94CKEkYBMGicId1sub8nxB7zvTwk449
         5jItIUUfNJdzEetuDKpMFg599Q6jMYqYE5Ygc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457095; x=1691049095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kK+di2LH2O2PIVMiKS4D/tuGXEaFYURT1f0nc5afMRA=;
        b=YWGouo5ovUlwox8xleIolEQor3JjCCm7XsdUPetZx4ciGUVhgmbES0kWNY8jBm6J+u
         QFRcrrJgAIbMEsKm2507LUHkmCzbTQK3AIfYIENb+9t2RZOgXEyZ7QU7iA77lSjc/dzA
         oAGP45Y7i61IV2JsvML4jeCO4y40CtvQG5FjvrvTH0Y5wpBZNhdDtEgZKBpghh/B6PFg
         +JOvHJheebLLpltzcHBJCVpmtPgWRCE3vn/HI2Mwv/gBCCQzIYj83lsogvic8AiDxbz1
         YxLT+h+MA2/NcBTIALnQWk3Fg4r+L7IxX69UZ2yeXVaBPlpvFawty/q+V4UmUW0Gp6zj
         mqgw==
X-Gm-Message-State: AC+VfDx1WgOrPZgk62cjyPFjTdollkK/SfuAI9IeMPHkfSOzmDHbCW2W
	4b44B0Dyba5fjB5kBF9MU7I48Q==
X-Google-Smtp-Source: ACHHUZ6QINB9a6PnyEez1WUpngKCHju6pHXnmFm3K1Dg70QA+/T/oNbclZKeG1lrixsFr0eCuXP5Nw==
X-Received: by 2002:a05:6808:238d:b0:3a3:61fc:f913 with SMTP id bp13-20020a056808238d00b003a361fcf913mr15281455oib.0.1688457095409;
        Tue, 04 Jul 2023 00:51:35 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a11b:bff7:d8ae:bb0])
        by smtp.gmail.com with UTF8SMTPSA id px4-20020a17090b270400b0024e37e0a67dsm10734152pjb.20.2023.07.04.00.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:51:35 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v7 1/8] KVM: Assert that a page's refcount is elevated when marking accessed/dirty
Date: Tue,  4 Jul 2023 16:50:46 +0900
Message-ID: <20230704075054.3344915-2-stevensd@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
In-Reply-To: <20230704075054.3344915-1-stevensd@google.com>
References: <20230704075054.3344915-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sean Christopherson <seanjc@google.com>

Assert that a page's refcount is elevated, i.e. that _something_ holds a
reference to the page, when KVM marks a page as accessed and/or dirty.
KVM typically doesn't hold a reference to pages that are mapped into the
guest, e.g. to allow page migration, compaction, swap, etc., and instead
relies on mmu_notifiers to react to changes in the primary MMU.

Incorrect handling of mmu_notifier events (or similar mechanisms) can
result in KVM keeping a mapping beyond the lifetime of the backing page,
i.e. can (and often does) result in use-after-free.  Yelling if KVM marks
a freed page as accessed/dirty doesn't prevent badness as KVM usually
only does A/D updates when unmapping memory from the guest, i.e. the
assertion fires well after an underlying bug has occurred, but yelling
does help detect, triage, and debug use-after-free bugs.

Note, the assertion must use page_count(), NOT page_ref_count()!  For
hugepages, the returned struct page may be a tailpage and thus not have
its own refcount.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b838c8f71349..371bd783ff2b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2885,6 +2885,19 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
 static bool kvm_is_ad_tracked_page(struct page *page)
 {
+	/*
+	 * Assert that KVM isn't attempting to mark a freed page as Accessed or
+	 * Dirty, i.e. that KVM's MMU doesn't have a use-after-free bug.  KVM
+	 * (typically) doesn't pin pages that are mapped in KVM's MMU, and
+	 * instead relies on mmu_notifiers to know when a mapping needs to be
+	 * zapped/invalidated.  Unmapping from KVM's MMU must happen _before_
+	 * KVM returns from its mmu_notifier, i.e. the page should have an
+	 * elevated refcount at this point even though KVM doesn't hold a
+	 * reference of its own.
+	 */
+	if (WARN_ON_ONCE(!page_count(page)))
+		return false;
+
 	/*
 	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
 	 * touched (e.g. set dirty) except by its owner".
-- 
2.41.0.255.g8b1d071c50-goog

