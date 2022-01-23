Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6904972C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 16:55:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhd3l0vwXz3bc5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 02:54:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CkF2J3CN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CkF2J3CN; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhd334PLcz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 02:54:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C66C460F54;
 Sun, 23 Jan 2022 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38B9BC340E5;
 Sun, 23 Jan 2022 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642953259;
 bh=Th+PLbbNy5T4YFh+V4R6iFv998g+5yQmP8ZBiq7owbU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CkF2J3CN8xk4OUwz9+oklmU6n6uBUW8mOkrOxUZaGELZS5B2dbr9pq7RgVWsvAYmE
 yGnhzqGfDr4cFFvady3gVDyTPQF/RG/ul3iHScmeFoAqyVaXhFwRvN0OUq9S+XgTmg
 ogU5GhBWDkeLhkU4PDGsPna0WkMCPxvIv5KlyHfVaeD+QqJhqXqY5G5Zfq8wQaZDlG
 w2HacEv8YPUGOG0is3DH/a16b6IyLCxLKkxorgepwMt1P7gElJfCi7xhIgbHJPF3c0
 mxtPHqz2UfRnXTF07rlrAY5wS4lMcmMEWexQmi3NKb9zw0+e/3/8IlZl5dvLq9Aqa6
 753sUkE4ruwzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 262CDF6079D; Sun, 23 Jan 2022 15:54:19 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <877daqu2bv.fsf@mpe.ellerman.id.au>
References: <877daqu2bv.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <877daqu2bv.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.17-2
X-PR-Tracked-Commit-Id: aee101d7b95a03078945681dd7f7ea5e4a1e7686
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
Message-Id: <164295325914.31951.8078413507540454113.pr-tracker-bot@kernel.org>
Date: Sun, 23 Jan 2022 15:54:19 +0000
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
Cc: atrajeev@linux.vnet.ibm.com, daniel@iogearbox.net,
 johan.almbladh@anyfinetworks.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 23 Jan 2022 22:19:16 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
