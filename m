Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BF39AAC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 21:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwwcj6526z3c2G
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 05:16:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=nklZy4Ct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=nklZy4Ct; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwwbH2SYqz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 05:15:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=e2j8JkVkdybAQQ+dpN+qDW7fML583kWbGDq7oGOQ5i4=; b=nklZy4CtVPH8R4abjyMMnhdQJd
 zy6rYMQXSYs8jk81Y2675CQikwmIS+GRXYoXxaCgvvbBf2WXtcjr8F3jHAlNTw4TIXIx1hi1mLkjV
 k81DdN+n6Pnqum+o36YKKqaiYKy7mn81Q2ALQL515zLW2z0axMppKTVCFNi68qUltvsrhEE5adbu8
 L8Nizo2JZx21wtbkkgr6oQU4FGhYirJNGtKe75rsNGssXXBPp8n0eN7WyZF32QNTwCeAto6inI+jO
 p+jWyTSz965XDd+4HvpivGkbJq8VArewBq3vFNMPPgSrqwFtiA5EmDdgoebNaQiJ/4kZEFqw3yf+K
 4yVQ/tXA==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1losnx-001J0K-4u; Thu, 03 Jun 2021 19:15:00 +0000
Message-Id: <cover.1622746454.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Thu, 3 Jun 2021 11:54:14 -0700
Subject: [PATCH v2 0/2] DMA fixes for PS3 gelic network driver
To: David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 03 Jun 2021 19:14:57 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dave, Jakub,

This is a set of patches that fix various DMA related problems in the PS3
gelic network driver, and also adds better error checking and improved
message logging.

Please consider.

Changes from V1:
  Split the V1 series into two, one series with powerpc changes, and one series
  with gelic network driver changes.
  
-Geoff

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-dma-net

for you to fetch changes up to c944a7aa07cbe1893a2426cfd6ed506bc6aebbbc:

  net/ps3_gelic: Cleanups, improve logging (2021-06-03 11:47:01 -0700)

----------------------------------------------------------------
Geoff Levand (2):
      net/ps3_gelic: Add gelic_descr structures
      net/ps3_gelic: Cleanups, improve logging

 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 968 +++++++++++++++------------
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  24 +-
 2 files changed, 557 insertions(+), 435 deletions(-)

-- 
2.25.1

