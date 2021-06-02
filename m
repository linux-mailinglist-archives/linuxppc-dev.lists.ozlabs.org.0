Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F3397DE9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 03:09:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvrXG2gJSz3bw0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 11:09:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=MwZdZDEB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=MwZdZDEB; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvrWH0t1rz2ykM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 11:08:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=bGOXjl45VUTLODftVWfvoDeh/WmFH4qkX4gdmJCwboE=; b=MwZdZDEBWLvsxNu63dXFfadjzI
 UUC6D+QJdvHbBXZmzlzcPeQRRWXbSoxaGNzGaiK6EgcEGn7NCH/b3oECeDyWbpJN0C71Bm5FLkI0k
 Bbxtp1r5GDFA1hdf4phWW0IbjCgubbYTT/5afqoeMakmLqmKBb6frqcQFq/s1VHpm0D53au72visK
 313/jkjcvkWVXMEF7YQo/N0polJ7d8yzEchJLw21/EOxLydRqxudlYqyhq9jyYuF/FOy5/yzfMVOp
 /xdDLG9/KVs4XUzvdn/Y9bq8bowaxfAHsvbXM0oF8PSIjpXRpSyToW9gvjZVouDG26wB0neVJh1rX
 Na0xe95A==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1loFMh-00102Z-RX; Wed, 02 Jun 2021 01:08:12 +0000
Message-Id: <cover.1622577339.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 1 Jun 2021 12:55:39 -0700
Subject: [PATCH 0/5] DMA fixes for PS3 device drivers
To: Michael Ellerman <mpe@ellerman.id.au>, David@lists.ozlabs.org,
	S.Miller@lists.ozlabs.org,
	" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>"@lists.ozlabs.org
Date: Wed, 02 Jun 2021 01:08:11 +0000
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is a set of patches that fix various DMA related problems in the PS3
device drivers, and add better error checking and improved message logging.

The gelic network driver had a number of problems and most of the changes are
in it's sources.

Please consider.

-Geoff

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-gelic

for you to fetch changes up to 4adcfc9735bf8d1987d2bc82e914be154f2ffad8:

  net/ps3_gelic: Cleanups, improve logging (2021-06-01 12:27:43 -0700)

----------------------------------------------------------------
Geoff Levand (5):
      powerpc/ps3: Add CONFIG_PS3_VERBOSE_RESULT option
      powerpc/ps3: Warn on PS3 device errors
      powerpc/ps3: Add dma_mask to ps3_dma_region
      net/ps3_gelic: Add gelic_descr structures
      net/ps3_gelic: Cleanups, improve logging

 arch/powerpc/include/asm/ps3.h               |   4 +-
 arch/powerpc/platforms/ps3/Kconfig           |   9 +
 arch/powerpc/platforms/ps3/mm.c              |  12 +
 arch/powerpc/platforms/ps3/system-bus.c      |   9 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 968 +++++++++++++++------------
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  24 +-
 drivers/ps3/ps3-vuart.c                      |   2 +-
 drivers/ps3/ps3av.c                          |  22 +-
 8 files changed, 598 insertions(+), 452 deletions(-)

-- 
2.25.1

