Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B01C3483
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 10:32:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Fx1J4RQFzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 18:32:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Fwzj1lRYzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 18:30:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fwzh5zvQz9sRf;
 Mon,  4 May 2020 18:30:56 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 13/28] powerpc: Add a probe_user_read_inst() function
Date: Mon, 04 May 2020 18:30:56 +1000
Message-ID: <1788028.fjJG1VDcy6@townsend>
In-Reply-To: <20200501034220.8982-14-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-14-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good.

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:05 PM AEST Jordan Niethe wrote:
> Introduce a probe_user_read_inst() function to use in cases where
> probe_user_read() is used for getting an instruction. This will be more
> useful for prefixed instructions.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v6: - New to series
> ---
>  arch/powerpc/include/asm/inst.h |  3 +++
>  arch/powerpc/lib/Makefile       |  2 +-
>  arch/powerpc/lib/inst.c         | 18 ++++++++++++++++++
>  arch/powerpc/mm/fault.c         |  2 +-
>  4 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/lib/inst.c
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h index 552e953bf04f..3e9a58420151 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -37,4 +37,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x,
> struct ppc_inst y) return ppc_inst_val(x) == ppc_inst_val(y);
>  }
> 
> +int probe_user_read_inst(struct ppc_inst *inst,
> +			 struct ppc_inst *nip);
> +
>  #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index b8de3be10eb4..546591848219 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
>  CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
>  endif
> 
> -obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
> +obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o
> 
>  ifndef CONFIG_KASAN
>  obj-y	+=	string.o memcmp_$(BITS).o
> diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
> new file mode 100644
> index 000000000000..eaf786afad2b
> --- /dev/null
> +++ b/arch/powerpc/lib/inst.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright 2020, IBM Corporation.
> + */
> +
> +#include <linux/uaccess.h>
> +#include <asm/inst.h>
> +
> +int probe_user_read_inst(struct ppc_inst *inst,
> +			 struct ppc_inst *nip)
> +{
> +	unsigned int val;
> +	int err;
> +
> +	err = probe_user_read(&val, nip, sizeof(val));
> +	*inst = ppc_inst(val);
> +	return err;
> +}
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 4a50f125ec18..f3a943eae305 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -281,7 +281,7 @@ static bool bad_stack_expansion(struct pt_regs *regs,
> unsigned long address, access_ok(nip, sizeof(*nip))) {
>  			struct ppc_inst inst;
> 
> -			if (!probe_user_read(&inst, nip, sizeof(inst)))
> +			if (!probe_user_read_inst(&inst, (struct ppc_inst __user *)nip))
>  				return !store_updates_sp(inst);
>  			*must_retry = true;
>  		}




