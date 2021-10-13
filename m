Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7142C079
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 14:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTshT5Cpjz306h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 23:45:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTsgy236Fz2yMg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 23:45:15 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HTsgq6Dhtz9sSZ;
 Wed, 13 Oct 2021 14:45:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJfMM_mh-Nz0; Wed, 13 Oct 2021 14:45:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HTsgq5CtZz9sSP;
 Wed, 13 Oct 2021 14:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B4B48B77E;
 Wed, 13 Oct 2021 14:45:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HiVledeU5Q_n; Wed, 13 Oct 2021 14:45:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 64F5C8B763;
 Wed, 13 Oct 2021 14:45:11 +0200 (CEST)
Subject: Re: [PATCH v1 09/10] lkdtm: Fix lkdtm_EXEC_RODATA()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <7da92e59e148bd23564d63bdd8bcfaba0ba6d1f1.1633964380.git.christophe.leroy@csgroup.eu>
 <202110130018.7B2129375@keescook>
 <be307455-b02b-f382-851f-091ea26040b7@csgroup.eu>
 <134b968f-f65f-cd74-3db1-fff60e5ebeb8@csgroup.eu>
Message-ID: <c87e4e91-ee66-77b8-863a-27a34f41623e@csgroup.eu>
Date: Wed, 13 Oct 2021 14:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <134b968f-f65f-cd74-3db1-fff60e5ebeb8@csgroup.eu>
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
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/10/2021 à 09:48, Christophe Leroy a écrit :
> 
> 
> Le 13/10/2021 à 09:39, Christophe Leroy a écrit :
>>
>>
>> Le 13/10/2021 à 09:23, Kees Cook a écrit :
>>> On Mon, Oct 11, 2021 at 05:25:36PM +0200, Christophe Leroy wrote:
>>>> Behind a location, lkdtm_EXEC_RODATA() executes a real function,
>>>> not a copy of do_nothing().
>>>>
>>>> So do it directly instead of using execute_location().
>>>>
>>>> And fix displayed addresses by dereferencing the function descriptors.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>>   drivers/misc/lkdtm/perms.c | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
>>>> index 442d60ed25ef..da16564e1ecd 100644
>>>> --- a/drivers/misc/lkdtm/perms.c
>>>> +++ b/drivers/misc/lkdtm/perms.c
>>>> @@ -153,7 +153,14 @@ void lkdtm_EXEC_VMALLOC(void)
>>>>
>>>>   void lkdtm_EXEC_RODATA(void)
>>>>   {
>>>> -    execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
>>>> +    pr_info("attempting ok execution at %px\n",
>>>> +        dereference_symbol_descriptor(do_nothing));
>>>> +    do_nothing();
>>>> +
>>>> +    pr_info("attempting bad execution at %px\n",
>>>> +        dereference_symbol_descriptor(lkdtm_rodata_do_nothing));
>>>> +    lkdtm_rodata_do_nothing();
>>>> +    pr_err("FAIL: func returned\n");
>>>>   }
>>>
>>> (In re-reading this more carefully, I see now why kallsyms.h is used
>>> earlier: _function_ vs _symbol_ descriptor.)
>>>
>>> In the next patch:
>>>
>>> static noinline void execute_location(void *dst, bool write)
>>> {
>>> ...
>>>         func = setup_function_descriptor(&fdesc, dst);
>>>         if (IS_ERR(func))
>>>                 return;
>>>
>>>         pr_info("attempting bad execution at %px\n", dst);
>>>         func();
>>>         pr_err("FAIL: func returned\n");
>>> }
>>>
>>> What are the conditions for which dereference_symbol_descriptor works
>>> but dereference _function_descriptor doesn't?
>>>
>>
>> When LKDTM is built as a module I guess ?
>>
> 
> To be more precise, dereference_symbol_descriptor() calls either 
> dereference_kernel_function_descriptor() or 
> dereference_module_function_descriptor()
> 
> Both functions call dereference_function_descriptor() after checking 
> that we want to dereference something that is in the OPD section.
> 
> If we call dereference_function_descriptor() directly instead of 
> dereference_symbol_descriptor() we skip the range verification and may 
> dereference something that is not a function descriptor.
> 
> Should we do that ?
> 

Indeed we are using it only for well known functions so using 
dereference_function_descriptor() is good enough. I'll use that in v2.
