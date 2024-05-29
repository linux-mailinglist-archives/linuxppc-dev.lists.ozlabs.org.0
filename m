Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id A3B078D30F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 10:21:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W9qTdkjE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq2HK1f8pz79H1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:14:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W9qTdkjE;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq2GZ2g95z3g9j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 18:14:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716970452;
	bh=VLyOIVHLU95mQ240RHuf6Ii/24aWHKil9L7bk/lJvVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W9qTdkjE50eVY4m38Xna9RRypsO9BtrskqY6vWcjxSrgVi39Z93csviy5xBM/UNMr
	 ICfG1KTNxzfBD4X3x2uVCllEt+4f/FgdJnx06ZEYrCOu2fotVGk6X4r4rDufY4QLCF
	 QvRN+Ox7uPNwTiyPiOopyQrTGyqQjoexx4p7oe65iXBQ6luGAX4rIXjZ3jylG9s7CI
	 MBlmwPrfB0FfKh45fiG8FNWDLGxl7oZDjA4vQrA89Pbrvfz2QJKWAJpc1asSxcZT8H
	 xI1dHj9McpQeLHMkGUip+8jxjs8rAg5MwNQFSUfWuMC+hVWVv6mUFKDFY8eQXG3nl/
	 zNpm84X9VKX5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vq2GT6cdtz4x2w;
	Wed, 29 May 2024 18:14:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Esben Haabendal <esben@geanix.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
In-Reply-To: <87le3ukqnj.fsf@geanix.com>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
 <20240528-fsl-ifc-config-v2-2-5fd7be76650d@geanix.com>
 <096662e8-03cf-4c13-baa0-11918cab7511@kernel.org>
 <87le3ukqnj.fsf@geanix.com>
Date: Wed, 29 May 2024 18:14:07 +1000
Message-ID: <87ed9l3ui8.fsf@mail.lhotse>
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
Cc: Michael Walle <mwalle@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Esben Haabendal <esben@geanix.com> writes:
> Krzysztof Kozlowski <krzk@kernel.org> writes:
>
>> On 28/05/2024 14:28, Esben Haabendal wrote:
>>> With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
>>> to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
>>> selected in config snippets.
>>> 
>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>> ---
>>>  arch/powerpc/configs/85xx-hw.config | 2 ++
>>>  1 file changed, 2 insertions(+)
>>> 
>>> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
>>> index 524db76f47b7..8aff83217397 100644
>>> --- a/arch/powerpc/configs/85xx-hw.config
>>> +++ b/arch/powerpc/configs/85xx-hw.config
>>> @@ -24,6 +24,7 @@ CONFIG_FS_ENET=y
>>>  CONFIG_FSL_CORENET_CF=y
>>>  CONFIG_FSL_DMA=y
>>>  CONFIG_FSL_HV_MANAGER=y
>>> +CONFIG_FSL_IFC=y
>>
>> Does not look like placed according to config order.
>
> Correct.
>
>> This is not alphabetically sorted, but as Kconfig creates it (make
>> savedefconfig).
>
> Are you sure about this?
>
> It looks very much alphabetically sorted, with only two "errors"
>
> $ diff -u 85xx-hw.config 85xx-hw.config.sorted 
> --- 85xx-hw.config      2024-05-28 15:05:44.665354428 +0200
> +++ 85xx-hw.config.sorted       2024-05-28 15:05:56.102019081 +0200
> @@ -15,8 +15,8 @@
>  CONFIG_DMADEVICES=y
>  CONFIG_E1000E=y
>  CONFIG_E1000=y
> -CONFIG_EDAC=y
>  CONFIG_EDAC_MPC85XX=y
> +CONFIG_EDAC=y
>  CONFIG_EEPROM_AT24=y
>  CONFIG_EEPROM_LEGACY=y
>  CONFIG_FB_FSL_DIU=y
> @@ -71,10 +71,10 @@
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_NAND_FSL_ELBC=y
>  CONFIG_MTD_NAND_FSL_IFC=y
> -CONFIG_MTD_RAW_NAND=y
>  CONFIG_MTD_PHYSMAP_OF=y
>  CONFIG_MTD_PHYSMAP=y
>  CONFIG_MTD_PLATRAM=y
> +CONFIG_MTD_RAW_NAND=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_NETDEVICES=y
>  CONFIG_NVRAM=y
>
> I don't think that this file has ever been Kconfig sorted since it was
> created back in ancient times.
>
> And as it is merged with other config snippets using merge_into_defconfig
> function. I have no idea how to use savedefconfig to maintain such a snippet.
> It would require doing the reverse of the merge_into_defconfig.

Right. This is a config fragment, not a full config, so it's not managed
with savedefconfig.

Alphabetical order is preferable when adding new symbols.

cheers
