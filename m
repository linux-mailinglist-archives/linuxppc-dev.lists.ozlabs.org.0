Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F91721723
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 14:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYxf20MRcz3f0P
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 22:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OGCdCMDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OGCdCMDJ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYxd82w7Pz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 22:58:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18D8160CEC;
	Sun,  4 Jun 2023 12:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D71DC433D2;
	Sun,  4 Jun 2023 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685883528;
	bh=wZP56eCt8tUe4WOQ92fVMWrOVCz0JXlpUlcK7Utb43I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OGCdCMDJL2pcZfe2WaWCpA6j0em0fs0eALBy+FqsKSMbh1RXpBdpDdyAaAy/RlTEC
	 Ui36z+arOqiBFhnyWsdxTZBRSo7FUOgVGR5+4M+FMPhObeEdS1fw49AvRNHMqmUL1Z
	 LSNrDNbhnnGZDxjj4pWvJx0Vg/32+S/7X3+/8NCR2tktsLmxdbvkD5tBjPyBj0vIli
	 NId/Pf61RwKea/5agD8ECHIhFD4pzptU2948Lu3Vkis385SxWCPrrsqI6422fNP00h
	 5pIc2Y8qJTno090zYU8Hz6m7NWuVpuX1E9XH29bIpBk7ofdKGrR31MTr+H4EjFQo1R
	 nV54iTC0aN57g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59B91E29F3F;
	Sun,  4 Jun 2023 12:58:48 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87cz2cgj7b.fsf@mail.lhotse>
References: <87cz2cgj7b.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87cz2cgj7b.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-4
X-PR-Tracked-Commit-Id: 719dfd5925e186e09a2a6f23016936ac436f3d78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9455b4b6db1e9b11d242595cc968332ecdd3cc91
Message-Id: <168588352834.18655.15577335638635726575.pr-tracker-bot@kernel.org>
Date: Sun, 04 Jun 2023 12:58:48 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: maninder1.s@samsung.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, gbatra@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 04 Jun 2023 10:33:12 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9455b4b6db1e9b11d242595cc968332ecdd3cc91

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
