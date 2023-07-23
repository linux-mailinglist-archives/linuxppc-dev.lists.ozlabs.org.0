Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BE375DFD1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jul 2023 06:01:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVslx0ST;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R7qNT4CsWz3c4d
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jul 2023 14:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVslx0ST;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R7qMX3cfTz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jul 2023 14:00:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0044A60C26;
	Sun, 23 Jul 2023 04:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E72C433C7;
	Sun, 23 Jul 2023 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690084835;
	bh=aOAhlx9e9NI1x1a3K57OexMdndgB8jGcH2RhMZmcONE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KVslx0STV7bc9HQt5vqJowF7FZdZo69To2IcolmYMKiA1UPlnCLv08IfoL7ZNkmot
	 3vb9ADvEVQ9OHkbFdBzHVCfxpZFY1Xuqs7QTuSPALONGHR7/AE+1D5e4jc1/oVKSUV
	 nAW//GlbADTYvtJP8Sp7E3fJxdkyMFo9YPLpBShlYwelxBtT1l7bU6KJXSB5etE6xV
	 5xX3pq6L0zsOiHAfS3zlKG0d0japqvoiyhHcTx62sDTgWiH+8KaQ87Q6a6fbMZG8W9
	 tJfl65O0BFD1wqXxuVmyTupGMuQZ6/PhXBCkLqYiaHT64dXT/xU1gl4JqtIHIxFXKY
	 tlXdFeVqyJoFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3F73DC595C2;
	Sun, 23 Jul 2023 04:00:35 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sf9fpg07.fsf@mail.lhotse>
References: <87sf9fpg07.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87sf9fpg07.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-4
X-PR-Tracked-Commit-Id: 106ea7ffd56b0f9454cd4f625474967f12ac4dbd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
Message-Id: <169008483525.25429.3303454837491361344.pr-tracker-bot@kernel.org>
Date: Sun, 23 Jul 2023 04:00:35 +0000
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
Cc: ajd@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ruscur@russell.cc, haren@linux.ibm.com, linux-kernel@vger.kernel.org, naveen@kernel.org, bgray@linux.ibm.com, u.kleine-koenig@pengutronix.de, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 23 Jul 2023 11:34:48 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2782531397f5cb19ca3f8f9c17727f1cdf5bee8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
