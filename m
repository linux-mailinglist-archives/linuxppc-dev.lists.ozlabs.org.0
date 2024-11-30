Return-Path: <linuxppc-dev+bounces-3619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8499DEDFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2024 02:20:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0XL45ptsz2yMF;
	Sat, 30 Nov 2024 12:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732929644;
	cv=none; b=GE2RdQM8uQ7kxYHtd2q5t5WNH0QrPUM+kdGj0zlR5BxW3nhiNcshjzGuzIxewAgypOJEKDAOJbo+14OFgJTfpu1So1VwJ3ioMBPYLPhxxHlGl3+Xxl0whmBrQ189g2PTRLk8W3OGwwzqautjh+Kiu/E+GuedR4wLxqv8m5yWyQkGUFxKaplK8Gh1KchFefI5lfMOWNALqXJykGP2Legx0Z7Rz8zrD0ewayDTCSoIkiSSw1TWuULAhELWS6hvqFkAeu0pFfCAJTnL/LxNTD31YyXX+RwRlRwbVzJ5BOb2P+ZDRyfjk1JfyRyNipJdBmtpFwG5mEy0YF/avLX8YVroIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732929644; c=relaxed/relaxed;
	bh=vPFuPtnFftXZwz4vWw00MD1rzOvknsn66Plic+cSgFw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=d43N3wBbcxWNoFS5yfZ5IeSz7FORbJs6jXCqQP4dM5NO2AFHhAaN1o5zrAGpj8pJkryHPNGh9BnGaZ+jF7UpktroWmvMOt5XHJrqUSiIUDoArnU7tyNQsE4q81xhTMQAOsMkBT+C55vrGlSFz3XP66RxNw9YSo1Heh4596FdLnQrJQzWFr66S/aA1ICEBFlFx2MR5wJ2i6Aw8u30TJ+PeVFrbWGonRaqtQj5QaR61EHgoH1m+XdBLQo68F20oSNvKDelU5VjTRhH73zZIlYsijCwuiV6KIGwftBEqeJ0br5SQWv4RuJVaezfZG+qqYhNQud85aE8YUxAgsqWjuN11w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N+PRZ18E; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N+PRZ18E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0XL35lJQz2y71
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 12:20:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7F6A5C337C;
	Sat, 30 Nov 2024 01:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D55FC4CECF;
	Sat, 30 Nov 2024 01:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732929640;
	bh=ON6GKp1lr+sWntY4xxqUbiXewL4yIj79OBVvD1kqhR0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N+PRZ18EPz+fD5aw3a35QrmHvex5YXPUPIO1FQluHnFbVztaSF6dxg4kF61iGaYSf
	 h6Qc4P3nZydDmCO75y8H10IXxRUqAS8OKFUDE+WqtjXg+DqXX94HGG91ppMg6WMvP4
	 6QSA56yyhY2+aEpEWApEEA3q/qM+ItG9D8AsN5DMtWnfMSnqZtR0siW6rrZgd9ocCX
	 gVeCBZqrLYDfn57lZQtkIkOKAA9+r1J1kNsEmoNLr3SKxcvgIG4K1RGKL/P0XO8GSX
	 p/WkMnhgfiusAIAzHZGTIp0GaTT4Zj9mCIiPoIu/1IOuYm94RYcGcDDBRMV4J0+Mpd
	 M0t+1zo+RpISg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFCCB380A944;
	Sat, 30 Nov 2024 01:20:54 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.13-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <47937a7e-5303-4372-9975-df4ab545a3d3@linux.ibm.com>
References: <47937a7e-5303-4372-9975-df4ab545a3d3@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <47937a7e-5303-4372-9975-df4ab545a3d3@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-2
X-PR-Tracked-Commit-Id: cf89c9434af122f28a3552e6f9cc5158c33ce50a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f15167014a15324f1439ea5ca375468e23c77633
Message-Id: <173292965344.2234000.5363125444999432431.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2024 01:20:53 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, yang.lee@linux.alibaba.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen@kernel.org
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The pull request you sent on Sat, 30 Nov 2024 06:40:18 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f15167014a15324f1439ea5ca375468e23c77633

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

