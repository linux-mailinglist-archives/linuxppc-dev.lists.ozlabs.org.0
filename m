Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7268BC34F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 21:44:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RdoyYM3D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXZkH46mpz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 05:44:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RdoyYM3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXZjX1JQzz3cXk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 05:44:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BB5860D3D;
	Sun,  5 May 2024 19:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAA73C116B1;
	Sun,  5 May 2024 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714938236;
	bh=KyuBQsAa5lBeTTYE4+PFwcnjamOstKxEe6m7tOytGQA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RdoyYM3DgMeJ+z0fzHP5l1uTHve4uFTjZjKQA9OqXhkRRReBqQVBh0md7NehiFi8z
	 DyBlYuZYTz2j9Z98zSHXRR3/vWtf+fcMuXGuuIuWuhAfI6ujah3iW7g4xT809RW601
	 eKAk59bcPXJoX95zCC5QszsnTVUz3PdHuZ2+F6R8A5jeGyeEpXA/z9kIt2txR5KHIz
	 kjoGyDTnuNy/zkzSFNoi7AlOenOOzH5t7518mKBQo6ZTRtHE/FiLk2BljF6Fyssl+Y
	 +qGr7zGj9cXHjdpNHmFF6itb93P235ifHIEz/y45se2oq8TaFq2Ovn3KowR+oBTfIf
	 BQ3TT+Ni7ZMfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1A2DC4339F;
	Sun,  5 May 2024 19:43:56 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fruxumnu.fsf@mail.lhotse>
References: <87fruxumnu.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87fruxumnu.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-4
X-PR-Tracked-Commit-Id: 49a940dbdc3107fecd5e6d3063dc07128177e058
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef095257750bb434959648331e48e44705d802e9
Message-Id: <171493823678.6787.2479407685189394456.pr-tracker-bot@kernel.org>
Date: Sun, 05 May 2024 19:43:56 +0000
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
Cc: ajd@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, gbatra@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 05 May 2024 10:28:53 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef095257750bb434959648331e48e44705d802e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
