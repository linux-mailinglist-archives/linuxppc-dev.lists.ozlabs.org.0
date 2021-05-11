Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1A379BD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 03:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfKYB2r1Jz308m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 11:08:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LpCgulls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LpCgulls; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfKXj5dTwz2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 11:07:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FfKXb72Prz9sX1; Tue, 11 May 2021 11:07:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620695263;
 bh=iKF0JY8elXMeFUBMyJ1vDJ0xuv9E5yOuqYmIICX8jBo=;
 h=From:To:Cc:Subject:Date:From;
 b=LpCgullsSoOKNQ5y4IgiST7xpvRDTAgac73Zu++XDHZEWuVkWWTFSdpSYTCJZ+L/c
 LMb+rCgXxbUR3EtTZ+zwtMdHBPRsp7wDSQHOe9dY7Airl9M3K0HbCdHgiHA22G9f6d
 QKvpIo3g7fBqfIm46HkRXy19SNdHMw0G5JU7dTZ4g3FV4Tl2Coy/h3Ez2ZfyIV5qol
 xqXV79HcNV2M1Cq6QKlrrXaU9h0K1lHG3E32UymwkVMqqHP+BzekMox0VEhhtqtO/u
 ze/1Rbf4k8NOGF9WtEBDGNF+zllxrxdqgAnjIhI87+c3HT9sGowqEBft/a5QrpRhHb
 MUWNfV0Bvx+Nw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/legacy_serial: Fix UBSAN: array-index-out-of-bounds
Date: Tue, 11 May 2021 11:07:12 +1000
Message-Id: <20210511010712.750096-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

UBSAN complains when a pointer is calculated with invalid
'legacy_serial_console' index, allthough the index is verified
before dereferencing the pointer.

Fix it by checking 'legacy_serial_console' validity before
calculating pointers.

Fixes: 0bd3f9e953bd ("powerpc/legacy_serial: Use early_ioremap()")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/legacy_serial.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

v2: mpe: Just move the assignment of port/info below the check, as
    suggested by Segher.

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 8b2c1a8553a0..cfc03e016ff2 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -356,13 +356,16 @@ static void __init setup_legacy_serial_console(int console)
 
 static int __init ioremap_legacy_serial_console(void)
 {
-	struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
-	struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
+	struct plat_serial8250_port *port;
+	struct legacy_serial_info *info;
 	void __iomem *vaddr;
 
 	if (legacy_serial_console < 0)
 		return 0;
 
+	info = &legacy_serial_infos[legacy_serial_console];
+	port = &legacy_serial_ports[legacy_serial_console];
+
 	if (!info->early_addr)
 		return 0;
 
-- 
2.25.1

