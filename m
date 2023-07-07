Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DEC74B592
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 19:12:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qf+sXfpO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyKh02n24z3c5k
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 03:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qf+sXfpO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyKg53Dlyz3bwZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 03:11:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DD61619F9;
	Fri,  7 Jul 2023 17:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BD48C433C8;
	Fri,  7 Jul 2023 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688749868;
	bh=3OYXRE6Ot9Ype6mtCR9io7G6N31R1sHqQqEJ3rFGnPU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qf+sXfpO8qRoZCwNQsehudWAYZtTuFE8dUlx+J5522yXB0t9Ot/RzLTxtN4hYHVS5
	 zAOVuB/OdO23dwISgu9zfwVlTfOy+FHlVuf1kld/puvkfSWMeJL7abkNyGeh3kRJO6
	 zjmm9WAh3wMIw/1wrTodUrZZnVxawABDoKsfF9K1J5SMxFUCDZ3W0ISgJpATy3ysfw
	 +0UJX3r5Hbv0SSHQBtrnk4uDm4Q/ZohS47kuStlP842rt7fA7UE7IRWCRLUKYe9f36
	 JZFxIyr67vsdg1FftX/oKIP63YfiFNKmOzGkSBOTP0u9B2glHawRNFHRIUtU1kI38c
	 l5nx7AzIXsAGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 791ABC4167B;
	Fri,  7 Jul 2023 17:11:08 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <875y6vluoh.fsf@mail.lhotse>
References: <875y6vluoh.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <875y6vluoh.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-2
X-PR-Tracked-Commit-Id: abaa02fc944f2f9f2c2e1925ddaceaf35c48528c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22dcc7d77fa463914bc2a2fb4580e6d183ca415d
Message-Id: <168874986849.21562.9091829766126316645.pr-tracker-bot@kernel.org>
Date: Fri, 07 Jul 2023 17:11:08 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, dianders@chromium.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, pali@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 07 Jul 2023 23:26:06 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22dcc7d77fa463914bc2a2fb4580e6d183ca415d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
