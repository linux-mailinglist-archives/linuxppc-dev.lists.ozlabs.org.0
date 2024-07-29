Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126893FB90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 18:43:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FQESavfQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXkgn3krWz3cgl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 02:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FQESavfQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXkg53Z9Nz3cW4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 02:42:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2FECCE0E04;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 219B9C4AF09;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271357;
	bh=mA3Plo9rccbKR8tQpMvqb5/37K14bOyxIOzFzkCyo2w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FQESavfQWIyHKftqPvTmy4wVhUA6HIJqwcdczB7gzKs7W9HP4VgXBcAvnS2OY1QPQ
	 6v8azN0AnBdvEUaiuvvYn24UYpSAPhOt9Kc8PnA5pAQgRzOyjZDqBpRpAggC47L+YO
	 3pDtCbTERg/BZjIP98WKxyLB+Jl8i0jRFbFjiovwHjjJOglSPdvIoPPigoU6llsN7p
	 NnUKMTJeRMcEWdczEcxBDiNNs1O1d1p7FYZtvzItkwiDmtNqDhaPHf3wXrrW8U4yYI
	 kgmuh8yjEhzjRpHcoAw7LVo1omVPzA9Do3we2wqTVe6+zyxFoijU6kc6a1Jy9HiSUh
	 MFjtM1ssSTzFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0CA11C43445;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] sysctl constification changes for v6.11-rc1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <172227135704.3603.7348565051958076479.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:42:37 +0000
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

This pull request was applied to riscv/linux.git (for-next)
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
    https://git.kernel.org/riscv/c/b485625078ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


