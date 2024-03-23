Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DCA88795E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 17:25:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UIcg4FAC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V24LS2rkQz3d2K
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 03:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UIcg4FAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V24Kg6C61z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 03:24:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B9AB60202;
	Sat, 23 Mar 2024 16:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 252D9C433F1;
	Sat, 23 Mar 2024 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711211092;
	bh=T3OAyKyJpcbqAIQyHuZW09u3eIcA963sn5FOSQf9ROY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UIcg4FACYS16+O2uIsLA5ERgr+Zak+DWfradJRPzhFtZcYLF/JCxCRkdUMRkXKyAm
	 rrLOxckhyzcAKBJbDBCAcS8Q/VINEqGBpGjohK3UtqpR8zdCL8An9IFJ+GKGAPnxrQ
	 NM6sJcJgTGQfNmzNaamljx3R8W6r6jRS1LHfs+LU9YQ9zXPU8Ih9RKWufB05MeFSut
	 BWhP7v0F4z2eSNiAhizTDPJF/r24vQJ7yn5e7Y5LZZTs2dsiPFjKBGqGEGJaqTFI5i
	 ipcTj199sfSl5HqY8uZUMSAbLeFjmSMsR4DplanVAQyTCLEmUQ2xcpTu5DKxIhW1AT
	 xZ9ynmS9Ana5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C228D8BCE3;
	Sat, 23 Mar 2024 16:24:52 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zfupix7p.fsf@mail.lhotse>
References: <87zfupix7p.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87zfupix7p.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-2
X-PR-Tracked-Commit-Id: 5c4233cc0920cc90787aafe950b90f6c57a35b88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 484193fecd2b6349a6fd1554d306aec646ae1a6a
Message-Id: <171121109210.3260.13947764386545794887.pr-tracker-bot@kernel.org>
Date: Sat, 23 Mar 2024 16:24:52 +0000
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
Cc: bhe@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 23 Mar 2024 11:54:50 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/484193fecd2b6349a6fd1554d306aec646ae1a6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
