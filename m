Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFF3ED06D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6zm0YpVz3cWH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:40:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6zL0mPbz2yLN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:39:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gp6zG0jX4z9sVQ;
 Mon, 16 Aug 2021 10:39:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeIOGfVnfAuW; Mon, 16 Aug 2021 10:39:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gp6zF6rKQz9sVN;
 Mon, 16 Aug 2021 10:39:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D03FE8B78B;
 Mon, 16 Aug 2021 10:39:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SOZVl7nXecqU; Mon, 16 Aug 2021 10:39:37 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95EC28B788;
 Mon, 16 Aug 2021 10:39:37 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc: Fix undefined static key
To: Joel Stanley <joel@jms.id.au>, Paul Mackerras <paulus@samba.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210816082403.2293846-1-joel@jms.id.au>
 <20210816082403.2293846-3-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <492edb10-ccef-c6f2-2fd3-71cf8ae54cfc@csgroup.eu>
Date: Mon, 16 Aug 2021 10:39:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816082403.2293846-3-joel@jms.id.au>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/08/2021 à 10:24, Joel Stanley a écrit :
> When CONFIG_PPC_BARRIER_NOSPEC=n, security.c is not built leading to a
> missing definition of uaccess_flush_key.
> 
>    LD      vmlinux.o
>    MODPOST vmlinux.symvers
>    MODINFO modules.builtin.modinfo
>    GEN     modules.builtin
>    LD      .tmp_vmlinux.kallsyms1
> powerpc64le-linux-gnu-ld: arch/powerpc/kernel/align.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
> powerpc64le-linux-gnu-ld: arch/powerpc/kernel/signal_64.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
> powerpc64le-linux-gnu-ld: arch/powerpc/kernel/process.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
> powerpc64le-linux-gnu-ld: arch/powerpc/kernel/traps.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
> powerpc64le-linux-gnu-ld: arch/powerpc/kernel/hw_breakpoint_constraints.o:(.toc+0x0): undefined reference to `uaccess_flush_key'
> powerpc64le-linux-gnu-ld: arch/powerpc/kernel/ptrace/ptrace.o:(.toc+0x0): more undefined references to `uaccess_flush_key' follow
> make[1]: *** [Makefile:1176: vmlinux] Error 1
> 
> Hack one in to fix the build.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/powerpc/include/asm/security_features.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
> index 792eefaf230b..46ade7927a4c 100644
> --- a/arch/powerpc/include/asm/security_features.h
> +++ b/arch/powerpc/include/asm/security_features.h
> @@ -39,6 +39,9 @@ static inline bool security_ftr_enabled(u64 feature)
>   	return !!(powerpc_security_features & feature);
>   }
>   
> +#ifndef CONFIG_PPC_BARRIER_NOSPEC
> +DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
> +#endif

It will then be re-defined by each file that includes asm/security_features.h ....

You can't use a DEFINE_ in a .h

You have to fix the problem at its source.

Cleanest way I see it to modify asm/book3s/64/kup.h and something like

if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC) && static_branch_unlikely(&uaccess_flush_key)



>   
>   // Features indicating support for Spectre/Meltdown mitigations
>   
> 
