Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537235AF26
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 19:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHhDH293sz3c17
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 03:03:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VxaenhPs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VxaenhPs; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHhCt0bXwz2yRR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 03:03:37 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 45550611AF;
 Sat, 10 Apr 2021 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618074212;
 bh=dtMAO0X4BeSs8Bei37ewMJMk5KOmk4jcKsKKZb1G9qg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=VxaenhPs1s+wwOgYpRr0veCmg5E0fiuMu8FWAntGQzfXbGlyVwf/K3qrtXv8ZUjI7
 lXaTUgfqS3QB88Wufi/xcIgaKcvbQGR3B5ihrQDq4eIh0jpGL20XTNh2RWJTEcAH6p
 3HZExzxqUM390+gKDpZcKh3/ssGo8rlYANP4j6Q+Cw7MHWKVASw3795swEm7tVmTTO
 RRFx09DKuXglVsyL5PpbB2hf7mQe9eDGOC+fbvIlDOaLwO5kHZ7aHOIU058tp/xZ3V
 mStSMrXtzcxAQFWwPoUcxygjbAkWehh/edQLk0L57szpR38K2oplbwuVrdOPVgYd0X
 5WehuuVvbPA9Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3FE8060192;
 Sat, 10 Apr 2021 17:03:32 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <871rbidwt6.fsf@mpe.ellerman.id.au>
References: <871rbidwt6.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <871rbidwt6.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.12-6
X-PR-Tracked-Commit-Id: 791f9e36599d94af5a76d3f74d04e16326761aae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95c7b07551879c8ad4d6dca10c02de46ddbf55a8
Message-Id: <161807421225.30985.5791691520680055342.pr-tracker-bot@kernel.org>
Date: Sat, 10 Apr 2021 17:03:32 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 11 Apr 2021 00:43:49 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95c7b07551879c8ad4d6dca10c02de46ddbf55a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
