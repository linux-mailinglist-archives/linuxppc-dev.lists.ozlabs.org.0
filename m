Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A92570C4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 23:42:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bfmys6jKvzDqDm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 07:42:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u71Dr6TY; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfmxG18jSzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 07:41:20 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id l63so3680908edl.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 14:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=flkqAUAGSpmzpt/BTyP/u7Uv4MTDnK9nGy4kWyS0QGo=;
 b=u71Dr6TY0sD/uSIJYQEuGVHJCQGYmaY0GU+G58XVwH8WR64ZTGNn1UEmJbohP5d92q
 u1PBtJK0dC8tuCvqztGjmwS/zYAL+p3ekXU0PkvQltj/tmyZP176jAyHONR0hNqtV2kq
 4SG0WjG6NLcxcggj6DPd9adsbtSkj6hxkYcBG1C5moP1LvPDQBRV773a8TZCdTBCAw+c
 Gp2MVg5+4lvwPk9SCgCyju7FcgWi2zQLlTNz7ghIB9cg1ZSsy7nDejP6cEKCHRPRosug
 QqJ9UVNrac+OBO4Cs1F/EqOoqqMPc7A8qLgzd4DR+TYh3UgdxkZeOmpKEG9Ttzlf0Py6
 l/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=flkqAUAGSpmzpt/BTyP/u7Uv4MTDnK9nGy4kWyS0QGo=;
 b=KQtX58x/2I7ZTd+gNYcyjt9nLRbDvb48YtzNyulf5OZhJ95WKVSUiV9Z/IpCdv07Ns
 QFuF53teioT1QFlUTCp4t4jKdY4hTa/AHs2HPnu5cU9mqictg4vXTKZbnkLT+zUs1tvT
 ohzd3JQdLranyUW0sQ1frRUtWOERksSWJAmA5aqPsrki41fTWrwBSSTWHjsNETLQpLeO
 /QltAlTMrzVJ+P8CcoS0b/k2PC0v43vwOicKwQS6RE7Wj3B2U9Y/7wpQEPUzs74ZMdZV
 tT1sHXagro7Th5N9mLqaa5+I4/mq3wGPQI9/s0VQORzugs02BtQOzGVelniEyRbLlGws
 x25g==
X-Gm-Message-State: AOAM533FkRWyP76UhRNwh1VdxSMhS3u/lDYqv/NfBU2caZGZTsbW0Il3
 zCpDCRHdoJlqLIx6APYRzAA=
X-Google-Smtp-Source: ABdhPJz3o5Zk2bTMguju6wk5PKk2UphvYY9jIjAZMA4V/FqbZruJ7mdUtaopyePbbsOAmnHOuioFCQ==
X-Received: by 2002:a50:f197:: with SMTP id x23mr5560626edl.367.1598823674095; 
 Sun, 30 Aug 2020 14:41:14 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f23:5700:b849:b64c:7fd2:8e54?
 (p200300ea8f235700b849b64c7fd28e54.dip0.t-ipconnect.de.
 [2003:ea:8f23:5700:b849:b64c:7fd2:8e54])
 by smtp.googlemail.com with ESMTPSA id n15sm5671590eja.26.2020.08.30.14.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 14:41:13 -0700 (PDT)
Subject: Re: fsl_espi errors on v5.7.15
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Nicholas Piggin <npiggin@gmail.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "paulus@samba.org" <paulus@samba.org>
References: <42107721-614b-96e8-68d9-4b888206562e@alliedtelesis.co.nz>
 <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
 <1598510348.1g7wt0s02s.astroid@bobo.none>
 <0068446e-06f8-6648-2f40-56f324c1ee6e@alliedtelesis.co.nz>
 <1598788275.m90vz24p6x.astroid@bobo.none>
 <524a0f50-f954-f5a7-eccb-66eece59c7c4@alliedtelesis.co.nz>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <5ca7ba48-ef9c-2b7c-67ff-88d0a2c9f380@gmail.com>
Date: Sun, 30 Aug 2020 23:41:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <524a0f50-f954-f5a7-eccb-66eece59c7c4@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 30.08.2020 23:00, Chris Packham wrote:
> 
> On 31/08/20 12:30 am, Nicholas Piggin wrote:
>> Excerpts from Chris Packham's message of August 28, 2020 8:07 am:
> 
> <snip>
> 
>>>>>>> I've also now seen the RX FIFO not empty error on the T2080RDB
>>>>>>>
>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>>
>>>>>>> With my current workaround of emptying the RX FIFO. It seems
>>>>>>> survivable. Interestingly it only ever seems to be 1 extra byte in the
>>>>>>> RX FIFO and it seems to be after either a READ_SR or a READ_FSR.
>>>>>>>
>>>>>>> fsl_espi ffe110000.spi: tx 70
>>>>>>> fsl_espi ffe110000.spi: rx 03
>>>>>>> fsl_espi ffe110000.spi: Extra RX 00
>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>> fsl_espi ffe110000.spi: tx 05
>>>>>>> fsl_espi ffe110000.spi: rx 00
>>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>>> fsl_espi ffe110000.spi: Transfer done but SPIE_DON isn't set!
>>>>>>> fsl_espi ffe110000.spi: Transfer done but rx/tx fifo's aren't empty!
>>>>>>> fsl_espi ffe110000.spi: SPIE_RXCNT = 1, SPIE_TXCNT = 32
>>>>>>> fsl_espi ffe110000.spi: tx 05
>>>>>>> fsl_espi ffe110000.spi: rx 00
>>>>>>> fsl_espi ffe110000.spi: Extra RX 03
>>>>>>>
>>>>>>>   From all the Micron SPI-NOR datasheets I've got access to it is
>>>>>>> possible to continually read the SR/FSR. But I've no idea why it
>>>>>>> happens some times and not others.
>>>>>> So I think I've got a reproduction and I think I've bisected the problem
>>>>>> to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in
>>>>>> C"). My day is just finishing now so I haven't applied too much scrutiny
>>>>>> to this result. Given the various rabbit holes I've been down on this
>>>>>> issue already I'd take this information with a good degree of skepticism.
>>>>>>
>>>>> OK, so an easy test should be to re-test with a 5.4 kernel.
>>>>> It doesn't have yet the change you're referring to, and the fsl-espi driver
>>>>> is basically the same as in 5.7 (just two small changes in 5.7).
>>>> There's 6cc0c16d82f88 and maybe also other interrupt related patches
>>>> around this time that could affect book E, so it's good if that exact
>>>> patch is confirmed.
>>> My confirmation is basically that I can induce the issue in a 5.4 kernel
>>> by cherry-picking 3282a3da25bd. I'm also able to "fix" the issue in
>>> 5.9-rc2 by reverting that one commit.
>>>
>>> I both cases it's not exactly a clean cherry-pick/revert so I also
>>> confirmed the bisection result by building at 3282a3da25bd (which sees
>>> the issue) and the commit just before (which does not).
>> Thanks for testing, that confirms it well.
>>
>> [snip patch]
>>
>>> I still saw the issue with this change applied. PPC_IRQ_SOFT_MASK_DEBUG
>>> didn't report anything (either with or without the change above).
>> Okay, it was a bit of a shot in the dark. I still can't see what
>> else has changed.
>>
>> What would cause this, a lost interrupt? A spurious interrupt? Or
>> higher interrupt latency?
>>
>> I don't think the patch should cause significantly worse latency,
>> (it's supposed to be a bit better if anything because it doesn't set
>> up the full interrupt frame). But it's possible.
> 
> My working theory is that the SPI_DON indication is all about the TX 
> direction an now that the interrupts are faster we're hitting an error 
> because there is still RX activity going on. Heiner disagrees with my 
> interpretation of the SPI_DON indication and the fact that it doesn't 
> happen every time does throw doubt on it.
> 
It's right that the eSPI spec can be interpreted that SPI_DON refers to
TX only. However this wouldn't really make sense, because also for RX
we program the frame length, and therefore want to be notified once the
full frame was received. Also practical experience shows that SPI_DON
is set also after RX-only transfers.
Typical SPI NOR use case is that you write read command + start address,
followed by a longer read. If the TX-only interpretation would be right,
we'd always end up with SPI_DON not being set.

> I can't really explain the extra RX byte in the fifo. We know how many 
> bytes to expect and we pull that many from the fifo so it's not as if 
> we're missing an interrupt causing us to skip the last byte. I've been 
> looking for some kind of off-by-one calculation but again if it were 
> something like that it'd happen all the time.
> 
Maybe it helps to know what value this extra byte in the FIFO has. Is it:
- a duplicate of the last read byte
- or the next byte (at <end address> + 1)
- or a fixed value, e.g. always 0x00 or 0xff


