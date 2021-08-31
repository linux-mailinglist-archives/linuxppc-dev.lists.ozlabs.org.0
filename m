Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AD3FC8AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzT7J1R6Vz2ymF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L3RWeaXk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L3RWeaXk; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzT6b0dlSz2yHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:48:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzT6Y1mtwz9sRN;
 Tue, 31 Aug 2021 23:48:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630417701;
 bh=8oS99HH6AUTzOOju4RU630SDk6FIxjIbOfVXLSa66Es=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L3RWeaXku45++htSouP4mrMXDNz5yFXKq9mzsKd6kTnL6wzaehAxuzUTwEgoJcjh/
 ydUo5b9sfW/CaL6BsJeWawe6ne7IN/i2doLdHtR32QbaSGoXtdzWqN9zoJKB7U3dfd
 cqAjKgQYmL/3qAsG1VoNS6tXkM+U+tVA6EhC2A+wwFC0FuNxfU/dcgMezZO8OECyxG
 KDrFQSrgric1Z+12zz447pYXZYvDqFIkpYoyipZhlmR/7s1evjtVGsgp3fQ9yCvgXI
 dm3BllEAZ45Q74rw06gobE0SV5sbLA20BWKR20Z6FTcbr9T/7vCrbyL3my5L4WTAtb
 C3ujLJAL2jilA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH v4 4/4] powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP
In-Reply-To: <55783e78-3159-9ab2-7955-fb5aa8aa0ddd@csgroup.eu>
References: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
 <03166d569526be70214fe9370a7bad219d2f41c8.1625762907.git.christophe.leroy@csgroup.eu>
 <YSvYFTSwP5EkXQZ0@Ryzen-9-3900X.localdomain>
 <5c479866-f31a-3579-9d71-357c85b777d0@csgroup.eu>
 <87tuj7e5e5.fsf@mpe.ellerman.id.au>
 <2bd9fa19-07b0-c187-c7dd-c6d544e34739@csgroup.eu>
 <87r1ebdu4t.fsf@mpe.ellerman.id.au>
 <55783e78-3159-9ab2-7955-fb5aa8aa0ddd@csgroup.eu>
Date: Tue, 31 Aug 2021 23:48:17 +1000
Message-ID: <87mtoxendq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 30/08/2021 =C3=A0 13:55, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 30/08/2021 =C3=A0 09:52, Michael Ellerman a =C3=A9crit=C2=A0:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>> Le 29/08/2021 =C3=A0 20:55, Nathan Chancellor a =C3=A9crit=C2=A0:
>>>>>> On Thu, Jul 08, 2021 at 04:49:43PM +0000, Christophe Leroy wrote:
>>>>>>> This patch converts powerpc to the generic PTDUMP implementation.
>>>>>>>
>>>>>>
>>>>>> This patch as commit e084728393a5 ("powerpc/ptdump: Convert powerpc =
to
>>>>>> GENERIC_PTDUMP") in powerpc/next causes a panic with Fedora's ppc64le
>>>>>> config [1] when booting up in QEMU with [2]:
>>>>>>
>>>>>> [    1.621864] BUG: Unable to handle kernel data access on read at 0=
xc0eeff7f00000000
>>>>>> [    1.623058] Faulting instruction address: 0xc00000000045e5fc
>>>>>> [    1.623832] Oops: Kernel access of bad area, sig: 11 [#1]
>>>>>> [    1.624318] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA=
 PowerNV
>>>>>> [    1.625015] Modules linked in:
>>>>>> [    1.625463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc7-=
next-20210827 #16
>>>>>> [    1.626237] NIP:  c00000000045e5fc LR: c00000000045e580 CTR: c000=
000000518220
>>>>>> [    1.626839] REGS: c00000000752b820 TRAP: 0380   Not tainted  (5.1=
4.0-rc7-next-20210827)
>>>>>> [    1.627528] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE> =
 CR: 84002482  XER: 20000000
>>>>>> [    1.628449] CFAR: c000000000518300 IRQMASK: 0
>>>>>> [    1.628449] GPR00: c00000000045e580 c00000000752bac0 c0000000028a=
9300 0000000000000000
>>>>>> [    1.628449] GPR04: c200800000000000 ffffffffffffffff 000000000000=
000a 0000000000000001
>>>>>> [    1.628449] GPR08: c0eeff7f00000000 0000000000000012 000000000000=
0000 0000000000000000
>>>>>> [    1.628449] GPR12: 0000000000000000 c000000002b20000 ffffffffffff=
fffe c000000002971a70
>>>>>> [    1.628449] GPR16: c000000002960040 c0000000011a8f98 c00000000752=
bbf0 ffffffffffffffff
>>>>>> [    1.628449] GPR20: c2008fffffffffff c0eeff7f00000000 c00000000297=
1a68 c00a0003ff000000
>>>>>> [    1.628449] GPR24: c000000002971a78 0000000000000002 000000000000=
0001 c0000000011a8f98
>>>>>> [    1.628449] GPR28: c0000000011a8f98 c0000000028daef8 c20080000000=
0000 c200900000000000
>>>>>> [    1.634090] NIP [c00000000045e5fc] __walk_page_range+0x2bc/0xce0
>>>>>> [    1.635117] LR [c00000000045e580] __walk_page_range+0x240/0xce0
>>>>>> [    1.635755] Call Trace:
>>>>>> [    1.636018] [c00000000752bac0] [c00000000045e580] __walk_page_ran=
ge+0x240/0xce0 (unreliable)
>>>>>> [    1.636811] [c00000000752bbd0] [c00000000045f234] walk_page_range=
_novma+0x74/0xb0
>>>>>> [    1.637459] [c00000000752bc20] [c000000000518448] ptdump_walk_pgd=
+0x98/0x170
>>>>>> [    1.638138] [c00000000752bc70] [c0000000000aa988] ptdump_check_wx=
+0x88/0xd0
>>>>>> [    1.638738] [c00000000752bd50] [c00000000008d6d8] mark_rodata_ro+=
0x48/0x80
>>>>>> [    1.639299] [c00000000752bdb0] [c000000000012a34] kernel_init+0x7=
4/0x1a0
>>>>>> [    1.639842] [c00000000752be10] [c00000000000cfd4] ret_from_kernel=
_thread+0x5c/0x64
>>>>>> [    1.640597] Instruction dump:
>>>>>> [    1.641021] 38e7ffff 39490010 7ce707b4 7fca5436 79081564 7d4a3838=
 7908f082 794a1f24
>>>>>> [    1.641740] 78a8f00e 30e6ffff 7ea85214 7ce73110 <7d48502a> 78f90f=
a4 2c2a0000 39290010
>>>>>> [    1.642771] ---[ end trace 6cf72b085097ad52 ]---
>>>>>> [    1.643220]
>>>>>> [    2.644228] Kernel panic - not syncing: Attempted to kill init! e=
xitcode=3D0x0000000b
>>>>>> [    2.645523] ---[ end Kernel panic - not syncing: Attempted to kil=
l init! exitcode=3D0x0000000b ]---
>>>>>>
>>>>>> This is not compiler specific, I can reproduce it with GCC 11.2.0 and
>>>>>> binutils 2.37. If there is any additional information I can provide,
>>>>>> please let me know.
>>>>>
>>>>> Can you provide a dissassembly of __walk_page_range() ? Or provide yo=
ur vmlinux binary.
>>>>
>>>> It seems to be walking of the end of the pgd.
>>>>
>>>> [    3.373800] walk_p4d_range: addr c00fff0000000000 end c00fff8000000=
000
>>>> [    3.373852] walk_p4d_range: addr c00fff8000000000 end c010000000000=
000	<- end of pgd at PAGE_OFFSET + 4PB
>>>> [    3.373905] walk_p4d_range: addr c010000000000000 end c010008000000=
000
>>>
>>> Yes, I want it to walk from TASK_SIZE_MAX up to 0xffffffffffffffff :)
>>=20
>> But the page table doesn't span that far? 0_o
>>=20
>>> static struct ptdump_range ptdump_range[] __ro_after_init =3D {
>>> 	{TASK_SIZE_MAX, ~0UL},
>>> 	{0, 0}
>>> };
>>>
>>> Ok, well, ppc32 go up to 0xffffffff
>>>
>>> What's the top address to be used for ppc64 ?
>>=20
>> It's different for (hash | radix) x page size.
>>=20
>> The below works, and matches what we used to do.
>>=20
>> Possibly we can come up with something cleaner, not sure.
>>=20
>> cheers
>>=20
>>=20
>> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/pt=
dump.c
>> index 2d80d775d15e..3d3778a74969 100644
>> --- a/arch/powerpc/mm/ptdump/ptdump.c
>> +++ b/arch/powerpc/mm/ptdump/ptdump.c
>> @@ -359,6 +359,8 @@ static int __init ptdump_init(void)
>>   		ptdump_range[0].start =3D KERN_VIRT_START;
>>   	else
>>   		ptdump_range[0].start =3D PAGE_OFFSET;
>> +
>> +	ptdump_range[0].end =3D ptdump_range[0].start + (PGDIR_SIZE * PTRS_PER=
_PGD);
>
> Hum ...
>
> It was:
>
> 	for (i =3D pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr +=3D PGDI=
R_SIZE) {
>
> And there is
>
> #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))

Yes you're right.

> Do we have the following ?
>
> 	pgd_index(KERN_VIRT_START) =3D=3D 0

No.

Since 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the s=
ame 0xc range")

It's:

 	pgd_index(PAGE_OFFSET) =3D=3D 0


> Shouldn't it be something like
>
> 	ptdump_range[0].end =3D PAGE_OFFSET + (PGDIR_SIZE * PTRS_PER_PGD);

Yep.

And we should also change the start address for hash to be PAGE_OFFSET.
Even though we don't expect anything in the page tables between
PAGE_OFFSET and KERN_VIRT_START, it's still good to check that range.

cheers
