Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1F631039
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 19:17:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NF21B2BLMz3f2y
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 05:17:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ofg3H2a5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NF2093QTLz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 05:16:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=9SwaJ6NSFdZ58ryO0pMVgvtwB1SnIYyFPiRf+VeDF1c=; b=ofg3H2a5hOPaZVIpRY+uNvR/zm
	0Q3JwCs8MbvIRMsTh80pp0BGQCYOKf9heh0vOl7W/x2MBJahU+dnEKf/OM/DXFUHL6N5JSVb6Zl6i
	LYrbqqy1NnQjE+yWlxDDWFEzuc3z0r2swVtQJ2jqcVeX8qachIFwJEeppFFfEqzeVvELFbDM+5qE3
	0Kx3t91b9oX99gs7GTF9pGMjRtMeHIKvzonZkxTcGwl9Tx8H4YDvNcqfuzn4gUJS3FxpUomoLtpCP
	2vvq1kUoF8rZFnHs/fe6eEgtmMu+BDqEafI1JDDK7z/1rmxSjRx34TyJAK3spSOjqsvPBtt3ziYFe
	7AEvqy6g==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owSNg-00FqGS-Ts; Sat, 19 Nov 2022 18:15:57 +0000
Message-ID: <ff3a1ee2-3439-d79c-aa59-5bccec99bf3e@infradead.org>
Date: Sat, 19 Nov 2022 10:15:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: build failure in linux-next: offb missing fb helpers
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20221118150351.GV28810@kitsune.suse.cz>
 <b8191c01-4d78-537b-9650-a783e14e5997@infradead.org>
 <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
 <20221119153729.GX28810@kitsune.suse.cz>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221119153729.GX28810@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 11/19/22 07:37, Michal Suchánek wrote:
> Hello,
> 
> On Sat, Nov 19, 2022 at 10:27:04PM +0900, Masahiro Yamada wrote:
>> On Sat, Nov 19, 2022 at 3:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Hi--
>>>
>>> [adding Masahiro-san]
>>>
>>>
>>> On 11/18/22 07:03, Michal Suchánek wrote:
>>>> Hello,
>>>>
>>>> I am seeing these errors:
>>>>
>>>> [ 3825s]   AR      built-in.a
>>>> [ 3827s]   AR      vmlinux.a
>>>> [ 3835s]   LD      vmlinux.o
>>>> [ 3835s]   OBJCOPY modules.builtin.modinfo
>>>> [ 3835s]   GEN     modules.builtin
>>>> [ 3835s]   GEN     .vmlinux.objs
>>>> [ 3848s]   MODPOST Module.symvers
>>>> [ 3848s]   CC      .vmlinux.export.o
>>>> [ 3849s]   UPD     include/generated/utsversion.h
>>>> [ 3849s]   CC      init/version-timestamp.o
>>>> [ 3849s]   LD      .tmp_vmlinux.btf
>>>> [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined
>>>> reference to `cfb_fillrect'
>>>> [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined
>>>> reference to `cfb_copyarea'
>>>> [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined
>>>> reference to `cfb_imageblit'
>>>>
>>>> cfb_fillrect is provided by drivers/video/fbdev/core/cfbfillrect.c
>>>>
>>>> It is compiled when CONFIG_FB_CFB_FILLRECT
>>>> drivers/video/fbdev/core/Makefile:obj-$(CONFIG_FB_CFB_FILLRECT)  += cfbfillrect.o
>>>>
>>>> drivers/video/fbdev/Makefile:obj-$(CONFIG_FB_OF)               += offb.o
>>>> is compiled when CONFIG_FB_OF
>>>>
>>>> It selects CONFIG_FB_CFB_FILLRECT
>>>> config FB_OF
>>>>         bool "Open Firmware frame buffer device support"
>>>>         depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
>>>>         select APERTURE_HELPERS
>>>>         select FB_CFB_FILLRECT
>>>>         select FB_CFB_COPYAREA
>>>>         select FB_CFB_IMAGEBLIT
>>>>         select FB_MACMODES
>>>>
>>>> The config has FB_OF built-in and FB_CFB_FILLRECT modular
>>>> config/ppc64le/vanilla:CONFIG_FB_CFB_FILLRECT=m
>>>> config/ppc64le/vanilla:CONFIG_FB_CFB_COPYAREA=m
>>>> config/ppc64le/vanilla:CONFIG_FB_CFB_IMAGEBLIT=m
>>>> config/ppc64le/vanilla:CONFIG_FB_OF=y
>>>>
>>>> It only depends on FB which mut be built-in for FB_OF
>>>> config FB_CFB_FILLRECT
>>>>         tristate
>>>>         depends on FB
>>>>
>>>> Is select in kconfig broken?
>>>>
>>>> Attachnig the config in question.
>>>
>>> The symbol info from xconfig says:
>>>
>>> Symbol: FB_CFB_FILLRECT [=m]
>>> Type : tristate
>>> Defined at drivers/video/fbdev/Kconfig:69
>>> Depends on: HAS_IOMEM [=y] && FB [=y]
>>> Selected by [m]:
>>> [deleted]
>>> - FB_OF [=y] && HAS_IOMEM [=y] && FB [=y]=y && PPC [=y] && (!PPC_PSERIES [=y] || PCI [=y]) && !DRM_OFDRM [=m]
>>>
>>> I don't see why the 'select' from (bool) FB_OF would leave FB_CFB_FILLRECT (and the others)
>>> as =m instead of =y.
>>>
>>> Hopefully Masahiro can shed some light on this.
>>>
>>> --
>>> ~Randy
>>
>>
>> The reason is shown in your paste of help message:
>>
>> "&& !DRM_OFDRM [=m]" downgrades it to "selected by m"
>>
>> To aid this particular case, the following will select
>> FB_CFB_FILLRECT=y.
>>
>>

Thanks again for your help.

>>
>>
>> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> index 66f36b69e8f3..2bcf8627819f 100644
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -458,7 +458,7 @@ config FB_ATARI
>>  config FB_OF
>>         bool "Open Firmware frame buffer device support"
>>         depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
>> -       depends on !DRM_OFDRM
>> +       depends on DRM_OFDRM != y
>>         select APERTURE_HELPERS
>>         select FB_CFB_FILLRECT
>>         select FB_CFB_COPYAREA
> 
> Thanks for clarification.
> 
> This change fixess the config for me.


Thomas, is this change to DRM_OFDRM under FB_OF acceptable to you?


>> Or, perhaps "depends on DRM_OFDRM = n"
>> I do not know the intention of this dependency.
>>
>> Recommendation is to use "depends on" instead of "select" though.
>>
>>
>>
>> BTW, this is similar to what you asked before.
>>
>> https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/
>>
>>
>> I tried to fix it in the past, but the issue was not as shallow as I
>> had expected.
>> I did not get around to revisiting this topic.
>>
>> https://patchwork.kernel.org/project/linux-kbuild/patch/1543216969-2227-1-git-send-email-yamada.masahiro@socionext.com/
>>

-- 
~Randy
