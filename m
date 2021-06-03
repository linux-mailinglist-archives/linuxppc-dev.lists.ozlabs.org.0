Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29339AACC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 21:17:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwwdK2tFbz3bs8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 05:17:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=znSBqktk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=znSBqktk; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwwcx0gNtz3021
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 05:17:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=SdBOjkk71gHdwa3b8GBxmmcv0Fc52YmntR4XLSd8mAU=; b=znSBqktknKqTrQ55YQPYAMxbLG
 g94m++jEcf6H/8A8eF9k1h5ha9JtEDOUzl0kwXTODkbWVrPUs2Abp5Jlt+gr4b1U6gmTOjsAkUfye
 crcxLh1qGuFwhFcpRiwg4YCbkxuUYaOCtRSDKqcGe3iJjvhHS0JrYyH3/39DShXlWrQr2IaYM04IL
 dVtBPq3HwBCYTgDLstqxdvpqOmOhEZmm8WABw988hFk7/j9i+OAewtxI1EuhNJaKLr62x1Z3FLBHJ
 JShiWU4gP5tQwKcRp5bYpLTYvcOyUafJy9jxF0plXC81ltuDngnwBZfcORRuVBurVSKZypSfvmB7a
 NJG4b0dQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1losps-001J3d-1R; Thu, 03 Jun 2021 19:17:00 +0000
Message-Id: <cover.1622746428.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Thu, 3 Jun 2021 11:53:48 -0700
Subject: [PATCH v2 0/3] DMA fixes for PS3 device drivers
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 03 Jun 2021 19:16:56 +0000
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
Cc: Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

This is a set of patches that fix various DMA related problems in the PS3
device drivers, and add better error checking and improved message logging.

Changes from V1:
  Split the V1 series into two, one series with powerpc changes, and one series
  with gelic network driver changes.
  
-Geoff

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-dma-powerpc

for you to fetch changes up to 562d0c9ea0100a30c3b186bcc7adb34b0bbd2cd7:

  powerpc/ps3: Add dma_mask to ps3_dma_region (2021-06-01 12:27:43 -0700)

----------------------------------------------------------------
Geoff Levand (3):
      powerpc/ps3: Add CONFIG_PS3_VERBOSE_RESULT option
      powerpc/ps3: Warn on PS3 device errors
      powerpc/ps3: Add dma_mask to ps3_dma_region

 arch/powerpc/include/asm/ps3.h          |  4 +++-
 arch/powerpc/platforms/ps3/Kconfig      |  9 +++++++++
 arch/powerpc/platforms/ps3/mm.c         | 12 ++++++++++++
 arch/powerpc/platforms/ps3/system-bus.c |  9 +++++----
 drivers/ps3/ps3-vuart.c                 |  2 +-
 drivers/ps3/ps3av.c                     | 22 +++++++++++-----------
 6 files changed, 41 insertions(+), 17 deletions(-)

-- 
2.25.1

