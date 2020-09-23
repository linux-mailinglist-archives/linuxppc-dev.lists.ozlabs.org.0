Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A0274F79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 05:17:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx3Ht0gr2zDqYk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 13:16:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bx3G9226PzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 13:15:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84E71D6E;
 Tue, 22 Sep 2020 20:15:26 -0700 (PDT)
Received: from [10.163.72.76] (unknown [10.163.72.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066233F718;
 Tue, 22 Sep 2020 20:15:23 -0700 (PDT)
Subject: Re: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in
 pte_clear_test
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nathan Chancellor <natechancellor@gmail.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
 <20200911021358.GA3656343@ubuntu-n2-xlarge-x86>
 <87zh5wx51b.fsf@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <37a9facc-ca36-290f-3748-16c4a7a778fa@arm.com>
Date: Wed, 23 Sep 2020 08:44:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87zh5wx51b.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/11/2020 10:51 AM, Aneesh Kumar K.V wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> 
>> On Wed, Sep 02, 2020 at 05:12:22PM +0530, Aneesh Kumar K.V wrote:
>>> pte_clear_tests operate on an existing pte entry. Make sure that
>>> is not a none pte entry.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>  mm/debug_vm_pgtable.c | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>> index 9afa1354326b..c36530c69e33 100644
>>> --- a/mm/debug_vm_pgtable.c
>>> +++ b/mm/debug_vm_pgtable.c
>>> @@ -542,9 +542,10 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>>>  #endif /* PAGETABLE_P4D_FOLDED */
>>>  
>>>  static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
>>> -				   unsigned long vaddr)
>>> +				   unsigned long pfn, unsigned long vaddr,
>>> +				   pgprot_t prot)
>>>  {
>>> -	pte_t pte = ptep_get(ptep);
>>> +	pte_t pte = pfn_pte(pfn, prot);
>>>  
>>>  	pr_debug("Validating PTE clear\n");
>>>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>>> @@ -1049,7 +1050,7 @@ static int __init debug_vm_pgtable(void)
>>>  
>>>  	ptl = pte_lockptr(mm, pmdp);
>>>  	spin_lock(ptl);
>>> -	pte_clear_tests(mm, ptep, vaddr);
>>> +	pte_clear_tests(mm, ptep, pte_aligned, vaddr, prot);
>>>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>>  	pte_unmap_unlock(ptep, ptl);
>>>  
>>> -- 
>> This patch causes a panic at boot for RISC-V defconfig. The rootfs is here if it is needed:
>> https://github.com/ClangBuiltLinux/boot-utils/blob/3b21a5b71451742866349ba4f18638c5a754e660/images/riscv/rootfs.cpio.zst
>>
>> $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- O=out/riscv distclean defconfig Image
>>
>> $ qemu-system-riscv64 -bios default -M virt -display none -initrd rootfs.cpio -kernel Image -m 512m -nodefaults -serial mon:stdio
>> ...
>>
>> OpenSBI v0.6
>>    ____                    _____ ____ _____
>>   / __ \                  / ____|  _ \_   _|
>>  | |  | |_ __   ___ _ __ | (___ | |_) || |
>>  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>  | |__| | |_) |  __/ | | |____) | |_) || |_
>>   \____/| .__/ \___|_| |_|_____/|____/_____|
>>         | |
>>         |_|
>>
>> Platform Name          : QEMU Virt Machine
>> Platform HART Features : RV64ACDFIMSU
>> Platform Max HARTs     : 8
>> Current Hart           : 0
>> Firmware Base          : 0x80000000
>> Firmware Size          : 120 KB
>> Runtime SBI Version    : 0.2
>>
>> MIDELEG : 0x0000000000000222
>> MEDELEG : 0x000000000000b109
>> PMP0    : 0x0000000080000000-0x000000008001ffff (A)
>> PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
>> [    0.000000] Linux version 5.9.0-rc4-next-20200910 (nathan@ubuntu-n2-xlarge-x86) (riscv64-linux-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #1 SMP Thu Sep 10 19:10:43 MST 2020
>> ...
>> [    0.294593] NET: Registered protocol family 17
>> [    0.295781] 9pnet: Installing 9P2000 support
>> [    0.296153] Key type dns_resolver registered
>> [    0.296694] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
>> [    0.297635] Unable to handle kernel paging request at virtual address 0a7fffe01dafefc8
>> [    0.298029] Oops [#1]
>> [    0.298153] Modules linked in:
>> [    0.298433] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc4-next-20200910 #1
>> [    0.298792] epc: ffffffe000205afc ra : ffffffe0008be0aa sp : ffffffe01ae73d40
>> [    0.299078]  gp : ffffffe0010b9b48 tp : ffffffe01ae68000 t0 : ffffffe008152000
>> [    0.299362]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : ffffffe01ae73d60
>> [    0.299648]  s1 : bffffffffffffffb a0 : 0a7fffe01dafefc8 a1 : bffffffffffffffb
>> [    0.299948]  a2 : ffffffe0010a2698 a3 : 0000000000000001 a4 : 0000000000000003
>> [    0.300231]  a5 : 0000000000000800 a6 : fffffffff0000080 a7 : 000000001b642000
>> [    0.300521]  s2 : ffffffe0081517b8 s3 : ffffffe008150a80 s4 : ffffffe01af30000
>> [    0.300806]  s5 : ffffffe01f8ca9b8 s6 : ffffffe008150000 s7 : ffffffe0010bb100
>> [    0.301161]  s8 : ffffffe0010bb108 s9 : 0000000000080202 s10: ffffffe0010bb928
>> [    0.301481]  s11: 000000002008085b t3 : 0000000000000000 t4 : 0000000000000000
>> [    0.301722]  t5 : 0000000000000000 t6 : ffffffe008150000
>> [    0.301947] status: 0000000000000120 badaddr: 0a7fffe01dafefc8 cause: 000000000000000f
>> [    0.302569] ---[ end trace 7ffb153d816164cf ]---
>> [    0.302797] note: swapper/0[1] exited with preempt_count 1
>> [    0.303101] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> [    0.303614] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> 
> I guess it is the combination of a valid pte and usage of
> RANDOM_ORVALUE. The below change get the kernel to boot. Can somebody
> faimilar with riscv pte format take a look at the RANDOM_ORVALUE?
> 
> modified   mm/debug_vm_pgtable.c
> @@ -548,7 +548,7 @@ static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
>  	pte_t pte = pfn_pte(pfn, prot);
>  
>  	pr_debug("Validating PTE clear\n");
> -	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> +//	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>  	set_pte_at(mm, vaddr, ptep, pte);
>  	barrier();
>  	pte_clear(mm, vaddr, ptep);

Do we have a fix for this problem ? Otherwise we just risk going into
the next release with this regression on riscv platforms.
