Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230856CAF6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 19:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgHQb6yhYz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 03:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GBSH83Je;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GBSH83Je;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgHPw40Hpz3blT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 03:36:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C170F60F85;
	Sat,  9 Jul 2022 17:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 296DAC341CA;
	Sat,  9 Jul 2022 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657388192;
	bh=t7RM+hJQ6Ow75XYYUUnmeFh1HF82X7msdQCZLLzLEGk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GBSH83JeYAImn1MC0qEYh+aE/hSBW9dWGkPfghdOBdOZ85+MALbWqgGCS79QvaTZA
	 EMf8ij+hvbOADfjtK0B+nfX6L3KAtsF5Ul68iLf3/x+f19GOYtFvCuhqvDg2uzDJ81
	 Dj1j3dLJ2TItYYDGUM5o0U0rErGH9wQUQhszS1PxFEcAeyUb1qhS3p3OZAUZgA1Oto
	 it6HSdwAKO4dvGR6QXtNzjeJvcDYJc8Vvw34L/t5t8RbRj7px/Kkvi2117ieJZ24Sf
	 2ohv0pulPSLP7h43TorxnGZvIBP3gG7wjyveGz69aGZzcB0dZ8F/83w09lhHbFXBR1
	 LtO8xNDUI4hHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1477FE45BD8;
	Sat,  9 Jul 2022 17:36:32 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ilo6a8do.fsf@mpe.ellerman.id.au>
References: <87ilo6a8do.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87ilo6a8do.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-5
X-PR-Tracked-Commit-Id: 887502826549caa7e4215fd9e628f48f14c0825a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d9cdc3b12525c85b4a2a8b6f3f8f61d9f467ab9a
Message-Id: <165738819206.13845.2520787400071273485.pr-tracker-bot@kernel.org>
Date: Sat, 09 Jul 2022 17:36:32 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 09 Jul 2022 20:27:31 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d9cdc3b12525c85b4a2a8b6f3f8f61d9f467ab9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
