Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C867C1D26CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 07:48:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N0vD23VKzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 15:48:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N0sd5wPFzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 15:46:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49N0sS2wD0z9tyRh;
 Thu, 14 May 2020 07:46:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6tFa-RY_vw7a; Thu, 14 May 2020 07:46:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49N0sS1xNlz9tyRg;
 Thu, 14 May 2020 07:46:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 534A88B833;
 Thu, 14 May 2020 07:46:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VjzJyN6FHeqI; Thu, 14 May 2020 07:46:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A18B58B82C;
 Thu, 14 May 2020 07:46:36 +0200 (CEST)
Subject: Re: [PATCH v8 13/30] powerpc: Add a probe_user_read_inst() function
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-14-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e4bd592e-2e35-9c73-854e-1380222f34ef@csgroup.eu>
Date: Thu, 14 May 2020 07:46:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506034050.24806-14-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: christophe.leroy@c-s.fr, alistair@popple.id.au, npiggin@gmail.com,
 bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
> Introduce a probe_user_read_inst() function to use in cases where
> probe_user_read() is used for getting an instruction. This will be more
> useful for prefixed instructions.
> 
> Reviewed-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v6: - New to series
> ---
>   arch/powerpc/include/asm/inst.h |  3 +++
>   arch/powerpc/lib/Makefile       |  2 +-
>   arch/powerpc/lib/inst.c         | 18 ++++++++++++++++++
>   arch/powerpc/mm/fault.c         |  2 +-
>   4 files changed, 23 insertions(+), 2 deletions(-)
>   create mode 100644 arch/powerpc/lib/inst.c
> 
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index 552e953bf04f..3e9a58420151 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -37,4 +37,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
>   	return ppc_inst_val(x) == ppc_inst_val(y);
>   }
>   
> +int probe_user_read_inst(struct ppc_inst *inst,
> +			 struct ppc_inst *nip);
> +
>   #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index b8de3be10eb4..546591848219 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
>   CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
>   endif
>   
> -obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
> +obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o
>   
>   ifndef CONFIG_KASAN
>   obj-y	+=	string.o memcmp_$(BITS).o
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
> @@ -281,7 +281,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>   		    access_ok(nip, sizeof(*nip))) {
>   			struct ppc_inst inst;
>   
> -			if (!probe_user_read(&inst, nip, sizeof(inst)))
> +			if (!probe_user_read_inst(&inst, (struct ppc_inst __user *)nip))

Shouldn't 'nip' become de 'struct ppc_inst __user *' instead of casting ?

>   				return !store_updates_sp(inst);
>   			*must_retry = true;
>   		}
> 

Christophe
