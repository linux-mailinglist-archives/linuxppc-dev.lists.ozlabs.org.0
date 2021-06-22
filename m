Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FD3B027D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nyq0V1cz3gRr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OW1mMXZN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OW1mMXZN; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ngn2DLBz3c22
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:17 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id p9so2418863pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=updQAf8t0ym29EfFgOrHg3nwT7DKOY58qleB66Aa4hY=;
 b=OW1mMXZNu+ZCgIsxMy2C530HmkrF1RmMy7/S1jn9RiIPWkODc3ENxiqiq53JUohvTS
 JenMuS+SJRsaKI9feHbe5M/zQPpWAvChVbOo8AyFDpzlcgAUj4KpnIbsI7QRPZcMOgSS
 gOH2tIZCz1JB7HzvEmMUUUVMPDX+cfcnVQlRvm319s6sGAWtlRNYMijATC/jfM9PNT9Z
 OGH/0UWhXdWSLYDDxSSmQxjjhTRmR25K/yb2VDviV4LlV8Py/H7V7c0bZvswITkduS2p
 QeurAePxYSUihiZitb0PBrm8ZCN0YBwuIgvN8asQ6uT1RsJ7ZOTrjT2TUMp98KUHnqYL
 dp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=updQAf8t0ym29EfFgOrHg3nwT7DKOY58qleB66Aa4hY=;
 b=bFlFdutxi9oaSN1CLoOIs0AqmBLgejx6zyE8sJJyiAt95GAZlFZrl5wUueJuJirJ6c
 DV8lUahRj3qJNy559zmc0S2kS2SObZdNjirHvThUa+2SPLZmkuls4lXfaoXb2uY6KDwg
 S6RORPgyZdeIDLBnIf9HvxGhIldBOe7asUeCPZJPjgwEh7v6nZVi9Itgj5BupSCaA3h6
 97sTrpnZVSh2MmA4+juPmXdKvnYAHSzq9EisXdDwKsQ7vlFLnhD+rHHGvcimcUKo/iyt
 NYGYajnHngeXrSBuCGaijCID60A//whFYXoOpE3qPZdt7fTFHxFZNmxFDjOVJRsixzmR
 iCJw==
X-Gm-Message-State: AOAM5319YRMj9x1XvxI66AStS7Q/3GF9jJGtxbz11Vwh4gV6RChTmixt
 D45flGLKXJP3Vh9d7x/A5qc=
X-Google-Smtp-Source: ABdhPJzzseEap132pTuafgfhFewz+gmMGFnrcHC7nC23xChJ1Kh5BUT2W1ca0o2GOuemG/87H2GhRQ==
X-Received: by 2002:a63:a54b:: with SMTP id r11mr3220327pgu.43.1624359554094; 
 Tue, 22 Jun 2021 03:59:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 32/43] KVM: PPC: Book3S HV P9: Restrict DSISR canary
 workaround to processors that require it
Date: Tue, 22 Jun 2021 20:57:25 +1000
Message-Id: <20210622105736.633352-33-npiggin@gmail.com>
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

Use CPU_FTR_P9_RADIX_PREFETCH_BUG for this, to test for DD2.1 and below
processors.

-43 cycles (7178) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index a31397fde98e..ae528eb37792 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1523,7 +1523,8 @@ XXX benchmark guest exits
 		unsigned long vsid;
 		long err;
 
-		if (vcpu->arch.fault_dsisr == HDSISR_CANARY) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
+		    unlikely(vcpu->arch.fault_dsisr == HDSISR_CANARY)) {
 			r = RESUME_GUEST; /* Just retry if it's the canary */
 			break;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 9e58624566a4..b41be3d8f101 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -656,9 +656,11 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 * HDSI which should correctly update the HDSISR the second time HDSI
 	 * entry.
 	 *
-	 * Just do this on all p9 processors for now.
+	 * The "radix prefetch bug" test can be used to test for this bug, as
+	 * it also exists fo DD2.1 and below.
 	 */
-	mtspr(SPRN_HDSISR, HDSISR_CANARY);
+	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
 	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
 	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-- 
2.23.0

