Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2572799A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:07:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGzY2kZ9z3f8s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:07:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Syx/hBEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Syx/hBEv;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGnd0WVCz3dy1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:59:16 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso251414b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211155; x=1688803155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHQqCBJ3vPZXVRp8sk7/Voq35H3ezkKDIoLrDymwHvA=;
        b=Syx/hBEvLem7J8x7MIylndX2yn6ETOT6bCSpoaTrM+CiiVvPOJhkmr1pyKeiBuzdfS
         Ze+3DgvfVXSpwY11hBporubRV0JzdZPHC9W88Z00o4FVQeCpgGRdWTe0RQsiG50shVqd
         Z+H6ipWTjKbiYX8RuNayDjv1zCJcUs1ovs5crYoZ56RnrRsSnlqYSedwWmeBeQg57Zhg
         p3SMc6jNHazx12kaFtRoJiWKIkV6hmAKIrymqIrjRlu+c7Yh6VeNKyazYkWW+w2ONCTN
         Bunaz5d6tT6RYC5xIU4fCRsY3rIVjmaKRWMu4SlIY/dN02NKqztvOY49zK5MECmmretk
         4hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211155; x=1688803155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHQqCBJ3vPZXVRp8sk7/Voq35H3ezkKDIoLrDymwHvA=;
        b=QnfOA2cP3wMYuff7we2RH9NtcDBOgLhAcKKhiARPOwffLw02xa3sxVLZokqcsna4Sm
         tDjZQp4Vv2pxMzTJxrWdCLZ48EAWX9GLmaXsK4J9/G1SOZkE5sdxq5JBS/jGEl7Oxd3z
         KhCkROswwgPWYiEMdguNF41QE7XTwGaWBkwE/NmGiHQCXiRjQ8+J4pbtJLYdteAZojNP
         JiIMdSpOW1YpyX8dCqph+j7Ko4gMhj7J5Ax5X6oZwckayISyHSXlTNL0uX/a7dwRsjt7
         qXmiPgtmV+MkqdlNLCVvMoxCzlgZqHvyZNjwH3C3BjvtymwSlfaujA1LQVOziTbzvmji
         5EEg==
X-Gm-Message-State: AC+VfDznj5D/UJXwMLuSARlBBFnlDVzYOZL7WlBqoEikgNo5AbMbkuX5
	7PZRRSX62O85hvorFU9IIwsk5nLoD5I=
X-Google-Smtp-Source: ACHHUZ6UTQ8tKBxpG8TetSBYlJj7oGL9tVasYjhgNgg/UD8gpKF2Jex+9C6NxPVoPBolUAUOJEnXtQ==
X-Received: by 2002:a05:6a20:4c8:b0:110:9b0b:71b6 with SMTP id 8-20020a056a2004c800b001109b0b71b6mr4391703pzd.37.1686211154836;
        Thu, 08 Jun 2023 00:59:14 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:59:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 10/12] powerpc: Discover runtime load address dynamically
Date: Thu,  8 Jun 2023 17:58:24 +1000
Message-Id: <20230608075826.86217-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next change will load the kernels at different addresses depending
on test options, so this needs to be reverted back to dynamic
discovery.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/cstart64.S | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index b7514100..e18ae9a2 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -33,9 +33,14 @@ start:
 	 * We were loaded at QEMU's kernel load address, but we're not
 	 * allowed to link there due to how QEMU deals with linker VMAs,
 	 * so we just linked at zero. This means the first thing to do is
-	 * to find our stack and toc, and then do a relocate.
+	 * to find our stack and toc, and then do a relocate. powernv and
+	 * pseries load addresses are not the same, so find the address
+	 * dynamically:
 	 */
-	LOAD_REG_IMMEDIATE(r31, SPAPR_KERNEL_LOAD_ADDR)
+	bl	0f
+0:	mflr	r31
+	subi	r31, r31, 0b - start	/* QEMU's kernel load address */
+
 	ld	r1, (p_stack - start)(r31)
 	ld	r2, (p_toc - start)(r31)
 	add	r1, r1, r31
@@ -114,8 +119,11 @@ p_toc:		.llong  tocptr
 p_dyn:		.llong  dynamic_start
 
 .text
+start_text:
 .align 3
+p_toc_text:	.llong	tocptr
 
+.align 3
 .globl hcall
 hcall:
 	sc	1
@@ -185,9 +193,10 @@ call_handler:
 	std	r0,_CCR(r1)
 
 	/* restore TOC pointer */
-
-	LOAD_REG_IMMEDIATE(r31, SPAPR_KERNEL_LOAD_ADDR)
-	ld	r2, (p_toc - start)(r31)
+	bl	0f
+0:	mflr	r31
+	subi	r31, r31, 0b - start_text
+	ld	r2, (p_toc_text - start_text)(r31)
 
 	/* FIXME: build stack frame */
 
-- 
2.40.1

