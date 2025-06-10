Return-Path: <linuxppc-dev+bounces-9240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF6AD2DF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 08:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGf5811X3z2yVV;
	Tue, 10 Jun 2025 16:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749536940;
	cv=none; b=LMKpaW46ceQ01l3QOm8M17c7XsiMPaGswUKOwRDaW2OwFEqiaTUSEdl9JCmmzGuuiazi5sI4n68LtUAoCO8fSe8VEhm0xKwi38Io4MG6T20VjfYZp41iNogWTkqf4gHbveR8/nVu6cf9nlmST5B8QJm690j5E6Vy4oAnGpuJR/dZuUcxWoTdxKKhaJA3+I1dW3WOs0EnotGmaVkbnB/03fui3ZnR0A40+l57V4ZqClhtPWz0xzCA7izSBw+HFVhbfcHKkKMAKaAZhflKQjCf36BPstbu7HLCM3qhd7Fle2XOXSm1E2olfRMhy6qZHqbyEWTVf+Apmy+FxE2l1Izf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749536940; c=relaxed/relaxed;
	bh=Xylu81un638ry02QXDhtNSrSBHfL94/iRSFP0fF9Bbw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kEFk/VRI2uoJ6S0HNIG5YezZZdVMShNqjy8db3NmFheQPl6NXRGpf3W3xZzCHFnki8idAuqrP0554a+pHj1P7K2FaGJKbszQnc3x3jhfctQcLtLyrnCFdMmmt3AniFzhBI9npA0WWofrMQ8eWNTo6oocQ1bAdzKNEAkRm1O1qa5jl8lMw/lbV3+Yc3b1zZ0deWn4c2KuFdD9p35tYOTFhpeySFyDoW+MFInNuuDSWkudfucykKMfjmAX2ojif5UrtXb1ywduPbiQNyr//DDwAHFg9+8uVJzHUYlGMkpHbn4hnMfTbezqQUuYEVl8Gb2d6+K3mWChuMnNRKBf00v1mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WSUushRr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WSUushRr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGf573GbBz2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 16:28:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14FB55C4358;
	Tue, 10 Jun 2025 06:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED5DC4CEEF;
	Tue, 10 Jun 2025 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749536936;
	bh=/EpuYkmjtskZ1SRYdM+QAsUuTra1in9Lp0mt8pCKePY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WSUushRrk3/UCnITT9ryIjDExELTP2eeighKb0mw/g880fNjMg6u7U0l7dA0EB4Rv
	 w+MJ5IVHLN4u9ukf+jpJOSNybpnayqDggh0B2DzgGAakCC++KaKNIWixsOceeaHq+X
	 1eeWwLNDTssjXpocw9zWb6z64cWqlXNg0mHdQKzhOPL8FJj9NC2mmmKOjmivklCuah
	 hFnVo4c2xLjmIQXcodtzdmw3IyIqn52o1Tql9e2NST7laMyPbFkxDJfUe/qA7DHgQo
	 b4R6p3CGkwGhx/yLls21XsDKY8VkVI16qVolaJJHDc2rcaIdP79YsAIEJDBrLaadb6
	 i9a7GMy4v7Tkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CFA3822D49;
	Tue, 10 Jun 2025 06:29:28 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
References: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-2
X-PR-Tracked-Commit-Id: 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f09079bd04a924c72d555cd97942d5f8d7eca98c
Message-Id: <174953696673.2106657.9320314101659577753.pr-tracker-bot@kernel.org>
Date: Tue, 10 Jun 2025 06:29:26 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, haren@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ritesh.list@gmail.com, =?UTF-8?B?15nXldeg16rXnyDXkteo15nXoNeY15w=?= <yonatan02greental@gmail.com>
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

The pull request you sent on Tue, 10 Jun 2025 08:09:06 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f09079bd04a924c72d555cd97942d5f8d7eca98c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

