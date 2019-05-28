Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D272BE1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:11:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CgQ338WMzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="UzyA0d+b"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CgNn1XygzDqBL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:10:17 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4968E7F8EF;
 Mon, 27 May 2019 23:09:44 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559016585; bh=IPciv5XW8PSn65YQOGUAMeOHM6XRioM8jODTE/cBdU8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UzyA0d+bwaxA63Oe76TnTbWrmuixk00++UDHHULAMRtlXL1tQyOPcqCkkRUPZZ1PQ
 HpsgooHm8WqhhWC7QfzC2iKIdrSZXOpYo5WgjNFU4KyoGhekqEEGZYlhElpqndDNe3
 04+RgWq9HzWarLrw4syf5siY4sNAIEbuczdXwtk4r+Q3YNCcCv2jK5aiXwsYeFCaxO
 ToCYkhXQUdicOb7lEHI7bomtsh5Wd2RPYrKS+K2gVjZDGuOIkO8PqpeEbeGMNq98N4
 ETOxHIsX6WV8D6BZVIIWDFo0J36/cd/kMY37Rtg0OMcSa0MI48d38ZLftW/Jhbz2BI
 xJaryvJOfr/aw==
Subject: Re: [RESEND PATCH 0/3] Allow custom PCI resource alignment on pseries
To: Oliver <oohall@gmail.com>
References: <20190527225521.5884-1-shawn@anastas.io>
 <CAOSf1CFFyz0YNqdpd5r44MaBV449yoK3WOMBZ1mpgZ=judNfDQ@mail.gmail.com>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <476555b7-b462-d844-57ea-7ca1c6113d9b@anastas.io>
Date: Mon, 27 May 2019 23:09:43 -0500
MIME-Version: 1.0
In-Reply-To: <CAOSf1CFFyz0YNqdpd5r44MaBV449yoK3WOMBZ1mpgZ=judNfDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 Bjorn Helgaas <bhelgaas@google.com>, xyjxie@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/27/19 11:01 PM, Oliver wrote:
> On Tue, May 28, 2019 at 8:56 AM Shawn Anastasio <shawn@anastas.io> wrote:
>>
>> Hello all,
>>
>> This patch set implements support for user-specified PCI resource
>> alignment on the pseries platform for hotplugged PCI devices.
>> Currently on pseries, PCI resource alignments specified with the
>> pci=resource_alignment commandline argument are ignored, since
>> the firmware is in charge of managing the PCI resources. In the
>> case of hotplugged devices, though, the kernel is in charge of
>> configuring the resources and should obey alignment requirements.
> 
> Are you using hotplug to work around SLOF (the OF we use under qemu)
> not aligning BARs to 64K? It looks like there is a commit in SLOF to
> fix that (https://git.qemu.org/?p=SLOF.git;a=commit;f=board-qemu/slof/pci-phb.fs;h=1903174472f8800caf50c959b304501b4c01153c).
> 

No, my application actually requires PCI hotplug at run-time.

>> The current behavior of ignoring the alignment for hotplugged devices
>> results in sub-page BARs landing between page boundaries and
>> becoming un-mappable from userspace via the VFIO framework.
>> This issue was observed on a pseries KVM guest with hotplugged
>> ivshmem devices.
> 
>> With these changes, users can specify an appropriate
>> pci=resource_alignment argument on boot for devices they wish to use
>> with VFIO.
>>
>> In the future, this could be extended to provide page-aligned
>> resources by default for hotplugged devices, similar to what is done
>> on powernv by commit 382746376993 ("powerpc/powernv: Override
>> pcibios_default_alignment() to force PCI devices to be page aligned").
> 
> Can we make aligning the BARs to PAGE_SIZE the default behaviour? The
> BAR assignment process is complex enough as-is so I'd rather we didn't
> add another platform hack into the mix.

Absolutely. This will still require the existing changes so that the 
custom alignment isn't flat-out ignored on pseries, but I can set
it to default to PAGE_SIZE as well, similar to how it's done on PowerNV.
I've just pushed a v3 to fix a typo and I'll incorporate this change
in v4.

>> Feedback is appreciated.
>>
>> Thanks,
>> Shawn
>>
>> Shawn Anastasio (3):
>>    PCI: Introduce pcibios_ignore_alignment_request
>>    powerpc/64: Enable pcibios_after_init hook on ppc64
>>    powerpc/pseries: Allow user-specified PCI resource alignment after
>>      init
>>
>>   arch/powerpc/include/asm/machdep.h     |  6 ++++--
>>   arch/powerpc/kernel/pci-common.c       |  9 +++++++++
>>   arch/powerpc/kernel/pci_64.c           |  4 ++++
>>   arch/powerpc/platforms/pseries/setup.c | 22 ++++++++++++++++++++++
>>   drivers/pci/pci.c                      |  9 +++++++--
>>   5 files changed, 46 insertions(+), 4 deletions(-)
>>
>> --
>> 2.20.1
>>
