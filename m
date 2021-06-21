Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F43AF830
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 00:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G83PL4hf9z3bt2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 08:00:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jTff1tas;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jTff1tas; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G83Np62kSz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 08:00:08 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id EA40C6128C;
 Mon, 21 Jun 2021 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624312804;
 bh=vX+RaGheyY1gsEhdZsoG6F0qs/k+AUQKs69sAR768xE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jTff1tasDIgFelIUw1rB8efd+bqGw/zY7+j2UEW3aBeabY0c6j22pYpcoSgW0/CC5
 wZ1hGkVDpm7gr8zaCCiqsDtrWQ7mT+YhkEgMq3okp4yaNZsMMz0NJ4K3NG1K9rIlHD
 EuKyAt655iNB0YkzW1dsHEQJ/KMFk+BJMAyXQUqaMd2g7KCPuaM2aT4ExIVX8Sq1mp
 S/f9ZiQ1MZ/cF6ixTN6d18VDj1neaqd/0WtWSmJ/8TV7xGUyaeF1C16qv4wryZpRV5
 sPy9u+s9AsVsVyHP9ShZjHg9u55SRAZTWfn76/SlCxECF5lzbvTXtO3waAWbZd0/0S
 dLa3OZpb2+tVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E294160952;
 Mon, 21 Jun 2021 22:00:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ibmvnic: Use strscpy() instead of strncpy()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162431280392.22265.13378585860049565329.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jun 2021 22:00:03 +0000
References: <20210621213509.1404256-1-keescook@chromium.org>
In-Reply-To: <20210621213509.1404256-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, tlfalcon@linux.ibm.com,
 netdev@vger.kernel.org, paulus@samba.org, linux-hardening@vger.kernel.org,
 drt@linux.ibm.com, kuba@kernel.org, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 21 Jun 2021 14:35:09 -0700 you wrote:
> Since these strings are expected to be NUL-terminated and the buffers
> are exactly sized (in vnic_client_data_len()) with no padding, strncpy()
> can be safely replaced with strscpy() here, as strncpy() on
> NUL-terminated string is considered deprecated[1]. This has the
> side-effect of silencing a -Warray-bounds warning due to the compiler
> being confused about the vlcd incrementing:
> 
> [...]

Here is the summary with links:
  - ibmvnic: Use strscpy() instead of strncpy()
    https://git.kernel.org/netdev/net-next/c/ef2c3ddaa4ed

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


