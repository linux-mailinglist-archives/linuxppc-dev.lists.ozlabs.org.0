Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC272429D84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 08:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT50C3FGtz2yPl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 17:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT4zl5HrFz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 17:11:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HT4zg2MvVz9sTt;
 Tue, 12 Oct 2021 08:11:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESq3r2SxTcuk; Tue, 12 Oct 2021 08:11:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HT4zg1Kb8z9sTq;
 Tue, 12 Oct 2021 08:11:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 155688B76E;
 Tue, 12 Oct 2021 08:11:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N0ZWAChyDGr0; Tue, 12 Oct 2021 08:11:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po18920.idsi0.si.c-s.fr
 [192.168.202.149])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6698B763;
 Tue, 12 Oct 2021 08:11:09 +0200 (CEST)
Subject: Re: [PATCH v1 04/10] asm-generic: Use
 HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to define associated stubs
To: Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8db2a3ca2b26a8325c671baa3e0492914597f079.1633964380.git.christophe.leroy@csgroup.eu>
 <91b38fce-8a5c-ccc7-fba5-b75b9769d4fc@gmx.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <09bcd71a-baae-92b7-4c89-c8d446396d1c@csgroup.eu>
Date: Tue, 12 Oct 2021 08:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <91b38fce-8a5c-ccc7-fba5-b75b9769d4fc@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/10/2021 à 08:02, Helge Deller a écrit :
> On 10/11/21 17:25, Christophe Leroy wrote:
>> Use HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR instead of 'dereference_function_descriptor'
>> to know whether arch has function descriptors.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/ia64/include/asm/sections.h    | 4 ++--
>>   arch/parisc/include/asm/sections.h  | 6 ++++--
>>   arch/powerpc/include/asm/sections.h | 6 ++++--
>>   include/asm-generic/sections.h      | 3 ++-
>>   4 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
>> index 35f24e52149a..80f5868afb06 100644
>> --- a/arch/ia64/include/asm/sections.h
>> +++ b/arch/ia64/include/asm/sections.h
>> @@ -7,6 +7,8 @@
>>    *	David Mosberger-Tang <davidm@hpl.hp.com>
>>    */
>>
>> +#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>> +
>>   #include <linux/elf.h>
>>   #include <linux/uaccess.h>
>>   #include <asm-generic/sections.h>
>> @@ -27,8 +29,6 @@ extern char __start_gate_brl_fsys_bubble_down_patchlist[], __end_gate_brl_fsys_b
>>   extern char __start_unwind[], __end_unwind[];
>>   extern char __start_ivt_text[], __end_ivt_text[];
>>
>> -#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>> -
>>   #undef dereference_function_descriptor
>>   static inline void *dereference_function_descriptor(void *ptr)
>>   {
>> diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/sections.h
>> index bb52aea0cb21..2e781ee19b66 100644
>> --- a/arch/parisc/include/asm/sections.h
>> +++ b/arch/parisc/include/asm/sections.h
>> @@ -2,6 +2,10 @@
>>   #ifndef _PARISC_SECTIONS_H
>>   #define _PARISC_SECTIONS_H
>>
>> +#ifdef CONFIG_64BIT
>> +#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>> +#endif
>> +
>>   /* nothing to see, move along */
>>   #include <asm-generic/sections.h>
>>
>> @@ -9,8 +13,6 @@ extern char __alt_instructions[], __alt_instructions_end[];
>>
>>   #ifdef CONFIG_64BIT
>>
>> -#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>> -
>>   #undef dereference_function_descriptor
>>   void *dereference_function_descriptor(void *);
>>
>> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
>> index 32e7035863ac..b7f1ba04e756 100644
>> --- a/arch/powerpc/include/asm/sections.h
>> +++ b/arch/powerpc/include/asm/sections.h
>> @@ -8,6 +8,10 @@
>>
>>   #define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
>>
>> +#ifdef PPC64_ELF_ABI_v1
>> +#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>> +#endif
>> +
>>   #include <asm-generic/sections.h>
>>
>>   extern bool init_mem_is_free;
>> @@ -69,8 +73,6 @@ static inline int overlaps_kernel_text(unsigned long start, unsigned long end)
>>
>>   #ifdef PPC64_ELF_ABI_v1
>>
>> -#define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>> -
>>   #undef dereference_function_descriptor
>>   static inline void *dereference_function_descriptor(void *ptr)
>>   {
>> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
>> index d16302d3eb59..1db5cfd69817 100644
>> --- a/include/asm-generic/sections.h
>> +++ b/include/asm-generic/sections.h
>> @@ -59,7 +59,8 @@ extern char __noinstr_text_start[], __noinstr_text_end[];
>>   extern __visible const void __nosave_begin, __nosave_end;
>>
>>   /* Function descriptor handling (if any).  Override in asm/sections.h */
>> -#ifndef dereference_function_descriptor
>> +#ifdef HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR
>> +#else
> 
> why not
> #ifndef HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR
> instead of #if/#else ?

To avoid changing it again in patch 6, or getting an ugly #ifndef/#else 
at the end.

> 
>>   #define dereference_function_descriptor(p) ((void *)(p))
>>   #define dereference_kernel_function_descriptor(p) ((void *)(p))
>>   #endif
>>
> 
