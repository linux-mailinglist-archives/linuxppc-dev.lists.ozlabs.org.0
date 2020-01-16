Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15413D1C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:56:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynNM151gzDqCt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:56:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCC0bjLzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Cmlb31YA; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCB0Fdcz9sPW; Thu, 16 Jan 2020 12:48:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynC95qgQz9sRX; Thu, 16 Jan 2020 12:48:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139285;
 bh=HAoExLznK7LHCVq4rohdrxvnnHspzW0JWrYA+mhSodE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cmlb31YAjO9KGqLv3eIeK9oMGX68r8Hx6wXJMD07A/rpZt0ew4nw77XWtCyQCuq/J
 Tudj0oh5rphLOYyOLFmC4j3T+VvgALruSt3SOWvSgZgkzaWrlNoX3YEHCGIUUQq2FA
 QayZ5HScvRU27zjoogrCFA77ff4kHZO4eh/qnppmpItojsS+MZPC3GCdGfxUq/B/i/
 M5nOA+AuMAxER6DUX44JYUEhoDZfLGsJAUUyvL+zh3DkPNlox5FlFqQ9iPQoI0RY/N
 L2L9QNJ2ZycLtX0G4qFdR53ElQwZd7mQEAbVeMuhFeZ2qmIrca2nloFYOwt7Q4gq+s
 GbaEsz8dI1y7A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/9] powerpc/configs: Drop NET_VENDOR_HP which moved to staging
Date: Thu, 16 Jan 2020 11:48:02 +1000
Message-Id: <20200116014808.15756-3-mpe@ellerman.id.au>
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

The HP network driver moved to staging in commit 52340b82cf1a ("hp100:
Move 100BaseVG AnyLAN driver to staging") meaning we don't need to
disable it any more in our defconfigs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/44x/akebono_defconfig | 1 -
 arch/powerpc/configs/skiroot_defconfig     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index f0c8a07cc274..7705a5c3f4ea 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -59,7 +59,6 @@ CONFIG_BLK_DEV_SD=y
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
 # CONFIG_NET_VENDOR_EXAR is not set
-# CONFIG_NET_VENDOR_HP is not set
 CONFIG_IBM_EMAC=y
 # CONFIG_NET_VENDOR_MARVELL is not set
 # CONFIG_NET_VENDOR_MELLANOX is not set
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index eaaffe9ae8b9..3eee39c50941 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -146,7 +146,6 @@ CONFIG_CHELSIO_T1=m
 # CONFIG_NET_VENDOR_DLINK is not set
 CONFIG_BE2NET=m
 # CONFIG_NET_VENDOR_EZCHIP is not set
-# CONFIG_NET_VENDOR_HP is not set
 # CONFIG_NET_VENDOR_HUAWEI is not set
 CONFIG_E1000=m
 CONFIG_E1000E=m
-- 
2.21.1

