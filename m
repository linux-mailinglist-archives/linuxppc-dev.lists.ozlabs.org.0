Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B9023F5B3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkPC3D63zDqcT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Ssqgf/b2; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNXql3v81zDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 03:47:15 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596822432;
 bh=kcH/NDN1vPtvVNxSUeDoY07A5qLCw0EcnL5TweoWvW4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Ssqgf/b2LBA/4wAAB4HtYpx/x+Lx1rt5Vp+bd/SiIIGTiIa+1Bxpph9Wnmxf7LsQw
 3YqhtMf71cf3xbDFjI0fCRgg2lCzj68336qDyN0/XKCpIP1tbcILQR4KRGJ1/nfXFI
 KyIrd86WD64feHqYK8cwUETMnxxKN1cSYtbWe/sM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h7tey4xq.fsf@mpe.ellerman.id.au>
References: <87h7tey4xq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87h7tey4xq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.9-1
X-PR-Tracked-Commit-Id: a7aaa2f26bfd932a654706b19859e7adf802bee2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25d8d4eecace9de5a6a2193e4df1917afbdd3052
Message-Id: <159682243275.18750.13117365878011380130.pr-tracker-bot@kernel.org>
Date: Fri, 07 Aug 2020 17:47:12 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:31 +1000
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
Cc: cascardo@canonical.com, desnesn@linux.ibm.com,
	gustavoars@kernel.org, srikar@linux.vnet.ibm.com,
	ego@linux.vnet.ibm.com, aik@ozlabs.ru, jniethe5@gmail.com,
	bin.meng@windriver.com, psampat@linux.ibm.com, bala24@linux.ibm.com,
	npiggin@gm, sathnaga@linux.vnet.ibm.com, lirongqing@baidu.com,
	hch@lst.de, equinox@diac24.net, leobras.c@gmail.com,
	santosh@fossix.org, maddy@linux.ibm.com, aneesh.kumar@linux.ibm.com,
	nayna@linux.ibm.com, yuehaibing@huawei.com, fbarrat@linux.ibm.com,
	fthain@telegraphics.com.au, mahesh@linux.ibm.com,
	peterz@infradead.org, anju@linux.vnet.ibm.com, geert@linux-m68k.org,
	weiyongjun1@huawei.com, alastair@d-silva.org, harish@linux.ibm.com,
	longman@redhat.com, naveen.n.rao@linux.vnet.ibm.com,
	msuchanek@suse.de, dyoung@redhat.com, vdronov@redhat.com,
	nathanl@linux.ibm.com, miltonm@us.ibm.com, palmerdabbelt@google.com,
	ajd@linux.ibm.com, arnd@arndb.de, kjain@linux.ibm.com,
	muriloo@linux.ibm.com, tj@kernel.org,
	chris.packham@alliedtelesis.co.nz, vaibhav@linux.ibm.com,
	felix@linux.ibm.com, natechancellor@gmail.com,
	hbathini@linux.ibm.com, christophe.leroy@c-s.fr,
	atrajeev@linux.vnet.ibm.com, wenxiong@linux.vnet.ibm.com,
	morbo@google.com, sbobroff@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com,
	bharata@linux.ibm.com, miaoqinglang@huawei.com,
	ail.com@lists.ozlabs.org, jk@ozlabs.org, grandmaster@al2klimov.de,
	huntbag@linux.vnet.ibm.com, joe@perches.com, oohall@gmail.com,
	kaloz@openwrt.org, Linus Torvalds <torvalds@linux-foundation.org>,
	ravi.bangoria@linux.ibm.com, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 07 Aug 2020 23:13:37 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.9-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25d8d4eecace9de5a6a2193e4df1917afbdd3052

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
