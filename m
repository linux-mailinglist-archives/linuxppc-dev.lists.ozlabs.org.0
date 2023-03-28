Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493ED6CBE0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 13:48:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm7Hb0jNMz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:48:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E5ezmEsX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm7Gj39FSz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 22:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E5ezmEsX;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pm7Gg5MMHz4whh;
	Tue, 28 Mar 2023 22:47:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680004076;
	bh=DEns3mMtYYeJfnth0jh9KXN/GkEq0tgf3rOLFt0klxY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=E5ezmEsX64RZyZY5IHFYLk7bnikcO6qGn9tLey/2dzrshZ8QrD1KeDN8/qLmNAf3p
	 4ApUT0frB//2/VXj22yZ0NUj+RFL+7ymZsbQiI9lNl1KJ87B0zNawCb3lPyPEtGuOG
	 maJ90A6NaBf2kJB42Ee3lNvC1rC6y4de9KcPcIvoLkwYd0UJU7bk8vD51PqUitRPso
	 qYqYMiQEhOmWF3jHlvSH/fAzKtpP7JmG2Lf4r8SJ/7pXHIVEzbyOEJ8pW1aO8n5VQS
	 aEHjSGl6higEF9U2hPc/np7R0gjqEs0cEKcXnoXz2IhvNLOxRnlnpHlngOUT2ckzqP
	 BFbx6UhAPtdew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Jens Axboe <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
In-Reply-To: <CRHSOZ15ORYN.1DMP7BFBDRFII@bobo>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo>
 <6727b289-aef6-89f9-8b4f-d63cbaeb81e5@csgroup.eu>
 <CRHSOZ15ORYN.1DMP7BFBDRFII@bobo>
Date: Tue, 28 Mar 2023 22:47:55 +1100
Message-ID: <87ilelcd1w.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Mon Mar 27, 2023 at 8:26 PM AEST, Christophe Leroy wrote:
...
>>
>> Now that thread.regs doesn't change anymore at each interrupt, it would 
>> probably be worth dropping it and falling back to task_pt_regs() as 
>> defined on most architecture.
>> Knowing whether a thread is a kernel or user thread can for instance be 
>> known with PF_KTHREAD flag, so no need of thread.regs for that.
>
> That would be nice if we can define regs that way, I agree. We should
> look into doing that.

Yeah it's on the long-list of things that need cleaning up.

I think there's some complication in working out which sites are OK to
use/give-out the value in pt_regs that's potentially a dummy value, vs
cases that actually want to check PF_KTHREAD and do something different.
But that's just my hunch I haven't looked through all the sites.

The thread.regs = NULL for kernel threads goes back to arch/ppc, about
2002 by the looks:

  https://github.com/mpe/linux-fullhistory/commit/2a8e186c384c0c911f91cd12367658eabdc820d8#diff-939b705cff722ee75595fad30d56bb1175dfdce49a69adb4d5656f354be076c6

There's no change log of course :)

Still maybe it doesn't matter why it was originally done that way, if we
can do it differently now.

cheers
