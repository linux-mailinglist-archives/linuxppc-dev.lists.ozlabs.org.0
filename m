Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B855C43008D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 08:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWYB60snTz3cBN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 17:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWY9b2B9Fz2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 17:28:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HWY9Q53xqz9sSL;
 Sat, 16 Oct 2021 08:28:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-Fz29ksyfF0; Sat, 16 Oct 2021 08:28:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HWY9Q3nwlz9sSH;
 Sat, 16 Oct 2021 08:28:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E0778B765;
 Sat, 16 Oct 2021 08:28:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4rYxWz_zPmYc; Sat, 16 Oct 2021 08:28:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.36])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 215348B763;
 Sat, 16 Oct 2021 08:28:09 +0200 (CEST)
Subject: Re: [PATCH v2 13/13] lkdtm: Add a test for function descriptors
 protection
To: Kees Cook <keescook@chromium.org>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <08a3dfbc55e1c7a0a1917b22f0ca6cabd9895ab2.1634190022.git.christophe.leroy@csgroup.eu>
 <202110151433.6270D717@keescook>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b11bab54-04bd-4244-a043-b3d8df34967b@csgroup.eu>
Date: Sat, 16 Oct 2021 08:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202110151433.6270D717@keescook>
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



Le 15/10/2021 à 23:35, Kees Cook a écrit :
> On Thu, Oct 14, 2021 at 07:50:02AM +0200, Christophe Leroy wrote:
>> Add WRITE_OPD to check that you can't modify function
>> descriptors.
>>
>> Gives the following result when function descriptors are
>> not protected:
>>
>> 	lkdtm: Performing direct entry WRITE_OPD
>> 	lkdtm: attempting bad 16 bytes write at c00000000269b358
>> 	lkdtm: FAIL: survived bad write
>> 	lkdtm: do_nothing was hijacked!
>>
>> Looks like a standard compiler barrier(); is not enough to force
>> GCC to use the modified function descriptor. Add to add a fake empty
>> inline assembly to force GCC to reload the function descriptor.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   drivers/misc/lkdtm/core.c  |  1 +
>>   drivers/misc/lkdtm/lkdtm.h |  1 +
>>   drivers/misc/lkdtm/perms.c | 22 ++++++++++++++++++++++
>>   3 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
>> index fe6fd34b8caf..de092aa03b5d 100644
>> --- a/drivers/misc/lkdtm/core.c
>> +++ b/drivers/misc/lkdtm/core.c
>> @@ -148,6 +148,7 @@ static const struct crashtype crashtypes[] = {
>>   	CRASHTYPE(WRITE_RO),
>>   	CRASHTYPE(WRITE_RO_AFTER_INIT),
>>   	CRASHTYPE(WRITE_KERN),
>> +	CRASHTYPE(WRITE_OPD),
>>   	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
>>   	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
>>   	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
>> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
>> index c212a253edde..188bd0fd6575 100644
>> --- a/drivers/misc/lkdtm/lkdtm.h
>> +++ b/drivers/misc/lkdtm/lkdtm.h
>> @@ -105,6 +105,7 @@ void __init lkdtm_perms_init(void);
>>   void lkdtm_WRITE_RO(void);
>>   void lkdtm_WRITE_RO_AFTER_INIT(void);
>>   void lkdtm_WRITE_KERN(void);
>> +void lkdtm_WRITE_OPD(void);
>>   void lkdtm_EXEC_DATA(void);
>>   void lkdtm_EXEC_STACK(void);
>>   void lkdtm_EXEC_KMALLOC(void);
>> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
>> index 96b3ebfcb8ed..3870bc82d40d 100644
>> --- a/drivers/misc/lkdtm/perms.c
>> +++ b/drivers/misc/lkdtm/perms.c
>> @@ -44,6 +44,11 @@ static noinline void do_overwritten(void)
>>   	return;
>>   }
>>   
>> +static noinline void do_almost_nothing(void)
>> +{
>> +	pr_info("do_nothing was hijacked!\n");
>> +}
>> +
>>   static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
>>   {
>>   	memcpy(fdesc, do_nothing, sizeof(*fdesc));
>> @@ -143,6 +148,23 @@ void lkdtm_WRITE_KERN(void)
>>   	do_overwritten();
>>   }
>>   
>> +void lkdtm_WRITE_OPD(void)
>> +{
>> +	size_t size = sizeof(func_desc_t);
>> +	void (*func)(void) = do_nothing;
>> +
>> +	if (!have_function_descriptors()) {
>> +		pr_info("Platform doesn't have function descriptors.\n");
> 
> This should be more explicit ('xfail'):
> 
> 	pr_info("XFAIL: platform doesn't use function descriptors.\n");

Ok


> 
>> +		return;
>> +	}
>> +	pr_info("attempting bad %zu bytes write at %px\n", size, do_nothing);
>> +	memcpy(do_nothing, do_almost_nothing, size);
>> +	pr_err("FAIL: survived bad write\n");
>> +
>> +	asm("" : "=m"(func));
> 
> Since this is a descriptor, I assume no icache flush is needed. Are
> function descriptors strictly dcache? (Is anything besides just a
> barrier needed?)

No flush is needed, the code just loads the function address from memory 
into CTR, loads R2 and branch to CTR:

	 19c:	e9 21 00 70 	ld      r9,112(r1)
	 1a0:	e9 49 00 00 	ld      r10,0(r9)
	 1a4:	7d 49 03 a6 	mtctr   r10
	 1a8:	e8 49 00 08 	ld      r2,8(r9)
	 1ac:	4e 80 04 21 	bctrl


> 
>> +	func();
>> +}
>> +
>>   void lkdtm_EXEC_DATA(void)
>>   {
>>   	execute_location(data_area, CODE_WRITE);
>> -- 
>> 2.31.1
>>
> 
