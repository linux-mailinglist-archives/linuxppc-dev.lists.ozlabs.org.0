Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B684746B56
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:59:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k+iMyiIZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFYm1N47z3cPY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k+iMyiIZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFPN4fY7z3btj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:52:08 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55adfa72d3fso2627592a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688457126; x=1691049126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qee/VKQzM1LmZxAkmmj2aucWtJOH/l94Gljx+K2KDa8=;
        b=k+iMyiIZ/rvkyJFLnpCxfPh2kihs9hKp7WCZMgRJ/KWcfxGthOuSTxsh7ufzJA/Bf/
         mzh6BZEJrCQrd57esW6bSICX4N5fXXviTpScCU4T+p1S9Ex1CyHnmwVooY7ZQFENwzJz
         zEkI3p/OBQ13cxCJNgSaA3m+7cI5QWfuYcJr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457126; x=1691049126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qee/VKQzM1LmZxAkmmj2aucWtJOH/l94Gljx+K2KDa8=;
        b=a1fRBtx/hUadxRceRFTfwoRxKjSiqgm5PrRNegsrzSAa/s1/uz+/BHpeaZk6LsbOE9
         e2LLZidRCJsAEjoOyz4dICiuvQZu/EmvN+tyYb7BunPl8u1P9diHKNRe8UOLHnnYrPCn
         UX1SPU/acVmhCYK/n0oX1Nb1k12MXFfxmmQJ3dJWPwWsBsUFN9yUPWH/pz/1DVhOc747
         fFyPjLy42U59Lz5fVrudG8q3sFAjBvB/zR8b5QWKSZJ2PYuC4hp60bYTrjDTalB2DEtt
         oxah5C0rbcJ4tJT0ions6nCbUAFZ3JPSBHnKu+jfuJph3FhL4wA9ln14YKNkbSUngXnK
         /Qxg==
X-Gm-Message-State: AC+VfDyOaz3JZKBWtKG7Q7Zpiz8ciRlM94J1hadlkYjDsEcsm4THYrbv
	0E9ONe1jbKUOltWmxHDA4igizQ==
X-Google-Smtp-Source: ACHHUZ6+9ouW33wDPBoDXHeV/P1AI/Ns1TtvrKGhlPJ4FwNyTE2MhXe7ejlBjshhe6QIZRhVgVHIEg==
X-Received: by 2002:a05:6a20:8f0c:b0:117:a2f3:3c93 with SMTP id b12-20020a056a208f0c00b00117a2f33c93mr13849232pzk.2.1688457126666;
        Tue, 04 Jul 2023 00:52:06 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a11b:bff7:d8ae:bb0])
        by smtp.gmail.com with UTF8SMTPSA id jm23-20020a17090304d700b001b51b3e84cesm16610112plb.166.2023.07.04.00.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:52:06 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v7 8/8] KVM: remove __gfn_to_pfn_memslot
Date: Tue,  4 Jul 2023 16:50:53 +0900
Message-ID: <20230704075054.3344915-9-stevensd@google.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

All callers have been migrated to __kvm_follow_pfn.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virt/kvm/kvm_main.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0f7b41f220b6..5b5afd70f239 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2712,39 +2712,6 @@ kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll)
 }
 EXPORT_SYMBOL_GPL(__kvm_follow_pfn);
 
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool atomic, bool interruptible, bool *async,
-			       bool write_fault, bool *writable, hva_t *hva)
-{
-	kvm_pfn_t pfn;
-	struct kvm_follow_pfn foll = {
-		.slot = slot,
-		.gfn = gfn,
-		.flags = FOLL_GET,
-		.atomic = atomic,
-		.allow_write_mapping = !!writable,
-	};
-
-	if (write_fault)
-		foll.flags |= FOLL_WRITE;
-	if (async)
-		foll.flags |= FOLL_NOWAIT;
-	if (interruptible)
-		foll.flags |= FOLL_INTERRUPTIBLE;
-
-	pfn = __kvm_follow_pfn(&foll);
-	if (pfn == KVM_PFN_ERR_NEEDS_IO) {
-		*async = true;
-		pfn = KVM_PFN_ERR_FAULT;
-	}
-	if (hva)
-		*hva = foll.hva;
-	if (writable)
-		*writable = foll.writable;
-	return pfn;
-}
-EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
-
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-- 
2.41.0.255.g8b1d071c50-goog

