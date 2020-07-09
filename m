Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD3219A8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:09:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2TN841JTzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 18:09:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2TLH6G8tzDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 18:07:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B2TL656Cnz9v1Jr;
 Thu,  9 Jul 2020 10:07:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5cSyeqdOuBTr; Thu,  9 Jul 2020 10:07:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B2TL64G4hz9v1Jn;
 Thu,  9 Jul 2020 10:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7082E8B80D;
 Thu,  9 Jul 2020 10:07:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id reLLqYqzWroL; Thu,  9 Jul 2020 10:07:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 64BE08B809;
 Thu,  9 Jul 2020 10:07:26 +0200 (CEST)
Subject: Re: [PATCH RESEND 1/2] powerpc/mce: Add MCE notification chain
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20200709075635.643740-1-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f722e532-070e-1961-3bae-6f385caa5ead@csgroup.eu>
Date: Thu, 9 Jul 2020 10:07:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709075635.643740-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/07/2020 à 09:56, Santosh Sivaraj a écrit :
> Introduce notification chain which lets know about uncorrected memory
> errors(UE). This would help prospective users in pmem or nvdimm subsystem
> to track bad blocks for better handling of persistent memory allocations.
> 
> Signed-off-by: Santosh S <santosh@fossix.org>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/mce.h |  2 ++
>   arch/powerpc/kernel/mce.c      | 15 +++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> Send the two patches together, so the dependencies are clear. The earlier patch reviews are
> here: https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/
> 
> Rebase the patches on top on 5.8-rc4
> 
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
> index 376a395daf329..a57b0772702a9 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -220,6 +220,8 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
>   unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>   extern void mce_common_process_ue(struct pt_regs *regs,
>   				  struct mce_error_info *mce_err);
> +extern int mce_register_notifier(struct notifier_block *nb);
> +extern int mce_unregister_notifier(struct notifier_block *nb);

Using the 'extern' keyword on function declaration is pointless and 
should be avoided in new patches. (checkpatch.pl --strict usually 
complains about it).

>   #ifdef CONFIG_PPC_BOOK3S_64
>   void flush_and_reload_slb(void);
>   #endif /* CONFIG_PPC_BOOK3S_64 */
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index fd90c0eda2290..b7b3ed4e61937 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -49,6 +49,20 @@ static struct irq_work mce_ue_event_irq_work = {
>   
>   DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
>   
> +static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
> +
> +int mce_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&mce_notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(mce_register_notifier);
> +
> +int mce_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(mce_unregister_notifier);
> +
>   static void mce_set_error_info(struct machine_check_event *mce,
>   			       struct mce_error_info *mce_err)
>   {
> @@ -278,6 +292,7 @@ static void machine_process_ue_event(struct work_struct *work)
>   	while (__this_cpu_read(mce_ue_count) > 0) {
>   		index = __this_cpu_read(mce_ue_count) - 1;
>   		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
> +		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
>   #ifdef CONFIG_MEMORY_FAILURE
>   		/*
>   		 * This should probably queued elsewhere, but
> 

Christophe
