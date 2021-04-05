Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E46353AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCYT4wT1z3cK7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ia1SRBaN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ia1SRBaN; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWd3JXLz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:13 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so7087080pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfjZBYhIkDtimAOFPQqSOyFCP6WGylRgGDnOYsNsrRY=;
 b=Ia1SRBaNSSim5ddLtX57Kg+v5iFWsYO3Uoyt8Cwc/KA7JJ4DsJCpGkOxQ8Uau4m+8U
 bvpiz+9xI+6am6uHbDy01kyJnbLHE+DdeWkByXrlVxqgBbgmvRcBOJzewToKrPE6cQud
 nBwob2tEPStDffdYMeTktHNm+FmE8JZ3NWAeY/Okf9hgscz5ASZNbeKMxOYDfuxriHdU
 Dgya82Ib0V0yoVlRI+Wz+R8pbWOwWLSD+frSh5dG94y41MP+pGTmYaJjOdBUssx5Q+4P
 Lf1VGjKyprF443OeOEA2YJIh3OtS+6TvwUyRIMANUR8P5DH3H7lIv7WWyzbreJv5/UKU
 7ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OfjZBYhIkDtimAOFPQqSOyFCP6WGylRgGDnOYsNsrRY=;
 b=TqFeO79985lv4SZXxxEoyNPyJCKY0+aiimdUxNlF143noiCL808zVPeG//2EZJ87EK
 UeutQjnyfsr94DEQYIsyNCo/EG3dfDkaimGnfnZy0/kvng5nLWzhBTxw2z9+Ze/T7Msa
 lZRBbR7GQNQvUZvei17ZNOcAZvyvg0IbN2EDohto0hhzdZD8tCPg3w6ze6Pn9e6GI51a
 li6QLdR5q/kPtsMntcmpiBUp/gZQ5ehf4XwZfSZmIaRCO+Hwb0Dc0V7McN48+OzPL1Js
 YT5gSoSJGteuCbnGMMH2HJlSfxPQJiZmKRK0fIYVgp4OG+eMG9gtLe6WRDpfbXAWfDZc
 zdfg==
X-Gm-Message-State: AOAM5323D5EGA3mn2NaupDZ2r5i1Lqj6HKBbBrpH8B/vyI2SMoVAFl/q
 a+lMJk2sKB+9nqc31haT/6Q=
X-Google-Smtp-Source: ABdhPJwLOBc7+aa0W2w927sGnl26UcGB/vIhK+cm1ecZtNxEWHUlVlipg0jT1jyE22ABhG826u6aVw==
X-Received: by 2002:a17:90a:f2cf:: with SMTP id
 gt15mr7466893pjb.49.1617585610438; 
 Sun, 04 Apr 2021 18:20:10 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 03/48] KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to
 1 or 2
Date: Mon,  5 Apr 2021 11:19:03 +1000
Message-Id: <20210405011948.675354-4-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are already disallowed by H_SET_MODE from the guest, also disallow
these by updating LPCR directly.

AIL modes can affect the host interrupt behaviour while the guest LPCR
value is set, so filter it here too.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d2c7626cb960..daded8949a39 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -803,7 +803,10 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 		vcpu->arch.dawrx1 = value2;
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
-		/* KVM does not support mflags=2 (AIL=2) */
+		/*
+		 * KVM does not support mflags=2 (AIL=2) and AIL=1 is reserved.
+		 * Keep this in synch with kvmppc_filter_guest_lpcr_hv.
+		 */
 		if (mflags != 0 && mflags != 3)
 			return H_UNSUPPORTED_FLAG_START;
 		return H_TOO_HARD;
@@ -1645,6 +1648,8 @@ unsigned long kvmppc_filter_lpcr_hv(struct kvm *kvm, unsigned long lpcr)
 	/* On POWER8 and above, userspace can modify AIL */
 	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
 		lpcr &= ~LPCR_AIL;
+	if ((lpcr & LPCR_AIL) != LPCR_AIL_3)
+		lpcr &= ~LPCR_AIL; /* LPCR[AIL]=1/2 is disallowed */
 
 	/*
 	 * On POWER9, allow userspace to enable large decrementer for the
-- 
2.23.0

