Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC387D7C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 02:13:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h84tYYEe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxNRX5YCVz3vXr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 12:13:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h84tYYEe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxNQk56sSz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 12:13:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19119CE219B;
	Sat, 16 Mar 2024 01:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6C1C433C7;
	Sat, 16 Mar 2024 01:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710551577;
	bh=AYCpYaUfYmtFgIobyEWOgpa5ZUdwm5RXbFeSBnlEDwk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h84tYYEeo4qYwUjyz8OYNbeEn9VgoRxng/MbOCQsWKKR6GFYmf0O0yeuQs5J/iWTH
	 F5Tb2i75RGoC4bi1Zsk7T3rMddB0CUpmHMr3pd1gsMKk2L1brB0uqZ2ifljd1hf+DP
	 mo8enxXBH+8mvhHJhBkWXiW32zcYT0GwPF/Xmoe948vE3RHZny9N4i3DIE3o4qaBrA
	 WtmrXnajqxzOv/M/X4OliZSdetOVYprzKeVlmVg+vbgOUeXYcSFrWQ+6gX82cLJLc+
	 shzWC9CxNdm0zmU5nPYVC3q1iQ2M9Nz+E45HIqXFQjVb8lWkcYtykBGdQXkriuFUx6
	 P+tSL0MJs6Rsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41AB0D95060;
	Sat, 16 Mar 2024 01:12:57 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h6h72h38.fsf@mail.lhotse>
References: <87h6h72h38.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87h6h72h38.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-1
X-PR-Tracked-Commit-Id: 9db2235326c4b868b6e065dfa3a69011ee570848
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 66a27abac311a30edbbb65fe8c41ff1b13876faa
Message-Id: <171055157726.25988.1346643204579685627.pr-tracker-bot@kernel.org>
Date: Sat, 16 Mar 2024 01:12:57 +0000
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
Cc: chentao@kylinos.cn, szabolcs.nagy@arm.com, set_pte_at@outlook.com, ricardo@marliere.net, maddy@linux.ibm.com, damien.lemoal@opensource.wdc.com, u.kleine-koenig@pengutronix.de, kuba@kernel.org, adhemerval.zanella@linaro.org, arnd@arndb.de, kjain@linux.ibm.com, sshegde@linux.ibm.com, npiggin@gmail.com, nathan@kernel.org, sv@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linqiheng@huawei.com, linux-kernel@vger.kernel.org, zeming@nfschina.com, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 16 Mar 2024 10:47:07 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/66a27abac311a30edbbb65fe8c41ff1b13876faa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
