Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDF3B0206
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 12:58:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NgG46c6z3c31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 20:58:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=btO1uKTE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=btO1uKTE; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NfL1wshz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:02 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id v7so16766782pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1r0yBx8/sK5LQ18aCWWTuc9FFGjRmrTUBS3fruxffU=;
 b=btO1uKTEn9ovopnl0DTLnYDbAt8HHpDHNc+Qs7IQg1kkexesWbKyPuKp/OioVZSXR1
 IDYqzJzHTMejFlakxU4JDXveIdcro4XDztb4f95kmmkBmjnmgkTxRQ9/BB70ldp0mKw5
 +n/c1Jj4gXgSIp2Pq2dM26a2Bpb6neF0l7mpd3UEz2ZaeulWtp26+FNNs6IC3k6S7vtH
 MpoLO2X23dQImufEhnjPbLSNekucbW6vqioV1IA2yxfF3zHIh/3tDsON+Y+VMqHjVnMI
 k71dqu1+8E4/O1KYUyp9XrIm66ytIurQrSIHxTSrvS0+nnKsyT0Cdh19UNml5HbL4d19
 Yn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1r0yBx8/sK5LQ18aCWWTuc9FFGjRmrTUBS3fruxffU=;
 b=qZebNGkVHHQXgQhCFwfcKfUVfMQf1RAXCCSs1PnA7U7BodhiX5NRLBIN9KsmksgWY0
 4wxR1JQt9OnqLfO7wczkNw36jdvhqDR98gNTIokMgy4iMrGP/sQ2Y3TWkzwIV03t0u6O
 JjbotEP++Xiq6pSX88mldcARhtR+ptUvAYGC4ia/00B8SgJTEjpx1/9535vlFUx9LFuu
 TgOBNrkqukR2KxSOpg/LopIwa2G+DDxINw5H/q89PLJ5hijrLlO5UQnG6Um6lVK49oh5
 x5TJKkWfHnvv5xKATrmkLYujFmoTZ14zsNYMw4Doiu8OeXYNuZ5KDL8W6/AFZu6+qUHj
 GgWw==
X-Gm-Message-State: AOAM5327G4voMAACO3Udjl3/edE8w41D/At8M7h6t7ozE4Z3ihv7JuHq
 Cgv2jdrdUmT4PaqhJVvo5ng=
X-Google-Smtp-Source: ABdhPJwFCrG04fca8X3mHR68HCK+JemVsnFZXy2tatH6SRRos0P64vvC5pjDvqQEy1A5q6YIg/3jGQ==
X-Received: by 2002:a63:5d5c:: with SMTP id o28mr3256953pgm.22.1624359478911; 
 Tue, 22 Jun 2021 03:57:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:57:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 01/43] powerpc/64s: Remove WORT SPR from POWER9/10
Date: Tue, 22 Jun 2021 20:56:54 +1000
Message-Id: <20210622105736.633352-2-npiggin@gmail.com>
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

This register is not architected and not implemented in POWER9 or 10,
it just reads back zeroes for compatibility.

-78 cycles (9255) cycles POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ---
 arch/powerpc/platforms/powernv/idle.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9228042bd54f..97f3d6d54b61 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3640,7 +3640,6 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
@@ -3667,7 +3666,6 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.wort = mfspr(SPRN_WORT);
 	vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
@@ -3699,7 +3697,6 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
 	mtspr(SPRN_PSPB, 0);
-	mtspr(SPRN_WORT, 0);
 	mtspr(SPRN_UAMOR, 0);
 
 	mtspr(SPRN_DSCR, host_os_sprs->dscr);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 528a7e0cf83a..180baecad914 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -667,7 +667,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 		sprs.purr	= mfspr(SPRN_PURR);
 		sprs.spurr	= mfspr(SPRN_SPURR);
 		sprs.dscr	= mfspr(SPRN_DSCR);
-		sprs.wort	= mfspr(SPRN_WORT);
 		sprs.ciabr	= mfspr(SPRN_CIABR);
 
 		sprs.mmcra	= mfspr(SPRN_MMCRA);
@@ -785,7 +784,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 	mtspr(SPRN_PURR,	sprs.purr);
 	mtspr(SPRN_SPURR,	sprs.spurr);
 	mtspr(SPRN_DSCR,	sprs.dscr);
-	mtspr(SPRN_WORT,	sprs.wort);
 	mtspr(SPRN_CIABR,	sprs.ciabr);
 
 	mtspr(SPRN_MMCRA,	sprs.mmcra);
-- 
2.23.0

