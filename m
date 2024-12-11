Return-Path: <linuxppc-dev+bounces-4000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37009ED9C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:32:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r2V5pyYz30Pl;
	Thu, 12 Dec 2024 09:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956354;
	cv=none; b=VVernZL1yCn2aFs4AEh/HY01rdcrtsmL5SnnmTcUu97ZaJ2Gsdz7elVYd/W2LjxxmSv93VsHUEaMTEFm9W6OtAmJjNepqJWEvaoG9iLAEL987vo7nIYrAQddsHr9+FzoQmfm4ADxiRtMAblr40O6PXwKV0eh9MUxLNb4AdA5Wt7Q9NW933IAKkaaVbIceGP7/V8VEbZzvcOgu5D+PSi+iapA4i52EmgFbuRNMX4EMu6IxOhlsAGSGnja+FkyWCh/KpGVjiMkcL+uILTlX/l4nkxdYEf94df+wr0lpDsl7390p2b889H+DikIexbeEKLcgbET93MUhBxlUvzAroiQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956354; c=relaxed/relaxed;
	bh=ryjrakl9bAirYB8Swa1Mz7aOUdVKkjHl/K2fh3pI4Ic=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DIwzmp441Kp+2s2mAqJUipq8Z4j7A4v0ZlrJdKUA9lULCfmvv1i+ftWFR6H5mtvY4VoOfCfxSXlFRsqHZbmxggdMTT9WyL8dSjWx/jaAoNS+vw/2ACyeJ9R+erFG745rC/uz7wBgZOtLrityE1tpLGL0CVXioDRZc8HI53eUCcdwlbZDgRZYzROHC6Zi8HtjpW/NJ2lAKc+s6yaEbcdbfduwZ0fa2t89rCBMQ/4EqTd88Kf7c0BR5/ZlPgI1+IOdj5TqKQNbQVKCGI/M1fNlqzBnes/OYNAvae3A6Ff/TpHSdvVuFmVZ6o77xrFGxVFjpVpCFiN3pbnAyMxCBoYL+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nPOtlX5T; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nPOtlX5T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r2T5nbyz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 09:32:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 820405C67EF;
	Wed, 11 Dec 2024 22:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31DDC4CED3;
	Wed, 11 Dec 2024 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956351;
	bh=k0MtyxDbbtsm27qvkqsKV+jrSIBDfJRGa0WHRKH9KWs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nPOtlX5TKBph2olV5g0D84w7BiGXyaTzX/kmSl/KB3xl8BPQoIcxG64kiVppaKWV6
	 UuVYIQk2nmWnJhIowxxs3i7Ezo4bFvlmC27nFpPkM/jb80vyzHBEMsDiWlhHJUBmrV
	 E4nuPLnavEZNBvgxCnxSG/erFAKypXE58/ddSXOGTSgdiPaf+RxWJKbmenqt6qmjdG
	 RpQEsDlCvg4cySX8p8aQt/+bGgUkkoqZuHIfhgpxn+qXexNXcqJewICJNI3vp9PVla
	 22tDI2SHe01OOAbfoiss8OadArWzPpX9wRC6bdennXUaIn34M8kF/jHgNGbizmzpuY
	 lZsn8ISnWGPaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEED380A965;
	Wed, 11 Dec 2024 22:32:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395636750.1729195.6853192666319119853.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:47 +0000
References: <20241023171426.452688-1-usamaarif642@gmail.com>
In-Reply-To: <20241023171426.452688-1-usamaarif642@gmail.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, mark.rutland@arm.com,
 will@kernel.org, leitao@debian.org, catalin.marinas@arm.com,
 tglx@linutronix.de, chris@zankel.net, saravanak@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Wed, 23 Oct 2024 18:14:26 +0100 you wrote:
> __pa() is only intended to be used for linear map addresses and using
> it for initial_boot_params which is in fixmap for arm64 will give an
> incorrect value. Hence save the physical address when it is known at
> boot time when calling early_init_dt_scan for arm64 and use it at kexec
> time instead of converting the virtual address using __pa().
> 
> Reported-by: Breno Leitao <leitao@debian.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> 
> [...]

Here is the summary with links:
  - [v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
    https://git.kernel.org/riscv/c/b2473a359763

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



