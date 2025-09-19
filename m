Return-Path: <linuxppc-dev+bounces-12406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125BCB877BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 02:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSYQD20Xjz3cfW;
	Fri, 19 Sep 2025 10:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758242004;
	cv=none; b=AK8hzMfTzUIJGgeVY4CdoBig3UgWR6ybzf6Egz/Eh5OC8lqPR0fEcrcsv0jmvQZe2g4YDp0DyM2W7Fu+YdGRR1T6A/KyyK8QYKDyc5gd3XhoJjdwnB75W0BaoSlGK6zuGhEZ9oBOEJKzlATRotlf2S/Qc02L2b0sZNOZfx/pHXwrKLlN5V9TZIwz7amm2aCAS5uDy/QS6RHf/eVWIOFuFs7tNZ2DoK9ZVAZZYqPQ2MY3KOHRmp++v56G0zf1BfoJFPfOZJjdxg1Q5EX1dn76j4iO14AXpgJmAY7NG7lX1CNrci0B54J2lj0xMlRsRqypG87QC2tNDLf/3dyDVl1Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758242004; c=relaxed/relaxed;
	bh=RD/DK6kAG0c67mN/7HOpwDxU9lDZGk0fnKN4zAB6ORM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a4VyM5H3nGB/qFJpd5/4RjCI62Iq2kavAweogL3DYfQIEiWh6LfLqdxFxUSZsI1oSym1sjSDXZxw/X0JxGsrB+xH1vebrsmbkdEPXILCxkhbrbXIpsb16WFkqrWSXJnA65lmIA220jVhhIVxxhYXZrC7pjG4jDeEgwOkIrViVMABsIGpqKlhXd/8ksljcTX5HRl0u1M/VGBETq1ag2Cxma+Y0/lbGuT97U/IJKPARwW9Hm1BRw0tZu03AuWer6m98XOW1ModzCBmOUqYnf8JQx0RyeZNHyUpzVQHTnLtsdUFkRdSDp++iQSukr4sbHfnML625WbvwLzsi65g/1w6Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kZJ5zllN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=30atmaaykdjom84hd6aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kZJ5zllN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=30atmaaykdjom84hd6aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSYQC4YK0z3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 10:33:23 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32df881dce2so1517668a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 17:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758242001; x=1758846801; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RD/DK6kAG0c67mN/7HOpwDxU9lDZGk0fnKN4zAB6ORM=;
        b=kZJ5zllN0CY2H8fhJJSMdc9B59+eAecWpByx8Mkc9OadTNuXxbX9d3K+w6kuCGAIvD
         x6K9/sPCtKfK6+EGMtKHzjbJ9+S5SdWLK+4Bcm+SQnGSojey+6Xg57pocjsoDunxczMw
         d9wA8eXHRmNkKz0n7FTP+nnsb/6X7xq/0GB7utWmiHZp6zoegNxD4vV7yPjqtZUxxlHZ
         QJVeP8fLuJM0wYhMf2bo0UiHUxo86Hs2qG12ijHw/7JGADdQrpq4+FTKeBShnyeyzl5W
         CgZs5Qn+TtcIgtmiI+g2neLlAukr8AQObhSzV5P0Gx/twYPU1M1E/Txa1LDFn496O1TN
         4T+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242001; x=1758846801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RD/DK6kAG0c67mN/7HOpwDxU9lDZGk0fnKN4zAB6ORM=;
        b=uGv4eoCjiIpmCQAsHoUqyHpsd04tSn+63LzmYxgsV2uMfFD9BH/wfiXesBfjgABEHG
         8j8Ixmb8HwdhxbJREYhs1I3bcv1QJf/QMxmIVmmvRUCYarLUqrfsCoLkPq+ZoiZP9bId
         tTYCCU4XL//SJ2yasxDtkHgx6o9hjOjxYHBgWrkhejflPR7SY3jYU6ytmJ+iZ+wjrXqy
         eoEjfCPtXxnh9ly6B/ocil4clu0e9yZIHTE5sXmcXD+iO/mnsltlOniWyFwG2a5kqEzn
         Bgek/NwunRf7VEczd9J39ku1jtPAV1wdvMx8eqO9z6S7OjzYFH4jXbrqYrYjtx8zQh+9
         2dXg==
X-Gm-Message-State: AOJu0Yzt856vYK1QF811Hb3iydoY3xz+/4HR8bsQTW7pUv9cmo4UyH2r
	LXug2rsms/v6xPLXUuGOa+B2xHi77qumg5Ov8eHB/PhNFReYSW/rEuvYqzlSOR594kkTRqks1zA
	FgY93vQ==
X-Google-Smtp-Source: AGHT+IEhgM6vmYfPOslFAinl0W4DEpXPFYuyJm2Gwrf0Sw+W4NYJijAe6YZgNnvs4sWIJBhjxXbmqFTMuoE=
X-Received: from pjbpw5.prod.google.com ([2002:a17:90b:2785:b0:330:7dd8:2dc2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c88:b0:32e:b36b:3711
 with SMTP id 98e67ed59e1d1-3309836d7c3mr1410096a91.28.1758242001517; Thu, 18
 Sep 2025 17:33:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Sep 2025 17:33:02 -0700
In-Reply-To: <20250919003303.1355064-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250919003303.1355064-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250919003303.1355064-5-seanjc@google.com>
Subject: [PATCH v2 4/5] KVM: x86: Drop pointless exports of kvm_arch_xxx() hooks
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Drop the exporting of several kvm_arch_xxx() hooks that are only called
from arch-neutral code, i.e. that are only called from kvm.ko.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e07936efacd4..ea0fffb24d4d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13542,14 +13542,12 @@ void kvm_arch_register_noncoherent_dma(struct kvm *kvm)
 	if (atomic_inc_return(&kvm->arch.noncoherent_dma_count) == 1)
 		kvm_noncoherent_dma_assignment_start_or_stop(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_register_noncoherent_dma);
 
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm)
 {
 	if (!atomic_dec_return(&kvm->arch.noncoherent_dma_count))
 		kvm_noncoherent_dma_assignment_start_or_stop(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_unregister_noncoherent_dma);
 
 bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 {
@@ -13561,7 +13559,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 {
 	return (vcpu->arch.msr_kvm_poll_control & 1) == 0;
 }
-EXPORT_SYMBOL_GPL(kvm_arch_no_poll);
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
 /*
-- 
2.51.0.470.ga7dc726c21-goog


