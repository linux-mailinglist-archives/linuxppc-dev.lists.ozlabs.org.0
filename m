Return-Path: <linuxppc-dev+bounces-4002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CE9ED9C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r2x4Gtpz30Ts;
	Thu, 12 Dec 2024 09:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956377;
	cv=none; b=oZVLHKoiXZQI3w281lQIDZlIGc+wFJnKzWnfKhXvxipl+NtGGk8wcYrWiOM0/sF+lN6F9+q5Thw2YEamUi+YCjmyEjfCaS65EgIOnUjNPUQgqR3xCUYZkxd1shXh5tnZY0CCT20cBq/liEYEeCQT+VU3Bn5QBjf502HZNsvC52R1aDwnxBfYFPVdmXIYC6+R4oadSoKPjX/+aEK6mIwDDS9zasoO+MK10IuVzLPO9TDiD/1guOXsn0bHzQ7y2Mbqw16SzG5RZeWuibzb7jOyWe0muCIhSF36LCW2jFTQash/M9zUNa59jRXHv2Wv2W/MOUy61mDUr9OgDgLgGc2Gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956377; c=relaxed/relaxed;
	bh=qCUz4EPmZaE7vP+ZlBjxRLQxrvpznxUDXVXIJb/OFMY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Mb+dUGPb8Pog5ulZcNNZk1ohx89lH4f2jQ3SkN44V2rjLJkg1V8Ll2VqE9MNQ4n/HnFPJlEmPd29HF5sz2Nu8O/KI56ZHi1OFfI0tgJnfGnXAzfXDGpMA/XJpVw9vbnewXHau/6/5I0fKN4UkA8T0qc6nB8ROTllvBVI/sSx8vCOUB7VEF1HNtaw2HKDj7Q7dfLeSEDDKs6IJCYvLEi0iIJEbdyqRhCcrMalP5GqjOGZp1vctJqBpf2au/eNlwR4V/0D9r5uup1Z0xW1OgGgUBQKel4/Ug/GtMHSUS+bDhfM6r6foBgUtv+qtyRcbfkn8AhcO9I9SjNg7qW3Tq7Jkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dnrDcNkO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dnrDcNkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r2x08XTz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 09:32:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 975595C67E0;
	Wed, 11 Dec 2024 22:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C1BC4CED2;
	Wed, 11 Dec 2024 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956374;
	bh=29u5B09z/mNiOUipvbCAR8d/HfuJKD9vMPDnfCmrneU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dnrDcNkOoxwSBjPjDdUGrvVokaL8PbY/29PjhRdPkvydqw8DxYooD5ABeBk3HzL/N
	 76xby5lMWnFghEv7vC3hF+lPCP97eOVPUwp3+ZSkE4SEdqJhuc4M4tsMuMgquf/1Sh
	 MR1GipeeO24AReN6/ejtJZElR5CRC8RyZljN784IO+9YPc2RBnMzEXA7w+OQ/yoYqa
	 adhGvjnBGfHafNdP3219wtIr4V6sPs3ti0dnt0aZa1Z6WSjl0+E+Zb5OzErlTpRYgu
	 UkzyIpABUuFP1nVewt4cL6HBuOiiJYxbTNdocbttNyq8XlE99Zmw+EmsHH8rPlCKUB
	 H5x4fe1dWfyKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD93380A965;
	Wed, 11 Dec 2024 22:33:11 +0000 (UTC)
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
Subject: Re: [PATCH v3] ftrace: Consolidate ftrace_regs accessor functions for
 archs using pt_regs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395639050.1729195.18342749493985130890.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:10 +0000
References: <20241010202114.2289f6fd@gandalf.local.home>
In-Reply-To: <20241010202114.2289f6fd@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mark.rutland@arm.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
 mingo@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Thu, 10 Oct 2024 20:21:14 -0400 you wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Most architectures use pt_regs within ftrace_regs making a lot of the
> accessor functions just calls to the pt_regs internally. Instead of
> duplication this effort, use a HAVE_ARCH_FTRACE_REGS for architectures
> that have their own ftrace_regs that is not based on pt_regs and will
> define all the accessor functions, and for the architectures that just use
> pt_regs, it will leave it undefined, and the default accessor functions
> will be used.
> 
> [...]

Here is the summary with links:
  - [v3] ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs
    https://git.kernel.org/riscv/c/e4cf33ca4812

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



