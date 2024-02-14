Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355C1855531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 22:57:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EGrvNimn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZsWD28CSz3dWg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 08:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EGrvNimn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZsVV2P7Xz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 08:57:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707947821;
	bh=ptVY8+ctsEMPdzQdMVEcEaylbr4N9FMoA+0k/Zm7vvI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EGrvNimnx3BgExLs+6EE6sBnci2Wyn1SmyHYST8YoKmsjteL24VJ1RqdGiuvUJeLn
	 urHV4WCzxmFQbyh/4ecwRbZBROvSzbRhSXj/uVhWJDupWoYClulsQOtz/QavCw2kUI
	 +1agm6/2zUxzdaaO90cQESACk/IeqZ5WWu+SgAGu89qz/IipGnoSg0+6Cw34ss/Lgg
	 Stpl97P/OrKl47x2zE/UuqcquMI8/mfO0QOixENxDblJiLZpvK1uMI+Nloz0ngrJZv
	 N3LeXGLRvjxaFJ6u86npcfuX13XR9pYsrlzKfn55vAPN4XK4OtILfeM/sQ80caoHhE
	 RVgwW+JtWteZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TZsVN6WXmz4wcb;
	Thu, 15 Feb 2024 08:57:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Subject: Re: [PATCH] powerpc/64s: Increase default stack size to 32KB
In-Reply-To: <87ttmau5mg.fsf@nvidia.com>
References: <20231215124449.317597-1-mpe@ellerman.id.au>
 <87ttmau5mg.fsf@nvidia.com>
Date: Thu, 15 Feb 2024 08:56:59 +1100
Message-ID: <87cysy7lqs.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Gal Pressman <gal@nvidia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rahul Rameshbabu <rrameshbabu@nvidia.com> writes:
> On Fri, 15 Dec, 2023 23:44:49 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>> There are reports of kernels crashing due to stack overflow while
>> running OpenShift (Kubernetes). The primary contributor to the stack
>> usage seems to be openvswitch, which is used by OVN-Kubernetes (based on
>> OVN (Open Virtual Network)), but NFS also contributes in some stack
>> traces.
>>
>> There may be some opportunities to reduce stack usage in the openvswitch
>> code, but doing so potentially require tradeoffs vs performance, and
>> also requires testing across architectures.
>>
>> Looking at stack usage across the kernel (using -fstack-usage), shows
>> that ppc64le stack frames are on average 50-100% larger than the
>> equivalent function built for x86-64. Which is not surprising given the
>> minimum stack frame size is 32 bytes on ppc64le vs 16 bytes on x86-64.
>>
>> So increase the default stack size to 32KB for the modern 64-bit Book3S
>> platforms, ie. pseries (virtualised) and powernv (bare metal). That
>> leaves the older systems like G5s, and the AmigaOne (pasemi) with a 16KB
>> stack which should be sufficient on those machines.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>
> We noticed this change is causing assembler issues for us when building
> the kernel.
>
>   make ARCH=powerpc KERNELRELEASE=6.8.0-rc2_for_upstream_debug_2024_02_06_20_01 KBUILD_BUILD_VERSION=1
>   arch/powerpc/kernel/switch.S: Assembler messages:
>   arch/powerpc/kernel/switch.S:249: Error: operand out of range (0x000000000000fe50 is not between 0xffffffffffff8000 and 0x0000000000007fff)
>   make[6]: *** [scripts/Makefile.build:361: arch/powerpc/kernel/switch.o] Error 1
>   make[5]: *** [scripts/Makefile.build:481: arch/powerpc/kernel] Error 2
>   make[5]: *** Waiting for unfinished jobs....
>   make[4]: *** [scripts/Makefile.build:481: arch/powerpc] Error 2
>   make[4]: *** Waiting for unfinished jobs....
>   make[3]: *** [Makefile:1921: .] Error 2

There's a fix in my fixes branch:
  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=fixes&id=f1acb109505d983779bbb7e20a1ee6244d2b5736

I'll send it to Linus this week.

cheers
