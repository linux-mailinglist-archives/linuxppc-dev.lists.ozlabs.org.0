Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853319D58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 14:37:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450qTk4ttszDqTX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 22:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0BBs7oqz"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450qRm3j8ZzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 22:35:16 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557491713;
 bh=0ihxgez7etArzPMdt7Fob4yziLE29y2EEZW93s0R294=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=0BBs7oqzZdzDhfsBqiQPfaEKLQYGHYa0llO/ydJ/nBuswWEQP6EOoTqZmB7PxVoWX
 Wn16zvkr6I4APTv56U94gNWiYoSef8waG/b04cNKkcCrcGmFmNNpz25oHmV+yqoBk5
 QrFXHT4HQ9trAfrCZmTuQD2C8NisfGZHaulzxSQQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <874l62v6u0.fsf@concordia.ellerman.id.au>
References: <874l62v6u0.fsf@concordia.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <874l62v6u0.fsf@concordia.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.2-1
X-PR-Tracked-Commit-Id: 8150a153c013aa2dd1ffae43370b89ac1347a7fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b970afcfcabd63cd3832e95db096439c177c3592
Message-Id: <155749171372.31662.8613188433450334678.pr-tracker-bot@kernel.org>
Date: Fri, 10 May 2019 12:35:13 +0000
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
Cc: sachinp@linux.vnet.ibm.com, nathanl@linux.ibm.com, maddy@linux.vnet.ibm.com,
 aik@ozlabs.ru, mahesh@linux.vnet.ibm.com, thuth@redhat.com,
 weiyongjun1@huawei.com, leitao@debian.org, nfont@linux.vnet.ibm.com,
 paulmck@linux.ibm.com, hch@lst.de, mikey@neuling.org, horia.geanta@nxp.com,
 aneesh.kumar@linux.ibm.com, yuehaibing@huawei.com, wen.yang99@zte.com.cn,
 anju@linux.vnet.ibm.com, ganeshgr@linux.ibm.com, joel@jms.id.au,
 alastair@d-silva.org, joe@perches.com, ben@decadent.org.uk,
 valentin.schneider@arm.com, ricklind@linux.vnet.ibm.com, lvivier@redhat.com,
 jagdsh.linux@gmail.com, ajd@linux.ibm.com, laurentiu.tudor@nxp.com,
 npiggin@gmail.com, Julia.Lawall@lip6.fr, cai@lca.pw, clg@kaod.org,
 lukas.bulwahn@gmail.com, tsu.yubo@gmail.com, dvyukov@google.com,
 dja@axtens.net, lkml@sdf.org, sukadev@linux.vnet.ibm.com, malat@debian.org,
 linuxppc-dev@lists.ozlabs.org, cmr@informatik.wtf, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, andrew.donnellan@au1.ibm.com,
 fbarrat@linux.ibm.com, colin.king@canonical.com,
 Linus Torvalds <torvalds@linux-foundation.org>, tobin@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 10 May 2019 22:20:55 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b970afcfcabd63cd3832e95db096439c177c3592

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
