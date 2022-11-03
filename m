Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B1618789
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:32:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3C6N6cq0z3cct
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 05:32:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IoCAnSJn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IoCAnSJn;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3C5Q4tK3z3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 05:31:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 23551B82997;
	Thu,  3 Nov 2022 18:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C32E9C433D6;
	Thu,  3 Nov 2022 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667500292;
	bh=2NyA4ERgTsQNrECcBYv8TSkJKybWzWdNA4MPIH0N2G4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IoCAnSJnLuvF8NAMTfZIrgj+qKcQaiKHeE2VyVTg2JXvDEwiCKwqEK7QvK1ITuOM8
	 B+AK+hcsj5pmqKNQTHvKb62isswoPTZ78bUyXeJHmFqMTKxbjc/5qS5OiCVoEz5od/
	 SnKoZqkYTdzvQoveh6JTFL6CEG56LzVQcALb1R7oKSAwdRQnHhUI36CYhiBN1ynfu5
	 cG4jaPkd4Cc0aF99sOBeqCP12DHICviyvuLkC71MDPL2l3pAEuHxU9R3mxwOS6W+gv
	 5RSReckjTDI1RYlCuT2W0QXh/xKlyJq+LJOKDvpzHl/ahL2tb+qoT18dfQpfyLfYRr
	 S/vsSE2w0U7DA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1237C41621;
	Thu,  3 Nov 2022 18:31:32 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o7tossaa.fsf@mpe.ellerman.id.au>
References: <87o7tossaa.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87o7tossaa.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-4
X-PR-Tracked-Commit-Id: 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d74039149e0062e4ed25738d6e3e06970a38809
Message-Id: <166750029271.3912.5527083554346380023.pr-tracker-bot@kernel.org>
Date: Thu, 03 Nov 2022 18:31:32 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, schwab@linux-m68k.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 03 Nov 2022 13:09:17 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d74039149e0062e4ed25738d6e3e06970a38809

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
