Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E9143637
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:36:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wj30S8WzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:36:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYr4rDfzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ni5i3HAn; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYr1p0sz9sRp; Tue, 21 Jan 2020 15:30:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYq6JsGz9sNF; Tue, 21 Jan 2020 15:30:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581007;
 bh=mua+dEkm8zteum5SajFYO6zBLmixve00+B/1gz+lObU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ni5i3HAnNFgvh9jV52a4uMQJiE0fs30DCTrhbbEgL75T+sWT19wopJvwD/ckNcVkC
 VBTKTMY2odOsiwE/crK2bjwViaND9VlQOcx9lpZ5NMN2VVOsAAOIM801Ji7ms/kO39
 pz6tMuVWglaZKOVpl0UjNIu7ZtlMNskJLeRzIp+qIBVtQNJXVPXFKfe4fSQfw22sOY
 a++9avrgjWF04Xe/o46JKGHqpYzle9hwZ5dSy+FSW635/qVeeOWEstlNhAx0NtOwk6
 57vDUEMxrJCjznr0iRMXsKNSHpZ7yoy21yGoLqWNtWqHUYOzEe27B5CfgYjwZ5XGGG
 FRsFN6iCju44Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 04/10] powerpc/configs/skiroot: Drop HID_LOGITECH
Date: Tue, 21 Jan 2020 15:29:54 +1100
Message-Id: <20200121043000.16212-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121043000.16212-1-mpe@ellerman.id.au>
References: <20200121043000.16212-1-mpe@ellerman.id.au>
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
Cc: oohall@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit bdd08fff4915 ("HID: logitech: Add depends on LEDS_CLASS to
Logitech Kconfig entry") made HID_LOGITECH depend on LEDS_CLASS which
we do not enable, meaning we are not actually enabling those drivers
any more.

The Kconfig help text suggests USB HID compliant Logictech devices
will continue to work without HID_LOGITECH, so just drop it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 1 -
 1 file changed, 1 deletion(-)

v2: No change.

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 3eee39c50941..74cffb854c0f 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -235,7 +235,6 @@ CONFIG_HID_CYPRESS=y
 CONFIG_HID_EZKEY=y
 CONFIG_HID_ITE=y
 CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 CONFIG_USB_HIDDEV=y
-- 
2.21.1

