Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7B290C7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:56:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCcNN4FF7zDqwP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:56:20 +1100 (AEDT)
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
 header.s=default header.b=rWhZdpUM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCcLT1mT9zDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 06:54:41 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602878078;
 bh=QFu3BAz2bZ+wtyZlQSO3Y7PDdlok+paSPYFWV3EN0VQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=rWhZdpUM8jOqtH+V2d/HkDIfUuYqtZhtr4X4XigomBPbU3J1KzRBctt8xEvPP0ltv
 Pu8FtpRKIwQYGn++K24gR9/+SO/fM06auIHqmIwnf+ljIKI4LJ9sI1nXFzO8oNzfQL
 INACfkX6gYZ+Z6ifMKlxv4sxAQjfvA2+vDSryPQI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a6wmzwco.fsf@mpe.ellerman.id.au>
References: <87a6wmzwco.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a6wmzwco.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.10-1
X-PR-Tracked-Commit-Id: ffd0b25ca049a477cb757e5bcf2d5e1664d12e5d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96685f8666714233d34abb71b242448c80077536
Message-Id: <160287807796.14002.13611382514290423643.pr-tracker-bot@kernel.org>
Date: Fri, 16 Oct 2020 19:54:37 +0000
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
Cc: ego@linux.vnet.ibm.com, steve@sk2.org, srikar@linux.vnet.ibm.com,
	ravi.bangoria@linux.ibm.com, peterz@infradead.org,
	jniethe5@gmail.com, mahesh@linux.ibm.com, liushixin2@huawei.com,
	oohall@gmail.com, fthain@telegraphics.com.au, hofrat@osadl.org,
	hch@lst.de, leobras.c@gmail.com, aneesh.kumar@linux.ibm.com,
	wangwensheng4@huawei.com, joel@jms.id.au, yangyingliang@huawei.com,
	naveen.n.rao@linux.vnet.ibm.com, mrochs@linux.ibm.com,
	nathanl@linux.ibm.com, biwen.li@nxp.com, ajd@linux.ibm.com,
	sfr@canb.auug.org.au, kjain@linux.ibm.com, npiggin@gmail.com,
	cai@lca.pw, clg@kaod.org, vaibhav@linux.ibm.com, dja@axtens.net,
	atrajeev@linux.vnet.ibm.com, g@lists.ozlabs.org,
	gromero@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	cheloha@linux.ibm.com, yanaijie@huawei.com,
	linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
	zhengbin13@huawei.com, miaoqinglang@huawei.com, wsa@kernel.or,
	fbarrat@linux.ibm.com, colin.king@canonical.com,
	Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
	bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 16 Oct 2020 14:24:39 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96685f8666714233d34abb71b242448c80077536

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
