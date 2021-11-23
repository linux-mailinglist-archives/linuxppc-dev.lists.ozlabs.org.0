Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15845A00B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0bC4n2rz3ffL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:23:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q7KxMWqa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q7KxMWqa; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxp0DTFz3c8W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:21 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so2423002pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bK1eIwvW41bOthmyKZ7Rb54ykoXB89dKOfz7qTHLeN4=;
 b=q7KxMWqaMut+yJaSpvqzmVgOKBZnCRXR/P0XGvJSfCmE72EWyhcUKLlB9nSWFWSdM1
 VYb3NtlaCtx8cdwKgkZ4/DFcmekzyfuP1gZxwThFZrkrxumd3D1r6ZQfl2jmm2J71Bif
 usHjKVDwBiEgVVsl0qmG9NT0bN6SwJGXdPmB8EENfzAlIVPTrdEtYTNsmwCcVs/Fwy03
 u9AHdNobTRrqWfE5HKpSehMzEfZNFIDS184+qvHiDm7ZTa41+uT3HKRiQnQebDJbErz1
 seQeXxOYzlsav9ZKdDgaukwZK8GZGo/kNnzY0FgBVC627kNMzQEQfkJG+TBqk3WWGnPB
 4i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bK1eIwvW41bOthmyKZ7Rb54ykoXB89dKOfz7qTHLeN4=;
 b=dHUM/UXCO/f9mb02A0nEP39l8VMbzGgh7BkUXtUhaQm4YieQ9vxthRbLWM5wexvQqZ
 ZyoiVBkY5kfrz7fNS+yIsbyqAotRAH5McyKdHKjzLiH/s+lqfs14HtFQcyRzaYtqE1Pf
 NwC0i11t85auAY1d27iPlrNi5sA9FhbKZjZkGrUfzgyc93DiLyt6ncYu8DIMm3hnzj1l
 /B3jmNyXg+Zx1vkuurDFiJCSpPtkJaWqCKo1i9OlwFo7ILFBHkDCgd3l0Tk90VINi3QG
 OvV/AiqHgc4r/YUrpWNQ7sJysvPUqqARtWrtR9sC8BtvgjWkpjAVLNykkB5CZp3njp/i
 9x8Q==
X-Gm-Message-State: AOAM532dSP8NJtV/ia9uK1pL4tSmsxcHUp4cZI5l1XF61jayEafpzFn/
 qOiCNfufZ/R9w7cB8ZvZ7DbcgpP6wkdqZg==
X-Google-Smtp-Source: ABdhPJwAKFMbfRBxlRn496km3TlQaIl8gzm/ZPR+w0UHQVau8Zk1Hzmh0Nns2+nrKEcw64nf4C42+A==
X-Received: by 2002:a17:90b:3b8d:: with SMTP id
 pc13mr1292225pjb.112.1637661260090; 
 Tue, 23 Nov 2021 01:54:20 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 46/53] KVM: PPC: Book3S HV P9: Optimise hash guest SLB
 saving
Date: Tue, 23 Nov 2021 19:52:24 +1000
Message-Id: <20211123095231.1036501-47-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

slbmfee/slbmfev instructions are very expensive, moreso than a regular
mfspr instruction, so minimising them significantly improves hash guest
exit performance. The slbmfev is only required if slbmfee found a valid
SLB entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index d123813296ba..8fa48ba01f79 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -487,10 +487,22 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 #define accumulate_time(vcpu, next) do {} while (0)
 #endif
 
-static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
+static inline u64 mfslbv(unsigned int idx)
 {
-	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
-	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
+	u64 slbev;
+
+	asm volatile("slbmfev  %0,%1" : "=r" (slbev) : "r" (idx));
+
+	return slbev;
+}
+
+static inline u64 mfslbe(unsigned int idx)
+{
+	u64 slbee;
+
+	asm volatile("slbmfee  %0,%1" : "=r" (slbee) : "r" (idx));
+
+	return slbee;
 }
 
 static inline void mtslb(u64 slbee, u64 slbev)
@@ -620,8 +632,10 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 		 */
 		for (i = 0; i < vcpu->arch.slb_nr; i++) {
 			u64 slbee, slbev;
-			mfslb(i, &slbee, &slbev);
+
+			slbee = mfslbe(i);
 			if (slbee & SLB_ESID_V) {
+				slbev = mfslbv(i);
 				vcpu->arch.slb[nr].orige = slbee | i;
 				vcpu->arch.slb[nr].origv = slbev;
 				nr++;
-- 
2.23.0

