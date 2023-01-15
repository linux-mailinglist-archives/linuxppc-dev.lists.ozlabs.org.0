Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B566B142
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 14:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvwsH6W5sz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 00:26:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h4zBeHr6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h4zBeHr6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvwrN0Yvpz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 00:25:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F6A160C64;
	Sun, 15 Jan 2023 13:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 023A3C433D2;
	Sun, 15 Jan 2023 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673789120;
	bh=9l/syxlBiOpbdy+hFDWVt7VQ/bqMhJOapl0FwuuRzDc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h4zBeHr6Oay0u6mKkNmi6aCKJOjfI/4gISwzVS5d/aaiEcTSiY6u0WvfwkUvoBTnO
	 bWLpEaJND1sIpmLFnguIyXyfZilOsBFecjMAxDo9v77wk9K6fKNPn7aXJKWAfsgtYs
	 fvtAwLgg1KUox+5berz2d0ZMP15ubRp7h/Dec9+NevsCwEd4Oe2GANPKKWs/r2jhE5
	 5NnskqRvRfULZm4P66N/7+fyJitN4/NCXYMY4hHNXqDfJ0ovPBGoT+FX/phAGUpNwt
	 72mcnZrjVH5OvOMaaDkq2EDLkhvNpefPsSmiudzhznHy3eltdO1Sgr9kGGzGx0QyRc
	 ldGzuKbUovqhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3BACC395C8;
	Sun, 15 Jan 2023 13:25:19 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pmbg9ic1.fsf@mpe.ellerman.id.au>
References: <87pmbg9ic1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pmbg9ic1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-3
X-PR-Tracked-Commit-Id: f12cd06109f47c2fb4b23a45ab55404c47ef7fae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1d63f0c777b6df1ab53c5597d5fc25753f52f07
Message-Id: <167378911992.21615.18026502937435227500.pr-tracker-bot@kernel.org>
Date: Sun, 15 Jan 2023 13:25:19 +0000
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
Cc: kjain@linux.ibm.com, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, ojaswin@linux.ibm.com, yangyingliang@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 15 Jan 2023 21:56:46 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1d63f0c777b6df1ab53c5597d5fc25753f52f07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
