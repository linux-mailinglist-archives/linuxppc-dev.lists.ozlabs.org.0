Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C4E261187
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 14:43:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm4Yt19KyzDqSD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 22:42:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm4W23FcWzDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 22:40:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bm4Vr1mvXz9tysg;
 Tue,  8 Sep 2020 14:40:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cIMhaNVcmlrN; Tue,  8 Sep 2020 14:40:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bm4Vr0fBLz9tysZ;
 Tue,  8 Sep 2020 14:40:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BBAE8B7C1;
 Tue,  8 Sep 2020 14:40:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xwRqAZ7QC05H; Tue,  8 Sep 2020 14:40:21 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7AA88B7BE;
 Tue,  8 Sep 2020 14:40:18 +0200 (CEST)
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <82fbe8f9-f199-5fc2-4168-eb43ad0b0346@csgroup.eu>
 <70a3dcb5-5ed1-6efa-6158-d0573d6927da@de.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96b80926-cf5b-1afa-9b7a-949a2188e61f@csgroup.eu>
Date: Tue, 8 Sep 2020 14:40:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <70a3dcb5-5ed1-6efa-6158-d0573d6927da@de.ibm.com>
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
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Jeff Dike <jdike@addtoit.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/09/2020 à 14:09, Christian Borntraeger a écrit :
> 
> 
> On 08.09.20 07:06, Christophe Leroy wrote:
>>
>>
>> Le 07/09/2020 à 20:00, Gerald Schaefer a écrit :
>>> From: Alexander Gordeev <agordeev@linux.ibm.com>
>>>
>>> Commit 1a42010cdc26 ("s390/mm: convert to the generic get_user_pages_fast
>>> code") introduced a subtle but severe bug on s390 with gup_fast, due to
>>> dynamic page table folding.
>>>
>>> The question "What would it require for the generic code to work for s390"
>>> has already been discussed here
>>> https://lkml.kernel.org/r/20190418100218.0a4afd51@mschwideX1
>>> and ended with a promising approach here
>>> https://lkml.kernel.org/r/20190419153307.4f2911b5@mschwideX1
>>> which in the end unfortunately didn't quite work completely.
>>>
>>> We tried to mimic static level folding by changing pgd_offset to always
>>> calculate top level page table offset, and do nothing in folded pXd_offset.
>>> What has been overlooked is that PxD_SIZE/MASK and thus pXd_addr_end do
>>> not reflect this dynamic behaviour, and still act like static 5-level
>>> page tables.
>>>
>>
>> [...]
>>
>>>
>>> Fix this by introducing new pXd_addr_end_folded helpers, which take an
>>> additional pXd entry value parameter, that can be used on s390
>>> to determine the correct page table level and return corresponding
>>> end / boundary. With that, the pointer iteration will always
>>> happen in gup_pgd_range for s390. No change for other architectures
>>> introduced.
>>
>> Not sure pXd_addr_end_folded() is the best understandable name, allthough I don't have any alternative suggestion at the moment.
>> Maybe could be something like pXd_addr_end_fixup() as it will disappear in the next patch, or pXd_addr_end_gup() ?
>>
>> Also, if it happens to be acceptable to get patch 2 in stable, I think you should switch patch 1 and patch 2 to avoid the step through pXd_addr_end_folded()
> 
> given that this fixes a data corruption issue, wouldnt it be the best to go forward
> with this patch ASAP and then handle the other patches on top with all the time that
> we need?

I have no strong opinion on this, but I feel rather tricky to have to 
change generic part of GUP to use a new fonction then revert that change 
in the following patch, just because you want the first patch in stable 
and not the second one.

Regardless, I was wondering, why do we need a reference to the pXd at 
all when calling pXd_addr_end() ?

Couldn't S390 retrieve the pXd by using the pXd_offset() dance with the 
passed addr ?

Christophe
