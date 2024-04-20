Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C4B8ABCC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 20:33:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vGI+6IyC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VMKs71wMXz3dGr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Apr 2024 04:33:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vGI+6IyC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VMKrR3fr9z3btl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Apr 2024 04:32:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A11B360B8C;
	Sat, 20 Apr 2024 18:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 501B1C113CE;
	Sat, 20 Apr 2024 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713637970;
	bh=FL1XUzzfr7XOft6TDAyAyqAcmbRITFTq5WPp9HlS73E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=vGI+6IyCx2Mh+2yDZmbrBvMgsH9Wi6x1FhCt7Ydq++c+qYlUpnFU8lhCKqOL/xZC7
	 TrZARRPfJrNqQdlcNA1+zo/NevWEc9+8WMsbzdvRIu5T3cjspzqpAHiOLC/vhNcO/G
	 9oTrX6E6N3ZtXNZz7tU4ZxqiIWqcGcDkImHR/mkD2hb2r1dlZj8jaratBwgh5+/ifB
	 Iyulr2M+iqjQg3nwfhfZuAvUY1Icfk6hn+7GHOtpJi34y9jEih3vPTm1jmH+KVSfeo
	 gynCqEZxzSqegUa3g9KOuoMtvdZ6rSYSzmREMWBcs0j6xaXINaCDX6mmtaXAgxo9DO
	 gRAuQUQhwCWJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 485F7C433E9;
	Sat, 20 Apr 2024 18:32:50 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jzksaf7x.fsf@mail.lhotse>
References: <87jzksaf7x.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87jzksaf7x.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-3
X-PR-Tracked-Commit-Id: 210cfef579260ed6c3b700e7baeae51a5e183f43
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e43afae4a335ac0bf54c7a8f23ed65dd55449649
Message-Id: <171363797029.22086.8963090920006760925.pr-tracker-bot@kernel.org>
Date: Sat, 20 Apr 2024 18:32:50 +0000
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
Cc: nathanl@linux.ibm.com, herbert@gondor.apana.org.au, sbhat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, msuchanek@suse.de, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 20 Apr 2024 13:24:34 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e43afae4a335ac0bf54c7a8f23ed65dd55449649

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
