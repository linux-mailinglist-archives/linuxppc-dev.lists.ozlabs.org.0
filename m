Return-Path: <linuxppc-dev+bounces-4495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDBB9FD779
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 20:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKb3P0DXDz2yDT;
	Sat, 28 Dec 2024 06:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735327328;
	cv=none; b=Jm6R2mb2vXeSIgZC9ZQFYRF58U6hNMB8TCVAhdksFD6bAx2Gmz28YJf2+dhvshqeawPYBYnDHXCsOyM6fjSiL4i8QZnAEqyNoxZFYz69Z/O5MLFYhQmLY2rvGURpkHJzcznU+zBvgD5YoTCAPrxSiBrC9fzAfEIcg4rahSqUhliKJggnR9foqbS80AktsolRQ48pITgeBW9yJ6HLAgI99lXDEYzS9c7ulPqns2ok8iOb4DYPRjlXyHM4OSY+ut/g6vCOoR1sg24OE3r9sO1pF3pZfawkgUVw/6iODw1cjzUVvgawUB0vaPkgFC7sCLWZJYIhrcu6Gr+a5uQiczlJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735327328; c=relaxed/relaxed;
	bh=LwFZ0EzbR5mXpwLnnq7V9GnyzO80DY7t4oAGN3RZaBA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AOrcsPwIHvrFNZR06np8lia+OD0kkfk8k8yWsbXh+tJFb2p/RWluB4clXmE48BcI8g5xpOry2JH+/m/KOP81oH/2jbB4i5dhR1+qBS9ScAep2WOPNXbl32PBJR6Im8aHUjBEUbe2/7k9JGc3V0379oOKGUFNgrQHWrx7edfOnI1t6uXDAjcaPEek6fbTkFOBNsdgjnmGLrvpdo6Aw/PPjv1DHDwT6VFx49ik63a6wkPlpyinp86KiP/wMXt7rpjOscS1PFg9Jbb+6SW48hWzL4OOT3ICwtmgZZ4dJr3Lfo65mug52GkYIjBNU77li3EoAp7OBWF7EsHC6DWKJ9vYDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YQ30C27A; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YQ30C27A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKb3M2W0Tz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 06:22:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 725395C5A49;
	Fri, 27 Dec 2024 19:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0E2C4CED0;
	Fri, 27 Dec 2024 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735327322;
	bh=uOFnp+xbV8RnU23eBTinmjNL8zZqpb9mEZkWXt3B06E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YQ30C27A79ehuM9AicaGMI3feNLJjEF9e7gWTrj9V0UxlURfTRK73bZ9PJrDN5rET
	 fsnblepqAs95Xr58gt73WrRZcKVuPjJTB/74nLcK5es47wi3P5vqrCJUzpbcR+GBDM
	 1HiAAgNIbTXgvVQvpEr/syD2eQ0NUFa1oJWJ70dBC0MREcygRl9ZFp/DRMP/7RrxYh
	 XqcR5TCiz8VvBmo2P/xtxx4Ps8XtYFN4VHLfjJ7gKIGx03BI7bYFK6vJ2pzceWoz5N
	 HBaCVkKq0auxUPszxU3+Y9CRA0ygrLqdMfiVEnnGG0uA1uX/oRMbYZZGvJoztB6J3C
	 hPgTtYuacr6rg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34682380A955;
	Fri, 27 Dec 2024 19:22:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.13-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <abe4d3bb-549a-4e29-9084-e579b81694ff@linux.ibm.com>
References: <abe4d3bb-549a-4e29-9084-e579b81694ff@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <abe4d3bb-549a-4e29-9084-e579b81694ff@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-3
X-PR-Tracked-Commit-Id: 05aa156e156ef3168e7ab8a68721945196495c17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eff4f6758360986fa913c2f17b4960645f4f4b1c
Message-Id: <173532734173.574555.16105942693209458363.pr-tracker-bot@kernel.org>
Date: Fri, 27 Dec 2024 19:22:21 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, haren@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The pull request you sent on Fri, 27 Dec 2024 12:24:58 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eff4f6758360986fa913c2f17b4960645f4f4b1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

