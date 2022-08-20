Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD2A59AF99
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 20:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M96s733q1z3cjN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 04:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n2oOEzO5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n2oOEzO5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M96rT3bp1z3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 04:40:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02066B80A2B;
	Sat, 20 Aug 2022 18:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7C2BC433D7;
	Sat, 20 Aug 2022 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661020834;
	bh=uBiTZyfAAcPk2HA5AW5UZ6xvApMNfZLG9IsLcs63Ey0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=n2oOEzO57r2PtYz1DiRmMFQ9QuN2usjWnB/3N5tAlwe4HY+B6cpetsfw6AMiq6OZ5
	 y1+TZMirqzuictJcOcI6N2StdBvUvtBJL0jX65uBmCEqCHVvS/ImH/VdhOBcE6fNe5
	 K1vPddX1lHXkevIg6Chd8yxv0zUO6xI9lUXWhKgrXpBZj32CgFGrE/qAvAmscoo50R
	 9nPDwsQ1nm5Quer2jE/D2dY4cVgzAKRbUHdRA0KOlZQd2R2JpOHOr3skGiSnWBhI67
	 0T14nH6x8Bu3Xa0OqCgfiaN/AjB7VHZw4x7TGrqanPkCnckZjmXeS3IZ6rQ5L89vhx
	 r8/bwkribfqFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 929EDE2A052;
	Sat, 20 Aug 2022 18:40:34 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wnb3ld61.fsf@mpe.ellerman.id.au>
References: <87wnb3ld61.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87wnb3ld61.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-3
X-PR-Tracked-Commit-Id: f889a2e89ea5b4db5cf09765ee5e310be43c7b6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 32dd68f11058652a37152aed12bf552455914b40
Message-Id: <166102083459.30631.540996902473133866.pr-tracker-bot@kernel.org>
Date: Sat, 20 Aug 2022 18:40:34 +0000
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

The pull request you sent on Sat, 20 Aug 2022 15:03:18 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/32dd68f11058652a37152aed12bf552455914b40

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
