Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75642BF5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 14:01:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTrjB50zLz3c6S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 23:01:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTrhm0z5hz2xss
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 23:00:54 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HTrhg3GGJz9sSP;
 Wed, 13 Oct 2021 14:00:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWmm-fqIIxwb; Wed, 13 Oct 2021 14:00:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HTrhg2CRyz9sSN;
 Wed, 13 Oct 2021 14:00:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34B3D8B77E;
 Wed, 13 Oct 2021 14:00:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oPJNy44hoNDg; Wed, 13 Oct 2021 14:00:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E21F08B763;
 Wed, 13 Oct 2021 14:00:50 +0200 (CEST)
Subject: Re: [PATCH v1 10/10] lkdtm: Fix execute_[user]_location()
To: Kees Cook <keescook@chromium.org>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <c551f3f4b803d1a4a184b0fa94475d405ba436d8.1633964380.git.christophe.leroy@csgroup.eu>
 <202110130012.4608FFD38E@keescook>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8f2e80a9-bef1-2594-61ed-85d510e00cf2@csgroup.eu>
Date: Wed, 13 Oct 2021 14:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202110130012.4608FFD38E@keescook>
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



Le 13/10/2021 à 09:16, Kees Cook a écrit :
> On Mon, Oct 11, 2021 at 05:25:37PM +0200, Christophe Leroy wrote:
>> execute_location() and execute_user_location() intent
>> to copy do_nothing() text and execute it at a new location.
>> However, at the time being it doesn't copy do_nothing() function
>> but do_nothing() function descriptor which still points to the
>> original text. So at the end it still executes do_nothing() at
>> its original location allthough using a copied function descriptor.
>>
>> So, fix that by really copying do_nothing() text and build a new
>> function descriptor by copying do_nothing() function descriptor and
>> updating the target address with the new location.
>>
>> Also fix the displayed addresses by dereferencing do_nothing()
>> function descriptor.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   drivers/misc/lkdtm/perms.c | 45 +++++++++++++++++++++++++++++++-------
>>   1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
>> index da16564e1ecd..1d03cd44c21d 100644
>> --- a/drivers/misc/lkdtm/perms.c
>> +++ b/drivers/misc/lkdtm/perms.c
>> @@ -44,19 +44,42 @@ static noinline void do_overwritten(void)
>>   	return;
>>   }
>>   
>> +static void *setup_function_descriptor(funct_descr_t *fdesc, void *dst)
>> +{
>> +	int err;
>> +
>> +	if (!__is_defined(HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR))
>> +		return dst;
>> +
>> +	err = copy_from_kernel_nofault(fdesc, do_nothing, sizeof(*fdesc));
>> +	if (err < 0)
>> +		return ERR_PTR(err);
>> +
>> +	fdesc->addr = (unsigned long)dst;
>> +	barrier();
>> +
>> +	return fdesc;
>> +}
>> +
>>   static noinline void execute_location(void *dst, bool write)
>>   {
>> -	void (*func)(void) = dst;
>> +	void (*func)(void);
>> +	funct_descr_t fdesc;
>> +	void *do_nothing_text = dereference_symbol_descriptor(do_nothing);
>>   
>> -	pr_info("attempting ok execution at %px\n", do_nothing);
>> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>>   	do_nothing();
>>   
>>   	if (write == CODE_WRITE) {
>> -		memcpy(dst, do_nothing, EXEC_SIZE);
>> +		memcpy(dst, do_nothing_text, EXEC_SIZE);
>>   		flush_icache_range((unsigned long)dst,
>>   				   (unsigned long)dst + EXEC_SIZE);
>>   	}
>> -	pr_info("attempting bad execution at %px\n", func);
>> +	func = setup_function_descriptor(&fdesc, dst);
>> +	if (IS_ERR(func))
>> +		return;
> 
> I think this error case should complain with some details. :) Maybe:
> 
> 	pr_err("FAIL: could not build function descriptor for %px\n", dst);

Ok, I was going to add that in v2, but after one more thought I realise 
that there's no need to use copy_from_kernel_nofault() here, we are 
copying a static object into our stack, so a memcpy() will be good enough.

> 
>> +
>> +	pr_info("attempting bad execution at %px\n", dst);
> 
> And then leave this pr_info() as it was, before the
> setup_function_descriptor() call.
> 
>>   	func();
>>   	pr_err("FAIL: func returned\n");
>>   }
>> @@ -66,16 +89,22 @@ static void execute_user_location(void *dst)
>>   	int copied;
>>   
>>   	/* Intentionally crossing kernel/user memory boundary. */
>> -	void (*func)(void) = dst;
>> +	void (*func)(void);
>> +	funct_descr_t fdesc;
>> +	void *do_nothing_text = dereference_symbol_descriptor(do_nothing);
>>   
>> -	pr_info("attempting ok execution at %px\n", do_nothing);
>> +	pr_info("attempting ok execution at %px\n", do_nothing_text);
>>   	do_nothing();
>>   
>> -	copied = access_process_vm(current, (unsigned long)dst, do_nothing,
>> +	copied = access_process_vm(current, (unsigned long)dst, do_nothing_text,
>>   				   EXEC_SIZE, FOLL_WRITE);
>>   	if (copied < EXEC_SIZE)
>>   		return;
>> -	pr_info("attempting bad execution at %px\n", func);
>> +	func = setup_function_descriptor(&fdesc, dst);
>> +	if (IS_ERR(func))
>> +		return;
>> +
>> +	pr_info("attempting bad execution at %px\n", dst);
> 
> Same here.
> 
>>   	func();
>>   	pr_err("FAIL: func returned\n");
>>   }
>> -- 
>> 2.31.1
>>
> 
