Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076C3304DC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 22:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtvmW6qWnz3cbv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 08:31:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q9jvHPvB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q9jvHPvB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dtvm42HTGz30M9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 08:31:00 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id E9D2365163;
 Sun,  7 Mar 2021 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615152656;
 bh=3NQ9rbSMP8zQpj/w+nKbXH8f2I6ye2W7V+xTPIvcmzE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Q9jvHPvBldYG2snDcydXf19DN20NV+U0YjfNoQq0G8CGzOiyygalbrC7GJCFCrK0p
 41iwd8TLj9iyftjKMZslLrGyd9erXubUaTezoHDxPWW/ncio/KwRxIvBx3RrbNKGDx
 d7ZrW05ChYxRS5n0zWCYOO70WjwjB7gPXzHpQicvTkrRkz2O8lKRFpYyHC3Fn/aujX
 /wC9Of4BzYNOT2CRh7A2ewBTMfwskxDqLPl0R/hnSU4sNvRhe7ZG7ZwsKUlhzeclgP
 TVBD+OYs+Y4VDsAL+GH+tAqGOuHNaMYUhz3+swpSh12/Q/OuuJ9EJthIPYUculdnBY
 MYFVARh6665kg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E37B6609DB;
 Sun,  7 Mar 2021 21:30:55 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87mtvfqn03.fsf@mpe.ellerman.id.au>
References: <87mtvfqn03.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87mtvfqn03.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.12-2
X-PR-Tracked-Commit-Id: 5c88a17e15795226b56d83f579cbb9b7a4864f79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fbda7904302499dd7ffc073a3c84eb7c9275db0a
Message-Id: <161515265592.2708.9563446741138400613.pr-tracker-bot@kernel.org>
Date: Sun, 07 Mar 2021 21:30:55 +0000
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
Cc: feng.tang@intel.com, atrajeev@linux.vnet.ibm.com, uwe@kleine-koenig.org,
 peterz@infradead.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, groug@kaod.org, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, ljp@linux.ibm.com, jniethe5@gmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 07 Mar 2021 21:25:16 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fbda7904302499dd7ffc073a3c84eb7c9275db0a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
