Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F5457318
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 17:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hwj2T5gMpz3c73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 03:35:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hwj233zvpz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 03:35:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hwj1y0P6Wz9sS7;
 Fri, 19 Nov 2021 17:35:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScUWaeylmfz1; Fri, 19 Nov 2021 17:35:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hwj1x6TGcz9sS4;
 Fri, 19 Nov 2021 17:35:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C63F38B7E7;
 Fri, 19 Nov 2021 17:35:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AVSSndVnRXwL; Fri, 19 Nov 2021 17:35:01 +0100 (CET)
Received: from [192.168.203.70] (unknown [192.168.203.70])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B921B8B765;
 Fri, 19 Nov 2021 17:35:00 +0100 (CET)
Message-ID: <7f4e7d24-6eb0-5ecf-3497-61c3633046bd@csgroup.eu>
Date: Fri, 19 Nov 2021 17:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Content-Language: fr-FR
To: Kees Cook <keescook@chromium.org>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
 <202111190824.AEBBE1328@keescook>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <202111190824.AEBBE1328@keescook>
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/11/2021 à 17:28, Kees Cook a écrit :
> On Fri, Nov 19, 2021 at 08:46:27AM +0000, LEROY Christophe wrote:
>>
>>
>> Le 18/11/2021 à 21:36, Kees Cook a écrit :
>>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>>> field bounds checking for memset(), avoid intentionally writing across
>>> neighboring fields.
>>>
>>> Add a struct_group() for the spe registers so that memset() can correctly reason
>>> about the size:
>>>
>>>      In function 'fortify_memset_chk',
>>>          inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
>>>      >> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>>>        195 |    __write_overflow_field();
>>>            |    ^~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>> However, is it really worth adding that grouping ? Wouldn't it be
>> cleaner to handle evr[] and acc separately ? Now that we are using
>> unsafe variants of get/put user performance wouldn't be impacted.
> 
> I'm fine with whatever is desired here. I reworked an earlier version of
> this patch based on mpe's feedback, so I can certain rework it again. :)

Well, with oddities like the below, it may not be straight forward. If 
the objective is to enable FORTIFY_SOURCE, maybe that's good enough.

Let see if Michael has any opinion.


> 
>>
>> I have some doubts about things like:
>>
>> 	unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
>> 				    ELF_NEVRREG * sizeof(u32), failed);
>>
>> Because as far as I can see, ELF_NEVRREG is 34 but mc_vregs is a table
>> of 33 u32 and is at the end of the structure:
>>
>> 	struct mcontext {
>> 		elf_gregset_t	mc_gregs;
>> 		elf_fpregset_t	mc_fregs;
>> 		unsigned long	mc_pad[2];
>> 		elf_vrregset_t	mc_vregs __attribute__((__aligned__(16)));
>> 	};
>>
>> 	typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>>
>> 	# define ELF_NEVRREG	34	/* includes acc (as 2) */
>> 	# define ELF_NVRREG	33	/* includes vscr */
> 
> I don't know these internals very well -- do you want me to change this
> specifically somehow? With the BUILD_BUG_ON()s added, there's no binary
> change here -- I wanted to make sure nothing was different in the
> output.
> 

Neither do I. I was just scared by what I saw while reviewing your 
patch. A cleanup is probably required but it can be another patch.

Christophe
