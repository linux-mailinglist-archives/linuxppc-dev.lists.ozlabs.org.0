Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C8459FA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz03c66Qvz3dvt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:59:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SgiOAqvm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SgiOAqvm; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzwL284Pz3096
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:05 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id o14so16596827plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9NGaO35kYPIwolnaQsQJlLEyZsSVwvWYCG+VzWgOV7c=;
 b=SgiOAqvmfYxDlZ90IUxCIlU5G6zvWHt94ZeNRqZYiCKBvZ9DxjnXO2SNvOKM0xPs9V
 Jm+kVyTfWXXGFoBv8EqlcPZZjaJEBI42Bp+Ui2F8du+KVyYQZbCmV1BH7+Qr36SIbPOl
 fuTs7noxlYFHQ3aHq0mNw/6tx15qW3F+lFwMeBv419KnNr0HqpihIKpf6Je6tBhFflcf
 1IQS21tJpra3NvMetMRbniLLwKRFu1yE06VFmQrUVkgPOyxOb2FzU93E+27cYuFjLcf/
 MHeceoBYZEMag5cyEqQn+iHhdeDco2DAAHlwgGVGiiHvotx2JXLnohwlJmF4fu+tKeBp
 35wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NGaO35kYPIwolnaQsQJlLEyZsSVwvWYCG+VzWgOV7c=;
 b=O/BR7u7kxySfGviRvnMGaXKB5dA7kSqp2ZBS/7Pgu/M+G+a/lLEPa19ZbMG6HEQPrU
 8S3R72AJDP1ZUgJQiE9K+aS7Dgoza/D4ZWGu6mctOp/rMmvSEQI9CTgYVfgtxsdZriRz
 w4x3OMCzDeadYY7Ha9JpiKZYdh2MrSDE79cLEfhiJXfWeZaLjzNTEFFDWWfBro9bjXEe
 qjPNOndItXPp4Djqs/12hEdnS8doHcBVDUO/WXiAgNWqemToSuHx86iwEoU3/Hh/RHjG
 MJgRvy7ck371mDkqOpL/ZZ5Pcpv4X+B8PpELcbxv+cW8DWjtOpskq6+Og7TE+yWctDCP
 zy1A==
X-Gm-Message-State: AOAM530pxMEtheid/XjQE45EAO0aNJgJ67yaH+Xnxnq9glOLPYkyLl29
 eL3Hc1GPC4VMDNDWvRFeZ4egpF5GJ+eqUQ==
X-Google-Smtp-Source: ABdhPJxVCkTkF4jSsNSM5m8lUNs5Am2r47GrTIPAxB5wYxu30KKFmgzpeI0WNNKsfZMuvrD/vUN7lQ==
X-Received: by 2002:a17:90b:3b8d:: with SMTP id
 pc13mr1284278pjb.112.1637661183784; 
 Tue, 23 Nov 2021 01:53:03 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/53] KVM: PPC: Book3S HV: Don't always save PMU for guest
 capable of nesting
Date: Tue, 23 Nov 2021 19:51:48 +1000
Message-Id: <20211123095231.1036501-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide a config option that controls the workaround added by commit
63279eeb7f93 ("KVM: PPC: Book3S HV: Always save guest pmu for guest
capable of nesting"). The option defaults to y for now, but is expected
to go away within a few releases.

Nested capable guests running with the earlier commit 178266389794
("KVM: PPC: Book3S HV Nested: Reflect guest PMU in-use to L0 when guest
SPRs are live") will now indicate the PMU in-use status of their guests,
which means the parent does not need to unconditionally save the PMU for
nested capable guests.

After this latest round of performance optimisations, this option costs
about 540 cycles or 10% entry/exit performance on a POWER9 nested-capable
guest.

References: 178266389794 ("KVM: PPC: Book3S HV Nested: Reflect guest PMU in-use to L0 when guest SPRs are live")
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/Kconfig     | 15 +++++++++++++++
 arch/powerpc/kvm/book3s_hv.c | 10 ++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index ff581d70f20c..6a58532300c5 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -130,6 +130,21 @@ config KVM_BOOK3S_HV_EXIT_TIMING
 
 	  If unsure, say N.
 
+config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
+	bool "Nested L0 host workaround for L1 KVM host PMU handling bug" if EXPERT
+	depends on KVM_BOOK3S_HV_POSSIBLE
+	default !EXPERT
+	help
+	  Old nested HV capable Linux guests have a bug where they don't
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
index a683ee5f420a..6e760f48bbaf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4047,8 +4047,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

