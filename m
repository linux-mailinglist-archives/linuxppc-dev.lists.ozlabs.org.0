Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B13C3A13
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 06:16:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMtr24pt2z3bnx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 14:16:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=F/1V2YnU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMtqV2Ny4z2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 14:15:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=m9tHb0mUdPA6fbhAbTHKgtVFzSCIIivpJGZjbLQrqjY=; b=F/1V2YnURRPTJn2fXGSAGCm7At
 fhb/IkTLD7nUAnQzG+z1RRiFeGaf/N8dTVAx93+CM6HgQo676BVV6xnLeD/zYUX8o5yR2BBkEC7ph
 M2lwn6yYzwgBvSDknP99ylEm/bZKyU1VgqLK4ozgYMxSQ3KvXYpnYQNB3chze2u/B+C/R9a+68BUb
 aVyrpUPk5/OaZl5VtpnzCNSviGJAx0ogiqKrQF53UFd4F/LbVX0zhEr2SaEEFcCkPwkE4PpW9+Pl2
 51afd1rvVKAMj4FmDFAOOM38h42KcQeAC6pg38zaeqLaPe6PfP0yBJovChF/xcDopH0cWhAjYJG4P
 EfYiVcoQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m2QsH-0079dR-Fq; Sun, 11 Jul 2021 04:15:25 +0000
Message-Id: <cover.1625976141.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 10 Jul 2021 21:02:21 -0700
Subject: [PATCH v3 0/2] DMA fixes for PS3 gelic network driver
To: David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 11 Jul 2021 04:15:25 +0000
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

Hi Dave, Jakub,

This set of patches fixes various DMA related problems in the PS3 gelic
network driver and adds better error checking and improved message logging.

Please consider.

Changes from v2:
  Rebase to latest net-next.

Changes from v1:
  Split the v1 series into two, one series with powerpc changes, and one series
  with gelic network driver changes.
  
-Geoff

The following changes since commit 5e437416ff66981d8154687cfdf7de50b1d82bfc:

  Merge branch 'dsa-mv88e6xxx-topaz-fixes' (2021-07-01 11:51:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-dma-net

for you to fetch changes up to ffb7b2f4ac085986f563131e3851e07393cd514f:

  net/ps3_gelic: Cleanups, improve logging (2021-07-10 20:42:42 -0700)

----------------------------------------------------------------
Geoff Levand (2):
      net/ps3_gelic: Add gelic_descr structures
      net/ps3_gelic: Cleanups, improve logging

 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 968 +++++++++++++++------------
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  24 +-
 2 files changed, 557 insertions(+), 435 deletions(-)

-- 
2.25.1

