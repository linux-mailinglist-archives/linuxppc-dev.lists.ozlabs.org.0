Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511F93FB6E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 18:40:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MxGffYre;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXkcM08Vrz3cb1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 02:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MxGffYre;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXkbg0jnJz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 02:39:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3915361B45;
	Mon, 29 Jul 2024 16:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5937C4AF0C;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271179;
	bh=ACOFD4CnvNQvgxH3c3fJIkYLBWpRIGrdoWdi94w0LGY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MxGffYremrlYV7IoL+PFdzTVghbhUmYE24NoiOXwot130hJR092fMDPljyjOFHVdc
	 BwOk8pSOjwwKbEdqNqxYUxpql4UoUKiFJ2lsCDqaei8fiv2nLmq0phzDybvS4Ruc8d
	 z/XfJg+CKgAclYeW7CbbQLEE7gLL/hM0xFPcU/zrpTnoN8mAo4/WHGmlPe/dDySyr4
	 +P5sQueNRxv+PdBs1m2FMKXNsYAKLBJPpcrqn+AXFKcM9NOrWmX7bCZDnXiuc8wZZk
	 cgjYyQYbzjQhie1m/6w7FgPL23bO3WKyoer9qNey5Cb3pqkqUfzFfvK9OYAA6SDF3G
	 K/Q0xuxSAzaPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBA0BC43613;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] sysctl constification changes for v6.11-rc1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <172227117976.3603.14526183264046270376.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:39:39 +0000
References: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
In-Reply-To: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
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
Cc: kees@kernel.org, david@fromorbit.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, mcgrof@kernel.org, mptcp@lists.linux.dev, lvs-devel@vger.kernel.org, torvalds@linux-foundation.org, coreteam@netfilter.org, kuba@kernel.org, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux@weissschuh.net, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 24 Jul 2024 23:00:14 +0200 you wrote:
> Linus
> 
> Constifying ctl_table structs will prevent the modification of
> proc_handler function pointers as they would reside in .rodata. To get
> there, the proc_handler arguments must first be const qualified which
> requires this (fairly large) treewide PR. Sending it in the tail end of
> of the merge window after a suggestion from Kees to avoid unneeded merge
> conflicts. It has been rebased on top of 7a3fad30fd8b4b5e370906b3c554f64026f56c2f.
> I can send it later if it makes more sense on your side; please tell me
> what you prefer.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] sysctl constification changes for v6.11-rc1
    https://git.kernel.org/riscv/c/f8a8b94d0698

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


