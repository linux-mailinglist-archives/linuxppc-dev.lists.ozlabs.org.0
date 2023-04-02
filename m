Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4076D39AE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 20:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqMM63jhrz3c6v
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 04:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mt2VCAPM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mt2VCAPM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqMLC64Tsz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Apr 2023 04:02:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5DFC4B80F63;
	Sun,  2 Apr 2023 18:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C52CC4339C;
	Sun,  2 Apr 2023 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680458526;
	bh=OlZXiUfmDAaznyUbKDn1oUOJ1mFDgynyKFyPsT0bDK8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mt2VCAPMjKWu+mU205Lzup7XhhFW/omfwTuElDc0hA9CuZ8e6Pc6WU/oLr24SI7aW
	 vMpff6Y/QMAqszv0KXuiQGVkq7IonktANQaCer2CYbV5iHaQGtA01kf0Rbf+QZ+Prv
	 rCUQJCYIhKyRWL2A1bJkNpw9g00u2ptJRhuL+nTJ9M2AZ6Zr7KgcP/JUufpuxTg9mA
	 Arq8T8YAApIGpfxux0asVMLXRx3ez0m5WwJW6WcKiBMCpPfFQQDWEnwVJPYN0uE9uA
	 Hm0rUeKdSS+csNl5KfGEI5ZEzJ6XN+BOV53MsAXfa8D7B+jQR1UMbbX2HPRpwapvZT
	 hFh105o97Op6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE6C6C73FE0;
	Sun,  2 Apr 2023 18:02:05 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.3-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lejabnq1.fsf@mpe.ellerman.id.au>
References: <87lejabnq1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87lejabnq1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-4
X-PR-Tracked-Commit-Id: eca9f6e6f83b6725b84e1c76fdde19b003cff0eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95d0b9d89d78e0983d4feb012b0f12d13d1ae19a
Message-Id: <168045852597.9845.4713978101198277146.pr-tracker-bot@kernel.org>
Date: Sun, 02 Apr 2023 18:02:05 +0000
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
Cc: axboe@kernel.dk, Linus Torvalds <torvalds@linux-foundation.org>, haren@linux.ibm.com, linux-kernel@vger.kernel.org, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 02 Apr 2023 20:08:38 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.3-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95d0b9d89d78e0983d4feb012b0f12d13d1ae19a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
