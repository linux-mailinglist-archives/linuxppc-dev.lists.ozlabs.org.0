Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FFB97B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 21:19:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zk6773VzzF3nC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 05:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="aZNMZqq2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZjwQ5yVLzDrR4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 05:10:30 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.4-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569006627;
 bh=9hcNYCOeUOjjlOWJPMNv/mdersVEM8D++nV/WuzHo40=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=aZNMZqq2wNAmzmnDKkHHG5Ltev23VVkdsyH5uYzMxya9T5FttzjhUCMzqk6PgL1vG
 yFehh5yRIpWHgi7GWAz1tPpbz7GA818IALVPrje1K0TN57W6ggdRTB7T3KNFBelDZk
 +uI/l6TalbDkAY8h/8+t8ENoO8WCA8D9UpyVBL7c=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87blvft845.fsf@mpe.ellerman.id.au>
References: <87blvft845.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87blvft845.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.4-1
X-PR-Tracked-Commit-Id: d9101bfa6adc831bda8836c4d774820553c14942
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45824fc0da6e46cc5d563105e1eaaf3098a686f9
Message-Id: <156900662776.23740.6952253366695524692.pr-tracker-bot@kernel.org>
Date: Fri, 20 Sep 2019 19:10:27 +0000
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
Cc: ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com, adam.zerella@gmail.com,
 aik@ozlabs.ru, linuxram@us.ibm.com, maxiwell@linux.ibm.com,
 gromero@linux.vnet.ibm.com, yamada.masahiro@socionext.com, oohall@gmail.com,
 hbathini@linux.vnet.ibm.com, sukadev@linux.ibm.com, hch@lst.de,
 khandual@linux.vnet.ibm.com, hegdevasant@linux.vnet.ibm.com,
 santosh@fossix.org, aneesh.kumar@linux.ibm.com, ganeshgr@linux.ibm.com,
 jniethe5@gmail.com, tyreld@linux.ibm.com, leonardo@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com,
 andmike@linux.ibm.com, groug@kaod.org, npiggin@gmail.com, cai@lca.pw,
 clg@kaod.org, rostedt@goodmis.org, natechancellor@gmail.com,
 arbab@linux.ibm.com, hbathini@linux.ibm.com, dja@axtens.net,
 gromero@linux.ibm.com, sbobroff@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 cmr@informatik.wtf, cclaudio@linux.ibm.com, linux-kernel@vger.kernel.org,
 grimm@linux.vnet.ibm.com, jsavitz@redhat.com, stewart@linux.ibm.com,
 christophe.jaillet@wanadoo.fr, Linus Torvalds <torvalds@linux-foundation.org>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 20 Sep 2019 23:22:50 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45824fc0da6e46cc5d563105e1eaaf3098a686f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
