Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03229925DC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:31:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HU926B91;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDczp5bJqz3dfM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 21:31:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HU926B91;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDcz53sWxz3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 21:30:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720006241;
	bh=hBPfcphJy7Ev3mtEEvsbdYBglsS6/5WB3ZZqmCXJ/5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HU926B91N24lEUx6TCxkH/GKqKj/7NXDsOnGaHqcTfPaoG6/I5SNKLCA7y6EC/YeQ
	 Sv7VirV9nzzOXJUHRJUwpvW5jRDXVbfY1JjEZ2WG7Lky05vbK7t6hWL6YTS5SD2BPO
	 WU4rce17jT8OGRQVKayXyEqpl1haKHOJwR3xVzPYV3eEDvgISidfZSeiYVbUX60GM+
	 2nxD9Hg7Mz+/zf0G78gfhx0LJ0U5vjdX48mJZneviZgO4CAG9xk00t9yknCn6TCGg4
	 r7JUiWmxvtuHE72Un7pYAqzo3UweMNvJTlqrYIPGTBeJCiWSK43iHsGA7xrcbo3yMJ
	 c6IozzeKGp3ww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDcz34b52z4xQd;
	Wed,  3 Jul 2024 21:30:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, Christian
 Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
In-Reply-To: <CAL_Jsq+_QZHMJGHqw8vFA5CspuouvY_U=+NobYQ52DcwPQx-2w@mail.gmail.com>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <CAL_Jsq+_QZHMJGHqw8vFA5CspuouvY_U=+NobYQ52DcwPQx-2w@mail.gmail.com>
Date: Wed, 03 Jul 2024 21:30:38 +1000
Message-ID: <87le2ik90h.fsf@mail.lhotse>
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
Cc: apatel@ventanamicro.com, DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> On Tue, Jul 2, 2024 at 10:54=E2=80=AFAM Marc Zyngier <maz@kernel.org> wro=
te:
>>
>> On Sun, 30 Jun 2024 11:21:55 +0100,
>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> >
>> > Hello,
>> >
>> > There is an issue with the identification of ATA drives with our
>> > P.A. Semi Nemo boards [1] after the
>> > commit "of/irq: Factor out parsing of interrupt-map parent
>> > phandle+args from of_irq_parse_raw()" [2].
>>
>> [snip]
>>
>> My earlier request for valuable debug information still stands. But
>> while you're at it, can you please give the following hack a go?
>>
>>         M.
>>
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_=
phandle_args *out_irq)
>>
>>                         oldimap =3D imap;
>>                         imap =3D of_irq_parse_imap_parent(oldimap, imapl=
en, out_irq);
>> -                       if (!imap)
>> -                               goto fail;
>> +                       if (!imap) {
>> +                               match =3D 0;
>> +                               break;
>> +                       }
>
> AFAICT reading the DT, I don't think this would fix it. imap should
> only be null if malformed. This case to me looks like interrupt-map
> has the correct cell sizes, but just never matches to do the mapping.
> So maybe imaplen is off and that causes us to end up here, but if
> there's an error I don't see it. A boot with DEBUG enabled in
> drivers/of/irq.c would help.
>
>>
>>                         match &=3D of_device_is_available(out_irq->np);
>>                         if (match)
>>
>> This may not be the final workaround even if it solves your boot
>> problem, but will at least give us a hint at what is going wrong.
>>
>> I have the fuzzy feeling that we may be able to lob this broken system
>> as part of the of_irq_imap_abusers[] array, which would solve things
>> pretty "neatly".
>
> I think this would work and would consolidate the work-arounds. It
> would need either "pasemi,rootbus" or "pa-pxp" added to the list.

Not sure if it helps, but there's already some code in arch/powerpc to
"fixup" the nemo device tree at boot.

I'm not sure if it's actually the problem here, but it might be, it does
renumber some interrupts. Or possibly it could be tweaked to fix
whatever the issue is.

The code is in fixup_device_tree_pasemi():

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/powerpc/kernel/prom_init.c?h=3Dv6.10-rc5#n3114

cheers
