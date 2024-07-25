Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319093C9AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 22:37:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WDfnaRaD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVN463pF6z3d8R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 06:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WDfnaRaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVN3R038wz3cnK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 06:37:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97EB361277;
	Thu, 25 Jul 2024 20:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CAA4C116B1;
	Thu, 25 Jul 2024 20:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721939822;
	bh=1R5Crw+ZwZOXSfA6dztHaSXevEbv/z06Mpcq8ujXfGo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WDfnaRaDNE+J6fLuQmaWOq0eu4xt8vrjpGpgzKf8awCk2ncc3CtJgaCG0Hqj7mkzH
	 UoFpaBz93eVtipyG7XwIyy+aPOZYvlKkx1jddyRJ33g8V5sFd8c9Q3jnneNP0+8L+E
	 NwzfV4Rx4Ab66C8XgUABs2FgDwBVgWRoEApitYsOBdYg7Tnv1u5ABobfseBFKMtQOK
	 ySj1sRI+LhTGkJXU5EpVQVAoDpnvqbzNBYZssQddaZNq//Vz+4W7SbGbuq+4pNQLH+
	 8GL0GHV5QZqFASUwymJc8KCwqU5es4tPtX5yD7rDzhKENPx1+lVxXt/x771BGahmYW
	 0G8q9ZQ+NQoLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DA87C43445;
	Thu, 25 Jul 2024 20:37:02 +0000 (UTC)
Subject: Re: [GIT PULL] sysctl constification changes for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
References: <CGME20240724210020eucas1p2db4a3e71e4b9696804ac8f1bad6e1c61@eucas1p2.samsung.com> <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
X-PR-Tracked-List-Id: <linux-s390.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/ tags/constfy-sysctl-6.11-rc1
X-PR-Tracked-Commit-Id: 78eb4ea25cd5fdbdae7eb9fdf87b99195ff67508
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b485625078cab3b824a84ce185b6e73733704b5b
Message-Id: <172193982217.17931.952471986314376816.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jul 2024 20:37:02 +0000
To: Joel Granados <j.granados@samsung.com>
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
Cc: Joel Granados <j.granados@samsung.com>,
	Kees Cook <kees@kernel.org>, Dave Chinner <david@fromorbit.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-sctp@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>, mptcp@lists.linux.dev,
	lvs-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	coreteam@netfilter.org, Jakub Kicinski <kuba@kernel.org>,
	apparmor@lists.ub, linux-trace-kernel@vger.kernel.org,
	bridge@lists.linux.dev, untu.com@lists.ozlabs.org,
	linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	kexec@lists.infradead.org,
	Thomas =?utf-8?B?V2Vp77+9c2NodWg=?= <linux@weissschuh.net>,
	linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Wed, 24 Jul 2024 23:00:14 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/ tags/constfy-sysctl-6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b485625078cab3b824a84ce185b6e73733704b5b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
