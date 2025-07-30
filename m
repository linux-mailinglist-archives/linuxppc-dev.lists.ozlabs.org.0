Return-Path: <linuxppc-dev+bounces-10446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF938B157DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 05:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsHy66F61z2yKw;
	Wed, 30 Jul 2025 13:39:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753846750;
	cv=none; b=hCzsUmJQwRz/QDlbxDrexZL5BLTcsAzYvkSElJcIyFkPmkwnN+a6p4jK64FIVscIiaWvBDlelHvHwEI67oFb2YjX2+O9wfmtaQUlhOUZhpB+bdezhcJuSOpWHsaz65C/3vWyoiR4PkhdimJMQeGhhWCjlOowVT2FLAYsy1bdDBiUYxVaGHH/s+BXLWG34UPWIi+HA/j/Mu5bbQE4XnqIt+jd82Fn5o87VZUps1V7hjodz273KoRGvPm1nkqOFOFY+Ev6epeifG/cfvJPoo9cX95G3iot+F5MUGQH3zP9m+fBeDqStAYYDqEvaflpwFr50uqUwqc1Cf8Umt3hg0wzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753846750; c=relaxed/relaxed;
	bh=4fr7TTwOh4VLYSZl9I1xlZwvUEKIkbeaxT6f1t7bHic=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=f1L7ONHwuy5ruiKUTqD2mBOrhC0w1OT3okzMtLpToFmM/yI7SMC6sLBO3A7bV0EbBdjlP91OeIuwYmo7Frgb4Mi3iQE/ILWyae8jKFju17UVoqmMWbWeJvUr8p/O3BOsjkneHHt/lCTFf+fPy5IBeb1bAObZ15pkXxwC+m43qTFpLqPUEo0JOPcS0ZhNBvjruVs31My7D/438ddyegMfTX1mlNJ6cSQqWPPXPK4cbZoZElm3b+aWjb3jtFrNQ4ZRcEFMnssnExYt0xrUMfkZT51xud4kUDDteVZj4T7N4r9XKZLTZ/YrjMMSPDJIgkt0TQ+pCBpJt0R68epaUjwbcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oNdEovXj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oNdEovXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsHy61vTBz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 13:39:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EFAF9A54D05;
	Wed, 30 Jul 2025 03:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5E7C4CEEB;
	Wed, 30 Jul 2025 03:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753846746;
	bh=wQKKUpA2/sjAPD4tKuYgbwFWtnRL2nW9PjAZAjBNGQI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oNdEovXjlvZMUU7QRzebNqnL5nl+E+HSoJZpFpEgZKuK8Y8HK5X9vm44MydgL9Ze2
	 pB6gSbqoai9trStRsGgSI3WA4l9TmeCkDLPO+JLlA9jfVi4g4UG/2vQkxQtq67AxlT
	 tFd8XCI03jDU8EpAyZMEPAedO3h2WPKTdregIVtNI1fu4Y1RpRZGTNXm0j0phabt/l
	 MPoXzWpEmRraFHpVxsJjN2teRN7ZWgfrVbMaF82lDWkwjMwkLpAozrzUt3AjWnVInt
	 RGnXW1YznSfZ7RN3tYJiuqyMKEjw/xKbq3YXnuozY+ewnPcepdZtZRvs/GXjX3fo4b
	 ZWkFXh7U8DFzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC8B2383BF5F;
	Wed, 30 Jul 2025 03:39:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.17-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <dc911086-ea2d-477f-8f07-7df19e37e61d@linux.ibm.com>
References: <dc911086-ea2d-477f-8f07-7df19e37e61d@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <dc911086-ea2d-477f-8f07-7df19e37e61d@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-1
X-PR-Tracked-Commit-Id: da30705c4621fc82d68483f114f5a395a5f472d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f5c9952b33cb4e8d25c70ef29f7a45cd26b6a9b
Message-Id: <175384676244.1749338.15980677472630181285.pr-tracker-bot@kernel.org>
Date: Wed, 30 Jul 2025 03:39:22 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ajd@linux.ibm.com, ankitchauhan2065@gmail.com, christophe.leroy@csgroup.eu, donettom@linux.ibm.com, fourier.thomas@gmail.com, gautam@linux.ibm.com, haren@linux.ibm.com, johan.korsnes@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, paulus@ozlabs.org, segher@kernel.crashing.org, sshegde@linux.ibm.com, ssrish@linux.ibm.com, thomas.weissschuh@linutronix.de, thuth@redhat.com, vineethr@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

The pull request you sent on Tue, 29 Jul 2025 08:18:45 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f5c9952b33cb4e8d25c70ef29f7a45cd26b6a9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

