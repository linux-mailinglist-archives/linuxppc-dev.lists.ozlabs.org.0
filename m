Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C156155B32C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 19:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWJ2D6ZcTz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 03:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=axSGuYa/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=axSGuYa/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWJ1Z1Xzzz3bhq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 03:36:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56E0F60EF8;
	Sun, 26 Jun 2022 17:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAE58C385A5;
	Sun, 26 Jun 2022 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656264973;
	bh=4eVfnsUZoSyF5LXwFiqWxJLLxFU06Qjwb2aa/9fyguM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=axSGuYa/qav1ieIlkLofyIWzFym95pOaNc+fyys6lZH9oHR2n6xOlc/LuEcyjh5j9
	 Ld/5h4qnLR3dLa3/YmkT5nrCditHh6dnaKDFvsXXDX7w2j5z17/O+d3zKx2X/IlKs/
	 LIQ/WWDrPKUNYzt4YlguF2VxxPbchoHUyncgMaVm3PFocg79CAlJmd4ABAyW6OA8iS
	 XKck6be5FNUINBeAexg2PcwfbQwzuOplERVBNqF4KH9Yhoehh+vhZ6Ch1O/LhCptRa
	 UzEV87F6Nz+A4rTr1CpJ95IwTN/5NkEp7rxhUxbtsykD5bkx7Y3DZiROr9ZT/sVfvt
	 Uf/1r5hQv354A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9873FD99FF;
	Sun, 26 Jun 2022 17:36:13 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pmiw4592.fsf@mpe.ellerman.id.au>
References: <87pmiw4592.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pmiw4592.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-3
X-PR-Tracked-Commit-Id: f3eac426657d985b97c92fa5f7ae1d43f04721f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8100775d59a6789c3c6c309de26fac52f129cba8
Message-Id: <165626497369.22456.13163681330452248984.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jun 2022 17:36:13 +0000
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
Cc: Jason@zx2c4.com, ajd@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 26 Jun 2022 10:50:49 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8100775d59a6789c3c6c309de26fac52f129cba8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
