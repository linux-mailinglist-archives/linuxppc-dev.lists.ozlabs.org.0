Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CDA7869C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:12:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vrd5G9up;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbQz5NRRz3fCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:12:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vrd5G9up;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbHH0CB2z3dGQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:05:30 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-56a9c951aaaso2560902a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692864329; x=1693469129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI/ttp/wxMkRYZ+oyQ2NmS2HxwoQO77IewL5mtwNCh0=;
        b=Vrd5G9upmFX23Dc2l1UOiVR7mwQuxLdJALTe566riReLawye0Iez9RByru+Lw1LGHs
         +bLoUARoikkBnCqoL1flcVwqreaLS334iX1gCgyZpEjqUf218Tus3zznhtCtfSXcIQ+Z
         YpZi1+Q5+CVa8tvqM3unr1KQ1huvUG9hP9dD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864329; x=1693469129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hI/ttp/wxMkRYZ+oyQ2NmS2HxwoQO77IewL5mtwNCh0=;
        b=CcLzyd3pqmqgE1DX/hYuTzDrhOmzDL00M8l9AZHLoxC/n3gGfjMgbundUqGNGlBbF0
         MCe+XK0AnAGtZcjYmTo8xr7mXXkh0QYSsgxFjXKFmZzASMewm4w5jhgLBvI7IzzirbYD
         XK0Ujv73n1pXUokRPJowolfuC5vdH9OVkxGyV8RNXOLzBOGKKmsip3YCfqlfJ2dWpPJ1
         bSRd3z3VQQB9H13FWSqr1oUyHKz9DUGm1X1xc+Z/jXHk+HV5zKbnKk03F6wyCidMjoI7
         XWHYznuZ9wDtw05IIy6CVmJlEA+Ar2/Lt3xu9ScuYwduTyVdc5gIeVaMLpHCz1LQHRr8
         mgRA==
X-Gm-Message-State: AOJu0YzjUTHa8gtqgGwMAajG3MY/PIc+Eb37DbslQTBVqsyMd37fFocc
	JrpHortbLE2tFOWrKC11GhBt1Q==
X-Google-Smtp-Source: AGHT+IGr4o4edi/X3Imw/dOG9514f6ovvLqJxfkblt2y6pWdfKpxCplBDdHZn5gaAedd/iurfPc6oA==
X-Received: by 2002:a17:90b:3590:b0:267:f094:afcf with SMTP id mm16-20020a17090b359000b00267f094afcfmr11065174pjb.12.1692864328780;
        Thu, 24 Aug 2023 01:05:28 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:515:8b2a:90c3:b79e])
        by smtp.gmail.com with UTF8SMTPSA id g2-20020a17090adac200b0026d034f6badsm967988pjx.38.2023.08.24.01.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:05:28 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v8 8/8] KVM: mmu: remove __gfn_to_pfn_memslot
Date: Thu, 24 Aug 2023 17:04:08 +0900
Message-ID: <20230824080408.2933205-9-stevensd@google.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, David Stevens <stevensd@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

All callers have been migrated to __kvm_follow_pfn.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virt/kvm/kvm_main.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fa1848c6c84f..aebaf4a7340e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2728,39 +2728,6 @@ kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll)
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
-		.try_map_writable = !!writable,
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
2.42.0.rc1.204.g551eb34607-goog

