Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F2421424
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:31:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNR7C3hHrz3fPY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:31:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jGT2p6ld;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jGT2p6ld; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQV26NfNz3cSq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:50 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so285905pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EPQZDhgPqi5g0CfouGHl1rvGEVKlv1XdekS1P2LkqM4=;
 b=jGT2p6ldMXThpfkhQJu2ytHRGELk/8SfvLk0Prd5doutrh1lOyv8tPlyn/VzDmrg4R
 VR7ZqyI/ECY/46f1BvRPyfK8D3Ozx68r1ikoW5krfQMGhDruugUfFMqGcjBtfUtNtnbM
 1ffrST3fiot3MZt7nw/n3/DY7Ni1z7lQoRJLzrO3C5K627JOO1wytUOnJNYsNov8IRJz
 QUartURyW0NwLMPrQC6MaP3jbTwux2IZowTcF+6i4GRMFked9KIU3v8IuB20VPjnNwlX
 yp/yjgdZ+yYi0ruAqO9fdlpOzQ6xl9Bn2wTT90Pbf4DcCWumwn5inhcFC8m+SyCAZYG4
 /tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPQZDhgPqi5g0CfouGHl1rvGEVKlv1XdekS1P2LkqM4=;
 b=m9oY0aWB9B8HAPnOz0Wn77wwvPuh8WPJ6L8U8QLVtjYExfd2Fhiwl+D2Baf5Qhan99
 IrhgpWWsmbkP3pWDUZV3srO50s+3FZ8w5065AZKovFEE4Kxst005dbJeYkvEVfhGOnjQ
 vtZ9O+Fzp3eg7EJjTIrxNIlTxza3UxVbsWQWhYoDrE0XOOBOUdJ1M6eSIk4fGH/xWEr4
 vlbYFpm+hYceNw62oWCf9Phohp5cGtvC++HM0jVJmFq6NkvIA/ldoolyP2wiwxPVOpov
 2NZWgeYC2Y4+LUenZ+e9/QigzX//k5hTUJC/OK93yHb4WtxYtlbK0eA6sV3eCPBZvz6s
 TE1g==
X-Gm-Message-State: AOAM533sliVnNKO2OrYxQw4yGWKUIWmyGOM/pmb5GosBj5z1/WU/Oz2/
 gGBSI1OW9LEVA//NKjqc7k0=
X-Google-Smtp-Source: ABdhPJyKmvYE4L++eCYVyA+2RJsqZeQTlLo+rudyoP6QA7smhpqFh7ozmGlrFA6ads/+gv+RXkon7A==
X-Received: by 2002:a17:90a:df8a:: with SMTP id
 p10mr4053591pjv.137.1633363369138; 
 Mon, 04 Oct 2021 09:02:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 45/52] KVM: PPC: Book3S HV P9: Optimise hash guest SLB
 saving
Date: Tue,  5 Oct 2021 02:00:42 +1000
Message-Id: <20211004160049.1338837-46-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
index 646f487ebf97..99ce5805ea28 100644
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

