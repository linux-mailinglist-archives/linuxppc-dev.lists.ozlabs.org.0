Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0685314864
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 06:59:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXK228mYzDsNq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 16:59:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXHS6c6VzDrdp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 16:57:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZXHL21kTz9vBmK;
 Tue,  9 Feb 2021 06:57:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1lLkri7Za2BJ; Tue,  9 Feb 2021 06:57:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZXHK6wclz9vBmJ;
 Tue,  9 Feb 2021 06:57:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FFFB8B7C9;
 Tue,  9 Feb 2021 06:57:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vhI_15S8uVFg; Tue,  9 Feb 2021 06:57:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D7558B764;
 Tue,  9 Feb 2021 06:57:50 +0100 (CET)
Subject: Re: [PATCH v5 05/22] powerpc/irq: Add helper to set regs->softe
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <5f37d1177a751fdbca79df461d283850ca3a34a2.1612796617.git.christophe.leroy@csgroup.eu>
 <1612832745.vhjk6358hf.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <258ac0c6-ef40-86d4-2ce4-772cfc4a95e5@csgroup.eu>
Date: Tue, 9 Feb 2021 06:57:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612832745.vhjk6358hf.astroid@bobo.none>
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



Le 09/02/2021 à 02:11, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>> regs->softe doesn't exist on PPC32.
>>
>> Add irq_soft_mask_regs_set_state() helper to set regs->softe.
>> This helper will void on PPC32.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/hw_irq.h | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
>> index 614957f74cee..ed0c3b049dfd 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -38,6 +38,8 @@
>>   #define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE)
>>   #endif
>>   
>> +#endif /* CONFIG_PPC64 */
>> +
>>   /*
>>    * flags for paca->irq_soft_mask
>>    */
>> @@ -46,8 +48,6 @@
>>   #define IRQS_PMI_DISABLED	2
>>   #define IRQS_ALL_DISABLED	(IRQS_DISABLED | IRQS_PMI_DISABLED)
>>   
>> -#endif /* CONFIG_PPC64 */
>> -
>>   #ifndef __ASSEMBLY__
>>   
>>   #ifdef CONFIG_PPC64
>> @@ -287,6 +287,10 @@ extern void irq_set_pending_from_srr1(unsigned long srr1);
>>   
>>   extern void force_external_irq_replay(void);
>>   
>> +static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
>> +{
>> +	regs->softe = val;
>> +}
>>   #else /* CONFIG_PPC64 */
>>   
>>   static inline unsigned long arch_local_save_flags(void)
>> @@ -355,6 +359,9 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
>>   
>>   static inline void may_hard_irq_enable(void) { }
>>   
>> +static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
>> +{
>> +}
>>   #endif /* CONFIG_PPC64 */
>>   
>>   #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
> 
> What I don't like about this where you use it is it kind of pollutes
> the ppc32 path with this function which is not valid to use.
> 
> I would prefer if you had this purely so it could compile with:
> 
>    if (IS_ENABLED(CONFIG_PPC64)))
>        irq_soft_mask_regs_set_state(regs, blah);
> 
> And then you could make the ppc32 cause a link error if it did not
> get eliminated at compile time (e.g., call an undefined function).
> 
> You could do the same with the kuap_ functions to change some ifdefs
> to IS_ENABLED.
> 
> That's just my preference but if you prefer this way I guess that's
> okay.

I see you didn't change your mind since last April :)

I'll see what I can do.

Christophe
