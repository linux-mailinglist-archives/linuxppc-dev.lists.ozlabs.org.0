Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 853B77AA9F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:21:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Atu0Tq/P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNwn387gz3dtZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 17:21:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Atu0Tq/P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNvv5XJWz3djt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 17:20:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F8B3B8225A;
	Fri, 22 Sep 2023 07:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2506C433C7;
	Fri, 22 Sep 2023 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695367223;
	bh=5hO3aI2VEexFfns3lA0Y+k0/kuTBVoUzUD98Od7nlTA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Atu0Tq/PtuTxuaHw/uaAPqCVh4WYpjYInukeDnGzB1Y3UcAojbBeir9m753InRXVY
	 mhPy3jKSxiTUXfphd7kR820Z1bOZ8vMlSEOdNYhwpgozXiUDTLhwQOyDjvKSnfunuA
	 4zCpA97fHtIlILwvKK3TNbkcSWpoiOgszB3SY1wJpZfDp5tgMljL3sdihe/tW5fWKz
	 dJjCQCeyQk6D+zAqmvin8RSmRxEet44wWBrTMqXXhAx6QQTRLDtU1q0PrufvNdHKfL
	 odYA25hDMnTeQi/tgw4LtJk+3meW/OzNsdBASw0pzsp8WahC2YGnKi3TtSXiDANHYF
	 igU/U0SDRFw6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3763E11F5C;
	Fri, 22 Sep 2023 07:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] drivers/net: process the result of hdlc_open() and add
 call of hdlc_close() in uhdlc_close()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169536722279.5471.17948488671485747315.git-patchwork-notify@kernel.org>
Date: Fri, 22 Sep 2023 07:20:22 +0000
References: <20230919142502.13898-1-adiupina@astralinux.ru>
In-Reply-To: <20230919142502.13898-1-adiupina@astralinux.ru>
To: Alexandra Diupina <adiupina@astralinux.ru>
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 19 Sep 2023 17:25:02 +0300 you wrote:
> Process the result of hdlc_open() and call uhdlc_close()
> in case of an error. It is necessary to pass the error
> code up the control flow, similar to a possible
> error in request_irq().
> Also add a hdlc_close() call to the uhdlc_close()
> because the comment to hdlc_close() says it must be called
> by the hardware driver when the HDLC device is being closed
> 
> [...]

Here is the summary with links:
  - [v5] drivers/net: process the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()
    https://git.kernel.org/netdev/net/c/a59addacf899

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


