Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99513D1BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:54:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynL4169wzDqSr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:54:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCC1XsKzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oAnjGe/G; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCC0BHrz9sR4; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynCB5R46z9sRW; Thu, 16 Jan 2020 12:48:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139286;
 bh=/pbQTjSBawmTyflhfB632P+g9F92h0Chy1yg5X4tSqM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oAnjGe/GWZcO1RpL1cIuAgkGdwNbedvUweoCH2/otqLT6k9juKph7KMIvtqW253Nu
 9UEljXa4lqsW0YipqthFFxbVSbxX0HEWL79Emz6VRuvX45FwvLy96O9ACzRcdEx5yp
 THxIYTTryE/pdKFRDppHrx0eT9AbxOQGZUG8u3F6MUfBfSmcPKQxEp6Q7ncsUkEhaB
 3zY57tEoAkIuCua3d6uhPz29rXOYW97n09vW177Cnq+x8h8iPIKTjm6K3opZyn07ZA
 mu5jaXYhDuDYP8j4E4fkwmBzWOv2d8FlbMJTTjqlvx6TCayub8BDjakASdCv1RYLxv
 E6wjoUQcGWhGw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 4/9] powerpc/configs/skiroot: Drop HID_LOGITECH
Date: Thu, 16 Jan 2020 11:48:03 +1000
Message-Id: <20200116014808.15756-4-mpe@ellerman.id.au>
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

