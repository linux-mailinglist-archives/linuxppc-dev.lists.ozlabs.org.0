Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E86236939B0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 20:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFHkZ69MQz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 06:35:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JiaNS7aY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JiaNS7aY;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFHjd4hVCz302m
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 06:34:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAEF5B80956;
	Sun, 12 Feb 2023 19:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E529C433EF;
	Sun, 12 Feb 2023 19:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676230480;
	bh=6upH9Afxd3IDmQbTJCQKaNCdDBY45kiucMk5NPnn62o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JiaNS7aY5T1AatzZDyf1qcj6zyPTk5i3YmhOQRB5RRB1nbcD2Ogv4ISPAMqZRpZJW
	 G4JLTtF51yEegtq4qMFJcASPT8ZRX7tS/tngKfkXMfXyyYhOCvj94SA2HJ6ksyHU08
	 b4U8wXLFLhjVWwyWUk+hPf9BdaquGumysDDip4QEBZVGszpS4Rm2CEBQgMnQyCBJTR
	 vOU4iXR395gKh+koqBPK0fj08ATQqpHD+9s7vh8OtFVEoG2KYHt4IwwOXYMYAe8TyI
	 htV9M2wnPm1zAaQ1I0yq0dqTkhjv7gLpcPQ1PBTMNMDQfUcoQl1BKo+3TZcO5r9kkF
	 9D1Q/ZDCewy8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38AF1E21EC5;
	Sun, 12 Feb 2023 19:34:40 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <874jrrwehv.fsf@mpe.ellerman.id.au>
References: <874jrrwehv.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <874jrrwehv.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-5
X-PR-Tracked-Commit-Id: 2ea31e2e62bbc4d11c411eeb36f1b02841dbcab1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 49a0bdb0a38e222d35c50644468856e2408764f0
Message-Id: <167623048022.930.14072875760407623153.pr-tracker-bot@kernel.org>
Date: Sun, 12 Feb 2023 19:34:40 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 12 Feb 2023 18:05:00 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/49a0bdb0a38e222d35c50644468856e2408764f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
