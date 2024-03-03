Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674EE86F684
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 18:52:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LQ4Y8UY4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TnqCW0H1Hz3dy3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 04:52:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LQ4Y8UY4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TnqBp0MWmz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 04:51:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 919BFCE0A25;
	Sun,  3 Mar 2024 17:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD57AC433F1;
	Sun,  3 Mar 2024 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709488285;
	bh=2uvuRaWkLrGESmenV903LCAfTK3BJdqWUG1Xl119G38=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LQ4Y8UY4b7ZnofFGk+rti4u6IHB+psCXAxhez6UZ/Rg3e2d9loT5E74SfhEV2XrTb
	 UmcmY5s/L2tErZ150GkiL6c5ikNSBagLfRCa+v4KUqhjTJZmeU0kEj6qx20+4bF4qK
	 3mEF59MsI8shS27uIW1HtPsW8kPQq6+/z/3YT6GxbYyNY3STnptxr4J1+VvyLx8vGd
	 mmjBG9pGohNBRRyW5pTl9uDDh5PGD6BlW6civ3AivD169YxY7XaFpaStEH3jPCRI/z
	 JZGEZoW/R0muojR5Ax3mJnMOzSdNkKunCG/ioyJ9lssbE9yH+33MpmEpG1Xx31p+Aw
	 Q0fpY1HRpZ50g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8B36C39563;
	Sun,  3 Mar 2024 17:51:25 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <877cijfqk4.fsf@mail.lhotse>
References: <877cijfqk4.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <877cijfqk4.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-5
X-PR-Tracked-Commit-Id: 380cb2f4df78433f64847cbc655fad2650e4769c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4f79000952e819d58b1edf56466413e7081e6ed
Message-Id: <170948828568.18009.13363747961648679635.pr-tracker-bot@kernel.org>
Date: Sun, 03 Mar 2024 17:51:25 +0000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, gbatra@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 03 Mar 2024 23:27:55 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4f79000952e819d58b1edf56466413e7081e6ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
