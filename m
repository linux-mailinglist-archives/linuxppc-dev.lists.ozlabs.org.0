Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120D1B057
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 08:31:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452WDw41hNzDqJH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 16:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="UHoF5c7I"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452WCY53c6zDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 16:30:32 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id n19so6633630pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 May 2019 23:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vg1t/c52FQpP93ldkK1e//aTIcq+JlBQvJxdZMKHLzk=;
 b=UHoF5c7IQICbKH4TwEPMXlmH+/pO92mJ4PaNH2lB2yWg8OpUUSTQLWfnyDZqadA14D
 taARq4G7FN3jdnUJi62rwMc14KwroF/TDOx7k2STpCziUYsO5B3jK2OdUVRVDAAKHDAA
 QjA4P1GFs7XnaSK/oIzXGoy2kLtp0lL3CROobN13xz98Qb0T4SR+Qsh7GCWFS01cKTAs
 rWNAAf+U86qPh6rEp8sX4dZT9Fkw7l+74J/2UkMtQrzBgv4FTJBs2gh88w+BHK4Nc0mM
 5bmHm2LKpdETWIq43pGdMjV/EESC/dnfI7vzrG1rKqRPDbAGs2M5lViS+d7XmiNgmKrg
 VidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vg1t/c52FQpP93ldkK1e//aTIcq+JlBQvJxdZMKHLzk=;
 b=q+yYdMv0Uo7tlHbKRrmS5Hz2CqBgAfDTFK1wKnfYPzu27bkvqlnN/ljk/dZdKN3UoS
 Oc7BU6RyP7LhCoivjVzpyy41Bs/Mvqzh81tRgIRwhAFV7GvXD/Db2UoI4SC+DEYnLvxj
 XyI0CXwQ7eH7Im3mu9hpFX6ka7CW3fNLb3/wgDS8mMosUB+jbmeYV6dB4Ju3TTVfRz02
 GaW9AHts2aZspGA45/SJTJu9ES/w8jdwPCOlQw9pFWsNyQpbkdOVY9tezrhDF079H2tB
 ACHyPAvXaB16p+gACaJe7Bp4NiNxKeq5A2POEbo7VJikWtaBvgU+jSxo6kCfQyvK8smj
 SzkQ==
X-Gm-Message-State: APjAAAW+DfLvKIP/BO0o77qx424b+9B8dabTvFgJY80kGq6jwyDqDmyU
 0y7KH91E+goarhn5fHrDXhpJAg==
X-Google-Smtp-Source: APXvYqw3HXixDhdI1MYhqb6+nmILLzOnvDskIOJm3THRYgC6x02qnoipyCRvk4o0xXEuAsOMSzmOQg==
X-Received: by 2002:a63:7982:: with SMTP id
 u124mr28772673pgc.352.1557729029120; 
 Sun, 12 May 2019 23:30:29 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t5sm22659692pgn.80.2019.05.12.23.30.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 23:30:28 -0700 (PDT)
Subject: Re: [PATCH kernel 1/2] powerpc/pseries/dma: Allow swiotlb
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <20190507062559.20295-1-aik@ozlabs.ru>
 <20190507062559.20295-2-aik@ozlabs.ru> <871s162az1.fsf@morokweng.localdomain>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <bf9f80d8-0179-5330-531a-a243d5c358d4@ozlabs.ru>
Date: Mon, 13 May 2019 16:30:24 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <871s162az1.fsf@morokweng.localdomain>
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/05/2019 08:36, Thiago Jung Bauermann wrote:
> 
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> The commit 8617a5c5bc00 ("powerpc/dma: handle iommu bypass in
>> dma_iommu_ops") merged direct DMA ops into the IOMMU DMA ops allowing
>> SWIOTLB as well but only for mapping; the unmapping and bouncing parts
>> were left unmodified.
>>
>> This adds missing direct unmapping calls to .unmap_page() and .unmap_sg().
>>
>> This adds missing sync callbacks and directs them to the direct DMA hooks.
>>
>> Fixes: 8617a5c5bc00 (powerpc/dma: handle iommu bypass in dma_iommu_ops)
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Nice! Thanks for working on this. I have the patch at the end of this
> email to get virtio-scsi-pci and virtio-blk-pci working in a secure
> guest.

I saw the set_pci_dma_ops(NULL) patch but could not figure out how pass
NULL there sets the DMA ops to direct.

> 
> I applied your patch and reverted my patch and unfortunately the guest
> hangs right after mounting the disk:

Have you applied it on upstream kernel? I cannot see how it affects
current guests as it is...


> 
> [    0.185659] virtio-pci 0000:00:04.0: enabling device (0100 -> 0102)
> [    0.187082] virtio-pci 0000:00:04.0: ibm,query-pe-dma-windows(2026) 2000 8000000 20000000 returned 0
> [    0.187497] virtio-pci 0000:00:04.0: ibm,create-pe-dma-window(2027) 2000 8000000 20000000 10 20 returned 0 (liobn = 0x80000001 startin
> g addr = 8000000 0)
> [    0.226654] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.227094] Non-volatile memory driver v1.3
> [    0.228950] brd: module loaded
> [    0.230666] loop: module loaded
> [    0.230773] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
> [    0.233323] scsi host0: Virtio SCSI HBA
> [    0.235439] scsi 0:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
> [    0.369009] random: fast init done
> [    0.370819] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [    0.371320] sd 0:0:0:0: Power-on or device reset occurred
> 
> <snip>
> 
> [    0.380378] sd 0:0:0:0: [sda] 31457280 512-byte logical blocks: (16.1 GB/15.0 GiB)
> [    0.381102] sd 0:0:0:0: [sda] Write Protect is off
> [    0.381195] sd 0:0:0:0: [sda] Mode Sense: 63 00 00 08
> [    0.382436] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    0.383630] sd 0:0:0:0: [sda] Optimal transfer size 0 bytes < PAGE_SIZE (65536 bytes)
> [    0.391562]  sda: sda1 sda2
> [    0.398101] sd 0:0:0:0: [sda] Attached SCSI disk
> [    0.398205] md: Waiting for all devices to be available before autodetect
> [    0.398318] md: If you don't use raid, use raid=noautodetect
> [    0.398515] md: Autodetecting RAID arrays.
> [    0.398585] md: autorun ...
> [    0.398631] md: ... autorun DONE.
> [    0.403552] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
> [    0.403700] VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
> [    0.405258] devtmpfs: mounted
> [    0.406427] Freeing unused kernel memory: 4224K
> [    0.406519] This architecture does not have kernel memory protection.
> [    0.406633] Run /sbin/init as init process
> 
> Sorry, I don't have any information on where the guest is stuck. I tried
> <sysrq>+l, <sysrq>+t and <sysrq>+w but nothing out of the ordinary
> showed up. Will try something else later.
> 
> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
> 
> 
> 
> From 70d2fba809119ae2d35c9ca4269405bb5c28413a Mon Sep 17 00:00:00 2001
> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Date: Thu, 24 Jan 2019 22:40:16 -0200
> Subject: [PATCH 1/1] powerpc/pseries/iommu: Don't use dma_iommu_ops on secure
>  guests
> 
> Secure guest memory is inacessible to devices so regular DMA isn't
> possible.
> 
> In that case set devices' dma_map_ops to NULL so that the generic
> DMA code path will use SWIOTLB and DMA to bounce buffers.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 36eb1ddbac69..1636306007eb 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -50,6 +50,7 @@
>  #include <asm/udbg.h>
>  #include <asm/mmzone.h>
>  #include <asm/plpar_wrappers.h>
> +#include <asm/svm.h>
> 
>  #include "pseries.h"
> 
> @@ -1335,7 +1336,10 @@ void iommu_init_early_pSeries(void)
>  	of_reconfig_notifier_register(&iommu_reconfig_nb);
>  	register_memory_notifier(&iommu_mem_nb);
> 
> -	set_pci_dma_ops(&dma_iommu_ops);
> +	if (is_secure_guest())
> +		set_pci_dma_ops(NULL);
> +	else
> +		set_pci_dma_ops(&dma_iommu_ops);
>  }
> 
>  static int __init disable_multitce(char *str)
> 

-- 
Alexey
