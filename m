Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0E32EE44
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWcB062yz3gyv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:19:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=K6pvWBfc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K6pvWBfc; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWMn5Lfxz3dh1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:37 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id e6so1568450pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9mGOdjU30m0E6b/XzBmpf0ONvoTvN0BDP7Tm5+1bmtw=;
 b=K6pvWBfcw+XONrUyGb1h6XRowG9L0oy7eoJxSWs8qcI9gctB4aKIDjezhaVYPe4xR1
 ORTJImycW4l3+Lt+Nw9sT1dVeyXkexbfUfLrApnp7t9FU2i2gbL9a7I+kkjnzaglk9+g
 3ZBzeb8a2kHVL0aTY2U911u+dcsE31BkP3TpmO9pWrAhYUZLxTWbJGLykJpYHQkmSpAD
 kOisme458gyHASZ2mT1q/6DaaNsWYg/L+dcuA/OHQqElXupflUGkIRUqGgOXlkmKiMOu
 KBE26BejFipFAOeRFzn55Cqw51QClzsn3mG8tPU637ziW6BbISfBgFWLfBr/USqq6if7
 lD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9mGOdjU30m0E6b/XzBmpf0ONvoTvN0BDP7Tm5+1bmtw=;
 b=muDZcwA+++BOso++ITdhldbDg6Cvw+VxhNsiUmguGNelLVJcsj+hNVNuJbZV6asBgD
 EhfXaZuJWzeC4n3Nzjaa0MIpJnPW9NSmi0T5xndUcw7W2K3MAaxk6G3IJcrg3kN++gdp
 5OfJk7xCUgTBwJu7lEqG02F0P+JvNh00VeZIAQJhmIyHygtdPLBbzkqUsc+ef7b1cwTW
 DWDyQAqW38VxNosHlxGLgW2cd9jjYFatpzGrbbtwMTHzMuYGjoV8kW43sC6x7zZ7jtY5
 tdsiDbmBzpZa05XmtNexs+JGFUfPbTR3PQ3KmdPbvT8tSHguc27x5ljJu6nRBFrKZNzW
 5zjw==
X-Gm-Message-State: AOAM530rVz69h8ZUtMOgB50wSJ84mapyuu4EpR6FUDxGQe5LFQ2Us+bB
 Az8mOFeZxz3GvzU7wHEjcLB1Z1cZKB0=
X-Google-Smtp-Source: ABdhPJy/8rUerfCRqWSrS0HFBWouOkMz3OXqSQI1uxhqs1VwZO4OdAluEl85YmzWszaVjp+C+1tm4w==
X-Received: by 2002:a63:4658:: with SMTP id v24mr9008126pgk.258.1614956916157; 
 Fri, 05 Mar 2021 07:08:36 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 29/41] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Date: Sat,  6 Mar 2021 01:06:26 +1000
Message-Id: <20210305150638.2675513-30-npiggin@gmail.com>
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

The C conversion caused exit timing to become a bit cramped. Expand it
to cover more of the entry and exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 145c634625f8..68514ab5a438 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -148,6 +148,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -198,8 +200,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
@@ -343,8 +343,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
-	end_timing(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -409,6 +407,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	end_timing(vcpu);
+
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

