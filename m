Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 033AC937EE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 06:07:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u1Ky+EPc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQtKF4qGLz3cZ0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 14:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u1Ky+EPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQtJY5GgWz30T6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 14:06:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6058E619C4;
	Sat, 20 Jul 2024 04:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08EEEC4AF0C;
	Sat, 20 Jul 2024 04:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721448375;
	bh=dePqgPJklE6B+tcqbhCdwhuy7pE8RF7XDTTIGqN3qTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=u1Ky+EPcWmMYIT5gwoOalj1K4PtX/DDl1NNG3sAcM04Ng/on1srPnoIG1QmqFwnhK
	 laW9jD3JgqcBeKOGeogC9BAOvRTAkr5h7nrrfdmirPtfuO5cn7zpYs6EHwrPbPkKkD
	 qCadDU3YcRbfqwpDWcz4sQzl2iY3sVR1bz4YeYaKbS+EHla6ajh7vIbwNr8Vx6093G
	 MAB7imCmd+Szp3tAvvEJvAKj8tlJ2UX484/nS8UUshMpQPZK70/BP1enO8v8mYDQcU
	 xTd7uVwaVub51bGM2EbhCn9eRTEMmTj7pe0w/sya9l8gysx6WAinQ9330ptXOHWDl+
	 3q+JPX6+13I3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDBA7C43335;
	Sat, 20 Jul 2024 04:06:14 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h6clwnc1.fsf@mail.lhotse>
References: <87h6clwnc1.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87h6clwnc1.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-1
X-PR-Tracked-Commit-Id: 9ff0251b2eb54d17fbe4f6aff50f6edfd837adb6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c3ff7be9729959699eb6cbc7fd7303566d74069
Message-Id: <172144837495.29552.14084356407244348768.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 04:06:14 +0000
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
Cc: sbhat@linux.ibm.com, anjalik@linux.ibm.com, coelacanthushex@gmail.com, robh@kernel.org, gautam@linux.ibm.com, nilay@linux.ibm.com, haren@linux.ibm.com, christophe.leroy@csgroup.eu, nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>, krishnak@linux.ibm.com, nathanl@linux.ibm.com, naveen@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, hbathini@linux.ibm.com, quic_jjohnson@quicinc.com, asavkov@redhat.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, gbatra@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, esben@geanix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 19 Jul 2024 22:58:06 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c3ff7be9729959699eb6cbc7fd7303566d74069

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
