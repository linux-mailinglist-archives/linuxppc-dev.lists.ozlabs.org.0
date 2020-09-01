Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C52587EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 08:16:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcJn4cjBzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 16:16:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BN4SFPjk; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcGp6JC5zDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 16:14:26 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id s2so97682pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4sAOznsbDitvgGBTxWgdjGT/K4J/5YLr45VGgEHHWuQ=;
 b=BN4SFPjkX2VNgJQkGWK2q1e/2Ll973/9sErKNRGt7bhnRNFjHwV4JF0124N6chKOgc
 YGvAwDh5ukif9RWL2coNRvnehOUWrYjfCpCOXK0QyBc8R8h4sqPX+b/wioWznVzQQTfE
 zMypHcXYeEBUjDMm5pThzW3gQ8Jvzx9WXpy36I73GeekMBxRBVHtIgIDh5iaN+FQpTCB
 iYqINI6ibj3NJopYkvQbLXkR5+QW8zLQIlqYWZWwMqN3AV2DWqLe8/Bq/U1gclINsMbg
 jTaXkF6tO+mUmGbVRSrhyrnYG12FB6nNcPDUIVIcnLQiQnG8D14XbzPX4jJFxNcKbwU1
 YZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4sAOznsbDitvgGBTxWgdjGT/K4J/5YLr45VGgEHHWuQ=;
 b=T2qm0vzOIsVH9vv/+qoOn5YMKc8lHZf44jpifXPlzez7U4o4kTWJGDMD4eOEtYQ9i+
 8sfWrDls+NcfODsIjqrk/7QVKdKpBIErOkOC34Rrn6YWV2h5pIU6liT3zWk5l0AbXJrL
 GAgGdlWM4XwYOBX8aN1zdnSJC5/WMjPQGVBJ5/SFnG+UHlFJ+N9huLVEqviqMjweEYPs
 fibgRhpaU6TRG6TYZGilQ9+vuVn83+SJNeeo4ZPE7Rxd3Xi9VP/lRydW5DBNZDPb5b46
 z1a3TgudVeZJ3NXp08r+PnuRZZRe3PEBVuzW6eYUkaQ2BSdT/5GYL+NGT1rqnNwXRFE6
 MZZA==
X-Gm-Message-State: AOAM531HbGFET4/1+QsYhV467uZ3OOa0cnSTdSPyWReKDJ56Lg2IQ7+O
 cTkQ7pr9lnCOMLUrRbWOEh4=
X-Google-Smtp-Source: ABdhPJw4bp1v/NJpbOJTm+gaCRUv5DMytXCbTlpHGl29UVmTllPtZ+CPDOW8jHJopAGkQCIR8xGJrA==
X-Received: by 2002:a17:902:8344:: with SMTP id z4mr59902pln.15.1598940863260; 
 Mon, 31 Aug 2020 23:14:23 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id z126sm305929pfc.94.2020.08.31.23.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 23:14:22 -0700 (PDT)
Date: Tue, 01 Sep 2020 16:14:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: fsl_espi errors on v5.7.15
To: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "broonie@kernel.org" <broonie@kernel.org>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Heiner Kallweit <hkallweit1@gmail.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "paulus@samba.org"
 <paulus@samba.org>
References: <42107721-614b-96e8-68d9-4b888206562e@alliedtelesis.co.nz>
 <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
 <1598510348.1g7wt0s02s.astroid@bobo.none>
 <0068446e-06f8-6648-2f40-56f324c1ee6e@alliedtelesis.co.nz>
 <1598788275.m90vz24p6x.astroid@bobo.none>
 <524a0f50-f954-f5a7-eccb-66eece59c7c4@alliedtelesis.co.nz>
 <5ca7ba48-ef9c-2b7c-67ff-88d0a2c9f380@gmail.com>
 <6a9eb498-2982-05de-52f9-da5f6a626e49@alliedtelesis.co.nz>
 <5bf05188-a52e-c8c0-9d2d-c87eff6f1588@gmail.com>
 <39f36ad7-5dc5-f7ce-e2bc-1b59ff70e005@alliedtelesis.co.nz>
In-Reply-To: <39f36ad7-5dc5-f7ce-e2bc-1b59ff70e005@alliedtelesis.co.nz>
MIME-Version: 1.0
Message-Id: <1598940515.6e06nwgi0c.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Chris Packham's message of September 1, 2020 11:25 am:
>=20
> On 1/09/20 12:33 am, Heiner Kallweit wrote:
>> On 30.08.2020 23:59, Chris Packham wrote:
>>> On 31/08/20 9:41 am, Heiner Kallweit wrote:
>>>> On 30.08.2020 23:00, Chris Packham wrote:
>>>>> On 31/08/20 12:30 am, Nicholas Piggin wrote:
>>>>>> Excerpts from Chris Packham's message of August 28, 2020 8:07 am:
>>>>> <snip>
>>>>>
>>>>>>>>>>> I've also now seen the RX FIFO not empty error on the T2080RDB
>>>>>>>>>>>
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't e=
mpty!
>>>>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>>>>>>>>>
>>>>>>>>>>> With my current workaround of emptying the RX FIFO. It seems
>>>>>>>>>>> survivable. Interestingly it only ever seems to be 1 extra byte=
 in the
>>>>>>>>>>> RX FIFO and it seems to be after either a READ_SR or a READ_FSR=
.
>>>>>>>>>>>
>>>>>>>>>>> fsl_espi ffe110000.spi: tx 70
>>>>>>>>>>> fsl_espi ffe110000.spi: rx 03
>>>>>>>>>>> fsl_espi ffe110000.spi: Extra RX 00
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't e=
mpty!
>>>>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>>>>>>>>> fsl_espi ffe110000.spi: tx 05
>>>>>>>>>>> fsl_espi ffe110000.spi: rx 00
>>>>>>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't e=
mpty!
>>>>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>>>>>>>>> fsl_espi ffe110000.spi: tx 05
>>>>>>>>>>> fsl_espi ffe110000.spi: rx 00
>>>>>>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>>>>>>>
>>>>>>>>>>>     From all the Micron SPI-NOR datasheets I've got access to i=
t is
>>>>>>>>>>> possible to continually read the SR/FSR. But I've no idea why i=
t
>>>>>>>>>>> happens some times and not others.
>>>>>>>>>> So I think I've got a reproduction and I think I've bisected the=
 problem
>>>>>>>>>> to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt re=
play in
>>>>>>>>>> C"). My day is just finishing now so I haven't applied too much =
scrutiny
>>>>>>>>>> to this result. Given the various rabbit holes I've been down on=
 this
>>>>>>>>>> issue already I'd take this information with a good degree of sk=
epticism.
>>>>>>>>>>
>>>>>>>>> OK, so an easy test should be to re-test with a 5.4 kernel.
>>>>>>>>> It doesn't have yet the change you're referring to, and the fsl-e=
spi driver
>>>>>>>>> is basically the same as in 5.7 (just two small changes in 5.7).
>>>>>>>> There's 6cc0c16d82f88 and maybe also other interrupt related patch=
es
>>>>>>>> around this time that could affect book E, so it's good if that ex=
act
>>>>>>>> patch is confirmed.
>>>>>>> My confirmation is basically that I can induce the issue in a 5.4 k=
ernel
>>>>>>> by cherry-picking 3282a3da25bd. I'm also able to "fix" the issue in
>>>>>>> 5.9-rc2 by reverting that one commit.
>>>>>>>
>>>>>>> I both cases it's not exactly a clean cherry-pick/revert so I also
>>>>>>> confirmed the bisection result by building at 3282a3da25bd (which s=
ees
>>>>>>> the issue) and the commit just before (which does not).
>>>>>> Thanks for testing, that confirms it well.
>>>>>>
>>>>>> [snip patch]
>>>>>>
>>>>>>> I still saw the issue with this change applied. PPC_IRQ_SOFT_MASK_D=
EBUG
>>>>>>> didn't report anything (either with or without the change above).
>>>>>> Okay, it was a bit of a shot in the dark. I still can't see what
>>>>>> else has changed.
>>>>>>
>>>>>> What would cause this, a lost interrupt? A spurious interrupt? Or
>>>>>> higher interrupt latency?
>>>>>>
>>>>>> I don't think the patch should cause significantly worse latency,
>>>>>> (it's supposed to be a bit better if anything because it doesn't set
>>>>>> up the full interrupt frame). But it's possible.
>>>>> My working theory is that the SPI_DON indication is all about the TX
>>>>> direction an now that the interrupts are faster we're hitting an erro=
r
>>>>> because there is still RX activity going on. Heiner disagrees with my
>>>>> interpretation of the SPI_DON indication and the fact that it doesn't
>>>>> happen every time does throw doubt on it.
>>>>>
>>>> It's right that the eSPI spec can be interpreted that SPI_DON refers t=
o
>>>> TX only. However this wouldn't really make sense, because also for RX
>>>> we program the frame length, and therefore want to be notified once th=
e
>>>> full frame was received. Also practical experience shows that SPI_DON
>>>> is set also after RX-only transfers.
>>>> Typical SPI NOR use case is that you write read command + start addres=
s,
>>>> followed by a longer read. If the TX-only interpretation would be righ=
t,
>>>> we'd always end up with SPI_DON not being set.
>>>>
>>>>> I can't really explain the extra RX byte in the fifo. We know how man=
y
>>>>> bytes to expect and we pull that many from the fifo so it's not as if
>>>>> we're missing an interrupt causing us to skip the last byte. I've bee=
n
>>>>> looking for some kind of off-by-one calculation but again if it were
>>>>> something like that it'd happen all the time.
>>>>>
>>>> Maybe it helps to know what value this extra byte in the FIFO has. Is =
it:
>>>> - a duplicate of the last read byte
>>>> - or the next byte (at <end address> + 1)
>>>> - or a fixed value, e.g. always 0x00 or 0xff
>>> The values were up thread a bit but I'll repeat them here
>>>
>>> fsl_espi ffe110000.spi: tx 70
>>> fsl_espi ffe110000.spi: rx 03
>>> fsl_espi ffe110000.spi: Extra RX 00
>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>> fsl_espi ffe110000.spi: tx 05
>>> fsl_espi ffe110000.spi: rx 00
>>> fsl_espi ffe110000.spi: Extra RX 03
>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>> fsl_espi ffe110000.spi: tx 05
>>> fsl_espi ffe110000.spi: rx 00
>>> fsl_espi ffe110000.spi: Extra RX 03
>>>
>>>
>>> The rx 00 Extra RX 03 is a bit concerning. I've only ever seen them wit=
h
>>> either a READ_SR or a READ_FSR. Never a data read.
>>>
>> Just remembered something about SPIE_DON:
>> Transfers are always full duplex, therefore in case of a read the chip
>> sends dummy zero's. Having said that in case of a read SPIE_DON means
>> that the last dummy zero was shifted out.
>>
>> READ_SR and READ_FSR are the shortest transfers, 1 byte out and 1 byte i=
n.
>> So the issue may have a dependency on the length of the transfer.
>> However I see no good explanation so far. You can try adding a delay of
>> a few miroseconds between the following to commands in fsl_espi_bufs().
>>
>> 	fsl_espi_write_reg(espi, ESPI_SPIM, mask);
>>
>> 	/* Prevent filling the fifo from getting interrupted */
>> 	spin_lock_irq(&espi->lock);
>>
>> Maybe enabling interrupts and seeing the SPIE_DON interrupt are too clos=
e.
> I think this might be heading in the right direction. Playing about with=20
> a delay does seem to make the two symptoms less likely. Although I have=20
> to set it quite high (i.e. msleep(100)) to completely avoid any=20
> possibility of seeing either message.

The patch might replay the interrupt a little bit faster, but it would=20
be a few microseconds at most I think (just from improved code).

Would you be able to ftrace the interrupt handler function and see if you
can see a difference in number or timing of interrupts? I'm at a bit of=20
a loss.

Thanks,
Nick

