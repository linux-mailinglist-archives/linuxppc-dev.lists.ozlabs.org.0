Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F267A8193
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 13:57:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nj3n0FzYzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 21:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj0y2wDZzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:54:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46Nj0y1sJjz9sDB; Wed,  4 Sep 2019 21:54:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Nj0x26cvz9s7T;
 Wed,  4 Sep 2019 21:54:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 20/31] powerpc/fadump: use smaller offset while finding
 memory for reservation
In-Reply-To: <156630279483.8896.5669371616456324826.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630279483.8896.5669371616456324826.stgit@hbathini.in.ibm.com>
Date: Wed, 04 Sep 2019 21:54:41 +1000
Message-ID: <87v9u8p98e.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
> index d2dd117..7107cf2 100644
> --- a/arch/powerpc/kernel/fadump-common.h
> +++ b/arch/powerpc/kernel/fadump-common.h
> @@ -66,6 +66,14 @@ static inline u64 fadump_str_to_u64(const char *str)
>  
>  #define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
>  
> +/*
> + * Amount of memory (1024MB) to skip before making another attempt at
> + * reserving memory (after the previous attempt to reserve memory for
> + * FADump failed due to memory holes and/or reserved ranges) to reduce
> + * the likelihood of memory reservation failure.
> + */
> +#define FADUMP_OFFSET_SIZE			0x40000000U

This seems like a bit of a hack.

> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 971c50d..8dd2dcc 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -371,7 +371,7 @@ int __init fadump_reserve_mem(void)
>  			    !memblock_is_region_reserved(base, size))
>  				break;
>  
> -			base += size;
> +			base += FADUMP_OFFSET_SIZE;
>  		}

The comment above the loop says:

		/*
		 * Reserve memory at an offset closer to bottom of the RAM to
		 * minimize the impact of memory hot-remove operation. We can't
		 * use memblock_find_in_range() here since it doesn't allocate
		 * from bottom to top.
		 */

Is that true? Can't we set memblock to bottom up mode and then call it?

cheers
