Return-Path: <linuxppc-dev+bounces-10550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF513B19A20
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 04:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwKx23KVyz30Wn;
	Mon,  4 Aug 2025 12:18:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754273926;
	cv=none; b=mSiNT/YwURcXSj6xYeHuaCQOzgWX29Lts/MpmQjqqeY6xhGD5ZWH3Yql/U4ZXOVBptdUQ6WpSnbce3vxyfD/qibj8ONLL3Cqt8SPIYch9mZ856JgMp/sJuRw96W+csN64HS3KgqNG6Uy/F94C7ZNhRIvXrvu29QmLqwmF1wOiDpRmFPu0Y1I07KVOijwcZnIwx16j8qSCJBS4ah8v6Gw6rZGfWvKBICAGw8lHCqVDwLfQ6Fwm1ZqiWI/XVc2o+UHdp4OlA3fQxZzKEFUrSTBz7LauvSMe4EgCoPo0zj3e5w9nrksGWjYKjl/nYjiPWf2k/P5ZnIC7cwiYSXsL/lIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754273926; c=relaxed/relaxed;
	bh=fLEJGegW49KnZkE04w0c+c/r0lv8mutMoA5ypr7iKxo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Dpw0d5RftDGlltHkT0DRRaTTvWzNC8cgwMeoHsnplqycpc8DoOS1HczKuhozUUFJn5SXUh4jPbKQqW3Fojln0lve13Q4iaCvzlo0qw5ja//a8EyZFpuVquvKY/hCMYXfLkCdmTe3u9MXF/zblSvNW7ezDa18DBhn5MX7ctP0h696xgGdYwE/alAdg8wz7IOyJb/ucwpjM9Bm807bF+yupK49/p8XNWB12M7XTp5Q2N2rkLwiytKfEqPxhKB6ZAVxEiw06xHxFneGseFikmBieHAhGOJUVniLR3k92Hv390xgX3oK1HbeFXK7WArJ6P8gqxGNvG2IbY79DtP22IMtVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XjxTeM5O; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XjxTeM5O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwKx16Jtsz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 12:18:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C5B05C4A09;
	Mon,  4 Aug 2025 02:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69CBC4CEEB;
	Mon,  4 Aug 2025 02:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754273922;
	bh=xvrL03XVtT1uRfIlXkMCWbpAdmjMleDH3xLX7av3QpU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XjxTeM5OcdLsH5IEmpFyhdBjKNSRrCaQuGabbKvHPh0967vwvptKSr7w8HFsI2T+5
	 T5UVTvM0eP79vD2tdTq7+42fWRVts3DP1YySDv/6bBrysoy/EmBoWzOdehyw0jgsZ0
	 r1R1HUZj19DcxSk9Aox/tP3j1ara+O4szASrMFOiYxgUtiGIt97h2igSAY2QjfbbYu
	 cBjmxNmajmwVhpOnPlR6HSsDWkAXbKjNL2KP18liZFefk30LAbcz30dDEQ+kbQ9OB4
	 tyDaS8Wz4sDBPF3e5hxt4Gj0qO8BY/2OkBqpadpjYXKDbu5z1gkTw1x9hBKhedIwxn
	 5CTWQauBWQidQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71096383BF56;
	Mon,  4 Aug 2025 02:18:58 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.17-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <9c2b1303-bc28-41c3-b87b-e8640960fcd1@linux.ibm.com>
References: <9c2b1303-bc28-41c3-b87b-e8640960fcd1@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <9c2b1303-bc28-41c3-b87b-e8640960fcd1@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-2
X-PR-Tracked-Commit-Id: cf2a6de32cabbf84a889e24a9ee7c51dee4a1f70
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 806381e1a24c6eec2b431cbba2ba1b81e518fea8
Message-Id: <175427393711.614779.15118827673980406029.pr-tracker-bot@kernel.org>
Date: Mon, 04 Aug 2025 02:18:57 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, puranjay@kernel.org, tpearson@raptorengineering.com, vishistriker@gmail.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

The pull request you sent on Mon, 4 Aug 2025 07:15:29 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/806381e1a24c6eec2b431cbba2ba1b81e518fea8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

