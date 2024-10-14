Return-Path: <linuxppc-dev+bounces-2178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304399BDD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 04:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRhJK2Q0yz2xtp;
	Mon, 14 Oct 2024 13:39:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728873553;
	cv=none; b=L1Ie18/g2L5wtt6UhWwZtf24nTZe1QEhoCT4BsJRhKA4sn3kehmynuot1SrMPyXz7WgwgF02RPuQsl0fM/Fqz3Y0dGdDO9eQZ4jbWAL9Y3aGsFbZwKoNHZv4jnz+R/JjuHznLOUjPTs3Qb4YydAtOdWYRm4cyY10Pey/dIoi8wcfjnnm/56JBvIc8She7acAqk8g2kNeSqivo8FE16+eOrCxv91TTBe9oNaS5sCBQ1MNdM0g5RoH4Z4PqUyNhX/Y5SdCB8aQ563cFAEgSdtUAA/p8d3mH8VMS4n8avns1JNbxakxhhK6nsxioQI7g+q/nJ1TQ9y3jGTW3ttPr7pLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728873553; c=relaxed/relaxed;
	bh=2zQ9goHKc9CBANEkZIl0HVY8x19rD0sOLVk67oVoxpI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cXooEp08phKB0o5mmwPvkp0aKVW+PDcs34Bs1+2rrgS0HE0dmYknkZYfeiSNYeSBInqh5PrsRhsueJiSSF1HflyJQie9CQdv2U8jDxUEzMCYPlb6nxmfPAWN+JXa23cpzI6vHI5N0FKMn90xAJ4Hy/C1hvZlrtK1CxCYhXcefgPi80nx6SadodizmDZgUmFKxZ+6t3IiSBEjNYbQnLM5lovBfIGFhQpuTWwj3d9aJXbp1DEgtQ2Tc/BYagFCsPgSPMdDkDUjhN1aIFivQNmAr5jg628DBVaFz0utOmmSGv2t1xxxcL4tp/AzaWlLFjWLobCuEbTre0We+hMSoW3QlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QuimgGDa; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QuimgGDa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRhJJ1rFKz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 13:39:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51AD55C5963;
	Mon, 14 Oct 2024 02:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752FBC4CECD;
	Mon, 14 Oct 2024 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728873549;
	bh=DbDppARrfWx7MPQETcoArhs0F+3D7OS9cy1pKoMvy+w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QuimgGDaWHKVHl53Ix2Ij2n6RCkFR1/BP9LbWz3u5Wz/l6WzWYKyE+vBBVrffybh3
	 XhlCwtA4q183dEE53bfhSujcnadhvw76L35u3+fTBzrZPBQaRScDcf3EqatBGXH5p1
	 Qk1vFjScqmqRzqy0TcTzHagzKIAouhU9jdjNQ4TenDfFf64O62YBiAxD/axPEZ5MgB
	 vIzzevhTYzB25OkiyIbHtuZudxULQKMb471g4SQHXHv/i4l3Ixl0OzaG64a1BaRfgd
	 f/aJNNye2p/zPvG+akxSSYRHsCFvh5zLwlKNcFW2qlCM/JlH5Wkrpm5KXGD20XCkO7
	 8xaGmioFZjGgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF9338363CB;
	Mon, 14 Oct 2024 02:39:15 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ldys6ha3.fsf@mail.lhotse>
References: <87ldys6ha3.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87ldys6ha3.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-4
X-PR-Tracked-Commit-Id: 8956c582ac6b1693a351230179f898979dd00bdf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36c254515dc6592c44db77b84908358979dd6b50
Message-Id: <172887355423.3903120.18171876866386045405.pr-tracker-bot@kernel.org>
Date: Mon, 14 Oct 2024 02:39:14 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Sun, 13 Oct 2024 10:19:32 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36c254515dc6592c44db77b84908358979dd6b50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

