Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FEB421403
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQyf4W6Mz3dfF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:24:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mg0Iw6mc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mg0Iw6mc; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTZ1vt7z307g
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:26 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id n2so186310plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TM/HAR2kIbbjsWEciD5SVgeeCTO1PDyzdJl58aiAKUU=;
 b=mg0Iw6mcWciAkTXZmbSjn0fIPZxsDgy0BgteZZFXRyFvyilYuuOastBAzHwDoRBuYf
 LvYLGn8PfLpVon3pT+gN0MQxG0unh6NK5OpSlaS1ix4OKzf1ka9tAe+/v0hXA/Z9yLOd
 uadUFkDtiz7XSrutFCTO6HdJOhWxU/LiqJV3GrSK7nQO/EY7gXIVP90qaKrX1eIaMxgq
 3bGmoNiiGojqCBFOFQ5cVWYdEDv8A6aUCuuC6Nnx14tQDjXkGP37p0sGzm493oSPLlF4
 oBSOgPKIzX0pvUYGEziebIAt3qF915nahHz1wSM6wWBeOfGczKkCzVs4PHR1vVGWm4Nj
 1H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TM/HAR2kIbbjsWEciD5SVgeeCTO1PDyzdJl58aiAKUU=;
 b=ZuiDFJS8fF5Tl1QJ30EN5dIyYXdeAYvGl6R+KsKvbEDNlO+vLnuwv6wbcVQ8J+PIHo
 sMDkYbYwO6Tek8bsEk+NU6b7TaNsjgL0uD/clp9DWGbbCq195+YLVIWMfiw25WE1oIba
 Cn4qDJrWyiPbpm2Fx4CWSrlyQ0zsYAjh9IiEstV6r1TJibWJ03KuZfMUzIQjz1b9UIgi
 BERV/mjMzwPu17geL8kUkZMUrtZH51UksRHANqQENuLR6eZoiaJJaeYSvAt3Ea1h2Fsm
 CCcX0JAnKeonFS0EvHyVqkntLKQ7JebjJafawgYE/kxYgzsVYQAK7CrVPYR52CZYWbS8
 QH7w==
X-Gm-Message-State: AOAM531bMLE02qxdiRcPVcPtKtO1qX30NGYlm7lH1ZPTWA9PZVsDnGJb
 x5iX2pJmwNxeeoSIcDdkTbw=
X-Google-Smtp-Source: ABdhPJw9i0hkx/ZJX4gMlIdhV58CWJ6jGL1hsGTn/P4mcWSdf8vQ6enEN7lxxJB7ZPLqZykU8TlfWA==
X-Received: by 2002:a17:902:868d:b0:13d:dfa7:f3f2 with SMTP id
 g13-20020a170902868d00b0013ddfa7f3f2mr456589plo.30.1633363344226; 
 Mon, 04 Oct 2021 09:02:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 34/52] KVM: PPC: Book3S HV P9: Restrict DSISR canary
 workaround to processors that require it
Date: Tue,  5 Oct 2021 02:00:31 +1000
Message-Id: <20211004160049.1338837-35-npiggin@gmail.com>
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

Use CPU_FTR_P9_RADIX_PREFETCH_BUG to apply the workaround, to test for
DD2.1 and below processors. This saves a mtSPR in guest entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 5a1859311b3e..6fb941aa77f1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1590,7 +1590,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		unsigned long vsid;
 		long err;
 
-		if (vcpu->arch.fault_dsisr == HDSISR_CANARY) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
+		    unlikely(vcpu->arch.fault_dsisr == HDSISR_CANARY)) {
 			r = RESUME_GUEST; /* Just retry if it's the canary */
 			break;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 619bbcd47b92..67f57b03a896 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -683,9 +683,11 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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

