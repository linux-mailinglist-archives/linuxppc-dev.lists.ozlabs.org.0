Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA7781809
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 09:22:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ceM4/cnY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSVZ01KzFz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 17:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ceM4/cnY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSVY25FVKz2yVp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 17:21:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 784F761416;
	Sat, 19 Aug 2023 07:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5476C433C8;
	Sat, 19 Aug 2023 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692429695;
	bh=fO6Awv0XAKWVmavwgQYcmNUqSvzEtzxh1upBIq6bKj0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ceM4/cnYYzk1q/Eysp0fZMKrbgaKk43MnXbTktKwEDstbInqs9ggCDF5WrVUl0Vxw
	 Z02fqPGz54CKKmEbOPX8RVU1QKlRidt9V+WKAiRULBbW7PnBSQsjuVsXG7Kf+lIpts
	 epK8ZaWtgnKmwDZVqjs5UtGRrXVs/JnGyJCeHb4/Us9Dx930RlIOg1nUJ8C5PLz7ix
	 6b8+ULjXICIjcCU/o37nKf6EWNidH8qt2m/XsMTqPeu0Mbx7WGBdqJztSzm0ipVG+K
	 Nyu/5CjICiWSOXK2qiNrXqvDEoa1IWon6PGBnwk60Hl0eJI7Y1r4qCrWLUCbC1wMq7
	 DEQEasjA9/JSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C08C9C395DC;
	Sat, 19 Aug 2023 07:21:35 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87350fwnlc.fsf@mail.lhotse>
References: <87350fwnlc.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87350fwnlc.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-6
X-PR-Tracked-Commit-Id: 4f3175979e62de3b929bfa54a0db4b87d36257a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e7ffde6984a7fa842489be7055570e5f5a4f0b5
Message-Id: <169242969577.22117.12041012940890249874.pr-tracker-bot@kernel.org>
Date: Sat, 19 Aug 2023 07:21:35 +0000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 19 Aug 2023 16:30:39 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e7ffde6984a7fa842489be7055570e5f5a4f0b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
