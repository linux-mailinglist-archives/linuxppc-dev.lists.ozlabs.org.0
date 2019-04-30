Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65569F062
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 08:16:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tWVz5zq1zDqRr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 16:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="H0wXuuGG"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tWTN354JzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 16:14:46 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id ck18so1951889plb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6OnqqAYq2y9I/Sv4S4GHmJJEGS4WFLJ3f7efuuglpEQ=;
 b=H0wXuuGGMjL1UyFYqleWlOQqU1mEKI74UZmR8Xw2I/CcJLigyu1P2GH2ayALJ52nq0
 12bQsjewdRPXRMgMkZbDbJMIXe9P5KG/wEg2slkgss1GZxhGZgMfhFC9LRheipEUvbPE
 hBzGyI0Fpj8id6oDgi68tFn0Ie7giFnPqtOEyZb1G1R/10QSZw/CJpoHHGc7vBsYRoUa
 LIymAHiNcxO8aDaSPtQFp9/sZ1pm4+kMR/BBWfztue9yqJBgIQjntz+jkEGfdPIPzal7
 2zzg3N9y88io228YR+WCTTVO56nQmw2/I1MyargNoLlPVIZsGrgK0D2mqO9adQhrvbKI
 sXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6OnqqAYq2y9I/Sv4S4GHmJJEGS4WFLJ3f7efuuglpEQ=;
 b=nC185hPJ7BCqtbEeXybUoQj0JtlhDzU6ttBWpv1Zv9u1WmEhTkQlgBEISRJRRSThoo
 SxCwsKDfypzmmxJdD+0dci2YXI3jfOarQHlwiq543NoyAZOvz74Kd5uCqnzKImyUszL1
 1QbBDOSFWSB9A5l8Xjud0/qEVWoaR20iSwFxsLZRRpdiuIDQcrjPS7meiPo8Z702XmtP
 aZeMOjLEmx4pyldfNK9dU8cwqi05cNWnAqDIgjHb7Qx4xZs30V3GzO6WzXXMVH26d3pd
 7XzYvJgTqysX7v8fgkUgs7Pr6/EYRpqvq2uqO+Iems3o4RSlqGJgz4JoxX22OCO0scza
 xCPQ==
X-Gm-Message-State: APjAAAWEvqFrCzI8tC+7z3i8N3g+QHVLSDR7GtD4wUEPhdFd6QOcmbeO
 sVdvEnCP1+Nx7GgB4v175dCT4w==
X-Google-Smtp-Source: APXvYqwCU3cskrIE+xIqbrIVN+Q64hjBi49B00qCuEgXCe0WsMTWIKSg1DUHoU4un3c69LZLSTORWA==
X-Received: by 2002:a17:902:9686:: with SMTP id
 n6mr68461248plp.282.1556604882775; 
 Mon, 29 Apr 2019 23:14:42 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id r138sm28115792pfr.2.2019.04.29.23.14.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 23:14:41 -0700 (PDT)
Subject: Re: [PATCH kernel v3] powerpc/powernv: Isolate NVLinks between
 GV100GL on Witherspoon
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20190411064844.8241-1-aik@ozlabs.ru>
 <4f7069cf-8c25-6fe1-42df-3b4af2d52172@ozlabs.ru>
 <da41cd35-32f6-043e-13ab-9a225c4e910a@ozlabs.ru>
 <5149814.2BROG1NTNO@townsend>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <cf35d5be-d0a3-aef3-d5eb-c2318ef7d92b@ozlabs.ru>
Date: Tue, 30 Apr 2019 16:14:35 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5149814.2BROG1NTNO@townsend>
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
Cc: Jose Ricardo Ziviani <joserz@linux.ibm.com>, kvm@vger.kernel.org,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Piotr Jaroszynski <pjaroszynski@nvidia.com>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@br.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/04/2019 15:45, Alistair Popple wrote:
> Alexey,
> 
>>>>> +void pnv_try_isolate_nvidia_v100(struct pci_dev *bridge)
>>>>> +{
>>>>> +	u32 mask, val;
>>>>> +	void __iomem *bar0_0, *bar0_120000, *bar0_a00000;
>>>>> +	struct pci_dev *pdev;
>>>>> +	u16 cmd = 0, cmdmask = PCI_COMMAND_MEMORY;
>>>>> +
>>>>> +	if (!bridge->subordinate)
>>>>> +		return;
>>>>> +
>>>>> +	pdev = list_first_entry_or_null(&bridge->subordinate->devices,
>>>>> +			struct pci_dev, bus_list);
>>>>> +	if (!pdev)
>>>>> +		return;
>>>>> +
>>>>> +	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
> 
> Don't you also need to check the PCIe devid to match only [PV]100 devices as 
> well? I doubt there's any guarantee these registers will remain the same for 
> all future (or older) NVIDIA devices.


I do not have the complete list of IDs and I already saw 3 different
device ids and this only works for machines with ibm,npu/gpu/nvlinks
properties so for now it works and for the future we are hoping to
either have an open source nvidia driver or some small minidriver (also
from nvidia, or may be a spec allowing us to write one) to allow
topology discovery on the host so we would not depend on the skiboot's
powernv DT.

> IMHO this should really be done in the device driver in the guest. A malcious 
> guest could load a modified driver that doesn't do this, but that should not 
> compromise other guests which presumably load a non-compromised driver that 
> disables the links on that guests GPU. However I guess in practice what you 
> have here should work equally well.

Doing it in the guest means a good guest needs to have an updated
driver, we do not really want to depend on this. The idea of IOMMU
groups is that the hypervisor provides isolation irrespective to what
the guest does.

Also vfio+qemu+slof needs to convey the nvlink topology to the guest,
seems like an unnecessary complication.



> - Alistair
> 
>>>>> +		return;
>>>>> +
>>>>> +	mask = nvlinkgpu_get_disable_mask(&pdev->dev);
>>>>> +	if (!mask)
>>>>> +		return;
>>>>> +
>>>>> +	bar0_0 = pci_iomap_range(pdev, 0, 0, 0x10000);
>>>>> +	if (!bar0_0) {
>>>>> +		pci_err(pdev, "Error mapping BAR0 @0\n");
>>>>> +		return;
>>>>> +	}
>>>>> +	bar0_120000 = pci_iomap_range(pdev, 0, 0x120000, 0x10000);
>>>>> +	if (!bar0_120000) {
>>>>> +		pci_err(pdev, "Error mapping BAR0 @120000\n");
>>>>> +		goto bar0_0_unmap;
>>>>> +	}
>>>>> +	bar0_a00000 = pci_iomap_range(pdev, 0, 0xA00000, 0x10000);
>>>>> +	if (!bar0_a00000) {
>>>>> +		pci_err(pdev, "Error mapping BAR0 @A00000\n");
>>>>> +		goto bar0_120000_unmap;
>>>>> +	}
>>>>
>>>> Is it really necessary to do three separate ioremaps vs one that would
>>>> cover them all here?  I suspect you're just sneaking in PAGE_SIZE with
>>>> the 0x10000 size mappings anyway.  Seems like it would simplify setup,
>>>> error reporting, and cleanup to to ioremap to the PAGE_ALIGN'd range
>>>> of the highest register accessed. Thanks,
>>>
>>> Sure I can map it once, I just do not see the point in mapping/unmapping
>>> all 0xa10000>>16=161 system pages for a very short period of time while
>>> we know precisely that we need just 3 pages.
>>>
>>> Repost?
>>
>> Ping?
>>
>> Can this go in as it is (i.e. should I ping Michael) or this needs
>> another round? It would be nice to get some formal acks. Thanks,
>>
>>>> Alex
>>>>
>>>>> +
>>>>> +	pci_restore_state(pdev);
>>>>> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>>>>> +	if ((cmd & cmdmask) != cmdmask)
>>>>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd | cmdmask);
>>>>> +
>>>>> +	/*
>>>>> +	 * The sequence is from "Tesla P100 and V100 SXM2 NVLink Isolation on
>>>>> +	 * Multi-Tenant Systems".
>>>>> +	 * The register names are not provided there either, hence raw values.
>>>>> +	 */
>>>>> +	iowrite32(0x4, bar0_120000 + 0x4C);
>>>>> +	iowrite32(0x2, bar0_120000 + 0x2204);
>>>>> +	val = ioread32(bar0_0 + 0x200);
>>>>> +	val |= 0x02000000;
>>>>> +	iowrite32(val, bar0_0 + 0x200);
>>>>> +	val = ioread32(bar0_a00000 + 0x148);
>>>>> +	val |= mask;
>>>>> +	iowrite32(val, bar0_a00000 + 0x148);
>>>>> +
>>>>> +	if ((cmd | cmdmask) != cmd)
>>>>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
>>>>> +
>>>>> +	pci_iounmap(pdev, bar0_a00000);
>>>>> +bar0_120000_unmap:
>>>>> +	pci_iounmap(pdev, bar0_120000);
>>>>> +bar0_0_unmap:
>>>>> +	pci_iounmap(pdev, bar0_0);
>>>>> +}
> 
> 

-- 
Alexey
