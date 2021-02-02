Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1030B5A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:10:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV8v41Z77zDr22
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h9xEao17; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8lW3ZSFzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:03:35 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id gx20so1454511pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8TVajqYLB/Li99OMhp5OhsGulAlbbfY7jMeRUpSx/E0=;
 b=h9xEao17YffqKMp8ERSFryBsfTuUiNZevfY4JojDOcdLcImSBkv+Mab6d88h0tm81W
 0XoenOSTtknkSvhF1fzoObhMjCzR1sM0UevcLIBxw+rZ1y24VIHVY0/cLVF0TkkZZ7S1
 eDZfAI9Q2tuNIaY3x4SjaM1PqVYu3KmmK01DSPceHthOUG4vYpfiqbK+eclJ719Yo7Pj
 RcGZKqhgh2bQPTuG2hgHtnA+Fm0yEgqGCOcfX/TjjtF1iqbePh/Y/B0HUnDIH6VlIt7B
 aHUyIKe1to+Vyy1u48yfHRMcq/xD+FDAejzUXz8jBgeIULrRD2YAq1fWii9wNClESHiQ
 8Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8TVajqYLB/Li99OMhp5OhsGulAlbbfY7jMeRUpSx/E0=;
 b=LIsUncaRpAzkdyUMHWHEKtyIt/e/Ja1b8kBjITa+jaLy3RVaPNfdOtFvzbN9bbch93
 tzxwTqdse13qC/oY4N6nLtG1duJMJjUTivAy5S74afm8bHfJXpfZq/xeUnfxNXWP7qI5
 5N5N8ZMq4qFpA3vnnm78RleLSSQuhTUR0THPNKWy+I/hwkm1aC6G4ML701gLLqsfNfgg
 +RWscSZt9/mdnOzWE4wBVOflKZTrLrEJOS7Bgw9gNG0YT6UTg3v6aZ3iAz5ysb2j4HSw
 Eqn3ef7Bq+lWnjCBshnUBMdojtNMzjj6P4zwa7igPHKgsV7c5YSWQYXu47PzmKnq7Am/
 yOQQ==
X-Gm-Message-State: AOAM5327FesZWtBvfx6pkAIodEXtaQv+mwldZNnXyraMNH5x3SxIVLvr
 cOuWzCW+13nKAqbnWb2W6tY=
X-Google-Smtp-Source: ABdhPJw5P8lmgnELllwG3rGxVL6XBuUcG+jjRNUoRltcg0DyXouWXyjpwnYfWCujFFYNtuns1sBTRQ==
X-Received: by 2002:a17:902:c410:b029:dd:7d4a:e50 with SMTP id
 k16-20020a170902c410b02900dd7d4a0e50mr20523765plk.36.1612235012822; 
 Mon, 01 Feb 2021 19:03:32 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id a24sm20877337pff.18.2021.02.01.19.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 19:03:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 3/9] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Tue,  2 Feb 2021 13:03:07 +1000
Message-Id: <20210202030313.3509446-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202030313.3509446-1-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
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

Add a separate hcall entry point. This can be used to deal with the
different calling convention.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++--
 arch/powerpc/kvm/book3s_64_entry.S   | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e6f7fc7c61a1..c25395b5921a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2028,13 +2028,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * Requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
 	 * outside the head section.
 	 */
-	__LOAD_FAR_HANDLER(r10, kvmppc_interrupt)
+	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
 	mtctr   r10
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	bctr
 #else
 	ld	r10,PACA_EXGEN+EX_R10(r13)
-	b       kvmppc_interrupt
+	b       kvmppc_hcall
 #endif
 #endif
 
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 8e7216f3c3ee..3b894b90862f 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -9,6 +9,10 @@
 /*
  * We come here from the first-level interrupt handlers.
  */
+.global	kvmppc_hcall
+.balign IFETCH_ALIGN_BYTES
+kvmppc_hcall:
+
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
 kvmppc_interrupt:
-- 
2.23.0

