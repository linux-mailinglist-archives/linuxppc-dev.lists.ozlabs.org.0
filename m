Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF83E9626
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFrH2YHzz3fkb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CZuo5gIZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CZuo5gIZ; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF4T2QTfz3cMW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:04:09 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso10358583pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2i616JlEKtPLceUUCFltWk30KazQ8LPnIgBLdHO5H14=;
 b=CZuo5gIZ+d9XJdBV2l4Eqoug+9wAhSYuKmHY9WQYzDdKB0iVAK7tJdg/WjNzobpLVH
 o9ZjSEHGEMobaee8lcbVew7w4ShhA3c1A0TPjc79BjBh8SVs4zb72gnuxCye8BHq9mxX
 gCNJrJjI2cmW+PJ3akMB9EHgZ8skP14p7PXSL0wCsAKZasVZOYC/LrtgKuFE6YNvJUmZ
 6Am+tNx0Qo3yim22R8paWEG9OfATSJS4nPiK/37KTTzxsbV1yxjNXM6Y2sgssWmWRm6R
 JV4vowG+WO7RQfQm862l4s8RUO+dnxYR01owbdms+rdKg74XEtjJG3DfPA+dzgXjLCxQ
 w9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2i616JlEKtPLceUUCFltWk30KazQ8LPnIgBLdHO5H14=;
 b=VmFCw30zP8Oshk3mugUBGXVToIKj1EeiUL1K0b18VSiHA1t61A3eeVoTJDiRXte/BG
 P59Ie2aAIefH+yFSLFESgDqJfdLARkMRv6CdD7i3wm5a6/xKOML6sWvfmfFCSlLXbGpS
 6PK2pG6tGt8caAtlgvPq7N3R/a4xZlQjwJlooPMv4e/+/EIr/K/W8AkS1szVLkqeO15C
 lDHSrMX7IEWlnv1jZyRn0jZFBv1IHontNsfiSRfyzersAq0Ou7I1HPfeXQtiSMD2GqjH
 ssIAVqTWm7tfFJdvMT51x9BGU8IOOHdsaahoiW/f/6nimWi1DFGo+4mM29gH3KjN60NP
 qlcQ==
X-Gm-Message-State: AOAM530oDCZbpgwYOLdeVS1wTwr9MmgqTGmNvWZh4D2rHanWr6laQiMF
 O7WREfYItZgPgPjzKziVZoU=
X-Google-Smtp-Source: ABdhPJwWHrCBicsMfJQly5fMPBDZpgAcu/r8DOPamVr3DJWzXGqzOze/rDmlNx1fL1MvoZPVKTSJrg==
X-Received: by 2002:a17:90b:1d82:: with SMTP id
 pf2mr4146868pjb.212.1628697847217; 
 Wed, 11 Aug 2021 09:04:07 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:04:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 55/60] KVM: PPC: Book3S HV P9: Add unlikely annotation for
 !mmu_ready
Date: Thu, 12 Aug 2021 02:01:29 +1000
Message-Id: <20210811160134.904987-56-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mmu will almost always be ready.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 979223018c8e..d3fc486a4817 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4399,7 +4399,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->runner = vcpu;
 
 	/* See if the MMU is ready to go */
-	if (!kvm->arch.mmu_ready) {
+	if (unlikely(!kvm->arch.mmu_ready)) {
 		r = kvmhv_setup_mmu(vcpu);
 		if (r) {
 			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-- 
2.23.0

