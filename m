Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66FA4FAF77
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 19:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc02b56b7z3bk5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 03:53:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tD4a+IPI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tD4a+IPI; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc01s3XwVz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 03:52:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54168B80E4B;
 Sun, 10 Apr 2022 17:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22632C385A1;
 Sun, 10 Apr 2022 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649613147;
 bh=rj7JL4rBbavn4EW6mgbShPJ7NOA1xAZoZUayNVGFDik=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=tD4a+IPIB4xNFQml9IYe9SYi39+jLhiU1Q7+mv34M0cKLa1S+cxpNF6ObJgwy2qV6
 2EW0obeLHWxmY93SCnCv5+KQiFqqkiI6GLy33s5EGxErH7aJ4q35MZ60ahTq+T2h/z
 22BBggmH2b0ow96EWrFIw0XGpFQnVfiCKW/1n0wnBn67XDbc3iiK5UM0inRJTlwz0q
 eU9oMXfv+9iGrC3K2DgA4uaNfy/x6dLhKS49XszKKRLy7pK8mMrwvDiy0g1gb46ndX
 mx/QSJxOKLCaO9lfNlaHKwKLs1uEjTHSZcjkZID29+PekYvy5tDLDY2VDIMotzORIJ
 lnrKvQgqpHBZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0E7E5E8DD5D; Sun, 10 Apr 2022 17:52:27 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y20d5ay0.fsf@mpe.ellerman.id.au>
References: <87y20d5ay0.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87y20d5ay0.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.18-2
X-PR-Tracked-Commit-Id: 1ff5c8e8c835e8a81c0868e3050c76563dd56a2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ea3c6425269d33da53c79d539ce9554117cf4d4
Message-Id: <164961314705.10430.4232436589957126926.pr-tracker-bot@kernel.org>
Date: Sun, 10 Apr 2022 17:52:27 +0000
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
Cc: wangkefeng.wang@huawei.com, mhocko@suse.com, srikar@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>, osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 10 Apr 2022 23:23:35 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.18-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ea3c6425269d33da53c79d539ce9554117cf4d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
