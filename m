Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E03382CC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkK5m5KzGz303t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkK5K4H8qz2yXL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:01:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FkK5C3FR9z9sTY;
 Mon, 17 May 2021 15:01:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qT3OAt658hS; Mon, 17 May 2021 15:01:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FkK5C2HMMz9sTJ;
 Mon, 17 May 2021 15:01:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FA0B8B79C;
 Mon, 17 May 2021 15:01:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GoGBvITG2g2Z; Mon, 17 May 2021 15:01:19 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D34E48B799;
 Mon, 17 May 2021 15:01:18 +0200 (CEST)
Subject: Re: Fwd: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
 <4deb5cd5-c713-b020-9143-c74a031e3fd5@csgroup.eu>
 <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
 <7ebc28ad-61e3-ef43-d670-9b80a61268c4@csgroup.eu>
 <e9558e0a-314e-ddfd-6776-84c1bfe6f01f@linux.ibm.com>
 <6fcdf4f2-9bed-4b0f-8ed8-74cb25484ea6@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <52ab4861-3a77-14da-1179-3ea79964c950@csgroup.eu>
Date: Mon, 17 May 2021 14:59:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6fcdf4f2-9bed-4b0f-8ed8-74cb25484ea6@arm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/05/2021 à 14:49, Anshuman Khandual a écrit :
> 
> 
> On 5/17/21 11:25 AM, Aneesh Kumar K.V wrote:
>> On 5/17/21 11:17 AM, Christophe Leroy wrote:
>>> +aneesh
>>> +linuxppc-dev list
>>>
>>> Le 17/05/2021 à 07:44, Anshuman Khandual a écrit :
>>>> Hello Christophe,
>>>>
>>>> DEBUG_VM_PGTABLE has now been re-enabled on powerpc recently ? was not
>>>> aware about this. From the error log, it failed explicitly on 4K page
>>>> size hash config.
>>>>
>>>> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>>>> {
>>>>           BUG();        ------> Failed
>>>>           return pmd;
>>>> }
>>>>
>>>> static inline pmd_t __pmd_mkhuge(pmd_t pmd)
>>>> {
>>>>           if (radix_enabled())
>>>>                   return radix__pmd_mkhuge(pmd);
>>>>           return hash__pmd_mkhuge(pmd);
>>>> }
>>>>
>>>> pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>>> {
>>>>           unsigned long pmdv;
>>>>
>>>>           pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>>>>
>>>>           return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
>>>> }
>>>>
>>>> It seems like on powerpc, where pfn_pmd() makes a huge page but which
>>>> is not supported on 4K hash config thus triggering the BUG(). But all
>>>> pfn_pmd() call sites inside the debug_vm_pgtable() test are protected
>>>> with CONFIG_TRANSPARENT_HUGEPAGE. IIUC unlike powerpc, pfn_pmd() does
>>>> not directly make a huge page on other platforms.
>>>>
>>>> Looking at arch/powerpc/include/asm/book3s/64/hash-4k.h, all relevant
>>>> THP helpers has BUG() or 0 which indicates THP might not be supported
>>>> on 4K page size hash config ?
>>>>
>>>> But looking at arch/powerpc/platforms/Kconfig.cputype, it seems like
>>>> HAVE_ARCH_TRANSPARENT_HUGEPAGE is invariably selected on PPC_BOOK3S_64
>>>> platforms which I assume includes 4K page size hash config as well.
>>>>
>>>> Is THP some how getting enabled on this 4K page size hash config where
>>>> it should not be (thus triggering the BUG) ? OR am I missing something
>>>> here.
>>>>
>>>
>>
>> We should put those  pfn_pmd()  and pfn_pud() after
>>
>>      if (!has_transparent_hugepage())
>>          return;
> 
> The following patch has been lightly tested on arm64 and x86 platforms.
> Could you please verify if this solves the problem on powerpc 4K hash
> config ? Thank you.

No need to update pmd_advanced_tests() and pud_advanced_tests() ?

Christophe
