Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF002658C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:30:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnkq53WfBzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YK4ewip5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnkd25qp5zDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:21:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B51vSS143141; Fri, 11 Sep 2020 01:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DU/4b0UHB6uf8FRCheqNO7SFSo134jh/J2UtOUkHCNw=;
 b=YK4ewip5IEGSpEYxV6+cDKI6yBMrZRb3GQJHnVFFZcLSpPUDURfdqixx3iYRxIaJC//B
 O7tqh7p2Vr74+zwEf5q3GHzCPa86V7DFOmPaB1I8S2avC9ZPUlrwSlRR36r2X3S7kHrd
 1+GEjDRlQ37tNrb4K7xayZa6ubK+/1MHKVTBFM3i5aqED8zPyuGEf1a8S0a1welSEPlj
 lCw9e37OG56+UlV4VgiB20UnORuU5iW+XZqm9WE0mhnYzSDpc0M+ajQv2M85M4PFtYG6
 oYNU6VpqLwQ/cpFk55s05sokU8y5w5ebuX8bnnMCyRHNKqQZE9CLv+JXCIvT5cW2E8tQ ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33g27f1288-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 01:21:11 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08B52AjQ144048;
 Fri, 11 Sep 2020 01:21:11 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33g27f1281-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 01:21:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08B5CVXn024308;
 Fri, 11 Sep 2020 05:21:10 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 33c2aa0s62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 05:21:10 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08B5L41Z58851628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 05:21:04 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87A456E053;
 Fri, 11 Sep 2020 05:21:09 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBEAD6E04E;
 Fri, 11 Sep 2020 05:21:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.1.57])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Sep 2020 05:21:06 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in
 pte_clear_test
In-Reply-To: <20200911021358.GA3656343@ubuntu-n2-xlarge-x86>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
 <20200911021358.GA3656343@ubuntu-n2-xlarge-x86>
Date: Fri, 11 Sep 2020 10:51:04 +0530
Message-ID: <87zh5wx51b.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_01:2020-09-10,
 2020-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110036
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <natechancellor@gmail.com> writes:

> On Wed, Sep 02, 2020 at 05:12:22PM +0530, Aneesh Kumar K.V wrote:
>> pte_clear_tests operate on an existing pte entry. Make sure that
>> is not a none pte entry.
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  mm/debug_vm_pgtable.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 9afa1354326b..c36530c69e33 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -542,9 +542,10 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>>  #endif /* PAGETABLE_P4D_FOLDED */
>>  
>>  static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
>> -				   unsigned long vaddr)
>> +				   unsigned long pfn, unsigned long vaddr,
>> +				   pgprot_t prot)
>>  {
>> -	pte_t pte = ptep_get(ptep);
>> +	pte_t pte = pfn_pte(pfn, prot);
>>  
>>  	pr_debug("Validating PTE clear\n");
>>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>> @@ -1049,7 +1050,7 @@ static int __init debug_vm_pgtable(void)
>>  
>>  	ptl = pte_lockptr(mm, pmdp);
>>  	spin_lock(ptl);
>> -	pte_clear_tests(mm, ptep, vaddr);
>> +	pte_clear_tests(mm, ptep, pte_aligned, vaddr, prot);
>>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>  	pte_unmap_unlock(ptep, ptl);
>>  
>> -- 
> This patch causes a panic at boot for RISC-V defconfig. The rootfs is here if it is needed:
> https://github.com/ClangBuiltLinux/boot-utils/blob/3b21a5b71451742866349ba4f18638c5a754e660/images/riscv/rootfs.cpio.zst
>
> $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- O=out/riscv distclean defconfig Image
>
> $ qemu-system-riscv64 -bios default -M virt -display none -initrd rootfs.cpio -kernel Image -m 512m -nodefaults -serial mon:stdio
> ...
>
> OpenSBI v0.6
>    ____                    _____ ____ _____
>   / __ \                  / ____|  _ \_   _|
>  | |  | |_ __   ___ _ __ | (___ | |_) || |
>  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>  | |__| | |_) |  __/ | | |____) | |_) || |_
>   \____/| .__/ \___|_| |_|_____/|____/_____|
>         | |
>         |_|
>
> Platform Name          : QEMU Virt Machine
> Platform HART Features : RV64ACDFIMSU
> Platform Max HARTs     : 8
> Current Hart           : 0
> Firmware Base          : 0x80000000
> Firmware Size          : 120 KB
> Runtime SBI Version    : 0.2
>
> MIDELEG : 0x0000000000000222
> MEDELEG : 0x000000000000b109
> PMP0    : 0x0000000080000000-0x000000008001ffff (A)
> PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
> [    0.000000] Linux version 5.9.0-rc4-next-20200910 (nathan@ubuntu-n2-xlarge-x86) (riscv64-linux-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #1 SMP Thu Sep 10 19:10:43 MST 2020
> ...
> [    0.294593] NET: Registered protocol family 17
> [    0.295781] 9pnet: Installing 9P2000 support
> [    0.296153] Key type dns_resolver registered
> [    0.296694] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
> [    0.297635] Unable to handle kernel paging request at virtual address 0a7fffe01dafefc8
> [    0.298029] Oops [#1]
> [    0.298153] Modules linked in:
> [    0.298433] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc4-next-20200910 #1
> [    0.298792] epc: ffffffe000205afc ra : ffffffe0008be0aa sp : ffffffe01ae73d40
> [    0.299078]  gp : ffffffe0010b9b48 tp : ffffffe01ae68000 t0 : ffffffe008152000
> [    0.299362]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : ffffffe01ae73d60
> [    0.299648]  s1 : bffffffffffffffb a0 : 0a7fffe01dafefc8 a1 : bffffffffffffffb
> [    0.299948]  a2 : ffffffe0010a2698 a3 : 0000000000000001 a4 : 0000000000000003
> [    0.300231]  a5 : 0000000000000800 a6 : fffffffff0000080 a7 : 000000001b642000
> [    0.300521]  s2 : ffffffe0081517b8 s3 : ffffffe008150a80 s4 : ffffffe01af30000
> [    0.300806]  s5 : ffffffe01f8ca9b8 s6 : ffffffe008150000 s7 : ffffffe0010bb100
> [    0.301161]  s8 : ffffffe0010bb108 s9 : 0000000000080202 s10: ffffffe0010bb928
> [    0.301481]  s11: 000000002008085b t3 : 0000000000000000 t4 : 0000000000000000
> [    0.301722]  t5 : 0000000000000000 t6 : ffffffe008150000
> [    0.301947] status: 0000000000000120 badaddr: 0a7fffe01dafefc8 cause: 000000000000000f
> [    0.302569] ---[ end trace 7ffb153d816164cf ]---
> [    0.302797] note: swapper/0[1] exited with preempt_count 1
> [    0.303101] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.303614] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---


I guess it is the combination of a valid pte and usage of
RANDOM_ORVALUE. The below change get the kernel to boot. Can somebody
faimilar with riscv pte format take a look at the RANDOM_ORVALUE?

modified   mm/debug_vm_pgtable.c
@@ -548,7 +548,7 @@ static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
 	pte_t pte = pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE clear\n");
-	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
+//	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
 	set_pte_at(mm, vaddr, ptep, pte);
 	barrier();
 	pte_clear(mm, vaddr, ptep);

