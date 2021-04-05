Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF395353ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:29:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCkN70VPz3fk2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F7sn4PNt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F7sn4PNt; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCXs3WpRz3c98
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:17 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 mj7-20020a17090b3687b029014d162a65b6so1168704pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c0MvDZ1F9X/SZ94TT66c0+OApX1YU3GVKikmjXf/RuQ=;
 b=F7sn4PNtawZZ+0n4PkDaXml8Zr5ys7vuudGUP/2FwhYXAIbyXJliCSpcFYCnGYCYXc
 KJHx7+6GqcS/ZQgOxTYVc7Fn3HF8cXskQrPVL3mKu9G+qF4LSkfF3VMle+B70Ne3G2Wl
 PT7qdEeG7Pg3JfXUhCCvKMNvdSzH7BT9Rq3I/2YXO9FYO11PfKv41AuyOMkJuPby0FdV
 TRwJSfFNiRSGzcc4t4jIUYx28I0VJnLfbv5Z0/oyPwPt2BwVk2PXSz8/DAMf1ZQO7zeE
 KLm0gdKr1dg4SXO4ydC3vkrYmpfEVzO47cUsLaCo/muJAZpcdDrOx0cmlsI3qaCpOmRU
 S0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0MvDZ1F9X/SZ94TT66c0+OApX1YU3GVKikmjXf/RuQ=;
 b=mK8rFy2scMZomsRG/AOTa9UG+Q9hL9YzXwdpIY5pk3DyWoMp5ZxmBXBqfqBHNgzuM7
 gvINzg2O6bld6OTasYVFpFE6qAoRzOFZ9ZdjDjwdd8irSPZXAOWLyVpOYn9rbKHx9dxi
 09YIw1k5NwkGiAF6v0zNZwpOJvHcs+faruKnrF0sLycLB0yDeHSDRlyFXIOzIcFxRnty
 FKUXFRvd9K9SwqKCOMIqvs1rb38IHppPNPMUOASGiITf8hRFflIXLzsWJKxfeocDDGQe
 WYEhUwXHAI70CgzAGMYdTrSjm8vCV1K+DEXWfzV5I1olt/w54EjGhYM9oJfVkceQ3f8z
 7GcA==
X-Gm-Message-State: AOAM532ZonlaPcw33EDxsqn2XhrP5JohM1rmY5zLRqqGq/ZZVGsbz4+X
 R9AazFryWbkTsqXQHs7e6lM=
X-Google-Smtp-Source: ABdhPJwtPrpV+zXiV4XPpDvj9qVH5USq3fAtYCWCwwtYuSrsWHqeWpm1iPvPJRRRGaU3gWu5FoOdMg==
X-Received: by 2002:a17:90b:b0d:: with SMTP id
 bf13mr23848251pjb.7.1617585675964; 
 Sun, 04 Apr 2021 18:21:15 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 21/48] KVM: PPC: Book3S HV P9: Move xive vcpu context
 management into kvmhv_p9_guest_entry
Date: Mon,  5 Apr 2021 11:19:21 +1000
Message-Id: <20210405011948.675354-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the xive management up so the low level register switching can be
pushed further down in a later patch. XIVE MMIO CI operations can run in
higher level code with machine checks, tracing, etc., available.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6ca47f26a397..2dc65d752f80 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3598,15 +3598,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
-	kvmppc_xive_push_vcpu(vcpu);
-
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
 	trap = __kvmhv_vcpu_entry_p9(vcpu);
 
-	kvmppc_xive_pull_vcpu(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -3789,7 +3785,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			trap = 0;
 		}
 	} else {
+		kvmppc_xive_push_vcpu(vcpu);
 		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
+		kvmppc_xive_pull_vcpu(vcpu);
+
 	}
 
 	vcpu->arch.slb_max = 0;
-- 
2.23.0

