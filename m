Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B5786E15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 13:37:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nDy9LN/L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWgzc14ktz3c8v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 21:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nDy9LN/L;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWgyh45fFz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 21:36:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692876988;
	bh=SkD+3XKlyUM+qLeJ78B59+eWmbreIL0jivY8taZpsqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nDy9LN/L/5VTiR9ohpffq96QZY8BfG3heN1iDH1ZD0JDBPAspabRPq4/35qJtAjOZ
	 c+g5bhFUQMB2lp1OGQNu+ZW08zJB26NrVfGgknBXw0kKRGhzkq6pFIaoBXHRk1/qDI
	 XPH1rS7c5W/9AofwAHoGOc44wjEZfrwKC2JQ6uaAnlIoAO4WrT+imsE0laWbDx7+s3
	 LUDZSBw2CMTDP4q0R3RvSluMnTseU3RaIHHiX+aKIYAq2g4De37V+rQumAhweojEGG
	 zFszmNBdTJTKYafnO++SxklRhgtJUrEy+s7K3V1ryuD2XwGw3ZL3bTe/dLwTdW5wM+
	 YXR+oDrTemsAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RWgyh0J3Jz4wZp;
	Thu, 24 Aug 2023 21:36:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
In-Reply-To: <20230824020015.78733931@yea>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea>
Date: Thu, 24 Aug 2023 21:36:26 +1000
Message-ID: <87jztkvfid.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> On Tue, 22 Aug 2023 07:31:54 +0000
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>
>> Le 18/08/2023 =C3=A0 18:23, Erhard Furtner a =C3=A9crit=C2=A0:
>> > On Fri, 18 Aug 2023 15:47:38 +0000
>> > Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>> >=20=20=20
>> >> I'm wondering if the problem is just linked to the kernel being built
>> >> with CONFIG_SMP or if it is the actual startup of a secondary CPU that
>> >> cause the freeze.
>> >>
>> >> Please leave the btext_unmap() in place because I think it is importa=
nt
>> >> to keep it, and start the kernel with the following parameter:
>> >>
>> >> nr_cpus=3D1=20=20
>> >=20
>> > With btext_unmap() back and place and nr_cpus=3D1 set the freeze still=
 happens after the 1st btext_unmap:129 on cold boots:
>> >=20
>> > [    0.000000] printk: bootconsole [udbg0] enabled
>> > [    0.000000] Total memory =3D 2048MB; using 4096kB for hash table
>> > [    0.000000] mapin_ram:125
>> > [    0.000000] mmu_mapin_ram:169 0 30000000 1400000 2000000
>> > [    0.000000] __mmu_mapin_ram:146 0 1400000
>> > [    0.000000] __mmu_mapin_ram:155 1400000
>> > [    0.000000] __mmu_mapin_ram:146 1400000 30000000
>> > [    0.000000] __mmu_mapin_ram:155 20000000
>> > [    0.000000] __mapin_ram_chunk:107 20000000 30000000
>> > [    0.000000] __mapin_ram_chunk:117
>> > [    0.000000] mapin_ram:134
>> > [    0.000000] kasan_mmu_init:129
>> > [    0.000000] kasan_mmu_init:132 0
>> > [    0.000000] kasan_mmu_init:137
>> > [    0.000000] btext_unmap:129
>> >=20=20=20
>>=20
>> Thanks,
>>=20
>> Can you replace the call to btext_unmap() by a call to btext_map() at=20
>> the end of MMU_init() ?
>>=20
>> If that gives no interesting result, can you leave the call to=20
>> btext_unmap() and add a call to btext_map() at the very begining of=20
>> function start_kernel() in init/main.c (You may have to add a include of=
=20
>> asm/btext.h)
>>=20
>> With that I hope we can see more stuff.
>
> Ok, I tested out both methods.
>
>   1.) Replace btext_unmap() with btext_map() at the end of MMU_init().
>
> Warm boot again is unspectacular (attached). On cold boots I sometimes ge=
t:
>
> printk: bootconsole [udbg0] enabled
> Total memory =3D 2048MB; using 4096kB for hash table
> mapin_ram:125
> mmu_mapin_ram:169 0 30000000 1400000 2000000
> __mmu_mapin_ram:146 0 1400000
> __mmu_mapin_ram:155 1400000
> __mmu_mapin_ram:146 1400000 30000000
> __mmu_mapin_ram:155 20000000
> __mapin_ram_chunk:107 20000000 30000000
> __mapin_ram_chunk:117
> mapin_ram:134
> kasan_mmu_init:129
> kasan_mmu_init:132 0
> kasan_mmu_init:137
> ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() inst=
ead
> Linux version 6.5.0-rc7-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p20=
230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #4 SMP Wed Aug =
23 12:59:11 CEST 2023
>
> which shows one line (Linux version...) more than before. Most of the tim=
e I get this more interesting output however:
>
> kasan_mmu_init:129
> kasan_mmu_init:132 0
> kasan_mmu_init:137
> Linux version 6.5.0-rc7-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p20=
230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #4 SMP Wed Aug =
23 12:59:11 CEST 2023
> KASAN init done
> list_add corruption. prev->next should be next (c17100c0), but was 2c0300=
00. (prev=3Dc036ac7c).
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:30!
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 0 at arch/powerpc/include/asm/machdep.h:227 die+0xd8=
/0x39c

This is a WARN hit while handling the original bug.

Can you apply this patch to avoid that happening, so we can see the
original but better.

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index eeff136b83d9..341a0635e131 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -198,8 +198,6 @@ static unsigned long oops_begin(struct pt_regs *regs)
 	die_owner =3D cpu;
 	console_verbose();
 	bust_spinlocks(1);
-	if (machine_is(powermac))
-		pmac_backlight_unblank();
 	return flags;
 }
 NOKPROBE_SYMBOL(oops_begin);


cheers
