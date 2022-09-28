Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF35EDC12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcw3M22Ksz3bkk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:57:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p542IfKE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcw2m0m6hz2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:57:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p542IfKE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mcw2g0yWfz4wgv;
	Wed, 28 Sep 2022 21:56:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664366219;
	bh=UjZWDoNB8Y9z1bdSThf5/+HlV/QaQIKXQ7fppgRfxp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p542IfKEs7AugnzH/zQnzlyDARVGBje57jqPCxoWlXeWzVurISeLpTXb6TwRYaJt0
	 NIy6iA/HdbhRrg+I94nV2YdrKNhDJL4Pv4vSu7gRYctyI1tT0fF21ptV3yNjtGeD0g
	 7xoFev6t92HPXixnAizmykEzttAvRfv5YiQKR6l36DfPoeBcqOo5MwOBNesG7moNm0
	 T1fyd1UDuG1JgVYJvSdz8J25SDrMQ8Z0vSzbMv7vU5u8OTuoHH5P74H2ii0D6b488A
	 jead+kGuoWu4UWa5sc1OBQ34V9QpgeUJ87oI89JrUA+5y5EJBtu5XhE0VSQ0Jxu2Ye
	 Yxq+PYfbPm6SQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 19/25] powerpc: Remove high-order word clearing on
 compat syscall entry
In-Reply-To: <20220921065605.1051927-20-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-20-rmclure@linux.ibm.com>
Date: Wed, 28 Sep 2022 21:56:57 +1000
Message-ID: <87mtajg19y.fsf@mpe.ellerman.id.au>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rohan McLure <rmclure@linux.ibm.com> writes:
> Remove explicit clearing of the high order-word of user parameters when
> handling compatibility syscalls in system_call_exception. The
> COMPAT_SYSCALL_DEFINEx macros handle this clearing through an
> explicit cast to the signature type of the target handler.

Unfortunately this doesn't work.

We don't have compat handlers for everything, so we end up with 64-bit
values getting passsed in and things break.

Our hugetlb_vs_thp selftest hits it, as seen in ftrace:

  12848 mmap(0xffffffffa0000000, 16777216, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf6fb0000
  12848 munmap(0xffffffffa0000000, 16777216) = -1 EINVAL (Invalid argument)

But in the source the only mmap()/munmap() is of 0xa0000000.

Looking at x86 they send all 32-bit syscalls via a wrapper that does the
truncation (SC_IA32_REGS_TO_ARGS). So I think we could do something
similar eventually and get rid of this explicit clearing.

But I don't want to predicate this whole series on that, so I've dropped
this patch for now, and reworked some of the following patches to keep
the register clearing.

cheers

> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index 9875486f6168..15af0ed019a7 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -157,14 +157,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
>  
>  	if (unlikely(is_compat_task())) {
>  		f = (void *)compat_sys_call_table[r0];
> -
> -		r3 &= 0x00000000ffffffffULL;
> -		r4 &= 0x00000000ffffffffULL;
> -		r5 &= 0x00000000ffffffffULL;
> -		r6 &= 0x00000000ffffffffULL;
> -		r7 &= 0x00000000ffffffffULL;
> -		r8 &= 0x00000000ffffffffULL;
> -
>  	} else {
>  		f = (void *)sys_call_table[r0];
>  	}
> -- 
> 2.34.1
