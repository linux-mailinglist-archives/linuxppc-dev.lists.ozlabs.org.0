Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139A3E95A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFHL0mgWz3fFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:13:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Qe0/FtQK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qe0/FtQK; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2d1RKCz3bY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:32 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id a5so3290178plh.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cKT4fTx7oGwRWzvpaHxdjqzbrtTqZjyygbqKOYWpOIc=;
 b=Qe0/FtQKhVwQV1cLcmplgCvwntQW+FjPNErVOqKGPL31gn6QeXoMl/3bNoON4C0gUH
 lv9QcHtJJ3G2J+FqJa/m5968lJbIzxGJpv7evVhhQxlXwCLdWs7AvWmbPtMCskfBnl7N
 gRkSo158HYGVTJmIYk3Ncr7DXnyIGqgVJrqgkJJBORe+PSItVe2DXoFTLqNje9qfV6Qs
 iiKuF5Q/24Pz19o+Ce0yqfyRbDGNL4PZ6fzEGoTkBe/6ueiAJfwGJUj5uEcKKAFBkOwR
 fd6+FgVRk74o3w7HRbJNBjkquh7y3Cev1tdKMFzEaASR9YqCj9u9Oyj8oVqIyx3J8POs
 7Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKT4fTx7oGwRWzvpaHxdjqzbrtTqZjyygbqKOYWpOIc=;
 b=O4sl6y2iNa+lOKursNGxumuPfMiWO8YbzyPHlCNHy9DVQwlBozuqzC+DtSNGjlaM/m
 Qn4ZMVE+Yry7kghfcmoZGKvjkp7XYMWtYizqOP0/j+lwiVT+jDZerQWajxGRNo3gRAs9
 +jUpav2ricFXubBpaKTohPXtR0Fsz5pyKD+QUJSQXhA+ckBhA3qyk+vEYHRv6Za5q9nP
 ctrLOYzHQaBqeGj6toV+EcEli0/mWNt9FLtqRtWi08QSjFZFydr/VSybUSgSxglHpgMz
 G7ilr5gLX9ZNnci+i/gPtqYLUpsuqzt7tkHXt/jgy30oId0LO0Mz88I5rhdIpeA8Y29M
 tDmw==
X-Gm-Message-State: AOAM532nKyGLDjXakJzdZQ+zLEioCd5L2+2VX95B7VGQ7MQtY74FKwUD
 CN6Oe9IPnD7WjeLD+8TGSPA=
X-Google-Smtp-Source: ABdhPJwQ5ivMxxa21BFrRKDX9Rhm0Iomm4tEiMybappdPSnvp0DlNEF3LTosHm27OJKOt4BGfREdVQ==
X-Received: by 2002:a17:902:ecc6:b029:12c:44b:40bd with SMTP id
 a6-20020a170902ecc6b029012c044b40bdmr7605549plh.33.1628697751009; 
 Wed, 11 Aug 2021 09:02:31 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 18/60] KVM: PPC: Book3S HV: Don't always save PMU for guest
 capable of nesting
Date: Thu, 12 Aug 2021 02:00:52 +1000
Message-Id: <20210811160134.904987-19-npiggin@gmail.com>
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

Provide a config option that controls the the workaround added by commit
63279eeb7f93a ("KVM: PPC: Book3S HV: Always save guest pmu for guest
capable of nesting"). The option defaults to y for now, but is expected
to go away within a few releases.

Nested capable guests running with the earlier commit ("KVM: PPC: Book3S
HV Nested: Indicate guest PMU in-use in VPA") will now indicate the PMU
in-use status of their guests, which means the parent does not need to
unconditionally save the PMU for nested capable guests.

After this latest round of performance optimisations, this option costs
about 540 cycles or 10% entry/exit performance on a POWER9 nested-capable
guest.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/Kconfig     | 15 +++++++++++++++
 arch/powerpc/kvm/book3s_hv.c | 10 ++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index e45644657d49..d57dcbc4eb0f 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -131,6 +131,21 @@ config KVM_BOOK3S_HV_EXIT_TIMING
 
 	  If unsure, say N.
 
+config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
+	bool "Nested L0 host workaround for L1 KVM host PMU handling bug" if EXPERT
+	depends on KVM_BOOK3S_HV_POSSIBLE
+	default !EXPERT
+	help
+	  Old nested HV capable Linux guests have a bug where the don't
+	  reflect the PMU in-use status of their L2 guest to the L0 host
+	  while the L2 PMU registers are live. This can result in loss
+          of L2 PMU register state, causing perf to not work correctly in
+	  L2 guests.
+
+	  Selecting this option for the L0 host implements a workaround for
+	  those buggy L1s which saves the L2 state, at the cost of performance
+	  in all nested-capable guest entry/exit.
+
 config KVM_BOOKE_HV
 	bool
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2fe01dc2062f..197665c1a1cd 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4033,8 +4033,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.vpa.dirty = 1;
 		save_pmu = lp->pmcregs_in_use;
 	}
-	/* Must save pmu if this guest is capable of running nested guests */
-	save_pmu |= nesting_enabled(vcpu->kvm);
+	if (IS_ENABLED(CONFIG_KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND)) {
+		/*
+		 * Save pmu if this guest is capable of running nested guests.
+		 * This is option is for old L1s that do not set their
+		 * lppaca->pmcregs_in_use properly when entering their L2.
+		 */
+		save_pmu |= nesting_enabled(vcpu->kvm);
+	}
 
 	kvmhv_save_guest_pmu(vcpu, save_pmu);
 #ifdef CONFIG_PPC_PSERIES
-- 
2.23.0

