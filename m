Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57B0833632
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 22:10:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L2rcdUCV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THTfP6Ds5z3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 08:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L2rcdUCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THTdX0SLHz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 08:09:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 52850B801B8;
	Sat, 20 Jan 2024 21:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DCC9C43390;
	Sat, 20 Jan 2024 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784987;
	bh=eTLr4dy/uLuhEZDSb8RfdP2ShpbC5ub3YzsOlB3z738=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L2rcdUCVcDzOWn4Bg5S9EC1E2ulioUxc9CfH4ixgBvNXMr43iVg8K2rDLBlXN6hgN
	 vfNqwW5kWUqsXpVgY+wcBKjzzLbfJ/wHXLvIYXeBmg7t8/6EvA4QYoak48KaE+j/x8
	 lmnoqo+r1LcL7vqDDaPszC3IC5d48QHizq0iBOklFmos6nie6hg/3rQbfXQzXRSIsC
	 4wSPQrJB/JODPKeDz2+Hsy3ynf1vnoIH+JS71tJlB4/lUhQTXbfCY4KWD91DHL08Ub
	 6NnxzmBVBW+i1Svnfg58mBoUe+uYY3tov4jL6JVC8GrErk7qDYXH44wX+Jx14G668P
	 xaQOEg/YnDowQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 874E3D8C96C;
	Sat, 20 Jan 2024 21:09:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when retrying
 under per-VMA lock
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:47 +0000
References: <20231226214610.109282-1-surenb@google.com>
In-Reply-To: <20231226214610.109282-1-surenb@google.com>
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: linux-s390@vger.kernel.org, agordeev@linux.ibm.com, x86@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org, willy@infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, luto@kernel.org, linux-riscv@lists.infradead.org, gerald.schaefer@linux.ibm.com, will@kernel.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 26 Dec 2023 13:46:10 -0800 you wrote:
> A test [1] in Android test suite started failing after [2] was merged.
> It turns out that after handling a major fault under per-VMA lock, the
> process major fault counter does not register that fault as major.
> Before [2] read faults would be done under mmap_lock, in which case
> FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
> mm_account_fault() to account the fault as major once retry completes.
> With per-VMA locks we often retry because a fault can't be handled
> without locking the whole mm using mmap_lock. Therefore such retries
> do not set FAULT_FLAG_TRIED flag. This logic does not work after [2]
> because we can now handle read major faults under per-VMA lock and
> upon retry the fact there was a major fault gets lost. Fix this by
> setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
> VM_FAULT_MAJOR was returned. Ideally we would use an additional
> VM_FAULT bit to indicate the reason for the retry (could not handle
> under per-VMA lock vs other reason) but this simpler solution seems
> to work, so keeping it simple.
> 
> [...]

Here is the summary with links:
  - [1/1] arch/mm/fault: fix major fault accounting when retrying under per-VMA lock
    https://git.kernel.org/riscv/c/46e714c729c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


