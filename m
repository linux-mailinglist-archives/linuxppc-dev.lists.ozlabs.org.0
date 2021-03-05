Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2282632EE19
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:14:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWVj0kfSz3g8F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:14:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Em3psAKr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Em3psAKr; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWLw0yXVz3dKk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:52 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id jx13so2032813pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7TPF87YTW7YGVHVLwo0wUO5dl3wgobw0Nak1TU/F9P8=;
 b=Em3psAKrIqQlU3lDAGlNM8gM51JXHrhyy4bTjQAI5Ood4ot+gIwtBM0hL2ANv4Vcc7
 h1UtiBZgdlEOxLHW+TSgH2wo2yrhhA9MkKCH59oR2DKmnOl/nTciSSqf7T6Z5IvVcFG4
 gbOEsf4uoDfVD1mRUKA9rePvKxXPP34194isKc/PJzmkO5DrKToMaa/YJm6Wl8FQA/kC
 hwH8xWKjKVNB9ebLoNTk1D2fFU2eNebu2jcCF7AMi+sJAsmErdBLDrN9ROW+q2taR3An
 9DFzLsNMgXK4q5KjX34u+6rau0DlsJtRDB/FBQxbHieKVUIPUk07IyZ+r8g9Tl7OhtFY
 yWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7TPF87YTW7YGVHVLwo0wUO5dl3wgobw0Nak1TU/F9P8=;
 b=V6klZIGwi9mQ2qhkbmOvXN6DqoGMTrXQevna6sqsyzJLAPmBiPxEA63nKA4YhXIuKq
 wyqv7hLHv+nQ34IUNLyuAXVkZ6IeSu2m8DF7Bwz7ypneV70IutY5RdI9ANiD+318iJ66
 9Txuj9Zu2cCniJQqZeiOqLCrwOCrIXkkyJyxnFUw2a3hnixAB9NAP5BoSIRkSU8L+pMb
 +60jWwCusBbwYvNYfdxUAjsLUC2vKrG0PtlvPBIEv7XajeVnsnq2NW7DXca8AapEfomx
 UqBJpRwmYCazX6lJoXTXhUs5z4Jp9lk3Ci4NxIUAfZGrwihBCWIcAG1f3sg9prsV4reL
 e7Lw==
X-Gm-Message-State: AOAM531M9mpjbD9AecElInLNnEprDxxgB0fJeY42lm4dUXYv6ccDyc1t
 EhUVQEOtkxfWQjYPFmlDMBHJxBWNmg4=
X-Google-Smtp-Source: ABdhPJz+chvdDAoKuwF3H4QkCEEIbKUSDW2p6SFR3qX8M48pWTcQEadUhR9Ys1/imbjV4A8Q5yp5dQ==
X-Received: by 2002:a17:90a:e614:: with SMTP id
 j20mr10506464pjy.184.1614956868920; 
 Fri, 05 Mar 2021 07:07:48 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 18/41] KVM: PPC: Book3S HV P9: Move xive vcpu context
 management into kvmhv_p9_guest_entry
Date: Sat,  6 Mar 2021 01:06:15 +1000
Message-Id: <20210305150638.2675513-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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

Move the xive management up so the low level register switching can be
pushed further down in a later patch. XIVE MMIO CI operations can run in
higher level code with machine checks, tracing, etc., available.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b265522fc467..497f216ad724 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3558,15 +3558,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
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
@@ -3749,7 +3745,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

