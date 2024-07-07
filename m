Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D892964C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 03:38:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lb7Wb9qI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGqfT1y1mz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 11:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lb7Wb9qI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGqdn579Mz3cQL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 11:38:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08992CE0171;
	Sun,  7 Jul 2024 01:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EA67C2BD10;
	Sun,  7 Jul 2024 01:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720316296;
	bh=DO4mjBeSv+rHa+N2vYm3ADbLYG0pH0vMnK2UvRXIXOY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Lb7Wb9qIydSVlM7jLqmwxk3sYwvbGUXJoeXr397iHU55CQe3YSzXe27W4Z7zYke8c
	 AeRTQWlMEopXjrO5ca9OkoFR/K8gGOz3vQwCYpBRx5A7BP7MsRSeJ/tJ+KgTJ2r3vq
	 zbZ2957z2FU86BXnOeuurX5LhRzpbG0IFcq35pVGSYjYDj+DLru4B4ZVW/BacZgtZF
	 VWP34YYaunM8I2zpWnSD8fHHigpcKQhZFo41K3U6cC7/Z/PvZta4H1BpPjFlZaM9H6
	 wlwAhp/05nZYaFpaaecOO1N+OYHAiiH5eFh6lyGaFl/OJ3Usko3prrWIAwdT3MiBHI
	 4ht2DKVsa9KCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40985C43446;
	Sun,  7 Jul 2024 01:38:16 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wmly2j7x.fsf@mail.lhotse>
References: <87wmly2j7x.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87wmly2j7x.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-4
X-PR-Tracked-Commit-Id: 8b7f59de92ac65aa21c7d779274dbfa577ae2d2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6653f49e4fd3b0d52c12a1fc814d6c5b234ea15
Message-Id: <172031629625.31798.10712226152561786260.pr-tracker-bot@kernel.org>
Date: Sun, 07 Jul 2024 01:38:16 +0000
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
Cc: anjalik@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com, ganeshgr@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinglin.wen@shingroup.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 07 Jul 2024 09:28:50 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6653f49e4fd3b0d52c12a1fc814d6c5b234ea15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
