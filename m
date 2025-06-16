Return-Path: <linuxppc-dev+bounces-9410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA8ADB653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 18:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLZkj3bz0z30LS;
	Tue, 17 Jun 2025 02:11:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750090300;
	cv=none; b=BOrfCKs/EQu5Bmj8UlC9eGeWcj6DntWUeKa13PcF7cjXzkAcdZhMWB3kP2X23iQBPsFkeG7WcSF7OlCU98vDHMhcr7aYkKNqnE4NZScNRkXa4g5I6LBdLyAPufqlP8tqQz5WpNMUq5lkrKgICoq18ESS+ThBIgh+/zQeOvD+Zd22wTOomPgzGm2kwyVLlvtxD39jJ+aPKlmZ3CSbPo1KkkwU4X8MMiJZLAIUCUIo0W21OqEUnDHYKTtyWe9+jSK7DGfNKscEc0APvlJSwkPQPwCPBr3e+rLlpnPmEPPil0bTBaM+pm9Q7STZQ/AGIXEULwBMnATx5RJDmQF+I5PLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750090300; c=relaxed/relaxed;
	bh=Asyz6X+UVafO8TAvXqJM2H5EVD9/rpnOD+YC0DOzhwI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gqVN4Ih8W/w6+XSNKC1yWRWLXgEpZzBdA9UdnMtPCLBRPCUSP7GQn1vBtbwkS3KzcHIxPq4KqsEgWZxjpd3sTQ9HRKsNsOXbk1U85yGSgNdBDAEgHkvayCWqC/0dBAxBgzOWsuGX+M6wfL67E0X/aDT7howa4qeWKzFCQIQN0yoe73u/LKRA0cLit4Qj6x6ivNWv/Wr4c5nwHL7flxbVuKQ5K+qnodlTmVE90uL1Q8eLyH3fHN+PyzN7skqfUppCSFylvOTpF7P1IEitYP5Ykep+xwCReKcUDEkvAwo6r8BWrQVwm73FrDtlTxdbwrK5/cFzkklhdycz3eHnxxxlCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn1SyXZH; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn1SyXZH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLZkg73CHz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:11:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A52E6000A;
	Mon, 16 Jun 2025 16:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE97C4CEEA;
	Mon, 16 Jun 2025 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750090296;
	bh=/7XqCp0wWU6D/C9ZivcTOm30N0eSnHGP/ES+Waj0eNo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Fn1SyXZHZ0PHUiYAHonHhUkOt4mttbWXBEwp5wuqFBqsZMKAZW9/VEYfih7n1GsMN
	 PWjy2QfBITjRdrYht3Ny09lsbn0rv5yOL7IJI1+1IxRyQeeY6bgXuF1NzRtMyFHusS
	 Wu+MWzSpeJmTDg5MftXcdLKLfvw6yM/ysfqVOxBonLg6gOWhSw11/DZGASSnb9dacC
	 4VQqJ4flXAuyxr7CVWvJ8fJAYluTEq08M4FSIk5eJuIa5L23PzzgJOUuIMr4uBPdQe
	 IUWw1k4b8M9sw3B3uTDW2uw9UyiOXn3zm/6ZlJbb6V/lMAoux9DYGZ9twwf5DsI1eN
	 JzP7w9KgEaAYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FEB38111D8;
	Mon, 16 Jun 2025 16:12:06 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
References: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-3
X-PR-Tracked-Commit-Id: ab107276607af90b13a5994997e19b7b9731e251
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
Message-Id: <175009032488.2413506.5328344768668554411.pr-tracker-bot@kernel.org>
Date: Mon, 16 Jun 2025 16:12:04 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, j.ne@posteo.net, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nnmlinux@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

The pull request you sent on Mon, 16 Jun 2025 15:20:48 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44a5ab7a7958fbf190ae384b8ef252f23b840c1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

