Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37E2FF9E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 02:24:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMM3d3v9DzDrV2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 12:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=tjZvK6kI; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMM1v4JwqzDrRc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 12:22:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=nsfHN4ruMgctb+T/nWfwgWtc4d+dx9Cp+YY+RpU/dvk=; b=tjZvK6kIQJkVoUh0XH5KaPSzs4
 8lr3MIgIr75RIY4aA23wlTr3OM76gWx1LXz10+q2hpKQdXr6ktfXV3qzhbeh4r4LH8otlwsyyJpjn
 UdBiPxQtBG/6d/PrKlA52hMEi8SdcOX3ErqodvY1/ZbBV83IkZ6IHdxY4MK9t0H5HFbjL7Ckp4vQq
 QS1d79EtonYd0+OZhRASIc7t1W4sKH/rch/pro1+wo9CaREke+CCiIweeTPBLC3oAD45lmEzubspX
 wpGfFntPlb9c2xs01lmYLfKSrJ0PrVzgLSNtkqVhf7ZFIi0oO64Z0EShmUC+pNFoGuNyhuYVrQGnB
 NjscAPdA==;
Received: from [2601:1c0:6280:3f0:c52a:3cbc:74:978c]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2l9X-0001A2-Tf; Fri, 22 Jan 2021 01:22:21 +0000
Date: Thu, 21 Jan 2021 17:22:10 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <875z3prcwg.fsf@mpe.ellerman.id.au>
References: <CAAH8bW8-6Dp29fe6rrnA4eL1vo+mu0HuAVJ-5yjbwxDSvaHdeQ@mail.gmail.com>
 <6c442012-3bef-321b-bbc3-09c54608661f@infradead.org>
 <875z3prcwg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] powerpc: fix AKEBONO build failures
To: Michael Ellerman <mpe@ellerman.id.au>, Yury Norov <yury.norov@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8AC16666-0EBD-4E2B-84AB-880DAF3A04EE@infradead.org>
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

On January 21, 2021 5:14:23 PM PST, Michael Ellerman <mpe@ellerman=2Eid=2Ea=
u> wrote:
>Randy Dunlap <rdunlap@infradead=2Eorg> writes:
>> On 1/20/21 1:29 PM, Yury Norov wrote:
>>> Hi all,
>>>=20
>>> I found the power pc build broken on today's
>>> linux-next (647060f3b592)=2E
>>
>> Darn, I was building linux-5=2E11-rc4=2E
>>
>> I'll try linux-next after I send this=2E
>>
>> ---
>> From: Randy Dunlap <rdunlap@infradead=2Eorg>
>>
>> Fulfill AKEBONO Kconfig requirements=2E
>>
>> Fixes these Kconfig warnings (and more) and fixes the subsequent
>> build errors:
>>
>> WARNING: unmet direct dependencies detected for NETDEVICES
>>   Depends on [n]: NET [=3Dn]
>>   Selected by [y]:
>>   - AKEBONO [=3Dy] && PPC_47x [=3Dy]
>>
>> WARNING: unmet direct dependencies detected for MMC_SDHCI
>>   Depends on [n]: MMC [=3Dn] && HAS_DMA [=3Dy]
>>   Selected by [y]:
>>   - AKEBONO [=3Dy] && PPC_47x [=3Dy]
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead=2Eorg>
>> Cc: Michael Ellerman <mpe@ellerman=2Eid=2Eau>
>> Cc: Benjamin Herrenschmidt <benh@kernel=2Ecrashing=2Eorg>
>> Cc: Paul Mackerras <paulus@samba=2Eorg>
>> Cc: linuxppc-dev@lists=2Eozlabs=2Eorg
>> Cc: Yury Norov <yury=2Enorov@gmail=2Ecom>
>> ---
>>  arch/powerpc/platforms/44x/Kconfig |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- lnx-511-rc4=2Eorig/arch/powerpc/platforms/44x/Kconfig
>> +++ lnx-511-rc4/arch/powerpc/platforms/44x/Kconfig
>> @@ -206,6 +206,7 @@ config AKEBONO
>>  	select PPC4xx_HSTA_MSI
>>  	select I2C
>>  	select I2C_IBM_IIC
>> +	select NET
>>  	select NETDEVICES
>>  	select ETHERNET
>>  	select NET_VENDOR_IBM
>
>I think the problem here is too much use of select, for things that
>should instead be in the defconfig=2E
>
>The patch below results in the same result for make
>44x/akebono_defconfig=2E Does it fix the original issue?
>
>We don't need to add ETHERNET or NET_VENDOR_IBM to the defconfig
>because
>they're both default y=2E
>
>cheers
>
>
>diff --git a/arch/powerpc/configs/44x/akebono_defconfig
>b/arch/powerpc/configs/44x/akebono_defconfig
>index 3894ba8f8ffc=2E=2E6b08a85f4ce6 100644
>--- a/arch/powerpc/configs/44x/akebono_defconfig
>+++ b/arch/powerpc/configs/44x/akebono_defconfig
>@@ -21,6 +21,7 @@ CONFIG_IRQ_ALL_CPUS=3Dy
> # CONFIG_COMPACTION is not set
> # CONFIG_SUSPEND is not set
> CONFIG_NET=3Dy
>+CONFIG_NETDEVICES=3Dy
> CONFIG_PACKET=3Dy
> CONFIG_UNIX=3Dy
> CONFIG_INET=3Dy
>@@ -98,6 +99,8 @@ CONFIG_USB_OHCI_HCD=3Dy
> # CONFIG_USB_OHCI_HCD_PCI is not set
> CONFIG_USB_STORAGE=3Dy
> CONFIG_MMC=3Dy
>+CONFIG_MMC_SDHCI=3Dy
>+CONFIG_MMC_SDHCI_PLTFM=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_DRV_M41T80=3Dy
> CONFIG_EXT2_FS=3Dy
>diff --git a/arch/powerpc/platforms/44x/Kconfig
>b/arch/powerpc/platforms/44x/Kconfig
>index 78ac6d67a935=2E=2E509b329c112f 100644
>--- a/arch/powerpc/platforms/44x/Kconfig
>+++ b/arch/powerpc/platforms/44x/Kconfig
>@@ -206,15 +206,10 @@ config AKEBONO
>        select PPC4xx_HSTA_MSI
>        select I2C
>        select I2C_IBM_IIC
>-       select NETDEVICES
>-       select ETHERNET
>-       select NET_VENDOR_IBM
>        select IBM_EMAC_EMAC4 if IBM_EMAC
>        select USB if USB_SUPPORT
>        select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
>        select USB_EHCI_HCD_PLATFORM if USB_EHCI_HCD
>-       select MMC_SDHCI
>-       select MMC_SDHCI_PLTFM
>        select ATA
>        select SATA_AHCI_PLATFORM
>        help

Sure=2E I thought that lots of what was already there
should be in the defconfig=2E I  was just going with the flow=2E=20

Thanks for fixing it=2E=20

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
