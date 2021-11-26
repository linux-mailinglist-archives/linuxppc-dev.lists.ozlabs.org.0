Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35245F1CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J10Tm0HRfz3cYB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 03:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J10TK4sWpz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 03:25:08 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J10TF2KRXz9sSM;
 Fri, 26 Nov 2021 17:25:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUCo4gl_1BVF; Fri, 26 Nov 2021 17:25:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J10TF1RBWz9sSL;
 Fri, 26 Nov 2021 17:25:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 214D88B781;
 Fri, 26 Nov 2021 17:25:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pKQRMnP2DWp8; Fri, 26 Nov 2021 17:25:05 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 565248B763;
 Fri, 26 Nov 2021 17:25:04 +0100 (CET)
Message-ID: <90ea33c6-2e93-ea19-3052-90e15979578f@csgroup.eu>
Date: Fri, 26 Nov 2021 17:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc: mm: radix_tlb: rearrange the if-else block
Content-Language: fr-FR
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20211125154406.470082-1-anders.roxell@linaro.org>
 <6b1e51a8-2f4d-2024-df90-a35c926d7a30@csgroup.eu>
 <CAK8P3a0n_n+PnfYmAdS9923yheLqYXRp8=65hKf9abLCRAX8ig@mail.gmail.com>
 <YaEBTbjGyUBmISGK@archlinux-ax161>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <YaEBTbjGyUBmISGK@archlinux-ax161>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 16:46, Nathan Chancellor a écrit :
> On Fri, Nov 26, 2021 at 02:59:29PM +0100, Arnd Bergmann wrote:
>> On Fri, Nov 26, 2021 at 2:43 PM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Le 25/11/2021 à 16:44, Anders Roxell a écrit :
>>> Can't you fix CLANG instead :) ?
>>>
>>> Or just add an else to the IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) that
>>> sets hstart and hend to 0 ?
>>
>> That doesn't sound any less risky than duplicating the code, it can lead to
>> incorrect changes just as easily if a patch ends up actually flushing at the
>> wrong address, and the compiler fails to complain because of the bogus
>> initialization.
>>
>>> Or just put hstart and hend calculation outside the IS_ENABLED() ? After
>>> all GCC should drop the calculation when not used.
>>
>> I like this one. I'm still unsure how clang can get so confused about whether
>> the variables are initialized or not, usually it handles this much better than
>> gcc. My best guess is that one of the memory clobbers makes it conclude
>> that 'hflush' can be true when it gets written to by an inline asm.
> 
> As far as I am aware, clang's analysis does not evaluate variables when
> generating a control flow graph and using that for static analysis:
> 
> https://godbolt.org/z/PdGxoq9j7
> 
> Based on the control flow graph, it knows that hstart and hend are
> uninitialized because IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) gets
> expanded to 0 by the preprocessor but it does not seem like it can piece
> together that hflush's value of false is only changed to true under the
> now 'if (0) {' branch, meaning that all the calls to __tlbiel_va_range()
> never get evaluated. That may or may not be easy to fix in clang but we
> run into issues like this so infrequently.
> 
> At any rate, the below diff works for me.
> 
> Cheers,
> Nathan
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 7724af19ed7e..156a631df976 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1174,12 +1174,10 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>   		bool hflush = false;
>   		unsigned long hstart, hend;
>   
> -		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> -			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
> -			hend = end & PMD_MASK;
> -			if (hstart < hend)
> -				hflush = true;
> -		}
> +		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
> +		hend = end & PMD_MASK;
> +		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend)
> +			hflush = true;

Yes I like that much better.

Maybe even better with

	hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;

(And remove default false value at declaration).

>   
>   		if (type == FLUSH_TYPE_LOCAL) {
>   			asm volatile("ptesync": : :"memory");
> 
