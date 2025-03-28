Return-Path: <linuxppc-dev+bounces-7362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCEA742C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 04:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZP5XP3jXrz2yfR;
	Fri, 28 Mar 2025 14:26:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743132373;
	cv=none; b=Udf2P9j0vtI2F5p/iQ7FUHvyyYKd+dke6uqrW3UrDceIK29N1IuWuIu//Yyd2SHLUWWdPWxo/9EMp/V+qcCCB4FuSapuWm5Zv51/RWbGK1dFm7cmxT5f9ABtPcWd+9XhVYjBTcFxJsMA2YOa9m147qxAYyh0SMNW0oywQdyWe+/EvVHjmdPbw7Hxr7kQ4KfV+xt4Qj2DolVQaWA5IyO8Ttr+QVQULemR7YlQyw8ytD4DKHCRReUXytONK9DuIvLxv1qEHN2PaOICOYSq4caaDPwWBJTkpU4BgFqcTDO1gjhen3EXOd0CANkrq0VEM5lK3Zm4GU45sV+ofge4tRE7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743132373; c=relaxed/relaxed;
	bh=ypYH1HEa4E7+sEHoOyclufDPR/dwhr9c/dnT9vh6BZc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DVghwVUlKr8Rzto7mDYHOLv+GyjDE2Or1rdFWvVAPQj73WtBOMQVs+OPmVRy9TyDjGuoHE5oxLCa+YHYF2AVEHLtVc7CL4sRWt0CgsiZEU5H6S6RkxgMM7cMPGzbpCyi5bV9mxtnGFh23hWUWvHqEtoA8gcLFoA7qLrOGzZLOwquNa4MLWWT7nX0KXlThpZH5t90RsG7QRKUTfIa5neU5B/Uw1kiHs1Uz3dC86FvjRqP2tzWHwEe2BNTmZhLLWVpAh0cmwp4HgueIn0RPcyfdAj09v+DvPXlLVV5kFFLBmTN/LP3w9jkiGZZdRVFKtilcE8onSBZcuetCAlt0manHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ebJRRSHO; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ebJRRSHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZP5XN000Cz2yfN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 14:26:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B7E1614B5;
	Fri, 28 Mar 2025 03:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF87C4CEEB;
	Fri, 28 Mar 2025 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743132367;
	bh=rnfP8vqCbMABGaplMmCx0GcjL/Pxu/7rMdpg0X70dlY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ebJRRSHOkVmVZczP1qCxqRGJV5RCo3zXuXMGK61IcD9z3qhZsvVsEMPX0ptZYBsWK
	 FFaf3tEOX/yk0cUfeBuiJOhZAQZ2FKEA55UA8kH5Xih+dFiLEW4axxBYpBdvx9+YdG
	 lfIxpexeO6KjU6yKLsHPlvv6K87E+hQs0feSEBRN1WCHRhQnQL5WKqUIu5n5fhwqBK
	 Fq9Iv+KZclLvNxpm3+CNCYFYvCSIj420cLMWmPIbxRQSOhm6xhMRF0HtV1bN1+fowT
	 OjSFupmiiNd9xcTGnaRaR4+aeygmU51ZFSMbpJiOAP2MN/25/ZEcLUZyJ22oGtmNNh
	 S9S2jiKN3Yx1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE71380AAEB;
	Fri, 28 Mar 2025 03:26:44 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
References: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-1
X-PR-Tracked-Commit-Id: 861efb8a48ee8b73ae4e8817509cd4e82fd52bc4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b667acd69e316c2ed1b47e5dcd9d093be4a843f
Message-Id: <174313240323.2338593.17266673695538541862.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 03:26:43 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, adubey@linux.ibm.com, amachhiw@linux.ibm.com, arnd@arndb.de, atrajeev@linux.ibm.com, avnish@linux.ibm.com, christophe.leroy@csgroup.eu, gautam@linux.ibm.com, gbatra@linux.ibm.com, jk@ozlabs.org, kjain@linux.ibm.com, kuba@kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, paulus@ozlabs.org, robh@kernel.org, schwab@linux-m68k.org, segher@kernel.crashing.org, sourabhjain@linux.ibm.com, tglx@linutronix.de, vaibhav@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Wed, 26 Mar 2025 08:22:36 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b667acd69e316c2ed1b47e5dcd9d093be4a843f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

