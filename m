Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179A78567F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 13:11:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dIPlC9pd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW3Rx3R42z3c2k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 21:11:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dIPlC9pd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW3R545Ltz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 21:10:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B62696601B;
	Wed, 23 Aug 2023 11:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2B55C433C9;
	Wed, 23 Aug 2023 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692789023;
	bh=JZMLtoGZ+80NOQTxvx12Ihg7NRf0n6uh28eG1/8kGCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dIPlC9pdor1pQmh5bNVfqrv2LXmsLjnF3N5nszqVHwrBl8AHTD0zqunO88KxpvU6H
	 4XZZTwA3t1ujKOXZ1wo0VFL0EMfVB9ZXseq079koxC2R5U7ymjpNNPdhiRgjGJUMQw
	 Oy/I9QJmPeXRdmAWBQjqUtAcxK9MKfVJzwSnqalXLIBGQMwmIT6vRyM9o4HZfjp0/H
	 19AJ+kBNI2ksEe0fMTIAQ6aS0LtbCLyWQmv/VMwkcR1ZIIiSpQEabt0CiA3LY4cjNc
	 SSsC2rZwI/Fl/cek7MXTj88Aq8wmL7c3UFG26npaNrT/9Sqbx771gip7qqILnvv2td
	 CPSPec0/RmGkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBF20E4EAF6;
	Wed, 23 Aug 2023 11:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ibmveth: Use dcbf rather than dcbfl
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169278902283.13629.38861112100077909.git-patchwork-notify@kernel.org>
Date: Wed, 23 Aug 2023 11:10:22 +0000
References: <20230823045139.738816-1-mpe@ellerman.id.au>
In-Reply-To: <20230823045139.738816-1-mpe@ellerman.id.au>
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
Cc: netdev@vger.kernel.org, nnac123@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 23 Aug 2023 14:51:39 +1000 you wrote:
> When building for power4, newer binutils don't recognise the "dcbfl"
> extended mnemonic.
> 
> dcbfl RA, RB is equivalent to dcbf RA, RB, 1.
> 
> Switch to "dcbf" to avoid the build error.
> 
> [...]

Here is the summary with links:
  - ibmveth: Use dcbf rather than dcbfl
    https://git.kernel.org/netdev/net/c/bfedba3b2c77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


