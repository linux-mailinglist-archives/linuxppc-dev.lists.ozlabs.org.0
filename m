Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCB650D4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 15:31:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbMZd6q6wz3c72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 01:31:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xd+urscR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xd+urscR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbMYg4Sv2z3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 01:30:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21D20B80E49;
	Mon, 19 Dec 2022 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B786FC4339E;
	Mon, 19 Dec 2022 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671460209;
	bh=4qt2LdLz5LaKTFbclb/By7tWRXSEqkT58KyX1VO652U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Xd+urscRAQmKR2F0rse4vov2EzeoNBIy79hZupkPFi5yweEeFK0uaxiQ4fJL3pUo/
	 TH+brC5ttgC/vTj6aAGXa/HkjVpdZ3aTAyYPTN/BupjWOfF0T97cvsucSMHVGtWUP3
	 a8I94z70eAe377AjWLY8LO+8CoFKkzB+C8FOj2f0LuJwy8GqV7ENzvoQ/2VGJes1pv
	 7wcawQqoEsZLE7JOf5rczyF3sgVvzoZHMsPulvPW4/Tv6AyFDR46X+pHJGqpTv5gzs
	 hlwFFS+ebT/WcjerhJNHlA6LyHGBA2SuTQU9mig+Ni5XcZfy8U4QHhpIeJgZep41Ai
	 qwskBs0MKlXeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1A9EE21EF8;
	Mon, 19 Dec 2022 14:30:09 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wn6ohwnl.fsf@mpe.ellerman.id.au>
References: <87wn6ohwnl.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87wn6ohwnl.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-1
X-PR-Tracked-Commit-Id: 980411a4d1bb925d28cd9e8d8301dc982ece788d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f6e430f931d245da838db3e10e918681207029b
Message-Id: <167146020965.28969.16560020138959752454.pr-tracker-bot@kernel.org>
Date: Mon, 19 Dec 2022 14:30:09 +0000
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
Cc: linmq006@gmail.com, steve@sk2.org, geert+renesas@glider.be,
	peterz@infradead.org, jniethe5@gmail.com,
	linux-kernel@vger.kernel.org, nicholas@linux.ibm.com,
	cmr@bluescreens.de, bgray@linux.ibm.com, rdunlap@infra,
	yangtiezhu@loongson.cn, hch@lst.de, sfr@canb.auug.org.au,
	ldufour@linux.ibm.com, baihaowen@meizu.com, chenxuebing@jari.cn,
	nayna@linux.ibm.com, jiaming@nfschina.com, mcgrof@kernel.org,
	mjeanson@efficios.com, yangyingliang@huawei.com, joel@jms.id.au,
	liubo03@inspur.com, chenlifu@huawei.com,
	u.kleine-koenig@pengutronix.de, naveen.n.rao@linux.vnet.ibm.com,
	colin.i.king@gmail.com, nathanl@linux.ibm.com, studentxswpy@163.com,
	dead.org@lists.ozlabs.org, ajd@linux.ibm.com, xiujianfeng@huawei.com,
	aboorvad@linux.vnet.ibm.com, linux@weissschuh.net,
	wangdeming@inspur.com, npiggin@gmail.com, rmclure@linux.ibm.com,
	christophe.jaillet@wanadoo.fr, rostedt@goodmis.org,
	bhelgaas@google.com, disgoel@linux.vnet.ibm.com, jpoimboe@kernel.org,
	dengshaomin@cdjrlc.com, pali@kernel.org, fthain@linux-m68k.org,
	geoff@infradead.org, linuxppc-dev@lists.ozlabs.org,
	dmitry.torokhov@gmail.com, gustavoars@kernel.org,
	Julia.Lawall@inria.fr, kjain@linux.ibm.com, zeming@nfschina.com,
	fbarrat@linux.ibm.com, sv@linux.ibm.com,
	Linus Torvalds <torvalds@linux-foundation.org>, ruanjinjie@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Mon, 19 Dec 2022 14:58:38 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f6e430f931d245da838db3e10e918681207029b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
