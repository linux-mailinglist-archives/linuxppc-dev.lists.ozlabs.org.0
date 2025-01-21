Return-Path: <linuxppc-dev+bounces-5435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37393A17712
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 06:43:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycbj51RnFz2yRD;
	Tue, 21 Jan 2025 16:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737438201;
	cv=none; b=Ua+2IVHgXhlei+S/DOUvgKBGjRUy1N2RX16qXFjZ+DxSCUSmfkuPns7FtE9ehqqSEjdeRBsbZ4bFlej1j8uA2gMS3R9GfZ462Gkfrmvelr8MRsPpbyvogkTFOW0Ys8tVpZ1BwUTuFm1ZJyf9PudO0KaBvs0lJCDn7UgxvOAzWnvRoAZhns/S5YDH0pq5mcWYrRQls/px5U3LqElNh7fYjBBE4B4WIo38eLQZIdDrcCs1kU5iQucorVZhdkY94yaS0O4Dch+ZIZiHTtppGwJHyV/dU0p/6emwoPYU6hK4NHbDfrf7PgIcITwvdg+e7reb2gf/X7a52EH33WxmzkpBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737438201; c=relaxed/relaxed;
	bh=15qWj84safoASlY3L4tiqsaFDURw02+Rn+MguZvaECg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aOFY4yMZIA0JCcbQIFQfVj/71RB2G4D/So4HY5Um6U5WWiPMRJ+MJL3AXUVasUI2981EgA/25GxIWf1xMgyKDI9B/IuDU/rC5KYXUNvSHm7vXf6f+2QBu8/UbnE8TsEfriqvCcVGgJ5f7e8DdWjp5rVw/Ys8sMUH0WrmbOnB2emjqvZILUsyX+lR6YP6xtGu9XPKRtxja3Jw7JDFhWDtCFOPQn6AMWjmX+hwFfpwCxoelgh/ezBfzxiJ1QJX+bBistxhoVfBN0dpu0Bblr96TygTKRaRhIL2g+7UjaQEcDQjvzOxDMpiniORWGBZQBSbxKVs6jsN5M0Fs5ur2q2kpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBxtBc/u; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBxtBc/u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycbj441LRz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 16:43:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 232E5A40CA4;
	Tue, 21 Jan 2025 05:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D41AC4CEDF;
	Tue, 21 Jan 2025 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737438197;
	bh=rYGIbnJMbqe2R+q1TeETLP8j2VExhiAJMFPF1KpXlNM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hBxtBc/uiJRuLGbylTAsRBVeraGd6NSVeWvcFElQkE68//Z+msRNJvEYK3Su1TlAJ
	 UYRKTlz1epzOy+SBDNA1xYtSkDetHcD+WtPO6MbELCVC+YRqjDTERiIZfU7G8o8yM/
	 q9H+TSEAsrpehheNYG6hyV5qvXSlntXySfwGYImjuFKQcVXB4yb+r0lnqUg9jfaYP4
	 9MCKcVnM3iUW3EbKtHlGgydbShnE4kaRHdmQp4QN6Aag9oL9YtarkH1TngDUWHpMVE
	 rp3fOJZx1jinkgqc+z7tqeFIQPqZeHxDn5ooPKC0o19WtInLI0ns/2ld/J7TmIAHUV
	 c/whSuccjxdXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE9F380AA62;
	Tue, 21 Jan 2025 05:43:42 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <f16ef6fe-c9ca-42eb-8388-cbcc5ad1261c@linux.ibm.com>
References: <f16ef6fe-c9ca-42eb-8388-cbcc5ad1261c@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f16ef6fe-c9ca-42eb-8388-cbcc5ad1261c@linux.ibm.com>
X-PR-Tracked-Remote: https://lore.kernel.org/all/20250109104611.2491cc3b@canb.auug.org.au/ Thanks
X-PR-Tracked-Commit-Id: 2bf66e66d2e6feece6175ec09ec590a0a8563bdd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
Message-Id: <173743822136.3752834.4555573270713320418.pr-tracker-bot@kernel.org>
Date: Tue, 21 Jan 2025 05:43:41 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ajd@linux.ibm.com, andriy.shevchenko@linux.intel.com, christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com, gbatra@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, luis.hernandez093@gmail.com, sourabhjain@linux.ibm.com, sshegde@linux.ibm.com, thorsten.blum@linux.dev, zhujun2@cmss.chinamobile.com, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>
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

The pull request you sent on Tue, 21 Jan 2025 10:21:42 +0530:

> https://lore.kernel.org/all/20250109104611.2491cc3b@canb.auug.org.au/ Thanks

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

