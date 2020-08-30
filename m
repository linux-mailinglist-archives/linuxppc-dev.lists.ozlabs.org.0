Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E26B256E35
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 15:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfZg22KRszDqKH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 23:58:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cbVBoZnm; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfZbv4LzlzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 23:55:37 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id l21so3118606eds.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=umfmLmNNJO0eXLZG8554MCglAf/keGt1So/6N/p4gkw=;
 b=cbVBoZnmwM50n7/f20PgwmCmzNur94mcrKwOgrHBHUGEIZv4DY4BucoYRDICKTUCZk
 VRKrCltTQ8ued8Rol8UNQVuenhDGt7FSkw8Qw6mWZA0WS8Zb6OFuGz/QdWdf9jVRi7pP
 zi6ZItEDYR3mB7ISK7mg05lhhGmG+bFI16aJ9a5gksyMWgEOmXzfbxULaFbTkFP8rz3R
 KtPbYc/U27Wq1QYZ7zx5GUAUb1ELheeoyRG3edksXajrHhnFH9HpaOc2n3cdWb4XHv1+
 k3e2PITnKmSNdgcqVEe4pMVToXL6N8CxRrToJek+YOjEFAWW3Zn/MKusYVNxlyDzfJsJ
 XhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=umfmLmNNJO0eXLZG8554MCglAf/keGt1So/6N/p4gkw=;
 b=j32LhuQHfRYdQxZkuULnBVCBJOk8jTiVri78DVGH8fV2b3IXKYWtdw/btl02tvVaqo
 yqfvCkcvLhOu9FHEm4LPzpVh535/WMgDKSSLthNhEO67rxad/R7vz1OyT4fuYaz7BSs1
 6XTvFDph9Qr3jYhlejY6K5z5DIkSUuKa0l66Iwkn0BZ0w6+KIswJj8ZgcLUVHWCNdoCN
 U8oo2dbGqn3ZctmzML/LrD087bBKr0LfLsq54JAF7DGz2UKbuGeRKuqvrryW82o55V9E
 rpOYeb/w1gC2iMb+5+YAdeeiWjYzcOs+JVNw5Vpfq/23SDIbbqkXYO7BgJOJVAy5L++K
 2jVw==
X-Gm-Message-State: AOAM530LbRmhPIwZ1DwjNjWxivU/+ufbv7lYS7OdEm0tJPjvG0dNlN2a
 ytbB+2lnPn1j/cntEyZ3SHk=
X-Google-Smtp-Source: ABdhPJwCuaIdHcjbII7/bHG6vEKshkdxw4H7/wmILrqEgrMpWQ6vTVTl/t/Dm2laa2Gt8XL9hmpGPA==
X-Received: by 2002:a50:c909:: with SMTP id o9mr7317865edh.148.1598795732808; 
 Sun, 30 Aug 2020 06:55:32 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f23:5700:b849:b64c:7fd2:8e54?
 (p200300ea8f235700b849b64c7fd28e54.dip0.t-ipconnect.de.
 [2003:ea:8f23:5700:b849:b64c:7fd2:8e54])
 by smtp.googlemail.com with ESMTPSA id oz4sm5171057ejb.106.2020.08.30.06.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 06:55:32 -0700 (PDT)
Subject: Re: fsl_espi errors on v5.7.15
To: Nicholas Piggin <npiggin@gmail.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "paulus@samba.org" <paulus@samba.org>
References: <42107721-614b-96e8-68d9-4b888206562e@alliedtelesis.co.nz>
 <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
 <1598510348.1g7wt0s02s.astroid@bobo.none>
 <0068446e-06f8-6648-2f40-56f324c1ee6e@alliedtelesis.co.nz>
 <1598788275.m90vz24p6x.astroid@bobo.none>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <d1a61e61-d101-e8ce-0fa1-ff4fb60ee654@gmail.com>
Date: Sun, 30 Aug 2020 15:55:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1598788275.m90vz24p6x.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.08.2020 14:30, Nicholas Piggin wrote:
> Excerpts from Chris Packham's message of August 28, 2020 8:07 am:
>> On 27/08/20 7:12 pm, Nicholas Piggin wrote:
>>> Excerpts from Heiner Kallweit's message of August 26, 2020 4:38 pm:
>>>> On 26.08.2020 08:07, Chris Packham wrote:
>>>>> On 26/08/20 1:48 pm, Chris Packham wrote:
>>>>>> On 26/08/20 10:22 am, Chris Packham wrote:
>>>>>>> On 25/08/20 7:22 pm, Heiner Kallweit wrote:
>>>>>>>
>>>>>>> <snip>
>>>>>>>> I've been staring at spi-fsl-espi.c for while now and I think I've
>>>>>>>>> identified a couple of deficiencies that may or may not be related
>>>>>>>>> to my
>>>>>>>>> issue.
>>>>>>>>>
>>>>>>>>> First I think the 'Transfer done but SPIE_DON isn't set' message
>>>>>>>>> can be
>>>>>>>>> generated spuriously. In fsl_espi_irq() we read the ESPI_SPIE
>>>>>>>>> register.
>>>>>>>>> We also write back to it to clear the current events. We re-read it in
>>>>>>>>> fsl_espi_cpu_irq() and complain when SPIE_DON is not set. But we can
>>>>>>>>> naturally end up in that situation if we're doing a large read.
>>>>>>>>> Consider
>>>>>>>>> the messages for reading a block of data from a spi-nor chip
>>>>>>>>>
>>>>>>>>>     tx = READ_OP + ADDR
>>>>>>>>>     rx = data
>>>>>>>>>
>>>>>>>>> We setup the transfer and pump out the tx_buf. The first interrupt
>>>>>>>>> goes
>>>>>>>>> off and ESPI_SPIE has SPIM_DON and SPIM_RXT set. We empty the rx fifo,
>>>>>>>>> clear ESPI_SPIE and wait for the next interrupt. The next interrupt
>>>>>>>>> fires and this time we have ESPI_SPIE with just SPIM_RXT set. This
>>>>>>>>> continues until we've received all the data and we finish with
>>>>>>>>> ESPI_SPIE
>>>>>>>>> having only SPIM_RXT set. When we re-read it we complain that SPIE_DON
>>>>>>>>> isn't set.
>>>>>>>>>
>>>>>>>>> The other deficiency is that we only get an interrupt when the
>>>>>>>>> amount of
>>>>>>>>> data in the rx fifo is above FSL_ESPI_RXTHR. If there are fewer than
>>>>>>>>> FSL_ESPI_RXTHR left to be received we will never pull them out of
>>>>>>>>> the fifo.
>>>>>>>>>
>>>>>>>> SPIM_DON will trigger an interrupt once the last characters have been
>>>>>>>> transferred, and read the remaining characters from the FIFO.
>>>>>>> The T2080RM that I have says the following about the DON bit
>>>>>>>
>>>>>>> "Last character was transmitted. The last character was transmitted
>>>>>>> and a new command can be written for the next frame."
>>>>>>>
>>>>>>> That does at least seem to fit with my assertion that it's all about
>>>>>>> the TX direction. But the fact that it doesn't happen all the time
>>>>>>> throws some doubt on it.
>>>>>>>
>>>>>>>> I think the reason I'm seeing some variability is because of how fast
>>>>>>>>> (or slow) the interrupts get processed and how fast the spi-nor
>>>>>>>>> chip can
>>>>>>>>> fill the CPUs rx fifo.
>>>>>>>>>
>>>>>>>> To rule out timing issues at high bus frequencies I initially asked
>>>>>>>> for re-testing at lower frequencies. If you e.g. limit the bus to 1 MHz
>>>>>>>> or even less, then timing shouldn't be an issue.
>>>>>>> Yes I've currently got spi-max-frequency = <1000000>; in my dts. I
>>>>>>> would also expect a slower frequency would fit my "DON is for TX"
>>>>>>> narrative.
>>>>>>>> Last relevant functional changes have been done almost 4 years ago.
>>>>>>>> And yours is the first such report I see. So question is what could
>>>>>>>> be so
>>>>>>>> special with your setup that it seems you're the only one being
>>>>>>>> affected.
>>>>>>>> The scenarios you describe are standard, therefore much more people
>>>>>>>> should be affected in case of a driver bug.
>>>>>>> Agreed. But even on my hardware (which may have a latent issue
>>>>>>> despite being in the field for going on 5 years) the issue only
>>>>>>> triggers under some fairly specific circumstances.
>>>>>>>> You said that kernel config impacts how frequently the issue happens.
>>>>>>>> Therefore question is what's the diff in kernel config, and how could
>>>>>>>> the differences be related to SPI.
>>>>>>> It did seem to be somewhat random. Things like CONFIG_PREEMPT have an
>>>>>>> impact but every time I found something that seemed to be having an
>>>>>>> impact I've been able to disprove it. I actually think its about how
>>>>>>> busy the system is which may or may not affect when we get round to
>>>>>>> processing the interrupts.
>>>>>>>
>>>>>>> I have managed to get the 'Transfer done but SPIE_DON isn't set!' to
>>>>>>> occur on the T2080RDB.
>>>>>>>
>>>>>>> I've had to add the following to expose the environment as a mtd
>>>>>>> partition
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>>> b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>>> index ff87e67c70da..fbf95fc1fd68 100644
>>>>>>> --- a/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>>> +++ b/arch/powerpc/boot/dts/fsl/t208xrdb.dtsi
>>>>>>> @@ -116,6 +116,15 @@ flash@0 {
>>>>>>>                                  compatible = "micron,n25q512ax3",
>>>>>>> "jedec,spi-nor";
>>>>>>>                                  reg = <0>;
>>>>>>>                                  spi-max-frequency = <10000000>; /*
>>>>>>> input clock */
>>>>>>> +
>>>>>>> +                               partition@u-boot {
>>>>>>> +                                        reg = <0x00000000 0x00100000>;
>>>>>>> +                                        label = "u-boot";
>>>>>>> +                                };
>>>>>>> +                                partition@u-boot-env {
>>>>>>> +                                        reg = <0x00100000 0x00010000>;
>>>>>>> +                                        label = "u-boot-env";
>>>>>>> +                                };
>>>>>>>                          };
>>>>>>>                  };
>>>>>>>
>>>>>>> And I'm using the following script to poke at the environment
>>>>>>> (warning if anyone does try this and the bug hits it can render your
>>>>>>> u-boot environment invalid).
>>>>>>>
>>>>>>> cat flash/fw_env_test.sh
>>>>>>> #!/bin/sh
>>>>>>>
>>>>>>> generate_fw_env_config()
>>>>>>> {
>>>>>>>    cat /proc/mtd | sed 's/[:"]//g' | while read dev size erasesize
>>>>>>> name ; do
>>>>>>>       echo "$dev $size $erasesize $name"
>>>>>>>       [ "$name" = "u-boot-env" ] && echo "/dev/$dev 0x0000 0x2000
>>>>>>> $erasesize" >/flash/fw_env.config
>>>>>>>    done
>>>>>>> }
>>>>>>>
>>>>>>> cycles=10
>>>>>>> [ $# -ge 1 ] && cycles=$1
>>>>>>>
>>>>>>> generate_fw_env_config
>>>>>>>
>>>>>>> fw_printenv -c /flash/fw_env.config
>>>>>>>
>>>>>>> dmesg -c >/dev/null
>>>>>>> x=0
>>>>>>> while [ $x -lt $cycles ]; do
>>>>>>>      fw_printenv -c /flash/fw_env.config >/dev/null || break
>>>>>>>      fw_setenv -c /flash/fw_env.config foo $RANDOM || break;
>>>>>>>      dmesg -c | grep -q fsl_espi && break;
>>>>>>>      let x=x+1
>>>>>>> done
>>>>>>>
>>>>>>> echo "Ran $x cycles"
>>>>>> I've also now seen the RX FIFO not empty error on the T2080RDB
>>>>>>
>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>
>>>>>> With my current workaround of emptying the RX FIFO. It seems
>>>>>> survivable. Interestingly it only ever seems to be 1 extra byte in the
>>>>>> RX FIFO and it seems to be after either a READ_SR or a READ_FSR.
>>>>>>
>>>>>> fsl_espi ffe110000.spi: tx 70
>>>>>> fsl_espi ffe110000.spi: rx 03
>>>>>> fsl_espi ffe110000.spi: Extra RX 00
>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>> fsl_espi ffe110000.spi: tx 05
>>>>>> fsl_espi ffe110000.spi: rx 00
>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>> fsl_espi ffe110000.spi: tx 05
>>>>>> fsl_espi ffe110000.spi: rx 00
>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>>
>>>>>>  From all the Micron SPI-NOR datasheets I've got access to it is
>>>>>> possible to continually read the SR/FSR. But I've no idea why it
>>>>>> happens some times and not others.
>>>>> So I think I've got a reproduction and I think I've bisected the problem
>>>>> to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in
>>>>> C"). My day is just finishing now so I haven't applied too much scrutiny
>>>>> to this result. Given the various rabbit holes I've been down on this
>>>>> issue already I'd take this information with a good degree of skepticism.
>>>>>
>>>> OK, so an easy test should be to re-test with a 5.4 kernel.
>>>> It doesn't have yet the change you're referring to, and the fsl-espi driver
>>>> is basically the same as in 5.7 (just two small changes in 5.7).
>>> There's 6cc0c16d82f88 and maybe also other interrupt related patches
>>> around this time that could affect book E, so it's good if that exact
>>> patch is confirmed.
>>
>> My confirmation is basically that I can induce the issue in a 5.4 kernel 
>> by cherry-picking 3282a3da25bd. I'm also able to "fix" the issue in 
>> 5.9-rc2 by reverting that one commit.
>>
>> I both cases it's not exactly a clean cherry-pick/revert so I also 
>> confirmed the bisection result by building at 3282a3da25bd (which sees 
>> the issue) and the commit just before (which does not).
> 
> Thanks for testing, that confirms it well.
> 
> [snip patch]
> 
>> I still saw the issue with this change applied. PPC_IRQ_SOFT_MASK_DEBUG 
>> didn't report anything (either with or without the change above).
> 
> Okay, it was a bit of a shot in the dark. I still can't see what
> else has changed.
> 
> What would cause this, a lost interrupt? A spurious interrupt? Or
> higher interrupt latency?
> 
> I don't think the patch should cause significantly worse latency,
> (it's supposed to be a bit better if anything because it doesn't set
> up the full interrupt frame). But it's possible.
> 
> Thanks,
> Nick
> 

As additional background:
When I refactored and extended the fsl-espi driver my test device was
a P1014-based WiFi router (running at 800MHz CPU clock). I still use it
and operate the SPI NOR (s25fl128s) at 50MHz in dual read mode
(with a 4.9 kernel). I never had a problem. 
If the issue now occurs on a system with most likely faster CPU and at
a much lower SPI bus frequency, then something must have a significant
impact on interrupt performance. However I can't say exactly which kind
of interrupt issue should cause the SPI issue we see.

Heiner
