Return-Path: <linuxppc-dev+bounces-6279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DBA38B68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 19:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxWlY34g9z30Lt;
	Tue, 18 Feb 2025 05:44:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739817849;
	cv=none; b=h5PvhkuYyZjo6iYLzLzVgbkD45k1f0XWZxLzEyBHat7Y0eOm1EBE3oBD9FE9qUJ9x+bflv/BBY+GpJ7nbDGpluNQXzpqTK3nkA12SxKajRz5Qprnj/JuTxmBcNC16jBWSWpes1uLo6421P/sSbzUa9s41WzSAQ02hftTz2aF+qtoGhK1+gL7zDU+iK4miwC8DPl2dE9Ok1+mkL3n/SMy1pkInBaaROaHVO2iulZ8iq8bz8iiC8abEtijqdkFTbypx3y/6OjqIllr6Y1JHL/E7QVFQvCAiWbUDKPgOZcaPoYbA4C27+TU4DMQMRiawZ+VcSudoxgyQIu7FBnrjfAq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739817849; c=relaxed/relaxed;
	bh=IA1QjAXNHFplXg7TW1xpDtEk6dhaArWVx3VID0I6rNw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ogCF85gL6Qm2LDOZ79PJGDVe2yIqpd9jf0pZNlgp6+91bmrslpGsGJsGS/RgeZosTWu0pmSitAvagjIBTPcQ2xIPJtZutfzYSeOAnHEfrKu5Px4WyyRHnW4NsdHMurJZC1QxPU6shtSfhBFZgP4xCN6oQ+3QAtt258vQj0bBi5JCQnbmwxwgiYajZNy1a44AzTfQ4g9ApHYJG09/VH09sDD2nsrn7WDsBQUHTYSp+bmM+QxMEwFrL3p1fTHsVU6WjbgaUY7093ksBK6cIn6WASBEfG81rtcGvEofmiAs4vTw52Ei3h5d/+CBqS+2sCoNeqHqtm2Kmbd4s5BKEvadWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KFthJztF; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KFthJztF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxWlX3F1yz3028
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 05:44:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AC0B5C1191;
	Mon, 17 Feb 2025 18:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570FCC4CED1;
	Mon, 17 Feb 2025 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739817845;
	bh=dV93L79L/EJzP+RF+w+k3xJqs1D4NxYiFfOC+ntR1lQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KFthJztFOonyf+7cJTSBqJ4kLkQ0nwXNiWa1gOYgGT+StO18jK5k+0UuuBuWllbwR
	 lLmwMC1/+12VMdA0LZLrqNXMHKrJfiOPjpzPF2NjqfXQsYqWdWzlAOUwBsQL0aowMG
	 uYMIwKOB26kEUWHFwBmuqucBFEbWTkk3IRDkVLqYcuciaSrgBbmOtjh38SCHomsp49
	 opyelrIIr9PbXNNzn/mIevCihve0jqyTDW4Vw0R+REALzqGCCETTAqNCg4j4a368e7
	 9Q8n7TpKi89X3JmcIeulOLok8lFJWr6PhVdCv6MLgmSoYuKlpsl7Ai69WQv9TcSR+E
	 yMgbj3l/VSDnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE691380AAD5;
	Mon, 17 Feb 2025 18:44:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <69e279d8-55f1-4196-b208-27487bb70dd4@linux.ibm.com>
References: <69e279d8-55f1-4196-b208-27487bb70dd4@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <69e279d8-55f1-4196-b208-27487bb70dd4@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-3
X-PR-Tracked-Commit-Id: d262a192d38e527faa5984629aabda2e0d1c4f54
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6186bdd120eccf4ca44fcba8967fc59ea50b11b8
Message-Id: <173981787519.3511401.2200436694018059876.pr-tracker-bot@kernel.org>
Date: Mon, 17 Feb 2025 18:44:35 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
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

The pull request you sent on Mon, 17 Feb 2025 15:40:00 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6186bdd120eccf4ca44fcba8967fc59ea50b11b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

