Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE9B5277E6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 15:49:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1NzT64SVz3byH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 23:49:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n94SvtOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n94SvtOd; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1Nyn3ptrz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 23:49:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9FB33B80D0F;
 Sun, 15 May 2022 13:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB8D3C36AE5;
 Sun, 15 May 2022 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652622539;
 bh=fG9BeCFoNbwLqE+fQhNYaL+vGmIzTk05Fb75VIOqjuo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=n94SvtOdtuGhs/6Q/LyIQRusJ6tqNo94AIHwDjHdPLxCqQeQbx4mwiKG1r7KKg/Am
 IX8Ab5xwEWuCWOuaXHa52oFYp3sbfVIOcuM8wM/J7lddVykvAbK8XaBWIvMnhW7ef2
 90X//tVj33PdSsQ/nU7+M7JD38VMPTs1elFI9sSd7Z9D/rXnrkhiNv4UCQ47fIwIVo
 vZSby0hcI4KFvvTpz5WrDfPx2P5avD7f72h+/3QiWcx57Ys8pa98ZgNvYtVn5iFjU1
 hL8gMCC+WHap8Zj8uz2Z2c/q65+nk/IjLukBjEPTMbK37yEdM0EZdED/b0R+QVZZqz
 iNoS1/kxvab8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D3A2CF03938; Sun, 15 May 2022 13:48:58 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ee0v6map.fsf@mpe.ellerman.id.au>
References: <87ee0v6map.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ee0v6map.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.18-5
X-PR-Tracked-Commit-Id: ee8348496c77e3737d0a6cda307a521f2cff954f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bc403203d65a874df2f3156046468052e4109cb0
Message-Id: <165262253886.32598.10680090511280783938.pr-tracker-bot@kernel.org>
Date: Sun, 15 May 2022 13:48:58 +0000
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
Cc: graf@amazon.com, linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 matt@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 15 May 2022 21:57:18 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.18-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bc403203d65a874df2f3156046468052e4109cb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
