Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E87633874F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 09:28:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxf942Jdbz3cmR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 19:28:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxf8l0yPHz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 19:28:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dxf8b39xTz9v0tW;
 Fri, 12 Mar 2021 09:28:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rGbVLOrLdM_k; Fri, 12 Mar 2021 09:28:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dxf8b16PLz9tyZB;
 Fri, 12 Mar 2021 09:28:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 505238B80F;
 Fri, 12 Mar 2021 09:28:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id q81IV4vGYKsG; Fri, 12 Mar 2021 09:28:15 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF8D18B764;
 Fri, 12 Mar 2021 09:28:14 +0100 (CET)
Subject: Re: [PATCH v2 25/43] powerpc/32: Replace ASM exception exit by C
 exception exit from ppc64
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <a9a50f475db97fc53795dd778bc14f58029fdd55.1615291473.git.christophe.leroy@csgroup.eu>
 <87tuphkdkz.fsf@mpe.ellerman.id.au>
 <0296d1bc-b37e-43c8-06cf-00ec458fb74e@csgroup.eu>
 <87r1kljmr9.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8b2ee16c-1661-d97c-04f0-5881e53ab835@csgroup.eu>
Date: Fri, 12 Mar 2021 09:28:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87r1kljmr9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/03/2021 à 00:26, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 11/03/2021 à 14:46, Michael Ellerman a écrit :
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> This patch replaces the PPC32 ASM exception exit by C exception exit.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>>    arch/powerpc/kernel/entry_32.S  | 481 +++++++++-----------------------
>>>>    arch/powerpc/kernel/interrupt.c |   4 +
>>>>    2 files changed, 132 insertions(+), 353 deletions(-)
>>>
>>> Bisect points to this breaking qemu mac99 for me, with pmac32_defconfig.
>>>
>>> I haven't had time to dig any deeper sorry.
>>
>> Embarrasing ...
> 
> Nah, these things happen.
> 
>> I don't get this problem on the 8xx (nohash/32) or the 83xx (book3s/32).
>> I don't get this problem with qemu mac99 when using my klibc-based initramfs.
>>
>> I managed to reproduce it with the rootfs.cpio that I got some time ago from linuxppc github Wiki.
> 
> OK.
> 
> I'm using the ppc-rootfs.cpio.gz from here:
> 
>    https://github.com/linuxppc/ci-scripts/blob/master/root-disks/Makefile
> 
> And the boot script is:
> 
>    https://github.com/linuxppc/ci-scripts/blob/master/scripts/boot/qemu-mac99
> 
> I've been meaning to write docs on how to use those scripts, but haven't
> got around to it.
> 
> There's nothing really special though it's just a wrapper around qemu -M mac99.
> 
>> I'll investigate it tomorrow.
> 

Problem is the fast_interrupt_return, registers are not all saved yet on ppc32 (msr, nip, xer, ctr), 
can't restore them all as ppc64 do.

The problem happens only when userspace uses floating point or altivec.

For the time being, I'll keep the original fast_interrupt_return.

I will likely send a new version of the series later today, taking into account Nick's comments.

Christophe
