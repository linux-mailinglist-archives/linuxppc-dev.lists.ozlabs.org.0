Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E48628A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 01:58:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SCXRGvA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tj52f4V5Nz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 11:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SCXRGvA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tj51s0Qlnz3brB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Feb 2024 11:57:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E88CECE0ED1;
	Sun, 25 Feb 2024 00:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCB56C433C7;
	Sun, 25 Feb 2024 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708822635;
	bh=gskYjTtZz1RQxCoilkwn5p3RZlAHtJoAXwW7n3t8sHA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SCXRGvA7q7VbLko6MU5akV/Rdy8/54cJr8ZnWAL9yTqAiouS2UG9nVjBzkM02d/0J
	 47qlaZTV9dRO/m9zNn+rC8jc26LR3wNTdxVBW74VSY1ZjkN02ktsdKJj5Op3mBBT3e
	 ALNhdVJab3b9Pz6CS+WysWiih1jJ+ygS/BSYeUkFZAo2s38Qh98WB4PfLiUd+B1TRv
	 QgTa3CwqM4K+UGGn+HMX2DZoWsM91oIwZNaexNur2Cf+v8zlol5Z82o1YDz02D47LJ
	 4gF5+hjIDb5lkudcStJiI+Tt9EuwmUStu4S6CF8NtVwMgOhgxBolViUAx6Pg7GPDnm
	 HggSLA3jp6xjQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9EB0FC04E32;
	Sun, 25 Feb 2024 00:57:15 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jzmt9y9p.fsf@mail.lhotse>
References: <87jzmt9y9p.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87jzmt9y9p.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-4
X-PR-Tracked-Commit-Id: 20c8c4dafe93e82441583e93bd68c0d256d7bed4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab0a97cffa0bb3b529ca08b0caea772ddb3e0b5c
Message-Id: <170882263555.8321.1129219517275240699.pr-tracker-bot@kernel.org>
Date: Sun, 25 Feb 2024 00:57:15 +0000
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
Cc: gbatra@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, amachhiw@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 25 Feb 2024 11:35:14 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab0a97cffa0bb3b529ca08b0caea772ddb3e0b5c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
