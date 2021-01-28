Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C54073072AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 10:30:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRFZn0lVFzDrdk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 20:30:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRFT935y9zDrh8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 20:25:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DRFSp0Qsfz9v1bn;
 Thu, 28 Jan 2021 10:25:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C7VM5fuctJiW; Thu, 28 Jan 2021 10:25:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DRFSn6Rtdz9v1bY;
 Thu, 28 Jan 2021 10:25:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 055758B75B;
 Thu, 28 Jan 2021 10:25:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LVyN5f490AIT; Thu, 28 Jan 2021 10:25:46 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 85C3C8B7F4;
 Thu, 28 Jan 2021 10:25:46 +0100 (CET)
Subject: Re: [PATCH v6 08/39] powerpc: rearrange do_page_fault error case to
 be inside exception_enter
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-9-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5ad02879-3874-bf44-fc60-aff931a3c908@csgroup.eu>
Date: Thu, 28 Jan 2021 10:25:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115165012.1260253-9-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/01/2021 à 17:49, Nicholas Piggin a écrit :
> This keeps the context tracking over the entire interrupt handler which
> helps later with moving context tracking into interrupt wrappers.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/mm/fault.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index e476d7701413..e4121fd9fcf1 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -544,20 +544,24 @@ NOKPROBE_SYMBOL(__do_page_fault);
>   
>   long do_page_fault(struct pt_regs *regs)
>   {
> -	const struct exception_table_entry *entry;
> -	enum ctx_state prev_state = exception_enter();
> -	int rc = __do_page_fault(regs, regs->dar, regs->dsisr);
> -	exception_exit(prev_state);
> -	if (likely(!rc))
> -		return 0;
> -
> -	entry = search_exception_tables(regs->nip);
> -	if (unlikely(!entry))
> -		return rc;

Could we keep this layout with using a 'goto' to the end of the function, instead of pushing error 
handling to the right ?

Because at the end of the series once all context tracking is gone into helpers, the result looks 
unfriendly.

It would look cleaner as:

static long __do_page_fault(struct pt_regs *regs)
{
	long err;
	const struct exception_table_entry *entry;

	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
	if (likely(!err))
		return 0;

	entry = search_exception_tables(regs->nip);
	if (likely(entry)) {
		instruction_pointer_set(regs, extable_fixup(entry));
		return 0;
	} else if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
		/* 32 and 64e handle this in asm */
		return err;
	}
	__bad_page_fault(regs, err);
	return 0;
}
NOKPROBE_SYMBOL(__do_page_fault);



> +	enum ctx_state prev_state;
> +	long err;
> +
> +	prev_state = exception_enter();
> +	err = __do_page_fault(regs, regs->dar, regs->dsisr);
> +	if (unlikely(err)) {
> +		const struct exception_table_entry *entry;
> +
> +		entry = search_exception_tables(regs->nip);
> +		if (likely(entry)) {
> +			instruction_pointer_set(regs, extable_fixup(entry));
> +			err = 0;
> +		}
> +	}
>   
> -	instruction_pointer_set(regs, extable_fixup(entry));
> +	exception_exit(prev_state);
>   
> -	return 0;
> +	return err;
>   }
>   NOKPROBE_SYMBOL(do_page_fault);
>   
> 
