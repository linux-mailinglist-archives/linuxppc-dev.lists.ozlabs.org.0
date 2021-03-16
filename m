Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CEF33DB6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:52:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0LTX10Hbz3bnK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 04:52:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=nHI0P9Xt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=nHI0P9Xt; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0LSK2sX6z30CD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 04:51:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vzYJFOzEb1NIe97QoacZwsNCoaEoErPswDtLLsJodoE=; b=nHI0P9XtVczaiwy5Rpf4wbFsUy
 1c3Y/vCblIOOo0gditrYx11ZTLAeRvbG7/5zKWQcD3h8YGyRo1Gvsmq8KCP7Th4dfXTQ1r+KUlTvg
 2YLbujuecTxQK6FkD+e9Ln7HAseuf8XnCUE714I2s0g8AwPb4+UH4evBRC+6IKR2+1NhzX2VJb98s
 NhCsmWu3xifM6xAAcAz3EkABmnqfdsOAK89ZHAuac0JY8Av2FOhQR7r817dRMLcYjjMxCNpPPfU8W
 U+ODpB3W/bx9hECVIfydELMm2zrXYlBkvfg7KPLQgWzvdWsfWCLX9k7sM7W5ssilmCI5CewhciB1P
 cAbi4Cmg==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lMDqU-001UqU-L3; Tue, 16 Mar 2021 17:51:06 +0000
Message-Id: <cover.1615916650.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Mon, 15 Mar 2021 19:14:10 -0700
Subject: [PATCH v1 0/2] PS3 Updates
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 16 Mar 2021 17:51:06 +0000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Here are two minor updates for PS3.  The first exports the firmware version to
the proc FS, and the second re-aligns the DTB to save a little space in the
PS3's limited flash memory.

-Geoff

The following changes since commit f40ddce88593482919761f74910f42f4b84c004b:

  Linux 5.11 (2021-02-14 14:32:24 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-powerpc

for you to fetch changes up to 7bee1153671a3ec71775246887894eefbfcb4b25:

  powerpc/ps3: Re-align DTB in image (2021-03-13 18:43:16 -0800)

----------------------------------------------------------------
Geoff Levand (2):
      powerpc/ps3: Add firmware version to proc
      powerpc/ps3: Re-align DTB in image

 arch/powerpc/boot/zImage.ps3.lds.S |  2 +-
 arch/powerpc/platforms/ps3/setup.c | 62 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 4 deletions(-)

-- 
2.25.1

