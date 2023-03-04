Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6566AAC94
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 21:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTcf02Qc8z3bjY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 07:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUptYqtz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUptYqtz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTcd21dcvz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Mar 2023 07:58:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AF5F1B808CA;
	Sat,  4 Mar 2023 20:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69EF5C433EF;
	Sat,  4 Mar 2023 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677963503;
	bh=7aG//NL/0EV3TyUHShGdvjmKEswjWOeBJYkOyTNBuC4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NUptYqtztI6HqJnx8bAwJFnL+EB3Axb8KTjnH+y5y7ttd4DKYkjdyREiJ46/+3Jjy
	 pEiN58Z4njd818Grha9kWcNpJZqVTKNnYQ5G0sdUVoHADlSXwOG1uEl4pa9KyBtzxa
	 A0eSh8Ye92BwXqAmeD6HJOIkRlcBYl/8me97ig0uYlQhUCpMwB1lb0wHriSBboM707
	 gDQjbNcZrAeu1IAEOcCVAbH/N5p9Gh2WfhcYASNWliZVH7eqWb/imaCUk9PoF5BYDn
	 Mmsk3pPBkgNeMWxLG7Ol7I0HRL/p7TOlJUP4sEU2ph02vawrBmSBEwlmDF/pUwnyzA
	 awJQ5ZX+6UZgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 582A6E68D21;
	Sat,  4 Mar 2023 20:58:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v8jg1zta.fsf@mpe.ellerman.id.au>
References: <87v8jg1zta.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87v8jg1zta.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-2
X-PR-Tracked-Commit-Id: f8b2336f15f3bc30e37ce5c052cde5b6319bb6df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c29214bc89169f735657f614bde7c0fad74bd1b5
Message-Id: <167796350335.24622.5745677179033135252.pr-tracker-bot@kernel.org>
Date: Sat, 04 Mar 2023 20:58:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 04 Mar 2023 23:11:29 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c29214bc89169f735657f614bde7c0fad74bd1b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
