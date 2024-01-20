Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD42E833642
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 22:12:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f5fgAd8l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THThB4j9Nz3cTP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 08:12:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f5fgAd8l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THTdh3RlJz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 08:10:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DE988B80943;
	Sat, 20 Jan 2024 21:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF1CC433F1;
	Sat, 20 Jan 2024 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784997;
	bh=fjX1QcNSUSDtg3zN9eJIvh1kheAnttohq2CojBDtXqM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f5fgAd8lGmVqY/67XbUSO4Qk0dRCUMvtUJD6k/fd5iG2uct6gv2xMQ3OHM1WYZ8U2
	 ngc78M3hIIoMXED9Rhlsx50MT1WXbiTtNG6ah5EKBwBMud8j+kcgE1H0x+0FnmqSGT
	 BBTDD9MuDisjsB7prVtq2FzT7FYcqsURHqxqgW0uE6WwNcJg/7ykZhWW1w3xibUlyP
	 wX703TQTb8qu6a0/EiiGati/ykJT0BM8pyB94IT1As1Rm6DeIeWHsSDdmfkdUHpJ+M
	 Y4G5OILFVDaAC74ogXv0ePOSln8yYvcsMgVHnWJJUfV+xzzSdGzo674sw/Es00ID6Y
	 cufuVhFU3QLqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7D333D8C970;
	Sat, 20 Jan 2024 21:09:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] kexec_file: Load kernel at top of system RAM if required
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170578499750.24348.2518240009884006018.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:57 +0000
References: <20231114091658.228030-1-bhe@redhat.com>
In-Reply-To: <20231114091658.228030-1-bhe@redhat.com>
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 14 Nov 2023 17:16:56 +0800 you wrote:
> Justification:
> ==============
> Kexec_load interface has been doing top down searching and loading
> kernel/initrd/purgtory etc to prepare for kexec reboot. In that way,
> the benefits are that it avoids to consume and fragment limited low
> memory which satisfy DMA buffer allocation and big chunk of continuous
> memory during system init; and avoids to stir with BIOS/FW reserved
> or occupied areas, or corner case handling/work around/quirk occupied
> areas when doing system init. By the way, the top-down searching and
> loading of kexec-ed kernel is done in user space utility code.
> 
> [...]

Here is the summary with links:
  - [1/2] resource: add walk_system_ram_res_rev()
    (no matching commit)
  - [2/2] kexec_file: Load kernel at top of system RAM if required
    https://git.kernel.org/riscv/c/b3ba234171cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


