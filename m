Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64C1F0117
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 22:41:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dvhN13tkzDr1S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 06:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Bi8xAE5I; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dvfV2ygGzDr0y
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 06:40:18 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591389616;
 bh=3Mr3q/0wKvLsvO1QHM9nx2Hrpfoq4xQhK3q76mTUVok=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Bi8xAE5IzIiQV/FBsgxmJX+kCVJQ3J2kgNnKE5g5IOhCUFvCXiMzXDycesR++AdWb
 Yn2KelsQboGkYltrzpQwUgbDepeSEg9Jco/kU/nOQXM3GCnBb3HzIcqyUpMlw/AVDV
 qMYMYPqaqvIaycMqSiOGm+6tJOP4PmxtpUEAzajk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87eeqth3hi.fsf@mpe.ellerman.id.au>
References: <87eeqth3hi.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87eeqth3hi.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.8-1
X-PR-Tracked-Commit-Id: 1395375c592770fe5158a592944aaeed67fa94ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ae77150d94d3b535c7b85e6b3647113095e79bf
Message-Id: <159138961612.17917.10938644618812483205.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jun 2020 20:40:16 +0000
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
Cc: ego@linux.vnet.ibm.com, emmanuel.nicolet@gmail.com, chenzhou10@huawei.com,
 jniethe5@gmail.com, linuxram@us.ibm.com, kernelfans@gmail.com,
 linux-kernel@vger.kernel.org, st5pub@yandex.ru, oohall@gmail.com,
 huhai@tj.kylinos.cn, elfring@users.sourceforge.net, rzinsly@linux.ibm.com,
 leobras.c@gmail.com, mikey@neuling.org, herbert@gondor.apana.org.au,
 aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, michal.simek@xilinx.com,
 mahesh@linux.ibm.com, tiwai@suse.de, kjain@linux.ibm.com,
 leonardo@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 sfr@canb.auug.org.au, alistair@popple.id.au, npiggin@gmail.com,
 wangxiongfeng2@huawei.com, cai@lca.pw, clg@kaod.org, natechancellor@gmail.com,
 hbathini@linux.ibm.com, christophe.leroy@c-s.fr, geoff@infradead.org,
 linuxppc-dev@lists.ozlabs.org, dmitry.torokhov@gmail.com,
 gustavoars@kernel.org, wsa@kernel.org, sbobroff@linux.ibm.com,
 fbarrat@linux.ibm.com, christophe.jaillet@wanadoo.fr,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 06 Jun 2020 02:38:49 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ae77150d94d3b535c7b85e6b3647113095e79bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
