Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C72224E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:09:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6x2d1Rc7zDqNt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:09:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQB0H5bzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQ35nj2z9sTC; Thu, 16 Jul 2020 22:56:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200511101952.1463138-1-npiggin@gmail.com>
References: <20200511101952.1463138-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64/signal: balance return predictor stack in
 signal trampoline
Message-Id: <159490400676.3805857.12503556753801139476.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:11 +1000 (AEST)
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 May 2020 20:19:52 +1000, Nicholas Piggin wrote:
> Returning from an interrupt or syscall to a signal handler currently
> begins execution directly at the handler's entry point, with LR set to
> the address of the sigreturn trampoline. When the signal handler
> function returns, it runs the trampoline. It looks like this:
> 
>     # interrupt at user address xyz
>     # kernel stuff... signal is raised
>     rfid
>     # void handler(int sig)
>     addis 2,12,.TOC.-.LCF0@ha
>     addi 2,2,.TOC.-.LCF0@l
>     mflr 0
>     std 0,16(1)
>     stdu 1,-96(1)
>     # handler stuff
>     ld 0,16(1)
>     mtlr 0
>     blr
>     # __kernel_sigtramp_rt64
>     addi    r1,r1,__SIGNAL_FRAMESIZE
>     li      r0,__NR_rt_sigreturn
>     sc
>     # kernel executes rt_sigreturn
>     rfid
>     # back to user address xyz
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64/signal: Balance return predictor stack in signal trampoline
      https://git.kernel.org/powerpc/c/0138ba5783ae0dcc799ad401a1e8ac8333790df9

cheers
