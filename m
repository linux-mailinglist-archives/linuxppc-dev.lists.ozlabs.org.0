Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4C877FBBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVVK4QJGz3dTC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:15:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:120:4::f00:10; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVRh6T1Bz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:13:36 +1000 (AEST)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4RRVK72lf5z4x3WX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:07:55 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
	by xavier.telenet-ops.be with bizsmtp
	id ag7i2A0024QHFyo01g7imV; Thu, 17 Aug 2023 18:07:54 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfX4-000uIh-Ba;
	Thu, 17 Aug 2023 18:07:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfXB-007YEe-Q2;
	Thu, 17 Aug 2023 18:07:41 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Russell King <linux@armlinux.org.uk>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/9] ARM: Remove <asm/ide.h>
Date: Thu, 17 Aug 2023 18:07:32 +0200
Message-Id: <e53f0f8da1607856028d941e7ac8646aa2abc555.1692288018.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692288018.git.geert@linux-m68k.org>
References: <cover.1692288018.git.geert@linux-m68k.org>
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
v5.14, there are no more generic users of <asm/ide.h>.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/arm/include/asm/ide.h | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 arch/arm/include/asm/ide.h

diff --git a/arch/arm/include/asm/ide.h b/arch/arm/include/asm/ide.h
deleted file mode 100644
index a81e0b0d6747aa2f..0000000000000000
--- a/arch/arm/include/asm/ide.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  arch/arm/include/asm/ide.h
- *
- *  Copyright (C) 1994-1996  Linus Torvalds & authors
- */
-
-/*
- *  This file contains the ARM architecture specific IDE code.
- */
-
-#ifndef __ASMARM_IDE_H
-#define __ASMARM_IDE_H
-
-#ifdef __KERNEL__
-
-#define __ide_mm_insw(port,addr,len)	readsw(port,addr,len)
-#define __ide_mm_insl(port,addr,len)	readsl(port,addr,len)
-#define __ide_mm_outsw(port,addr,len)	writesw(port,addr,len)
-#define __ide_mm_outsl(port,addr,len)	writesl(port,addr,len)
-
-#endif /* __KERNEL__ */
-
-#endif /* __ASMARM_IDE_H */
-- 
2.34.1

