Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDED3823D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 07:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk7TW3g6mz304C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:48:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk7T35RzFz2xgK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 15:47:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fk7Ss0cm7z9sYn;
 Mon, 17 May 2021 07:47:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCSj6QmYKsRS; Mon, 17 May 2021 07:47:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fk7Sr6lLbz9sYN;
 Mon, 17 May 2021 07:47:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C29B08B781;
 Mon, 17 May 2021 07:47:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2bhHepmv0QUI; Mon, 17 May 2021 07:47:40 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29F2C8B780;
 Mon, 17 May 2021 07:47:40 +0200 (CEST)
Subject: Re: Fwd: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
 <4deb5cd5-c713-b020-9143-c74a031e3fd5@csgroup.eu>
 <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7ebc28ad-61e3-ef43-d670-9b80a61268c4@csgroup.eu>
Date: Mon, 17 May 2021 07:47:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
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

+aneesh
+linuxppc-dev list

Le 17/05/2021 à 07:44, Anshuman Khandual a écrit :
> Hello Christophe,
> 
> DEBUG_VM_PGTABLE has now been re-enabled on powerpc recently ? was not
> aware about this. From the error log, it failed explicitly on 4K page
> size hash config.
> 
> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
> {
>          BUG();		------> Failed
>          return pmd;
> }
> 
> static inline pmd_t __pmd_mkhuge(pmd_t pmd)
> {
>          if (radix_enabled())
>                  return radix__pmd_mkhuge(pmd);
>          return hash__pmd_mkhuge(pmd);
> }
> 
> pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
> {
>          unsigned long pmdv;
> 
>          pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
> 
>          return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
> }
> 
> It seems like on powerpc, where pfn_pmd() makes a huge page but which
> is not supported on 4K hash config thus triggering the BUG(). But all
> pfn_pmd() call sites inside the debug_vm_pgtable() test are protected
> with CONFIG_TRANSPARENT_HUGEPAGE. IIUC unlike powerpc, pfn_pmd() does
> not directly make a huge page on other platforms.
> 
> Looking at arch/powerpc/include/asm/book3s/64/hash-4k.h, all relevant
> THP helpers has BUG() or 0 which indicates THP might not be supported
> on 4K page size hash config ?
> 
> But looking at arch/powerpc/platforms/Kconfig.cputype, it seems like
> HAVE_ARCH_TRANSPARENT_HUGEPAGE is invariably selected on PPC_BOOK3S_64
> platforms which I assume includes 4K page size hash config as well.
> 
> Is THP some how getting enabled on this 4K page size hash config where
> it should not be (thus triggering the BUG) ? OR am I missing something
> here.
> 
> - Anshuman
> 
> On 5/15/21 7:52 PM, Christophe Leroy wrote:
>> ------------[ cut here ]------------
>> kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:147!
>> Oops: Exception in kernel mode, sig: 5 [#1]
>> BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=4 NUMA PowerMac
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.13.0-rc1-PowerMacG5
>> #2
>> NIP:  c00000000003d6fc LR: c000000001024bc8 CTR: c0000000000f778c
>> REGS: c0000000025f7840 TRAP: 0700   Tainted: G        W
>> (5.13.0-rc1-PowerMacG5)
>> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44002448  XER: 00000000
>> IRQMASK: 0
>> GPR00: c000000001024a5c c0000000025f7ae0 c00000000129f800 c0000000025f7b58
>> GPR04: 0000000000001000 8000000000000108 0000000000000000 0000000000000001
>> GPR08: 0000000000000000 0000000000000000 0000000000000008 0000000000000200
>> GPR12: 0000000024002440 c000000002366000 c00000000001003c 0000000000000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR20: c0000000011b3388 c000000000b013e8 c0000000011b3108 4000000000000006
>> GPR24: 4000000000000280 00000000011b3000 0000000000000000 8000000000000105
>> GPR28: 0000000000001000 ffffffffffffff7f c000000000b01460 80000000011b3108
>> NIP [c00000000003d6fc] .pfn_pmd+x0x/0x4
>> LR [c000000001024bc8] .debug_vm_pgtable+0x3f4/0x51c
>> Call Trace:
>> [c0000000025f7ae0] [c000000001024a5c] .debug_vm_pgtable+0x288/0x51c
>> (unreliable)
>> [c0000000025f7bd0] [c00000000000fa58] .do_one_initcall+0x104/0x2c4
>> [c0000000025f7cb0] [c000000001003dec] .kernel_init_freeable+0x3d4/0x410
>> [c0000000025f7da0] [c00000000001004c] .kernel_init+0x10/0x15c
>> [c0000000025f7e10] [c00000000000bbf4] .ret_from_kernel_thread+0x58/0x64
>> Instruction dump:
>> 4bffcd05 60000000 e9210078 e94d0370 7d295279 39400000 4182000c 487d3829
>> 60000000 38210090 7fe3fb78 487dacf4 <0fe00000> 7c0802a6 f8010010 f821ff71
>> ---[ end trace 21fc0fb84dac9a9b ]---
