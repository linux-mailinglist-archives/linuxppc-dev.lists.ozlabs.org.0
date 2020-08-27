Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AF4253EBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 09:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcYrF6nKQzDqby
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j/SBsRh2; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcYpK6j3DzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:12:40 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 67so2678579pgd.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 00:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9KwsoXZAG9G+8rQLlQKUR+4Ab0l4Bgzk1eV9n41JmtM=;
 b=j/SBsRh2styerL1koTfBzrM3ybPWpPxe+BHJUd3gPcuOqsTcukdsGe5Qne6umOhrtf
 LPRIUsuYqp2QWW81nw/UpG/CQAiNJsKax44UiYcFbs4NfffkSB2VyTTvv7jGE69ECPjm
 E1/+PPkv7JaJPMM4dveRMgPfJweuzMAoSQbjlD7LGX/fcTsYfdVwh+uNnusyzn0lSuQO
 xSo6wWGtnxuA/1qWQwbM7sW2+ROw4nuZUigdwx+FafAwkGZWmldzIayti1ClHpm7RCmY
 62vhxzG9f8Vb6vV1wtxxd7zyya3FYl60PhY72d6lN1aG7UWwlgLbePiAQm27ZB+O2w7K
 Ue5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9KwsoXZAG9G+8rQLlQKUR+4Ab0l4Bgzk1eV9n41JmtM=;
 b=ESqdJJq2QiF6Scg1xf/PF8BWbO96wH58CIRv/09kpEY0atkyBBdijLFbLycE8319Az
 BwucMByqOmGD9JM2KIjErORhvBI4bOX+1Vw0qZpuHvJnedIYuL8CgR8GFOkcd+IH70p9
 w9CNvNgJWFGy4vRcuEwpNz6OGg5nz65BDGtAv3EDb/ZBB+R4lko2uc+4WVMpszYPOP4Q
 TRq2dYy8BKeiqwPsNwC9dfH88V6FHF0sW5kwl8Vau9XRrRHDwRu0xTVU/WzGX6LcOIuR
 aPKc53rmhfBJPoaTj76laBMqsfbjtBwks2UwOo992So0N5SkKWjfhMmVStSK3az1K69w
 VMMw==
X-Gm-Message-State: AOAM532cGEHWszR8RoSXxPy2V7531ZfMjmgfRpp0nrmICUYW5wVBdGQA
 2+ZuFzsXxgI4ccK40j2ApYE=
X-Google-Smtp-Source: ABdhPJxYEjLQ/AG7YRXyGxrT4w8lJSC3QuxETv+hJv01o4tLHdbE2QJYG6+xHhBxMUTvytYwyAiCUQ==
X-Received: by 2002:a63:d5f:: with SMTP id 31mr13187731pgn.331.1598512357577; 
 Thu, 27 Aug 2020 00:12:37 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id t12sm1121357pjv.55.2020.08.27.00.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 00:12:36 -0700 (PDT)
Date: Thu, 27 Aug 2020 17:12:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: fsl_espi errors on v5.7.15
To: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "broonie@kernel.org" <broonie@kernel.org>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Heiner Kallweit <hkallweit1@gmail.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "paulus@samba.org"
 <paulus@samba.org>
References: <42107721-614b-96e8-68d9-4b888206562e@alliedtelesis.co.nz>
 <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
In-Reply-To: <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
MIME-Version: 1.0
Message-Id: <1598510348.1g7wt0s02s.astroid@bobo.none>
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

Excerpts from Heiner Kallweit's message of August 26, 2020 4:38 pm:
> On 26.08.2020 08:07, Chris Packham wrote:
>>=20
>> On 26/08/20 1:48 pm, Chris Packham wrote:
>>>
>>> On 26/08/20 10:22 am, Chris Packham wrote:
>>>> On 25/08/20 7:22 pm, Heiner Kallweit wrote:
>>>>
>>>> <snip>
>>>>> I've been staring at spi-fsl-espi.c for while now and I think I've
>>>>>> identified a couple of deficiencies that may or may not be related=20
>>>>>> to my
>>>>>> issue.
>>>>>>
>>>>>> First I think the 'Transfer done but SPIE_DON isn't set' message=20
>>>>>> can be
>>>>>> generated spuriously. In fsl_espi_irq() we read the ESPI_SPIE=20
>>>>>> register.
>>>>>> We also write back to it to clear the current events. We re-read it =
in
>>>>>> fsl_espi_cpu_irq() and complain when SPIE_DON is not set. But we can
>>>>>> naturally end up in that situation if we're doing a large read.=20
>>>>>> Consider
>>>>>> the messages for reading a block of data from a spi-nor chip
>>>>>>
>>>>>> =C2=A0 =C2=A0tx =3D READ_OP + ADDR
>>>>>> =C2=A0 =C2=A0rx =3D data
>>>>>>
>>>>>> We setup the transfer and pump out the tx_buf. The first interrupt=20
>>>>>> goes
>>>>>> off and ESPI_SPIE has SPIM_DON and SPIM_RXT set. We empty the rx fif=
o,
>>>>>> clear ESPI_SPIE and wait for the next interrupt. The next interrupt
>>>>>> fires and this time we have ESPI_SPIE with just SPIM_RXT set. This
>>>>>> continues until we've received all the data and we finish with=20
>>>>>> ESPI_SPIE
>>>>>> having only SPIM_RXT set. When we re-read it we complain that SPIE_D=
ON
>>>>>> isn't set.
>>>>>>
>>>>>> The other deficiency is that we only get an interrupt when the=20
>>>>>> amount of
>>>>>> data in the rx fifo is above FSL_ESPI_RXTHR. If there are fewer than
>>>>>> FSL_ESPI_RXTHR left to be received we will never pull them out of=20
>>>>>> the fifo.
>>>>>>
>>>>> SPIM_DON will trigger an interrupt once the last characters have been
>>>>> transferred, and read the remaining characters from the FIFO.
>>>>
>>>> The T2080RM that I have says the following about the DON bit
>>>>
>>>> "Last character was transmitted. The last character was transmitted=20
>>>> and a new command can be written for the next frame."
>>>>
>>>> That does at least seem to fit with my assertion that it's all about=20
>>>> the TX direction. But the fact that it doesn't happen all the time=20
>>>> throws some doubt on it.
>>>>
>>>>> I think the reason I'm seeing some variability is because of how fast
>>>>>> (or slow) the interrupts get processed and how fast the spi-nor=20
>>>>>> chip can
>>>>>> fill the CPUs rx fifo.
>>>>>>
>>>>> To rule out timing issues at high bus frequencies I initially asked
>>>>> for re-testing at lower frequencies. If you e.g. limit the bus to 1 M=
Hz
>>>>> or even less, then timing shouldn't be an issue.
>>>> Yes I've currently got spi-max-frequency =3D <1000000>; in my dts. I=20
>>>> would also expect a slower frequency would fit my "DON is for TX"=20
>>>> narrative.
>>>>> Last relevant functional changes have been done almost 4 years ago.
>>>>> And yours is the first such report I see. So question is what could=20
>>>>> be so
>>>>> special with your setup that it seems you're the only one being=20
>>>>> affected.
>>>>> The scenarios you describe are standard, therefore much more people
>>>>> should be affected in case of a driver bug.
>>>> Agreed. But even on my hardware (which may have a latent issue=20
>>>> despite being in the field for going on 5 years) the issue only=20
>>>> triggers under some fairly specific circumstances.
>>>>> You said that kernel config impacts how frequently the issue happens.
>>>>> Therefore question is what's the diff in kernel config, and how could
>>>>> the differences be related to SPI.
>>>>
>>>> It did seem to be somewhat random. Things like CONFIG_PREEMPT have an=20
>>>> impact but every time I found something that seemed to be having an=20
>>>> impact I've been able to disprove it. I actually think its about how=20
>>>> busy the system is which may or may not affect when we get round to=20
>>>> processing the interrupts.
>>>>
>>>> I have managed to get the 'Transfer done but SPIE_DON isn't set!' to=20
>>>> occur on the T2080RDB.
>>>>
>>>> I've had to add the following to expose the environment as a mtd=20
>>>> partition
>>>>
>>>> diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi=20
>>>> b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>> index ff87e67c70da..fbf95fc1fd68 100644
>>>> --- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>> +++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>> @@ -116,6 +116,15 @@ flash@0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "micron,n25q512ax=
3",=20
>>>> "jedec,spi-nor";
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <10000000>=
; /*=20
>>>> input clock */
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 partition@u-boot {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 reg =3D <0x00000000 0x00100000>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 label =3D "u-boot";
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 partition@u-boot-env {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 reg =3D <0x00100000 0x00010000>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 label =3D "u-boot-env";
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 };
>>>>
>>>> And I'm using the following script to poke at the environment=20
>>>> (warning if anyone does try this and the bug hits it can render your=20
>>>> u-boot environment invalid).
>>>>
>>>> cat flash/fw_env_test.sh
>>>> #!/bin/sh
>>>>
>>>> generate_fw_env_config()
>>>> {
>>>> =C2=A0 cat /proc/mtd | sed 's/[:"]//g' | while read dev size erasesize=
=20
>>>> name ; do
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "$dev $size $erasesize $name"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 [ "$name" =3D "u-boot-env" ] && echo "/dev/$d=
ev 0x0000 0x2000=20
>>>> $erasesize" >/flash/fw_env.config
>>>> =C2=A0 done
>>>> }
>>>>
>>>> cycles=3D10
>>>> [ $# -ge 1 ] && cycles=3D$1
>>>>
>>>> generate_fw_env_config
>>>>
>>>> fw_printenv -c /flash/fw_env.config
>>>>
>>>> dmesg -c >/dev/null
>>>> x=3D0
>>>> while [ $x -lt $cycles ]; do
>>>> =C2=A0=C2=A0=C2=A0 fw_printenv -c /flash/fw_env.config >/dev/null || b=
reak
>>>> =C2=A0=C2=A0=C2=A0 fw_setenv -c /flash/fw_env.config foo $RANDOM || br=
eak;
>>>> =C2=A0=C2=A0=C2=A0 dmesg -c | grep -q fsl_espi && break;
>>>> =C2=A0=C2=A0=C2=A0 let x=3Dx+1
>>>> done
>>>>
>>>> echo "Ran $x cycles"
>>>
>>> I've also now seen the RX FIFO not empty error on the T2080RDB
>>>
>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>> fsl_espi ffe110000.spi: SPIE_RXCNT =3D 1, SPIE_TXCNT =3D 32
>>>
>>> With my current workaround of emptying the RX FIFO. It seems=20
>>> survivable. Interestingly it only ever seems to be 1 extra byte in the=20
>>> RX FIFO and it seems to be after either a READ_SR or a READ_FSR.
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
>>> From all the Micron SPI-NOR datasheets I've got access to it is=20
>>> possible to continually read the SR/FSR. But I've no idea why it=20
>>> happens some times and not others.
>>=20
>> So I think I've got a reproduction and I think I've bisected the problem=
=20
>> to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in=20
>> C"). My day is just finishing now so I haven't applied too much scrutiny=
=20
>> to this result. Given the various rabbit holes I've been down on this=20
>> issue already I'd take this information with a good degree of skepticism=
.
>>=20
> OK, so an easy test should be to re-test with a 5.4 kernel.
> It doesn't have yet the change you're referring to, and the fsl-espi driv=
er
> is basically the same as in 5.7 (just two small changes in 5.7).

There's 6cc0c16d82f88 and maybe also other interrupt related patches=20
around this time that could affect book E, so it's good if that exact
patch is confirmed.

I've been staring at 3282a3da25bd for a while and nothing immediately=20
stands out. It doesn't look like the low level handlers do anything
special (well 0x900 does ack the decrementer, but so does the masked
handler).

Can you try this patch and also enable CONFIG_PPC_IRQ_SOFT_MASK_DEBUG?

Thanks,
Nick

---
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bf21ebd36190..10d339042330 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -214,7 +214,7 @@ void replay_soft_interrupts(void)
 	struct pt_regs regs;
=20
 	ppc_save_regs(&regs);
-	regs.softe =3D IRQS_ALL_DISABLED;
+	regs.softe =3D IRQS_ENABLED;
=20
 again:
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
@@ -349,6 +349,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
 		__hard_irq_disable();
+		local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
 	} else {
 		/*
 		 * We should already be hard disabled here. We had bugs
@@ -368,6 +369,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		}
 	}
=20
+	preempt_disable();
 	irq_soft_mask_set(IRQS_ALL_DISABLED);
 	trace_hardirqs_off();
=20
@@ -377,6 +379,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	trace_hardirqs_on();
 	irq_soft_mask_set(IRQS_ENABLED);
 	__hard_irq_enable();
+	preempt_enable();
 }
 EXPORT_SYMBOL(arch_local_irq_restore);
=20
