Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BEC251319
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 09:24:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbL970XcTzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LKg4zB/v; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbL772X0xzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 17:22:58 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id si26so15178980ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OADTftaUqa0gqWbzg8dntRETIGBaFisPIux6F2d7Xks=;
 b=LKg4zB/vDLYJda6TA91mSYdm6ubYWSNZ7yMZt6jDGsgx7tw7Kxs08Zzwiz3u5PgP0n
 qGgdt6Aa1TeorwyggBIJXKSRz4nQc1zK15UGtG3ClWCYR8v7J+T/YwVTTRODf1Y2mkSe
 jdG11BjPs0zKRtty0kQ7pUyHP5IrRxgWrf7UKWOHEf52VpMjvUKOiRcU4+jllCZzDwsj
 uUmNPMZJR15ya/E6jMoIe0Iwfhr5Iv5rymdxFCmOnlM6N7LNDLq4OJygpJS1IzAhJ4t9
 ooA/QSoN9vpa20V+0slmwh4mO0IqwcTSJ/2rNbHXk1bBcRJlEjEeDy2bECt6AOD1JUy5
 Yl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OADTftaUqa0gqWbzg8dntRETIGBaFisPIux6F2d7Xks=;
 b=tGzaw9nF5kJYoh4i1rtbxeQhivM/jJM2PyQCWWFiPSnkyYZuV34rpgztMKWSSWec52
 iU25PQ3fkSqKKejQtfCzO2vYq2eOvHmUWHgXl3LfL8KoQTjxeiKtBHUCMp+ZxFjXLdMp
 +3wUmVfIv7ihIa+aVavIWOoNWY3hkKKAr/Oj5J7clEbX+75aS2WLdbocnTHpdf3vk7AH
 COoxYQfjOg+QoKl55q9dojFAygDO8kVgpQd3811rd2UDDAf7TPReHDRVocS821ad1ven
 X9OfFjCYsvHRL+k5ts8wnzBw/M9yQJJbLyTjx3VtTurd9CcuzHiihok+H1xzpDUHBE1V
 Cf9A==
X-Gm-Message-State: AOAM533pEBS/tfasMdpDvjI1TmnRlMozlcoqT/0fm1tPgVVfGxUqeU2u
 R60TvejDfiU5q6wP4uZcQkI=
X-Google-Smtp-Source: ABdhPJwOkduFavTmq4VITqGicuVuRG4Vo1SQn5RrMfXrJPegMiqGfQLcpcchXDEu6lH0M99KUNcXtA==
X-Received: by 2002:a17:906:2289:: with SMTP id
 p9mr8900398eja.437.1598340174058; 
 Tue, 25 Aug 2020 00:22:54 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f23:5700:40ac:16ed:6e22:2a54?
 (p200300ea8f23570040ac16ed6e222a54.dip0.t-ipconnect.de.
 [2003:ea:8f23:5700:40ac:16ed:6e22:2a54])
 by smtp.googlemail.com with ESMTPSA id dj16sm6834217edb.5.2020.08.25.00.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 00:22:53 -0700 (PDT)
Subject: Re: fsl_espi errors on v5.7.15
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>
References: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
 <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
 <3c72eec1-41ba-7389-eceb-3de80065555a@alliedtelesis.co.nz>
 <1bbb3726-b0a4-6eb9-9076-706b06dfb90f@alliedtelesis.co.nz>
 <61bb9800-9f90-9cd4-3b17-c14a7f83d792@gmail.com>
 <0ff80ebb-e6ae-d8e1-9f0d-8759b2556141@alliedtelesis.co.nz>
 <c2dadf51-666f-72f6-7687-731f281ed7d6@alliedtelesis.co.nz>
 <4ed8a84b-0763-820e-df3e-1861d718f77d@alliedtelesis.co.nz>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <f97dc3af-d1f0-6974-ec2d-ace8d7e73993@gmail.com>
Date: Tue, 25 Aug 2020 09:22:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4ed8a84b-0763-820e-df3e-1861d718f77d@alliedtelesis.co.nz>
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

On 25.08.2020 05:54, Chris Packham wrote:
> 
> On 25/08/20 10:04 am, Chris Packham wrote:
>>
>> On 20/08/20 9:08 am, Chris Packham wrote:
>>>
>>> On 19/08/20 6:15 pm, Heiner Kallweit wrote:
>>>> On 19.08.2020 00:44, Chris Packham wrote:
>>>>> Hi Again,
>>>>>
>>>>> On 17/08/20 9:09 am, Chris Packham wrote:
>>>>>
>>>>>> On 14/08/20 6:19 pm, Heiner Kallweit wrote:
>>>>>>> On 14.08.2020 04:48, Chris Packham wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I'm seeing a problem with accessing spi-nor after upgrading a T2081
>>>>>>>> based system to linux v5.7.15
>>>>>>>>
>>>>>>>> For this board u-boot and the u-boot environment live on spi-nor.
>>>>>>>>
>>>>>>>> When I use fw_setenv from userspace I get the following kernel logs
>>>>>>>>
>>>>>>>> # fw_setenv foo=1
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't 
>>>>>>>> empty!
>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't 
>>>>>>>> empty!
>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't 
>>>>>>>> empty!
>>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>>> ...
>>>>>>>>
>>>>>>> This error reporting doesn't exist yet in 4.4. So you may have an 
>>>>>>> issue
>>>>>>> under 4.4 too, it's just not reported.
>>>>>>> Did you verify that under 4.4 fw_setenv actually has an effect?
>>>>>> Just double checked and yes under 4.4 the setting does get saved.
>>>>>>>> If I run fw_printenv (before getting it into a bad state) it is 
>>>>>>>> able to
>>>>>>>> display the content of the boards u-boot environment.
>>>>>>>>
>>>>>>> This might indicate an issue with spi being locked. I've seen 
>>>>>>> related
>>>>>>> questions, just use the search engine of your choice and check for
>>>>>>> fw_setenv and locked.
>>>>>> I'm running a version of fw_setenv which includes
>>>>>> https://gitlab.denx.de/u-boot/u-boot/-/commit/db820159 so it 
>>>>>> shouldn't
>>>>>> be locking things unnecessarily.
>>>>>>>> If been unsuccessful in producing a setup for bisecting the 
>>>>>>>> issue. I do
>>>>>>>> know the issue doesn't occur on the old 4.4.x based kernel but 
>>>>>>>> that's
>>>>>>>> probably not much help.
>>>>>>>>
>>>>>>>> Any pointers on what the issue (and/or solution) might be.
>>>>> I finally managed to get our board running with a vanilla kernel. With
>>>>> corenet64_smp_defconfig I occasionally see
>>>>>
>>>>>     fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>
>>>>> other than the message things seem to be working.
>>>>>
>>>>> With a custom defconfig I see
>>>>>
>>>>>     fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>     fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't 
>>>>> empty!
>>>>>     fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>     ...
>>>>>
>>>>> and access to the spi-nor does not work until the board is reset.
>>>>>
>>>>> I'll try and pick apart the differences between the two defconfigs.
>>>
>>> I now think my earlier testing is invalid. I have seen the problem 
>>> with either defconfig if I try hard enough. I had convinced myself 
>>> that the problem was CONFIG_PREEMPT but that was before I found 
>>> boot-to-boot differences with the same kernel.
>>>
>>> It's possible that I'm chasing multiple issues with the same symptom.
>>>
>>> The error I'm most concerned with is in the sequence
>>> 1. boot with old image
>>> 2. write environment
>>> 3. boot with new image
>>> 4. write environment
>>> 5. write fails and environment is corrupted
>>>
>>> After I recover the system things sometimes seem fine. Until I repeat 
>>> the sequence above.
>>>
>>>> Also relevant may be:
>>>> - Which dts are you using?
>>> Custom but based heavily on the t2080rdb.
>>>> - What's the spi-nor type, and at which frequency are you operating it?
>>> The board has several alternate parts for the spi-nor so the dts just 
>>> specifies compatible = "jedec,spi-nor" the actual chip detected on 
>>> the board I have is "n25q032a (4096 Kbytes)". The dts sets 
>>> spi-max-frequency = <10000000> I haven't measured the actual 
>>> frequency on the bus.
>>>> - Does the issue still happen if you lower the frequency?
>>> I did play around with the frequency initially but I should probably 
>>> give that another go now that I have a better reproduction method.
>>
>> Playing around with the frequency didn't help.
>>
>> One thing that I've found is that the problem appears to be that I end 
>> up with extra bytes in the RX FIFO. If I add code to drain the RX FIFO 
>> then the system is able to keep accessing the spi-nor (albeit with 
>> some noisy logs).
> 
> I've been staring at spi-fsl-espi.c for while now and I think I've 
> identified a couple of deficiencies that may or may not be related to my 
> issue.
> 
> First I think the 'Transfer done but SPIE_DON isn't set' message can be 
> generated spuriously. In fsl_espi_irq() we read the ESPI_SPIE register. 
> We also write back to it to clear the current events. We re-read it in 
> fsl_espi_cpu_irq() and complain when SPIE_DON is not set. But we can 
> naturally end up in that situation if we're doing a large read. Consider 
> the messages for reading a block of data from a spi-nor chip
> 
>   tx = READ_OP + ADDR
>   rx = data
> 
> We setup the transfer and pump out the tx_buf. The first interrupt goes 
> off and ESPI_SPIE has SPIM_DON and SPIM_RXT set. We empty the rx fifo, 
> clear ESPI_SPIE and wait for the next interrupt. The next interrupt 
> fires and this time we have ESPI_SPIE with just SPIM_RXT set. This 
> continues until we've received all the data and we finish with ESPI_SPIE 
> having only SPIM_RXT set. When we re-read it we complain that SPIE_DON 
> isn't set.
> 
> The other deficiency is that we only get an interrupt when the amount of 
> data in the rx fifo is above FSL_ESPI_RXTHR. If there are fewer than 
> FSL_ESPI_RXTHR left to be received we will never pull them out of the fifo.
> 
SPIM_DON will trigger an interrupt once the last characters have been
transferred, and read the remaining characters from the FIFO.

> I think the reason I'm seeing some variability is because of how fast 
> (or slow) the interrupts get processed and how fast the spi-nor chip can 
> fill the CPUs rx fifo.
> 
To rule out timing issues at high bus frequencies I initially asked
for re-testing at lower frequencies. If you e.g. limit the bus to 1 MHz
or even less, then timing shouldn't be an issue.

Last relevant functional changes have been done almost 4 years ago.
And yours is the first such report I see. So question is what could be so
special with your setup that it seems you're the only one being affected.
The scenarios you describe are standard, therefore much more people
should be affected in case of a driver bug.

You said that kernel config impacts how frequently the issue happens.
Therefore question is what's the diff in kernel config, and how could
the differences be related to SPI.
