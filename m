Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1457A8C8A30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 18:36:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ahssRdDg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgt07443tz3cQL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 02:36:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ahssRdDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgszP3CM4z30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 02:36:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C1AE61DE1;
	Fri, 17 May 2024 16:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA46FC2BD10;
	Fri, 17 May 2024 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715963772;
	bh=SA6WO6wNzW2Iok4qw34x8REiV/41ClfAvnMomEMrciA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ahssRdDg4ghSC6x+Gl5lUorgLx9jf8XwCtJI5toNyEiXwWwKQqlHz63GVxQH85fwR
	 ktc74SrUobqjqWQeLQezEt464xxohE+FGH5XLZfQNnKCE6FxeEgYpMDeca4hT+h+Py
	 UxOBEHttEfl03r6xcJxGkl+hrBkNmK4ORCR6Hkalj+gN3rGFadDBw8DkCcbFXL+4VV
	 qPCcNRDxA/0CLxTxMIQ9mL1Bhx8MLsoykbUu73XP3SVLrUvaFSGvp2q1k+VenHMS1t
	 MF8301CHcUPq5sjiU1KaUWThnvmTHr5n9mstqtZENaueaD2E7e58wE2SuPhPedmvsf
	 PCIf7+7iSJvmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA764C54BB2;
	Fri, 17 May 2024 16:36:12 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <8734qgwsap.fsf@mail.lhotse>
References: <8734qgwsap.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <8734qgwsap.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-1
X-PR-Tracked-Commit-Id: 61700f816e6f58f6b1aaa881a69a784d146e30f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff2632d7d08edc11e8bd0629e9fcfebab25c78b4
Message-Id: <171596377280.8029.9881035055421932996.pr-tracker-bot@kernel.org>
Date: Fri, 17 May 2024 16:36:12 +0000
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
Cc: ritesh.list@gmail.com, chentao@kylinos.cn, linux-kernel@vger.kernel.org, lidong.zhong@suse.com, thorsten.blum@toblux.com, bgray@linux.ibm.com, sfr@canb.auug.org.au, maddy@linux.ibm.com, matthias.schiffer@ew.tq-group.com, bhe@redhat.com, masahiroy@kernel.org, nicholas@linux.ibm.com, guozihua@huawei.com, aneesh.kumar@kernel.org, ganeshgr@linux.ibm.com, joel@jms.id.au, colin.i.king@gmail.com, nathanl@linux.ibm.com, prosunofficial@gmail.com, linux@treblig.org, arnd@arndb.de, sshegde@linux.ibm.com, groug@kaod.org, nathan@kernel.org, christophe.jaillet@wanadoo.fr, bhelgaas@google.com, andriy.shevchenko@linux.intel.com, hbathini@linux.ibm.com, xiaowei.bao@nxp.com, geoff@infradead.org, linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, ghanshyam1898@gmail.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com, leoyang.li@nxp.com, yang.lee@linux.alibaba.com, naveen@kernel.org, vaibhav@linux.ibm.com, ran.wang_1@nxp.com, Linus Torvalds <torvalds@linux-foundation.org>, jsavitz@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 17 May 2024 22:12:46 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff2632d7d08edc11e8bd0629e9fcfebab25c78b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
