Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D545D8C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 12:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0FSf3npnz3cDw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 22:06:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0FSD36bHz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 22:06:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0FS82fKBz9sSW;
 Thu, 25 Nov 2021 12:06:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqarruM1xFSc; Thu, 25 Nov 2021 12:06:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0FS81lvNz9sSV;
 Thu, 25 Nov 2021 12:06:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D1718B77A;
 Thu, 25 Nov 2021 12:06:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GHXvQ1UT4Tft; Thu, 25 Nov 2021 12:06:32 +0100 (CET)
Received: from [192.168.203.227] (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F7F88B763;
 Thu, 25 Nov 2021 12:06:31 +0100 (CET)
Message-ID: <88599cf9-2ecc-d8ba-8d79-0c5ebededf7c@csgroup.eu>
Date: Thu, 25 Nov 2021 12:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] powerpc64/exceptions: Refactor code to eliminate a few
 memory loads
Content-Language: fr-FR
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <874lq2px9c.fsf@concordia.ellerman.id.au>
 <20171113170445.1404-1-naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20171113170445.1404-1-naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/11/2017 à 18:04, Naveen N. Rao a écrit :
> Michael Ellerman wrote:
>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>
>>> On 2017/06/19 03:21PM, Aneesh Kumar K.V wrote:
>>>>> @@ -1445,8 +1446,8 @@ do_hash_page:
>>>>>   handle_page_fault:
>>>>>   	andis.  r0,r4,DSISR_DABRMATCH@h
>>>>>   	bne-    handle_dabr_fault
>>>>> -	ld	r4,_DAR(r1)
>>>>> -	ld	r5,_DSISR(r1)
>>>>> +	mr	r5,r4
>>>>> +	mr	r4,r3
>>>>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>>>>   	bl	do_page_fault
>>>>>   	cmpdi	r3,0
>>>>
>>>>
>>>> Can we avoid that if we rearrange args of other functions calls, so that
>>>> we can use r3 and r4 as it is ?
>>>
>>> Here's a version that does that. Again, boot tested with radix and
>>> disable_radix.
>>>
>>> Thanks,
>>> Naveen
>>>
>>> -
>>> Change data_access_common() and instruction_access_common() to load the
>>> trap number in r3, DAR in r4 and DSISR in r5 (rather than in r5, r3 and
>>> r4 respectively). This change allows us to eliminate a few un-necessary
>>> memory loads and register move operations in handle_page_fault(),
>>> handle_dabr_fault() and label '77'.
>>>
>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>> ---
>>>   arch/powerpc/kernel/exceptions-64s.S | 38 +++++++++++++++++-------------------
>>>   1 file changed, 18 insertions(+), 20 deletions(-)
>>
>> Sorry I missed this and now it doesn't apply. Do you mind rebasing.
> 
> No problem - this is just a small refactoring after all :).
> Here's a rebased version.  Boot tested on mambo with/without radix.
> 
> Thanks,
> Naveen
> 
> --
> [PATCH v3] powerpc/exceptions64s: Eliminate a few un-necessary memory
> loads
> 
> Change data_access_common() and instruction_access_common() to load the
> trap number in r3, DAR in r4 and DSISR in r5 (rather than in r5, r3 and
> r4 respectively). This change allows us to eliminate a few un-necessary
> memory loads and register move operations in handle_page_fault(),
> handle_dabr_fault() and label '77'.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>   arch/powerpc/kernel/exceptions-64s.S | 38 +++++++++++++++++-------------------
>   1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 72cffa0c4af6..b8166b4fa728 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -499,11 +499,11 @@ EXC_COMMON_BEGIN(data_access_common)
>   	EXCEPTION_PROLOG_COMMON(0x300, PACA_EXGEN)
>   	RECONCILE_IRQ_STATE(r10, r11)
>   	ld	r12,_MSR(r1)
> -	ld	r3,PACA_EXGEN+EX_DAR(r13)
> -	lwz	r4,PACA_EXGEN+EX_DSISR(r13)
> -	li	r5,0x300
> -	std	r3,_DAR(r1)
> -	std	r4,_DSISR(r1)
> +	ld	r4,PACA_EXGEN+EX_DAR(r13)
> +	lwz	r5,PACA_EXGEN+EX_DSISR(r13)
> +	li	r3,0x300
> +	std	r4,_DAR(r1)
> +	std	r5,_DSISR(r1)
>   BEGIN_MMU_FTR_SECTION
>   	b	do_hash_page		/* Try to handle as hpte fault */
>   MMU_FTR_SECTION_ELSE
> @@ -543,11 +543,11 @@ EXC_COMMON_BEGIN(instruction_access_common)
>   	EXCEPTION_PROLOG_COMMON(0x400, PACA_EXGEN)
>   	RECONCILE_IRQ_STATE(r10, r11)
>   	ld	r12,_MSR(r1)
> -	ld	r3,_NIP(r1)
> -	andis.	r4,r12,DSISR_BAD_FAULT_64S@h
> -	li	r5,0x400
> -	std	r3,_DAR(r1)
> -	std	r4,_DSISR(r1)
> +	ld	r4,_NIP(r1)
> +	andis.	r5,r12,DSISR_BAD_FAULT_64S@h
> +	li	r3,0x400
> +	std	r4,_DAR(r1)
> +	std	r5,_DSISR(r1)
>   BEGIN_MMU_FTR_SECTION
>   	b	do_hash_page		/* Try to handle as hpte fault */
>   MMU_FTR_SECTION_ELSE
> @@ -1523,7 +1523,7 @@ do_hash_page:
>   #ifdef CONFIG_PPC_BOOK3S_64
>   	lis	r0,DSISR_BAD_FAULT_64S@h
>   	ori	r0,r0,DSISR_BAD_FAULT_64S@l
> -	and.	r0,r4,r0		/* weird error? */
> +	and.	r0,r5,r0		/* weird error? */
>   	bne-	handle_page_fault	/* if not, try to insert a HPTE */
>   	CURRENT_THREAD_INFO(r11, r1)
>   	lwz	r0,TI_PREEMPT(r11)	/* If we're in an "NMI" */
> @@ -1538,8 +1538,10 @@ do_hash_page:
>   	 *
>   	 * at return r3 = 0 for success, 1 for page fault, negative for error
>   	 */
> +	mr	r6,r5
> +	mr	r5,r3
> +	mr	r3,r4
>           mr 	r4,r12
> -	ld      r6,_DSISR(r1)
>   	bl	__hash_page		/* build HPTE if possible */
>           cmpdi	r3,0			/* see if __hash_page succeeded */
>   
> @@ -1549,16 +1551,15 @@ do_hash_page:
>   	/* Error */
>   	blt-	13f
>   
> -	/* Reload DSISR into r4 for the DABR check below */
> -	ld      r4,_DSISR(r1)
> +	/* Reload DAR/DSISR for handle_page_fault */
> +	ld	r4,_DAR(r1)
> +	ld      r5,_DSISR(r1)
>   #endif /* CONFIG_PPC_BOOK3S_64 */
>   
>   /* Here we have a page fault that hash_page can't handle. */
>   handle_page_fault:
> -11:	andis.  r0,r4,DSISR_DABRMATCH@h
> +	andis.  r0,r5,DSISR_DABRMATCH@h
>   	bne-    handle_dabr_fault
> -	ld	r4,_DAR(r1)
> -	ld	r5,_DSISR(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_page_fault
>   	cmpdi	r3,0
> @@ -1573,8 +1574,6 @@ handle_page_fault:
>   /* We have a data breakpoint exception - handle it */
>   handle_dabr_fault:
>   	bl	save_nvgprs
> -	ld      r4,_DAR(r1)
> -	ld      r5,_DSISR(r1)
>   	addi    r3,r1,STACK_FRAME_OVERHEAD
>   	bl      do_break
>   12:	b       ret_from_except_lite
> @@ -1600,7 +1599,6 @@ handle_dabr_fault:
>    * the access, or panic if there isn't a handler.
>    */
>   77:	bl	save_nvgprs
> -	mr	r4,r3
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	li	r5,SIGSEGV
>   	bl	bad_page_fault
> 

Seems like it was never merged but was superseded in 2019 by 
https://lore.kernel.org/r/20190802105709.27696-37-npiggin@gmail.com
