Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 955824BC94F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 17:30:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1DZd0D56z3cbH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 03:30:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R43a+grR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R43a+grR; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1DZ04rLVz30hm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 03:30:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58E4560AD5;
 Sat, 19 Feb 2022 16:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFBCFC340ED;
 Sat, 19 Feb 2022 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645288210;
 bh=tJVABENQLLFlTYHlBQE3dOhZT4/zn1fMVfl58sIxJLQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=R43a+grRG8B0QhD0IIMQ4Fqr5DRNE4NnCbBZ66r8KA5SCBwcaJs0QAt3zqZTj/iuF
 kqpaqwN3O3CK5RBYAdBqaiXrvk4D7CRkpYp3peVr8BfysGCP3WH+jIALK4N65sKsJx
 mREWkoqKVGWAy7q3zptqbQ82G8KoI1LwM2XLYpoP/33CAA6u2tI1YjR420GdbYcHQa
 Z+J/b7qs8sUOcOenGToVSoGwRN+zl2PqbXFWjiwGbwkdeXIn9tN5g6B6ou8erTGjkh
 lW6NCx7kYtfvCTNxB1wLcaxiKVzIVcKRQ6DbZlTtIe0FbMjfXF3MBz3qQBdApwya6P
 Pq1HYiN7HTIHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8D756E5D07D; Sat, 19 Feb 2022 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: Force inlining of checksum functions in
 net/checksum.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164528821057.2939.79120804393158510.git-patchwork-notify@kernel.org>
Date: Sat, 19 Feb 2022 16:30:10 +0000
References: <4c4e276f6491d127c61b627c9ff13f0a71dab092.1645104881.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4c4e276f6491d127c61b627c9ff13f0a71dab092.1645104881.git.christophe.leroy@csgroup.eu>
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
Cc: netdev@vger.kernel.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, kuba@kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 17 Feb 2022 14:35:49 +0100 you wrote:
> All functions defined as static inline in net/checksum.h are
> meant to be inlined for performance reason.
> 
> But since commit ac7c3e4ff401 ("compiler: enable
> CONFIG_OPTIMIZE_INLINING forcibly") the compiler is allowed to
> uninline functions when it wants.
> 
> [...]

Here is the summary with links:
  - [net,v4] net: Force inlining of checksum functions in net/checksum.h
    https://git.kernel.org/netdev/net/c/5486f5bf790b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


