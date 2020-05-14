Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EEE1D276A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 08:21:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N1cm60RBzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 16:20:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N1WZ0yfHzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 16:16:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49N1WT6tybz9txfZ;
 Thu, 14 May 2020 08:16:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zHUAYBIuKBUz; Thu, 14 May 2020 08:16:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49N1WT673sz9txfb;
 Thu, 14 May 2020 08:16:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C0F38B834;
 Thu, 14 May 2020 08:16:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wfH0QVbFh4B6; Thu, 14 May 2020 08:16:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A09BC8B82C;
 Thu, 14 May 2020 08:16:06 +0200 (CEST)
Subject: Re: [PATCH v8 30/30] powerpc sstep: Add support for prefixed
 fixed-point arithmetic
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-31-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9a94f062-b3a3-98a3-8617-09a204a567d5@csgroup.eu>
Date: Thu, 14 May 2020 08:15:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506034050.24806-31-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
> This adds emulation support for the following prefixed Fixed-Point
> Arithmetic instructions:
>    * Prefixed Add Immediate (paddi)

Shouldn't this patch go before patch 23 ?

Christophe

> 
> Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v3: Since we moved the prefixed loads/stores into the load/store switch
> statement it no longer makes sense to have paddi in there, so move it
> out.
> ---
>   arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 6794a7672ad5..964fe7bbfce3 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1337,6 +1337,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   
>   	switch (opcode) {
>   #ifdef __powerpc64__
> +	case 1:
> +		prefix_r = word & (1ul << 20);
> +		ra = (suffix >> 16) & 0x1f;
> +		rd = (suffix >> 21) & 0x1f;
> +		op->reg = rd;
> +		op->val = regs->gpr[rd];
> +		suffixopcode = suffix >> 26;
> +		prefixtype = (word >> 24) & 0x3;
> +		switch (prefixtype) {
> +		case 2:
> +			if (prefix_r && ra)
> +				return 0;
> +			switch (suffixopcode) {
> +			case 14:	/* paddi */
> +				op->type = COMPUTE | PREFIXED;
> +				op->val = mlsd_8lsd_ea(word, suffix, regs);
> +				goto compute_done;
> +			}
> +		}
> +		break;
>   	case 2:		/* tdi */
>   		if (rd & trap_compare(regs->gpr[ra], (short) word))
>   			goto trap;
> 
