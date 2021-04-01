Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2CA351610
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Lt1YlNz3f0v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:20:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F/yFcSMl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F/yFcSMl; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB61h1yF5z3cVj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:28 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id l76so1699344pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5fNmtzqht80cGykBgqYZ3mo5Aw4QFt+HIs8nI/NOKw=;
 b=F/yFcSMlnu3Iqfcaj5GGDh6etp62rZlPCp0syFoBpFGfuW1OYPWOLNRJJ0S5LVe7w4
 8XuyJNQkXC7RLIFngC3mSgx0Bh/znlc/nL/P+o1N3ZVfYNM+kB7IEzxfCwOeBVYF6eoF
 G83gQvEj+AWcJv/yZy8fR14EhKjEVI2lqK11kimOvd+1DZ5HcYHfB2BjVVqKAER8Q8wI
 to45O86mABPIZ2FJNDdIbph+0i3SZwCAK8BbDa0A9zO8n93Enx2MQaT2cdgQjEdkOvPs
 8SUTe/DjGmBu/ldBkzFBdvrcqgfMCYjLUPIFIIAn7UBT+L1ouBDGQlvRcpGUQdDDyqUv
 mbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5fNmtzqht80cGykBgqYZ3mo5Aw4QFt+HIs8nI/NOKw=;
 b=EOH/hgGXRucTcrRMEHKwIkkHZ4sUY7CiSiyvO/ndGICO7UaKbOG2uQTJ8CEe04AVjF
 4yn7AWG1zbIsIeLwjy6rpctKu4sbfeb2/dxYt1FVZHnE8gyi3I9OlBRlbY1wRMxzkdVO
 j1jG7Ay7m+vtHTBGjQ1UCL46YjC3SdgO/ItC2SxCSpwo/nyi0E67HlsSc2Ih5SgnVUtp
 6K10cPKkB1YcLtMbzxvjs3MNlnvH2oQaUZDrw/tgovbalJ0bUyN4bzA14TBMNjBjrLBC
 bZs+dp6V6Yj1wArX3ZM4m+adOQq2t9vGWVMNm/RJDsTrjUAxUdyX7rPhzzBxfbiBufXO
 OkMw==
X-Gm-Message-State: AOAM5304XKGdrotNrh/ON/3OMI+0Vim1ZAmtX7m1j8jNTDHkOp7K9bFp
 LAiUZBBr5kLUgsTCeLuqbU1fQo97dww=
X-Google-Smtp-Source: ABdhPJxk5C9Sfw2Gb2LGCgt2JRNom+kU9QUFHZbadaeP1FJfUDY5i10wd8qepcX+C/VLFtDFsYSjRQ==
X-Received: by 2002:a62:2c12:0:b029:22b:2c97:15a0 with SMTP id
 s18-20020a622c120000b029022b2c9715a0mr8121227pfs.77.1617289526686; 
 Thu, 01 Apr 2021 08:05:26 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 36/48] KVM: PPC: Book3S HV P9: Switch to guest MMU context
 as late as possible
Date: Fri,  2 Apr 2021 01:03:13 +1000
Message-Id: <20210401150325.442125-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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

Move MMU context switch as late as reasonably possible to minimise code
running with guest context switched in. This becomes more important when
this code may run in real-mode, with later changes.

Move WARN_ON as early as possible so program check interrupts are less
likely to tangle everything up.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 40 +++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 29e2ae04b8d5..4f3edf68d97b 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -149,8 +149,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
+	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
+
 	start_timing(vcpu, &vcpu->arch.rm_entry);
 
+	vcpu->arch.ceded = 0;
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -199,26 +204,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
 
-	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
-	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
-	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
-
-	mtspr(SPRN_AMOR, ~0UL);
-
-	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
-
-	/*
-	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
-	 * so set guest LPCR (with HDICE) before writing HDEC.
-	 */
-	mtspr(SPRN_HDEC, hdec);
-
-	vcpu->arch.ceded = 0;
-
-	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
-	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
-
 	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
 	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
 
@@ -237,6 +222,21 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
+	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
+	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
+	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
+	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
+
+	mtspr(SPRN_AMOR, ~0UL);
+
+	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	__mtmsrd(0, 1); /* clear RI */
 
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
-- 
2.23.0

