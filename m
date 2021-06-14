Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E73A725F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:10:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nGt5Tk7z3djW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:10:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=paXXV2fh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=paXXV2fh; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9h2wP0z2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:44 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9Z3b45z9sf9; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z2zjcz9sWM; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=RTpmrFffmDZhFyeOsyMfLIFMjrzm3WEX5+pjp0t2Au4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=paXXV2fh1xlQS1jKKycj8iZpXJSSD35mFMepm6XuMl7gsdTECuK1tLOo+R1uCt1/9
 RoLSvtruQhyY3ry/ZTiUJhZ0FIqGxLfXh/4H6Lc9xf+BsDSTsF9K6qN0EeBTwmYQHR
 9RxkHYz8rm0e/a/3LpvR4ErCB2/eb7FLZx5nzxSjeAIsPOuozjrnEuYTfDFezUiWLn
 jbvtkkFrMBRJNNOsDn10NmA/C8jhvfApRRl/VOIuXww4Gf39d6m3twuu/1jAsij95Q
 2nqTTdrCoYnKsvAo1W3BAy9dqeo++75gwhw0zcYWX0O6nJTp9ToM54LHiQfLQopFou
 X78u06JzluHbg==
Date: Tue, 15 Jun 2021 09:05:27 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 11/11] powerpc/microwatt: Disable interrupts in boot wrapper
 main program
Message-ID: <YMfgt4ndMrtYwWYY@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This ensures that we don't get a decrementer interrupt arriving before
we have set up a handler for it.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/boot/microwatt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/microwatt.c b/arch/powerpc/boot/microwatt.c
index ac922dd0aa4d..86a07bceaadf 100644
--- a/arch/powerpc/boot/microwatt.c
+++ b/arch/powerpc/boot/microwatt.c
@@ -12,6 +12,7 @@ void platform_init(unsigned long r3, unsigned long r4, unsigned long r5)
 {
 	unsigned long heapsize = 16*1024*1024 - (unsigned long)_end;
 
+	__asm__ volatile("mtmsrd %0,1" : : "r" (0));
 	simple_alloc_init(_end, heapsize, 32, 64);
 	fdt_init(_dtb_start);
 	serial_console_init();
-- 
2.31.1

