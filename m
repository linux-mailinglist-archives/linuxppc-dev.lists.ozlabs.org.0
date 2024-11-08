Return-Path: <linuxppc-dev+bounces-3060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46E9C2373
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 18:39:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlR5M1lB4z3bxR;
	Sat,  9 Nov 2024 04:39:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731087559;
	cv=none; b=hqLGtQqwFiszMQLItKj94od+N48f7o+snM2MkOAcDHjTXYrXyBI3pNHTQMB0+Vv2UeQ+yIaZobLsioHlsqqfodp5gYTd7wpYjPThSXQv+5WlPVzUfrgcB9GqTBU9igj+kQJTluArsFz0imN7T8qL35ke86ggAdAX8X2cLfRqLWLpHQJtvYz/SiMc/i/7YRo7xud4e0/T/yzi5+USSldvGrPah+ZjqZeQ+xOMNdHjX6ogE+2OiwJye2B3tefVmj9oBsjlS+vwCoSi5ClBQlNRM2J3UAJyj96MS9dEOQpI8UiC2NGsiPWZAtLNY11HmuCWNzKTtTT9aG4fmk0hjqGS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731087559; c=relaxed/relaxed;
	bh=aUe1G1e+4g8CjnccdCT9XgUXClyZVMCuANEQyD+t/Js=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nz+fMHF8IAainSTqe8aNa1TTTYGreJsEtIHpTbBGHJKyKUxnd1l0+WD7gIjQ5+UQlvPnxUB3zQ8R84J+qMreUwXTa43oqI5pd/Tlvx74K0V9RkohHipe3gfdBXnXwGL6yp40lmyu8wdoph1veG3s5u96RY9Cw/ZmZWJdAnbedHt2wQ9ybEKuEtFbOpL5Q4/bg3LI4u4GMP+dx0l3K7WvDEOmaBsrYfMkBxlqPMAcHyhq3x3IIUrZkk47xWFhVLa0c/IbPVgws6mofuznFx6PFAwkLiIJvR/jXI6j9xYcvSctT1qonA0gWt998BIIzaDoECDctgmeVCHPF6/x7tedAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WQv3My95; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WQv3My95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlR5K44Nwz3bkc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 04:39:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 166495C5A5F;
	Fri,  8 Nov 2024 17:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2B3C4CECD;
	Fri,  8 Nov 2024 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731087553;
	bh=FBA1UHsrJLyViXGSn/Ke5BMq01F452+XsuBz/VNu1Po=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WQv3My95Sd0PTGhU1Dlr13/6F7dZND5Roq900EdNeZAsSR/XG5cQiIZixflfRIwVp
	 O4uLVlEOgUJCg8TRilF7ImkGKwpWxVxOW0l8BPrsGFKwIyky/A6AVqYZ3ygxC0HAUI
	 170MHV93ACZ/FNhsMNKYLFqjXOOGpwxh9Lv76iJ4Yvre1FR2XAOy8zVBRjsCN00H77
	 YBYCALlh3zZblcuNaRNE44baUhAKIsOSOfJKrUHxIi3GDoTUop2fjgFB/yPzCzCOnA
	 cmnNe2Kc7F/kHlhhXcHoebIVBCG76fpwemQC7ojph0dPAIKvZS6qb4aiDQ0je6u0yG
	 rSMFTku54tqNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE4E3809A80;
	Fri,  8 Nov 2024 17:39:23 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <375850de-155a-40cb-819b-fe21733e3cb0@linux.ibm.com>
References: <375850de-155a-40cb-819b-fe21733e3cb0@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <375850de-155a-40cb-819b-fe21733e3cb0@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-6
X-PR-Tracked-Commit-Id: a373830f96db288a3eb43a8692b6bcd0bd88dfe1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51b47860ad8058ae54e4789b5f9b253fd555d2e9
Message-Id: <173108756275.2704280.5311647402414328585.pr-tracker-bot@kernel.org>
Date: Fri, 08 Nov 2024 17:39:22 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Gautam Menghani <gautam@linux.ibm.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The pull request you sent on Fri, 8 Nov 2024 10:54:41 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51b47860ad8058ae54e4789b5f9b253fd555d2e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

