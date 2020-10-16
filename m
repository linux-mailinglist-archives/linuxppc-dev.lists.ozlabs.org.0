Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E178C28FED0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 09:04:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCHFC6wq0zDqlX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 18:03:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCHCZ559bzDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 18:02:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCHCL1jwPzB09ZX;
 Fri, 16 Oct 2020 09:02:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KDuBf8C_EIfS; Fri, 16 Oct 2020 09:02:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCHCL0kPTzB09ZV;
 Fri, 16 Oct 2020 09:02:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C0A0C8B82F;
 Fri, 16 Oct 2020 09:02:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YkSq3sGb1ryz; Fri, 16 Oct 2020 09:02:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 382938B82E;
 Fri, 16 Oct 2020 09:02:22 +0200 (CEST)
Subject: Re: [PATCH 3/8] powerpc: Mark functions called inside uaccess blocks
 w/ 'notrace'
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-4-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <30d9ccba-20a5-37b4-1629-d0f9e0da4c84@csgroup.eu>
Date: Fri, 16 Oct 2020 09:02:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015150159.28933-4-cmr@codefail.de>
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



Le 15/10/2020 à 17:01, Christopher M. Riedl a écrit :
> Functions called between user_*_access_begin() and user_*_access_end()
> should be either inlined or marked 'notrace' to prevent leaving
> userspace access exposed. Mark any such functions relevant to signal
> handling so that subsequent patches can call them inside uaccess blocks.

Is it enough to mark it "notrace" ? I see that when I activate KASAN, there are still KASAN calls in 
those functions.

In my series for 32 bits, I re-ordered stuff in order to do all those calls before doing the 
_access_begin(), can't you do the same on PPC64 ? (See 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/f6eac65781b4a57220477c8864bca2b57f29a5d5.1597770847.git.christophe.leroy@csgroup.eu/)

Christophe

> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/process.c | 20 ++++++++++----------
>   arch/powerpc/mm/mem.c         |  4 ++--
>   2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index ba2c987b8403..bf5d9654bd2c 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -84,7 +84,7 @@ extern unsigned long _get_SP(void);
>    */
>   bool tm_suspend_disabled __ro_after_init = false;
>   
> -static void check_if_tm_restore_required(struct task_struct *tsk)
> +static void notrace check_if_tm_restore_required(struct task_struct *tsk)
>   {
>   	/*
>   	 * If we are saving the current thread's registers, and the
> @@ -151,7 +151,7 @@ void notrace __msr_check_and_clear(unsigned long bits)
>   EXPORT_SYMBOL(__msr_check_and_clear);
>   
>   #ifdef CONFIG_PPC_FPU
> -static void __giveup_fpu(struct task_struct *tsk)
> +static void notrace __giveup_fpu(struct task_struct *tsk)
>   {
>   	unsigned long msr;
>   
> @@ -163,7 +163,7 @@ static void __giveup_fpu(struct task_struct *tsk)
>   	tsk->thread.regs->msr = msr;
>   }
>   
> -void giveup_fpu(struct task_struct *tsk)
> +void notrace giveup_fpu(struct task_struct *tsk)
>   {
>   	check_if_tm_restore_required(tsk);
>   
> @@ -177,7 +177,7 @@ EXPORT_SYMBOL(giveup_fpu);
>    * Make sure the floating-point register state in the
>    * the thread_struct is up to date for task tsk.
>    */
> -void flush_fp_to_thread(struct task_struct *tsk)
> +void notrace flush_fp_to_thread(struct task_struct *tsk)
>   {
>   	if (tsk->thread.regs) {
>   		/*
> @@ -234,7 +234,7 @@ static inline void __giveup_fpu(struct task_struct *tsk) { }
>   #endif /* CONFIG_PPC_FPU */
>   
>   #ifdef CONFIG_ALTIVEC
> -static void __giveup_altivec(struct task_struct *tsk)
> +static void notrace __giveup_altivec(struct task_struct *tsk)
>   {
>   	unsigned long msr;
>   
> @@ -246,7 +246,7 @@ static void __giveup_altivec(struct task_struct *tsk)
>   	tsk->thread.regs->msr = msr;
>   }
>   
> -void giveup_altivec(struct task_struct *tsk)
> +void notrace giveup_altivec(struct task_struct *tsk)
>   {
>   	check_if_tm_restore_required(tsk);
>   
> @@ -285,7 +285,7 @@ EXPORT_SYMBOL(enable_kernel_altivec);
>    * Make sure the VMX/Altivec register state in the
>    * the thread_struct is up to date for task tsk.
>    */
> -void flush_altivec_to_thread(struct task_struct *tsk)
> +void notrace flush_altivec_to_thread(struct task_struct *tsk)
>   {
>   	if (tsk->thread.regs) {
>   		preempt_disable();
> @@ -300,7 +300,7 @@ EXPORT_SYMBOL_GPL(flush_altivec_to_thread);
>   #endif /* CONFIG_ALTIVEC */
>   
>   #ifdef CONFIG_VSX
> -static void __giveup_vsx(struct task_struct *tsk)
> +static void notrace __giveup_vsx(struct task_struct *tsk)
>   {
>   	unsigned long msr = tsk->thread.regs->msr;
>   
> @@ -317,7 +317,7 @@ static void __giveup_vsx(struct task_struct *tsk)
>   		__giveup_altivec(tsk);
>   }
>   
> -static void giveup_vsx(struct task_struct *tsk)
> +static void notrace giveup_vsx(struct task_struct *tsk)
>   {
>   	check_if_tm_restore_required(tsk);
>   
> @@ -352,7 +352,7 @@ void enable_kernel_vsx(void)
>   }
>   EXPORT_SYMBOL(enable_kernel_vsx);
>   
> -void flush_vsx_to_thread(struct task_struct *tsk)
> +void notrace flush_vsx_to_thread(struct task_struct *tsk)
>   {
>   	if (tsk->thread.regs) {
>   		preempt_disable();
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ddc32cc1b6cf..da2345a2abc6 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -378,7 +378,7 @@ static inline bool flush_coherent_icache(unsigned long addr)
>    * @start: the start address
>    * @stop: the stop address (exclusive)
>    */
> -static void invalidate_icache_range(unsigned long start, unsigned long stop)
> +static void notrace invalidate_icache_range(unsigned long start, unsigned long stop)
>   {
>   	unsigned long shift = l1_icache_shift();
>   	unsigned long bytes = l1_icache_bytes();
> @@ -402,7 +402,7 @@ static void invalidate_icache_range(unsigned long start, unsigned long stop)
>    * @start: the start address
>    * @stop: the stop address (exclusive)
>    */
> -void flush_icache_range(unsigned long start, unsigned long stop)
> +void notrace flush_icache_range(unsigned long start, unsigned long stop)
>   {
>   	if (flush_coherent_icache(start))
>   		return;
> 
