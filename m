Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECCB2616F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 19:23:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmBn54FvvzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 03:23:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmBkJ47XGzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 03:20:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BmBk46RHRz9txPY;
 Tue,  8 Sep 2020 19:20:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YAOBL0_HRwVU; Tue,  8 Sep 2020 19:20:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BmBk45P4rz9txPb;
 Tue,  8 Sep 2020 19:20:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83AF88B7BE;
 Tue,  8 Sep 2020 19:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rrT5wpXHgDDS; Tue,  8 Sep 2020 19:20:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D57098B7C7;
 Tue,  8 Sep 2020 19:20:28 +0200 (CEST)
Subject: Re: [RFC PATCH v2 3/3] mm: make generic pXd_addr_end() macros inline
 functions
To: Alexander Gordeev <agordeev@linux.ibm.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-4-gerald.schaefer@linux.ibm.com>
 <4c101685-5b29-dace-9dd2-b6f0ae193a9c@csgroup.eu>
 <20200908154859.GA11583@oc3871087118.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <af04f078-4991-6260-8bd5-9d9601105d76@csgroup.eu>
Date: Tue, 8 Sep 2020 19:20:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908154859.GA11583@oc3871087118.ibm.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/09/2020 à 17:48, Alexander Gordeev a écrit :
> On Tue, Sep 08, 2020 at 07:19:38AM +0200, Christophe Leroy wrote:
> 
> [...]
> 
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index 67ebc22cf83d..d9e7d16c2263 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -656,31 +656,35 @@ static inline int arch_unmap_one(struct mm_struct *mm,
>>>    */
>>>   #ifndef pgd_addr_end
>>> -#define pgd_addr_end(pgd, addr, end)					\
>>> -({	unsigned long __boundary = ((addr) + PGDIR_SIZE) & PGDIR_MASK;	\
>>> -	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
>>> -})
>>> +#define pgd_addr_end pgd_addr_end
>>
>> I think that #define is pointless, usually there is no such #define
>> for the default case.
> 
> Default pgd_addr_end() gets overriden on s390 (arch/s390/include/asm/pgtable.h):
> 
> #define pgd_addr_end pgd_addr_end
> static inline unsigned long pgd_addr_end(pgd_t pgd, unsigned long addr, unsigned long end)
> {
> 	return rste_addr_end_folded(pgd_val(pgd), addr, end);
> }

Yes, there in s390 the #define is needed to hit the #ifndef pgd_addr_end 
that's in include/linux/pgtable.h

But in include/linux/pgtable.h, there is no need of an #define 
pgd_addr_end pgd_addr_end I think

> 
>>> +static inline unsigned long pgd_addr_end(pgd_t pgd, unsigned long addr, unsigned long end)
>>> +{	unsigned long __boundary = (addr + PGDIR_SIZE) & PGDIR_MASK;
>>> +	return (__boundary - 1 < end - 1) ? __boundary : end;
>>> +}


Christophe
