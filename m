Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6763E958F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:08:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF971q7pz3dQ9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:08:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aDlRdsD4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aDlRdsD4; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2D4865z30HR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:12 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id a20so3342387plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCxdivQtSElLr5d9idnYO7f6LUBSBDiT6V+2D6aLUKg=;
 b=aDlRdsD4I51ZZcZxRl0CmF1zHn4RYxWsHJ4/iLOfOd8NbRtE2QUQg60i0d0dn6IaSf
 OHfNgTaHEh1+Zwo1ZuhciLciJua9HiZI+t7dR3KthS+vpzKhjvDV3V+j6iO11KMniFWO
 y95cThRmDMfOwBvQkTzrbjQBxBPBwBe2YckNxbDGA2ypVJO61Bcg9OE9MkLoDt8vB6jM
 9vxgiCduW63oudsTcY9h4a/lZwv/HWqdxfSNIYUsgTYksCvhch9IcYH1y8qPW/Yd0HhC
 C3qTG2E1WYWgayKHvqimfxuU00dNXFCe3QG2Nnz3quJpubM7fQ5Nt0U77ieT1iHsxe/h
 wJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCxdivQtSElLr5d9idnYO7f6LUBSBDiT6V+2D6aLUKg=;
 b=iU+ZeXrj2h2gzMUUFfbmY1dc162l8uk29xC/98lDOvZ4btekej+BfovstXGB5NBOn4
 fGL6PN4bXesAwsu6rJ6uiVh86wNI3IJp+Nc+LXVE9wNNTv8n9xrMAmhx8NSNlXi5Hd6T
 D9HODPcSpH8NengNTuXnuTDYOlzt9PvjyIzTqRAQ3jtohjAhW+b6OBEyVqZAD7r8yX+N
 2TtBFT6ix2hQcg7zYRRDucTOa1NiirjSltUT18tmUYaHuCf60vrv19WVCWauio9oH50l
 cq06l3tXKO4SLP/2Qqk8GF1VrkO3Wglw0ARrWF+9FdgXCKnVJOik+ANuLPmOEopNdfpp
 ExUQ==
X-Gm-Message-State: AOAM533lJfQJa8obXSlE2dmUJ6WCzsZObOB698hQRLojhFJ4U6qdCkzx
 /MnW8YGbA0oPlonxkLrYJ5k=
X-Google-Smtp-Source: ABdhPJwOe47kCVYD2CjJf/UNfti3v0EKt3Z98V8sfY0s93Cmt6jR9l3cIXm7nAZJRd6rLoInIll1YQ==
X-Received: by 2002:a17:902:c711:b029:12c:9b3c:9986 with SMTP id
 p17-20020a170902c711b029012c9b3c9986mr19502076plp.44.1628697730313; 
 Wed, 11 Aug 2021 09:02:10 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 10/60] powerpc/64s: Remove WORT SPR from POWER9/10
Date: Thu, 12 Aug 2021 02:00:44 +1000
Message-Id: <20210811160134.904987-11-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This register is not architected and not implemented in POWER9 or 10,
it just reads back zeroes for compatibility.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ---
 arch/powerpc/platforms/powernv/idle.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1a3ea0ea7514..3198f79572d8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3770,7 +3770,6 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
@@ -3797,7 +3796,6 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.wort = mfspr(SPRN_WORT);
 	vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
@@ -3829,7 +3827,6 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
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

