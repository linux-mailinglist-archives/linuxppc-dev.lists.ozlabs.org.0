Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3261951AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:02:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXqL6kvGzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=UX15Jazq; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXnN0BP6zDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:00:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pXnH05D3z9txq3;
 Fri, 27 Mar 2020 08:00:51 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UX15Jazq; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RA_-yOiis4rA; Fri, 27 Mar 2020 08:00:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pXnG5XWyz9txq2;
 Fri, 27 Mar 2020 08:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585292450; bh=Ws1T27uMA0wfJZIl4CR6AQkUqBHuQiB6haJ0qz+xiIM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UX15Jazq692nKezahgcBWFZADQzoEn5TOJTlYr5XLS/57u6ncysBxqFZPWgQbrlBy
 BLPR/FqnpU+HiqGEHw4aO+Mm3ZF1ZASdmP3rOi0gJGXiZXKXdy6KknGg8FIO+Or9JQ
 qCqJd84lmJi/DNXsbkiMINQjf68WtsGi+npCBrzc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BDF78B7BC;
 Fri, 27 Mar 2020 08:00:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oH2Pf5pBdxv5; Fri, 27 Mar 2020 08:00:51 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 655658B756;
 Fri, 27 Mar 2020 08:00:49 +0100 (CET)
Subject: Re: [PATCH V2 0/3] mm/debug: Add more arch page table helper tests
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1585027375-9997-1-git-send-email-anshuman.khandual@arm.com>
 <2bb4badc-2b7a-e15d-a99b-b1bd38c9d9bf@arm.com>
 <a46d18ed-8911-1ec3-c32f-58b6e0d959d7@c-s.fr>
 <9675882f-0ec5-5e46-551f-dd3aa38bf8d8@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ef28cb75-40b8-5ab5-83ba-84fd4384c7c5@c-s.fr>
Date: Fri, 27 Mar 2020 07:00:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <9675882f-0ec5-5e46-551f-dd3aa38bf8d8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-doc@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/27/2020 06:46 AM, Anshuman Khandual wrote:
> 
> On 03/26/2020 08:53 PM, Christophe Leroy wrote:
>>
>>
>> Le 26/03/2020 à 03:23, Anshuman Khandual a écrit :
>>>
>>>
>>> On 03/24/2020 10:52 AM, Anshuman Khandual wrote:
>>>> This series adds more arch page table helper tests. The new tests here are
>>>> either related to core memory functions and advanced arch pgtable helpers.
>>>> This also creates a documentation file enlisting all expected semantics as
>>>> suggested by Mike Rapoport (https://lkml.org/lkml/2020/1/30/40).
>>>>
>>>> This series has been tested on arm64 and x86 platforms.
>>>
>>> If folks can test these patches out on remaining ARCH_HAS_DEBUG_VM_PGTABLE
>>> enabled platforms i.e s390, arc, powerpc (32 and 64), that will be really
>>> appreciated. Thank you.
>>>
>>
>> On powerpc 8xx (PPC32), I get:
>>
>> [   53.338368] debug_vm_pgtable: debug_vm_pgtable: Validating architecture page table helpers
>> [   53.347403] ------------[ cut here ]------------
>> [   53.351832] WARNING: CPU: 0 PID: 1 at mm/debug_vm_pgtable.c:647 debug_vm_pgtable+0x280/0x3f4
> 
> mm/debug_vm_pgtable.c:647 ?
> 
> With the following commits in place
> 
> 53a8338ce (HEAD) Documentation/mm: Add descriptions for arch page table helper
> 5d4913fc1 mm/debug: Add tests validating arch advanced page table helpers
> bcaf120a7 mm/debug: Add tests validating arch page table helpers for core features
> d6ed5a4a5 x86/memory: Drop pud_mknotpresent()
> 0739d1f8d mm/debug: Add tests validating architecture page table helpers
> 16fbf79b0 (tag: v5.6-rc7) Linux 5.6-rc7

I have:

facaa5eb5909 (HEAD -> helpers0) mm/debug: Add tests validating arch 
advanced page table helpers
6389fed515fc mm/debug: Add tests validating arch page table helpers for 
core features
dc14ecc8b94e mm/debug: add tests validating architecture page table helpers
c6624071c338 (origin/merge, merge) Automatic merge of branches 'master', 
'next' and 'fixes' into merge
58e05c5508e6 Automatic merge of branches 'master', 'next' and 'fixes' 
into merge
1b649e0bcae7 (origin/master, origin/HEAD) Merge 
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net

origin is https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git

I can't see your last patch in powerpc mailing list 
(https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=166237)

> 
> mm/debug_vm_pgtable.c:647 is here.

Line 647 is:

	WARN_ON(!pte_same(pte, __swp_entry_to_pte(swp)));


> 
> #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot)
> {
>          swp_entry_t swp;
>          pmd_t pmd;  -----------------------------> Line #647
> 
>          pmd = pfn_pmd(pfn, prot);
>          swp = __pmd_to_swp_entry(pmd);
>          WARN_ON(!pmd_same(pmd, __swp_entry_to_pmd(swp)));
> }
> #else
> static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot) { }
> #end
> 
> Did I miss something ?
> 

[...]

> Could you please point me to the exact test which is failing ?
> 
>> [   53.519778] Freeing unused kernel memory: 608K
>>
>>
> So I assume that the system should have come till runtime just fine apart from
> the above warning message because.
> 

Yes it boots fine otherwise.

Christophe
