Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3332309FF9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 02:25:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTVd473mbzDrCW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 12:25:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTVbB3q1HzDrBs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 12:24:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MAwG8RI0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DTVb70JMzz9t0l;
 Mon,  1 Feb 2021 12:24:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612142646;
 bh=HbIjopcRWZABJVCXfOmM9n/j7wZ9ZlwMD6E6rJz/GAI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MAwG8RI0m7hkGtS7aYwp0jtzAu2nyutyZpfSeTvhwn+/98Tum48hBD8wVqQXXeVRC
 UCEzf2Q+FKT2Ih/kAzGnlREAWut8voKrr3SB3tGD7i1YoLxdkaUAecLzTGuVkh67Cp
 YiZH9gUVi1yQoe1x0lLYWz57sFUVLOtXQEFesQBox681EgliNclHoHr2nLMpLoeQYh
 aGP4Vi+PMYgb47LjbDA5DG6zFylCJK2ylbTbZ/KS5KMTSS9WmJovkv+ZE9D+oUOGtz
 6GPjnbG1Z4sL4zwlQMqyYMIEsEayd+OxidkMWgNodefCr2O/kjL8cIWRUli8wrVPzH
 fyLWc9gcnJxBg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Yury Norov <yury.norov@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc: fix AKEBONO build failures
In-Reply-To: <4572579a-7208-628d-cbe2-b70a74a84ae7@infradead.org>
References: <CAAH8bW8-6Dp29fe6rrnA4eL1vo+mu0HuAVJ-5yjbwxDSvaHdeQ@mail.gmail.com>
 <6c442012-3bef-321b-bbc3-09c54608661f@infradead.org>
 <875z3prcwg.fsf@mpe.ellerman.id.au>
 <4572579a-7208-628d-cbe2-b70a74a84ae7@infradead.org>
Date: Mon, 01 Feb 2021 12:24:01 +1100
Message-ID: <87eei0d1hq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 1/21/21 5:14 PM, Michael Ellerman wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>> On 1/20/21 1:29 PM, Yury Norov wrote:
>>>> Hi all,
>>>>
>>>> I found the power pc build broken on today's
>>>> linux-next (647060f3b592).
>>>
>>> Darn, I was building linux-5.11-rc4.
>>>
>>> I'll try linux-next after I send this.
>>>
>>> ---
>>> From: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Fulfill AKEBONO Kconfig requirements.
>>>
>>> Fixes these Kconfig warnings (and more) and fixes the subsequent
>>> build errors:
>>>
>>> WARNING: unmet direct dependencies detected for NETDEVICES
>>>    Depends on [n]: NET [=n]
>>>    Selected by [y]:
>>>    - AKEBONO [=y] && PPC_47x [=y]
>>>
>>> WARNING: unmet direct dependencies detected for MMC_SDHCI
>>>    Depends on [n]: MMC [=n] && HAS_DMA [=y]
>>>    Selected by [y]:
>>>    - AKEBONO [=y] && PPC_47x [=y]
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: Yury Norov <yury.norov@gmail.com>
>>> ---
>>>   arch/powerpc/platforms/44x/Kconfig |    2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> --- lnx-511-rc4.orig/arch/powerpc/platforms/44x/Kconfig
>>> +++ lnx-511-rc4/arch/powerpc/platforms/44x/Kconfig
>>> @@ -206,6 +206,7 @@ config AKEBONO
>>>   	select PPC4xx_HSTA_MSI
>>>   	select I2C
>>>   	select I2C_IBM_IIC
>>> +	select NET
>>>   	select NETDEVICES
>>>   	select ETHERNET
>>>   	select NET_VENDOR_IBM
>> 
>> I think the problem here is too much use of select, for things that
>> should instead be in the defconfig.
>> 
>> The patch below results in the same result for make
>> 44x/akebono_defconfig. Does it fix the original issue?
>
> Hi Michael,
> Sorry for the delay.
>
> Changing the akebono_defconfig doesn't cause the missing symbols
> to be set -- the defconfig is not being used here.

Yep, but that's OK. None of those selected symbols are hard dependencies
of AKEBONO, they're just things you probably want in your kernel to
actually boot on an akebono board.

> I guess that if you have users who set CONFIG_AKEBONO and expect
> it to build cleanly, you will need something like my patch or the
> patch that Florian just posted.

It will build cleanly, it just won't necessarily boot on a real board.
Users who enable AKEBONO manually need to know what they're doing, or
they should just use the defconfig.

> Changing the akebono_defconfig also would not help 'make randconfig'
> builds to build cleanly if they had happened to enable AKEBONO.

Changing the defconfig doesn't help randconfig, but dropping the selects
does.

Anyway I'll send a proper version of my patch, which I'm pretty
confident will fix all the issues.

cheers
