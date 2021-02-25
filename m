Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7B325100
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:56:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ892jjVz3fqx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:56:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SOqp7vt2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SOqp7vt2; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYys35sFz3dBy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:21 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id b145so3649465pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VNlGtaRSctLYlPeChdxDgtGvbZrSWxq9sa/ajZPH1c=;
 b=SOqp7vt2cwBvh3FOLS+ZqkyswmxMv+IhcaCzXAtn+qMSGhlYztYsdA+BBQIvrLXkZL
 X4cBl5NndAKHtxlH8P51LKzFrkCqqor39tC0shbwkzh4plUzUOftmEvgTUDGCueuP0rp
 Q/JNsUYw86WBdNOy1B9Yx1RQ94x3/98ZM9ixvpS2rCBPwWd0wSz8sLKDQHWbmsWcMC51
 DdSr8XQuNpgyqpcQiwuimBggX2WntJfAUYU6qcBDldyTu/fzPfWZG4BXvo2MpDZ9xoOo
 JiohBow/zRFTOsV1f7sKDCNxuZIJ+JAfkwzg1V1Iwuiyc0IMBZTBhSOlyV2+x5UxSXlm
 8WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VNlGtaRSctLYlPeChdxDgtGvbZrSWxq9sa/ajZPH1c=;
 b=lPIJA3WlxTAESFf4/dewG3ZGnduokFb/d5bZUpXFZX9gWPPHyG5U3nz3h8JQZU24fF
 BHS6q+OZLq8LMXlnmWjOsn4q2GX7ZGuyogMda2k3etm31M2RhayaLEjiQCZYL+m3t/Jr
 0mqRW9co+g+izb5SYk6aKjRQsFD/A3TSpZc8hsPvxxinCIWvstG/1W9O0RgMbJzAWfBR
 ySbPlvzjIRUNuUbbN4pllyjiGvtt/P/5Y9gqBTzFRT587hKZlWmk1yyt+aBICqCLQDmV
 C7ZjJjoXpzP9GFAj3ASbXGtB36Yry0PDyMXOx3aZATyEX5vol0najTGR7bo15SQ/v/QK
 4xfA==
X-Gm-Message-State: AOAM532oyy5fiecN56DM/M/Juh/gIgGPJJGZOzEe7eFHgMk6MiF+yAvc
 ev3DBtj04vM3U3vJEh1JTr/fcXZLP3M=
X-Google-Smtp-Source: ABdhPJx1UcBDTKpvP1zGz70sEDd9oVgfptBMzSZBjBnBZSh09cKJ2k7xVwMFEO7HEGjA0y5ByNwwng==
X-Received: by 2002:a62:8686:0:b029:1ed:7a8b:4933 with SMTP id
 x128-20020a6286860000b02901ed7a8b4933mr3470531pfd.9.1614260898881; 
 Thu, 25 Feb 2021 05:48:18 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 22/37] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
Date: Thu, 25 Feb 2021 23:46:37 +1000
Message-Id: <20210225134652.2127648-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

irq_work's use of the DEC SPR is racy with guest<->host switch and guest
entry which flips the DEC interrupt to guest, which could lose a host
work interrupt.

This patch closes one race, and attempts to comment several others.

(XXX: should think a bit harder about this)

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paca.h |  1 +
 arch/powerpc/kvm/book3s_hv.c    | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index ec18ac818e3a..23c12048fbc9 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -174,6 +174,7 @@ struct paca_struct {
 	u8 irq_happened;		/* irq happened while soft-disabled */
 	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	/* Could have irq_work_using_hdec here, but what about nested HV entry modifying DEC? Could have a pointer to the hv struct time limit */
 	u8 pmcregs_in_use;		/* pseries puts this in lppaca */
 #endif
 	u64 sprg_vdso;			/* Saved user-visible sprg */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d98958b78830..1997cf347d3e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3689,6 +3689,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
+	/*
+	 * XXX: must always deal with irq_work_raise via NMI vs setting DEC.
+	 * The problem occurs right as we switch into guest mode if a NMI
+	 * hits and sets pending work and sets DEC, then that will apply to
+	 * the guest and not bring us back to the host.
+	 *
+	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
+	 * example) and set HDEC to 1? That wouldn't solve the nested hv
+	 * case which needs to abort the hcall or zero the time limit.
+	 *
+	 * Another day's problem.
+	 */
 	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
@@ -3822,7 +3834,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
+	set_dec_or_work(local_paca->kvm_hstate.dec_expires - tb);
+
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

