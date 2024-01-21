Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690883575E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 20:34:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1gJvvMO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJ3TJ0DGzz3c2V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 06:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1gJvvMO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJ3SQ3Lp8z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 06:33:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 55585CE03F5;
	Sun, 21 Jan 2024 19:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E619C433C7;
	Sun, 21 Jan 2024 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705865631;
	bh=JAcvexAQOm6zkXOa3WMMQlCf6u2vPqTfhHb8PUSao3s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=I1gJvvMOTynskAseAkPfz2P9q0EE3ScXkFBL/xETNfCGJc0dte/r1NRYM9tWzgZoU
	 OQCCmkoC4RiXBZHtige4LmM95UYopVJVUTWQGA/Lp/tmRUYzPVnSgbz1jG0SHZkkAM
	 BnDGtCiR6NxD9gjkIVLNuPf0f4Z+ieb9a9YYJLXPz31aQxvHNZM0i8SmYKOYGFc6N0
	 2gi76+ggdQK9/GQJFHmecoHa0+jDRp2b5hKxVIdV9NEG9wZdfnbuKIcLmwLKOia0AT
	 VBOss0EG0+x+rdgpdOJPYNhb2KP4kalvCZPsJchDgcXv6Dxxxn6gdpbpH+xx02K/Pn
	 QOU9s+m/r0WEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7D524D8C978;
	Sun, 21 Jan 2024 19:33:51 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <875xznql7c.fsf@kernel.org>
References: <875xznql7c.fsf@kernel.org>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <875xznql7c.fsf@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-2
X-PR-Tracked-Commit-Id: 18f14afe281648e31ed35c9ad2fcb724c4838ad9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b297a5cc9308b57c29635e00395f4005c9ba960
Message-Id: <170586563148.13428.17843378059290885207.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jan 2024 19:33:51 +0000
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Cc: aneesh.kumar@kernel.org, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 21 Jan 2024 11:31:11 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b297a5cc9308b57c29635e00395f4005c9ba960

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
