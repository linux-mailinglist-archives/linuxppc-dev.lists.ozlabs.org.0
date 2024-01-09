Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90375827C3C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 01:48:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aKPN44X5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8C3F1DMqz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 11:48:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aKPN44X5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8C2M468Fz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 11:47:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B47EA6123E;
	Tue,  9 Jan 2024 00:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FFF5C43390;
	Tue,  9 Jan 2024 00:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704761256;
	bh=kaSVqiylQ1OVriAgdma+o2NRk9xOptJaNNEg23+9Xfo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aKPN44X5J90DbTq/d3/8G5LS22i+GKq7yQ+FUJHJp9k6qA4iNjaH1rQcfRs0baUz4
	 WMJNMTZQ2N8kyliL4/BiZYuUR5WTVTsYAfbbhkVyRir6NzHoyOJm1WLbDo7aJ+EGvp
	 aucHna/IHol+tC2wvyKc6nQjr+FOyACuWUhwclZ08WkcD3aq0vWGEjvMkogEP7l9Hq
	 j8EkxUUz8uJJ2PtQembhyWVGxIgz55X2oi0Dt7TBBxTvWWIspd/EXhTdz9Y2QUZ8lg
	 +/nthpRxNwlV9o6ZiOiHMjCXw5X27LtHzX9PZUM8Jn19hiiVN0ffzfKPLqcIvdrN/6
	 alFQe6gcjtzig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2AEF8DFC686;
	Tue,  9 Jan 2024 00:47:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r0j2k231.fsf@mail.lhotse>
References: <87r0j2k231.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87r0j2k231.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-1
X-PR-Tracked-Commit-Id: 44a1aad2fe6c10bfe0589d8047057b10a4c18a19
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 968b80332432172dbbb773e749a43bdc846d1a13
Message-Id: <170476125616.27312.16824249786810615337.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jan 2024 00:47:36 +0000
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
Cc: srikar@linux.vnet.ibm.com, chentao@kylinos.cn, jniethe5@gmail.com, kunyu@nfschina.com, adityag@linux.ibm.com, sfr@canb.auug.org.au, dario.binacchi@amarulasolutions.com, aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, aneesh.kumar@kernel.org, kuba@kernel.org, colin.i.king@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de, kjain@linux.ibm.com, naveen@kernel.org, npiggin@gmail.com, oss@buserror.net, sv@linux.ibm.com, haokexin@gmail.com, liuhaoran14@163.com, ke.zhao@shingroup.cn, geoff@infradead.org, linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, david@ixit.cz, zeming@nfschina.com, fbarrat@linux.ibm.com, vaibhav@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 31 Dec 2023 23:07:14 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/968b80332432172dbbb773e749a43bdc846d1a13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
