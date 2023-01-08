Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B96615BB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 15:12:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqfCR0vS8z3cHD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 01:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HwAywhrn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HwAywhrn;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqfBX1QXZz3c66
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 01:11:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7FB63B80B2B;
	Sun,  8 Jan 2023 14:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32022C433D2;
	Sun,  8 Jan 2023 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673187072;
	bh=wWoyI8cGkdSrSyjkE2bFbFrETQ6VJ7n9DreCOGIemVI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HwAywhrnYuHaeFBZBrhy6kAbPc+lUgGbHadhWtqsgM/oI34ESXtmEt7ZhoM1na3ef
	 okpfopC7l5QVtPG0hiiNP8Y5RcS8tS2/nAeFjwmYijY0v4Ym1uxcQOeKCO9gmVJOFL
	 vNeGuclR8RUZFZhAikdBzjp+HKoziQAJwWvMqgxtrcQU22ObHtL97diO6OfQFLZCoH
	 p0HLs0CvTIiI3NlGSdwJuPdZ+iSNab5nLEhCkrQy9bzFZ64LrRAjkRk6BKu+tgSe9E
	 wdcoSUJ4MyZNHiIzRJsAg0rlhhb3wGYYzAgv8BS4CmTeVDf3q18xiAT15LNWu7mm/l
	 jPqS0mzuSVr9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1FD53E5724A;
	Sun,  8 Jan 2023 14:11:12 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87tu11gped.fsf@mpe.ellerman.id.au>
References: <87tu11gped.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87tu11gped.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-2
X-PR-Tracked-Commit-Id: be5f95c8779e19779dd81927c8574fec5aaba36c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93928d485d9df12be724cbdf1caa7d197b65001e
Message-Id: <167318707211.25303.15442437836280597984.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jan 2023 14:11:12 +0000
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

The pull request you sent on Sun, 08 Jan 2023 23:51:54 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/93928d485d9df12be724cbdf1caa7d197b65001e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
