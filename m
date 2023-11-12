Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3F57E923A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 20:19:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZ8PEmJN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ST2RZ2p5rz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 06:19:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZ8PEmJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ST2Qk3jMGz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 06:18:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0588560C51;
	Sun, 12 Nov 2023 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8B28C433C8;
	Sun, 12 Nov 2023 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699816698;
	bh=/TZ7o3tk8rEPaAr6JQ4CmQpUUUJ7GHwPC7nP40qSa18=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gZ8PEmJNrnJH0Sf9jhGqfGN8fR27zEx48t3G9Pko8dVD93RKxuZ2RlVZWxaG/+dhf
	 ah5ohHYrn4WyDmHgV3cqqCk0XVHSgA7anUes9qGe8lCn2y3yZmFU1pcVMwV3HozqQ/
	 Npr7DYLz0f0m7Mss6PJ7gm8R7v+CKsbkkfP71rGTucxVw/lGRjSVitS9ljCs+DfXH+
	 nR2gaLa9XFpVe48Ep0K2/BupFECiMV93AidE3SQ/0cacnCDTpltkWjenDclXDZpJ0T
	 A+qJjqCZ/yMLO0vnYADBYEg3c1b/ldznC0dWwTG2oPmERCGCehpk8I89vnMY2qew/O
	 duTKZM/Gkhrhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4527EAB08C;
	Sun, 12 Nov 2023 19:18:18 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <878r73930n.fsf@mail.lhotse>
References: <878r73930n.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <878r73930n.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-2
X-PR-Tracked-Commit-Id: 644b6025bcaff59737270d812c70302f5a8d4a8f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5dd2020f335a7a60c154375a168791a2b87f35b5
Message-Id: <169981669873.29349.4673474762245267399.pr-tracker-bot@kernel.org>
Date: Sun, 12 Nov 2023 19:18:18 +0000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 12 Nov 2023 12:25:12 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5dd2020f335a7a60c154375a168791a2b87f35b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
