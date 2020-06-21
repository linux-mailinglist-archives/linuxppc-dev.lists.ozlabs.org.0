Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2BB202BB7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 19:12:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qfGl1pkVzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 03:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=iVYyOFyx; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qfDy2Z60zDqcS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 03:10:25 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592759423;
 bh=ZKcl+97bymU6K1F3dGsUkV+JSxwqUs7q28xWWYpO+wU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=iVYyOFyxHdDHTbhWE3egS6057Pzp4y6FCOLlBED+WpEZNOVs8ri5n4rW8oZfIcB1P
 FzHW5rNfo7kcoOom84dTBzHF277d67ebvn80fO2biC5/OZfl9zwOvsH4JJwf6/G716
 L/8DTQLB3YATYkBzTuYo0dz6ndLbXCLkNo/RnCbY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87366od72u.fsf@mpe.ellerman.id.au>
References: <87366od72u.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87366od72u.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.8-3
X-PR-Tracked-Commit-Id: c0e1c8c22bebecef40097c80c1c74492ff96d081
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75613939084f59c0848b146e54ba463dc494c433
Message-Id: <159275942292.6032.16018775763067134260.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jun 2020 17:10:22 +0000
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
Cc: arnd@arndb.de, peterz@infradead.org, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>, will@kernel.org,
 npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 21 Jun 2020 20:52:25 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75613939084f59c0848b146e54ba463dc494c433

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
