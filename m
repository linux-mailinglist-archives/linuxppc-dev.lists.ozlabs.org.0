Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF388D72EE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 02:44:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3k1v3Dq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsJ6D37q7z3cF1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 10:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3k1v3Dq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsJ5V0BvCz3cB2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2024 10:44:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00515609FB;
	Sun,  2 Jun 2024 00:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E328C116B1;
	Sun,  2 Jun 2024 00:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717289050;
	bh=mGw2Qsp3atamupAl7mGgIPYLQzWf1Cg+vKAzx6wkWUs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=s3k1v3Dq7rYnijxd61hoaHVOtLswxGCzBhz4h1MWen46cZbM+WXm8MKTkyH9W1LFM
	 QgXTI/pMeGG6Htm5g5oyTpL0k8/G9rIgYS9hAoUQgCV2BvhC7tro6JlSJF0SIgcxWC
	 mCcj8fspLW6nowFP9VZ3WpzvxyXqFznh62OGEyOkj0LIjBLPD947K813x1/Z1COLCb
	 BKvyWiZ17ZacWRp0vLqDNUiMd4QdYENufBvEGjE/dhZ8v9Nl4fysYkt+H2M4KdAxAC
	 nUo3CXur+dK+A3SgZvcrmVP1Ji6+sX19a2F9HZF5M+B28r2GzuUvGUnLQcq5LNnUCn
	 ky932K4JIULGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94715C4361B;
	Sun,  2 Jun 2024 00:44:10 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jzj82p3m.fsf@mail.lhotse>
References: <87jzj82p3m.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87jzj82p3m.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-2
X-PR-Tracked-Commit-Id: be2fc65d66e0406cc9d39d40becaecdf4ee765f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83814698cf48ce3aadc5d88a3f577f04482ff92a
Message-Id: <171728905060.19494.12879025475093263825.pr-tracker-bot@kernel.org>
Date: Sun, 02 Jun 2024 00:44:10 +0000
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
Cc: nathanl@linux.ibm.com, puranjay@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, samuel.holland@sifive.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 02 Jun 2024 09:57:33 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/83814698cf48ce3aadc5d88a3f577f04482ff92a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
