Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674A68AE0F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 03:46:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8Yg05vlLz3f7L
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 13:46:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PKEMF13q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PKEMF13q;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8Yf24yy9z3bZV
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 13:45:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AED8AB80122;
	Sun,  5 Feb 2023 02:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62B1BC433EF;
	Sun,  5 Feb 2023 02:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675565109;
	bh=DhIbnJEYBJ9wICpJSXHDUB/XzKE2Qwka1sBouhxW6Ec=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PKEMF13qA2dgrqhwnRYeDaJ8YwsY84UO+7Axz71iO7c3LQAo2+ryUKlTbBI+veGQ+
	 LJZC22uUmT9tvr2WAPT+mvd0eIy0Zf9vouff1hiMsqS0O2VpJ4xqZ320zvmB6JGVwu
	 ZveHw0LNdvixrMZ29ADuKugJVInWDWgSEGP7bTbJGPQgS0q/UdPCVuoQT+s3J4IoUN
	 6fAtOWrkpY0quAWbPDj0ejSaX57WfgrRYYygiREYJU05UF/bh0y5qJhWKMhEkgn2AW
	 Bcuc/waTZe0Wq3yhQKLa7iVEJ404jDzAlfLN3ioyyjmHwDTZfX92MPe0qLeBvA0D8m
	 0Tz4rKb3Td/gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DB90E270C5;
	Sun,  5 Feb 2023 02:45:09 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y1pcewhq.fsf@mpe.ellerman.id.au>
References: <87y1pcewhq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y1pcewhq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-4
X-PR-Tracked-Commit-Id: 1665c027afb225882a5a0b014c45e84290b826c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 837c07cf68fec9cad455d5fc86aab5350cc06c53
Message-Id: <167556510929.8399.6294213822451226997.pr-tracker-bot@kernel.org>
Date: Sun, 05 Feb 2023 02:45:09 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, sv@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 05 Feb 2023 12:23:13 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/837c07cf68fec9cad455d5fc86aab5350cc06c53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
