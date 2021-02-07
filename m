Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B4312366
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 11:13:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYQ3771hyzDvXn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 21:13:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYQ1d32RfzDvXJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 21:12:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DYQ1V5PgPz9txrW;
 Sun,  7 Feb 2021 11:11:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dxu8rU2VTwHB; Sun,  7 Feb 2021 11:11:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DYQ1V3JsTz9txrV;
 Sun,  7 Feb 2021 11:11:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C7B48B788;
 Sun,  7 Feb 2021 11:12:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ceQZmop64mtj; Sun,  7 Feb 2021 11:12:01 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15DE38B766;
 Sun,  7 Feb 2021 11:12:01 +0100 (CET)
Subject: Re: [PATCH 2/8] powerpc/signal: Add unsafe_copy_{vsx, fpr}_from_user()
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <C92MQRHFCFEA.37OV051PFFY6@geist>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1caa3c1e-bf4e-700e-efea-28964005bb12@csgroup.eu>
Date: Sun, 7 Feb 2021 11:12:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <C92MQRHFCFEA.37OV051PFFY6@geist>
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



Le 06/02/2021 à 18:39, Christopher M. Riedl a écrit :
> On Sat Feb 6, 2021 at 10:32 AM CST, Christophe Leroy wrote:
>>
>>
>> Le 20/10/2020 à 04:01, Christopher M. Riedl a écrit :
>>> On Fri Oct 16, 2020 at 10:48 AM CDT, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 15/10/2020 à 17:01, Christopher M. Riedl a écrit :
>>>>> Reuse the "safe" implementation from signal.c except for calling
>>>>> unsafe_copy_from_user() to copy into a local buffer. Unlike the
>>>>> unsafe_copy_{vsx,fpr}_to_user() functions the "copy from" functions
>>>>> cannot use unsafe_get_user() directly to bypass the local buffer since
>>>>> doing so significantly reduces signal handling performance.
>>>>
>>>> Why can't the functions use unsafe_get_user(), why does it significantly
>>>> reduces signal handling
>>>> performance ? How much significant ? I would expect that not going
>>>> through an intermediate memory
>>>> area would be more efficient
>>>>
>>>
>>> Here is a comparison, 'unsafe-signal64-regs' avoids the intermediate buffer:
>>>
>>> 	|                      | hash   | radix  |
>>> 	| -------------------- | ------ | ------ |
>>> 	| linuxppc/next        | 289014 | 158408 |
>>> 	| unsafe-signal64      | 298506 | 253053 |
>>> 	| unsafe-signal64-regs | 254898 | 220831 |
>>>
>>> I have not figured out the 'why' yet. As you mentioned in your series,
>>> technically calling __copy_tofrom_user() is overkill for these
>>> operations. The only obvious difference between unsafe_put_user() and
>>> unsafe_get_user() is that we don't have asm-goto for the 'get' variant.
>>> Instead we wrap with unsafe_op_wrap() which inserts a conditional and
>>> then goto to the label.
>>>
>>> Implemenations:
>>>
>>> 	#define unsafe_copy_fpr_from_user(task, from, label)   do {            \
>>> 	       struct task_struct *__t = task;                                 \
>>> 	       u64 __user *buf = (u64 __user *)from;                           \
>>> 	       int i;                                                          \
>>> 									       \
>>> 	       for (i = 0; i < ELF_NFPREG - 1; i++)                            \
>>> 		       unsafe_get_user(__t->thread.TS_FPR(i), &buf[i], label); \
>>> 	       unsafe_get_user(__t->thread.fp_state.fpscr, &buf[i], label);    \
>>> 	} while (0)
>>>
>>> 	#define unsafe_copy_vsx_from_user(task, from, label)   do {            \
>>> 	       struct task_struct *__t = task;                                 \
>>> 	       u64 __user *buf = (u64 __user *)from;                           \
>>> 	       int i;                                                          \
>>> 									       \
>>> 	       for (i = 0; i < ELF_NVSRHALFREG ; i++)                          \
>>> 		       unsafe_get_user(__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET], \
>>> 				       &buf[i], label);                        \
>>> 	} while (0)
>>>
>>
>> Do you have CONFIG_PROVE_LOCKING or CONFIG_DEBUG_ATOMIC_SLEEP enabled in
>> your config ?
> 
> I don't have these set in my config (ppc64le_defconfig). I think I
> figured this out - the reason for the lower signal throughput is the
> barrier_nospec() in __get_user_nocheck(). When looping we incur that
> cost on every iteration. Commenting it out results in signal performance
> of ~316K w/ hash on the unsafe-signal64-regs branch. Obviously the
> barrier is there for a reason but it is quite costly.

Interesting.

Can you try with the patch I just sent out 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/c72f014730823b413528e90ab6c4d3bcb79f8497.1612692067.git.christophe.leroy@csgroup.eu/

Thanks
Christophe
