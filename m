Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C28CC9CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 01:41:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nnrWrKxA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vl7003dwQz78hN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 09:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nnrWrKxA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl6zG0YVzz3gFk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 09:32:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A02F62BF7;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A476C32782;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=DMZ8A416rj3K/WIir9WPtL3TV/SPPZCOPyqRSy00irs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nnrWrKxAo9mkqq71SM15auqRvSuvMo1cwsc6uvNC0KmIf+8W+IFcGygA3Eo10mVeF
	 G2s+yrZMHPymUXLo+nLgP9UO7ySUEsYIr50vVERehi9hXlgnqcVX15e5hUtoNM1MCz
	 KdnJ408xiD+Wl9pXpBy3F6o9nfLEvLRX7/+b2odzWwlKArAQUij/s2m/3Jjh97LXPg
	 F8nJXMua61Qqa3D8YshT5wUFNBblfy5aUQ+sDx/fnkyS8EUbkRV5Kgi4KlL/y5Jmh6
	 7bCukgmu47qPQMBbXvCJyTY00enK+zaAd4j5um3XBgM7w9fHKYmb4gx7qdCy7Br/vb
	 fDCO7Xn+t58qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7625CC43638;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <171642074348.9409.15455041633304152397.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
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
Cc: mark.rutland@arm.com, x86@kernel.org, dave.hansen@linux.intel.com, James.Bottomley@HansenPartnership.com, guoren@kernel.org, linux-csky@vger.kernel.org, hpa@zytor.com, agordeev@linux.ibm.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-parisc@vger.kernel.org, kernel@xen0n.name, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masami Hiramatsu (Google) <mhiramat@kernel.org>:

On Wed,  1 May 2024 09:29:56 -0700 you wrote:
> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.
> 
> This behavior can be reproduced quite easily, by creating a kprobe and
> then triggering a ftrace_kill(). For simplicity, we can simulate an
> ftrace error with a kernel module like [1]:
> 
> [...]

Here is the summary with links:
  - [v3] kprobe/ftrace: bail out if ftrace was killed
    https://git.kernel.org/riscv/c/1a7d0890dd4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


