Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D939774A35
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 22:22:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eduiIUgU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL4Nb0zP4z3072
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 06:22:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eduiIUgU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL4Mb3BRnz300C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 06:21:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xpePVXeQNXOwLWaU9wf9C/8pVneZm1c8NDnPJCUKzFw=; b=eduiIUgUs5/7Ec8/1O7cF0J1tM
	JDn1/tSRzCcPYolkzUtYYDHqQAkL05HIa/DmfTibo8C+k7+gugQtY5MDWw1brcyKgeZ04+8VD/vM2
	jC/C5czbhZp8wjrrTN8QsdUlGTB76D4oFAsZU58ln8hvUy8D1ij9uKTpyLuBBT4T1AWetqXkBE6XB
	IaIKnkzsAnvhRRW4Pc4rkec3XyXTr2T6Fel9s7c5gIyMVmr06UhfRoZ43H5tSxs3uN8KIbmivmfL2
	W1ztVUx0l4ihcWlu2ih3wmtHv6gicPqnueZodF1WvoyVDz0j9MDno+XnO0oUbVq6Xj7izCIOqO8uF
	CyhV9ciw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTTCL-003Omv-2C;
	Tue, 08 Aug 2023 20:20:57 +0000
Message-ID: <8599e99b-ad80-abf8-ad40-4cb8262f047a@infradead.org>
Date: Tue, 8 Aug 2023 13:20:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] powerpc: Use shared font data
Content-Language: en-US
To: "Dr. David Alan Gilbert" <linux@treblig.org>
References: <20230807010721.799613-1-linux@treblig.org>
 <828497a6-80c2-329f-8b47-2311bf08943d@infradead.org>
 <ZNJ7QzfA/GSgahmf@gallifrey>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZNJ7QzfA/GSgahmf@gallifrey>
Content-Type: text/plain; charset=UTF-8
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
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/8/23 10:28, Dr. David Alan Gilbert wrote:
> * Randy Dunlap (rdunlap@infradead.org) wrote:
>> Hi--
>>
>> On 8/6/23 18:07, linux@treblig.org wrote:
>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>>
>>> PowerPC has a 'btext' font used for the console which is almost identical
>>> to the shared font_sun8x16, so use it rather than duplicating the data.
>>>
>>> They were actually identical until about a decade ago when
>>>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>>>                         "broken bar" to "vertical line"")
>>>
>>> which changed the | in the shared font to be a solid
>>> bar rather than a broken bar.  That's the only difference.
>>>
>>> This was originally spotted by PMD which noticed that sparc does
>>> the same thing with the same data, and they also share a bunch
>>> of functions to manipulate the data.  I've previously posted a near
>>> identical patch for sparc.
>>>
>>> One difference I notice in PowerPC is that there are a bunch of compile
>>> options for the .c files for the early code to avoid a bunch of security
>>> compilation features;  it's not clear to me if this is a problem for
>>> this font data.
>>>
>>> Tested very lightly with a boot without FS in qemu.
>>>
>>> v2
>>>   Added 'select FONT_SUPPORT' (to stop modconfig causing the font to be
>>>    linked into a module rather than the main kernel)
>>>   Added 'select FONTS' to satisfy requirements in lib/fonts
>>>
>>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>>> ---
>>>  arch/powerpc/Kconfig.debug  |   3 +
>>>  arch/powerpc/kernel/btext.c | 360 +-----------------------------------
>>>  2 files changed, 9 insertions(+), 354 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
>>> index 2a54fadbeaf51..521c4baf30e88 100644
>>> --- a/arch/powerpc/Kconfig.debug
>>> +++ b/arch/powerpc/Kconfig.debug
>>> @@ -147,6 +147,9 @@ config BDI_SWITCH
>>>  config BOOTX_TEXT
>>>  	bool "Support for early boot text console (BootX or OpenFirmware only)"
>>>  	depends on PPC_BOOK3S
>>> +	select FONT_SUN8x16
>>> +	select FONT_SUPPORT
>>> +	select FONTS
>>>  	help
>>>  	  Say Y here to see progress messages from the boot firmware in text
>>>  	  mode. Requires either BootX or Open Firmware.
>>
>> kconfig tells me:
>>
>> WARNING: unmet direct dependencies detected for FONTS
>>   Depends on [n]: FONT_SUPPORT [=y] && (FRAMEBUFFER_CONSOLE [=n] || STI_CONSOLE [=n])
>>   Selected by [y]:
>>   - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]
>>
>> WARNING: unmet direct dependencies detected for FONT_SUN8x16
>>   Depends on [n]: FONT_SUPPORT [=y] && FRAMEBUFFER_CONSOLE [=n] && (!SPARC && FONTS [=y] || SPARC)
>>   Selected by [y]:
>>   - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]
>>
>> because FONTS depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE and neither of those is set.
> 
> I'm not getting the warnings in the v2, with a few configs; what command
> are using?
> 

My 'make' build target is either pp32_randconfig or ppc64_randconfig.
I see kconfig warnings in > 50% of the randconfigs. (small sample size,
around 20)


> I'm tempted to change the FONT_SUN8x16 dependency line to have
> SPARC||BOOTX_TEXT or SPARC||POWERPC  and drop the 'select FONTS' I
> added.
> 
> Dave
> 
>>
>> -- 
>> ~Randy

-- 
~Randy
