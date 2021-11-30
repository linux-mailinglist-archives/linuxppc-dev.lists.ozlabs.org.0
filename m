Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5288463687
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 15:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3PXt46dyz3cZK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 01:21:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3PXR5Hs0z2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 01:21:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J3PXL58l3z9sSC;
 Tue, 30 Nov 2021 15:21:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFUe9ZVdgRmd; Tue, 30 Nov 2021 15:21:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J3PXL483Qz9sS8;
 Tue, 30 Nov 2021 15:21:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DCC08B779;
 Tue, 30 Nov 2021 15:21:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iqpiEzFHOVom; Tue, 30 Nov 2021 15:21:06 +0100 (CET)
Received: from [192.168.232.93] (unknown [192.168.232.93])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12D7C8B763;
 Tue, 30 Nov 2021 15:21:06 +0100 (CET)
Message-ID: <d515418b-9300-df6b-c6a0-d90e16380e9a@csgroup.eu>
Date: Tue, 30 Nov 2021 15:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/modules: Don't WARN on first module allocation
 tentative
Content-Language: fr-FR
To: "Erhard F." <erhard_f@mailbox.org>
References: <93c9b84d6ec76aaf7b4f03468e22433a6d308674.1638267035.git.christophe.leroy@csgroup.eu>
 <20211130150651.4aefba87@yea>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211130150651.4aefba87@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/11/2021 à 15:06, Erhard F. a écrit :
> On Tue, 30 Nov 2021 11:10:43 +0100
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> module_alloc() first tries to allocate module text within
>> 24 bits direct jump from kernel text, and tries a wider
>> allocation if first one fails.
>>
>> When first allocation fails the following is observed in kernel logs:
>>
>> vmap allocation for size 2400256 failed: use vmalloc=<size> to increase size
>> systemd-udevd: vmalloc error: size 2395133, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null)
>> CPU: 0 PID: 127 Comm: systemd-udevd Tainted: G        W         5.15.5-gentoo-PowerMacG4 #9
>> Call Trace:
>> [e2a53a50] [c0ba0048] dump_stack_lvl+0x80/0xb0 (unreliable)
>> [e2a53a70] [c0540128] warn_alloc+0x11c/0x2b4
>> [e2a53b50] [c0531be8] __vmalloc_node_range+0xd8/0x64c
>> [e2a53c10] [c00338c0] module_alloc+0xa0/0xac
>> [e2a53c40] [c027a368] load_module+0x2ae0/0x8148
>> [e2a53e30] [c027fc78] sys_finit_module+0xfc/0x130
>> [e2a53f30] [c0035098] ret_from_syscall+0x0/0x28
>> --- interrupt: c00 at 0x25df10
>> NIP:  0025df10 LR: 00416180 CTR: 00000000
>> REGS: e2a53f40 TRAP: 0c00   Tainted: G        W          (5.15.5-gentoo-PowerMacG4)
>> MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2822242c  XER: 20000000
>>
>> GPR00: 00000161 afa8f060 a73a6160 00000011 0041dfa5 00000000 00000011 00000000
>> GPR08: 00000000 20000000 0000007a afa8efe0 002113f8 0072f924 00000000 00000000
>> GPR16: 00000005 afa8f1fc afa8f1e8 00000000 22222422 00000000 009603b0 22222422
>> GPR24: 00000000 00000000 0041dfa5 008a5fc0 00020000 00000000 00444cc4 009958f0
>> NIP [0025df10] 0x25df10
>> LR [00416180] 0x416180
>> --- interrupt: c00
>> Mem-Info:
>> active_anon:36 inactive_anon:4417 isolated_anon:0
>>   active_file:3496 inactive_file:10535 isolated_file:0
>>   unevictable:0 dirty:59 writeback:0
>>   slab_reclaimable:3672 slab_unreclaimable:20540
>>   mapped:5700 shmem:166 pagetables:185 bounce:0
>>   kernel_misc_reclaimable:0
>>   free:438282 free_pcp:1121 free_cma:0
>> Node 0 active_anon:144kB inactive_anon:17668kB active_file:13984kB inactive_file:42140kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:22800kB dirty:404kB writeback:0kB shmem:664kB writeback_tmp:0kB kernel_stack:1352kB pagetables:740kB all_unreclaimable? no
>> DMA free:267900kB min:2488kB low:3108kB high:3728kB reserved_highatomic:4096KB active_anon:0kB inactive_anon:0kB active_file:4016kB inactive_file:4224kB unevictable:0kB writepending:76kB present:524288kB managed:389432kB mlocked:0kB bounce:0kB free_pcp:2480kB local_pcp:1176kB free_cma:0kB
>> lowmem_reserve[]: 0 0 1536 1536
>> HighMem free:1485036kB min:512kB low:3032kB high:5552kB reserved_highatomic:0KB active_anon:136kB inactive_anon:17612kB active_file:9976kB inactive_file:37912kB unevictable:0kB writepending:364kB present:1572864kB managed:1572864kB mlocked:0kB bounce:0kB free_pcp:1776kB local_pcp:404kB free_cma:0kB
>> BTRFS: selftest: sectorsize: 4096  nodesize: 8192
>> lowmem_reserve[]: 0 0 0 0
>> BTRFS: selftest: running btrfs free space cache tests
>> DMA: 283*4kB (UMH) 282*8kB (UMH) 242*16kB (UMEH) 422*32kB (UMH) 187*64kB (UMH) 139*128kB (UME) 118*256kB (UM) 87*512kB (UME) 61*1024kB (UME) 27*2048kB (U) 6*4096kB (U) = 267612kB
>> BTRFS: selftest: running extent only tests
>> HighMem: 1*4kB (M) 1*8kB (M) 92*16kB (M) 43*32kB (UM) 21*64kB (M) 7*128kB (M) 3*256kB (UM) 1*512kB (U) 2*1024kB (UM) 1*2048kB (U) 360*4096kB (UM) = 1485036kB
>> BTRFS: selftest: running bitmap only tests
>> 14218 total pagecache pages
>> 0 pages in swap cache
>> Swap cache stats: add 0, delete 0, find 0/0
>> Free swap  = 8388604kB
>> Total swap = 8388604kB
>> 524288 pages RAM
>> 393216 pages HighMem/MovableOnly
>> 33714 pages reserved
>>
>> Add __GFP_NOWARN flag to first allocation so that no warning appears
>> when it fails.
>>
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Fixes: 2ec13df16704 ("powerpc/modules: Load modules closer to kernel text")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/module.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>> index ed04a3ba66fe..40a583e9d3c7 100644
>> --- a/arch/powerpc/kernel/module.c
>> +++ b/arch/powerpc/kernel/module.c
>> @@ -90,16 +90,17 @@ int module_finalize(const Elf_Ehdr *hdr,
>>   }
>>   
>>   static __always_inline void *
>> -__module_alloc(unsigned long size, unsigned long start, unsigned long end)
>> +__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
>>   {
>>   	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
>> +	gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
>>   
>>   	/*
>>   	 * Don't do huge page allocations for modules yet until more testing
>>   	 * is done. STRICT_MODULE_RWX may require extra work to support this
>>   	 * too.
>>   	 */
>> -	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, prot,
>> +	return __vmalloc_node_range(size, 1, start, end, gfp, prot,
>>   				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
>>   				    NUMA_NO_NODE, __builtin_return_address(0));
>>   }
>> @@ -114,13 +115,13 @@ void *module_alloc(unsigned long size)
>>   
>>   	/* First try within 32M limit from _etext to avoid branch trampolines */
>>   	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
>> -		ptr = __module_alloc(size, limit, MODULES_END);
>> +		ptr = __module_alloc(size, limit, MODULES_END, true);
>>   
>>   	if (!ptr)
>> -		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
>> +		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
>>   
>>   	return ptr;
>>   #else
>> -	return __module_alloc(size, VMALLOC_START, VMALLOC_END);
>> +	return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
>>   #endif
>>   }
>> -- 
>> 2.33.1
> 
> The patch applies on 5.15.5 but I still get this vmalloc error. Looks a bit different though:
> 
> [..]
> Running code patching self-tests ...
> vmap allocation for size 33562624 failed: use vmalloc=<size> to increase size
> swapper/0: vmalloc error: size 33558528, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null)
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.15.5-PowerMacG4+ #2
> Call Trace:
> [f1033ba0] [c0b9fff0] dump_stack_lvl+0x80/0xb0 (unreliable)
> [f1033bc0] [c05400d0] warn_alloc+0x11c/0x2b4
> [f1033ca0] [c0531b90] __vmalloc_node_range+0xd8/0x64c
> [f1033d60] [c05319a8] __vmalloc_node+0xec/0xf4
> [f1033da0] [c1c0f998] test_code_patching+0x72c/0xd50

This one is something different.

The one I fixed with this patch is the one that was almost at the end of 
your dmesg, it was related to the loading of some module.

The one that remains comes from test_code_patching() and is a real 
failure that is due to LOWMEM being to high. This one should disappear 
when you reduce LOWMEM.

Christophe
