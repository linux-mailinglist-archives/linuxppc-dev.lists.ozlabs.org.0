Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F96E3ACE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Apr 2023 19:44:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PzyHB3HKWz3cK6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 03:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5ors/q5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5ors/q5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PzyGH1LC4z3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 03:43:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A06160F37;
	Sun, 16 Apr 2023 17:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E494C433EF;
	Sun, 16 Apr 2023 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681667011;
	bh=/3XLWyy9XtHKGWrV1lStuYlL6XW94nFnXAxbwLUzwQU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=s5ors/q5o2LSQZT9jxiOu8qpJCjX89qC4RKjeYP+kvjYLj5owGw0u1fxp6PlbZski
	 wdkajtXYc70S2D4bb+AiaESvxW3LwZ9XZk3Jtku7RIeS9nkVhDyFGnsTVgx1nY/Ca5
	 mZQ0O05jYjXgykLOtoLH2vJT8LEtQtb1THq3S3Y/w3HDoso5oj1FuUC09pY9IYmdHO
	 RgQOHLD65I6sYyND5ZBJv9BOeit7dhIKuQv21eMuDcdIW90iaCLk+Emym22a6rISYh
	 dWQB0KAx4Qmm5dldN3EfJJ21lDUYstSzPrO0azT0tRS4Yxr5iglD0hDlikG5oMtn9W
	 wBT/4kSANWfNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7FA9E29F3B;
	Sun, 16 Apr 2023 17:43:30 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r0ski27c.fsf@mpe.ellerman.id.au>
References: <87r0ski27c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87r0ski27c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-5
X-PR-Tracked-Commit-Id: b277fc793daf258877b4c0744b52f69d6e6ba22e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a1c388ce0521163f1556f7edbacb50ec2df15cf
Message-Id: <168166701094.4218.17580746926855703988.pr-tracker-bot@kernel.org>
Date: Sun, 16 Apr 2023 17:43:30 +0000
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 16 Apr 2023 19:52:23 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a1c388ce0521163f1556f7edbacb50ec2df15cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
