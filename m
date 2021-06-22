Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64AA3B0299
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:17:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8P4M374lz3hD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:17:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ucZqRXDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ucZqRXDF; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NhH0G8jz3bsF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:42 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id v7so16769914pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DsgwPnyTUdZa/AjF9rolFYob05oJxOKI9sd1Aj7QIvU=;
 b=ucZqRXDFh94YgWql53590Q3D8VYn+GfCLaFLyfmEV/pP6B4GTcK3tHBtN8YOvG/UzT
 ynJXuf7oZzwUA3gkpncYJZVl6vs1bCZsBft8oTvxYORveU5rkkJ42MBznDYstWCtO11i
 V2NdYExIWgcTWPaUKsCALKuV9vJlQ5XI0wsNMNrvbTM9CPfLErZQnSt/4zG1J39nhgkE
 gaanD15Um/cCohGx/ujb2OJQVLygwybI9XDBWo8gO+IgTZF4MO5567wLdtTf2H+FyQZg
 qmVFviWNuJJDYftUI9fNLKVBGG8poc+mC9zHHLLDORuNMQlbAcPRje0NKrUbe6217IQF
 0ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DsgwPnyTUdZa/AjF9rolFYob05oJxOKI9sd1Aj7QIvU=;
 b=ZY4KDdbRmvr/r67becmNbiLK3Qjsh4CtDrdRa673J1KhFJRAoMEESFJ6IUPpbXhbB8
 1u7cdjSOlrNgTTHZsrOzBF8jYWRkkK6avKVqO0alpG3cL4/YqsBA0L/9NiL/bWWIbrRy
 iWkxf+dnmok1yeecUwZKGNkXMXtYbSLknFTLBVFBx+/+S29wXKtQI4rE2oV0Cv7G8gLD
 6NE9GM47IZbQ2a0N7eFdzB1VKOIbDp5nbuDBJhhC1bV8LryT0CVihU0eodgdliiOfc5l
 hQRwSu1PQiKKg80qCzMR9zjpZVcbmK4+xMv5WDilnflJj+Q27NWeXhK2KHWHZM1IknC9
 iLVQ==
X-Gm-Message-State: AOAM5327zkwLAS+hGJ+DO2Z26QX6CpSY26zdM18PkJH7shrrA5K09c0p
 CWxvLOywF9pHVl20lzh5Pes=
X-Google-Smtp-Source: ABdhPJwt2bqZQu7WX7dsPof+cuDJrpVVgvI/q3zgbiyq8PMYIVs6AhCdF/59Mgz7LoEmAp52obMLFg==
X-Received: by 2002:aa7:8806:0:b029:302:f067:7b52 with SMTP id
 c6-20020aa788060000b0290302f0677b52mr3131946pfo.13.1624359579612; 
 Tue, 22 Jun 2021 03:59:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 43/43] KVM: PPC: Book3S HV P9: Optimise hash guest SLB
 saving
Date: Tue, 22 Jun 2021 20:57:36 +1000
Message-Id: <20210622105736.633352-44-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

slbmfee/slbmfev instructions are very expensive, moreso than a regular
mfspr instruction, so minimising them significantly improves hash guest
exit performance. The slbmfev is only required if slbmfee found a valid
SLB entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 3fffcec67ff8..5e9e9f809297 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -459,10 +459,22 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
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
@@ -592,8 +604,10 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
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

