Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE213534E7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 19:32:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCPBg6Q9Cz3c4t
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 03:32:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCPBG4kTnz3027
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Apr 2021 03:32:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FCPB205JNz9v2DV;
 Sat,  3 Apr 2021 19:32:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OlKSWiwht6s7; Sat,  3 Apr 2021 19:32:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FCPB16NhVz9v2DT;
 Sat,  3 Apr 2021 19:32:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FB008B76D;
 Sat,  3 Apr 2021 19:32:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id exrl2fk04JRp; Sat,  3 Apr 2021 19:32:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A4BD8B76A;
 Sat,  3 Apr 2021 19:32:11 +0200 (CEST)
Subject: Re: [PATCH 08/10] powerpc/signal32: Convert restore_[tm]_user_regs()
 to user access block
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 cmr@codefail.de
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
 <181adf15a6f644efcd1aeafb355f3578ff1b6bc5.1616151715.git.christophe.leroy@csgroup.eu>
Message-ID: <7460dcad-a1d1-375d-a9a5-ba5f1d7a41a7@csgroup.eu>
Date: Sat, 3 Apr 2021 19:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <181adf15a6f644efcd1aeafb355f3578ff1b6bc5.1616151715.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/03/2021 à 12:06, Christophe Leroy a écrit :
> Convert restore_user_regs() and restore_tm_user_regs()
> to use user_access_read_begin/end blocks.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/include/asm/ptrace.h |   2 +-
>   arch/powerpc/kernel/signal_32.c   | 141 +++++++++++++++---------------
>   2 files changed, 72 insertions(+), 71 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 088c83853026..0b1a6f53e553 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -567,19 +569,22 @@ static long restore_user_regs(struct pt_regs *regs,
>   	regs->msr &= ~MSR_SPE;
>   	if (msr & MSR_SPE) {
>   		/* restore spe registers from the stack */
> -		if (__copy_from_user(current->thread.evr, &sr->mc_vregs,
> -				     ELF_NEVRREG * sizeof(u32)))
> -			return 1;
> +		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
> +				      ELF_NEVRREG * sizeof(u32));

Missing the , failed); here at the end of the line.

Michael can you add it ?

Thanks
Christophe
