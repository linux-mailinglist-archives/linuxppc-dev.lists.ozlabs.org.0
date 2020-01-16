Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D213D1C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:57:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynQR4XmtzDqNt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:57:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCC6fWVzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AJ6WIRIr; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCC4RVtz9sR0; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynCC2jRBz9sPW; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139287;
 bh=4P71+1AmChjmbDWdLc8e4bmEySVaKx76IqbtF519OgE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJ6WIRIrF5IbFooewM45sk3wdHag+WHZP4HJR6VvsmCQsp+8CS6YfcjyLHxBsb0fp
 Y4wWJ3p0fr1wNiJTiqmdAJiZcZJJ7mRB6/jaAHS9aEEQGIHYZhVy4GbZuBT6Q8mjO1
 PRTHEqhimE63T2vt72BEZR+oK9gCp9GYyynt3IRK0SJq8qULSGnf1H0ludkSG6btG2
 xHrcHHxwHe5H3SWoRx3g94Z2PPWXWuEYjasSgJ7ZmRVBS6S7P/dPcUHd5HGv7EXI/F
 1hA1bsKBYWD+cQgBRCcv/AEjIIljV0O92/3rvx1TJjnXlCDR3LXpuNHgbbCflWzcT4
 ZFYhmyCCgxXEw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 5/9] powerpc/configs/skiroot: Drop default n
 CONFIG_CRYPTO_ECHAINIV
Date: Thu, 16 Jan 2020 11:48:04 +1000
Message-Id: <20200116014808.15756-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116014808.15756-1-mpe@ellerman.id.au>
References: <20200116014808.15756-1-mpe@ellerman.id.au>
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
Cc: joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's default n so we don't need to disable it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 74cffb854c0f..0aa060eef06c 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -293,5 +293,4 @@ CONFIG_WQ_WATCHDOG=y
 CONFIG_XMON=y
 CONFIG_XMON_DEFAULT=y
 CONFIG_ENCRYPTED_KEYS=y
-# CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
-- 
2.21.1

