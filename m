Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6B6124B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 19:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N06Cr6qFvz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 04:41:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cqd30bUl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cqd30bUl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N06Bs5Tsjz3bm6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 04:40:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A344160B68;
	Sat, 29 Oct 2022 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 102EBC433D6;
	Sat, 29 Oct 2022 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667065234;
	bh=lYagOyKb5yVvupfNOTAb95+iRFTKOiPV3Lgapdw5lzU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Cqd30bUl5fJMipLLzkuueHuX6ynDsDhdlSYgcfjUyOqb68lrTrq7Qk+C1rflsa1WS
	 2oFoDgHBGVnaI1b8BmTIdeAyA/Z4l3AOTtPWdY692KFs1QJ44UDFOp/2cMxZBghYb7
	 /XKr1BW2TRQs1QjH2m49N8f/itnfauHMiJwPvn1Y+hET29J9hHDURB512wtm2srWM1
	 kuisACz4ZUcrAGpUNOlFnnNw2daDMc5rOFU5yWaogvfgu8VpVr2Ft5G2LghwYqtXYW
	 Janq/BOyJAOc73RfStUmjPYY839hCVQ3h8VrYHnryXPiVw2ewecQ9xhAJjup8dUC4i
	 U/4ZJN+XIm/qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2B51C4166D;
	Sat, 29 Oct 2022 17:40:33 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zgdesy5y.fsf@mpe.ellerman.id.au>
References: <87zgdesy5y.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87zgdesy5y.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-3
X-PR-Tracked-Commit-Id: 65722736c3baf29e02e964a09e85c9ef71c48e8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91562cf99364dd29755988f3cc33ce9a46cd5b0a
Message-Id: <166706523398.17372.12855262120121557759.pr-tracker-bot@kernel.org>
Date: Sat, 29 Oct 2022 17:40:33 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com, haren@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 29 Oct 2022 21:48:41 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91562cf99364dd29755988f3cc33ce9a46cd5b0a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
