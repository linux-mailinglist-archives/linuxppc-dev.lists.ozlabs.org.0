Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E682F42B95F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTkvk4gc3z2yZf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTkvH6b82z2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HTkvC3NdVz9sSS;
 Wed, 13 Oct 2021 09:39:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TkwAiuNfAn6; Wed, 13 Oct 2021 09:39:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HTkvC2VHFz9sRn;
 Wed, 13 Oct 2021 09:39:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D8048B77E;
 Wed, 13 Oct 2021 09:39:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Hl8eIAk3DFNP; Wed, 13 Oct 2021 09:39:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 104368B763;
 Wed, 13 Oct 2021 09:39:35 +0200 (CEST)
Subject: Re: [PATCH v1 09/10] lkdtm: Fix lkdtm_EXEC_RODATA()
To: Kees Cook <keescook@chromium.org>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <7da92e59e148bd23564d63bdd8bcfaba0ba6d1f1.1633964380.git.christophe.leroy@csgroup.eu>
 <202110130018.7B2129375@keescook>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <be307455-b02b-f382-851f-091ea26040b7@csgroup.eu>
Date: Wed, 13 Oct 2021 09:39:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202110130018.7B2129375@keescook>
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



Le 13/10/2021 à 09:23, Kees Cook a écrit :
> On Mon, Oct 11, 2021 at 05:25:36PM +0200, Christophe Leroy wrote:
>> Behind a location, lkdtm_EXEC_RODATA() executes a real function,
>> not a copy of do_nothing().
>>
>> So do it directly instead of using execute_location().
>>
>> And fix displayed addresses by dereferencing the function descriptors.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   drivers/misc/lkdtm/perms.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
>> index 442d60ed25ef..da16564e1ecd 100644
>> --- a/drivers/misc/lkdtm/perms.c
>> +++ b/drivers/misc/lkdtm/perms.c
>> @@ -153,7 +153,14 @@ void lkdtm_EXEC_VMALLOC(void)
>>
>>   void lkdtm_EXEC_RODATA(void)
>>   {
>> -	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
>> +	pr_info("attempting ok execution at %px\n",
>> +		dereference_symbol_descriptor(do_nothing));
>> +	do_nothing();
>> +
>> +	pr_info("attempting bad execution at %px\n",
>> +		dereference_symbol_descriptor(lkdtm_rodata_do_nothing));
>> +	lkdtm_rodata_do_nothing();
>> +	pr_err("FAIL: func returned\n");
>>   }
> 
> (In re-reading this more carefully, I see now why kallsyms.h is used
> earlier: _function_ vs _symbol_ descriptor.)
> 
> In the next patch:
> 
> static noinline void execute_location(void *dst, bool write)
> {
> ...
>         func = setup_function_descriptor(&fdesc, dst);
>         if (IS_ERR(func))
>                 return;
> 
>         pr_info("attempting bad execution at %px\n", dst);
>         func();
>         pr_err("FAIL: func returned\n");
> }
> 
> What are the conditions for which dereference_symbol_descriptor works
> but dereference _function_descriptor doesn't?
> 

When LKDTM is built as a module I guess ?

Christophe
