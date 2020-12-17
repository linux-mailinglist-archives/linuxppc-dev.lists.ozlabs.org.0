Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 602872DDAEE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 22:46:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxltR3wsmzDqWq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 08:46:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NuekjydN; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxlrL0x46zDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 08:44:17 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608241454;
 bh=yDaT+y9l9aimHmbslfpMN97U03h9cNNDggqbUiQNKdM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=NuekjydNQHdI8Kh22vra0jetIyqGpz3oOxuZkIJWRj2km8Fo7w0Go3KEhEnSIZkNY
 OQUTkGH/4GNzm+8VJuQLEUCLuWehIu7cmSnIgst6AxFIsUBedwWO542rwy7vPou/gJ
 2B75oZUjrTXdMNPPkXzIePextDmbvx2lbvZahGlFihC/Z9ZmnZxm6wMt0Pp6ro/2mV
 w7of5cBA/qKV3U+YyW/snJ01MziMzidPwpLOvAu+NY/Se3I6gG1ygK29vePNXDifcx
 Eb8hy+oogjxFsNifl7WFkHlh26248FdY8fT5t5Yxm+8yUGGsaX3mm9lWRvhy8HYw0r
 QSIK4z6hy9l6g==
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r1noy325.fsf@mpe.ellerman.id.au>
References: <87r1noy325.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87r1noy325.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.11-1
X-PR-Tracked-Commit-Id: c1bea0a840ac75dca19bc6aa05575a33eb9fd058
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8a5be36b9303ae167468d4f5e1b3c090b9981396
Message-Id: <160824145406.19561.14544299547675584528.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 21:44:14 +0000
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
Cc: ego@linux.vnet.ibm.com, clombard@linux.vnet.ibm.com, david@redhat.com,
 aik@ozlabs.ru, jniethe5@gmail.com, bala24@linux.ibm.com, oohall@gmail.com,
 morbo@google.com, ardb@kernel.org, srikar@linux.vnet.ibm.com,
 leobras.c@gmail.com, maddy@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 miaoqinglang@huawei.com, vincent.stehle@laposte.net, tiwai@suse.de,
 ganeshgr@linux.ibm.com, u.kleine-koenig@pengutronix.de, harish@linux.ibm.com,
 longman@redhat.com, nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 ajd@linux.ibm.com, amodra@gmail.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, oss@buserror.net, mathieu.desnoyers@efficios.com,
 clg@kaod.org, colin.king@canonical.com, ldufour@linux.ibm.com,
 tangyouling@loongson.cn, po-hsu.lin@canonical.com, dja@axtens.net,
 atrajeev@linux.vnet.ibm.com, Kees Cook <keescook@chromium.org>,
 zhangxiaoxu5@huawei.com, oleg@redhat.com, tyreld@linux.ibm.com,
 linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, kaixuxia@tencent.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 18 Dec 2020 00:28:34 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8a5be36b9303ae167468d4f5e1b3c090b9981396

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
