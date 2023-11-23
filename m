Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07E7F5CE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:51:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UF/smYE6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZff74zcz3vhZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:51:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UF/smYE6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZb91KNjz3dSs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:48:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 794D9CE25FB;
	Thu, 23 Nov 2023 10:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456EDC433C8;
	Thu, 23 Nov 2023 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736498;
	bh=bnImJ/ObQ6B/nPGCBESa5sKS25GC8i0wwxIop7YcLiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UF/smYE6w5t3Qu/JkXRjWHikWmWDZmaBN5EAC0TUMncJwqfZpU4hZRIOLkZvfaEB7
	 mm+xLV+CyHdSJjMBRUaiN3Xb26CVJGT5Rbc6Iqsf8EioYjGQdfjA3bQn2Llibv7KcB
	 wxDRkP+Skv7hD8WFmKTzR4O17Zr5+T4R9K1U3GIyPxAE57goc21d5V7iNvRg/HK01R
	 M5JBj2jvncyqmoXhXTq2ovGGOOL+zKKWz/kuGzcn0L5WXG9DPX2lzz6jK5UlZGnEGZ
	 LB1pRNtB2JwMDzAG9D/hc/+Q+YR1ZZ9kF9JeBFGGZND7JWtJzZ6UycYqQGDJVw7Clc
	 8MCN4mafoiABw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/3] powerpc: powermac: mark smp_psurge_{give,take}_timebase static
Date: Thu, 23 Nov 2023 11:48:01 +0100
Message-Id: <20231123104801.15537-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123104801.15537-1-arnd@kernel.org>
References: <20231123104801.15537-1-arnd@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

These functions are only called locally and should be static like the
other corresponding functions are:

arch/powerpc/platforms/powermac/smp.c:416:13: error: no previous prototype for 'smp_psurge_take_timebase' [-Werror=missing-prototypes]
  416 | void __init smp_psurge_take_timebase(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/platforms/powermac/smp.c:432:13: error: no previous prototype for 'smp_psurge_give_timebase' [-Werror=missing-prototypes]
  432 | void __init smp_psurge_give_timebase(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/powermac/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index c83d1e14077e..15644be31990 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -413,7 +413,7 @@ static void __init smp_psurge_setup_cpu(int cpu_nr)
 		printk(KERN_ERR "Couldn't get primary IPI interrupt");
 }
 
-void __init smp_psurge_take_timebase(void)
+static void __init smp_psurge_take_timebase(void)
 {
 	if (psurge_type != PSURGE_DUAL)
 		return;
@@ -429,7 +429,7 @@ void __init smp_psurge_take_timebase(void)
 	set_dec(tb_ticks_per_jiffy/2);
 }
 
-void __init smp_psurge_give_timebase(void)
+static void __init smp_psurge_give_timebase(void)
 {
 	/* Nothing to do here */
 }
-- 
2.39.2

