Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5FA115943
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 23:17:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V6QW1nttzDqjR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 09:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="rf2L6mw7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V6NG6YlkzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 09:15:26 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575670524;
 bh=E8ISvmds41DFWEjClhfOxnciAGgZDAjp4K1H2UbEols=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=rf2L6mw7FLlNaKq5N1xuCKjmW8VP1MW4H7ArcU21isRzTCbpKccrot9Hi3jDj5my1
 dwPgoDt9fS7Tz1CefW7K9wC29Xo6HEK9Eo6qyg60CSUxztkumgNyZliJ8uhZSTtOGw
 LqpRWryhtnRvAtLYp+UJggG7a8CliBlQa0Fsk+K0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <878snpei4i.fsf@mpe.ellerman.id.au>
References: <878snpei4i.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <878snpei4i.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.5-3
X-PR-Tracked-Commit-Id: 249fad734a25889a4f23ed014d43634af6798063
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f89d416a8676fe36de8be0f7c2e1ac6cd51410a8
Message-Id: <157567052459.8833.17428102493710399717.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2019 22:15:24 +0000
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
Cc: maddy@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 anju@linux.vnet.ibm.com, clg@kaod.org, skhan@linuxfoundation.org,
 vincenzo.frascino@arm.com, Linus Torvalds <torvalds@linux-foundation.org>,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 06 Dec 2019 23:46:53 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f89d416a8676fe36de8be0f7c2e1ac6cd51410a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
