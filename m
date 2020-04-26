Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 522921B92C2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 20:17:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499GNW5L83zDqVj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 04:17:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=PZ/f65Qq; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499GKg52b8zDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 04:15:19 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587924916;
 bh=N4sMstSWT1pnoIGbSoHzjmWbGKpjxPmNuYD+kkM+7n0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=PZ/f65QqAgBzQAu6C3OFABx/60jxLHBW5aNQZBSeaG9+RuE/6EBw77Q+Fjcyjvd+a
 z8At0cb2+GNHTld2oLY4mwGQFknTcsNhPrWBA+ASYSvP03LsXqTSI6Ubi7+yXdmMtN
 ppSEneoKXVrjqzfqwwj2SPWK1HGBAzFlkz798+Mw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <877dy3gm2c.fsf@mpe.ellerman.id.au>
References: <877dy3gm2c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <877dy3gm2c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.7-3
X-PR-Tracked-Commit-Id: 5990cdee689c6885b27c6d969a3d58b09002b0bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 670bcd79b5237deaf1518cfc90d5058b52ea5ac8
Message-Id: <158792491683.6795.13638212252713244023.pr-tracker-bot@kernel.org>
Date: Sun, 26 Apr 2020 18:15:16 +0000
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
Cc: herbert@gondor.apana.org.au, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, chris.packham@alliedtelesis.co.nz,
 natechancellor@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 26 Apr 2020 09:52:43 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/670bcd79b5237deaf1518cfc90d5058b52ea5ac8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
