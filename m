Return-Path: <linuxppc-dev+bounces-8949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3663AC44E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 23:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5q501T1fz2xRq;
	Tue, 27 May 2025 07:43:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748295796;
	cv=none; b=CnqhH+SqIpPFVq1IlwyGG1I8WmZpn2me5IqLBBhkgmMY8mFXYJuoemXpp3FkalUjoT0yO7gDL27FfaF/CKQFSPL7XKPE/J1qnajqX/+s1cgAL4kQhLJYpaq/HLuyhzm9Hju9hyv6mEhJSwyhNMTwANqI7owdn8RJBIw0F0WlcbXQyQr8qbiyTEK6rnvX8RxKqAnv0kJHop/2q3S7GwO8dvqH0teG5+Rs5Ag+fGCsQE5YWtkKtX4Ezd/3Ls3GLeBYQ11N0dfzjUXtox5TAatuPaUhrbXOeH1uUBWfBv4s2a21wCJnvCOpf/wOcec1nv8EWlt85+IgAnXHelYQs/kwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748295796; c=relaxed/relaxed;
	bh=zZ3CAq6S7p5YHqzyckdm6iySA91mfd5piZ4bM79qsK4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=N9VPZzBaSKT8YkJjL/RDWVpJhDzx1F3cU0aqNzao+m9yH04NcYCjm85O1QLjv2j/3Ym+YKEAL6BHQ7vRQE/4D9Y4xxdyMn9ld/WefjSd88QgxrbNycDLGDivhRWHT82Vag1W8hAOEaJ2h9W+Nv2cpVFzlDADWoawgKuZdp5QwawX+JgrTQ0ZMT2/c5dEGso4vv23fx6QQwFe9bb3rxMlj3hxl2eOjIM81iHLxpaAcNDoyPKjlK6ERrWExqvlCSfxdmqXyy4ABz6sry+jOEe+ESgYemoO/u2XO5Mfbw7TOAb+GjlQwtNilKd55FRsb3xfcoYFofkcfaObJx2xzuX/qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cZsWplfe; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cZsWplfe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5q4z2yKXz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 07:43:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2501A4F59A;
	Mon, 26 May 2025 21:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408EEC4CEE7;
	Mon, 26 May 2025 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748295792;
	bh=+Ck4mPqAxlov3HBYiLojeENHAA4WBaXp1ioz84MyJUo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cZsWplfeOto4Sp0H4sajQY6etOSHG8iTDvsH8Kuq9xc0GZSoScQk/IRYezCPKbfKa
	 h27rIVcrIvuUg/uR/re916fK5MKUWZRJhc5LuN0pHFkao1M1U21ijvogFlDrohXVg4
	 YYoP1z5BkfcsnVnU0qKcBKH8dePVt/3acx0SsHeQiTUkW/FdCeR8hxvQlCeKMqjoaq
	 ZwpZhCL5+lFaakQJjYydkHxTkUEgOtu+BeELo6AsYHPse27f9maIimEAWcey/SydCE
	 pHjri9RBdCGeqMPNmSMUMEGpAiCb6Qh+eOOpqKst9mgj2Mj415pTdSlM+7qloWnMdd
	 e81RpNjGR7PGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1FA3805D8E;
	Mon, 26 May 2025 21:43:47 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
References: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-1
X-PR-Tracked-Commit-Id: 8682a5749a3d2b416b57709115c0351b50c8efcb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3349ada3cffdbe4579872a004360daa31938f683
Message-Id: <174829582655.1067115.5551098722471991963.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 21:43:46 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, amachhiw@linux.ibm.com, atrajeev@linux.ibm.com, bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu, eajames@linux.ibm.com, gautam@linux.ibm.com, gbatra@linux.ibm.com, haren@linux.ibm.com, hbathini@linux.ibm.com, jirislaby@kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, msuchanek@suse.de, naveen@kernel.org, sfr@canb.auug.org.au, sshegde@linux.ibm.com, thorsten.blum@linux.dev, vaibhav@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

The pull request you sent on Mon, 26 May 2025 07:35:53 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3349ada3cffdbe4579872a004360daa31938f683

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

