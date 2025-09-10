Return-Path: <linuxppc-dev+bounces-12011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BAB521A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 22:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMX365yNWz3dTl;
	Thu, 11 Sep 2025 06:14:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757535266;
	cv=none; b=aY5pdCsuDcDAJb7LLUS1nhoTv/0LQi/PCmqka6Uxejm5mxGn/dT3Ylz2LmnF3N4n5oDCcqZGNW9huMhTk6merBpiV9qfIw4R4ca+JBeldiL7uagMLIjmwA5zfia5RBnXn/zy0OMDczRTJZl4EsDuM7Optut8Nx2Z51v0s6DAJjgnGvdGFKKs9AuAdcM6+NWchiG98vgjPRGlDFnJJBzWx0MEPJfjRvBGHGd/xDOwZE4VF4IK7uPHkFpt37C3Hwy2iOCUmSPcx4Wvta3vht/kei5uGlbObFyeOqBghu3ZfxOUlYj7McqnTV3zqa/p8rFC2Kscn5quaPavLi4XKz+FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757535266; c=relaxed/relaxed;
	bh=GXF7x2qoy3czLvIOjFMmD+rmJp5AFcm/Kbw9JoK2fLs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Oh55l5lyA+Mx+g+Olnbbm97CeGMJmmPWmb+qlZwSHD2LZqH1qQ/I7YLrnC9fvzGZJFKdDwoB4Ne+DAlJhYNIkbYG+PUbdEplhnxHWNmiqNDTUjS3PLPTNvSU1KuEGwhRvGoP1eP7kOveCU4rzop0CWFbX3F9W3Aol/EBexyzHpIdna2cuVv3YcPVTy9lGFg+mxSKnBG8/qClKmRY5iaWX0ms4ZgTx4DkfaJ7MK+iZUNcrTm/gLyBCeg13XoXEER+dH6yqqoSehpcApyaBV67Tkum6YJCfX8GQyBazhdYQ8P35TuAvTjR5ss+i42AX//z5xa6i+HcDbYQ+lTIFCk58w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=M8+F8L09; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FKNKc4wN; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=M8+F8L09;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FKNKc4wN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMX334XV8z2ysc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 06:14:22 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 748BF140030F;
	Wed, 10 Sep 2025 16:14:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 10 Sep 2025 16:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757535258;
	 x=1757621658; bh=GXF7x2qoy3czLvIOjFMmD+rmJp5AFcm/Kbw9JoK2fLs=; b=
	M8+F8L099AJyPyCGSXuCUwtpgl/qnyTEmyUaWaPChaUvAJf8xJkNy/RGMM4oZgVb
	NtxZl6TfmF/1JD6tlTIzFyMM4gvROt1a/83i7w4bfu11tUplE2bCkUC3ikBHIM4P
	0A9KIYcWKrPl34sF+xCSnLHgetbSGiLpLkvgHhAhXoov0w7rZYCLx31jhdAz3uFX
	9IL146/g22+Xcn/7mGr615q4mvJ8HyMIq5G+Y1La6kS6j44t9zPd1nMRHr29/i+Y
	yH6d3n1iOcPB8I35PWOWY0vA0MZbk+ykTGrLFn4CFvjdJUetrk+Iq61sOjbi5qTx
	PBl7vvwTSrhdzra7Tt9udw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757535258; x=
	1757621658; bh=GXF7x2qoy3czLvIOjFMmD+rmJp5AFcm/Kbw9JoK2fLs=; b=F
	KNKc4wNgA5loqf6LV0WHtli38pAdZffC9Jij5iRBlK4dBEJ6JrMgr8UBIUOR+pi8
	mB10GPuKFdWEjfp42pA23tDWPvdUQE+blqd9i5Y/Gs605lxwszuOGlyAmz826C8u
	PiwrxL/IDuQkIHXnK7eyvYngiWl11xrLLYwAmZ1dqnCTFcceVEKoITIPC9TLfLOU
	mWWOfV0rfJnDfBTjHtlulTWg6qdbODbEaf8N1tNP9YXmmExVErSqRcayxxvJXS3K
	e4DWL0yqLqF/W/tgNZl3AASDHhg5LWSaqZhm/JQAUCbUSqE+zTIk4J7bcQkTeeXj
	/chn7JX8HwGYdVvKXmBdA==
X-ME-Sender: <xms:GdzBaFS8KVzK6c7JHeBns-eQqNRS-849NL9YPXWRKPurirEN5evTcg>
    <xme:GdzBaOzDXnq2-LzZR7T9s-oO01GLP0-FWPqiWfsgnp6keJQxFXT7z87kXjYkj_HI_
    jcGsMGxiZsHGVn7RKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeehkeejgffhtdejgfdugfdvjeelteehkefggfetvdeiteettddugeefledtkedtheen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgrsggrtghordgtohhmpdigvghsqdhinh
    gtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhho
    uhhprdgvuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtph
    htthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrugguhies
    lhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslh
    hishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:GdzBaJC2ytHz0DzJNpj4byDjsb3V887azBYjKLGukKojsSNARWrghQ>
    <xmx:GdzBaLXvyedRsWJVKyzP9FCsvnrIey4hjXlpppWnUJxFe2RowPL42w>
    <xmx:GdzBaNoNgWEbQK5mNb9znZfv9aTHtBkv60WugzS6wID3MmjhGaNm-A>
    <xmx:GdzBaHQdN7vxQtAM0AA24VACjmKQ-DWEZ4s2S6lgx7DC2bonY9AqrQ>
    <xmx:GtzBaD3fRQQZI7AU_FByE0fFvtY0-g_8JxmVEo-ZoqwR4T0e10thx0im>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 31F11700069; Wed, 10 Sep 2025 16:14:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ASLq8PfgjFLg
Date: Wed, 10 Sep 2025 22:13:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Message-Id: <591bf41e-fe87-49b3-9a45-ce0dff1b8fba@app.fastmail.com>
In-Reply-To: 
 <28d908b95fe358129db18f69b30891788e15ada0.1757512010.git.christophe.leroy@csgroup.eu>
References: 
 <28d908b95fe358129db18f69b30891788e15ada0.1757512010.git.christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH] powerpc: Remove CONFIG_HIGHMEM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025, at 15:47, Christophe Leroy wrote:
> There are some discussion around to opportunity to get rid of
> CONFIG_HIGHMEM, see [1]. This RFC is a tentative to remove it
> from powerpc so that people can experiment what it would
> look like and what would be the outcomes.
>
> CONFIG_HIGHMEM is being depracated, remove it.
>
> To accomodate boards with up to 1Gbytes RAM, PAGE_OFFSET and
> TASK_SIZE is adjusted to 0xb0000000 (a0000000 on book3s/32 with modules).
>
> If you have more than 1Gbytes of RAM you can adjust CONFIG_LOWMEM_SIZE.
>
> [1] 
> https://lore.kernel.org/all/4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com/
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for going through this, even if we keep partial highmem
support alive a little longer, it's good to know what the pieces
are that would go away. I think the majority of these already
removes stuff that no longer has any function, but there are
obviously a couple of machines that use highmem today, even
after changing the LOWMEM_SIZE setting.

I took a closer look at the ones that had CONFIG_HIGHMEM set
in the defconfig (I tried to look earlier for powerpc boards
but didn't have the idea to check the config) and found a
handful of machines that were able to use 2GB on MPC8572E,
MPC8640D or QorIQ P20xx, as well as two that have 4GB.

As with the Arm boards, the 2GB configurations may work
by further changing the LOWMEM_SIZE etc, but this has
a higher risk of breaking either drivers or applications.

The 4GB configs are obviously more problematic, no LOWMEM_SIZE
setting can give back the memory lost from disabling highmem.
Two options we are discussing for those are either leaving
highmem only as zram backing store long-term, or leaving it
for page cache only.

There is also a related setting:

config PHYS_64BIT
        bool 'Large physical address support' if PPC_E500 || PPC_86xx
        depends on (44x || PPC_E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
        select PHYS_ADDR_T_64BIT

This is currently enabled in 85xx-32bit.config, and probably
required specifically for the boards that have 4GB of RAM,
as the PCI MMIO space starts at physical address 0x80000000 (2GB)
on the qoriq and mpc8641 boards.

The PHYS_64BIT option itself should probably use
'depends on HIGHMEM'.

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 93402a1d9c9f..fec1db5fcb97 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -482,11 +482,6 @@ source "arch/powerpc/platforms/Kconfig"
> 
>  menu "Kernel options"
> 
> -config HIGHMEM
> -	bool "High memory support"
> -	depends on PPC32
> -	select KMAP_LOCAL
> -

This could stay guarded by 'depends on EXPERT' in that case.

> @@ -1193,7 +1188,7 @@ config LOWMEM_SIZE_BOOL
> 
>  config LOWMEM_SIZE
>  	hex "Maximum low memory size (in bytes)" if LOWMEM_SIZE_BOOL
> -	default "0x30000000"
> +	default "0x40000000"
> 
>  config LOWMEM_CAM_NUM_BOOL
>  	bool "Set number of CAMs to use to map low memory"
> @@ -1245,7 +1240,7 @@ config PAGE_OFFSET_BOOL
> 
>  config PAGE_OFFSET
>  	hex "Virtual address of memory base" if PAGE_OFFSET_BOOL
> -	default "0xc0000000"
> +	default "0xb0000000"
> 
>  config KERNEL_START_BOOL
>  	bool "Set custom kernel base address"
>
> @@ -1298,8 +1293,8 @@ config TASK_SIZE_BOOL
>  config TASK_SIZE
>  	hex "Size of user task space" if TASK_SIZE_BOOL
>  	default "0x80000000" if PPC_8xx
> -	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
> -	default "0xc0000000"
> +	default "0xa0000000" if PPC_BOOK3S_32 && EXECMEM
> +	default "0xb0000000"
> 
>  config MODULES_SIZE_BOOL
>  	bool "Set custom size for modules/execmem area"

These all look good to me, as I suggested we should do the
same thing on arm and x86 using CONFIG_VMSPLIT_3G_OPT
as the default.

> diff --git a/arch/powerpc/configs/85xx-32bit.config 
> b/arch/powerpc/configs/85xx-32bit.config
> index a85310bcb1fd..f96db0bc888f 100644
> --- a/arch/powerpc/configs/85xx-32bit.config
> +++ b/arch/powerpc/configs/85xx-32bit.config
> @@ -1,5 +1,4 @@
>  CONFIG_PPC64=n
> -CONFIG_HIGHMEM=y
>  CONFIG_KEXEC=y
>  CONFIG_PPC_85xx=y
>  CONFIG_PROC_KCORE=y

I know the nic.cz Turris has a P2020 CPU and 2GB.

> diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig 
> b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> index 7beb36a41d45..da9f649107dc 100644
> --- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> +++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> @@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_GE_IMP3A=y
>  CONFIG_QE_GPIO=y
>  CONFIG_CPM2=y
> -CONFIG_HIGHMEM=y
>  CONFIG_HZ_1000=y
>  CONFIG_PREEMPT=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set

I see that IMP3A has 4GB of DDR3 memory, so  this one
clearly depends on HIGHMEM for actual users if any remain.

https://abaco.com/products/powerpact3-imp3a/p3516 shows
it has "entered a Restricted Production Phase (RPP) on August
28, 2020", which was roughly when NXP discontinued the
QORIQ P2 CPU, and 10 years after it was first introduced.

This was targeted at the military and aerospace markets,
so there is a good chance that some are still in use, but
I have no idea whether any of the users are planning to
update the kernels.

> diff --git a/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig 
> b/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
> index 488d03ae6d6c..10764fad2eb9 100644
> --- a/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
> +++ b/arch/powerpc/configs/85xx/xes_mpc85xx_defconfig
> @@ -18,7 +18,6 @@ CONFIG_MODVERSIONS=y
>  # CONFIG_BLK_DEV_BSG is not set
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_XES_MPC85xx=y
> -CONFIG_HIGHMEM=y
>  CONFIG_MATH_EMULATION=y
>  CONFIG_PCI=y
>  CONFIG_PCIEPORTBUS=y

Same here: 2-4GB DDR3, sold 2009-2018
https://www.xes-inc.com/products/end-of-life-sbcs/xcalibur1501/

> diff --git a/arch/powerpc/configs/chrp32_defconfig 
> b/arch/powerpc/configs/chrp32_defconfig
> index b799c95480ae..304de18b51f8 100644
> --- a/arch/powerpc/configs/chrp32_defconfig
> +++ b/arch/powerpc/configs/chrp32_defconfig
> @@ -17,7 +17,6 @@ CONFIG_PARTITION_ADVANCED=y
>  CONFIG_MAC_PARTITION=y
>  # CONFIG_PPC_PMAC is not set
>  CONFIG_GEN_RTC=y
> -CONFIG_HIGHMEM=y
>  CONFIG_BINFMT_MISC=y
>  CONFIG_IRQ_ALL_CPUS=y
>  CONFIG_ISA=y

Apparently the Pegasos-II could support 2GB if you had the right
board revision and memory.

> diff --git a/arch/powerpc/configs/mpc86xx_base.config 
> b/arch/powerpc/configs/mpc86xx_base.config
> index 632c014b122d..a1ca1f7da240 100644
> --- a/arch/powerpc/configs/mpc86xx_base.config
> +++ b/arch/powerpc/configs/mpc86xx_base.config
> @@ -3,6 +3,5 @@ CONFIG_GEF_PPC9A=y
>  CONFIG_GEF_SBC310=y
>  CONFIG_GEF_SBC610=y
>  CONFIG_MVME7100=y
> -CONFIG_HIGHMEM=y
>  CONFIG_KEXEC=y
>  CONFIG_PROC_KCORE=y

There are four 8640 based boards enabled here, three of them
support 2GB RAM. Apparently the MVME7100 still has "limited
availablilty, the others were discontinued in 2018 or before.

> diff --git a/arch/powerpc/configs/pmac32_defconfig 
> b/arch/powerpc/configs/pmac32_defconfig
> index ae45f70b29f0..24e73489947a 100644
> --- a/arch/powerpc/configs/pmac32_defconfig
> +++ b/arch/powerpc/configs/pmac32_defconfig
> @@ -20,7 +20,6 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>  CONFIG_CPU_FREQ_GOV_USERSPACE=y
>  CONFIG_CPU_FREQ_PMAC=y
>  CONFIG_GEN_RTC=y
> -CONFIG_HIGHMEM=y
>  CONFIG_BINFMT_MISC=m
>  CONFIG_HIBERNATION=y
>  CONFIG_PM_DEBUG=y

A couple of G4 Macs could be upgraded to 2GB.

> diff --git a/arch/powerpc/configs/ppc6xx_defconfig 
> b/arch/powerpc/configs/ppc6xx_defconfig
> index bb359643ddc1..75b44ce12332 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -60,7 +60,6 @@ CONFIG_TAU=y
>  CONFIG_TAU_AVERAGE=y
>  CONFIG_QE_GPIO=y
>  CONFIG_MCU_MPC8349EMITX=y
> -CONFIG_HIGHMEM=y
>  CONFIG_HZ_1000=y
>  CONFIG_PREEMPT_VOLUNTARY=y
>  CONFIG_BINFMT_MISC=y

This includes the mpc86xx boards from mpc86xx_base config.

> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index d79c5d1098c0..7489557f582a 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -20,7 +20,6 @@
>  #include <linux/gfp.h>
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
> -#include <linux/highmem.h>
> 
>  #include <asm/reg.h>
>  #include <asm/cputable.h>

Right, all the linux/highmem.h inclusions are probably unnecessary
regardless.

> diff --git a/arch/powerpc/platforms/ps3/system-bus.c 
> b/arch/powerpc/platforms/ps3/system-bus.c
> index afbaabf182d0..1f20311ed0c9 100644
> --- a/arch/powerpc/platforms/ps3/system-bus.c
> +++ b/arch/powerpc/platforms/ps3/system-bus.c
> @@ -510,7 +510,7 @@ static void * ps3_alloc_coherent(struct device 
> *_dev, size_t size,
>  	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
>  	unsigned long virt_addr;
> 
> -	flag &= ~(__GFP_DMA | __GFP_HIGHMEM);
> +	flag &= ~__GFP_DMA;
>  	flag |= __GFP_ZERO;
> 
>  	virt_addr = __get_free_pages(flag, get_order(size));

This should never have used __GFP_HIGHMEM since it does not support
32-bit kernels.

    Arnd

