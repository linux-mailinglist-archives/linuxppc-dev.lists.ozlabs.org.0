Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC676536ED3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 01:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9djl4pygz3c1b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 09:51:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q0t53M8Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q0t53M8Y;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9Vtc1p0Cz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 04:43:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 55657CE0B4B;
	Sat, 28 May 2022 18:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B86E2C34113;
	Sat, 28 May 2022 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653763410;
	bh=+7kC2AqxNFEWnHYokdqvZSMwgZEffYyckONkFhqvmG8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q0t53M8Yu6dY3Q0YywxAg2apTqcn7RG1REtpQ3Ot69izLLJUiRfa4p18Kbkwv1Uy2
	 uCt7q9k34gDMO1htE4g8GP3I+03w3p9TpDp9CI3DXVHSA8dwnJHWVqUEE/FjXW/WFj
	 fXXcuJd0w3KkXp6ZrY2g2ZAovvqloINAtinJ9VkW7425BIJdzFUlYPmFGtw/sNOuVF
	 KXDyghILeSIewZtp37cD/eiXv0g6qF2QbnROC3VzDI3OIbtad0h5pGFmNCrho/xKHP
	 Er7aOfQcfhnMMguZGBwx9SywTKuZB92XRFMY+gHP9v81MTdOyZy221+GANAWpztXLN
	 FjNvhyrNHe8cQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 954A2E8DBDA;
	Sat, 28 May 2022 18:43:30 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pmjxlt2s.fsf@mpe.ellerman.id.au>
References: <87pmjxlt2s.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pmjxlt2s.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-1
X-PR-Tracked-Commit-Id: dcf280e6f80be280ca7dd1b058f038654e4a18dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6112bd00e84e5dbffebc3c1e908cbe914ca772ee
Message-Id: <165376341060.28289.278444479927241680.pr-tracker-bot@kernel.org>
Date: Sat, 28 May 2022 18:43:30 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailman-Approved-At: Sun, 29 May 2022 09:50:12 +1000
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
Cc: linmq006@gmail.com, rdunlap@infradead.org,
	jing.yangyang@zte.com.cn, aik@ozlabs.ru, catalin.marinas@arm.com,
	wangborong@cdjrlc.com, wangqing@vivo.com, wangxiang@cdjrlc.com,
	oohall@gmail.com, bagasdotme@gmail.com, zou_wei@huawei.com,
	hbh25y@gmail.com, hegdevasant@linux.vnet.ibm.com,
	ldufour@linux.ibm.com, baihaowen@meizu.com,
	krzysztof.kozlowski@canonical.com, zhengzucheng@huawei.com,
	wangwensheng4@huawei.com, ernel.org@lists.ozlabs.org,
	haren@linux.ibm.com, chi.minghao@zte.com.cn, yebin10@huawei.com,
	zhengbin13@huawei.com, yang.guang5@zte.com.cn, joel@jms.id.au,
	liubo03@inspur.com, kjain@linux.ibm.com, huangfq.daxian@gmail.com,
	maqianga@uniontech.com, linux-kernel@vger.k, osalvador@suse.de,
	robh@kernel.org, colin.i.king@gmail.com,
	naveen.n.rao@linux.vnet.ibm.com, yuehaibing@huawei.com,
	sohaib.amhmd@gmail.com, ajd@linux.ibm.com, arnd@arndb.de,
	jiapeng.chong@linux.alibaba.com, yukuai3@huawei.com,
	alistair@popple.id.au, chenhuang5@huawei.com, zuoqilin@yulong.com,
	linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, nathan@kernel.org,
	maddy@linux.ibm.com, clg@kaod.org, vaibhav@linux.ibm.com,
	bhelgaas@google.com, andriy.shevchenko@linux.intel.com,
	arbab@linux.ibm.com, heying24@huawei.com, hbathini@linux.ibm.com,
	dja@axtens.net, vulab@iscas.ac.cn, oss@buserror.net,
	haokexin@gmail.com, pali@kernel.org, fthain@linux-m68k.org,
	farosas@linux.ibm.com, wupeng58@huawei.com, dwaipayanray1@gmail.com,
	lv.ruyi@zte.com.cn, magalilemes00@gmail.com, Julia.Lawall@inria.fr,
	gpiccoli@igalia.com, xiam0nd.tong@gmail.com, frank.rowand@sony.com,
	fbarrat@linux.ibm.com, colin.king@canonical.com,
	akpm@linux-foundation.org, yang.lee@linux.alibaba.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	dimitri.ledkov@canonical.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 28 May 2022 22:50:19 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6112bd00e84e5dbffebc3c1e908cbe914ca772ee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
