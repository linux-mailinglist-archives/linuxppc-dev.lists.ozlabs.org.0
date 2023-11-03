Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B817E0A46
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 21:23:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kGia1E8n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMXJ53f8Sz3d88
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 07:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kGia1E8n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMXHG5H1Vz3c76
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Nov 2023 07:22:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 933A4B81FA5;
	Fri,  3 Nov 2023 20:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBB59C433CC;
	Fri,  3 Nov 2023 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699042964;
	bh=1yGEC1VTlVTYjeEdE3n21I8XP17kht2E8duzzRHaS7E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kGia1E8nDg+VZ6YlR69aAScIiKK+k2ca5Y+g5Siqi5Y/xVN9NkkRVZEOea/Psxz4b
	 Vb+ypwcaa1Dc3DnBCEu7mBPuRV81jP3+mVq0kMfsBi6yzBr6w3AOGuCpYy6+Zgte8t
	 qZDH8/spzOZDBdD18CS6NYkOITHeeTbhex29Ux6qaFOx/YZjm6hnJ5fTvGTn1wqbNM
	 0ih8LWFIcpHKX55A8Gu79Tecy6kCg3hUqsmg6SKvr+65+UiQLpzjt8mQbQSqYceuwY
	 hcNNtr0IKg48dJTKAJdhwJd7UIGSTWmlgVj1DUJUPUHCues/kl06w8rLTwVivYT+I0
	 uweuDC2jVeyog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2342C04DD9;
	Fri,  3 Nov 2023 20:22:44 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <878r7fgzvw.fsf@mail.lhotse>
References: <878r7fgzvw.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <878r7fgzvw.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-1
X-PR-Tracked-Commit-Id: 303d77a6e1707498f09c9d8ee91b1dc07ca315a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 707df298cbde200b939c70be2577b20775fe3345
Message-Id: <169904296478.5035.1249699175679053125.pr-tracker-bot@kernel.org>
Date: Fri, 03 Nov 2023 20:22:44 +0000
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
Cc: srikar@linux.vnet.ibm.com, jniethe5@gmail.com, bigeasy@linutronix.de, song@kernel.org, bgray@linux.ibm.com, adityag@linux.ibm.com, tanyuan@tinylab.org, robh@kernel.org, mikey@neuling.org, duminjie@vivo.com, bhe@redhat.com, haren@linux.ibm.com, stanislav.kinsburskii@gmail.com, geert@linux-m68k.org, yangyingliang@huawei.com, nnac123@linux.ibm.com, wangyufen@huawei.com, linux@treblig.org, gbatra@linux.vnet.ibm.com, naveen@kernel.org, npiggin@gmail.com, peter@n8pjl.ca, hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, visitorckw@gmail.com, m.muzzammilashraf@gmail.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 03 Nov 2023 16:38:27 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/707df298cbde200b939c70be2577b20775fe3345

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
