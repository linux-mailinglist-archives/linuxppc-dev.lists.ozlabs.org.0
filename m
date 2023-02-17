Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08AF69B619
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 00:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJS3l4cqNz3f92
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 10:01:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CFs2xG6b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CFs2xG6b;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJS2m4Wxcz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 10:00:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6696B61F16;
	Fri, 17 Feb 2023 23:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCDBEC433EF;
	Fri, 17 Feb 2023 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676674828;
	bh=/+E+Xt2KjcN0vWMalUVS6q3ENhyUTJNzgzHQ54Ud7mQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CFs2xG6bHCO68Clg6QWt4ERlET6veKb82qMYP00nK/PW6/arFOBpNLk78f3NgjNdO
	 cn2Wz0XxLxg6qzpWzCo8JXyO/2wax0L2s1+nNcpB0Ilep+yAc3eXhbI7aahRSdcPBR
	 db9mQT3jfDAXEo8WuUoWDWp2I/pZ3IRuBZiuLC8H0D4hywmpcW4KcWwxpxLDWxzDq7
	 NXx7nn0l7kstGfSvviuwUKcYCTPN060SdoH5bnGVvnKhWUWTgKN1iU7uupMiSF+stx
	 YpVWSAexECOQNyDDJqLXehwd042h6gjVglyo3HgRUZSUn0Wd5xQx9uziv0rk31l50V
	 nIAsCzp8wZHFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA7E9E68D2F;
	Fri, 17 Feb 2023 23:00:28 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
References: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-6
X-PR-Tracked-Commit-Id: 4302abc628fc0dc08e5855f21bbfaed407a72bc3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dbeed98d89ea91ae68ff6dce6060671726292e85
Message-Id: <167667482875.20587.7032685656825133519.pr-tracker-bot@kernel.org>
Date: Fri, 17 Feb 2023 23:00:28 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 18 Feb 2023 09:40:18 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dbeed98d89ea91ae68ff6dce6060671726292e85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
