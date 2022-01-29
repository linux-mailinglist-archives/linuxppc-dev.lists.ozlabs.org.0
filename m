Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0D4A2F8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 13:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmDkL1d5Lz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 23:52:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CzF4rdcC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CzF4rdcC; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmDjg2KR0z2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 23:51:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2128160C7C;
 Sat, 29 Jan 2022 12:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88673C340E8;
 Sat, 29 Jan 2022 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643460708;
 bh=jMZ9hXs6k3RbvSCC1+xZbzvsy6gCOmXhfn23ODqbWnA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CzF4rdcCkekU0jM4y2RMcEKA6gSv8B3CWXjF+7KjXhu3O7M3mV+jl95kmOl6Fo2y6
 P9S2MhcsMvLsdFXA67aC7eHfiFal13J2hrarNEuSSYSVR/FU7lksbgl88VphtG6Eff
 gUElJYBPNl9kChrI+Jfh5S5hYqnnzxVIZEOMhPR6/Zo339vu5oQsv8ALnfMhp+vVPD
 yuHVhwvg+VqQqUGm7Zgr4+WsYyDN340CTXO9HwFpJtr0DyhGj7ZvJLToGN/Te5s5kw
 PctjdzDxnlBf5SBePDNeOxoyvZkFwzpnQ9HRe6aCbUo2mWQizwrGAyg91ymVvfxLz9
 5L9CXNDI2lzxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 746E9E5D084; Sat, 29 Jan 2022 12:51:48 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <871r0qbtsz.fsf@mpe.ellerman.id.au>
References: <871r0qbtsz.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <871r0qbtsz.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.17-3
X-PR-Tracked-Commit-Id: 8defc2a5dd8f4c0cb19ecbaca8d3e89ab98524da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d66c1e79b9fcbfc6559ea3c5b1243d590fa04179
Message-Id: <164346070847.2828.16702382736239191449.pr-tracker-bot@kernel.org>
Date: Sat, 29 Jan 2022 12:51:48 +0000
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
Cc: atrajeev@linux.vnet.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 29 Jan 2022 23:38:52 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d66c1e79b9fcbfc6559ea3c5b1243d590fa04179

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
