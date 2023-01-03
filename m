Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1865C565
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 18:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmgKY659Sz3bhn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 04:52:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=2Qrscbbr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=2Qrscbbr;
	dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmgJZ4bStz3bfD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 04:51:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vUOYzdlJpvp1xrSyomDW57on5fPuziOALxDWgZAjQgU=; b=2QrscbbrPsRmV7m9S/40T1NJCg
	ap98FTCqq2YWCj/Mq5zVWVy8N6e4FidVq5/BDiklHDtwePeCo+UT5c/NA+tKH1Q0etZUH6VJ/nreO
	IPCibafAzvnjtuX6WlU3R+FLB48Lc13goJUD8bXVk9teRyXk9ovH/mHrTM7R5hqeAUxYlM6eCm7Kv
	LO+pngkDfmmxYcJXdA1NBH49hdiUU0APOxiUnY4UO7X0DCL12n5OiBRbRA9WbmIwSJ59n7ld63TDI
	mHxLFcfrTn6Ras/ym7KEaARW7nzBFn7VQp5FB0LpG3boFM0jWBcHqTySbNYY61M2SRpibhbuaCRHV
	rU5YyTtQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClRH-007YIq-Bh; Tue, 03 Jan 2023 17:51:03 +0000
Message-Id: <cover.1672767868.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 3 Jan 2023 09:44:28 -0800
Subject: [PATCH v2 0/2] PS3 patches
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 03 Jan 2023 17:51:03 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

This v2 series is just the two PS3 specific patches of the v1 series.

-Geoff

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-powerpc-2

for you to fetch changes up to 99e87549b17feca3494e9df6f4def04a9ec7c042:

  powerpc/ps3: Refresh ps3_defconfig (2023-01-03 09:42:16 -0800)

----------------------------------------------------------------
Geoff Levand (2):
      powerpc/ps3: Change updateboltedpp panic to info
      powerpc/ps3: Refresh ps3_defconfig

 arch/powerpc/configs/ps3_defconfig | 39 +++++++++++++++++---------------------
 arch/powerpc/platforms/ps3/htab.c  |  2 +-
 2 files changed, 18 insertions(+), 23 deletions(-)

-- 
2.34.1

