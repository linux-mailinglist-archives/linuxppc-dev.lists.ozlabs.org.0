Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD943E9620
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFpf0xY0z3fj5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OZaXx3cU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OZaXx3cU; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF4N2chJz3cQx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:04:04 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso6313482pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tuny/0eGXiUI7uo2gVucclOBaSeF7WVbv1eeHSQKFaE=;
 b=OZaXx3cUvijxkwm0x1eN2JTWJWgtsEwynt9e6yW/0x1n+/J7npACl0cjOAhtGMMY2D
 jO9aVROyUQIK/xurGp7CDQ6HuaFzIw3qKn0DjI+5a2psfC3kMCAmLfPKcXe4xcUb89sP
 iE/rLcnZvQ6w+Gs9xFOCZGDGGHfXHVIML9eZMJi2NcoR+yQuk9WX4548JZ+nl3FyKRuB
 J+G1e01iLqS6USBfWB1F2064lPFWqClXm27wtp8UD6xkUf4TnTAv6tQQJygSlgYvBm6H
 cR6DQCr2Z+/m1KvxbroiBxKJaPTZ9pxDsEbNWJrHZSSBm3e3a91giiW15vW+VflDndfa
 U1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tuny/0eGXiUI7uo2gVucclOBaSeF7WVbv1eeHSQKFaE=;
 b=XWjUqPj6ievZjKt/Sz8j8kQqOY/3ELO8h5Kt///Pgg0JPV+XV7yJqya+ntiZYE0du5
 g7iuo0UuNJVEI/eSrbHG+IejWQYBLDyg55idL5IIpnYdozxTI7Ihe44fUQ6+YTm0yT2q
 AL1+ujRzsM5WwOcTrr8Wy4A9GXEZQwFTxVGyOgH0hKeK0PacIrm721fCpu4Hy73S3+Fn
 KwQ8UWtdsOEXsaJV8jmhgLNqJxscQivnP11/S6sEPZQVdchJHvtw3kNeqLUlzRDpI1UF
 nqgk8B7J2msqXcETu2HWgNnnyhWaHncO4YzElHoNSl1QUrv1o0dHkfo2flfyFYvnhqG6
 4SjA==
X-Gm-Message-State: AOAM532ISorKVr0avkKsXL63QqAiCmAKqLObJBqrZx8A5op7/yYiyk6k
 E8sgzpFY3n+P/VtQmT9MkGo=
X-Google-Smtp-Source: ABdhPJy2Iq6P+yIa9UFj5axzhHa+x+EubqFC3tvbbYbE9FTipuyNemwAnPdcJOW0VYk4zQFHOfAaTA==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr37588461pjk.236.1628697842379; 
 Wed, 11 Aug 2021 09:04:02 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:04:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 53/60] KVM: PPC: Book3S HV P9: Optimise hash guest SLB
 saving
Date: Thu, 12 Aug 2021 02:01:27 +1000
Message-Id: <20210811160134.904987-54-npiggin@gmail.com>
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

slbmfee/slbmfev instructions are very expensive, moreso than a regular
mfspr instruction, so minimising them significantly improves hash guest
exit performance. The slbmfev is only required if slbmfee found a valid
SLB entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index fa6ac153c0f9..cb865fe2580d 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -483,10 +483,22 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
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
@@ -616,8 +628,10 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
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

