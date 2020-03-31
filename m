Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FD198A56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 05:07:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rvPm2jD6zDqrj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:07:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rvN60ZcSzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 14:05:39 +1100 (AEDT)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DB44D73EF08DFFDA918F;
 Tue, 31 Mar 2020 11:05:31 +0800 (CST)
Received: from [127.0.0.1] (10.173.223.234) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 31 Mar 2020 11:05:26 +0800
Subject: Re: [PATCH] powerpc/44x: Make AKEBONO depends on NET
To: Michael Ellerman <mpe@ellerman.id.au>, <mporter@kernel.crashing.org>,
 <benh@kernel.crashing.org>, <paulus@samba.org>
References: <20200330143153.32800-1-yuehaibing@huawei.com>
 <87pnctuyq3.fsf@mpe.ellerman.id.au>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <bda28b40-b573-cff5-817a-3ddca1d8f969@huawei.com>
Date: Tue, 31 Mar 2020 11:05:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <87pnctuyq3.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
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
Cc: alistair@popple.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/3/31 8:58, Michael Ellerman wrote:
> YueHaibing <yuehaibing@huawei.com> writes:
>> Fix Kconfig warnings:
>>
>> WARNING: unmet direct dependencies detected for NETDEVICES
>>   Depends on [n]: NET [=n]
>>   Selected by [y]:
>>   - AKEBONO [=y] && PPC_47x [=y]
>>
>> WARNING: unmet direct dependencies detected for ETHERNET
>>   Depends on [n]: NETDEVICES [=y] && NET [=n]
>>   Selected by [y]:
>>   - AKEBONO [=y] && PPC_47x [=y]
>>
>> AKEBONO select NETDEVICES and ETHERNET unconditionally,
> 
> It shouldn't do that, that's the job of a defconfig.
> 
> It might want to enable NET_VENDOR_IBM iff the config already has NET
> and other dependencies enabled.
> 
> So the patch below might work?

Yes, It works for me, Thanks!

Tested-by: YueHaibing <yuehaibing@huawei.com> # build-tested

> 
> cheers
> 
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
> index 25ebe634a661..32aac4f40f1b 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -207,9 +207,7 @@ config AKEBONO
>  	select PPC4xx_HSTA_MSI
>  	select I2C
>  	select I2C_IBM_IIC
> -	select NETDEVICES
> -	select ETHERNET
> -	select NET_VENDOR_IBM
> +	imply NET_VENDOR_IBM
>  	select IBM_EMAC_EMAC4 if IBM_EMAC
>  	select USB if USB_SUPPORT
>  	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
> 
> 
> 
>> If NET is not set, build fails. Add this dependcy to fix this.
>>
>> Fixes: 2a2c74b2efcb ("IBM Akebono: Add the Akebono platform")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  arch/powerpc/platforms/44x/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
>> index 25ebe634a661..394f662d7df2 100644
>> --- a/arch/powerpc/platforms/44x/Kconfig
>> +++ b/arch/powerpc/platforms/44x/Kconfig
>> @@ -199,6 +199,7 @@ config FSP2
>>  config AKEBONO
>>  	bool "IBM Akebono (476gtr) Support"
>>  	depends on PPC_47x
>> +	depends on NET
>>  	select SWIOTLB
>>  	select 476FPE
>>  	select PPC4xx_PCI_EXPRESS
>> -- 
>> 2.17.1
> 
> .
> 

