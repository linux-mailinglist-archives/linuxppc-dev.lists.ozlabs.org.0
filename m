Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7C30A6BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 12:43:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTmL70csVzDr5s
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 22:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTmFH1wRWzDr44
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 22:39:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DTmDy0vqcz9txvl;
 Mon,  1 Feb 2021 12:39:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1IvT6vjckTue; Mon,  1 Feb 2021 12:39:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DTmDx6Jffz9txv2;
 Mon,  1 Feb 2021 12:39:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E6BB8B782;
 Mon,  1 Feb 2021 12:39:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PMl3ou4v8w0l; Mon,  1 Feb 2021 12:39:19 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C62DD8B766;
 Mon,  1 Feb 2021 12:39:18 +0100 (CET)
Subject: Re: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
To: PLATTNER Christoph <christoph.plattner@thalesgroup.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
 <1b194840-d4e6-4660-94d9-6bac623442cf@THSDC1IRIMBX13P.iris.infra.thales>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <035a7cde-7ffd-5f27-81e1-a8d3648e4c1c@csgroup.eu>
Date: Mon, 1 Feb 2021 12:39:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1b194840-d4e6-4660-94d9-6bac623442cf@THSDC1IRIMBX13P.iris.infra.thales>
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
Cc: REITHER Robert - Contractor <robert.reither@external.thalesgroup.com>,
 HAMETNER Reinhard <reinhard.hametner@thalesgroup.com>,
 KOENIG Werner <werner.koenig@thalesgroup.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/02/2021 à 11:22, PLATTNER Christoph a écrit :
> Hello to all, and thank you very much for first and second fast response.
> 
> I do not have a long history on PowerPC MMU environment, I hacked into this topic
> for about 3 months for analyzing that problem- so, sorry, if I am wrong in some points ...

Yes you are wrong on some points, sorry, see below.


> 
> What I learn so far from this MPC5121e (variant of e300c4 core):
> - It uses book3s32 hash-code, but it DOES NOT provide KEY hash method, so always the
>     branch  "if (! Hash) ...." is taken, so, I assume that "key 0" and "key 1" setups are not
>     used on this CPU (not supporting MMU_FTR_HPTE_TABLE)

hash method is not used, this is SW TLB loading that is used, but still, all the PP and Ks/Kp keys 
defined in the segment register are used, see e300 core reference manual §6.4.2 Page Memory Protection

> - The PP bits are NOT checked by the CPU in HW, even if set to 00, the CPU does not react.
>     As far I have understood, the TLB miss routines are responsible for checking permissions.
>     The TLB miss routines check the Linux PTE styled entries and generates the PP bits
>     for the TLB entry. The PowerPC PP bits are never check elsewhere on that CPU models ...

PP bits ARE checked hoppefully. If it was not the case, then the TLB miss routines would install a 
TLB on a read, then the user could do a write without any verification being done ?

Refer to e300 Core reference Manual, §6.1.4 Memory Protection Facilities

As I explained in the patch, the problem is not that the HW doesn't check the permission. It is that 
user accessed been done with key 0 as programmed in the segment registers, PP 00 means RW access.

> - The PTE entries in Linux are fully "void" in sense of this CPU type, as this CPU does not
>     read any PTEs from RAM (no HW support in contrast to x86 or ARM or later ppc...).

No, the PTE are read by the TLB miss exception handlers and writen into TLB entries.

> 
> In summary - as far as I understand it now - we have to handle the PTE bits differently
> (Linux style) for PROT_NONE permissions - OR - we have to expand the permission
> checking like my proposed experimental patch. (PROT_NONE is not NUMA related only,
> but may not used very often ...).

Yes, expanding the permission checking is the easiest solution, hence the patch I sent out based on 
your proposal.

> 
> Another related point:
> According e300 RM (manual) the ACCESSED bit in the PTE shall be set on TLB miss, as
> it is an indication, that page is used. In 4.4 kernel this write back of the _PAGE_ACCESSED
> bit was performed after successful permission check:
> 
>          bne-    DataAddressInvalid      /* return if access not permitted */
>          ori     r0,r0,_PAGE_ACCESSED    /* set _PAGE_ACCESSED in pte */
>          /*
>           * NOTE! We are assuming this is not an SMP system, otherwise
>           * we would need to update the pte atomically with lwarx/stwcx.
>           */
>          stw     r0,0(r2)                /* update PTE (accessed bit) */
>          /* Convert linux-style PTE to low word of PPC-style PTE */
> 
> Bit is set (ori ...) and written back (stw ...) to Linux PTE. May be, this is not needed, as the
> PTE is never seen by the PPC chip. But I do not understand, WHY the PAGE_ACCCESSED
> is used for permission check in the late 5.4 kernel (not used in 4.4 kernel):
> 
> 	cmplw	0,r1,r3
>   	mfspr	r2, SPRN_SDR1
> 	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
> 	rlwinm	r2, r2, 28, 0xfffff000
>   	bgt-	112f
> 
> What is the reason or relevance for checking this here ?
> Was not checked in 4.4, bit or-ed afterwards, as it is accessed now.
> Do you know the reason of change on this point ?

PAGE_ACCESSED is important for memory management, linux kernel need it.

But instead of spending time at every miss to perform a write which will be a no-op in 99% of cases, 
we prefer bailing out to the page_fault logic when the accessed bit is not set. Then the page_fault 
logic will set the bit.
This also allowed to simplify the handling in __set_pte()_at function by avoiding races in the 
update of PTEs.

> 
> Another remark to Core manual relevant for this:
> There is the reference manual for e300 core available (e300 RM). It includes
> many remarks in range of Memory Management section, that many features
> are optional or variable for dedicated implementations. On the other hand,
> the MPC5121e reference manual refers to the e300 core RM, but DOES NOT
> information, which of the optional points are there or nor. According my
> analysis, MPC5121e does not include any of the optional features.
> 

Not sure what you mean. As far as I understand, that chapter tells you that some functionnalities 
are optional for the powerpc architectecture, and provided (or not) by the e300 core. The MPC5121 
supports all the things that are defined by e300 core.


> 
> Thanks a lot for first reactions

You are welcome, don't hesitate if you have additional questions.

Christophe
