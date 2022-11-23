Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC66365ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 17:36:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHRbk67W2z3dxG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 03:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fT8osm95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fT8osm95;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHRZh31sJz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 03:35:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3h/VgEw0Wflfm9bqnZb5OvyNPIn+ZE40wg6eS0dcqRM=; b=fT8osm953AWBxu8+52OtN4myCG
	neTJeoJChBklml5lCWyNy25CDFeCueojHw+n+N61xIYLuxt1T0p6PxZVBJjwjMV0ldvrUH2A9OPYR
	itmfGGiLDmlnZXP36gb1owvtUQvHzf7Bhp4BKeaTXV8RUlfIwfnhhKdkNzQb/KSsUKO3ko7L9q+nJ
	z57ddCke4H/HGWjrZM2F76zLg2jda4Ljv9btOrm663EPRkvBCTE7sGeyjzbaVMz4F2QkOJyvsyHfj
	pxSBJRnkJQvI0qSzv+OzdDFYLi0au9aheuskBtF1H6aN58aWr8WzoD5HTnMtiM9Xxtyo+Is5iBpQ2
	DOF4RH5A==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsix-000tzy-65; Wed, 23 Nov 2022 16:35:47 +0000
Message-ID: <fcdb5238-5977-526a-4752-fa82893a580e@infradead.org>
Date: Wed, 23 Nov 2022 08:35:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
References: <20221123031605.16680-1-rdunlap@infradead.org>
 <4b10b87d-f255-4839-8700-858d98ffb801@app.fastmail.com>
 <25c22370-b67a-33a6-f1e6-abf70760d866@infradead.org>
In-Reply-To: <25c22370-b67a-33a6-f1e6-abf70760d866@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/23/22 02:02, Randy Dunlap wrote:
> Hi Arnd,
> 
> On 11/23/22 01:08, Arnd Bergmann wrote:
>> On Wed, Nov 23, 2022, at 04:16, Randy Dunlap wrote:
>>> Fix build when CONFIG_FB_OF=y and CONFIG_DRM_OFDRM=m.
>>> When the latter symbol is =m, kconfig downgrades (limits) the 'select's
>>> under FB_OF to modular (=m). This causes undefined symbol references:
>>>
>>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): 
>>> undefined reference to `cfb_fillrect'
>>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): 
>>> undefined reference to `cfb_copyarea'
>>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): 
>>> undefined reference to `cfb_imageblit'
>>>
>>> Fix this by allowing FB_OF any time that DRM_OFDRM != y so that the
>>> selected FB_CFB_* symbols will become =y instead of =m.
>>>
>>> In tristate logic (for DRM_OFDRM), this changes the dependency from
>>>     !DRM_OFDRM	== 2 - 1 == 1 => modular only (or disabled)
>>> to (boolean)
>>>     DRM_OFDRM != y == y, allowing the 'select's to cause the
>>> FB_CFB_* symbols to =y instead of =m.
>>>
>>
>> Is it actually a useful configuration to have OFDRM=m and
>> FB_OF=y though? I would expect in that case that the OFDRM
>> driver never binds to a device because it's already owned
>> by FB_OF.
>>
>>> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>>> --- a/drivers/video/fbdev/Kconfig
>>> +++ b/drivers/video/fbdev/Kconfig
>>> @@ -455,7 +455,7 @@ config FB_ATARI
>>>  config FB_OF
>>>  	bool "Open Firmware frame buffer device support"
>>>  	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
>>> -	depends on !DRM_OFDRM
>>> +	depends on DRM_OFDRM != y
>>>  	select APERTURE_HELPERS
>>
>> I would instead make this 'depends on DRM_OFDRM=n', which
>> completely eliminates configs that have both driver enabled.
> 
> Yep, that works for me. Thanks.
> 
> Thomas, Michal, are you OK with that change?
> 
>> A nicer change would be to make FB_OF a tristate symbol,
>> which makes it possible to load one of the two modules if
>> both are enabled =m, while only allowing one of them to
>> be =y if the other is completely disabled. It looks like
>> offb was originally written to be usable as a loadable module,
>> but Kconfig has prevented this since at least the start of
>> the git history.

ISTM that a distro would prefer to have both DFM_OFDRM and
FB_OF as tristate symbols that could both be built as loadable
modules, as Arnd describes above.
I'll look into that.

-- 
~Randy
