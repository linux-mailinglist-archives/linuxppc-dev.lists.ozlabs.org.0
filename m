Return-Path: <linuxppc-dev+bounces-11490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF2B3C0F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 18:39:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD3rh0gMbz2yqm;
	Sat, 30 Aug 2025 02:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756485572;
	cv=none; b=oxfN0HyvtHNJVgBYerA+1ywILSF9wbmvXQRO5Owf/v2Cgk6YTyHibzB969hZ/thh/qxhLNytsaP9EyT6Nv2BGZIjRyuZvcO7JDHtVl6aXVPsZ3lMviq7gJmwymMxqQTOX1UtvSGr7kd0WAMfRjAsSaku8M2ugmNzbW8aUf25C9HSdmpTyB+pkYO0lH5Dmfn2EEjdUONfD8hLmbBo5VIK5KbmeqHNIk44lePzva9aLsY9CC6bWwwFc0gQA0c+rWOHcjrjdXpF7PNzStdSv/vgdD9eKqwhUvQ1zQdmnHngSKRCFY/03dyLRtNipS1QKRmPdcmrcNChfwR3uicQHD1Tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756485572; c=relaxed/relaxed;
	bh=wpY6wJXyT6aVqLU1F8J05AUv6MJAo6YS+EOGoakGwZE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Kp1S3nhtQQmYXbg8oKuObW1tug01ixGOpaQsi5dj4o1oINjkzF2jU3eDaB7kyCreGWmCpFwAU2GK96cZ+SwfHn6hxq+qtNZWaXNFob8lYpD4YutGXJWjY/k8Eaim8d0K5ZiRgYlWoVbj+UADPY0esJclbdcm3TDjR0libbByBzPPgzLj1rlMAtQDiWRk2UWYQqqEv6VDiK4x9xxS4L5redRCFrpdf9oUIne9qR0cqEZH1GDdadXcZV7z5bkw6gyM7Ox1s9SdTz1dwWgmDY0ToEwCpRZSpT2VNACCtIhLoVW1D+RELf33bexwGeD8qXAij/z4AS7bJWWnKoCA0+2K2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nobW7LeH; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nobW7LeH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD3rg2GgYz2yqc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 02:39:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAC5345666;
	Fri, 29 Aug 2025 16:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B339DC4CEFF;
	Fri, 29 Aug 2025 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485568;
	bh=CpsfS6K6okXUJQ3tecVBkbM/x6ZvzSIUHJiJyXzorDw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nobW7LeH6ETDrAHZtoy6Dvm7gMsSb0GGZly4y6gHrgpZNmlIb6w8fwO8bvR3f7NzT
	 I+GAqGUrk4LUuAQiKnny41mvsGpnau3dRSI0MbG1x6WtiRr8N53EaHlVGiiXhIvOJ4
	 cUKM/lH9ULEJO5pJJ/iYxjjRcH4Q5dL7Sen4gdnFR4jJYKnXrguH2G1LwkNOURA9Lz
	 HTw+aLu/irv5+5foBTr6im0cBky+mNGGx1dOrarZgmWD3mksqkhWl2zVWgLScuz6QV
	 0USJA2z9/6NRYb27uYNdayN4Fh8PU6hZLO7gPs7owhJc959BJQZU/Ei1Ki3ZpoqchP
	 DQl5bluWUkFaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6B5383BF75;
	Fri, 29 Aug 2025 16:39:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.17-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <832d6a3f-40b2-4e81-86a0-99d6ad73f1a3@linux.ibm.com>
References: <832d6a3f-40b2-4e81-86a0-99d6ad73f1a3@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <832d6a3f-40b2-4e81-86a0-99d6ad73f1a3@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-3
X-PR-Tracked-Commit-Id: 8763d2257f5231cfdfd8a53594647927dbf8bb06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 606c2cf67b6b8421ec40769f03d8b30759df27c2
Message-Id: <175648557528.2275621.9941916824294659088.pr-tracker-bot@kernel.org>
Date: Fri, 29 Aug 2025 16:39:35 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ajd@linux.ibm.com, gautam@linux.ibm.com, jirislaby@kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, zhao.xichao@vivo.com, Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

The pull request you sent on Thu, 28 Aug 2025 10:58:49 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/606c2cf67b6b8421ec40769f03d8b30759df27c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

