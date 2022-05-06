Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D351CDE9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 03:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvXnd60hFz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mvCn57yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mvCn57yp; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvXmy3Bsgz3bqJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 11:20:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23FE262027;
 Fri,  6 May 2022 01:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18AB4C385B6;
 Fri,  6 May 2022 01:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651800015;
 bh=xBLUhiaIuo9Y1XNtDWjj6ihKn/uAitAVim+bv3+TVkQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mvCn57yphW2RvRP1GuSdLQ/oT4OCL2pFSHwPRHBRkrTBxCVwrRqRvAIi3FCby5YOj
 grp2APkhELuSojoqQf7g0vToTFxYvLV+hbZ0OrZRPGUi18uChU5Di2vU80FrK9vvoc
 BzJfcHBELy9ZpynHMc3D1R4nPrJzo7DQDsnFzcJERZ72BkKRhZg/MRmZTA4+4Zhhwr
 9NG2FaslsiCGIfBby4iaYgQp2hSzBncO5aFJXf0qdww7WAMrLa7KSIavkk1wBE/zhu
 Lns9T1IYpGjF89NyZO0cG35OGlgMvuKPUOrx8WFJTaZ+T1vnOFce+OZVm8s3j00/e9
 Xcbj13YRKxvvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F3CBCF03870; Fri,  6 May 2022 01:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ethernet: Prepare cleanup of powerpc's
 asm/prom.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165180001499.16316.17491619640124865110.git-patchwork-notify@kernel.org>
Date: Fri, 06 May 2022 01:20:14 +0000
References: <09a13d592d628de95d30943e59b2170af5b48110.1651663857.git.christophe.leroy@csgroup.eu>
In-Reply-To: <09a13d592d628de95d30943e59b2170af5b48110.1651663857.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: sukadev@linux.ibm.com, tanghui20@huawei.com, geoff@infradead.org,
 dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, tlfalcon@linux.ibm.com,
 netdev@vger.kernel.org, paulus@samba.org, drt@linux.ibm.com, kuba@kernel.org,
 pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  4 May 2022 13:32:17 +0200 you wrote:
> powerpc's asm/prom.h includes some headers that it doesn't
> need itself.
> 
> In order to clean powerpc's asm/prom.h up in a further step,
> first clean all files that include asm/prom.h
> 
> Some files don't need asm/prom.h at all. For those ones,
> just remove inclusion of asm/prom.h
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: Prepare cleanup of powerpc's asm/prom.h
    https://git.kernel.org/netdev/net-next/c/6bff3ffcf6ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


