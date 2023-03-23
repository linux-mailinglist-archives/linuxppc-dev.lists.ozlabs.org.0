Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1A6C652E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 11:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj1v04z61z3f4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 21:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D2FtiVTL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj1t74VJzz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 21:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D2FtiVTL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pj1t73GjZz4x4r;
	Thu, 23 Mar 2023 21:34:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679567663;
	bh=JpYlVx2BrhBiehk4yTgdDqRqVrEWFGQfjpLrNYIlQGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D2FtiVTLRy0cVbKfD4zvz41QmlFyneegFjT+niFaszzOehJ9Sx36phxFIDYQtZ8OO
	 gGaja8gOixXcggvYOeEoiqEpQJYGaugpNvXaW9CHNHC88io2A+DvAEILSEH90D53EU
	 zeiQcbMlzjrrIueZMSjPPHltG/zzEeZZb8wXurW6BNA2C1AUhGtCTFP56l3XjeZFD4
	 XpH//CO6HI5IGngg5TUYqujxR2/CO5dd86RETaFgAIhQQsH0yYjwsP5ulg/2Hg/4HP
	 t330K3gH0q8muwKr3AWyuxcaHYBc8khwu8fGsEJjAnVXA11zoenYlX+4Hbjo7zFAS7
	 785z6aLakK7tA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/9] powerpc/dexcr: Support userspace ROP protection
In-Reply-To: <20230322054612.1340573-5-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
 <20230322054612.1340573-5-bgray@linux.ibm.com>
Date: Thu, 23 Mar 2023 21:34:20 +1100
Message-ID: <87mt43u577.fsf@mpe.ellerman.id.au>
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> The ISA 3.1B hashst and hashchk instructions use a per-cpu SPR HASHKEYR
> to hold a key used in the hash calculation. This key should be different
> for each process to make it harder for a malicious process to recreate
> valid hash values for a victim process.
>
> Add support for storing a per-thread hash key, and setting/clearing
> HASHKEYR appropriately.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> ---
>
> v1:	* Guard HASHKEYR update behind change check
> 	* HASHKEYR reset moved earlier to patch 2
> ---
>  arch/powerpc/include/asm/processor.h |  1 +
>  arch/powerpc/kernel/process.c        | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index bad64d6a5d36..666d4e9804a8 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -264,6 +264,7 @@ struct thread_struct {
>  	unsigned long   mmcr3;
>  	unsigned long   sier2;
>  	unsigned long   sier3;
> +	unsigned long	hashkeyr;
  
hashkeyr is part of the thread state, so we should save it in core dumps.

The DEXCR also influences the threads behaviour, at least by
enabling/disabling hashst/chk, so I think we should also include it in
core dumps.

Adding regs to the core dump is done by adding eg. a new NT_PPC_HASHKEY
entry in include/uapi/linux/elf.h and wiring it up in ptrace.

But those are a non-renewable resource, so if we're going to add
HASHKEYR and DEXCR it would be better to group them as a single note. I
think given that HASHKEYR doesn't exist without the DEXCR, grouping them
is OK. Could be called NT_PPC_DEXCF (F for facility) ?

See NT_PPC_PKEY for an example.

I know HASHKEYR is security sensitive, but I think the existing ptrace
checks should be sufficient. A ptracer has more or less full control of
the tracee anyway.

To support checkpoint/restore we'd need to support setting NPHIE in the
DEXCR via ptrace. I think for starters we can just fail the ->set() if
the DEXCR doesn't match the current SPR value.

cheers
