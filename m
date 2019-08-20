Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAFC96248
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:19:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CXwc5LsFzDr7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tKdSo6X6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfq6rS7zDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfh3C4sz9v0Gb;
 Tue, 20 Aug 2019 16:07:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tKdSo6X6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e7Fkv2cRjIdr; Tue, 20 Aug 2019 16:07:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfh26N8z9v0GZ;
 Tue, 20 Aug 2019 16:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310028; bh=c4WuXaiy+O/7ygfEz9bDe2ljT2i9s9DO0RcjXIG8wTE=;
 h=From:Subject:To:Cc:Date:From;
 b=tKdSo6X6yn/V8jh+fv8E374U5J+/MfK3JMFpYVI4DOfpXR4AoMYS78nqWl1sBIN30
 zDEHUEkHBLT+U2xNEziKvJy7jEq5boP2VfF7RpDWfRCQHgINMs36OUhXuiGYX19spO
 Q8Md0Hv56n/t5O2pNhJOQl7MTmfSymJyp9jWKIpM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A95948B7D0;
 Tue, 20 Aug 2019 16:07:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HlwSrXBYzFH5; Tue, 20 Aug 2019 16:07:08 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 671B08B7C9;
 Tue, 20 Aug 2019 16:07:08 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 277A56B734; Tue, 20 Aug 2019 14:07:08 +0000 (UTC)
Message-Id: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 00/12] powerpc/mm: cleanup and refactoring in ioremap
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:08 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The purpose of this series is to cleanup and refactor ioremap.

At the time being, ioremap is duplicated in PPC32 and PPC64.
In addition, some additional duplication also appear within PPC64.

First part of this series drops as much as unused functions.
Then io-workaround is reworked to avoid indirect function call.
Then common parts of PPC32 and PPC64 are regrouped into a new file
called ioremap.c
Then other parts linked to ioremap are respectively moved out of
pgtable_32/64.c
The last part of the series tries to refactor ioremap_range() and
make use of ioremap_page_range() for all, then separates the early
path from the regular ioremap.

A future follow-up of this series will be to try and eliminate the
early ioremap part and use the generic early_ioremap instead.

v2:
- dropped the change of ioremap_bot growing direction for PPC64 and
  kept separate __ioremap_caller() and friends.
- separating more clearly early_ioremap() from regular ioremap()
- addressed received comments.

Christophe Leroy (12):
  powerpc: remove the ppc44x ocm.c file
  powerpc/ps3: replace __ioremap() by ioremap_prot()
  powerpc/mm: drop ppc_md.iounmap() and __iounmap()
  powerpc/mm: drop function __ioremap()
  powerpc/mm: rework io-workaround invocation.
  powerpc/mm: move common 32/64 bits ioremap functions into ioremap.c
  powerpc/mm: move ioremap_prot() into ioremap.c
  powerpc/mm: make ioremap_bot common to all
  powerpc/mm: Move ioremap functions out of pgtable_32/64.c
  powerpc/mm: refactor ioremap_range() and use ioremap_page_range()
  powerpc/mm: refactor ioremap vm area setup.
  powerpc/mm: split out early ioremap path.

 arch/powerpc/configs/ppc40x_defconfig        |   1 -
 arch/powerpc/include/asm/book3s/32/pgtable.h |   6 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |   2 +-
 arch/powerpc/include/asm/book3s/64/radix.h   |   3 -
 arch/powerpc/include/asm/io-workarounds.h    |  20 ++
 arch/powerpc/include/asm/io.h                |  16 +-
 arch/powerpc/include/asm/machdep.h           |   4 -
 arch/powerpc/include/asm/nohash/32/pgtable.h |   6 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h |   1 +
 arch/powerpc/include/asm/pgtable.h           |   2 +
 arch/powerpc/include/asm/ppc4xx_ocm.h        |  31 ---
 arch/powerpc/kernel/io-workarounds.c         |  13 +-
 arch/powerpc/mm/Makefile                     |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c           |  21 --
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  20 --
 arch/powerpc/mm/ioremap.c                    |  99 +++++++
 arch/powerpc/mm/ioremap_32.c                 |  92 +++++++
 arch/powerpc/mm/ioremap_64.c                 | 113 ++++++++
 arch/powerpc/mm/mmu_decl.h                   |   1 -
 arch/powerpc/mm/nohash/tlb.c                 |   2 +
 arch/powerpc/mm/pgtable_32.c                 | 153 -----------
 arch/powerpc/mm/pgtable_64.c                 | 203 +-------------
 arch/powerpc/platforms/44x/Kconfig           |   8 -
 arch/powerpc/platforms/4xx/Makefile          |   1 -
 arch/powerpc/platforms/4xx/ocm.c             | 390 ---------------------------
 arch/powerpc/platforms/ps3/spu.c             |  10 +-
 26 files changed, 353 insertions(+), 867 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/ppc4xx_ocm.h
 create mode 100644 arch/powerpc/mm/ioremap.c
 create mode 100644 arch/powerpc/mm/ioremap_32.c
 create mode 100644 arch/powerpc/mm/ioremap_64.c
 delete mode 100644 arch/powerpc/platforms/4xx/ocm.c

-- 
2.13.3

