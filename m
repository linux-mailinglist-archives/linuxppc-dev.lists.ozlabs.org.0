Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C755102216
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 11:28:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HMVG2PPGzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 21:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.b="Q8tLl8to"; 
 dkim-atps=neutral
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HMST0wpNzDqCG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 21:26:45 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191119102640euoutp01351173a55316c45f549640e44f8c1924~YiXP1irBf0596805968euoutp01h
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 10:26:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191119102640euoutp01351173a55316c45f549640e44f8c1924~YiXP1irBf0596805968euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1574159200;
 bh=D/g3yXR9pamMWPp71JIZbdufxuBthPEXVKwLnjYPhSI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Q8tLl8toyeRFASSpEvCbXJVORGQiUfOpWWUVlok2GzEFl4CqL/PyYaT5GRZlLiPtc
 XiDyNdPsltCrC7rkBhhlzO7JBB/F534myBd0lbXszAxE1AhTKrRRiQTIMUWip0G+w9
 kvALtEiGCuniwxTp7UqHrorAnBZG3/K9qniy9tw4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191119102640eucas1p2ccd37c651175699c42e63d86d6544a56~YiXPlZ4VY1389413894eucas1p2F;
 Tue, 19 Nov 2019 10:26:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.44.04469.063C3DD5; Tue, 19
 Nov 2019 10:26:40 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191119102640eucas1p151436fe1b336aaf36450417e2f2376e7~YiXPOwjJg1925519255eucas1p1B;
 Tue, 19 Nov 2019 10:26:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191119102640eusmtrp1025d1bd6fd93940781cfd2e7f795cafd~YiXPN9BtY1711617116eusmtrp12;
 Tue, 19 Nov 2019 10:26:40 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-01-5dd3c36071ff
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 06.5B.04117.063C3DD5; Tue, 19
 Nov 2019 10:26:40 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191119102639eusmtip2698f43cd6e73bda1cb8139d05d480895~YiXOnf1IV1570515705eusmtip2F;
 Tue, 19 Nov 2019 10:26:39 +0000 (GMT)
Subject: Re: [PATCH 1/3] dma-direct: unify the dma_capable definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <a3e2d65b-7270-9555-a251-d7ed0c4fb85c@samsung.com>
Date: Tue, 19 Nov 2019 11:26:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPdM1+x_4PQ1AfoPY6GuV0e9bk3hv_1EfEdHcLjMwwYxgw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt3vvdrea/JyGHxVGq4wCSyPjgmEGFpeIKCILQ/SWt1nNabut
 tIiGYQ8TrXzNSeaqMXuqW4oPrJzlI/E57SERVkJQaJFZSGl5d7X873znfIfvHPhoQtNNLaAP
 GY7xRgOn18pVZHXzeGdwfJMnNuTm06XM7bvPZEzp43Cmq6tCwTg/vKCYi84qxFi6HskYd34D
 Yn79nKSYaqtDztS+aSWYSxUdKHIu63nRQ7DOOxflrOvWGTb3lQOxXRYbYutfm+Vs5UiNjHW1
 n2JHnYE7lDGqDQm8/tBx3rgmIl6VaG8dpVJKwlLz++yEGRUGZyIlDXgd9JeUKTKRitbgMgQV
 57MIafiOoMA+KZOGUQS2sSvkjMX2tn1acCB4/adILgoaPIzA+dskYj+8BVw5xYSI/fFKeDnx
 kxINBJ6QwYDtlleQ41DIHM70mtU4AooL7ipETOLlYM7/MsXT9HwcCxccidKKL7QVDXlDKPFO
 yGnNQCIm8GI4WyXdInAADAxd94YDPKyAwe/ZSEodBb3f8qaxH3xqeaiQ8CJoz80iJcNZBO86
 7yukIQuBJ90y7QiHppYeSkxETNUpr1sj0Ztg6EOfTKQB+8CrYV8phA9crS4kJFoNF85ppO0g
 sLY8+He2sbuXuIy01lnVrLPqWGfVsf6/W4rIOyiANwlJOl4INfAnVgtckmAy6FYfSE5yoqk/
 a59s+VaDxnr3uxGmkXaeunWZJ1ZDcceFtCQ3AprQ+qu3v++O1agTuLSTvDE5zmjS84IbLaRJ
 bYD61JzBfRqs447xR3g+hTfOqDJaucCM9INHa8pGdoXtmTgS4U4P6ks9/byh7uPWyc3XqhqH
 Nh6kmE7UtCzSsSI5yv6LKO/P0g9YDJcmdOlRnoyGuCfcV6SjmmOWRC4XjB/H8+rJPancjc98
 bWDY2sptyozmwN+2kGjWtX63jkom9rrayrjd9w4f/HGz46glLTq035w9oCWFRC50FWEUuL9+
 aWv2YwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7oJhy/HGnx5ymWxcvVRJosF+60t
 zp/fwG6x6fE1VovOTVsZLWac38dkcWjqXkaL39//sVpsm7WczWLnnRPMFt0bzjI6cHtcvnaR
 2WPTqk42j81L6j0m31jO6HF+xkJGj903G9g8Nr7bweSx+XS1x+dNcgGcUXo2RfmlJakKGfnF
 JbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZS098Zi2YZ1ox9cpS5gbG
 6bpdjJwcEgImEgvvnWbqYuTiEBJYyihxccFSRoiEjMTJaQ2sELawxJ9rXWwQRa8ZJc6db2QH
 SQgLuEls7p/NDGKLCGhKXP/7nRWkiFngP5PE1o4PLCAJIYHFTBJ727hAbDYBQ4mutyCTODl4
 BewkZk9bDTaIRUBVomHqe7C4qECsxPeVnxghagQlTs58AjaHUyBQov9EK1icWcBMYt7mh8wQ
 trxE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66X
 nJ+7iREYwduO/dyyg7HrXfAhRgEORiUe3hMql2OFWBPLiitzDzFKcDArifD6PboQK8SbklhZ
 lVqUH19UmpNafIjRFOi5icxSosn5wOSSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
 NbUgtQimj4mDU6qBcc4iQ7bJZ5W4vmnKGHpbyFyv9m4vmPDZaeE502KvDZZ1ieX6rCpWAQeU
 Xfu0BTSVDu3WaXsSvW1Ll9imf6f/l5014Z3rfPf2l2ip2zY5rA3q+f3fpkirMvjZC7IWPeTT
 sJm6IUgz/XXIgVUTK9NrLFqlZhxhZL/CfnSX+71ydrZZd0PjnxcpsRRnJBpqMRcVJwIA4M4W
 M/YCAAA=
X-CMS-MailID: 20191119102640eucas1p151436fe1b336aaf36450417e2f2376e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9
References: <20191113073539.9660-1-hch@lst.de>
 <CGME20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9@epcas3p2.samsung.com>
 <20191113073539.9660-2-hch@lst.de>
 <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
 <CAJKOXPdM1+x_4PQ1AfoPY6GuV0e9bk3hv_1EfEdHcLjMwwYxgw@mail.gmail.com>
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 linux-mips@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Robin Gong <yibin.gong@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On 19.11.2019 10:44, Krzysztof Kozlowski wrote:
> On Tue, 19 Nov 2019 at 17:27, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Hi Christoph,
>>
>> On 13.11.2019 08:35, Christoph Hellwig wrote:
>>> Currently each architectures that wants to override dma_to_phys and
>>> phys_to_dma also has to provide dma_capable.  But there isn't really
>>> any good reason for that.  powerpc and mips just have copies of the
>>> generic one minus the latests fix, and the arm one was the inspiration
>>> for said fix, but misses the bus_dma_mask handling.
>>> Make all architectures use the generic version instead.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> This patch breaks DMAengine PL330 driver on Samsung Exynos SoCs:
>
> Thanks Marek for bisecting it. I wonder whether it is also the cause
> for boot failures I see on NXP Vybrid VF50 SoC (NXP/Freescale
> fsl-edma) since few days:
>
> [ 2.853428] fsl-edma 40018000.dma-controller: overflow 0x40027007+1 of
> DMA mask ffffffff bus mask 0
> [ 2.862566] ------------[ cut here ]------------
> [ 2.867273] WARNING: CPU: 0 PID: 1 at
> /home/buildbot/worker/builddir_yocto/build/build/tmp/work-shared/col-vf50-proceq-mainline-next/kernel-source/kernel/dma/direct.c:35
> report_addr+0xc0/0xfc
> [ 2.884380] Modules linked in:
> [ 2.887486] CPU: 0 PID: 1 Comm: swapper Tainted: G W
> 5.4.0-rc7-next-20191118-g519ead8f6a32 #1
> [ 2.897364] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> [ 2.903892] [<8010ddfc>] (unwind_backtrace) from [<8010b4b8>]
> (show_stack+0x10/0x14)
> [ 2.911712] [<8010b4b8>] (show_stack) from [<8011b08c>] (__warn+0xd4/0xec)
> [ 2.918653] [<8011b08c>] (__warn) from [<8011b154>]
> (warn_slowpath_fmt+0xb0/0xb8)
> [ 2.926218] [<8011b154>] (warn_slowpath_fmt) from [<80155f7c>]
> (report_addr+0xc0/0xfc)
> [ 2.934221] [<80155f7c>] (report_addr) from [<801561f0>]
> (dma_direct_map_resource+0x98/0xa4)
> [ 2.942744] [<801561f0>] (dma_direct_map_resource) from [<8041d5d4>]
> (fsl_edma_prep_slave_dma+0x12c/0x150)
> [ 2.952475] [<8041d5d4>] (fsl_edma_prep_slave_dma) from [<8041d8cc>]
> (fsl_edma_prep_dma_cyclic+0x30/0x21c)
> [ 2.962213] [<8041d8cc>] (fsl_edma_prep_dma_cyclic) from [<80452e10>]
> (lpuart_rx_dma_startup+0x188/0x36c)
> [ 2.971871] [<80452e10>] (lpuart_rx_dma_startup) from [<80453058>]
> (lpuart_startup+0x64/0x78)
> [ 2.980477] [<80453058>] (lpuart_startup) from [<8044e924>]
> (uart_startup.part.7+0x110/0x23c)
> [ 2.989080] [<8044e924>] (uart_startup.part.7) from [<8044eaa0>]
> (uart_port_activate+0x50/0x7c)
> [ 2.997857] [<8044eaa0>] (uart_port_activate) from [<80438dc0>]
> (tty_port_open+0x74/0xc0)
> [ 3.006111] [<80438dc0>] (tty_port_open) from [<8044be30>] (uart_open+0x18/0x20)
> [ 3.013588] [<8044be30>] (uart_open) from [<80431b4c>] (tty_open+0x108/0x428)
> [ 3.020794] [<80431b4c>] (tty_open) from [<801edb48>] (chrdev_open+0xac/0x164)
> [ 3.028098] [<801edb48>] (chrdev_open) from [<801e55c8>]
> (do_dentry_open+0x22c/0x3e4)
> [ 3.036010] [<801e55c8>] (do_dentry_open) from [<801f72a8>]
> (path_openat+0x4a4/0xf78)
> [ 3.043912] [<801f72a8>] (path_openat) from [<801f8d34>]
> (do_filp_open+0x70/0xdc)
> [ 3.051472] [<801f8d34>] (do_filp_open) from [<801e6998>]
> (do_sys_open+0x128/0x1f4)
> [ 3.059217] [<801e6998>] (do_sys_open) from [<80a00ee0>]
> (kernel_init_freeable+0x150/0x1c4)
> [ 3.067658] [<80a00ee0>] (kernel_init_freeable) from [<8068e208>]
> (kernel_init+0x8/0x110)
> [ 3.075917] [<8068e208>] (kernel_init) from [<801010e8>]
> (ret_from_fork+0x14/0x2c)
> [ 3.083539] Exception stack(0x86843fb0 to 0x86843ff8)
> [ 3.088631] 3fa0: 00000000 00000000 00000000 00000000
> [ 3.096866] 3fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [ 3.105103] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [ 3.111752] ---[ end trace 6fb699802256a309 ]---
> [    3.116423] fsl-lpuart 40027000.serial: Cannot prepare cyclic DMA
> [    3.192968] VFS: Mounted root (nfs4 filesystem) on device 0:13.
> [    3.201432] devtmpfs: mounted
> [    3.210985] Freeing unused kernel memory: 1024K
> [    3.217854] Run /sbin/init as init process
> [    4.643355] systemd[1]: System time before build time, advancing clock.
> [    4.774106] random: systemd: uninitialized urandom read (16 bytes read)
> [    4.838361] systemd[1]: systemd 232 running in system mode. (-PAM
> -AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP
> -GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN)
> [    4.858997] systemd[1]: Detected architecture arm.
> [    4.873438] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
> [    4.880138] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
> [    4.886585] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
> [    4.893124] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
> [    4.899679] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
> [    4.906110] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
> [    4.912616] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
>
> Although maybe that's just the fsl-edma problem?

This is the same issue.

A quick looks at the dma-direct code revealed that the 
dma_direct_map_resource() is broken after this unification, because it 
calls dma_direct_possible(), which then calls dma_capable(). The generic 
dma_capable() from include/linux/dma-direct.h checks if the provided 
address is in RAM memory range, what in the case of 
dma_direct_map_resource() is not true.

A quick fix for this issue is to inline dma_direct_possible() with a 
modified dma_capable() directly to the dma_direct_map_resource() 
function (without the min_low_pfn check):

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 077876ae5c74..b6dd6a0b338b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -411,8 +411,10 @@ dma_addr_t dma_direct_map_resource(struct device 
*dev, phys_addr_t paddr,
                 size_t size, enum dma_data_direction dir, unsigned long 
attrs)
  {
         dma_addr_t dma_addr = paddr;
+       dma_addr_t end = dma_addr + size - 1;

-       if (unlikely(!dma_direct_possible(dev, dma_addr, size))) {
+       if (unlikely(swiotlb_force == SWIOTLB_FORCE || !dev->dma_mask ||
+                    end > min_not_zero(*dev->dma_mask, 
dev->bus_dma_mask))) {
                 report_addr(dev, dma_addr, size);
                 return DMA_MAPPING_ERROR;
         }

Christoph: Let me know if this is a proper fix for you, then I will send 
it as a full patch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

