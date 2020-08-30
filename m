Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8B256DAA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 14:32:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfXmS6V4mzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 22:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LYZMw5jJ; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfXjg4FqSzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 22:30:30 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id v15so2757461pgh.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 05:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=wr+aMjl/f4SRAIcJGA2olzHtyOUl4t3n3AY3xOhGXT8=;
 b=LYZMw5jJx43voTzxQZNB46UXHfs3AT2iaYFzSmgMc+XQ5TPm6AqpQrYoB5LmK+Gl8D
 nvObhSuHNsqEHSG5BnpYvaVHqP1kyncpb/U6y2HRBh548AdOAj/2U4qMbpQUWD9fMysE
 M+7kh3GnAYeLOWj+YpkXMdAuy2nk/z2rzd/JCfqU5iki7EiXu6yZq0CKEP5fAZQ230pY
 4LbQaKj41lvj2L9CXEm9UlT1zqDnA9QdGD4joF+Pj3QhKc15AC7131vHS2mPrnNvpcmx
 YFOT9JwLvfjiF4axHmZgLN8YG2GHXvl+8t18kHpBrCGB6QjQySbn0JVXtYXctubKEPQU
 cbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wr+aMjl/f4SRAIcJGA2olzHtyOUl4t3n3AY3xOhGXT8=;
 b=rtxd6sh6ze7byZfc5OqeNMWHBKAmXj6wU/9qvYn751jOnTVdZfPIHkEVFkI5j/a/3M
 a1R7ckYFCqa0KZiC6ortNWw9TwTS3x1oyjUcPSlV2c8JRvhkM/D5lj0NQJ90QPzdp7kM
 vWU7xt08h8uXtE+OIrSFhkW5y6MVxxqngOq6llN64GtUsnFSFv0Y3yV1xm1cfpf5zCOd
 22fL5y3uFbUlT70LpHDrRFZ8g1aMPy6kpyNrLvfOrlzJC1Ua2onMW/Ruv2/4wNHDEFyI
 3zG0h/IT+anwLVxfcWts/BQa74XhWxullKj8HtvEmmZ87Z1CC6n43FJ8HM7kso9Yltf0
 EXnA==
X-Gm-Message-State: AOAM5323ZMqDoI7W3WLWdgsMZ3s39EVfhvN4DlTT2LeJ4InkAx9Eaed2
 SzQGzG08TaYXUl5FXOGHl2M=
X-Google-Smtp-Source: ABdhPJxweF7i7A6Y8no69oSI9kD8wvKIuTrHyTswEPJbVRyxm8LZRzmtvrzbvlXT0+XEE8trHrPALg==
X-Received: by 2002:a63:ba49:: with SMTP id l9mr5195008pgu.101.1598790624880; 
 Sun, 30 Aug 2020 05:30:24 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id x187sm4967105pfc.121.2020.08.30.05.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 05:30:24 -0700 (PDT)
Date: Sun, 30 Aug 2020 22:30:18 +1000
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
In-Reply-To: <0068446e-06f8-6648-2f40-56f324c1ee6e@alliedtelesis.co.nz>
MIME-Version: 1.0
Message-Id: <1598788275.m90vz24p6x.astroid@bobo.none>
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

Excerpts from Chris Packham's message of August 28, 2020 8:07 am:
> On 27/08/20 7:12 pm, Nicholas Piggin wrote:
>> Excerpts from Heiner Kallweit's message of August 26, 2020 4:38 pm:
>>> On 26.08.2020 08:07, Chris Packham wrote:
>>>> On 26/08/20 1:48 pm, Chris Packham wrote:
>>>>> On 26/08/20 10:22 am, Chris Packham wrote:
>>>>>> On 25/08/20 7:22 pm, Heiner Kallweit wrote:
>>>>>>
>>>>>> <snip>
>>>>>>> I've been staring at spi-fsl-espi.c for while now and I think I've
>>>>>>>> identified a couple of deficiencies that may or may not be related
>>>>>>>> to my
>>>>>>>> issue.
>>>>>>>>
>>>>>>>> First I think the 'Transfer done but SPIE_DON isn't set' message
>>>>>>>> can be
>>>>>>>> generated spuriously. In fsl_espi_irq() we read the ESPI_SPIE
>>>>>>>> register.
>>>>>>>> We also write back to it to clear the current events. We re-read i=
t in
>>>>>>>> fsl_espi_cpu_irq() and complain when SPIE_DON is not set. But we c=
an
>>>>>>>> naturally end up in that situation if we're doing a large read.
>>>>>>>> Consider
>>>>>>>> the messages for reading a block of data from a spi-nor chip
>>>>>>>>
>>>>>>>>  =C2=A0 =C2=A0tx =3D READ_OP + ADDR
>>>>>>>>  =C2=A0 =C2=A0rx =3D data
>>>>>>>>
>>>>>>>> We setup the transfer and pump out the tx_buf. The first interrupt
>>>>>>>> goes
>>>>>>>> off and ESPI_SPIE has SPIM_DON and SPIM_RXT set. We empty the rx f=
ifo,
>>>>>>>> clear ESPI_SPIE and wait for the next interrupt. The next interrup=
t
>>>>>>>> fires and this time we have ESPI_SPIE with just SPIM_RXT set. This
>>>>>>>> continues until we've received all the data and we finish with
>>>>>>>> ESPI_SPIE
>>>>>>>> having only SPIM_RXT set. When we re-read it we complain that SPIE=
_DON
>>>>>>>> isn't set.
>>>>>>>>
>>>>>>>> The other deficiency is that we only get an interrupt when the
>>>>>>>> amount of
>>>>>>>> data in the rx fifo is above FSL_ESPI_RXTHR. If there are fewer th=
an
>>>>>>>> FSL_ESPI_RXTHR left to be received we will never pull them out of
>>>>>>>> the fifo.
>>>>>>>>
>>>>>>> SPIM_DON will trigger an interrupt once the last characters have be=
en
>>>>>>> transferred, and read the remaining characters from the FIFO.
>>>>>> The T2080RM that I have says the following about the DON bit
>>>>>>
>>>>>> "Last character was transmitted. The last character was transmitted
>>>>>> and a new command can be written for the next frame."
>>>>>>
>>>>>> That does at least seem to fit with my assertion that it's all about
>>>>>> the TX direction. But the fact that it doesn't happen all the time
>>>>>> throws some doubt on it.
>>>>>>
>>>>>>> I think the reason I'm seeing some variability is because of how fa=
st
>>>>>>>> (or slow) the interrupts get processed and how fast the spi-nor
>>>>>>>> chip can
>>>>>>>> fill the CPUs rx fifo.
>>>>>>>>
>>>>>>> To rule out timing issues at high bus frequencies I initially asked
>>>>>>> for re-testing at lower frequencies. If you e.g. limit the bus to 1=
 MHz
>>>>>>> or even less, then timing shouldn't be an issue.
>>>>>> Yes I've currently got spi-max-frequency =3D <1000000>; in my dts. I
>>>>>> would also expect a slower frequency would fit my "DON is for TX"
>>>>>> narrative.
>>>>>>> Last relevant functional changes have been done almost 4 years ago.
>>>>>>> And yours is the first such report I see. So question is what could
>>>>>>> be so
>>>>>>> special with your setup that it seems you're the only one being
>>>>>>> affected.
>>>>>>> The scenarios you describe are standard, therefore much more people
>>>>>>> should be affected in case of a driver bug.
>>>>>> Agreed. But even on my hardware (which may have a latent issue
>>>>>> despite being in the field for going on 5 years) the issue only
>>>>>> triggers under some fairly specific circumstances.
>>>>>>> You said that kernel config impacts how frequently the issue happen=
s.
>>>>>>> Therefore question is what's the diff in kernel config, and how cou=
ld
>>>>>>> the differences be related to SPI.
>>>>>> It did seem to be somewhat random. Things like CONFIG_PREEMPT have a=
n
>>>>>> impact but every time I found something that seemed to be having an
>>>>>> impact I've been able to disprove it. I actually think its about how
>>>>>> busy the system is which may or may not affect when we get round to
>>>>>> processing the interrupts.
>>>>>>
>>>>>> I have managed to get the 'Transfer done but SPIE_DON isn't set!' to
>>>>>> occur on the T2080RDB.
>>>>>>
>>>>>> I've had to add the following to expose the environment as a mtd
>>>>>> partition
>>>>>>
>>>>>> diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>> b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>> index ff87e67c70da..fbf95fc1fd68 100644
>>>>>> --- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>> +++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>> @@ -116,6 +116,15 @@ flash@0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "micron,n25q51=
2ax3",
>>>>>> "jedec,spi-nor";
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <100000=
00>; /*
>>>>>> input clock */
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 partition@u-boot {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0x00000000 0x00100000>;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 label =3D "u-boot";
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 partition@u-boot-env {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0x00100000 0x00010000>;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 label =3D "u-boot-env";
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>
>>>>>> And I'm using the following script to poke at the environment
>>>>>> (warning if anyone does try this and the bug hits it can render your
>>>>>> u-boot environment invalid).
>>>>>>
>>>>>> cat flash/fw_env_test.sh
>>>>>> #!/bin/sh
>>>>>>
>>>>>> generate_fw_env_config()
>>>>>> {
>>>>>>  =C2=A0 cat /proc/mtd | sed 's/[:"]//g' | while read dev size erases=
ize
>>>>>> name ; do
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 echo "$dev $size $erasesize $name"
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 [ "$name" =3D "u-boot-env" ] && echo "/dev=
/$dev 0x0000 0x2000
>>>>>> $erasesize" >/flash/fw_env.config
>>>>>>  =C2=A0 done
>>>>>> }
>>>>>>
>>>>>> cycles=3D10
>>>>>> [ $# -ge 1 ] && cycles=3D$1
>>>>>>
>>>>>> generate_fw_env_config
>>>>>>
>>>>>> fw_printenv -c /flash/fw_env.config
>>>>>>
>>>>>> dmesg -c >/dev/null
>>>>>> x=3D0
>>>>>> while [ $x -lt $cycles ]; do
>>>>>>  =C2=A0=C2=A0=C2=A0 fw_printenv -c /flash/fw_env.config >/dev/null |=
| break
>>>>>>  =C2=A0=C2=A0=C2=A0 fw_setenv -c /flash/fw_env.config foo $RANDOM ||=
 break;
>>>>>>  =C2=A0=C2=A0=C2=A0 dmesg -c | grep -q fsl_espi && break;
>>>>>>  =C2=A0=C2=A0=C2=A0 let x=3Dx+1
>>>>>> done
>>>>>>
>>>>>> echo "Ran $x cycles"
>>>>> I've also now seen the RX FIFO not empty error on the T2080RDB
>>>>>
>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>>>
>>>>> With my current workaround of emptying the RX FIFO. It seems
>>>>> survivable. Interestingly it only ever seems to be 1 extra byte in th=
e
>>>>> RX FIFO and it seems to be after either a READ_SR or a READ_FSR.
>>>>>
>>>>> fsl_espi ffe110000.spi: tx 70
>>>>> fsl_espi ffe110000.spi: rx 03
>>>>> fsl_espi ffe110000.spi: Extra RX 00
>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>>> fsl_espi ffe110000.spi: tx 05
>>>>> fsl_espi ffe110000.spi: rx 00
>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>>> fsl_espi ffe110000.spi: tx 05
>>>>> fsl_espi ffe110000.spi: rx 00
>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>
>>>>>  From all the Micron SPI-NOR datasheets I've got access to it is
>>>>> possible to continually read the SR/FSR. But I've no idea why it
>>>>> happens some times and not others.
>>>> So I think I've got a reproduction and I think I've bisected the probl=
em
>>>> to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt replay i=
n
>>>> C"). My day is just finishing now so I haven't applied too much scruti=
ny
>>>> to this result. Given the various rabbit holes I've been down on this
>>>> issue already I'd take this information with a good degree of skeptici=
sm.
>>>>
>>> OK, so an easy test should be to re-test with a 5.4 kernel.
>>> It doesn't have yet the change you're referring to, and the fsl-espi dr=
iver
>>> is basically the same as in 5.7 (just two small changes in 5.7).
>> There's 6cc0c16d82f88 and maybe also other interrupt related patches
>> around this time that could affect book E, so it's good if that exact
>> patch is confirmed.
>=20
> My confirmation is basically that I can induce the issue in a 5.4 kernel=20
> by cherry-picking 3282a3da25bd. I'm also able to "fix" the issue in=20
> 5.9-rc2 by reverting that one commit.
>=20
> I both cases it's not exactly a clean cherry-pick/revert so I also=20
> confirmed the bisection result by building at 3282a3da25bd (which sees=20
> the issue) and the commit just before (which does not).

Thanks for testing, that confirms it well.

[snip patch]

> I still saw the issue with this change applied. PPC_IRQ_SOFT_MASK_DEBUG=20
> didn't report anything (either with or without the change above).

Okay, it was a bit of a shot in the dark. I still can't see what
else has changed.

What would cause this, a lost interrupt? A spurious interrupt? Or
higher interrupt latency?

I don't think the patch should cause significantly worse latency,
(it's supposed to be a bit better if anything because it doesn't set
up the full interrupt frame). But it's possible.

Thanks,
Nick
