Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AFB102116
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 10:46:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HLZ55hcDzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 20:46:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="peQ3kYl6"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HLWj41kTzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 20:44:33 +1100 (AEDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5C3522318
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574156670;
 bh=Co+9nC8LHf9nBgV61e+bLx69WUxnINaAQoKGyuVnzHc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=peQ3kYl60TH11ynsz5ARijEULfYL7BAYgDQ8ZfNZwof/kjHOOKPo+ehp0HB91ZWLp
 VqPvMmSlAxbuLd+o2jFQfWUzfDFb0WrLZlxYdajczzSrhh5UAzTL2d+mgJYIC7oHQc
 KmpTcYJLP1VePee6LQYXTToqaIb5rb+CC3iwF3/k=
Received: by mail-lf1-f52.google.com with SMTP id l14so9789263lfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 01:44:29 -0800 (PST)
X-Gm-Message-State: APjAAAWHkUTMafYKFxZ7oCaEFvpZ4soMpYWqTVuKrlEGqDW9OmS1wswq
 IQXZe97oTwnpXdRKL820nDQZk1wdYTsql+IjTC0=
X-Google-Smtp-Source: APXvYqx1eAge2ZT9e3zpuCY1yWpA8Sxtth7ftU+ZVwo02YeUdKA9ziLmKXgXlk5UaMG1Ci33IVhhMeQOZVNib9lZUgo=
X-Received: by 2002:a19:82c4:: with SMTP id e187mr3041568lfd.106.1574156667828; 
 Tue, 19 Nov 2019 01:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20191113073539.9660-1-hch@lst.de>
 <CGME20191113073648epcas3p214f97ad5937559bebbc937e507fa54d9@epcas3p2.samsung.com>
 <20191113073539.9660-2-hch@lst.de>
 <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
In-Reply-To: <1c227c91-512c-e871-0e03-a27b2c0435d7@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 19 Nov 2019 17:44:16 +0800
X-Gmail-Original-Message-ID: <CAJKOXPdM1+x_4PQ1AfoPY6GuV0e9bk3hv_1EfEdHcLjMwwYxgw@mail.gmail.com>
Message-ID: <CAJKOXPdM1+x_4PQ1AfoPY6GuV0e9bk3hv_1EfEdHcLjMwwYxgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-direct: unify the dma_capable definitions
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 19 Nov 2019 at 17:27, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Christoph,
>
> On 13.11.2019 08:35, Christoph Hellwig wrote:
> > Currently each architectures that wants to override dma_to_phys and
> > phys_to_dma also has to provide dma_capable.  But there isn't really
> > any good reason for that.  powerpc and mips just have copies of the
> > generic one minus the latests fix, and the arm one was the inspiration
> > for said fix, but misses the bus_dma_mask handling.
> > Make all architectures use the generic version instead.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> This patch breaks DMAengine PL330 driver on Samsung Exynos SoCs:


Thanks Marek for bisecting it. I wonder whether it is also the cause
for boot failures I see on NXP Vybrid VF50 SoC (NXP/Freescale
fsl-edma) since few days:

[ 2.853428] fsl-edma 40018000.dma-controller: overflow 0x40027007+1 of
DMA mask ffffffff bus mask 0
[ 2.862566] ------------[ cut here ]------------
[ 2.867273] WARNING: CPU: 0 PID: 1 at
/home/buildbot/worker/builddir_yocto/build/build/tmp/work-shared/col-vf50-proceq-mainline-next/kernel-source/kernel/dma/direct.c:35
report_addr+0xc0/0xfc
[ 2.884380] Modules linked in:
[ 2.887486] CPU: 0 PID: 1 Comm: swapper Tainted: G W
5.4.0-rc7-next-20191118-g519ead8f6a32 #1
[ 2.897364] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[ 2.903892] [<8010ddfc>] (unwind_backtrace) from [<8010b4b8>]
(show_stack+0x10/0x14)
[ 2.911712] [<8010b4b8>] (show_stack) from [<8011b08c>] (__warn+0xd4/0xec)
[ 2.918653] [<8011b08c>] (__warn) from [<8011b154>]
(warn_slowpath_fmt+0xb0/0xb8)
[ 2.926218] [<8011b154>] (warn_slowpath_fmt) from [<80155f7c>]
(report_addr+0xc0/0xfc)
[ 2.934221] [<80155f7c>] (report_addr) from [<801561f0>]
(dma_direct_map_resource+0x98/0xa4)
[ 2.942744] [<801561f0>] (dma_direct_map_resource) from [<8041d5d4>]
(fsl_edma_prep_slave_dma+0x12c/0x150)
[ 2.952475] [<8041d5d4>] (fsl_edma_prep_slave_dma) from [<8041d8cc>]
(fsl_edma_prep_dma_cyclic+0x30/0x21c)
[ 2.962213] [<8041d8cc>] (fsl_edma_prep_dma_cyclic) from [<80452e10>]
(lpuart_rx_dma_startup+0x188/0x36c)
[ 2.971871] [<80452e10>] (lpuart_rx_dma_startup) from [<80453058>]
(lpuart_startup+0x64/0x78)
[ 2.980477] [<80453058>] (lpuart_startup) from [<8044e924>]
(uart_startup.part.7+0x110/0x23c)
[ 2.989080] [<8044e924>] (uart_startup.part.7) from [<8044eaa0>]
(uart_port_activate+0x50/0x7c)
[ 2.997857] [<8044eaa0>] (uart_port_activate) from [<80438dc0>]
(tty_port_open+0x74/0xc0)
[ 3.006111] [<80438dc0>] (tty_port_open) from [<8044be30>] (uart_open+0x18/0x20)
[ 3.013588] [<8044be30>] (uart_open) from [<80431b4c>] (tty_open+0x108/0x428)
[ 3.020794] [<80431b4c>] (tty_open) from [<801edb48>] (chrdev_open+0xac/0x164)
[ 3.028098] [<801edb48>] (chrdev_open) from [<801e55c8>]
(do_dentry_open+0x22c/0x3e4)
[ 3.036010] [<801e55c8>] (do_dentry_open) from [<801f72a8>]
(path_openat+0x4a4/0xf78)
[ 3.043912] [<801f72a8>] (path_openat) from [<801f8d34>]
(do_filp_open+0x70/0xdc)
[ 3.051472] [<801f8d34>] (do_filp_open) from [<801e6998>]
(do_sys_open+0x128/0x1f4)
[ 3.059217] [<801e6998>] (do_sys_open) from [<80a00ee0>]
(kernel_init_freeable+0x150/0x1c4)
[ 3.067658] [<80a00ee0>] (kernel_init_freeable) from [<8068e208>]
(kernel_init+0x8/0x110)
[ 3.075917] [<8068e208>] (kernel_init) from [<801010e8>]
(ret_from_fork+0x14/0x2c)
[ 3.083539] Exception stack(0x86843fb0 to 0x86843ff8)
[ 3.088631] 3fa0: 00000000 00000000 00000000 00000000
[ 3.096866] 3fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 3.105103] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 3.111752] ---[ end trace 6fb699802256a309 ]---
[    3.116423] fsl-lpuart 40027000.serial: Cannot prepare cyclic DMA
[    3.192968] VFS: Mounted root (nfs4 filesystem) on device 0:13.
[    3.201432] devtmpfs: mounted
[    3.210985] Freeing unused kernel memory: 1024K
[    3.217854] Run /sbin/init as init process
[    4.643355] systemd[1]: System time before build time, advancing clock.
[    4.774106] random: systemd: uninitialized urandom read (16 bytes read)
[    4.838361] systemd[1]: systemd 232 running in system mode. (-PAM
-AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP
-GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN)
[    4.858997] systemd[1]: Detected architecture arm.
[    4.873438] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
[    4.880138] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
[    4.886585] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
[    4.893124] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
[    4.899679] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
[    4.906110] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!
[    4.912616] fsl-lpuart 40027000.serial: Cannot prepare TX slave DMA!

Although maybe that's just the fsl-edma problem?

Best regards,
Krzysztof
