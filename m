Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 518625FF3FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 21:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpx0T1YQsz3drv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 06:14:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwpLr+eS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwpLr+eS;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpwzW0cqZz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 06:13:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C1080CE26FD;
	Fri, 14 Oct 2022 19:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EDF3C433C1;
	Fri, 14 Oct 2022 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665774831;
	bh=TW4YgGyH9D58uUe4taBb5NTFujkXWmsL1Srh1A10XAs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OwpLr+eSS3mEslOE/Mytn+wOjXt2mhIDQ6/odhJHACu9FTYCIw+X99EZptHdIqlva
	 FYYQ5qMikdIpLvIda2qCO7Viu9M1RvEejp2BuhC1i17h5C+Z2UwhHQWYhLEH7y/0Sk
	 6X4RUPC4NBusWwElxHZ4D0e+jVSbWxTTaHiFkYOhp3lOndbLftmAIhoUkBko40zR/x
	 jfndxJsS6I8i+EXI1sSfuSjbfEaDyco8WqV1lPY/zdL2nfvIB5lMwolds4xKCEbpPm
	 Tp0v/1LoEVRMsQhcy2e2ORXwPq/hGJuGcwzhinSpTDOVP2BcukcvbaM1R8ytd3BMC/
	 SL8SPlZPOorpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28C1AE270EF;
	Fri, 14 Oct 2022 19:13:51 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <874jw6my2x.fsf@mpe.ellerman.id.au>
References: <874jw6my2x.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <874jw6my2x.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-2
X-PR-Tracked-Commit-Id: 90d5ce82e143b42b2fdfb95401a89f86b71cedb7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70609c1495ae64e6534d8db7d6280dd7c79de815
Message-Id: <166577483116.24477.15005630930379569241.pr-tracker-bot@kernel.org>
Date: Fri, 14 Oct 2022 19:13:51 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 14 Oct 2022 22:41:42 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70609c1495ae64e6534d8db7d6280dd7c79de815

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
