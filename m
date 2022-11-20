Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E212E6315BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 19:53:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFfn85rpgz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 05:53:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PXoiJ0lF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PXoiJ0lF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFfmB3tspz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 05:52:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68C2BB80B48;
	Sun, 20 Nov 2022 18:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 185E4C433D6;
	Sun, 20 Nov 2022 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668970373;
	bh=tAsLytNsT00q5ZXNeBQ0dNLC/3Qs57UI8PbPdBxWzHM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PXoiJ0lFTiZgOqN75Oc7/LQrxdoXd734QjlqqOYQ6su5j3lLZbt5qX6zstZe5DtaZ
	 sR6rImg/Zhvk6DMvnja3eia9tGaLZHDhq+PAV9TaxoLURZeIFaiybO8ij6YBME+exI
	 2maJmCztzYWLcsdwpxcmeOgwtC3h4O4Al1Mu96Jf7qrYYwvx8SiquN5K60LWnmmE3M
	 k8pwMI9w7lkn45vgcPXvmt675MQeVzEY3ohQ66urBUDVy82vZNuPczY28QQFH8IUPT
	 QyYr2STD0oJxJHjcfmxjhNBJXWW8dHjPMtc5ALc+0Ku8nSmaubXLnGpLadgzC0vvDb
	 wS9ESvrd8S1Lw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06BBAE270C7;
	Sun, 20 Nov 2022 18:52:53 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87tu2ucsth.fsf@mpe.ellerman.id.au>
References: <87tu2ucsth.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87tu2ucsth.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-5
X-PR-Tracked-Commit-Id: eb761a1760bf30cf64e98ee8d914866e62ec9e8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 712fb83dc3f688458ae91bb0a5c706b239ab4684
Message-Id: <166897037301.26274.3099075135802910898.pr-tracker-bot@kernel.org>
Date: Sun, 20 Nov 2022 18:52:53 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 20 Nov 2022 12:34:18 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/712fb83dc3f688458ae91bb0a5c706b239ab4684

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
