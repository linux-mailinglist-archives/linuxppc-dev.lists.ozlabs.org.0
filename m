Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9038978836E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 11:21:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bOY8C66v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXDwF36mfz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 19:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bOY8C66v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXDvH3WNvz3c1R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 19:20:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFFEF6787A;
	Fri, 25 Aug 2023 09:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A1D2C433CD;
	Fri, 25 Aug 2023 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692955222;
	bh=RkKLK3ccBCSlvsLnPaVYJP51Ayxs+r8TXBqJBNM1MUw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bOY8C66vMnEFw/myY0Acf+rii7E+CiT439LUMG5HCLtVRGrtnMVENHIuVJ2dlO5NZ
	 /rRElSlq33DfE3AnIgmuUqZBpN6pydkwwWaDBDQxSVHOUgptu1UzY50dkzvShCDXHM
	 VWbDE+bfJohVXn7ac4Jqnmw7MeIomwWKdE7Vkk2+JSfdpK4Nw2CNNm5tsz0qnUJ8ye
	 hy+l43/uU21bMyPUVC2lFo9qhP8Z3stOB7y1kZ23vgGTFgaVsbnH5kHcD4DkpvQAAf
	 mrWr07xgkyXCUKpyvVZb9xJLIZuX0Ch9HA5H2A7dF7tv4+skdC0u/wcrflOPstlnq0
	 FAXVTGQ444Kbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65544C595C5;
	Fri, 25 Aug 2023 09:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] kunit: Fix checksum tests on big endian CPUs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169295522241.11125.1512224356582645824.git-patchwork-notify@kernel.org>
Date: Fri, 25 Aug 2023 09:20:22 +0000
References: <fe8a302c25bd0380ca030735a1383288a89adb11.1692796810.git.christophe.leroy@csgroup.eu>
In-Reply-To: <fe8a302c25bd0380ca030735a1383288a89adb11.1692796810.git.christophe.leroy@csgroup.eu>
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
Cc: netdev@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, goldstein.w.n@gmail.com, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 23 Aug 2023 15:21:43 +0200 you wrote:
> On powerpc64le checksum kunit tests work:
> 
> [    2.011457][    T1]     KTAP version 1
> [    2.011662][    T1]     # Subtest: checksum
> [    2.011848][    T1]     1..3
> [    2.034710][    T1]     ok 1 test_csum_fixed_random_inputs
> [    2.079325][    T1]     ok 2 test_csum_all_carry_inputs
> [    2.127102][    T1]     ok 3 test_csum_no_carry_inputs
> [    2.127202][    T1] # checksum: pass:3 fail:0 skip:0 total:3
> [    2.127533][    T1] # Totals: pass:3 fail:0 skip:0 total:3
> [    2.127956][    T1] ok 1 checksum
> 
> [...]

Here is the summary with links:
  - [net-next] kunit: Fix checksum tests on big endian CPUs
    https://git.kernel.org/netdev/net-next/c/b38460bc463c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


