Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F5C1B006
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 07:40:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452V6F5jhzzDqJW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 15:40:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452V4z3pNpzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 15:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="SBZho+4s"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 452V4y4qlQz9sBr;
 Mon, 13 May 2019 15:39:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1557725986;
 bh=E99oQlisjXXHDz37euXve/y111mvEfemI5ngb4z4tjc=;
 h=From:To:Cc:Subject:Date:From;
 b=SBZho+4sqhTPFRWKUE4fu8yW41qQ5OHSnBtYd+cXE1wqq+Hop9Msf5lOiGp+/VeZR
 hPZI+G8Zvi2Kg1Z55DwA8c1SQ54c/jC0FRBPYBdx1Of5yc6W1SBA1lVxQ1mKpcV3a/
 mpKUUhIfFu97I5ZBoAjJCN8oA66++/ld6qnxTuRmxB5eKzENocAYMIxv01CZs5f7o4
 w5uzoMPHYYMEZUCqbqTfaiccIQA2763NSHB5wZoEMJdwIJNWNS61xOqV2ERcVJHFKg
 tpTiVp5iG4zyARrOhgU3YyoPHXpvLsCdgmTm9VGzy+3dHrx6iMtMr0guHlhkyCoEEX
 q6D3CmGJYpzQQ==
Received: by neuling.org (Postfix, from userid 1000)
 id 9764C2A0390; Mon, 13 May 2019 15:39:46 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Document xive=off option
Date: Mon, 13 May 2019 15:39:10 +1000
Message-Id: <20190513053910.19227-1-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE
interrupt controller") added an option to turn off Linux native XIVE
usage via the xive=off kernel command line option.

This documents this option.

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c45a19d654..ee410d0ef4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5177,6 +5177,15 @@
 			Format:
 			<irq>,<irq_mask>,<io>,<full_duplex>,<do_sound>,<lockup_hack>[,<irq2>[,<irq3>[,<irq4>]]]
 
+	xive=		[PPC]
+			By default on POWER9 and above, the kernel will
+			natively use the XIVE interrupt controller. This option
+			allows the fallback firmware mode to be used:
+
+			off       Fallback to firmware control of XIVE interrupt
+				  controller on both pseries and powernv
+				  platforms. Only useful on POWER9 and above.
+
 	xhci-hcd.quirks		[USB,KNL]
 			A hex value specifying bitmask with supplemental xhci
 			host controller quirks. Meaning of each bit can be
-- 
2.21.0

