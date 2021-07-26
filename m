Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E453A3D5203
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:59:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5lt5bg3z3fc1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L4k3j5Dp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L4k3j5Dp; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Zb1HyXz3bb4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:35 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id e14so10060449plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3EPodwAY04xAoBbUr0lK1mnu3c10gNvTZRm9usPrYgg=;
 b=L4k3j5Dp6o7T71/jhIrr7oSzW9uROFemXyfUu/avw1s4K6QadE4NS6lf4IbtDRhCoQ
 SKNp2Tdz3f1oGUZE/hXPX+uENx5dnXf4WUS/gNJ4w8ZywCvxGsH3hEYo0cw2WUD9QXxb
 Uf4RKznOSArw6xMXW6jCOTUvvT/fyul3ImbUePg5bt85uD8AhKPn7E8vITIEsmq0+Ofe
 N3AyEXisbbIZRiKCSdE+wxFkQ19UlEhGiWA3eZRhKHZhdyFxxLoMM1O2XYEOUw4HGIeu
 dgc2+tY1G0PHMkCywQptVvw3MSDnCum7n/hoANT4dl7BGNHhZodrC3LjVw1ofYb4UXNg
 O2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EPodwAY04xAoBbUr0lK1mnu3c10gNvTZRm9usPrYgg=;
 b=BZZrKDkdRx9UGsV7Z7UQ1a1VS17m6tnr2tQghE1yBxlfEWMI/dHZKw5QzsUuTdTu5T
 OB421FrJkcXouKvLQjm/MqSscZVwl4QpQjpuwy0zEpaAGJtJhRMKsU6+vX0aZlit+gbM
 A0LL7Z22HleNXyMDv/4FJMoC78bTww54AKbupfNc7pGqU8JG2E6QsByT9Ug8wsImnAfK
 37RXNQUXi6b/9zp5UhdapfYB8M9o++vvFag/6TsAIId/ohCBtxP0r4bjy/iwkU4oSS2E
 yBPQTypJSPTQDpLVdpRlcj3Zi91/6EmEvjxrmxlsFVLyJOYTdCwGaFLUTtFVI+8f12G7
 C3Ew==
X-Gm-Message-State: AOAM5310jOghnyJmZaZodFkkN5CqVVfYjRhCY1DZkpY5JfPty/jD0PKQ
 fSjanDF5mjA/tQVGKs44mW8=
X-Google-Smtp-Source: ABdhPJylr8Y1mDqJPxXyJH8MJieXqvQy65R5784ZTRSdS5SquIZmSZAh/czNwnmyPbehP0baKjar9A==
X-Received: by 2002:a17:90a:19c2:: with SMTP id
 2mr15305821pjj.233.1627271492764; 
 Sun, 25 Jul 2021 20:51:32 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 20/55] KVM: PPC: Book3S HV P9: Factor out yield_count
 increment
Date: Mon, 26 Jul 2021 13:50:01 +1000
Message-Id: <20210726035036.739609-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

Factor duplicated code into a helper function.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7c75f63648d6..772f1e6c93e1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4081,6 +4081,16 @@ static inline bool hcall_is_xics(unsigned long req)
 		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X;
 }
 
+static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
+	if (lp) {
+		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
+		lp->yield_count = cpu_to_be32(yield_count);
+		vcpu->arch.vpa.dirty = 1;
+	}
+}
+
 /*
  * Guest entry for POWER9 and later CPUs.
  */
@@ -4109,12 +4119,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 1;
 	vc->in_guest = 1;
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
@@ -4242,12 +4247,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
 		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 
-- 
2.23.0

