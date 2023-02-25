Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB96A2B7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 20:21:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPGnl1vpRz3cNR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 06:20:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h9OeX7Td;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h9OeX7Td;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPGmm6vw0z3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 06:20:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43D5E60B5E;
	Sat, 25 Feb 2023 19:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2C60C433A4;
	Sat, 25 Feb 2023 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677352804;
	bh=/qP/wNSLKQN26nfIYrHRDuGuTrlRhIpDLvurGoCzVZU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h9OeX7TdxgUF6wui9wk3I3F3FCh3qnlCYvmTez5Kj+6MbdTT8JCHAbdxLjBzss4kf
	 FEfAsOBsix5ejHIR0QA2fUulnh7C+KlfJrGMbi9QA3hKflo8CG9uiKf3uNGxzZH8D+
	 CM7Nott39ETSwv6kk+x9V/OJMZ9A5jQGKnM+KZ8HYUtWa7uywcDQKLYNDxCcIqZsaX
	 mT6RdGzGd/4OTD2QiUMLezrYtFIUemAC9XucK2nIyQAS1IAN1GM997XLD9JxB42Q2D
	 ku0kem0D7lGoZdPxFKry4NhMhusiFjCaS65OS9SiS2EVW2srOtH/9zZm9R2LHSk17P
	 9daIABfBOVvtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB96CE68D34;
	Sat, 25 Feb 2023 19:20:03 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v8jrai21.fsf@mpe.ellerman.id.au>
References: <87v8jrai21.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87v8jrai21.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-1
X-PR-Tracked-Commit-Id: f82cdc37c4bd4ba905bf99ade9782a639b5c12e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0a32f5520a33e7f2ace396db6913625e0d29544
Message-Id: <167735280387.23615.5142912608434972331.pr-tracker-bot@kernel.org>
Date: Sat, 25 Feb 2023 19:20:03 +0000
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
Cc: bgray@linux.ibm.com, song@kernel.org, ruscur@russell.cc, anders.roxell@linaro.org, nayna@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, ganeshgr@linux.ibm.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, mathieu.desnoyers@efficios.com, skhan@linuxfoundation.org, jpoimboe@kernel.org, hbathini@linux.ibm.com, pali@kernel.org, geoff@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, fbarrat@linux.ibm.com, sv@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 24 Feb 2023 13:55:18 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0a32f5520a33e7f2ace396db6913625e0d29544

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
