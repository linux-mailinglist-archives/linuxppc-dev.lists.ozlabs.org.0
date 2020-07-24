Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE222C720
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:55:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrLb5dRLzF0jM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:55:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqW91ZJzzF0fw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EGCQ3tNp; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqW75P8kz9sSt; Fri, 24 Jul 2020 23:17:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqW72W26z9sTR; Fri, 24 Jul 2020 23:17:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596659;
 bh=qlGs0MT2r0u9bOmmPQxW5aYXU38qDNKLTamuofaPJ/E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EGCQ3tNpt6/LUjMjGKmu64rzNjnxosXjbZ6wLS0Oz1Aa5H/CYY2HA5zCMiIBVA9bx
 PZnopw0gKgxFPXdkkKwMjrYsJikFORJLi5pOxQn/0eDyVswiar5CYUH2Kx0vao5vB7
 sCwFbQQng5HAVIUs3W5K7xPe8siioS3v/Nggk049Zu5oJYKMMaNd8R1HlzVnjKLi+l
 YzCh8rW3qEyQKL5QBe1VwVtAlhi+Y5MKwB8TZtJ5kbk0StUCW8wLWpcqWcFrhpeNup
 u4OSGm7PKSMlQIlCsXOLeDJbZ392m78exqdx+mvNea4KswVw1XN3OrV7qjdyhTdHYt
 VIBvt3R0N6R0A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/9] powerpc/52xx: Fix comment about CONFIG_BDI*
Date: Fri, 24 Jul 2020 23:17:22 +1000
Message-Id: <20200724131728.1643966-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a comment in lite5200_sleep.S that refers to "CONFIG_BDI*".

This confuses scripts/checkkconfigsymbols.py, which thinks it should
be able to find CONFIG_BDI.

Change the comment to refer to CONFIG_BDI_SWITCH which is presumably
roughly what it was referring to. AFAICS there never has been a
CONFIG_BDI.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

If anyone has a better idea what it means feel free to reply.
---
 arch/powerpc/platforms/52xx/lite5200_sleep.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/52xx/lite5200_sleep.S b/arch/powerpc/platforms/52xx/lite5200_sleep.S
index 70083649c9ea..11475c58ea43 100644
--- a/arch/powerpc/platforms/52xx/lite5200_sleep.S
+++ b/arch/powerpc/platforms/52xx/lite5200_sleep.S
@@ -56,7 +56,7 @@
 	/*
 	 * save stuff BDI overwrites
 	 * 0xf0 (0xe0->0x100 gets overwritten when BDI connected;
-	 *   even when CONFIG_BDI* is disabled and MMU XLAT commented; heisenbug?))
+	 *   even when CONFIG_BDI_SWITCH is disabled and MMU XLAT commented; heisenbug?))
 	 * WARNING: self-refresh doesn't seem to work when BDI2000 is connected,
 	 *   possibly because BDI sets SDRAM registers before wakeup code does
 	 */
-- 
2.25.1

