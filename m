Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C050E77FBDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVXm4Z0pz3dFr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.137.81; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 522 seconds by postgrey-1.37 at boromir; Fri, 18 Aug 2023 02:16:45 AEST
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVWK69ctz3cP2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:16:45 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4RRVK84H7Dz4x7hT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:07:56 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
	by laurent.telenet-ops.be with bizsmtp
	id ag7i2A0034QHFyo01g7i1C; Thu, 17 Aug 2023 18:07:55 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfX4-000uIf-BZ;
	Thu, 17 Aug 2023 18:07:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfXB-007YEb-P7;
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
Subject: [PATCH treewide 0/9] Remove obsolete IDE headers
Date: Thu, 17 Aug 2023 18:07:31 +0200
Message-Id: <cover.1692288018.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
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

	Hi all,

This patch series removes all unused <asm/ide.h> headers and
<asm-generic/ide_iops.h>.  <asm/ide.h> was still included by 3 PATA
drivers for m68k platforms, but without any real need.

The first 5 patches have no dependencies.
The last patch depends on the 3 pata patches.

Thanks for your comments!

Geert Uytterhoeven (9):
  ARM: Remove <asm/ide.h>
  parisc: Remove <asm/ide.h>
  powerpc: Remove <asm/ide.h>
  sparc: Remove <asm/ide.h>
  asm-generic: Remove ide_iops.h
  ata: pata_buddha: Remove #include <asm/ide.h>
  ata: pata_falcon: Remove #include <asm/ide.h>
  ata: pata_gayle: Remove #include <asm/ide.h>
  m68k: Remove <asm/ide.h>

 arch/arm/include/asm/ide.h     | 24 ---------
 arch/m68k/include/asm/ide.h    | 67 -----------------------
 arch/parisc/include/asm/ide.h  | 54 -------------------
 arch/powerpc/include/asm/ide.h | 18 -------
 arch/sparc/include/asm/ide.h   | 97 ----------------------------------
 drivers/ata/pata_buddha.c      |  1 -
 drivers/ata/pata_falcon.c      |  1 -
 drivers/ata/pata_gayle.c       |  1 -
 include/asm-generic/ide_iops.h | 39 --------------
 9 files changed, 302 deletions(-)
 delete mode 100644 arch/arm/include/asm/ide.h
 delete mode 100644 arch/m68k/include/asm/ide.h
 delete mode 100644 arch/parisc/include/asm/ide.h
 delete mode 100644 arch/powerpc/include/asm/ide.h
 delete mode 100644 arch/sparc/include/asm/ide.h
 delete mode 100644 include/asm-generic/ide_iops.h

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
