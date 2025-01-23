Return-Path: <linuxppc-dev+bounces-5493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDEA1A15C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 11:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdxKh2pqwz3005;
	Thu, 23 Jan 2025 21:01:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:67c:2050:0:465::101"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737626472;
	cv=none; b=mXqBJD8pLLGcKQ2vOxobPko4mLqa/riMa1MdvATaTAah0DOOtxFzHZu2zYzBVmooTL+UznG8imIut1LS2UcqGaF0nr8dXDXUBaW39JSVAkD55/nnHyVn2LokMOkNUiNOU+6fz6om9Iv5go7yF30RFS1MMn3rdCVZeomGWQH7+vLJlrILbwGHxqCUGSzOhLRy5yRD1Pqr6+M8+IxTWk85RwqU9Tv8w3Ge/SUntk7lUlRe053rPEP4wiUIhXtRv0M17+NIt/x8OX2QycjLw+L6mlADVqpAWKqR3rsHIqEusAPxhImF20LHKfA58rA/Z4Ml3/+k7Odlpyyd8kimXUiV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737626472; c=relaxed/relaxed;
	bh=g2pO6+QLNA6Mj2xw+ECoH+WU/EdmM/oG+IGjb8y/Gog=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWR67VdUTu9d9qY2xnq3p09R7DJRGzNmsoBAVu0Fh90hAUniwb22tBvRKSGS/Adua0EtiVWN3a1kJkCOS1QtiWlYRYQHEf0pNI54wRCNxZE/Uy6CUtZD7RsB0AWNJPo381LpIaRUYYl46ml2SWH39jpn4JzVERT6qlugY1IWfnxi33usZr1ejQRKJBc5SZfv85RoFJGr3jVEaVVNacW7/IlFeP1ILZSHylaRt0NvlSrD5sdsAHIbVwC20be+zHEjO8BXenUHwxgiTX9xzfgTiHo2/Ij4tiH7nYWkpYj8WphARmtTnsj9qjN18opHetRD/Iqay0t10FP3mnwwLjy85g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Viw2gDQe; dkim-atps=neutral; spf=pass (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Viw2gDQe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 124728 seconds by postgrey-1.37 at boromir; Thu, 23 Jan 2025 21:01:10 AEDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdxKf1293z2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 21:01:08 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YdxKQ5cxbz9sy3;
	Thu, 23 Jan 2025 11:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737626458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2pO6+QLNA6Mj2xw+ECoH+WU/EdmM/oG+IGjb8y/Gog=;
	b=Viw2gDQeAK5bZc3QU+JTT7meu28ly3PTanaYssyn7ORh6rpkdR2a/kCgG9IvKfEZFhpLFa
	DPH/b0iSId0dKijDF3oSzX/hfJs5Pn/KMKqlA1K/uJ+J3Ye80AuWswDyK4KYQxojbvayfI
	ywfJdmKlsbXUICzGMvo5rqB4yhxXpG+la6eUc/byQt9hPMBWEZO0Eqktdo91017OVsK3RH
	/KCCgt/0orlVU8t2CaGMKZdbizSAFy3UeyLgzU2mVJ3/9pvE04XY+fM5K4qyks1rrM/MBU
	Cjn1TmDu+pZKxqHxp8kUer1WQDs2nXUubv1CZqzDwr7pwPInTYsldljB1ihJ2Q==
Date: Thu, 23 Jan 2025 11:00:51 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, Balbir Singh
 <bsingharora@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org, kasan-dev
 <kasan-dev@googlegroups.com>
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
Message-ID: <20250123110051.77591f69@yea>
In-Reply-To: <8acd6ef8-adf0-4694-a3e5-72ec3cf09bf1@csgroup.eu>
References: <20250112135832.57c92322@yea>
	<af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
	<20250121220027.64b79bab@yea>
	<f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
	<20250122002159.43b367f0@yea>
	<ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
	<8acd6ef8-adf0-4694-a3e5-72ec3cf09bf1@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: fd40fbbe0cabfe8e5b5
X-MBO-RS-META: bz53gnnzceo19xeofg98yg7oixjnhbud
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 22 Jan 2025 19:23:00 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 22/01/2025 =C3=A0 16:32, Christophe Leroy a =C3=A9crit=C2=A0:
> >=20
> >=20
> > Le 22/01/2025 =C3=A0 00:21, Erhard Furtner a =C3=A9crit=C2=A0: =20
> >> On Tue, 21 Jan 2025 23:07:25 +0100
> >> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >> =20
> >>>> Meanwhile I bisected the bug. Offending commit is:
> >>>>
> >>>> =C2=A0=C2=A0 # git bisect good
> >>>> 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d is the first bad commit
> >>>> commit 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d
> >>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
> >>>> Date:=C2=A0=C2=A0 Mon Dec 9 10:00:25 2024 -0800
> >>>>
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 futex: fix user access on powerpc
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The powerpc user access code is speci=
al, and unlike other=20
> >>>> architectures
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 distinguishes between user access for=
 reading and writing.
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 And commit 43a43faf5376 ("futex: impr=
ove user space accesses")=20
> >>>> messed
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that up.=C2=A0 It went undetected els=
ewhere, but caused ppc32 to=20
> >>>> fail early
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 during boot, because the user access =
had been started with
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user_read_access_begin(), but then fi=
nished off with just a plain
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "user_access_end()".
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Note that the address-masking user ac=
cess helpers don't even=20
> >>>> have that
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read-vs-write distinction, so if powe=
rpc ever wants to do address
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 masking tricks, we'll have to do some=
 extra work for it.
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ Make sure to also do it for the EFA=
ULT case, as pointed out by
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Christophe Leroy ]
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reported-by: Andreas Schwab <schwab@l=
inux-m68k.org>
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cc: Christophe Leroy <christophe.lero=
y@csgroup.eu>
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Link: https://eur01.safelinks.protect=
ion.outlook.com/?=20
> >>>> url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2F87bjxl6b0i.fsf%40igel.ho=
me%2F&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb4c1dc7184f54a410a0e=
08dd3a7270b6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C63873098540790288=
1%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DE5Yp9jopCP=
E1NFuBM8rs%2B1jXZ%2FXAaKvBGpcEP%2BaMyz0%3D&reserved=3D0
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Linus Torvalds <torval=
ds@linux-foundation.org>
> >>>>
> >>>> =C2=A0=C2=A0 kernel/futex/futex.h | 4 ++--
> >>>> =C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>>
> >>>> Indeed, reverting 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d on top of=
=20
> >>>> v6.13 makes the KASAN hit disappear. =20
> >>>
> >>> That looks terribly odd.
> >>>
> >>> On G4, user_read_access_begin() and user_read_access_end() are no-op
> >>> because book3s/32 can only protect user access by kernel against writ=
e.
> >>> Read is always granted.
> >>>
> >>> So the bug must be an indirect side effect of what user_access_end()
> >>> does. user_access_end() does a sync. Would the lack of sync (once
> >>> replaced user_access_end() by user_read_access_end() ) lead to some o=
dd
> >>> re-ordering ? Or another possibility is that user_access_end() is cal=
led
> >>> on some kernel address (I see in the description of commit 43a43faf53=
76
> >>> ("futex: improve user space accesses") that the replaced __get_user()
> >>> was expected to work on kernel adresses) ? Calling user_access_begin()
> >>> and user_access_end() is unexpected and there is no guard so it could
> >>> lead to strange segment settings which hides a KASAN hit. But once the
> >>> fix the issue the KASAN resurfaces ? Could this be the problem ?
> >>>
> >>> Do you have a way to reproduce the bug on QEMU ? It would enable me to
> >>> investigate it further. =20
> >>
> >> Attached v6.13 .config plays nicely with qemu ttyS0 (forgot to disable=
=20
> >> SERIAL_8250 and set SERIAL_PMACZILOG + SERIAL_PMACZILOG_CONSOLE=20
> >> instead as I prefer the PCI Serial card in my G4).
> >>
> >> The KASAN hit also shows up on qemu 8.2.7 via via:
> >> qemu-system-ppc -machine mac99,via=3Dpmu -cpu 7450 -m 2G -nographic -=
=20
> >> append console=3DttyS0 -kernel vmlinux-6.13.0-PMacG4 -hda Debian-VM_g4=
.img
> >> =20
> >=20
> > I was able to reproduce it with v6.13 with QEMU when loading test_bpf=20
> > module.
> >=20
> > On my side, the problem doesn't disappear when reverting of commit=20
> > 32913f348229 ("futex: fix user access on powerpc")
> >=20
> > I bisected it to commit e4137f08816b ("mm, kasan, kmsan: instrument=20
> > copy_from/to_kernel_nofault"), which makes a lot more sense to me.
> >=20
> > It might be a problem in the way patch_instruction() is implemented on=
=20
> > powerpc, to be investigated. =20
>=20
> I think the problem is commit 37bc3e5fd764 ("powerpc/lib/code-patching:=20
> Use alternate map for patch_instruction()")
>=20
> Can you try the change below:
>=20
> diff --git a/arch/powerpc/lib/code-patching.c=20
> b/arch/powerpc/lib/code-patching.c
> index af97fbb3c257..8a378fc19074 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -108,7 +108,7 @@ static int text_area_cpu_up(unsigned int cpu)
>   	unsigned long addr;
>   	int err;
>=20
> -	area =3D get_vm_area(PAGE_SIZE, VM_ALLOC);
> +	area =3D get_vm_area(PAGE_SIZE, 0);
>   	if (!area) {
>   		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
>   			cpu);

Patch applies on v6.13 and fixes the KASAN hit on QEMU and on my PowerMac G=
4 DP. Thanks Christophe!

Regards,
Erhard

