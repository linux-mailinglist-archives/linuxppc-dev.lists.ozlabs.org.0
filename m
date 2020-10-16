Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A12906A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 15:51:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCSHJ32MHzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 00:51:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCSDL4mCkzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 00:48:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCSD46VJlz9vCxn;
 Fri, 16 Oct 2020 15:48:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id H5IoDJEepc-z; Fri, 16 Oct 2020 15:48:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCSD45S8Rz9vCxl;
 Fri, 16 Oct 2020 15:48:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FE218B84E;
 Fri, 16 Oct 2020 15:48:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y9yqIj0ZGUcb; Fri, 16 Oct 2020 15:48:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD6848B83E;
 Fri, 16 Oct 2020 15:48:37 +0200 (CEST)
Subject: Re: [PATCH 2/8] powerpc/signal: Add unsafe_copy_{vsx, fpr}_from_user()
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-3-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5e15b794-e33e-a871-3296-df1154b7d408@csgroup.eu>
Date: Fri, 16 Oct 2020 15:48:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015150159.28933-3-cmr@codefail.de>
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
> Reuse the "safe" implementation from signal.c except for calling
> unsafe_copy_from_user() to copy into a local buffer. Unlike the
> unsafe_copy_{vsx,fpr}_to_user() functions the "copy from" functions
> cannot use unsafe_get_user() directly to bypass the local buffer since
> doing so significantly reduces signal handling performance.

Why can't the functions use unsafe_get_user(), why does it significantly reduces signal handling 
performance ? How much significant ? I would expect that not going through an intermediate memory 
area would be more efficient

Christophe


> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal.h | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> index 2559a681536e..e9aaeac0da37 100644
> --- a/arch/powerpc/kernel/signal.h
> +++ b/arch/powerpc/kernel/signal.h
> @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
>   				&buf[i], label);\
>   } while (0)
>   
> +#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
> +	struct task_struct *__t = task;					\
> +	u64 __user *__f = (u64 __user *)from;				\
> +	u64 buf[ELF_NFPREG];						\
> +	int i;								\
> +									\
> +	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	\
> +				label);					\
> +	for (i = 0; i < ELF_NFPREG - 1; i++)				\
> +		__t->thread.TS_FPR(i) = buf[i];				\
> +	__t->thread.fp_state.fpscr = buf[i];				\
> +} while (0)
> +
> +#define unsafe_copy_vsx_from_user(task, from, label)	do {		\
> +	struct task_struct *__t = task;					\
> +	u64 __user *__f = (u64 __user *)from;				\
> +	u64 buf[ELF_NVSRHALFREG];					\
> +	int i;								\
> +									\
> +	unsafe_copy_from_user(buf, __f,					\
> +				ELF_NVSRHALFREG * sizeof(double),	\
> +				label);					\
> +	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
> +		__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];	\
> +} while (0)
> +
> +
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   #define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
>   	struct task_struct *__t = task;					\
> @@ -80,6 +107,10 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
>   	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
>   			    ELF_NFPREG * sizeof(double), label)
>   
> +#define unsafe_copy_fpr_from_user(task, from, label)		\
> +	unsafe_copy_from_user((task)->thread.fp_state.fpr, from	\
> +			    ELF_NFPREG * sizeof(double), label)
> +
>   static inline unsigned long
>   copy_fpr_to_user(void __user *to, struct task_struct *task)
>   {
> @@ -115,6 +146,8 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
>   #else
>   #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
>   
> +#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
> +
>   static inline unsigned long
>   copy_fpr_to_user(void __user *to, struct task_struct *task)
>   {
> 
