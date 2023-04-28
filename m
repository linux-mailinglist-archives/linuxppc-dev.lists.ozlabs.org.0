Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5E6F2137
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 01:37:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7TY11F5Qz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 09:37:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z09KZHaX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z09KZHaX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7TX74rytz3c4w
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 09:36:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5E1060B45;
	Fri, 28 Apr 2023 23:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29A93C433EF;
	Fri, 28 Apr 2023 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682724996;
	bh=XurUeSlKNZhVDNCbTUd5IhHGXcISaZBPu0X6iMHWDyU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Z09KZHaXYwwXqLnSU87OqwCRhZX8tkXeIx2cFI6m7gwbhOQ0MvQ9MMq6aNs7wMxmd
	 rOLzypJN3YFkxZVtSbjy3xwshJfzVtdNypi6GQ0aILJ0sQ4GGJQWTcvwOj6LuXAfyR
	 lCj0ZbUO+N0lvHYNd8/9SXTr215wOYreFrrlLTFEePhRN2syPHPzAIcEzOM7o5qhHK
	 3sTBgrs3en/ow9XJQ42LZoEai4eeLn/K8U3Sq+6Bn4d24Cq0pn/JR4f0yqx7bAXsSO
	 RTEFuOj6es/t46B9rQkKcJfBEVdd465nlhesrzDhsdvCrPFEUzn68TLAYu6iCQWUao
	 u4ihpsFQYvIVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13E55C41677;
	Fri, 28 Apr 2023 23:36:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fs8k734t.fsf@mail.concordia>
References: <87fs8k734t.fsf@mail.concordia>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87fs8k734t.fsf@mail.concordia>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-1
X-PR-Tracked-Commit-Id: 169f8997968ab620d750d9a45e15c5288d498356
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7
Message-Id: <168272499607.24865.5167458035940101849.pr-tracker-bot@kernel.org>
Date: Fri, 28 Apr 2023 23:36:36 +0000
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
Cc: arkamar@atlas.cz, aik@ozlabs.ru, paul.gortmaker@windriver.com, bgray@linux.ibm.com, ira.weiny@intel.com, robh@kernel.org, mikey@neuling.org, windhl@126.com, mcgrof@kernel.org, nicholas@linux.ibm.com, joel@jms.id.au, liubo03@inspur.com, kconsul@linux.vnet.ibm.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, nathan@kernel.org, alex.williamson@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, rdunlap@infradead.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, tpearson@raptorengineering.com, nysal@linux.ibm.com, seanjc@google.com, pali@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 28 Apr 2023 19:44:02 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
