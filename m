Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0134341B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 19:46:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3RRF0RXyz3036
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 05:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pSr0qUpZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pSr0qUpZ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3RQq0mP0z2xgM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 05:45:38 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id B20E361864;
 Sun, 21 Mar 2021 18:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616352334;
 bh=/LwBtPO5SLlIJqsl8MyuuR6Aue+2+sp7ix/8wqWC1Xk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pSr0qUpZHlxviGit/W1p+PISR4/HRcCle9QLF5Ci8IjHYMRiwEJNe6AOZZPoVYiHc
 qUOWUWw+uG3t/Gwh1XfY7TEVWN4Icj/8hqw/2N09a4fee0M9EnvqBreMNsK97aKKSs
 adL/d580yx5uysERw11iw+ZuCk7qUSFubtLjn/nLi2DIJ4r1Wvu3G8HMTIVvOShonF
 DigTDxQAHSLsT4CfUh9GgRg+gRBdS6YDbelCPYPsCapeV7MuiAoJqGoiEplk9xaBZ5
 Clof3mUZCHOc9C4cqzY0Tepxm0D0s7dPbl6RvjfP1XwFBqL7h3bBHTfa7BjZxmark4
 fBpcTfSa9jRSQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A787160A0B;
 Sun, 21 Mar 2021 18:45:34 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <875z1lhytk.fsf@mpe.ellerman.id.au>
References: <875z1lhytk.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <875z1lhytk.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.12-4
X-PR-Tracked-Commit-Id: cc7a0bb058b85ea03db87169c60c7cfdd5d34678
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b35660a7cebdf438e01bba05075ae2bcc0125650
Message-Id: <161635233462.28302.16755864100835344002.pr-tracker-bot@kernel.org>
Date: Sun, 21 Mar 2021 18:45:34 +0000
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
Cc: tyreld@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 21 Mar 2021 16:15:35 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b35660a7cebdf438e01bba05075ae2bcc0125650

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
