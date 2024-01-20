Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04483364D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 22:12:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBabWffU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THTj52JYwz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 08:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBabWffU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THTdj1Gxpz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 08:10:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 83CD9B80944;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3417AC43330;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784998;
	bh=Mh4+2rjEl/tfirk6ZrJJo/+D3Z21pmSdnoQgsLi3+Hc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gBabWffUhXIzoKs5sudLgHP01fwVoOZ8G8XJppwrSIIqTXd2XYdNBCXywvJDVmaR0
	 VQwuvGapishRyDTmmjTM7bUqzXJpyjK1h9SC1IaTrGptzQuCxjz7cLGSVqLdkBWQRC
	 u+x7wG5sj4K1RWc1aYbazrFCRwmJWgCgVz0cT4BIYB4v4S9b6GrU/rO9S/reHa6wof
	 N4QLgOaSg5v+YyptWT1v0cTgFIuK8vPMo5HUtXA80XG+dGvgSS6WLvRIwqNAUwD8ZI
	 dyzIoechWjSaFhyqfCz2xhvbCtFX2PGS9rCj03lLMuj84C855CJQHmfdu7ymB7dMmg
	 9WOYs+ahTvD2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23795D8C970;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] resource: add walk_system_ram_res_rev()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170578499814.24348.4213715182572913470.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:58 +0000
References: <ZVTA6z/06cLnWKUz@MiWiFi-R3L-srv>
In-Reply-To: <ZVTA6z/06cLnWKUz@MiWiFi-R3L-srv>
To: Baoquan He <bhe@redhat.com>
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, takahiro.akashi@linaro.org, ebiederm@xmission.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 15 Nov 2023 21:00:27 +0800 you wrote:
> This function, being a variant of walk_system_ram_res() introduced in
> commit 8c86e70acead ("resource: provide new functions to walk through
> resources"), walks through a list of all the resources of System RAM
> in reversed order, i.e., from higher to lower.
> 
> It will be used in kexec_file code to load kernel, initrd etc when
> preparing kexec reboot.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] resource: add walk_system_ram_res_rev()
    https://git.kernel.org/riscv/c/7acf164b259d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


