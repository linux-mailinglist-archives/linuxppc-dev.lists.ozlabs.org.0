Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407578A35D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 01:19:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UmW3nbgE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYqPy5qn1z3bbW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 09:19:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UmW3nbgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYqP30SwLz307V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 09:18:11 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RYqNp3H4rz9sqG;
	Mon, 28 Aug 2023 01:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1693178282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyOLuD8KX58dqMifqQVuAEXmZPgLOmuWadz+jg6VLu8=;
	b=UmW3nbgE+pVNWk/61KsH3ORcCRSmqTpehUiefwAKcF7SvVtbTCsOvgAsGQckgYOJdQvqUV
	YUxKVLdK94LdoLkaNwyCwvrjsz9ZObx7By4xs/4JjJdy+yVUkrM4g+U+WDo0YxKjxqxGZ4
	9d8zgA9xfOB3FpgxmqkAiizBNJ2Zvi+NYDCodnWECpmwEFi4rLS2znmhWkj/K9K0W5xQdl
	1eAUuFP2Zyrx9EekBEubGaPBGnvqwDGjwnqg37UeViqbLBMdG5+TvPAJINqY9HGKBxEb2n
	pCWWmeab2v8Q9xG8tcSVncuj0X7X/fbtglg6ECmT9KzokYNNrX0hw/PiyxacZQ==
Date: Mon, 28 Aug 2023 01:17:58 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230828011758.3b7b9daf@yea>
In-Reply-To: <87jztkvfid.fsf@mail.lhotse>
References: <20230811014845.1bf6771d@yea>
	<f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
	<20230813213855.794b3c8f@yea>
	<57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
	<20230814192748.56525c82@yea>
	<6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
	<20230815220156.5c234b52@yea>
	<0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
	<20230817203202.2b4c273c@yea>
	<87y1i9clf2.fsf@mail.lhotse>
	<20230818111641.7f680ce7@yea>
	<fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
	<20230818182316.79303545@yea>
	<5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
	<20230824020015.78733931@yea>
	<87jztkvfid.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: 8ytzk15zi9bkj8icfxijxnercdowahxw
X-MBO-RS-ID: 180fa4cab9efe2ecfe6
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

On Thu, 24 Aug 2023 21:36:26 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> > printk: bootconsole [udbg0] enabled
> > Total memory =3D 2048MB; using 4096kB for hash table
> > mapin_ram:125
> > mmu_mapin_ram:169 0 30000000 1400000 2000000
> > __mmu_mapin_ram:146 0 1400000
> > __mmu_mapin_ram:155 1400000
> > __mmu_mapin_ram:146 1400000 30000000
> > __mmu_mapin_ram:155 20000000
> > __mapin_ram_chunk:107 20000000 30000000
> > __mapin_ram_chunk:117
> > mapin_ram:134
> > kasan_mmu_init:129
> > kasan_mmu_init:132 0
> > kasan_mmu_init:137
> > ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() in=
stead
> > Linux version 6.5.0-rc7-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p=
20230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #4 SMP Wed Au=
g 23 12:59:11 CEST 2023
> >
> > which shows one line (Linux version...) more than before. Most of the t=
ime I get this more interesting output however:
> >
> > kasan_mmu_init:129
> > kasan_mmu_init:132 0
> > kasan_mmu_init:137
> > Linux version 6.5.0-rc7-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p=
20230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #4 SMP Wed Au=
g 23 12:59:11 CEST 2023
> > KASAN init done
> > list_add corruption. prev->next should be next (c17100c0), but was 2c03=
0000. (prev=3Dc036ac7c).
> > ------------[ cut here ]------------
> > kernel BUG at lib/list_debug.c:30!
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 0 at arch/powerpc/include/asm/machdep.h:227 die+0x=
d8/0x39c =20
>=20
> This is a WARN hit while handling the original bug.
>=20
> Can you apply this patch to avoid that happening, so we can see the
> original but better.
>=20
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index eeff136b83d9..341a0635e131 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -198,8 +198,6 @@ static unsigned long oops_begin(struct pt_regs *regs)
>  	die_owner =3D cpu;
>  	console_verbose();
>  	bust_spinlocks(1);
> -	if (machine_is(powermac))
> -		pmac_backlight_unblank();
>  	return flags;
>  }
>  NOKPROBE_SYMBOL(oops_begin);
>=20
>=20
> cheers

Ok, so I tested now:
   Replace btext_unmap() with btext_map() at the end of MMU_init() + Michae=
ls patch.

With the patch I get interesting output less often, but when I do it's:

printk: bootconsole [udbg0] enabled
Total memory =3D 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:169 0 30000000 1400000 2000000
__mmu_mapin_ram:146 0 1400000
__mmu_mapin_ram:155 1400000
__mmu_mapin_ram:146 1400000 30000000
__mmu_mapin_ram:155 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:129
kasan_mmu_init:132 0
kasan_mmu_init:137
Linux version 6.5.0-rc7-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p2023=
0526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #4 SMP Wed Aug 23=
 12:59:11 CEST 2023
KASAN init done
BUG: spinlock bad magic on CPU#0, swapper/0
 lock: 0xc16cbc60, .magic: c036ab84, .owner: <none>/-1, .owner_cpu: -1
CPU: 0 PID: 0 Comm: swapper Tainted: G                T xxxxxxxxxxx
Call Trace:
[c1717c20] [c0f4e288] dump_stack_lvl+0x60/0xa4 (unreliable)
[c1717c40] [c01065e8] do_raw_spin_lock+0x15c/0x1a8
[c1717c70] [c0fa3890] _raw_spin_lock_irqsave+0x20/0x40
[c1717c90] [c0c140ec] of_find_property+0x3c/0x140
[c1717cc0] [c0c14204] of_get_property+0x14/0x4c
[c1717ce0] [c0c22c6c] unlatten_dt_nodes+0x76c/0x894
[c1717f10] [c0c22e88] __unflatten_device_tree+0xf4/0x244
[c1717f50] [c1458050] unflatten_device_tree+0x48/0x84
[c1717f70] [c140b100] setup_arch+0x78/0x44c
[c1717fc0] [c14045b8] start_kernel+0x78/0x2d8
[c1717ff0] [000035d0] 0x35d0


and then the freeze. Or less often I get:

[...]
Modules linked in: _various ASCII chars_ |(EK) _various ASCII chars_ =C2=A7=
=3D(EKTN)
BUG: Unable to handle kernel data access on read at 0x813f0200
Faulting instruction address: 0xc014e444
Thread overran stack, or stack corrupted
Oops: Kernel access of bad area, sig: 11 [#3544]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2
Modules linked in: _various ASCII chars_ =C2=A7=3D(EKTN)
BUG: Unable to handle kernel data access on read at 0x813f0200
Faulting instruction address: 0xc014e444
Thread overran stack, or stack corrupted
Oops: Kernel access of bad area, sig: 11 [#3545]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2


Number after "sig: 11" gets counted up rapidly to #3545 so I can't follow t=
he output on the OF console. Remaining output on screen before the freeze a=
re [#3535] to [#3545] but apart from the numbers the adresses in this outpu=
t do not change. _various ASCII chars_ in the "Modules linked in:" stay the=
 same but are special characters so hard to transcribe.

Hope that helps.

Regards,
Erhard
