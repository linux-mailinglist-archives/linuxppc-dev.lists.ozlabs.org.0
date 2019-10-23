Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C2E1046
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 04:58:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yZnY3LgMzDqPv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 13:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yZlc6HNXzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 13:56:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="NOsFBbeN"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46yZlc20j3z9sPL;
 Wed, 23 Oct 2019 13:56:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571799404;
 bh=DczT9rE7kR+Qz/EZL2NjwSOJgqXIrzlc4s0f0m8xelE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NOsFBbeNC6QgqmEaw9s+yI/IWFduzBu5fvyCij6THayTsTwfx2o4eaLThBetKQcg9
 5RANr739KuK8SOw467lDqanz82wvpETFVJup7Qff6kQsR3R+2gWYQ352nKpWYVxv4M
 CK7Ng8ZwDo1TP+JVL4dHqdHkXfr3MyQJjwS3H+xor+2deejptw+/Ln4A1lNNovPlY7
 kD8MCtsjEO7ojEhYutv2KYquU5rWaDRq4l04PMaoXJUsy/Q1dOIroM4tQlNAj8fglh
 AObpvWqIkCIipUp0Th0h77TjM39w3E8xNv2AGlPbgtjHuphh4oGsdH+kZeej3Th+Ke
 YqyqMfMii0oqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/4] powerpc/mm: Implement set_memory() routines
In-Reply-To: <20191004075050.73327-2-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
 <20191004075050.73327-2-ruscur@russell.cc>
Date: Wed, 23 Oct 2019 13:56:41 +1100
Message-ID: <87pnio5fva.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au, rashmica.g@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..fe3ecbfb8e10
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * MMU-generic set_memory implementation for powerpc
> + *
> + * Author: Russell Currey <ruscur@russell.cc>

Please don't add email addresses in new files, they just risk
bit-rotting, they're in the git log anyway.

> + *
> + * Copyright 2019, IBM Corporation.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/set_memory.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +
> +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	int action = *((int *)data);
> +	pte_t pte_val;
> +
> +	// invalidate the PTE so it's safe to modify
> +	pte_val = ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);

This doesn't work if for example we're setting the text mapping we're
executing from read-only, which in principle should work.

Or if another CPU is concurrently reading from a mapping we're marking
read-only.

I /think/ that's acceptable for all the current users, but I don't know
that for sure and it's not documented anywhere AFAICS.

At the very least it needs a big comment, and to be mentioned in the
change log.


Also there's no locking here, or in apply_to_page_range() AFAICS.

And because we're doing clear/modify/write, two CPUs that race doing eg.
set_memory_ro() and set_memory_nx() will potentially result in some PTEs
being marked permanently invalid, if one CPU sees the other CPUs clear
of the PTE before the write.

Again I'm not sure any current callers do that, but it's a bit fragile.

I think we can fix the race at least by taking the init_mm
page_table_lock around the clear/modify/write.

> +	// modify the PTE bits as desired, then apply
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte_val = pte_wrprotect(pte_val);
> +		break;
> +	case SET_MEMORY_RW:
> +		pte_val = pte_mkwrite(pte_val);
> +		break;
> +	case SET_MEMORY_NX:
> +		pte_val = pte_exprotect(pte_val);
> +		break;
> +	case SET_MEMORY_X:
> +		pte_val = pte_mkexec(pte_val);
> +		break;
> +	default:
> +		WARN_ON(true);
> +		return -EINVAL;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte_val);
> +
> +	return 0;
> +}

cheers

