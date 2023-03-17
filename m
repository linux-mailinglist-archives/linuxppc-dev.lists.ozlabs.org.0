Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B56BEFE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 18:39:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdWbb25Yyz3f4X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 04:39:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFNDvXlU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFNDvXlU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdWZh6DTJz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 04:38:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9235860E03;
	Fri, 17 Mar 2023 17:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06754C433EF;
	Fri, 17 Mar 2023 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679074729;
	bh=/GK69WOmeFghWy5LWrJHJwnxaWh9cZwuMfkbrUepWxw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kFNDvXlU5VtbHAfyLcWMmu+jmc8mJdnKFszhLncZZIXSyxHvXaTmFKP3DU3J/HSkb
	 LeMfyy9PJ0WUE5Mt3OlVYjZCR03Ggo1pBqL9nmqtTftIwo9tlAlQtkkRkxMkatYvZG
	 jghOY3hGjRKf2pDLh8/ZUUKOiqefMWi3bouhNZJbsbYx/fFfO8iv2LO7WbzvZO2PZt
	 Gt1pBTOtAsivYBaXXldWmlz3JvHGps2Glbm7DCJAQ2D0MZT0V+shLjvkAHpE2YTXjQ
	 nhoQ6VQ3HgulMKWFjLWDqs3Cw4ZBLM8y5XJd0G9oqqvFqmud9gb1xjpIuDPiJPZp8u
	 jgaOsZJOS60gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA26BE66CBF;
	Fri, 17 Mar 2023 17:38:48 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87cz58m54s.fsf@mpe.ellerman.id.au>
References: <87cz58m54s.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87cz58m54s.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-3
X-PR-Tracked-Commit-Id: f2c7e3562b4c4f1699acc1538ebf3e75f5cced35
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 17adaeaed05b879964b1a72e4db87ebf3b2a38ba
Message-Id: <167907472895.9394.3576308926534908749.pr-tracker-bot@kernel.org>
Date: Fri, 17 Mar 2023 17:38:48 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 17 Mar 2023 14:24:51 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/17adaeaed05b879964b1a72e4db87ebf3b2a38ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
