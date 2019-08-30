Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20992A3EF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:27:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Krcl5yQDzDr7N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tiBik0Ug"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrWS5CRgzDr7P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:22:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KrWP2CQTz9v7DV;
 Fri, 30 Aug 2019 22:22:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tiBik0Ug; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UPE7pN6RCdlH; Fri, 30 Aug 2019 22:22:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KrWP14Mkz9v7DT;
 Fri, 30 Aug 2019 22:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567196561; bh=/rJmGIEQWuJ0LF6lPlvlARESl/QdAahuYDIB8EE/APA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tiBik0UgPJWWdXmzvxl7AI/nRGtosfr2HeowK/NA6W/p9S2w89Cyh8W/ktkDP/ZiM
 Dcs8mI/DLZRE8DmdOWuyFhtHasDvv7RvQ4aatFwlWnLCwr57DQdnqAUSjtNnhlt4QS
 Y4V+E6v6pDWDe9Xy0V/7F9fDv9XzDyjPkdMI40Po=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F6558B911;
 Fri, 30 Aug 2019 22:22:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uphW0UXcMZhi; Fri, 30 Aug 2019 22:22:41 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFE078B90B;
 Fri, 30 Aug 2019 22:22:39 +0200 (CEST)
Subject: Re: [PATCH v6 2/6] powerpc: move common register copy functions from
 signal_32.c to signal.c
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567188299.git.msuchanek@suse.de>
 <36b04bccb129087a78a068207fc71194a1064667.1567188299.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b4eba1ab-2659-53a8-d7dd-c4715e64fe36@c-s.fr>
Date: Fri, 30 Aug 2019 22:22:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <36b04bccb129087a78a068207fc71194a1064667.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 20:57, Michal Suchanek a écrit :
> These functions are required for 64bit as well.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: christophe.leroy@c-s.fr


> ---
>   arch/powerpc/kernel/signal.c    | 141 ++++++++++++++++++++++++++++++++
>   arch/powerpc/kernel/signal_32.c | 140 -------------------------------
>   2 files changed, 141 insertions(+), 140 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index e6c30cee6abf..60436432399f 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -18,12 +18,153 @@
>   #include <linux/syscalls.h>
>   #include <asm/hw_breakpoint.h>
>   #include <linux/uaccess.h>
> +#include <asm/switch_to.h>
>   #include <asm/unistd.h>
>   #include <asm/debug.h>
>   #include <asm/tm.h>
>   
>   #include "signal.h"
>   
> +#ifdef CONFIG_VSX
> +unsigned long copy_fpr_to_user(void __user *to,
> +			       struct task_struct *task)
> +{
> +	u64 buf[ELF_NFPREG];
> +	int i;
> +
> +	/* save FPR copy to local buffer then write to the thread_struct */
> +	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> +		buf[i] = task->thread.TS_FPR(i);
> +	buf[i] = task->thread.fp_state.fpscr;
> +	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
> +}
> +
> +unsigned long copy_fpr_from_user(struct task_struct *task,
> +				 void __user *from)
> +{
> +	u64 buf[ELF_NFPREG];
> +	int i;
> +
> +	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
> +		return 1;
> +	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> +		task->thread.TS_FPR(i) = buf[i];
> +	task->thread.fp_state.fpscr = buf[i];
> +
> +	return 0;
> +}
> +
> +unsigned long copy_vsx_to_user(void __user *to,
> +			       struct task_struct *task)
> +{
> +	u64 buf[ELF_NVSRHALFREG];
> +	int i;
> +
> +	/* save FPR copy to local buffer then write to the thread_struct */
> +	for (i = 0; i < ELF_NVSRHALFREG; i++)
> +		buf[i] = task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
> +	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
> +}
> +
> +unsigned long copy_vsx_from_user(struct task_struct *task,
> +				 void __user *from)
> +{
> +	u64 buf[ELF_NVSRHALFREG];
> +	int i;
> +
> +	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
> +		return 1;
> +	for (i = 0; i < ELF_NVSRHALFREG ; i++)
> +		task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +unsigned long copy_ckfpr_to_user(void __user *to,
> +				  struct task_struct *task)
> +{
> +	u64 buf[ELF_NFPREG];
> +	int i;
> +
> +	/* save FPR copy to local buffer then write to the thread_struct */
> +	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> +		buf[i] = task->thread.TS_CKFPR(i);
> +	buf[i] = task->thread.ckfp_state.fpscr;
> +	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
> +}
> +
> +unsigned long copy_ckfpr_from_user(struct task_struct *task,
> +					  void __user *from)
> +{
> +	u64 buf[ELF_NFPREG];
> +	int i;
> +
> +	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
> +		return 1;
> +	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> +		task->thread.TS_CKFPR(i) = buf[i];
> +	task->thread.ckfp_state.fpscr = buf[i];
> +
> +	return 0;
> +}
> +
> +unsigned long copy_ckvsx_to_user(void __user *to,
> +				  struct task_struct *task)
> +{
> +	u64 buf[ELF_NVSRHALFREG];
> +	int i;
> +
> +	/* save FPR copy to local buffer then write to the thread_struct */
> +	for (i = 0; i < ELF_NVSRHALFREG; i++)
> +		buf[i] = task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
> +	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
> +}
> +
> +unsigned long copy_ckvsx_from_user(struct task_struct *task,
> +					  void __user *from)
> +{
> +	u64 buf[ELF_NVSRHALFREG];
> +	int i;
> +
> +	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
> +		return 1;
> +	for (i = 0; i < ELF_NVSRHALFREG ; i++)
> +		task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
> +	return 0;
> +}
> +#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> +#else
> +inline unsigned long copy_fpr_to_user(void __user *to,
> +				      struct task_struct *task)
> +{
> +	return __copy_to_user(to, task->thread.fp_state.fpr,
> +			      ELF_NFPREG * sizeof(double));
> +}
> +
> +inline unsigned long copy_fpr_from_user(struct task_struct *task,
> +					void __user *from)
> +{
> +	return __copy_from_user(task->thread.fp_state.fpr, from,
> +			      ELF_NFPREG * sizeof(double));
> +}
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +inline unsigned long copy_ckfpr_to_user(void __user *to,
> +					 struct task_struct *task)
> +{
> +	return __copy_to_user(to, task->thread.ckfp_state.fpr,
> +			      ELF_NFPREG * sizeof(double));
> +}
> +
> +inline unsigned long copy_ckfpr_from_user(struct task_struct *task,
> +						 void __user *from)
> +{
> +	return __copy_from_user(task->thread.ckfp_state.fpr, from,
> +				ELF_NFPREG * sizeof(double));
> +}
> +#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> +#endif
> +
>   /* Log an error when sending an unhandled signal to a process. Controlled
>    * through debug.exception-trace sysctl.
>    */
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 98600b276f76..c93c937ea568 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -235,146 +235,6 @@ struct rt_sigframe {
>   	int			abigap[56];
>   };
>   
> -#ifdef CONFIG_VSX
> -unsigned long copy_fpr_to_user(void __user *to,
> -			       struct task_struct *task)
> -{
> -	u64 buf[ELF_NFPREG];
> -	int i;
> -
> -	/* save FPR copy to local buffer then write to the thread_struct */
> -	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> -		buf[i] = task->thread.TS_FPR(i);
> -	buf[i] = task->thread.fp_state.fpscr;
> -	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
> -}
> -
> -unsigned long copy_fpr_from_user(struct task_struct *task,
> -				 void __user *from)
> -{
> -	u64 buf[ELF_NFPREG];
> -	int i;
> -
> -	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
> -		return 1;
> -	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> -		task->thread.TS_FPR(i) = buf[i];
> -	task->thread.fp_state.fpscr = buf[i];
> -
> -	return 0;
> -}
> -
> -unsigned long copy_vsx_to_user(void __user *to,
> -			       struct task_struct *task)
> -{
> -	u64 buf[ELF_NVSRHALFREG];
> -	int i;
> -
> -	/* save FPR copy to local buffer then write to the thread_struct */
> -	for (i = 0; i < ELF_NVSRHALFREG; i++)
> -		buf[i] = task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
> -	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
> -}
> -
> -unsigned long copy_vsx_from_user(struct task_struct *task,
> -				 void __user *from)
> -{
> -	u64 buf[ELF_NVSRHALFREG];
> -	int i;
> -
> -	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
> -		return 1;
> -	for (i = 0; i < ELF_NVSRHALFREG ; i++)
> -		task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> -unsigned long copy_ckfpr_to_user(void __user *to,
> -				  struct task_struct *task)
> -{
> -	u64 buf[ELF_NFPREG];
> -	int i;
> -
> -	/* save FPR copy to local buffer then write to the thread_struct */
> -	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> -		buf[i] = task->thread.TS_CKFPR(i);
> -	buf[i] = task->thread.ckfp_state.fpscr;
> -	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
> -}
> -
> -unsigned long copy_ckfpr_from_user(struct task_struct *task,
> -					  void __user *from)
> -{
> -	u64 buf[ELF_NFPREG];
> -	int i;
> -
> -	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
> -		return 1;
> -	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
> -		task->thread.TS_CKFPR(i) = buf[i];
> -	task->thread.ckfp_state.fpscr = buf[i];
> -
> -	return 0;
> -}
> -
> -unsigned long copy_ckvsx_to_user(void __user *to,
> -				  struct task_struct *task)
> -{
> -	u64 buf[ELF_NVSRHALFREG];
> -	int i;
> -
> -	/* save FPR copy to local buffer then write to the thread_struct */
> -	for (i = 0; i < ELF_NVSRHALFREG; i++)
> -		buf[i] = task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
> -	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
> -}
> -
> -unsigned long copy_ckvsx_from_user(struct task_struct *task,
> -					  void __user *from)
> -{
> -	u64 buf[ELF_NVSRHALFREG];
> -	int i;
> -
> -	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
> -		return 1;
> -	for (i = 0; i < ELF_NVSRHALFREG ; i++)
> -		task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
> -	return 0;
> -}
> -#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> -#else
> -inline unsigned long copy_fpr_to_user(void __user *to,
> -				      struct task_struct *task)
> -{
> -	return __copy_to_user(to, task->thread.fp_state.fpr,
> -			      ELF_NFPREG * sizeof(double));
> -}
> -
> -inline unsigned long copy_fpr_from_user(struct task_struct *task,
> -					void __user *from)
> -{
> -	return __copy_from_user(task->thread.fp_state.fpr, from,
> -			      ELF_NFPREG * sizeof(double));
> -}
> -
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> -inline unsigned long copy_ckfpr_to_user(void __user *to,
> -					 struct task_struct *task)
> -{
> -	return __copy_to_user(to, task->thread.ckfp_state.fpr,
> -			      ELF_NFPREG * sizeof(double));
> -}
> -
> -inline unsigned long copy_ckfpr_from_user(struct task_struct *task,
> -						 void __user *from)
> -{
> -	return __copy_from_user(task->thread.ckfp_state.fpr, from,
> -				ELF_NFPREG * sizeof(double));
> -}
> -#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> -#endif
> -
>   /*
>    * Save the current user registers on the user stack.
>    * We only save the altivec/spe registers if the process has used
> 
