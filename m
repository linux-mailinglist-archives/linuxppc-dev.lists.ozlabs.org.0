Return-Path: <linuxppc-dev+bounces-2371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 509729A40D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 16:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVRV20d0kz3blv;
	Sat, 19 Oct 2024 01:12:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729260730;
	cv=none; b=Ngz+gHLV6MhSzPHvGGhtfgwiGtKGV6AgEtRYFWvkNr5HF+m+Ft8FAnY/xNtXg3Tu1HghdQ8g1G4u43QgUTyAlIoAyLcnats0XyZEM/4dOiPXdIY1SbS7sBTbq+eA9hFOtkRN2B6U7uX1AdyVeUlLKjOaqYkTl0KmIyniE6VX2qOpiI2B5I8qGHJ5cTRNvjNvWSkxP/ePVxNrVGhqv42KZcwmzXMn6CK5HF7xHitg+tbm0WOJ9AuLG36Oz6gU2TErlsTPRAuPzN2SCJHEVJC2kZ/E9lv/uYeEDQmYJKwS776SkGi5XnuOAWhG76f0u/eqqCKJ/MSv9NPsSHu9u/7/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729260730; c=relaxed/relaxed;
	bh=OcBQ0OeoeFGugEP/lac7NwZBv5LO6HLaCOrvaoaCoak=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Wibb92DDWoTmCNXBKomMevtWTk+Q7BMgct5TWt6rnEXRd6uThNKtD4OpUBJy6ydoD/uQl7/mM8OPZMJFrNlj6zgIFZCL6xyhLfE56ZnzTDlOEgQDykQKr+fZHavr/3bD6nj4vAkMeEswdytDX2pvwjxY5Uy31HKqx/+KPdCBvUp7CIYUldfDNF4Svyv69wMVnqcmErriSKRsqgT18yX5WH45dpaDh31fvd6sGfhMQbAEk0AYsp2yKuSC6aelNvM1g/oZdJMm8oHZrYoKSpi1DTdKRWKUs6HwFHjaYrvj49ydYCdtKIyV7Xkb0WQjFaGNk4eDuwRUrxWSL/ooLuOy9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YYAHD9zX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YYAHD9zX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVRV072Clz3blG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 01:12:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 492CBA440DB;
	Fri, 18 Oct 2024 14:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E391AC4CEC3;
	Fri, 18 Oct 2024 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729260724;
	bh=qvcX1OXBPEMIVMStlOyuuySYG9PVfQBaNlLjwwZHk1I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YYAHD9zXfXMGc/RsXrPZ6vXHT1vihQD87B7nTVva4Wi1JDvlPOmoBEvQZhWL86V5f
	 usTeHZYtHwZtfPdK5eUElBel9mdJjfn38+6UsIwQPkdsNxDat6APMS3lmWtvpyN/J9
	 2cSVLfW7DtNNyS4jrvY7Y4FZUh/nY47CUAniGSaLylGbGyosxAqk/1FZ0U5WBOflsM
	 xfYSMJR1w4vBt/RgYBN4QT7brEVC0a8qildXfwhO5gumSwDP7sZu4LqqDV3pzmvPBt
	 3dIFCa8X+0goaludFaVp45Gthr64BvuFPqyKAmNPIvLHDLSgjcOMg6B9Z2HIDb6vpD
	 eCNLAKRVpCMjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2313805CC0;
	Fri, 18 Oct 2024 14:12:10 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <56940325-8474-42f7-97b4-fabbd3ea0da0@linux.ibm.com>
References: <56940325-8474-42f7-97b4-fabbd3ea0da0@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <56940325-8474-42f7-97b4-fabbd3ea0da0@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-5
X-PR-Tracked-Commit-Id: cf8989d20d64ad702a6210c11a0347ebf3852aa7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef444a0aba6d128e5ecd1c8df0f989c356f76b5d
Message-Id: <172926072939.3128200.8235175194685812714.pr-tracker-bot@kernel.org>
Date: Fri, 18 Oct 2024 14:12:09 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Fri, 18 Oct 2024 13:10:13 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef444a0aba6d128e5ecd1c8df0f989c356f76b5d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

