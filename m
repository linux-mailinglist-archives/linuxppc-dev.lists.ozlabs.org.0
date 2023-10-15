Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC20F7C9A0B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 18:25:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zx1moN70;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7lvm6M94z3cH2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 03:25:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zx1moN70;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7lts0jD5z2yq2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 03:24:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB10160B8C;
	Sun, 15 Oct 2023 16:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 999D1C433C8;
	Sun, 15 Oct 2023 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697387057;
	bh=+1qmMSY2BrH8cjL47D4rLAEodP5zmN7TMEJ9CJ8UEX8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Zx1moN70XStUDZYNUNE/UFouNAK8lpb0rHHMvJGr7rvcCqxrmqysriCRe7088Drd3
	 iTjqFNcG/Ua937R9H7DoCBjYBhrgo41qITfPI+7eNuUYtKfxk/T5hAt8XUSCN2i7ec
	 JUBonBF9Ah3g2vfPLHpgPn9YH5mPC5JQZeiCko/FFHnifH8N4wCEyuHFewrO/3ubsZ
	 eF0JG2Z4jBZDaueO3mATJu4FWwL/yCQKD+pklayD+hIJDQI+/mfPsjMfvmlRzDGz36
	 rmsae9S8TNPySjykUrzLJoWKSOqDT4NPDlicji1zfcZiRGALTPqOFIBwQeIKANXmMd
	 yu5w4OUaBzxrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8771DC395EC;
	Sun, 15 Oct 2023 16:24:17 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87mswkyy5w.fsf@mail.lhotse>
References: <87mswkyy5w.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87mswkyy5w.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-4
X-PR-Tracked-Commit-Id: f0eee815babed70a749d2496a7678be5b45b4c14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f8bf101b3b1171923a011a47923a93f4b22e6cb0
Message-Id: <169738705753.6658.7721808898393616702.pr-tracker-bot@kernel.org>
Date: Sun, 15 Oct 2023 16:24:17 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, atrajeev@linux.vnet.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 15 Oct 2023 21:31:39 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f8bf101b3b1171923a011a47923a93f4b22e6cb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
