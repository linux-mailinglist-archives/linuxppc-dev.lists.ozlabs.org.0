Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2C260E39
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:58:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlzZX4KY4zDqCt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:58:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzXm01MCzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:56:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlzXf0t6Nz9v06V;
 Tue,  8 Sep 2020 10:56:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id F3nHJ8RTcc_q; Tue,  8 Sep 2020 10:56:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlzXf060rz9v06Q;
 Tue,  8 Sep 2020 10:56:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1AD2F8B7A1;
 Tue,  8 Sep 2020 10:56:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZCgTkuGxxvKw; Tue,  8 Sep 2020 10:56:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93F4D8B768;
 Tue,  8 Sep 2020 10:56:34 +0200 (CEST)
Subject: Re: [PATCH v1 1/5] powerpc/mm: sanity_check_fault() should work for
 all, not only BOOK3S
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
 <1599554359.m174sr2fhg.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b5a84cb6-2f54-6c4d-6326-2cc21074490b@csgroup.eu>
Date: Tue, 8 Sep 2020 10:56:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599554359.m174sr2fhg.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/09/2020 à 10:43, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of August 7, 2020 3:15 am:
>> The verification and message introduced by commit 374f3f5979f9
>> ("powerpc/mm/hash: Handle user access of kernel address gracefully")
>> applies to all platforms, it should not be limited to BOOK3S.
>>
>> Make the BOOK3S version of sanity_check_fault() the one for all,
>> and bail out earlier if not BOOK3S.
>>
>> Fixes: 374f3f5979f9 ("powerpc/mm/hash: Handle user access of kernel address gracefully")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/mm/fault.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 925a7231abb3..2efa34d7e644 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -303,7 +303,6 @@ static inline void cmo_account_page_fault(void)
>>   static inline void cmo_account_page_fault(void) { }
>>   #endif /* CONFIG_PPC_SMLPAR */
>>   
>> -#ifdef CONFIG_PPC_BOOK3S
>>   static void sanity_check_fault(bool is_write, bool is_user,
>>   			       unsigned long error_code, unsigned long address)
>>   {
>> @@ -320,6 +319,9 @@ static void sanity_check_fault(bool is_write, bool is_user,
>>   		return;
>>   	}
>>   
>> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S))
>> +		return;
> 
> Seems okay. Why is address == -1 special though? I guess it's because
> it may not be an exploit kernel reference but a buggy pointer underflow?
> In that case -1 doesn't seem like it would catch very much. Would it be
> better to test for high bit set for example ((long)address < 0) ?

See 
https://github.com/linuxppc/linux/commit/0f9aee0cb9da7db7d96f63cfa2dc5e4f1bffeb87#diff-f9658f412252f3bb3093e0a95b37f3ac

-1 is what mmap() returns on error, if the app uses that as a pointer 
that's a programming error not an exploit.

Euh .. If you test (long)address < 0, then the entire kernel falls into 
that range as usually it goes from 0xc0000000 to 0xffffffff

But we could skip the top page entirely, anyway it is never mapped.

> 
> Anyway for your patch
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks
Christophe

