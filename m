Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045981614E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 18:38:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SLFHw23C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StVYl0lR4z3cPK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 04:38:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SLFHw23C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StVXs12vZz2yh5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 04:38:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8804F60C44;
	Sun, 17 Dec 2023 17:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A8CAC433C7;
	Sun, 17 Dec 2023 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702834681;
	bh=u3754chIscoj5hXYRWTd00CFQmDIGAosRSu3ITw7K00=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SLFHw23CZxA+xVyaWOrngTHqKpqQ4C72gaKlX+4CNIJAV2V+QqmTOo9zPM5uK6vI5
	 o5b/ebVM13+pECeTE/PZdI1A4pt7DqFraUuh6XgrcODUJBE/TyGBzp1bart2/1r9ak
	 2frQ+z7g1nqjPwRlvi/bbISlhLJ/CTEiccQdKLvg87YUnc922ort5bYRO5lRO+ziMs
	 AXWlqt24iEV/2jfOG5sMNkHef6B3YOetfraoozYEpbloZCzB8ddA7ptaTNrx+LsfSc
	 Sg0f5/WLCsQWN3ldpq9WtzKMUvKFS20CDKk4U37Rs2z6H9tbJ+YHodJ735k7YE+LHX
	 PIrEiVJsixHeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 12C6AC4314C;
	Sun, 17 Dec 2023 17:38:01 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <875y0xmlda.fsf@mail.lhotse>
References: <875y0xmlda.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <875y0xmlda.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-5
X-PR-Tracked-Commit-Id: d2441d3e8c0c076d0a2e705fa235c76869a85140
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ef3720d91285f7ebc49d17366b366818516b768
Message-Id: <170283468102.25242.8126551832309210733.pr-tracker-bot@kernel.org>
Date: Sun, 17 Dec 2023 17:38:01 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, haren@linux.ibm.com, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 17 Dec 2023 16:46:57 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ef3720d91285f7ebc49d17366b366818516b768

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
