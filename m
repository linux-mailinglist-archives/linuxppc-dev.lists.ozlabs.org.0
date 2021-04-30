Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167F37015E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 21:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX2kB3dVJz300Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 05:39:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F3L610vR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F3L610vR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX2jk1wM9z2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 05:38:50 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 86A636146D;
 Fri, 30 Apr 2021 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619811525;
 bh=prevvquMQad1iKc+Q61AiVTlFP+5a6b0Bb82z59oqIo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=F3L610vRGq5ve5N4OTCm4+tfqZF82gXDvkX1PHAPX+lSguuFiIna4hyTWP2zFrHq2
 yQ2KjIlPU05LAzR+Ksau6mDH2apGxydZFct6o/Myn9UHEprxSraVhURzlcypkQVWiE
 g9SMiiRD405Z/AYVqrS52m/8dy1RY4BerRa2XzCDXqWNkvoHk5Q+9ymOPICF3lWhTg
 wknv3SM0wwBdPW6L4dxvVm8Lt4s1kOP/v7VhThu9JQZHaywwcP8RRgj/Dc7dKtG2Pt
 mBX0AzRhx/xp2qFJzOiBF7aHp3kDsk5mtZREHKcTZIkLeVETq1Lmt7G1FWXgPAJWuI
 kwhSbMjyjNT0A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6A88360A3A;
 Fri, 30 Apr 2021 19:38:45 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87im44a087.fsf@mpe.ellerman.id.au>
References: <87im44a087.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87im44a087.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.13-1
X-PR-Tracked-Commit-Id: 5256426247837feb8703625bda7fcfc824af04cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c70a4be130de333ea079c59da41cc959712bb01c
Message-Id: <161981152537.3374.17497450277630518410.pr-tracker-bot@kernel.org>
Date: Fri, 30 Apr 2021 19:38:45 +0000
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
Cc: cascardo@canonical.com, tony.ambardar@gmail.com, srikar@linux.vnet.ibm.com,
 sbhat@linux.ibm.com, tyreld@linux.ibm.com, aik@ozlabs.ru, jniethe5@gmail.com,
 bigeasy@linutronix.de, cmr@codefail.de, avagin@gmail.com,
 sandipan@linux.ibm.com, lee.jones@linaro.org, jiapeng.chong@linux.alibaba.com,
 dave@stgolabs.net, unixbhaskar@gmail.com, lkp@intel.com, dima@arista.com,
 aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, danielhb413@gmail.com,
 haren@linux.ibm.com, dingsenjie@yulong.com, ganeshgr@linux.ibm.com,
 geert@linux-m68k.org, naveen.n.rao@linux.vnet.ibm.com, nathanl@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, elver@google.com, ajd@linux.ibm.com,
 leobras.c@gmail.com, chenhuang5@huawei.com, efremov@linux.com,
 nathan@kernel.org, maddy@linux.ibm.com, cuibixuan@huawei.com, clg@kaod.org,
 pulehui@huawei.com, yukuai3@huawei.com, ldufour@linux.ibm.com,
 heying24@huawei.com, colin.king@canonical.com, dja@axtens.net,
 christophe.leroy@c-s.fr, atrajeev@linux.vnet.ibm.com, sxwjean@gmail.com,
 linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, npiggin@gmail.com,
 mahesh@linux.ibm.com, lihuafei1@huawei.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, zhang.yunkai@zte.com.cn, yang.lee@linux.alibaba.com,
 fbarrat@linux.ibm.com, vaibhav@linux.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 30 Apr 2021 14:02:32 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c70a4be130de333ea079c59da41cc959712bb01c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
