Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CC67C75
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 01:17:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45mQfh0tSZzDqmh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 09:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0zPnKG/g"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45mQch2SyQzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 09:15:15 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-1 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563059713;
 bh=65rpYORBj3P4JOejtpandAB6/rp4F11vqJUSLELNJx4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=0zPnKG/gw0szU68vN+2WHYGo+H5a8JVm3LUxpvQP0JGllDjnHOxuf3dHlVWvfHT3T
 nF8SK9PClYJsS4pIADbipVPDclh6pttJubWwOBbKXobKPlourBnetBIcCF6ZyPM+TN
 0o/AbZBO6jr6/mnmu0u0DASTAg90OGS12W/VECgY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ims6eey7.fsf@concordia.ellerman.id.au>
References: <87ims6eey7.fsf@concordia.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ims6eey7.fsf@concordia.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.3-1
X-PR-Tracked-Commit-Id: f5a9e488d62360c91c5770bd55a0b40e419a71ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 192f0f8e9db7efe4ac98d47f5fa4334e43c1204d
Message-Id: <156305971325.4281.6567702737588394599.pr-tracker-bot@kernel.org>
Date: Sat, 13 Jul 2019 23:15:13 +0000
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
Cc: geert+renesas@glider.be, aik@ozlabs.ru, schwab@linux-m68k.org,
 stewart@linux.ibm.com, gromero@linux.vnet.ibm.com,
 yamada.masahiro@socionext.com, oohall@gmail.com, blackgod016574@gmail.com,
 hch@lst.de, mikey@neuling.org, nishadkamdar@gmail.com,
 aneesh.kumar@linux.ibm.com, yuehaibing@huawei.com, krzk@kernel.org,
 anju@linux.vnet.ibm.com, rostedt@goodmis.org, sjitindarsingh@gmail.com,
 alastair@d-silva.org, naveen.n.rao@linux.vnet.ibm.com, nathanl@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com, geliangtang@gmail.com,
 groug@kaod.org, efremov@linux.com, zhangshaokun@hisilicon.com, cai@lca.pw,
 npiggin@gmail.com, dja@axtens.net, info@metux.net, atrajeev@linux.vnet.ibm.com,
 chunkeey@gmail.com, malat@debian.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 andrew.donnellan@au1.ibm.com, fbarrat@linux.ibm.com,
 sathnaga@linux.vnet.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 13 Jul 2019 14:28:00 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/192f0f8e9db7efe4ac98d47f5fa4334e43c1204d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
