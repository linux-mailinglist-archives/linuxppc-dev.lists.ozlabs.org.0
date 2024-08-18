Return-Path: <linuxppc-dev+bounces-159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D10955AC3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2024 06:24:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDmBO2v3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmjKw2f1xz2xTR;
	Sun, 18 Aug 2024 14:24:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDmBO2v3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WmgB638jPz2xQF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2024 12:47:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1683BCE028E;
	Sun, 18 Aug 2024 02:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235F7C116B1;
	Sun, 18 Aug 2024 02:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723949241;
	bh=jLTUGh268GyPRXzru3Ic+w9Nl3CoqBEkyfUJNj3PR64=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HDmBO2v3IupITa3sfqS7FKiJLMamgc+4u86tytbEqqeUhxmdV+xZS/zMOk3+mY/6b
	 3Dcy0YT0DtnDnzus9jlVpzxCDPpCyQOlb7qWEXMp/2F7h+WYbmmSU855i93IGENqn6
	 KuoO/+BZ/cETW98C34LwnuNEdXFRpchwciw2HnUqtKO/Sdx6jPydTJE/hk4BXu5YTP
	 7XDvOvblA3T2fiR2J6PfVoC4TnBUwcWPqO1i8OFtJgFkwcYgsNXOj5bPV+LsnFvS0Y
	 L1dvC3kCKSGFWEj6x5aIJhizHUyxi6zP4lFFaPmVXrNyTZmtJ0LcXYeBkFgnc3STSg
	 QWTAVLRrP1THw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE32F38231F8;
	Sun, 18 Aug 2024 02:47:21 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r0ampuio.fsf@mail.lhotse>
References: <87r0ampuio.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87r0ampuio.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-2
X-PR-Tracked-Commit-Id: 227bbaabe64b6f9cd98aa051454c1d4a194a8c6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 810996a36309a56a39b406d9ad2903115714228f
Message-Id: <172394924028.3858125.12681191271050391175.pr-tracker-bot@kernel.org>
Date: Sun, 18 Aug 2024 02:47:20 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux@treblig.org, linuxppc-dev@lists.ozlabs.org, nysal@linux.ibm.com, Thomas Gleixner <tglx@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Sun, 18 Aug 2024 10:03:11 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/810996a36309a56a39b406d9ad2903115714228f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

