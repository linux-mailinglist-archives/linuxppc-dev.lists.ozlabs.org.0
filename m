Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE13D51E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:53:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5d80HxHz3dWp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:53:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gKo0r927;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gKo0r927; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Yx1Lnxz30DH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:01 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso5065759pjo.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHJ3Y57b/rviJNEhgVpmV6ko0RmXjy00ajwevlOD5SA=;
 b=gKo0r927juWtn87EJD51DvWI4ge3OKVYVlJ47/NJoPokPbSZgOB/+DRqsxLYuXjUYK
 hv4xG5T9lG71vhan1HwU4OzE05X+jZ32zcX44IYT4g8SHsrxmYbeaS4+Os3TpntUyux4
 W4ZaPFTgNpYedMqhIdRu2iEHsYsUrDH/4aGS6H1Qi/T5SXIL4Xay0qYxImdlOXUkibgi
 ntQA27hZ1aX6edF4E/RsYl8p75kllhHCMzA+HOsFnE4IQvQ1mcvClvsEPnpZmj5P8H5A
 qAih5HXzFfIxN4p6R9jQCDkLrKSIaHSIrJRpd2UkDMXmsX3vSlXLZGVd+uzZ5mUr8ttL
 1xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHJ3Y57b/rviJNEhgVpmV6ko0RmXjy00ajwevlOD5SA=;
 b=BPRcWh765O8Riw2btpiTBpTgOmk108XamSSnYPtwfF0uJq2lNQhMm8+wLSB5kSLqvV
 myw2K8NClmiPTPkWHhQ1ERqHj8oBmEhDMU8zivt+cpJKTogl1vQh9f6qPElx3wj6wb97
 SB0i8P/mMJ1Xi5ltWQyrQie7NZkqTKNoj1/g5tjl3ax5S00+58qyisZEwr4WiHdUaREr
 RKbFhWDj8z3CUhtfhrkXkY3IA214kH3kMydYLOsfW4im9E64eMASKF0/qL6H82jGe/c5
 rSy5me0NRTAlffQDLjH2/78ZXtOT8iuAk4XLRaN/ZuvL3mp0KPEhv3lLCvNAAsr5Y+MV
 mzLA==
X-Gm-Message-State: AOAM530xk3jekVT2NOgedLCMVxeO9JA5h68LA10jXXO9bbo72EejCj0n
 rKnJn5mh0AsRsagCEAbxmis43oLFyjk=
X-Google-Smtp-Source: ABdhPJyi4OmcTEciC/UAfHaN9YcU4R53EcBKSJmalI+W2dfBSIAvevoR8WwjBXxrrO6bu7KO+muLNQ==
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr15624560pff.13.1627271459222; 
 Sun, 25 Jul 2021 20:50:59 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:50:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 06/55] powerpc/64s: Remove WORT SPR from POWER9/10
Date: Mon, 26 Jul 2021 13:49:47 +1000
Message-Id: <20210726035036.739609-7-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This register is not architected and not implemented in POWER9 or 10,
it just reads back zeroes for compatibility.

-78 cycles (9255) cycles POWER9 virt-mode NULL hcall

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ---
 arch/powerpc/platforms/powernv/idle.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c743020837e7..905bf29940ea 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3740,7 +3740,6 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
@@ -3767,7 +3766,6 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.wort = mfspr(SPRN_WORT);
 	vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
@@ -3799,7 +3797,6 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
 	mtspr(SPRN_PSPB, 0);
-	mtspr(SPRN_WORT, 0);
 	mtspr(SPRN_UAMOR, 0);
 
 	mtspr(SPRN_DSCR, host_os_sprs->dscr);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 1e908536890b..df19e2ff9d3c 100644
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

