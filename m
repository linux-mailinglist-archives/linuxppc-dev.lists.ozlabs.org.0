Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FD7D20A8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 03:53:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MmXAzx1s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SChD972sSz3cVK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 12:52:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MmXAzx1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SChCF6KPhz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 12:52:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31019CE19F7;
	Sun, 22 Oct 2023 01:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6219CC433CA;
	Sun, 22 Oct 2023 01:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697939525;
	bh=Ow5j75APyrHCFc4i5S6/sPasuIIK/e2/tkSldYoVSjA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MmXAzx1shqHWx/JMc5S2ZdSFxxn+xrglysUOErxLu6Ywbg+TYkX3cje0wM3RoKbqb
	 E22gOrBdbrg7Lt9PedeKAIpD8yBxChYy0EfC5xfKo7gEVIuAsbUi2CtQDn9EEAUAfM
	 cLAi0GiJABT8xix0a0RJvPDGmo9mOKWA8wbE2JbmPOQ6iMxZtMft1lcvTDo+aPrUZe
	 /R8O3iyzNDQZqcHVlsBHQifb5pYqRg/jClTvgYIEZ1z4uUK4PzSRxXEMMQJr2CxOMK
	 UzFTCt/vZSesSDd0Fek5V5UoMr0JRmwCKSVcn6jLsD5z8xakpZsE+ZtJrLx8Da16DB
	 lqM05ZT+xRSyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5090FC04DD9;
	Sun, 22 Oct 2023 01:52:05 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y1fv4er5.fsf@mail.lhotse>
References: <87y1fv4er5.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87y1fv4er5.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-5
X-PR-Tracked-Commit-Id: f9bc9bbe8afdf83412728f0b464979a72a3b9ec2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1acfd2bd3f0d9dc34ea1871a445c554220945d9f
Message-Id: <169793952532.9872.1513283742626010407.pr-tracker-bot@kernel.org>
Date: Sun, 22 Oct 2023 01:52:05 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 22 Oct 2023 12:39:26 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1acfd2bd3f0d9dc34ea1871a445c554220945d9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
