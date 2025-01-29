Return-Path: <linuxppc-dev+bounces-5689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 151BAA224D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 21:00:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjtL96Mklz307C;
	Thu, 30 Jan 2025 07:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738180817;
	cv=none; b=LdmaLc/96cXjn7CwhEK4Gbcn8w6OviFmnVnvA79kPhiXvWo47OFkL9B68SQwJ7oZiCns5YV70Aqkf9On+KNVtC9FYiR0svgEqJ68e+i3qyIcoAgtZsXk91e3N2+EJ7dfRK7JK435ExSsziNMFqc3Qc3n/OsI71bQj7MGernx2UpS7XXv7qPaNDDOnl4O/KX8B8Rx4mcAjgbikHQE3Npad9McLmt1R2AXIx6U0f+qVGPb7wEyTZ9a9LAyaYdlXg5SfW0ITi+/ZYCOvN55RW2Fgv/YwC232An+bcR4XBc6h9neZGI0oYVCn0A5OJda0W/DrBMUgi0gvD0oCCvp2jnd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738180817; c=relaxed/relaxed;
	bh=Ow5vF7O6IhrtIvgW9wZjj/USmS9qik59EbtcKvp5cO0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Pc+abgt2WWYAgBlPVYnkO3YRU9j5xOF+6xmkD15e5mrhTDVjyUVCm+LKpUnKdHtAGGghvHZAlY57+JqqekisTmf1uARsD5xg0L7srQoYRhFIvR4Sg/aw+4uZica/1HHaU34621EzOFxC/mQkwuO0O6qBE/Zie+JKiHdF/TN5zNpD+k4n4csHka9l6omG0Da7c+UwEAgi6k+D7i0QfYfgzqwAuXTFswAM+IzYI0TnoMdiail+y8FvtuZDN/nykEhwysXu4LNKlF8UBWDBiWChoi/r7xlhiZJ8mUof5KjrqwhoJg60GhsW6z1GwRGAMzCizzj3GBJMSCik51yOn8zwug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iyX/XsSx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iyX/XsSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjtL90Dlhz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 07:00:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75D55A41BD9;
	Wed, 29 Jan 2025 19:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F530C4CEE7;
	Wed, 29 Jan 2025 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738180814;
	bh=Y9xOHmepnHKaNLHl5vxoRMlwDYXAT1Be7xFmIInfsTE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iyX/XsSxG4n12poWbo2tWmh/0DOca1wKhdZz4TbPScZRWs9w50WIUUeI19OZ01yHo
	 Gx3B1A2V9QcqlPvL4MKcJNyShDGbhLRnGNYvlCRTy+JKbR5X8eKLRPjNUGLwjpgiTB
	 7SYMWv/xL/4M4KyvCtWqYrI2Qdid2/ZoPlkr97MHWUB2sr/fVR67AaIi6BXkT/nIaD
	 v4kRoNda1A6aRQ9vWwuRv+0fgbtNFtQjJbKLQGLnadx6OvF8WZPPSGcsqlzbpRzm7Y
	 l5o7VODPMapQTGs6Pv0uoKi2bGKUzvOwPdnmYUPD/Ecox/21z46yGoUm00rstcOa3w
	 3EQahftyLqLGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 65A78380AA67;
	Wed, 29 Jan 2025 20:00:41 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
References: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-2
X-PR-Tracked-Commit-Id: 17391cb2613b82f8c405570fea605af3255ff8d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa5216a2b06594c558942d491cf71af76d34521e
Message-Id: <173818084007.411204.16541597794305494255.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 20:00:40 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, nnmlinux@linux.ibm.com, sbhat@linux.ibm.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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

The pull request you sent on Wed, 29 Jan 2025 19:06:18 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa5216a2b06594c558942d491cf71af76d34521e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

