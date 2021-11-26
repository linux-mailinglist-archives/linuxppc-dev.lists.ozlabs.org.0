Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E945E99C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 09:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0pMW1lwzz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 19:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0pM51Knrz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 19:49:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0pM146QPz9sSM;
 Fri, 26 Nov 2021 09:49:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2ITOMNwlhy3; Fri, 26 Nov 2021 09:49:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0pM13DYBz9sSH;
 Fri, 26 Nov 2021 09:49:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F77F8B77D;
 Fri, 26 Nov 2021 09:49:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LxK8mRy4-wOq; Fri, 26 Nov 2021 09:49:01 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB2D38B763;
 Fri, 26 Nov 2021 09:49:00 +0100 (CET)
Message-ID: <5a995d46-5292-b6e1-f88e-81d8cbc40b83@csgroup.eu>
Date: Fri, 26 Nov 2021 09:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/code-patching: Relax verification of patchability
Content-Language: fr-FR
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <68d7d57675e0963fe5e2c4b84b0cb2390c78638c.1637912333.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <68d7d57675e0963fe5e2c4b84b0cb2390c78638c.1637912333.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 08:39, Christophe Leroy a écrit :
> Commit 8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of
> patchability") introduced a stricter verification of the patched
> area by checking it is proper kernel text.
> 
> But as least two usages of patch_instruction() fall outside:
> - Code patching selftests, which use stack and vmalloc space.
> - Ftrace
> 
> So for the time being, partially revert commit 8b8a8f0ab3f5 and add
> a onetime warning:
> 
>    Running code patching self-tests ...
>    patch_instruction() called on invalid text address 0xe1011e58 from test_code_patching+0x34/0xd6c
> 
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of patchability")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/lib/code-patching.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 1dd636a85cc1..c87eea773930 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -190,9 +190,13 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
>   int patch_instruction(u32 *addr, struct ppc_inst instr)
>   {
>   	/* Make sure we aren't patching a freed init section */
> -	if (!kernel_text_address((unsigned long)addr))
> +	if (system_state >= SYSTEM_FREEING_INITMEM && init_section_contains(addr, 4))
>   		return 0;
>   
> +	if (!kernel_text_address((unsigned long)addr))
> +		pr_warn_once("%s() called on invalid text address 0x%p from %pS\n",
> +			     __func__, addr, __builtin_return_address(0));
> +

May it be better to use pr_warn_ratelimited() instead in order to catch 
more than the first occurence ?

>   	return do_patch_instruction(addr, instr);
>   }
>   NOKPROBE_SYMBOL(patch_instruction);
> 
