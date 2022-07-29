Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99158550D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 20:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lvbng1gx3z2xGK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jul 2022 04:36:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FucbcQEn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FucbcQEn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lvbn227xFz2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jul 2022 04:35:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A2B061F6E;
	Fri, 29 Jul 2022 18:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5840AC433C1;
	Fri, 29 Jul 2022 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659119746;
	bh=OCUgqgq6oA5L1bujpOSEC1Yhdu7BQt0gqGMKaTa9wGY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FucbcQEnLccxIc6gHzhEimBOu/fM/tnvM0Jkm1DzWGqyo84zZlDjCEk7gH6eEt8bk
	 vNmjoywysvnPYFnGcEOuNGcQL7yAqgByUTQ2q/0t3yivo1yBodOX/mltQKZgHoacKh
	 PS6befycMDS+RWvExXN2UhOe0b69+4JMXJhxSE4YFbeBu9VH8ARi+10WMyQJquUf4K
	 RBdjUhHFzadu9IjPbayXmxkHXBXeG5H5ulXAifwYAM2FRlaZFmbGnEsSlDVkD/mDo2
	 DmyFz6ZeQ0c+P0OlOUAoYDPbpaZda8d2dqlgS+vbDi8wWdLDx3EaenMBU6xGorbfGw
	 TYGVaE8eXWtZw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46525C43142;
	Fri, 29 Jul 2022 18:35:46 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87mtcsaxs8.fsf@mpe.ellerman.id.au>
References: <87mtcsaxs8.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87mtcsaxs8.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://lore.kernel.org/amd-gfx/20220728203347.2019728-1-Rodrigo.Siqueira@amd.com/ cheers
X-PR-Tracked-Commit-Id: c653c591789b3acfa4bf6ae45d5af4f330e50a91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d928d9b78beec5d4b8afde9c144919b979685f2
Message-Id: <165911974628.994.14000085628404581425.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jul 2022 18:35:46 +0000
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
Cc: alexander.deucher@amd.com, dan@danny.cz, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 29 Jul 2022 22:49:59 +1000:

> https://lore.kernel.org/amd-gfx/20220728203347.2019728-1-Rodrigo.Siqueira@amd.com/ cheers

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d928d9b78beec5d4b8afde9c144919b979685f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
