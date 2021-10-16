Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21E4300A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 08:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWYV471XWz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 17:42:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWYTf3Mxbz2ynq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 17:42:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HWYTZ2jPNz9sSL;
 Sat, 16 Oct 2021 08:42:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3NXrTGrnHQ3; Sat, 16 Oct 2021 08:42:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HWYTZ1gXQz9sSH;
 Sat, 16 Oct 2021 08:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E83F8B765;
 Sat, 16 Oct 2021 08:42:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 09O0ACPW_BH4; Sat, 16 Oct 2021 08:42:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.36])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D7EA88B763;
 Sat, 16 Oct 2021 08:42:08 +0200 (CEST)
Subject: Re: [PATCH v2 12/13] lkdtm: Fix execute_[user]_location()
To: Kees Cook <keescook@chromium.org>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <cbee30c66890994e116a8eae8094fa8c5336f90a.1634190022.git.christophe.leroy@csgroup.eu>
 <202110151428.187B1CF@keescook>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9b4c39d4-1322-89af-585c-679a574576a2@csgroup.eu>
Date: Sat, 16 Oct 2021 08:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202110151428.187B1CF@keescook>
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



Le 15/10/2021 à 23:31, Kees Cook a écrit :
> On Thu, Oct 14, 2021 at 07:50:01AM +0200, Christophe Leroy wrote:
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
>>   drivers/misc/lkdtm/perms.c     | 25 +++++++++++++++++++++----
>>   include/asm-generic/sections.h |  5 +++++
>>   2 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
>> index 5266dc28df6e..96b3ebfcb8ed 100644
>> --- a/drivers/misc/lkdtm/perms.c
>> +++ b/drivers/misc/lkdtm/perms.c
>> @@ -44,19 +44,32 @@ static noinline void do_overwritten(void)
>>   	return;
>>   }
>>   
>> +static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
>> +{
>> +	memcpy(fdesc, do_nothing, sizeof(*fdesc));
>> +	fdesc->addr = (unsigned long)dst;
>> +	barrier();
>> +
>> +	return fdesc;
>> +}
> 
> How about collapsing the "have_function_descriptors()" check into
> setup_function_descriptor()?
> 
> static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
> {
> 	if (__is_defined(HAVE_FUNCTION_DESCRIPTORS)) {
> 		memcpy(fdesc, do_nothing, sizeof(*fdesc));
> 		fdesc->addr = (unsigned long)dst;
> 		barrier();
> 		return fdesc;
> 	} else {
> 		return dst;
> 	}
> }

Ok

> 
>> +
>>   static noinline void execute_location(void *dst, bool write)
>>   {
>>   	void (*func)(void) = dst;
>> +	func_desc_t fdesc;
>> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
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
>>   	pr_info("attempting bad execution at %px\n", func);
>> +	if (have_function_descriptors())
>> +		func = setup_function_descriptor(&fdesc, dst);
>>   	func();
>>   	pr_err("FAIL: func returned\n");
>>   }
>> @@ -67,15 +80,19 @@ static void execute_user_location(void *dst)
>>   
>>   	/* Intentionally crossing kernel/user memory boundary. */
>>   	void (*func)(void) = dst;
>> +	func_desc_t fdesc;
>> +	void *do_nothing_text = dereference_function_descriptor(do_nothing);
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
>>   	pr_info("attempting bad execution at %px\n", func);
>> +	if (have_function_descriptors())
>> +		func = setup_function_descriptor(&fdesc, dst);
>>   	func();
>>   	pr_err("FAIL: func returned\n");
>>   }
> 
> 
>> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
>> index 76163883c6ff..d225318538bd 100644
>> --- a/include/asm-generic/sections.h
>> +++ b/include/asm-generic/sections.h
>> @@ -70,6 +70,11 @@ typedef struct {
>>   } func_desc_t;
>>   #endif
>>   
>> +static inline bool have_function_descriptors(void)
>> +{
>> +	return __is_defined(HAVE_FUNCTION_DESCRIPTORS);
>> +}
>> +
>>   /* random extra sections (if any).  Override
>>    * in asm/sections.h */
>>   #ifndef arch_is_kernel_text
> 
> This hunk seems like it should live in a separate patch.
> 

Ok I move it in a previous patch.
