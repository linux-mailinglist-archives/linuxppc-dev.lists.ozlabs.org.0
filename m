Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB433B0250
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:05:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Npr1T52z3f9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:05:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KvAilNvP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KvAilNvP; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ng20Bz5z30DB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:38 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id w31so16766743pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggokmDItKSM+r98aPBZE1WlhVjHNg7ei24yZFkvVe/w=;
 b=KvAilNvPuB1NHnIS4L5QkckqxSNAVGThELvM/RdW66IUG7W/ZNK2EhyWW/uYEpqO/Z
 647eyfGORdKouYt3HoPrERb+ljSpZL2s1+IBVu0yedmwMaVsuVeUxWlklzMzcQPoZuea
 vvhoZnNiWJdAA/dWV3JJ3HqNqwYNxOClVX/mESh1HrNbDaLrFa6giMMePycN8zQyVYJS
 rsst7nK7a1JqeQqTqDtrcqkSS3UosIEP9XtWmAza6eP2Zl5m14WrjQ5yc473cv4gCzem
 VpC1JmrfA3oJQaCc9ZA4z0q7U/ayt1wABSpuvili7HjMYwpq6thUgAaVYTiHN8cLLFm1
 x0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggokmDItKSM+r98aPBZE1WlhVjHNg7ei24yZFkvVe/w=;
 b=Mu/ogA3JO3xg837eZ8Avx77eP610RGGfAcxCsyzy7EGJoY8h1NZUOF/TaeFNPx6TCi
 W6H0Ut9HrxfJxEwAFpMY3iXTcSBKvBTcOcQ5HQgGnAwJfNbwAevaukDAWxJ+0is/ZpKW
 lOjQakhOfQENzjvznOGz/tpISdmVq2TskNll0//VQN0ItsavuDsuy7D+Ydn//KF0Tet6
 jyzUWCaYRU1X2uqJmhNzP9/QKAfAhJJYQNHjgb7aYk8WvRulRlpfPZvvkACQBijYy9aB
 EeLTYe50QESVJkrG0iz2T6dEVGas4GrZ0LNixn74wnI22Brt7qyitfRNFeFdw/rv5P34
 tLBw==
X-Gm-Message-State: AOAM530rFCEyLocJ4P4pjNHcSjl9nUTKmXYwkVzazLCF5iVM1FqsFHll
 99JAXML+MIfhfxbAUQzBW+A=
X-Google-Smtp-Source: ABdhPJy1gmQjMJdmMrzCLhjkBXRnRxrSGH8rAMVd14jqCbsGIPAFP/oVbtxa0SkQCjlcOMn5cw7/FA==
X-Received: by 2002:a62:2ec7:0:b029:301:fe50:7d4b with SMTP id
 u190-20020a622ec70000b0290301fe507d4bmr3090154pfu.78.1624359515245; 
 Tue, 22 Jun 2021 03:58:35 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 16/43] KVM: PPC: Book3S HV P9: Move SPRG restore to
 restore_p9_host_os_sprs
Date: Tue, 22 Jun 2021 20:57:09 +1000
Message-Id: <20210622105736.633352-17-npiggin@gmail.com>
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

Move the SPR update into its relevant helper function. This will
help with SPR scheduling improvements in later changes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f0298b286c42..73a8b45249e8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3953,6 +3953,8 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
+	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
+
 	mtspr(SPRN_PSPB, 0);
 	mtspr(SPRN_UAMOR, 0);
 
@@ -4152,8 +4154,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(tb);
 
-	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
-- 
2.23.0

