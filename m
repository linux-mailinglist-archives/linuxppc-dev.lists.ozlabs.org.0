Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A106A47A21A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 21:35:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHDx74H7Pz308J
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 07:35:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TR/Si2il;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TR/Si2il; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHDwP6NM7z2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 07:34:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20601B80DA4;
 Sun, 19 Dec 2021 20:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C926FC36AE7;
 Sun, 19 Dec 2021 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639946063;
 bh=x2folR660B/9ul6aa2ZFzNxTYts0I7yy9MM5FTDiNsw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=TR/Si2ilvN0DqV+t0cx7PKaZp6169ZxYclTTOxNJ9jDF/7WPz2rhjINe1a51NGs/l
 wMt2/yKTXpxCivU15pFsc/+8L9hu6gGsxPthijMClQLzfJ6Rlagc9MgoQfT0EFhEnd
 MTUun5iSP/xJCAQthc/gtUwBaIC54GbsUQQlU2pkd9G5PWLJMhhwMUhIn0vmKogAQd
 uqTY6RClRFMWA3YRz643ijkzHUiPOnbzn2OtxE4sowM1PvLS/iiX48VRUnoqwD8TYi
 FC1qqNUhM/17nlCptH4vRnbOoIZTlaU10mDCcusA3TuqwSgBL7/I0eY7YLVVt+euGI
 2Ct2vOkx/s6aA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A6CEF60A27;
 Sun, 19 Dec 2021 20:34:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.16-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lf0hl06g.fsf@mpe.ellerman.id.au>
References: <87lf0hl06g.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87lf0hl06g.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.16-4
X-PR-Tracked-Commit-Id: 8734b41b3efe0fc6082c1937b0e88556c396dc96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 713ab911f2cd5ef00b5072aacd84bd93a444ae12
Message-Id: <163994606362.11038.11036779168389391211.pr-tracker-bot@kernel.org>
Date: Sun, 19 Dec 2021 20:34:23 +0000
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
Cc: nixiaoming@huawei.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 19 Dec 2021 14:53:59 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.16-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/713ab911f2cd5ef00b5072aacd84bd93a444ae12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
