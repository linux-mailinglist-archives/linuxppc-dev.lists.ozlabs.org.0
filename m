Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB463D5223
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5sh21xgz3gf5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:04:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HOKqpTPk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HOKqpTPk; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5b32tdNz3ck8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:59 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id c16so4440257plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FMW47dARaup+eOqBMjIjGjKfF+ltOIcNH9DSadt5C4=;
 b=HOKqpTPk5lE5fjYw+uVPSwYFwNbq92SAWi8giqUyT9LLGQSBP9CPlEVg6B7jxa2QME
 4ckogK4xix6yhsQzIiFvajyHAdKGK/bUONAXdvqZofKGGA+6Q6gVNhUbILRxNDAp0Yyc
 aLkU/JwQLSk/9UUhwEm4zn5/45TuDir4OKZiu96YnarcMYYnxATog9gQaQpoS2ak8I6L
 CNJ78E0Yd3SlYBtmEj4ebqdL71AZhG9ZQ5pcV92xuBnDi5FSdZ0pNs729k2e7UIeIjg+
 IhwmNIUlXyJtdz9obRQI0HzLLLNjfLpUDqgZ/vnuhcSGHCzFJlAFmTUvnpB8P+7KKgXQ
 UV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FMW47dARaup+eOqBMjIjGjKfF+ltOIcNH9DSadt5C4=;
 b=V4094HmkSn+oIGQtJ6bkjsI0dPFD4W4oNZNJHk8D9camD2HY254rZ+6UI6sntanAaG
 xs45j6TXvoXeUZTpDXmz+uEAmeqyGpjLCc6QB9o5yAziPr4RGF0BaNJN3BqRvutas/IP
 fFaeUK+Nk8q9Bl1s4ZlBUYFFJU5VpoQKLN+BV+p9tVzpwlb1sTm5iE/kPAa7YI8OBkOV
 Xk39T2AwMWT/ygY9aSkJZMTfI98AhUJr4xy97njha3m2u4Gxw1iJWzUv13Mtt/vtIvTh
 u28dNcUw/dkb6yID8++ikOQcDiRJC6RIIitu9cwLaH/CazCtIJV9UJxH6XQ6uUIxPtbx
 xaeA==
X-Gm-Message-State: AOAM533oItFuqb9ro2GczDUXRFgvskNlsIKQ14MqoN/4qf+nx8G9Rlx+
 NEVr+CTGwzzQ6GaMoqICIEY=
X-Google-Smtp-Source: ABdhPJwHn4E6yTCWXtErPNc+BeOQyynG2dD/DRZCLKaW97xyd4T92AoQfu8XAB7VKDUHnQbRlMCpQw==
X-Received: by 2002:a63:1f24:: with SMTP id f36mr16264020pgf.151.1627271517416; 
 Sun, 25 Jul 2021 20:51:57 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 31/55] KVM: PPC: Book3S HV P9: Juggle SPR switching around
Date: Mon, 26 Jul 2021 13:50:12 +1000
Message-Id: <20210726035036.739609-32-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This juggles SPR switching on the entry and exit sides to be more
symmetric, which makes the next refactoring patch possible with no
functional change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 56429b53f4dc..c2c72875fca9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4175,7 +4175,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		msr = mfmsr(); /* TM restore can update msr */
 	}
 
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	load_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
@@ -4183,7 +4183,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu, &host_os_sprs);
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4283,6 +4283,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			vcpu->arch.slb_max = 0;
 	}
 
+	switch_pmu_to_host(vcpu, &host_os_sprs);
+
 	store_spr_state(vcpu);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4297,8 +4299,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
 	timer_rearm_host_dec(*tb);
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
-- 
2.23.0

