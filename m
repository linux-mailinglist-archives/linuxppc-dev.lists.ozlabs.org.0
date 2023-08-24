Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6F78697B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:06:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hTSVm1Kp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbHz40Tgz3dDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:06:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hTSVm1Kp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbGg3xSQz3d26
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:04:59 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf092a16c9so50785505ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692864294; x=1693469094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV3LzITJwv11zEQaTKqycZRD5Ms/f2qTTnP9Z8Na2Dc=;
        b=hTSVm1KpsiVl32iXwZgDBmPH+embp/HaAL1ZLu2uR7cF3H6hTl34Q9JKEmO30iZR28
         vaejshZyHwxBtl2bVKV19vbjkB/8FGyJFYPLkrisnF9qRlAILfqlwg9vcKyHYNMNE+7T
         4vD6MFlPiDmwbS1FIANXvqkYrzJusW2+2tYbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864294; x=1693469094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV3LzITJwv11zEQaTKqycZRD5Ms/f2qTTnP9Z8Na2Dc=;
        b=CvN9uPRF6vKFJMS2NpmAs6nHmMYyKIT+zzJQVgImzJddHSyg3aTQj3yUin2igHtiS6
         2UhUyX9Jsdc6qcLoSzZK8jVpjdoFV2/GoC0gG7i1zKOFJpi51RNGMRmJ0X4dHl5FpMkC
         et13KV05/QUdwSBanlud+q4KW2HgRHrR8/N0QdfCoZLYWd/gPi+ie6sWboK/dRV1//Kq
         /lzsVw8bKJz5aoY4nsEwDZe6RPI0V7TTnYUZ1ipow9TKEwysyhiZqedHmewz84w/cog6
         e5fljVB0T2HNA5GFHj36ZRsXOVkH1cqzAbbowUKnpq1brJqriY7Eo/aa1cHzmDJBy98s
         mCwA==
X-Gm-Message-State: AOJu0YygVWvTaJFWexz3y632+7i3HRV+2iER1Ugck5OVCyIK92MV4J1c
	1DdqUB2H2r8lql5rN52uTVtukQ==
X-Google-Smtp-Source: AGHT+IHagCrEiCSTUeawSO2RaSCgtKrRoyrdFRSlC2mm085LYzwbHRTmVonAanytbmYPqEcAnMXU/A==
X-Received: by 2002:a17:902:ab4f:b0:1be:f53c:7d1d with SMTP id ij15-20020a170902ab4f00b001bef53c7d1dmr14752623plb.23.1692864293682;
        Thu, 24 Aug 2023 01:04:53 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:515:8b2a:90c3:b79e])
        by smtp.gmail.com with UTF8SMTPSA id g12-20020a1709026b4c00b001bdb167f6ebsm12152992plt.94.2023.08.24.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:04:53 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v8 1/8] KVM: Assert that a page's refcount is elevated when marking accessed/dirty
Date: Thu, 24 Aug 2023 17:04:01 +0900
Message-ID: <20230824080408.2933205-2-stevensd@google.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824080408.2933205-1-stevensd@google.com>
References: <20230824080408.2933205-1-stevensd@google.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
index 5bbb5612b207..1e4586aaa6cb 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2888,6 +2888,19 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
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
2.42.0.rc1.204.g551eb34607-goog

