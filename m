Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A640D21AFB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:49:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B33Ys5VzWzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 16:49:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B33Wq6bjhzDrK0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 16:47:50 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC759C0A;
 Thu,  9 Jul 2020 23:47:47 -0700 (PDT)
Received: from [10.163.87.77] (unknown [10.163.87.77])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 878B63F887;
 Thu,  9 Jul 2020 23:47:38 -0700 (PDT)
Subject: Re: [mm/debug_vm_pgtable] a97a171093:
 BUG:unable_to_handle_page_fault_for_address
To: kernel test robot <lkp@intel.com>
References: <20200709061122.GN3874@shao2-debian>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <686d83dc-d49f-77f2-1581-8f2be1a5fc60@arm.com>
Date: Fri, 10 Jul 2020 12:17:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200709061122.GN3874@shao2-debian>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, lkp@lists.01.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/09/2020 11:41 AM, kernel test robot wrote:
> [   94.349598] BUG: unable to handle page fault for address: ffffed10a7ffddff
> [   94.351039] #PF: supervisor read access in kernel mode
> [   94.352172] #PF: error_code(0x0000) - not-present page
> [   94.353256] PGD 43ffed067 P4D 43ffed067 PUD 43fdee067 PMD 0 
> [   94.354484] Oops: 0000 [#1] SMP KASAN
> [   94.355238] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc4-00002-ga97a17109332c #1
> [   94.360456] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [   94.361950] RIP: 0010:hugetlb_advanced_tests+0x137/0x699
> [   94.363026] Code: 8b 13 4d 85 f6 75 0b 48 ff 05 2c e4 6a 01 31 ed eb 41 bf f8 ff ff ff ba ff ff 37 00 4c 01 f7 48 c1 e2 2a 48 89 f9 48 c1 e9 03 <80> 3c 11 00 74 05 e8 cd c0 67 fa ba f8 ff ff ff 49 8b 2c 16 48 85
> [   94.366592] RSP: 0000:ffffc90000047d30 EFLAGS: 00010a06
> [   94.367693] RAX: 1ffffffff1049b80 RBX: ffff888380525308 RCX: 1ffff110a7ffddff
> [   94.369215] RDX: dffffc0000000000 RSI: 1ffff11087ffdc00 RDI: ffff88853ffeeff8
> [   94.370693] RBP: 000000000018e510 R08: 0000000000000025 R09: 0000000000000001
> [   94.372165] R10: ffff888380523c07 R11: ffffed10700a4780 R12: ffff88843208e510
> [   94.373674] R13: 0000000000000025 R14: ffff88843ffef000 R15: 000031e01ae61000
> [   94.375147] FS:  0000000000000000(0000) GS:ffff8883a3800000(0000) knlGS:0000000000000000
> [   94.376883] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   94.378051] CR2: ffffed10a7ffddff CR3: 0000000004e15000 CR4: 00000000000406a0
> [   94.379522] Call Trace:
> [   94.380073]  debug_vm_pgtable+0xd81/0x2029
> [   94.380871]  ? pmd_advanced_tests+0x621/0x621
> [   94.381819]  do_one_initcall+0x1eb/0xbd0
> [   94.382551]  ? trace_event_raw_event_initcall_finish+0x240/0x240
> [   94.383634]  ? rcu_read_lock_sched_held+0xb9/0x110
> [   94.388727]  ? rcu_read_lock_held+0xd0/0xd0
> [   94.389604]  ? __kasan_check_read+0x1d/0x30
> [   94.390485]  kernel_init_freeable+0x430/0x4f8
> [   94.391416]  ? rest_init+0x3f8/0x3f8
> [   94.392185]  kernel_init+0x14/0x1e8
> [   94.392918]  ret_from_fork+0x22/0x30
> [   94.393662] Modules linked in:
> [   94.394289] CR2: ffffed10a7ffddff
> [   94.395000] ---[ end trace 8ca5a1655dfb8c39 ]---

This bug is caused from here.

static inline struct mem_section *__nr_to_section(unsigned long nr)
{
#ifdef CONFIG_SPARSEMEM_EXTREME
        if (!mem_section)
                return NULL;
#endif
        if (!mem_section[SECTION_NR_TO_ROOT(nr)]) <-------- BUG
                return NULL;
        return &mem_section[SECTION_NR_TO_ROOT(nr)][nr & SECTION_ROOT_MASK];
}

static inline struct mem_section *__pfn_to_section(unsigned long pfn)
{
        return __nr_to_section(pfn_to_section_nr(pfn));
}

#define __pfn_to_page(pfn)                              \
({      unsigned long __pfn = (pfn);                    \
        struct mem_section *__sec = __pfn_to_section(__pfn);    \
        __section_mem_map_addr(__sec) + __pfn;          \
})

which is called via hugetlb_advanced_tests().

paddr = (__pfn_to_phys(pfn) | RANDOM_ORVALUE) & PMD_MASK;
pte = pte_mkhuge(mk_pte(pfn_to_page(PHYS_PFN(paddr)), prot));

Primary reason being RANDOM_ORVALUE, which is added to the paddr before
being masked with PMD_MASK. This clobbers up the pfn value which cannot
be searched in relevant memory sections. This problem stays hidden on
other configs where pfn_to_page() does not go via memory section search.
Dropping off RANDOM_ORVALUE solves the problem. Probably, just wanted to
drop that off during V2 series (https://lkml.org/lkml/2020/4/8/997) but
dont remember why ended up keeping it again.
