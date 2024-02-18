Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B88593C6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Feb 2024 02:05:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=geix2cuC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TcnXr1QMcz3dRc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Feb 2024 12:05:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=geix2cuC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TcnX35C8dz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Feb 2024 12:05:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 476E4CE08CB;
	Sun, 18 Feb 2024 01:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB2EC433F1;
	Sun, 18 Feb 2024 01:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708218304;
	bh=1zMeX2lPq2uHqO30zf3bV0zHNDk+kqy8XXaghomNDJk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=geix2cuCqSZ39+DQ451YYEMJmi1TZ1KTfkoP2e5cjnHgoQFCsScDvuje1oozrc37W
	 RvyWGNVWiz3X9xOax/GGsGTKZ6Q4f2WS1xUfGa7ckR7IJuAmmVbRoEZ06yeRT39nL5
	 Q7sVZXSwlrJWoMmKy3B95yeqBgM4xITgkCKql9ylUrBc/rgcDq2e41MRped9tDCCwH
	 cq2z0W6v+E1W46FsyytJ2qtPFciTy8259eOYfprVxd92UXVJCcDeUm1L/tXdaTrcMx
	 BLv3XOPShRidzGCAmuRIncvgocb5kaKJ74iBmEzMpOcKCVJy5Sgz9H8o6LJyP1WcI4
	 b6LY5upr45gNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67276DCB6DD;
	Sun, 18 Feb 2024 01:05:04 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87cysu1vap.fsf@mail.lhotse>
References: <87cysu1vap.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87cysu1vap.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-3
X-PR-Tracked-Commit-Id: 0846dd77c8349ec92ca0079c9c71d130f34cb192
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c02197fc9076e7d991c8f6adc11759c5ba52ddc6
Message-Id: <170821830441.19458.14910563235489562479.pr-tracker-bot@kernel.org>
Date: Sun, 18 Feb 2024 01:05:04 +0000
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
Cc: nathanl@linux.ibm.com, matthias.schiffer@ew.tq-group.com, sbhat@linux.ibm.com, arnd@arndb.de, rnsastry@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, xiaojiangfeng@huawei.com, naveen@kernel.org, gbatra@linux.ibm.com, sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, david.engraf@sysgo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 18 Feb 2024 11:16:14 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c02197fc9076e7d991c8f6adc11759c5ba52ddc6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
