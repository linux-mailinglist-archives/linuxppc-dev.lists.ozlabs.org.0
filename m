Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600EA9DE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 11:11:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PFKx66rnzDr0v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 19:11:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="0z4xt+c7"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PFGs2pbvzDr0f
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 19:08:34 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id bd8so986865plb.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ghHRvQPVPbervCmbxcj9ka6t6kqgJGcJ0N1C9QEazv0=;
 b=0z4xt+c7UhZ3WIZd0Lo1oEbNZK/Qp0TdkdYnv+TvMItGrucMc0skqhRM6tasUaqfPS
 uHg0q90isJIsxHLEMhg/WMNiIJ37kBscPCSxpfSj2PFq2eIRCH0I9KCrG++SJKhP7hyl
 GUB+1vuKBHn90Hl3VkrsE3w26JGa3iZ2ecmMpmf9VgCIr0HcDvAcLG0RBp+5g8R1MSdB
 XTqC0MRjt+Qf8Q1OPKtB8kA7VpPTEy5ioHi5A0GY+JIsxVYDoLtA1hfotJGuVe0ez7Tz
 HkGt0cIpHDIJHxtXS1CT8ZKm3o8rlrxuXt0ZjHaUSuRr0v+Y7T1XiZuAfiGj710/Qk2P
 9TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghHRvQPVPbervCmbxcj9ka6t6kqgJGcJ0N1C9QEazv0=;
 b=owNPt2B6SG6Q5WVj49W+JOAPqe2/AJPUkHBlCqmPqntVW9kRYRQTwRlrbL+c1/xp7x
 DlHGu+QCxLp7N+e9mwJIM6Wq7DXCP86Lcz/nEIOeOzML1JQ9SavEQH/9uwkM3eiRoqCL
 598sgCCvGp/fkL6GyKhogwTTKyU6nzVMsFt6XzZcJ2NVZbxa2Gxa+qdjSryObb6KX4yl
 e1wQpVeTiloglS/3RKC/e6Ze17f6QOSo86K/dJU3XkUwIkz13ARCvV97Ezl5/nQxyk4e
 2vRbBFINmUtL+Bf0QEnEfBQWyr/9VXsmV+vKkl++K274nQwv+1S97BGsVc/7EiOfzim+
 yC9w==
X-Gm-Message-State: APjAAAWDvM5ALPCL23kxdN5JDqPdIbFZZd43kvLGGTJfghuY3qZzLMyX
 dbng2YNA1A+6KLE44vzUGWP3+A==
X-Google-Smtp-Source: APXvYqxDe7RmUKZdRmOXfm85qGSMv0TNu4nPbOm/7M3aDQGBmOcx2bC0nYxjTuFwB1j6CM2+HZhJwg==
X-Received: by 2002:a17:902:e493:: with SMTP id
 cj19mr2228022plb.292.1567674509883; 
 Thu, 05 Sep 2019 02:08:29 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s186sm2029034pfb.126.2019.09.05.02.08.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 02:08:29 -0700 (PDT)
Subject: Re: [PATCH 0/2] Fix IOMMU setup for hotplugged devices on pseries
To: Shawn Anastasio <shawn@anastas.io>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20190905042215.3974-1-shawn@anastas.io>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <7a41184c-9b30-8d91-9d78-9d60c8d128ef@ozlabs.ru>
Date: Thu, 5 Sep 2019 19:08:24 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905042215.3974-1-shawn@anastas.io>
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
Cc: bhelgaas@google.com, oohall@gmail.com, sbobroff@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/09/2019 14:22, Shawn Anastasio wrote:
> On pseries QEMU guests, IOMMU setup for hotplugged PCI devices is currently
> broken for all but the first device on a given bus. The culprit is an ordering
> issue in the pseries hotplug path (via pci_rescan_bus()) which results in IOMMU
> group assigment occuring before device registration in sysfs. This triggers
> the following check in arch/powerpc/kernel/iommu.c:
> 
> /*
>   * The sysfs entries should be populated before
>   * binding IOMMU group. If sysfs entries isn't
>   * ready, we simply bail.
>   */
> if (!device_is_registered(dev))
> 	return -ENOENT;
> 
> This fails for hotplugged devices since the pcibios_add_device() call in the
> pseries hotplug path (in pci_device_add()) occurs before device_add().
> Since the IOMMU groups are set up in pcibios_add_device(), this means that a
> sysfs entry will not yet be present and it will fail.

I just tried hotplugging 3 virtio-net devices into a guest system with 
v5.2 kernel and it seems working (i.e. BARs mapped, a driver is bound):


root@le-dbg:~# lspci -v | egrep -i '(virtio|Memory)'
00:00.0 Ethernet controller: Red Hat, Inc Virtio network device
         Memory at 200080040000 (32-bit, non-prefetchable) [size=4K]
         Memory at 210000000000 (64-bit, prefetchable) [size=16K]
         Kernel driver in use: virtio-pci
00:01.0 Ethernet controller: Red Hat, Inc Virtio network device
         Memory at 200080041000 (32-bit, non-prefetchable) [size=4K]
         Memory at 210000004000 (64-bit, prefetchable) [size=16K]
         Kernel driver in use: virtio-pci
00:02.0 Ethernet controller: Red Hat, Inc Virtio network device
         Memory at 200080042000 (32-bit, non-prefetchable) [size=4K]
         Memory at 210000008000 (64-bit, prefetchable) [size=16K]
         Kernel driver in use: virtio-pci

Can you explain in detail what you are doing exactly and what is failing 
and what qemu/guest kernel/guest distro is used? Thanks,


> 
> There is a special case that allows the first hotplugged device on a bus to
> succeed, though. The powerpc pcibios_add_device() implementation will skip
> initializing the device if bus setup is not yet complete.
> Later, the pci core will call pcibios_fixup_bus() which will perform setup
> for the first (and only) device on the bus and since it has already been
> registered in sysfs, the IOMMU setup will succeed.
> 
> My current solution is to introduce another pcibios function, pcibios_fixup_dev,
> which is called after device_add() in pci_device_add(). Then in powerpc code,
> pcibios_setup_device() was moved from pcibios_add_device() to this new function
> which will occur after sysfs registration so IOMMU assignment will succeed.
> 
> I added a new pcibios function rather than moving the pcibios_add_device() call
> to after the device_add() call in pci_add_device() because there are other
> architectures that use it and it wasn't immediately clear to me whether moving
> it would break them.
> 
> If anybody has more insight or a better way to fix this, please let me know.
> 
> Shawn Anastasio (2):
>    PCI: Introduce pcibios_fixup_dev()
>    powerpc/pci: Fix IOMMU setup for hotplugged devices on pseries
> 
>   arch/powerpc/kernel/pci-common.c | 13 ++++++-------
>   drivers/pci/probe.c              | 14 ++++++++++++++
>   include/linux/pci.h              |  1 +
>   3 files changed, 21 insertions(+), 7 deletions(-)
> 

-- 
Alexey
