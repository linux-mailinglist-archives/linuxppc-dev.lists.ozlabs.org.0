Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B33BC297
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 20:26:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJYzh62DSz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 04:26:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iDDeq0gF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iDDeq0gF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJYyy1c5Cz2yMb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 04:25:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EF286196A;
 Mon,  5 Jul 2021 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625509542;
 bh=mbcpHj8XBt5iMEhvbU1Nh5o3DrHiZgXU00JBrEPy2RM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDDeq0gFEKabzE/sekGHl5pLUXZw6j2n0L7sik99RCdDOJQvhixmdSPVrIQUeVLDU
 6FozffXRB4laWf42/q0WCSqGTlsQQFMxRVLtF6YwJX36GxT0DJ33OJ22XGtIxcnP3i
 VaxVpcC/7U63r4feJhVHKIWxTQX/Y2/e16KCRl5sTNhOtpOIzm1NYNnL9ObWJ/obdb
 56CtvsI419asd9PPLQQSjDsD5JdrUkZBbP0iQdjT/sDmINHmZJlIRiTG4VYiDotS+A
 LqNrpmhgTo3tRFboXDUv29YINMZcvjx8XrWGuvTcCeU2vl6xMFrlokFPnyVilv36LW
 n0xMlR7bBMo+Q==
Date: Mon, 5 Jul 2021 11:25:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YONOn1FEMufoTy80@Ryzen-9-3900X.localdomain>
References: <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
 <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <CALiNf2_ZJq4MoxOGe_m_KFv5xYw8t9SdscTFUwSoLBy5rEuxwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/SG/dXypw7vuCiM3"
Content-Disposition: inline
In-Reply-To: <CALiNf2_ZJq4MoxOGe_m_KFv5xYw8t9SdscTFUwSoLBy5rEuxwQ@mail.gmail.com>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/SG/dXypw7vuCiM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claire,

On Mon, Jul 05, 2021 at 03:29:34PM +0800, Claire Chang wrote:
> Looking at the logs, the use-after-free bug looked somehow relevant
> (and it's nvme again. Qian's crash is about nvme too):
> 
> [    2.468288] BUG: KASAN: use-after-free in __iommu_dma_unmap_swiotlb+0x64/0xb0
> [    2.468288] Read of size 8 at addr ffff8881d7830000 by task swapper/0/0
> 
> [    2.468288] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3-debug #1
> [    2.468288] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
> [    2.468288] Call Trace:
> [    2.468288]  <IRQ>
> [    2.479433]  dump_stack+0x9c/0xcf
> [    2.479433]  print_address_description.constprop.0+0x18/0x130
> [    2.479433]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
> [    2.479433]  kasan_report.cold+0x7f/0x111
> [    2.479433]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
> [    2.479433]  __iommu_dma_unmap_swiotlb+0x64/0xb0
> [    2.479433]  nvme_pci_complete_rq+0x73/0x130
> [    2.479433]  blk_complete_reqs+0x6f/0x80
> [    2.479433]  __do_softirq+0xfc/0x3be
> [    2.479433]  irq_exit_rcu+0xce/0x120
> [    2.479433]  common_interrupt+0x80/0xa0
> [    2.479433]  </IRQ>
> [    2.479433]  asm_common_interrupt+0x1e/0x40
> [    2.479433] RIP: 0010:cpuidle_enter_state+0xf9/0x590
> 
> I wonder if this ended up unmapping something wrong and messing up the
> dev->dma_io_tlb_mem (i.e. io_tlb_default_mem)?
> 
> Could you try this patch on top of 7d31f1c65cc9? This patch helps
> check if we try to unmap the wrong address.
> 
> ```
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index b7f76bca89bf..5ac08d50a394 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -613,6 +613,21 @@ void swiotlb_tbl_unmap_single(struct device *dev,
> phys_addr_t tlb_addr,
>                               size_t mapping_size, enum dma_data_direction dir,
>                               unsigned long attrs)
>  {
> +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> +       unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
> +       int index;
> +
> +       if (!is_swiotlb_buffer(dev, tlb_addr - offset)) {
> +               dev_err(dev, "%s: attempt to unmap invalid address
> (0x%llx, offset=%u)\n", __func__, tlb_addr, offset);
> +               return;
> +       }
> +
> +       index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
> +       if (mem->slots[index].orig_addr == INVALID_PHYS_ADDR) {
> +               dev_err(dev, "%s: memory is not mapped before (0x%llx,
> offset=%u)\n", __func__, tlb_addr, offset);
> +               return;
> +       }
> +
>         /*
>          * First, sync the memory before unmapping the entry
>          */
> ```
> It might be useful to have CONFIG_SLUB_DEBUG=y, CONFIG_SLUB_DEBUG_ON=y
> and line numbers (scripts/decode_stacktrace.sh) too.
> 
> Thank you so much for helping!

Please find attached logs both decoded and not decoded, with
CONFIG_KASAN=y + CONFIG_SLUB_DEBUG_ON=y with the requested patch applied
on top of 7d31f1c65cc9.

If there is any further information I can provide, please let me know!

Cheers,
Nathan

--/SG/dXypw7vuCiM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="7d31f1c65cc9-debug-1-original.log"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 5.12.0-rc3-debug-00033-g167e3e00e2be (nathan@a=
rchlinux-ax161) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PRE=
EMPT Mon Jul 5 10:52:15 MST 2021
[    0.000000] Command line: initrd=3D\amd-ucode.img initrd=3D\initramfs-li=
nux-debug.img root=3DPARTUUID=3D8680aa0c-cf09-4a69-8cf3-970478040ee7 rw int=
el_pstate=3Dno_hwp
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009c0ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009c10000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a20cfff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20d000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000b838ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b8390000-0x00000000b86c5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000b8a15000-0x00000000badfefff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000badff000-0x00000000bbffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bc000000-0x00000000bdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000bf000000-0x00000000bfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd200000-0x00000000fd2fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd600000-0x00000000fd6fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000081f37ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000081f380000-0x000000083fffffff] reser=
ved
[    0.000000] intel_pstate: HWP disabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xb4c66018-0xb4c73457] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xb4c66018-0xb4c73457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009c0ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009c10000-0x0000000009ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a20cf=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20d000-0x000000000affff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000b4c660=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000b4c66018-0x00000000b4c734=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000b4c73458-0x00000000b838ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000b8390000-0x00000000b86c5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000b86c6000-0x00000000b8721f=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000b8722000-0x00000000b8a14f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000b8a15000-0x00000000badfef=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000badff000-0x00000000bbffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000bc000000-0x00000000bdffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000bf000000-0x00000000bfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd200000-0x00000000fd2fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd600000-0x00000000fd6fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000081f37ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000081f380000-0x000000083fffff=
ff] reserved
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi: ACPI=3D0xb8721000 ACPI 2.0=3D0xb8721014 TPMFinalLog=3D0=
xb89c8000 SMBIOS=3D0xbac0f000 SMBIOS 3.0=3D0xbac0e000 MEMATTR=3D0xb5183018 =
ESRT=3D0xb6cf5018 RNG=3D0xbac3e998 TPMEventLog=3D0xb5184018=20
[    0.000000] efi: seeding entropy pool
[    0.000000] SMBIOS 3.3.0 present.
[    0.000000] DMI: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3792.936 MHz processor
[    0.000280] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000287] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000309] last_pfn =3D 0x81f380 max_arch_pfn =3D 0x400000000
[    0.000615] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.001571] e820: update [mem 0xc0000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.001586] last_pfn =3D 0xbc000 max_arch_pfn =3D 0x400000000
[    0.006163] esrt: Reserving ESRT space from 0x00000000b6cf5018 to 0x0000=
0000b6cf5050.
[    0.006185] e820: update [mem 0xb6cf5000-0xb6cf5fff] usable =3D=3D> rese=
rved
[    0.006628] check: Scanning 1 areas for low memory corruption
[    0.006637] Using GB pages for direct mapping
[    0.012545] Secure boot disabled
[    0.012547] RAMDISK: [mem 0x7f7c7000-0x7fff5fff]
[    0.012570] ACPI: Early table checksum verification disabled
[    0.012577] ACPI: RSDP 0x00000000B8721014 000024 (v02 HPQOEM)
[    0.012586] ACPI: XSDT 0x00000000B8720728 0000EC (v01 HPQOEM SLIC-CPC 01=
072009 AMI  01000013)
[    0.012598] ACPI: FACP 0x00000000B870F000 000114 (v06 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012612] ACPI: DSDT 0x00000000B86FE000 01050C (v02 HPQOEM SLIC-CPC 01=
072009 INTL 20120913)
[    0.012622] ACPI: FACS 0x00000000B89F8000 000040
[    0.012630] ACPI: MSDM 0x00000000B871F000 000055 (v03 HPQOEM SLIC-CPC 01=
072009 AMI  01000013)
[    0.012638] ACPI: SSDT 0x00000000B871E000 000050 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012646] ACPI: IVRS 0x00000000B871D000 0000D0 (v02 HPQOEM SLIC-CPC 00=
000001 AMD  00000000)
[    0.012654] ACPI: SSDT 0x00000000B8715000 007229 (v02 HPQOEM SLIC-CPC 00=
000002 MSFT 04000000)
[    0.012662] ACPI: SSDT 0x00000000B8711000 003BA1 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012670] ACPI: SSDT 0x00000000B8710000 000094 (v02 HPQOEM SLIC-CPC 01=
072009 AMI  01072009)
[    0.012678] ACPI: FIDT 0x00000000B86FD000 00009C (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012686] ACPI: MCFG 0x00000000B86FC000 00003C (v01 HPQOEM SLIC-CPC 01=
072009 MSFT 00010013)
[    0.012694] ACPI: HPET 0x00000000B86FB000 000038 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00000005)
[    0.012702] ACPI: VFCT 0x00000000B86ED000 00D484 (v01 HPQOEM SLIC-CPC 00=
000001 AMD  31504F47)
[    0.012710] ACPI: BGRT 0x00000000B86EC000 000038 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012718] ACPI: TPM2 0x00000000B86EB000 00004C (v04 HPQOEM SLIC-CPC 00=
000001 AMI  00000000)
[    0.012726] ACPI: SSDT 0x00000000B86E9000 001CE4 (v02 HPQOEM SLIC-CPC 00=
000001 AMD  00000001)
[    0.012734] ACPI: CRAT 0x00000000B86E8000 0007E8 (v01 HPQOEM SLIC-CPC 00=
000001 AMD  00000001)
[    0.012742] ACPI: CDIT 0x00000000B86E7000 000029 (v01 HPQOEM SLIC-CPC 00=
000001 AMD  00000001)
[    0.012750] ACPI: SSDT 0x00000000B86E6000 000D37 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012758] ACPI: SSDT 0x00000000B86E4000 0010A5 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012765] ACPI: SSDT 0x00000000B86E0000 00333E (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012773] ACPI: SSDT 0x00000000B86DF000 0000BF (v01 HPQOEM SLIC-CPC 00=
001000 INTL 20120913)
[    0.012781] ACPI: WSMT 0x00000000B86DE000 000028 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012789] ACPI: APIC 0x00000000B86DD000 00015E (v03 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012797] ACPI: SSDT 0x00000000B86DC000 000517 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012805] ACPI: SSDT 0x00000000B86DA000 0010AF (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012813] ACPI: FPDT 0x00000000B86D9000 000044 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  01000013)
[    0.012827] ACPI: Local APIC address 0xfee00000
[    0.013152] No NUMA configuration found
[    0.013154] Faking a node at [mem 0x0000000000000000-0x000000081f37ffff]
[    0.013164] NODE_DATA(0) allocated [mem 0x81f37c000-0x81f37ffff]
[    0.013278] Zone ranges:
[    0.013280]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.013284]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.013288]   Normal   [mem 0x0000000100000000-0x000000081f37ffff]
[    0.013292]   Device   empty
[    0.013295] Movable zone start for each node
[    0.013297] Early memory node ranges
[    0.013298]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.013301]   node   0: [mem 0x0000000000100000-0x0000000009c0ffff]
[    0.013304]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.013306]   node   0: [mem 0x000000000a20d000-0x000000000affffff]
[    0.013309]   node   0: [mem 0x000000000b020000-0x00000000b838ffff]
[    0.013312]   node   0: [mem 0x00000000badff000-0x00000000bbffffff]
[    0.013314]   node   0: [mem 0x0000000100000000-0x000000081f37ffff]
[    0.013322] Initmem setup node 0 [mem 0x0000000000001000-0x000000081f37f=
fff]
[    0.013326] On node 0 totalpages: 8225939
[    0.013329]   DMA zone: 64 pages used for memmap
[    0.013331]   DMA zone: 26 pages reserved
[    0.013334]   DMA zone: 3999 pages, LIFO batch:0
[    0.015777]   DMA zone: 28769 pages in unavailable ranges
[    0.015779]   DMA32 zone: 11782 pages used for memmap
[    0.015781]   DMA32 zone: 754036 pages, LIFO batch:63
[    0.059946]   DMA32 zone: 28300 pages in unavailable ranges
[    0.059954]   Normal zone: 116686 pages used for memmap
[    0.059956]   Normal zone: 7467904 pages, LIFO batch:63
[    0.477178]   Normal zone: 3200 pages in unavailable ranges
[    0.918352] kasan: KernelAddressSanitizer initialized
[    0.918877] ACPI: PM-Timer IO Port: 0x808
[    0.918881] ACPI: Local APIC address 0xfee00000
[    0.918894] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.918911] IOAPIC[0]: apic_id 9, version 33, address 0xfec00000, GSI 0-=
23
[    0.918918] IOAPIC[1]: apic_id 10, version 33, address 0xfec01000, GSI 2=
4-55
[    0.918923] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.918927] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.918931] ACPI: IRQ0 used by override.
[    0.918934] ACPI: IRQ9 used by override.
[    0.918939] Using ACPI (MADT) for SMP configuration information
[    0.918942] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.918969] e820: update [mem 0xb5158000-0xb517ffff] usable =3D=3D> rese=
rved
[    0.919000] smpboot: Allowing 32 CPUs, 24 hotplug CPUs
[    0.919115] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.919122] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.919129] PM: hibernation: Registered nosave memory: [mem 0x09c10000-0=
x09ffffff]
[    0.919136] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a20cfff]
[    0.919143] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0=
x0b01ffff]
[    0.919150] PM: hibernation: Registered nosave memory: [mem 0xb4c66000-0=
xb4c66fff]
[    0.919157] PM: hibernation: Registered nosave memory: [mem 0xb4c73000-0=
xb4c73fff]
[    0.919164] PM: hibernation: Registered nosave memory: [mem 0xb5158000-0=
xb517ffff]
[    0.919171] PM: hibernation: Registered nosave memory: [mem 0xb6cf5000-0=
xb6cf5fff]
[    0.919179] PM: hibernation: Registered nosave memory: [mem 0xb8390000-0=
xb86c5fff]
[    0.919181] PM: hibernation: Registered nosave memory: [mem 0xb86c6000-0=
xb8721fff]
[    0.919183] PM: hibernation: Registered nosave memory: [mem 0xb8722000-0=
xb8a14fff]
[    0.919186] PM: hibernation: Registered nosave memory: [mem 0xb8a15000-0=
xbadfefff]
[    0.919193] PM: hibernation: Registered nosave memory: [mem 0xbc000000-0=
xbdffffff]
[    0.919196] PM: hibernation: Registered nosave memory: [mem 0xbe000000-0=
xbeffffff]
[    0.919198] PM: hibernation: Registered nosave memory: [mem 0xbf000000-0=
xbfffffff]
[    0.919201] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0=
xefffffff]
[    0.919203] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0=
xf7ffffff]
[    0.919205] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0=
xfd1fffff]
[    0.919208] PM: hibernation: Registered nosave memory: [mem 0xfd200000-0=
xfd2fffff]
[    0.919210] PM: hibernation: Registered nosave memory: [mem 0xfd300000-0=
xfd5fffff]
[    0.919213] PM: hibernation: Registered nosave memory: [mem 0xfd600000-0=
xfd6fffff]
[    0.919215] PM: hibernation: Registered nosave memory: [mem 0xfd700000-0=
xfe9fffff]
[    0.919217] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0=
xfea0ffff]
[    0.919220] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0=
xfeb7ffff]
[    0.919222] PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0=
xfec01fff]
[    0.919225] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0=
xfec0ffff]
[    0.919227] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0=
xfec10fff]
[    0.919229] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0=
xfec2ffff]
[    0.919232] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0=
xfec30fff]
[    0.919234] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0=
xfecfffff]
[    0.919237] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.919239] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed3ffff]
[    0.919241] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0=
xfed44fff]
[    0.919244] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0=
xfed7ffff]
[    0.919246] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfed8ffff]
[    0.919249] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0=
xfedc1fff]
[    0.919251] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0=
xfedcffff]
[    0.919253] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0=
xfedd3fff]
[    0.919256] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0=
xfedd5fff]
[    0.919258] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0=
xfeffffff]
[    0.919261] PM: hibernation: Registered nosave memory: [mem 0xff000000-0=
xffffffff]
[    0.919266] [mem 0xc0000000-0xefffffff] available for PCI devices
[    0.919270] Booting paravirtualized kernel on bare hardware
[    0.919274] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.927878] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:32 =
nr_node_ids:1
[    0.929637] percpu: Embedded 64 pages/cpu s225280 r8192 d28672 u262144
[    0.929671] pcpu-alloc: s225280 r8192 d28672 u262144 alloc=3D1*2097152
[    0.929677] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 1=
3 14 15=20
[    0.929704] pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 2=
9 30 31=20
[    0.929806] Built 1 zonelists, mobility grouping on.  Total pages: 80973=
81
[    0.929809] Policy zone: Normal
[    0.929812] Kernel command line: initrd=3D\amd-ucode.img initrd=3D\initr=
amfs-linux-debug.img root=3DPARTUUID=3D8680aa0c-cf09-4a69-8cf3-970478040ee7=
 rw intel_pstate=3Dno_hwp
[    0.929899] printk: log_buf_len individual max cpu contribution: 4096 by=
tes
[    0.929901] printk: log_buf_len total cpu_extra contributions: 126976 by=
tes
[    0.929903] printk: log_buf_len min size: 131072 bytes
[    0.930262] printk: log_buf_len: 262144 bytes
[    0.930264] printk: early log buf free: 114328(87%)
[    0.933977] Dentry cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes, linear)
[    0.935848] Inode-cache hash table entries: 2097152 (order: 12, 16777216=
 bytes, linear)
[    0.936118] mem auto-init: stack:off, heap alloc:on, heap free:off
[    1.642466] Memory: 27987960K/32903756K available (20488K kernel code, 7=
279K rwdata, 8472K rodata, 2012K init, 5244K bss, 4915540K reserved, 0K cma=
-reserved)
[    1.642480] random: get_random_u64 called from __kmem_cache_create+0x2a/=
0x540 with crng_init=3D0
[    1.643591] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D32, =
Nodes=3D1
[    1.643651] ftrace: allocating 41986 entries in 165 pages
[    1.667334] ftrace: allocated 165 pages with 4 groups
[    1.668416] rcu: Preemptible hierarchical RCU implementation.
[    1.668418] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[    1.668420] rcu: 	RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_ids=
=3D32.
[    1.668422] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    1.668425] 	Trampoline variant of Tasks RCU enabled.
[    1.668427] 	Rude variant of Tasks RCU enabled.
[    1.668428] 	Tracing variant of Tasks RCU enabled.
[    1.668430] rcu: RCU calculated value of scheduler-enlistment delay is 3=
0 jiffies.
[    1.668432] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D32
[    1.700587] NR_IRQS: 20736, nr_irqs: 1224, preallocated irqs: 16
[    1.701467] Console: colour dummy device 80x25
[    1.701534] printk: console [tty0] enabled
[    1.701628] ACPI: Core revision 20210105
[    1.703688] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    1.703717] APIC: Switch to symmetric I/O mode setup
[    1.705705] Switched APIC routing to physical flat.
[    1.707227] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    1.723724] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x6d588d6a09c, max_idle_ns: 881590727049 ns
[    1.723739] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 7588.95 BogoMIPS (lpj=3D12643120)
[    1.723745] pid_max: default: 32768 minimum: 301
[    1.733354] LSM: Security Framework initializing
[    1.733395] Yama: becoming mindful.
[    1.733644] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s, linear)
[    1.733718] Mountpoint-cache hash table entries: 65536 (order: 7, 524288=
 bytes, linear)
[    1.735662] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    1.735762] LVT offset 1 assigned for vector 0xf9
[    1.735819] LVT offset 2 assigned for vector 0xf4
[    1.735836] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    1.735839] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    1.735845] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    1.735849] Spectre V2 : Mitigation: Full AMD retpoline
[    1.735851] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    1.735853] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    1.735855] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    1.735858] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    1.735860] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    1.736225] Freeing SMP alternatives memory: 32K
[    1.844242] smpboot: CPU0: AMD Ryzen 3 4300G with Radeon Graphics (famil=
y: 0x17, model: 0x60, stepping: 0x1)
[    1.845243] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    1.845254] ... version:                0
[    1.845256] ... bit width:              48
[    1.845258] ... generic registers:      6
[    1.845259] ... value mask:             0000ffffffffffff
[    1.845261] ... max period:             00007fffffffffff
[    1.845263] ... fixed-purpose events:   0
[    1.845265] ... event mask:             000000000000003f
[    1.845496] rcu: Hierarchical SRCU implementation.
[    1.849560] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    1.852535] smp: Bringing up secondary CPUs ...
[    1.853409] x86: Booting SMP configuration:
[    1.853412] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
[    1.874254] smp: Brought up 1 node, 8 CPUs
[    1.874260] smpboot: Max logical packages: 4
[    1.874262] smpboot: Total of 8 processors activated (60711.60 BogoMIPS)
[    1.882108] devtmpfs: initialized
[    1.882108] x86/mm: Memory block size: 128MB
[    1.931108] PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20cfff] =
(53248 bytes)
[    1.931108] PM: Registering ACPI NVS region [mem 0xb8722000-0xb8a14fff] =
(3092480 bytes)
[    1.935783] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    1.935824] futex hash table entries: 8192 (order: 7, 524288 bytes, line=
ar)
[    1.936354] pinctrl core: initialized pinctrl subsystem
[    1.937662] PM: RTC time: 18:01:44, date: 2021-07-05
[    1.938802] NET: Registered protocol family 16
[    1.940659] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    1.941182] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    1.941702] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    1.941826] audit: initializing netlink subsys (disabled)
[    1.941904] audit: type=3D2000 audit(1625508104.233:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    1.944097] thermal_sys: Registered thermal governor 'fair_share'
[    1.944100] thermal_sys: Registered thermal governor 'bang_bang'
[    1.944102] thermal_sys: Registered thermal governor 'step_wise'
[    1.944104] thermal_sys: Registered thermal governor 'user_space'
[    1.944106] thermal_sys: Registered thermal governor 'power_allocator'
[    1.944183] cpuidle: using governor ladder
[    1.944183] cpuidle: using governor menu
[    1.944183] ACPI: bus type PCI registered
[    1.944183] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    1.944828] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000=
-0xf7ffffff] (base 0xf0000000)
[    1.944842] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
[    1.950889] PCI: Using configuration type 1 for base access
[    1.983636] Kprobes globally optimized
[    1.983989] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    1.983989] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.992155] ACPI: Added _OSI(Module Device)
[    1.992159] ACPI: Added _OSI(Processor Device)
[    1.992161] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.992163] ACPI: Added _OSI(Processor Aggregator Device)
[    1.992180] ACPI: Added _OSI(Linux-Dell-Video)
[    1.992194] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    1.992207] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    2.797646] ACPI: 12 ACPI AML tables successfully acquired and loaded
[    2.847458] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    3.194961] ACPI: EC: EC started
[    3.194966] ACPI: EC: interrupt blocked
[    3.195008] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    3.195018] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle tran=
sactions
[    3.195024] ACPI: Interpreter enabled
[    3.195193] ACPI: (supports S0 S3 S4 S5)
[    3.195196] ACPI: Using IOAPIC for interrupt routing
[    3.200393] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    3.215236] ACPI: Enabled 4 GPEs in block 00 to 1F
[    3.580211] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    3.580251] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    3.588446] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g AER LTR DPC]
[    3.596390] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[    3.596579] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus 00-7f] only partially covers this bridge
[    3.610071] PCI host bridge to bus 0000:00
[    3.610083] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    3.610096] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    3.610107] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    3.610118] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    3.610130] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    3.610141] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dfff=
f window]
[    3.610152] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfec2fff=
f window]
[    3.610163] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xfffffff=
f window]
[    3.610176] pci_bus 0000:00: root bus resource [bus 00-ff]
[    3.610333] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
[    3.612614] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
[    3.614862] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
[    3.616444] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
[    3.618052] pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
[    3.618078] pci 0000:00:02.1: enabling Extended Tags
[    3.618183] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    3.622301] pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
[    3.622328] pci 0000:00:02.2: enabling Extended Tags
[    3.622432] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    3.625017] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
[    3.626612] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
[    3.626637] pci 0000:00:08.1: enabling Extended Tags
[    3.626737] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    3.629320] pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
[    3.629345] pci 0000:00:08.2: enabling Extended Tags
[    3.629445] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    3.632062] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    3.634325] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    3.636604] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
[    3.638170] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
[    3.639716] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
[    3.641299] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
[    3.642859] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
[    3.644429] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
[    3.645990] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
[    3.647557] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
[    3.650047] pci 0000:01:00.0: [1022:43d1] type 00 class 0x0c0330
[    3.650068] pci 0000:01:00.0: reg 0x10: [mem 0xfcda0000-0xfcda7fff 64bit]
[    3.650111] pci 0000:01:00.0: enabling Extended Tags
[    3.650313] pci 0000:01:00.0: PME# supported from D3hot D3cold
[    3.651859] pci 0000:01:00.1: [1022:43c8] type 00 class 0x010601
[    3.651897] pci 0000:01:00.1: reg 0x24: [mem 0xfcd80000-0xfcd9ffff]
[    3.651905] pci 0000:01:00.1: reg 0x30: [mem 0xfcd00000-0xfcd7ffff pref]
[    3.651914] pci 0000:01:00.1: enabling Extended Tags
[    3.652099] pci 0000:01:00.1: PME# supported from D3hot D3cold
[    3.660042] pci 0000:01:00.2: [1022:43c6] type 01 class 0x060400
[    3.660088] pci 0000:01:00.2: enabling Extended Tags
[    3.660269] pci 0000:01:00.2: PME# supported from D3hot D3cold
[    3.661760] pci 0000:00:02.1: PCI bridge to [bus 01-0a]
[    3.661766] pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
[    3.661771] pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
[    3.664265] pci 0000:02:00.0: [1022:43c7] type 01 class 0x060400
[    3.664314] pci 0000:02:00.0: enabling Extended Tags
[    3.664573] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    3.666425] pci 0000:02:01.0: [1022:43c7] type 01 class 0x060400
[    3.666473] pci 0000:02:01.0: enabling Extended Tags
[    3.666735] pci 0000:02:01.0: PME# supported from D3hot D3cold
[    3.668564] pci 0000:02:02.0: [1022:43c7] type 01 class 0x060400
[    3.668612] pci 0000:02:02.0: enabling Extended Tags
[    3.668876] pci 0000:02:02.0: PME# supported from D3hot D3cold
[    3.670718] pci 0000:02:03.0: [1022:43c7] type 01 class 0x060400
[    3.670766] pci 0000:02:03.0: enabling Extended Tags
[    3.671027] pci 0000:02:03.0: PME# supported from D3hot D3cold
[    3.672863] pci 0000:02:04.0: [1022:43c7] type 01 class 0x060400
[    3.672912] pci 0000:02:04.0: enabling Extended Tags
[    3.673170] pci 0000:02:04.0: PME# supported from D3hot D3cold
[    3.675020] pci 0000:02:05.0: [1022:43c7] type 01 class 0x060400
[    3.675069] pci 0000:02:05.0: enabling Extended Tags
[    3.675331] pci 0000:02:05.0: PME# supported from D3hot D3cold
[    3.677201] pci 0000:02:06.0: [1022:43c7] type 01 class 0x060400
[    3.677249] pci 0000:02:06.0: enabling Extended Tags
[    3.677509] pci 0000:02:06.0: PME# supported from D3hot D3cold
[    3.679360] pci 0000:02:07.0: [1022:43c7] type 01 class 0x060400
[    3.679408] pci 0000:02:07.0: enabling Extended Tags
[    3.679668] pci 0000:02:07.0: PME# supported from D3hot D3cold
[    3.681502] pci 0000:01:00.2: PCI bridge to [bus 02-0a]
[    3.681510] pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
[    3.681516] pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
[    3.682091] pci 0000:02:00.0: PCI bridge to [bus 03]
[    3.682671] pci 0000:02:01.0: PCI bridge to [bus 04]
[    3.683240] pci 0000:02:02.0: PCI bridge to [bus 05]
[    3.683819] pci 0000:02:03.0: PCI bridge to [bus 06]
[    3.684392] pci 0000:02:04.0: PCI bridge to [bus 07]
[    3.684675] pci 0000:02:05.0: PCI bridge to [bus 08]
[    3.685027] pci 0000:09:00.0: [10ec:c821] type 00 class 0x028000
[    3.685056] pci 0000:09:00.0: reg 0x10: [io  0xe000-0xe0ff]
[    3.685091] pci 0000:09:00.0: reg 0x18: [mem 0xfcc00000-0xfcc0ffff 64bit]
[    3.685567] pci 0000:09:00.0: supports D1 D2
[    3.685570] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    3.686427] pci 0000:02:06.0: PCI bridge to [bus 09]
[    3.686434] pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
[    3.686439] pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
[    3.686767] pci 0000:0a:00.0: [10ec:8168] type 00 class 0x020000
[    3.686797] pci 0000:0a:00.0: reg 0x10: [io  0xd000-0xd0ff]
[    3.686836] pci 0000:0a:00.0: reg 0x18: [mem 0xfcb04000-0xfcb04fff 64bit]
[    3.686862] pci 0000:0a:00.0: reg 0x20: [mem 0xfcb00000-0xfcb03fff 64bit]
[    3.687312] pci 0000:0a:00.0: supports D1 D2
[    3.687314] pci 0000:0a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    3.688181] pci 0000:02:07.0: PCI bridge to [bus 0a]
[    3.688188] pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
[    3.688193] pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    3.688810] pci 0000:0b:00.0: [1c5c:1339] type 00 class 0x010802
[    3.688830] pci 0000:0b:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
[    3.689078] pci 0000:0b:00.0: supports D1
[    3.689080] pci 0000:0b:00.0: PME# supported from D0 D1 D3hot
[    3.689157] pci 0000:0b:00.0: 15.752 Gb/s available PCIe bandwidth, limi=
ted by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 31.504 Gb/s with 8=
=2E0 GT/s PCIe x4 link)
[    3.689819] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    3.689825] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
[    3.691693] pci 0000:0c:00.0: [1002:1636] type 00 class 0x030000
[    3.691707] pci 0000:0c:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit=
 pref]
[    3.691717] pci 0000:0c:00.0: reg 0x18: [mem 0xe0000000-0xe01fffff 64bit=
 pref]
[    3.691725] pci 0000:0c:00.0: reg 0x20: [io  0xf000-0xf0ff]
[    3.691733] pci 0000:0c:00.0: reg 0x24: [mem 0xfca00000-0xfca7ffff]
[    3.691744] pci 0000:0c:00.0: enabling Extended Tags
[    3.691887] pci 0000:0c:00.0: BAR 0: assigned to efifb
[    3.691937] pci 0000:0c:00.0: PME# supported from D1 D2 D3hot D3cold
[    3.691975] pci 0000:0c:00.0: 126.016 Gb/s available PCIe bandwidth, lim=
ited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s wit=
h 16.0 GT/s PCIe x16 link)
[    3.693671] pci 0000:0c:00.1: [1002:1637] type 00 class 0x040300
[    3.693682] pci 0000:0c:00.1: reg 0x10: [mem 0xfca88000-0xfca8bfff]
[    3.693706] pci 0000:0c:00.1: enabling Extended Tags
[    3.693878] pci 0000:0c:00.1: PME# supported from D1 D2 D3hot D3cold
[    3.695558] pci 0000:0c:00.2: [1022:15df] type 00 class 0x108000
[    3.695574] pci 0000:0c:00.2: reg 0x18: [mem 0xfc900000-0xfc9fffff]
[    3.695587] pci 0000:0c:00.2: reg 0x24: [mem 0xfca8c000-0xfca8dfff]
[    3.695596] pci 0000:0c:00.2: enabling Extended Tags
[    3.697366] pci 0000:0c:00.3: [1022:1639] type 00 class 0x0c0330
[    3.697382] pci 0000:0c:00.3: reg 0x10: [mem 0xfc800000-0xfc8fffff 64bit]
[    3.697409] pci 0000:0c:00.3: enabling Extended Tags
[    3.697581] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    3.699262] pci 0000:0c:00.4: [1022:1639] type 00 class 0x0c0330
[    3.699276] pci 0000:0c:00.4: reg 0x10: [mem 0xfc700000-0xfc7fffff 64bit]
[    3.699303] pci 0000:0c:00.4: enabling Extended Tags
[    3.699470] pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
[    3.701157] pci 0000:0c:00.6: [1022:15e3] type 00 class 0x040300
[    3.701168] pci 0000:0c:00.6: reg 0x10: [mem 0xfca80000-0xfca87fff]
[    3.701192] pci 0000:0c:00.6: enabling Extended Tags
[    3.701357] pci 0000:0c:00.6: PME# supported from D0 D3hot D3cold
[    3.703159] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    3.703165] pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
[    3.703169] pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
[    3.703175] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff=
 64bit pref]
[    3.703911] pci 0000:0d:00.0: [1022:7901] type 00 class 0x010601
[    3.703936] pci 0000:0d:00.0: reg 0x24: [mem 0xfce01000-0xfce017ff]
[    3.703946] pci 0000:0d:00.0: enabling Extended Tags
[    3.704154] pci 0000:0d:00.0: 126.016 Gb/s available PCIe bandwidth, lim=
ited by 8.0 GT/s PCIe x16 link at 0000:00:08.2 (capable of 252.048 Gb/s wit=
h 16.0 GT/s PCIe x16 link)
[    3.705404] pci 0000:0d:00.1: [1022:7901] type 00 class 0x010601
[    3.705429] pci 0000:0d:00.1: reg 0x24: [mem 0xfce00000-0xfce007ff]
[    3.705439] pci 0000:0d:00.1: enabling Extended Tags
[    3.706926] pci 0000:00:08.2: PCI bridge to [bus 0d]
[    3.706933] pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
[    3.719188] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    3.720993] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    3.722685] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    3.724579] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    3.726367] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    3.727890] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    3.729400] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    3.730923] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    3.748921] ACPI: EC: interrupt unblocked
[    3.748925] ACPI: EC: event unblocked
[    3.748931] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    3.748933] ACPI: EC: GPE=3D0x3
[    3.748945] ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization comp=
lete
[    3.748962] ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions =
and events
[    3.749531] iommu: Default domain type: Translated=20
[    3.750467] pci 0000:0c:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    3.750470] pci 0000:0c:00.0: vgaarb: bridge control possible
[    3.750473] pci 0000:0c:00.0: vgaarb: setting as boot device
[    3.750476] vgaarb: loaded
[    3.753243] SCSI subsystem initialized
[    3.753883] libata version 3.00 loaded.
[    3.753932] ACPI: bus type USB registered
[    3.753977] usbcore: registered new interface driver usbfs
[    3.754032] usbcore: registered new interface driver hub
[    3.754119] usbcore: registered new device driver usb
[    3.754432] pps_core: LinuxPPS API ver. 1 registered
[    3.754434] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    3.754483] PTP clock support registered
[    3.754579] EDAC MC: Ver: 3.0.0
[    3.755028] Registered efivars operations
[    3.758940] NetLabel: Initializing
[    3.758943] NetLabel:  domain hash size =3D 128
[    3.758945] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    3.759115] NetLabel:  unlabeled traffic allowed by default
[    3.759150] PCI: Using ACPI for IRQ routing
[    3.763418] PCI: pci_cache_line_size set to 64 bytes
[    3.763519] e820: reserve RAM buffer [mem 0x09c10000-0x0bffffff]
[    3.763535] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    3.763547] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    3.763559] e820: reserve RAM buffer [mem 0xb4c66018-0xb7ffffff]
[    3.763572] e820: reserve RAM buffer [mem 0xb5158000-0xb7ffffff]
[    3.763584] e820: reserve RAM buffer [mem 0xb6cf5000-0xb7ffffff]
[    3.763596] e820: reserve RAM buffer [mem 0xb8390000-0xbbffffff]
[    3.763609] e820: reserve RAM buffer [mem 0x81f380000-0x81fffffff]
[    3.763871] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    3.763879] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    3.767071] clocksource: Switched to clocksource tsc-early
[    3.947809] VFS: Disk quotas dquot_6.6.0
[    3.947952] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    3.949538] pnp: PnP ACPI init
[    3.952235] system 00:00: [mem 0xf0000000-0xf7ffffff] has been reserved
[    3.952300] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    3.954888] system 00:01: [mem 0x820000000-0x83fffffff window] has been =
reserved
[    3.954948] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    3.959738] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    3.977677] system 00:03: [io  0x0a00-0x0a0f] has been reserved
[    3.977699] system 00:03: [io  0x0a10-0x0a1f] has been reserved
[    3.977720] system 00:03: [io  0x0a20-0x0a2f] has been reserved
[    3.977743] system 00:03: [io  0x0a30-0x0a3f] has been reserved
[    3.977763] system 00:03: [io  0x0a40-0x0a4f] has been reserved
[    3.977783] system 00:03: [io  0x0a50-0x0a5f] has been reserved
[    3.977803] system 00:03: [io  0x0a60-0x0a6f] has been reserved
[    3.977823] system 00:03: [io  0x0a70-0x0a7f] has been reserved
[    3.977843] system 00:03: [io  0x0a80-0x0a8f] has been reserved
[    3.977863] system 00:03: [io  0x0a90-0x0b8e] has been reserved
[    3.977884] system 00:03: [io  0x0aa0-0x0aaf] has been reserved
[    3.977904] system 00:03: [io  0x0ab0-0x0abf] has been reserved
[    3.977924] system 00:03: [io  0x0ac0-0x0acf] has been reserved
[    3.977944] system 00:03: [io  0x0ad0-0x0adf] has been reserved
[    3.977979] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    3.985055] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    3.985077] system 00:04: [io  0x040b] has been reserved
[    3.985097] system 00:04: [io  0x04d6] has been reserved
[    3.985117] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    3.985137] system 00:04: [io  0x0c14] has been reserved
[    3.985157] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    3.985177] system 00:04: [io  0x0c52] has been reserved
[    3.985198] system 00:04: [io  0x0c6c] has been reserved
[    3.985221] system 00:04: [io  0x0c6f] has been reserved
[    3.985241] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    3.985261] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    3.985281] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    3.985302] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    3.985327] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    3.985347] system 00:04: [io  0x0800-0x089f] has been reserved
[    3.985367] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    3.985388] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    3.985408] system 00:04: [io  0x0900-0x090f] has been reserved
[    3.985428] system 00:04: [io  0x0910-0x091f] has been reserved
[    3.985460] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    3.985491] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    3.985513] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    3.985536] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    3.985566] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    3.985588] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    3.985611] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    3.985645] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    4.000921] pnp: PnP ACPI: found 5 devices
[    4.022230] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    4.022930] NET: Registered protocol family 2
[    4.025189] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6=
, 262144 bytes, linear)
[    4.025717] TCP established hash table entries: 262144 (order: 9, 209715=
2 bytes, linear)
[    4.027463] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,=
 linear)
[    4.027836] TCP: Hash tables configured (established 262144 bind 65536)
[    4.028821] MPTCP token hash table entries: 32768 (order: 7, 786432 byte=
s, linear)
[    4.029224] UDP hash table entries: 16384 (order: 7, 524288 bytes, linea=
r)
[    4.029555] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, =
linear)
[    4.030765] NET: Registered protocol family 1
[    4.030807] NET: Registered protocol family 44
[    4.030838] pci 0000:02:00.0: PCI bridge to [bus 03]
[    4.030860] pci 0000:02:01.0: PCI bridge to [bus 04]
[    4.030873] pci 0000:02:02.0: PCI bridge to [bus 05]
[    4.030885] pci 0000:02:03.0: PCI bridge to [bus 06]
[    4.030898] pci 0000:02:04.0: PCI bridge to [bus 07]
[    4.030910] pci 0000:02:05.0: PCI bridge to [bus 08]
[    4.030922] pci 0000:02:06.0: PCI bridge to [bus 09]
[    4.030927] pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
[    4.030933] pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
[    4.030944] pci 0000:02:07.0: PCI bridge to [bus 0a]
[    4.030947] pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
[    4.030953] pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    4.030963] pci 0000:01:00.2: PCI bridge to [bus 02-0a]
[    4.030967] pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
[    4.030973] pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
[    4.030982] pci 0000:00:02.1: PCI bridge to [bus 01-0a]
[    4.030985] pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
[    4.030990] pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
[    4.030997] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    4.031001] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
[    4.031010] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    4.031014] pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
[    4.031018] pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
[    4.031022] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff=
 64bit pref]
[    4.031029] pci 0000:00:08.2: PCI bridge to [bus 0d]
[    4.031033] pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
[    4.031043] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    4.031047] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    4.031050] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    4.031053] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    4.031057] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff windo=
w]
[    4.031060] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff windo=
w]
[    4.031064] pci_bus 0000:00: resource 10 [mem 0xc0000000-0xfec2ffff wind=
ow]
[    4.031067] pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff wind=
ow]
[    4.031071] pci_bus 0000:01: resource 0 [io  0xd000-0xefff]
[    4.031074] pci_bus 0000:01: resource 1 [mem 0xfcb00000-0xfcdfffff]
[    4.031078] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    4.031081] pci_bus 0000:02: resource 1 [mem 0xfcb00000-0xfccfffff]
[    4.031085] pci_bus 0000:09: resource 0 [io  0xe000-0xefff]
[    4.031088] pci_bus 0000:09: resource 1 [mem 0xfcc00000-0xfccfffff]
[    4.031092] pci_bus 0000:0a: resource 0 [io  0xd000-0xdfff]
[    4.031095] pci_bus 0000:0a: resource 1 [mem 0xfcb00000-0xfcbfffff]
[    4.031098] pci_bus 0000:0b: resource 1 [mem 0xfcf00000-0xfcffffff]
[    4.031102] pci_bus 0000:0c: resource 0 [io  0xf000-0xffff]
[    4.031105] pci_bus 0000:0c: resource 1 [mem 0xfc700000-0xfcafffff]
[    4.031108] pci_bus 0000:0c: resource 2 [mem 0xd0000000-0xe01fffff 64bit=
 pref]
[    4.031112] pci_bus 0000:0d: resource 1 [mem 0xfce00000-0xfcefffff]
[    4.035088] pci 0000:0c:00.1: D0 power state depends on 0000:0c:00.0
[    4.039436] PCI: CLS 64 bytes, default 64
[    4.039874] Trying to unpack rootfs image as initramfs...
[    4.303879] Freeing initrd memory: 8380K
[    4.437100] pci 0000:00:00.2: AMD-Vi: Unable to read/write to IOMMU perf=
 counter.
[    4.437124] fbcon: Taking over console
[    4.438778] pci 0000:00:00.2: can't derive routing for PCI INT A
[    4.438783] pci 0000:00:00.2: PCI INT A: not connected
[    4.439066] pci 0000:00:01.0: Adding to iommu group 0
[    4.439254] pci 0000:00:02.0: Adding to iommu group 1
[    4.439416] pci 0000:00:02.1: Adding to iommu group 2
[    4.439576] pci 0000:00:02.2: Adding to iommu group 3
[    4.439749] pci 0000:00:08.0: Adding to iommu group 4
[    4.439838] pci 0000:00:08.1: Adding to iommu group 4
[    4.439927] pci 0000:00:08.2: Adding to iommu group 4
[    4.440092] pci 0000:00:14.0: Adding to iommu group 5
[    4.440181] pci 0000:00:14.3: Adding to iommu group 5
[    4.440425] pci 0000:00:18.0: Adding to iommu group 6
[    4.440520] pci 0000:00:18.1: Adding to iommu group 6
[    4.440619] pci 0000:00:18.2: Adding to iommu group 6
[    4.440708] pci 0000:00:18.3: Adding to iommu group 6
[    4.440798] pci 0000:00:18.4: Adding to iommu group 6
[    4.440887] pci 0000:00:18.5: Adding to iommu group 6
[    4.440976] pci 0000:00:18.6: Adding to iommu group 6
[    4.441068] pci 0000:00:18.7: Adding to iommu group 6
[    4.441251] pci 0000:01:00.0: Adding to iommu group 7
[    4.441342] pci 0000:01:00.1: Adding to iommu group 7
[    4.441433] pci 0000:01:00.2: Adding to iommu group 7
[    4.441513] pci 0000:02:00.0: Adding to iommu group 7
[    4.441591] pci 0000:02:01.0: Adding to iommu group 7
[    4.441668] pci 0000:02:02.0: Adding to iommu group 7
[    4.441752] pci 0000:02:03.0: Adding to iommu group 7
[    4.441842] pci 0000:02:04.0: Adding to iommu group 7
[    4.441919] pci 0000:02:05.0: Adding to iommu group 7
[    4.442006] pci 0000:02:06.0: Adding to iommu group 7
[    4.442089] pci 0000:02:07.0: Adding to iommu group 7
[    4.442167] pci 0000:09:00.0: Adding to iommu group 7
[    4.442254] pci 0000:0a:00.0: Adding to iommu group 7
[    4.442401] pci 0000:0b:00.0: Adding to iommu group 8
[    4.442495] pci 0000:0c:00.0: Adding to iommu group 4
[    4.442579] pci 0000:0c:00.1: Adding to iommu group 4
[    4.442657] pci 0000:0c:00.2: Adding to iommu group 4
[    4.442736] pci 0000:0c:00.3: Adding to iommu group 4
[    4.442815] pci 0000:0c:00.4: Adding to iommu group 4
[    4.442901] pci 0000:0c:00.6: Adding to iommu group 4
[    4.442980] pci 0000:0d:00.0: Adding to iommu group 4
[    4.443062] pci 0000:0d:00.1: Adding to iommu group 4
[    4.485919] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    4.485927] pci 0000:00:00.2: AMD-Vi: Extended features (0x206d73ef22254=
ade):
[    4.485930]  PPR X2APIC NX GT IA GA PC GA_vAPIC
[    4.485941] AMD-Vi: Interrupt remapping enabled
[    4.485943] AMD-Vi: Virtual APIC enabled
[    4.485944] AMD-Vi: X2APIC enabled
[    4.486507] AMD-Vi: Lazy IO/TLB flushing enabled
[    4.486638] amd_uncore: 4  amd_df counters detected
[    4.486658] amd_uncore: 6  amd_l3 counters detected
[    4.487370] LVT offset 0 assigned for vector 0x400
[    4.487665] perf: AMD IBS detected (0x000003ff)
[    4.493516] check: Scanning for low memory corruption every 60 seconds
[    4.501303] Initialise system trusted keyrings
[    4.501370] Key type blacklist registered
[    4.501686] workingset: timestamp_bits=3D41 max_order=3D23 bucket_order=
=3D0
[    4.535407] zbud: loaded
[    4.543286] Key type asymmetric registered
[    4.543290] Asymmetric key parser 'x509' registered
[    4.543383] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 243)
[    4.543676] io scheduler mq-deadline registered
[    4.543680] io scheduler kyber registered
[    4.544306] io scheduler bfq registered
[    4.548330] pcieport 0000:00:02.1: PME: Signaling with IRQ 26
[    4.549376] pcieport 0000:00:02.2: PME: Signaling with IRQ 27
[    4.550413] pcieport 0000:00:08.1: PME: Signaling with IRQ 28
[    4.552624] pcieport 0000:00:08.2: PME: Signaling with IRQ 29
[    4.566880] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    4.567202] efifb: probing for efifb
[    4.567582] efifb: framebuffer at 0xd0000000, using 3072k, total 3072k
[    4.567585] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
[    4.567588] efifb: scrolling: redraw
[    4.567589] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    4.568816] Console: switching to colour frame buffer device 128x48
[    4.573826] fb0: EFI VGA frame buffer device
[    4.574618] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    4.575001] ACPI: button: Power Button [PWRB]
[    4.575507] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input1
[    4.577445] ACPI: button: Power Button [PWRF]
[    4.578214] Monitor-Mwait will be used to enter C-1 state
[    4.578264] ACPI: \_PR_.C000: Found 3 idle states
[    4.579833] ACPI: \_PR_.C002: Found 3 idle states
[    4.581513] ACPI: \_PR_.C004: Found 3 idle states
[    4.583007] ACPI: \_PR_.C006: Found 3 idle states
[    4.584708] ACPI: \_PR_.C001: Found 3 idle states
[    4.586254] ACPI: \_PR_.C003: Found 3 idle states
[    4.587838] ACPI: \_PR_.C005: Found 3 idle states
[    4.589535] ACPI: \_PR_.C007: Found 3 idle states
[    4.606622] thermal LNXTHERM:00: registered as thermal_zone0
[    4.606629] ACPI: thermal: Thermal Zone [HPTZ] (30 C)
[    4.608252] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    4.632735] Non-volatile memory driver v1.3
[    4.632741] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    4.645325] nvme nvme0: pci function 0000:0b:00.0
[    4.645645] ahci 0000:01:00.1: version 3.0
[    4.645660] ahci 0000:01:00.1: enabling device (0100 -> 0102)
[    4.647511] ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
[    4.647582] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
ff impl SATA mode
[    4.647587] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo onl=
y pmp pio slum part sxs deso sadm sds apst=20
[    4.651792] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    4.651913] BUG: KASAN: use-after-free in __iommu_dma_unmap_swiotlb+0x64=
/0xb0
[    4.652031] Read of size 8 at addr ffff8887c008f000 by task swapper/0/0

[    4.652162] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3-debug-0=
0033-g167e3e00e2be #1
[    4.652168] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[    4.652172] Call Trace:
[    4.652176]  <IRQ>
[    4.652180]  dump_stack+0x9c/0xcf
[    4.652189]  print_address_description.constprop.0+0x18/0x130
[    4.652196]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
[    4.652202]  kasan_report.cold+0x7f/0x111
[    4.652211]  ? __iommu_dma_unmap_swiotlb+0x64/0xb0
[    4.652217]  __iommu_dma_unmap_swiotlb+0x64/0xb0
[    4.652224]  nvme_pci_complete_rq+0x73/0x130
[    4.652232]  blk_complete_reqs+0x6f/0x80
[    4.652239]  __do_softirq+0xfc/0x3be
[    4.652247]  irq_exit_rcu+0xce/0x120
[    4.652254]  common_interrupt+0x80/0xa0
[    4.652261]  </IRQ>
[    4.652264]  asm_common_interrupt+0x1e/0x40
[    4.652270] RIP: 0010:cpuidle_enter_state+0xf9/0x590
[    4.652277] Code: 3d 14 09 b7 51 e8 57 a6 49 ff 49 89 c5 0f 1f 44 00 00 =
31 ff e8 18 bb 49 ff 80 3c 24 00 0f 85 aa 02 00 00 fb 66 0f 1f 44 00 00 <45=
> 85 f6 0f 88 39 02 00 00 49 63 ee 48 8d 44 6d 00 48 8d 44 85 00
[    4.652283] RSP: 0018:ffffffffaf807df0 EFLAGS: 00000246
[    4.652289] RAX: 0000000000000000 RBX: ffff88810bd09000 RCX: ffffffffad9=
44885
[    4.652293] RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffff8887c32=
35648
[    4.652297] RBP: 0000000000000003 R08: 0000000000000001 R09: ffff8887c32=
356d7
[    4.652300] R10: ffffed10f8646ada R11: 0000000000000001 R12: ffffffffafc=
5bfc0
[    4.652304] R13: 0000000115446cbb R14: 0000000000000003 R15: ffffffffafc=
5c150
[    4.652309]  ? sched_idle_set_state+0x25/0x30
[    4.652317]  ? tick_nohz_idle_stop_tick+0x217/0x420
[    4.652325]  cpuidle_enter+0x3c/0x60
[    4.652331]  do_idle+0x2fa/0x3c0
[    4.652338]  ? arch_cpu_idle_exit+0x40/0x40
[    4.652345]  cpu_startup_entry+0x19/0x20
[    4.652350]  start_kernel+0x3a9/0x3c7
[    4.652359]  secondary_startup_64_no_verify+0xc2/0xcb

[    4.652395] The buggy address belongs to the page:
[    4.652456] page:00000000a3938bc3 refcount:0 mapcount:0 mapping:00000000=
00000000 index:0x0 pfn:0x7c008f
[    4.652461] flags: 0x2ffff0000000000()
[    4.652466] raw: 02ffff0000000000 ffffea001f0023c8 ffffea001f0023c8 0000=
000000000000
[    4.652470] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000=
000000000000
[    4.652472] page dumped because: kasan: bad access detected

[    4.652491] Memory state around the buggy address:
[    4.652547]  ffff8887c008ef00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652621]  ffff8887c008ef80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652695] >ffff8887c008f000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652768]                    ^
[    4.652803]  ffff8887c008f080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652877]  ffff8887c008f100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652950] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    4.653029] Disabling lock debugging due to kernel taint
[    4.653309] nvme nvme0: missing or invalid SUBNQN field.
[    4.663105] nvme nvme0: 16/0/0 default/read/poll queues
[    4.668311] scsi host0: ahci
[    4.669899]  nvme0n1: p1 p2
[    4.670702] scsi host1: ahci
[    4.672616] scsi host2: ahci
[    4.674521] scsi host3: ahci
[    4.676781] scsi host4: ahci
[    4.678791] scsi host5: ahci
[    4.680663] scsi host6: ahci
[    4.682714] scsi host7: ahci
[    4.683697] ata1: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
100 irq 44
[    4.683702] ata2: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
180 irq 44
[    4.683707] ata3: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
200 irq 44
[    4.683710] ata4: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
280 irq 44
[    4.683714] ata5: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
300 irq 44
[    4.683718] ata6: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
380 irq 44
[    4.683722] ata7: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
400 irq 44
[    4.683726] ata8: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
480 irq 44
[    4.684113] ahci 0000:0d:00.0: enabling device (0100 -> 0102)
[    4.686333] ahci 0000:0d:00.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x=
1 impl SATA mode
[    4.686342] ahci 0000:0d:00.0: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part=20
[    4.688739] scsi host8: ahci
[    4.689732] ata9: SATA max UDMA/133 abar m2048@0xfce01000 port 0xfce0110=
0 irq 62
[    4.689877] ahci 0000:0d:00.1: enabling device (0100 -> 0102)
[    4.691535] ahci 0000:0d:00.1: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x=
1 impl SATA mode
[    4.691544] ahci 0000:0d:00.1: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part=20
[    4.694012] scsi host9: ahci
[    4.695026] ata10: SATA max UDMA/133 abar m2048@0xfce00000 port 0xfce001=
00 irq 64
[    4.695247] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    4.695279] ehci-pci: EHCI PCI platform driver
[    4.695395] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    4.695415] ohci-pci: OHCI PCI platform driver
[    4.695512] uhci_hcd: USB Universal Host Controller Interface driver
[    4.696210] usbcore: registered new interface driver usbserial_generic
[    4.696264] usbserial: USB Serial support registered for generic
[    4.697317] rtc_cmos 00:02: RTC can wake from S4
[    4.699142] rtc_cmos 00:02: registered as rtc0
[    4.699426] rtc_cmos 00:02: setting system clock to 2021-07-05T18:01:47 =
UTC (1625508107)
[    4.699656] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    4.700290] ledtrig-cpu: registered to indicate activity on CPUs
[    4.705912] hid: raw HID events driver (C) Jiri Kosina
[    4.706429] drop_monitor: Initializing network drop monitor service
[    4.706594] Initializing XFRM netlink socket
[    4.708814] NET: Registered protocol family 10
[    4.733033] Segment Routing with IPv6
[    4.733041] RPL Segment Routing with IPv6
[    4.733175] NET: Registered protocol family 17
[    4.744516] microcode: CPU0: patch_level=3D0x08600106
[    4.744563] microcode: CPU1: patch_level=3D0x08600106
[    4.744657] microcode: CPU2: patch_level=3D0x08600106
[    4.744739] microcode: CPU3: patch_level=3D0x08600106
[    4.744804] microcode: CPU4: patch_level=3D0x08600106
[    4.744848] microcode: CPU5: patch_level=3D0x08600106
[    4.744916] microcode: CPU6: patch_level=3D0x08600106
[    4.744975] microcode: CPU7: patch_level=3D0x08600106
[    4.745002] microcode: Microcode Update Driver: v2.2.
[    4.745820] resctrl: L3 allocation detected
[    4.745827] resctrl: L3DATA allocation detected
[    4.745829] resctrl: L3CODE allocation detected
[    4.745830] resctrl: MB allocation detected
[    4.745832] resctrl: L3 monitoring detected
[    4.745838] IPI shorthand broadcast: enabled
[    4.745984] sched_clock: Marking stable (4739676488, 6007714)->(47476761=
29, -1991927)
[    4.746812] registered taskstats version 1
[    4.746922] Loading compiled-in X.509 certificates
[    4.757340] Loaded X.509 cert 'Build time autogenerated kernel key: 32cf=
4ae6b69274291395e11399683edef2a4e147'
[    4.762638] zswap: loaded using pool lz4/z3fold
[    4.764606] Key type ._fscrypt registered
[    4.764612] Key type .fscrypt registered
[    4.764614] Key type fscrypt-provisioning registered
[    4.776597] PM:   Magic number: 13:252:38
[    4.776765] memory memory207: hash matches
[    4.776798] memory memory74: hash matches
[    4.778951] RAS: Correctable Errors collector initialized.
[    4.995881] ata1: SATA link down (SStatus 0 SControl 300)
[    5.000972] ata9: SATA link down (SStatus 0 SControl 300)
[    5.005458] ata10: SATA link down (SStatus 0 SControl 300)
[    5.310074] ata2: SATA link down (SStatus 0 SControl 300)
[    5.490688] tsc: Refined TSC clocksource calibration: 3819.727 MHz
[    5.490713] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6e1=
e4508946, max_idle_ns: 881590469268 ns
[    5.490821] clocksource: Switched to clocksource tsc
[    5.622021] ata3: SATA link down (SStatus 0 SControl 300)
[    5.932590] ata4: SATA link down (SStatus 0 SControl 300)
[    6.245698] ata5: SATA link down (SStatus 0 SControl 300)
[    6.559773] ata6: SATA link down (SStatus 0 SControl 300)
[    6.872755] ata7: SATA link down (SStatus 0 SControl 300)
[    7.185687] ata8: SATA link down (SStatus 0 SControl 300)
[    7.200470] Freeing unused decrypted memory: 2036K
[    7.201233] Freeing unused kernel image (initmem) memory: 2012K
[    7.201243] Write protecting the kernel read-only data: 32768k
[    7.202524] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    7.203212] Freeing unused kernel image (rodata/data gap) memory: 1768K
[    7.261659] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    7.261671] rodata_test: all tests were successful
[    7.261705] Run /init as init process
[    7.261708]   with arguments:
[    7.261710]     /init
[    7.261712]   with environment:
[    7.261714]     HOME=3D/
[    7.261716]     TERM=3Dlinux
[    8.072610] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    8.072718] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus =
number 1
[    8.128723] xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x1=
10 quirks 0x0000000000000410
[    8.136551] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.12
[    8.136562] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.136567] usb usb1: Product: xHCI Host Controller
[    8.136572] usb usb1: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.136576] usb usb1: SerialNumber: 0000:01:00.0
[    8.139731] hub 1-0:1.0: USB hub found
[    8.139944] hub 1-0:1.0: 14 ports detected
[    8.155361] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    8.155411] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus =
number 2
[    8.155437] xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.155750] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.156512] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.12
[    8.156521] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.156525] usb usb2: Product: xHCI Host Controller
[    8.156528] usb usb2: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.156530] usb usb2: SerialNumber: 0000:01:00.0
[    8.158456] hub 2-0:1.0: USB hub found
[    8.158657] hub 2-0:1.0: 8 ports detected
[    8.171454] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    8.171543] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 3
[    8.172082] xhci_hcd 0000:0c:00.3: hcc params 0x0268ffe5 hci version 0x1=
10 quirks 0x0000000000000410
[    8.178578] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.12
[    8.178589] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.178594] usb usb3: Product: xHCI Host Controller
[    8.178598] usb usb3: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.178602] usb usb3: SerialNumber: 0000:0c:00.3
[    8.181189] hub 3-0:1.0: USB hub found
[    8.181388] hub 3-0:1.0: 4 ports detected
[    8.185965] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    8.186032] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 4
[    8.186059] xhci_hcd 0000:0c:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.186366] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.187099] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.12
[    8.187108] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.187113] usb usb4: Product: xHCI Host Controller
[    8.187117] usb usb4: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.187122] usb usb4: SerialNumber: 0000:0c:00.3
[    8.189404] hub 4-0:1.0: USB hub found
[    8.189539] hub 4-0:1.0: 2 ports detected
[    8.192958] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    8.193016] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus =
number 5
[    8.193395] xhci_hcd 0000:0c:00.4: hcc params 0x0268ffe5 hci version 0x1=
10 quirks 0x0000000000000410
[    8.197879] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.12
[    8.197887] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.197890] usb usb5: Product: xHCI Host Controller
[    8.197893] usb usb5: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.197895] usb usb5: SerialNumber: 0000:0c:00.4
[    8.199515] hub 5-0:1.0: USB hub found
[    8.199659] hub 5-0:1.0: 4 ports detected
[    8.202842] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    8.202887] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus =
number 6
[    8.202913] xhci_hcd 0000:0c:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.203133] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.203610] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.12
[    8.203614] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.203618] usb usb6: Product: xHCI Host Controller
[    8.203620] usb usb6: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.203623] usb usb6: SerialNumber: 0000:0c:00.4
[    8.205252] hub 6-0:1.0: USB hub found
[    8.205385] hub 6-0:1.0: 2 ports detected
[    8.483770] usb 1-11: new full-speed USB device number 2 using xhci_hcd
[    8.616313] SGI XFS with ACLs, security attributes, realtime, scrub, rep=
air, quota, no debug enabled
[    8.629895] XFS (nvme0n1p2): Mounting V5 Filesystem
[    8.640814] XFS (nvme0n1p2): Ending clean mount
[    8.643784] xfs filesystem being mounted at /new_root supports timestamp=
s until 2038 (0x7fffffff)
[    8.701705] random: fast init done
[    8.850769] random: crng init done
[    8.850799] systemd[1]: Successfully credited entropy passed from boot l=
oader.
[    8.854073] systemd[1]: systemd 248.3-2-arch running in system mode. (+P=
AM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL =
+ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +L=
IBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +XK=
BCOMMON +UTMP -SYSVINIT default-hierarchy=3Dunified)
[    8.870978] systemd[1]: Detected architecture x86-64.
[    8.874172] systemd[1]: Hostname set to <hp-4300G>.
[    8.883148] usb 1-11: New USB device found, idVendor=3D046d, idProduct=
=3Dc534, bcdDevice=3D29.01
[    8.883160] usb 1-11: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    8.883165] usb 1-11: Product: USB Receiver
[    8.883169] usb 1-11: Manufacturer: Logitech
[    8.964795] systemd-fstab-generator[252]: Mount point  is not a valid pa=
th, ignoring.
[    8.965686] systemd-fstab-generator[252]: Mount point  is not a valid pa=
th, ignoring.
[    9.023787] usb 1-12: new full-speed USB device number 3 using xhci_hcd
[    9.133143] systemd[1]: Queued start job for default target Graphical In=
terface.
[    9.141522] systemd[1]: Created slice system-getty.slice.
[    9.143519] systemd[1]: Created slice system-modprobe.slice.
[    9.148031] systemd[1]: Created slice User and Session Slice.
[    9.148561] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    9.149038] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    9.150164] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    9.150701] systemd[1]: Reached target Local Encrypted Volumes.
[    9.150901] systemd[1]: Reached target Login Prompts.
[    9.151100] systemd[1]: Reached target Paths.
[    9.151278] systemd[1]: Reached target Remote File Systems.
[    9.151475] systemd[1]: Reached target Slices.
[    9.151661] systemd[1]: Reached target Swap.
[    9.151839] systemd[1]: Reached target Local Verity Integrity Protected =
Volumes.
[    9.153881] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    9.157470] systemd[1]: Listening on Process Core Dump Socket.
[    9.159900] systemd[1]: Listening on Journal Audit Socket.
[    9.162031] systemd[1]: Listening on Journal Socket (/dev/log).
[    9.164219] systemd[1]: Listening on Journal Socket.
[    9.166260] systemd[1]: Listening on Network Service Netlink Socket.
[    9.169746] systemd[1]: Listening on udev Control Socket.
[    9.171892] systemd[1]: Listening on udev Kernel Socket.
[    9.178783] systemd[1]: Mounting Huge Pages File System...
[    9.186001] systemd[1]: Mounting POSIX Message Queue File System...
[    9.192864] systemd[1]: Mounting Kernel Debug File System...
[    9.199803] systemd[1]: Mounting Kernel Trace File System...
[    9.207150] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[    9.220054] systemd[1]: Starting Load Kernel Module configfs...
[    9.227187] systemd[1]: Starting Load Kernel Module drm...
[    9.234146] systemd[1]: Starting Load Kernel Module fuse...
[    9.240238] Linux agpgart interface v0.103
[    9.242093] systemd[1]: Starting Set Up Additional Binary Formats...
[    9.243933] systemd[1]: Condition check resulted in File System Check on=
 Root Device being skipped.
[    9.258253] fuse: init (API version 7.33)
[    9.258750] systemd[1]: Starting Journal Service...
[    9.269031] systemd[1]: Starting Load Kernel Modules...
[    9.275818] systemd[1]: Starting Remount Root and Kernel File Systems...
[    9.278268] systemd[1]: Condition check resulted in Repartition Root Dis=
k being skipped.
[    9.285440] systemd[1]: Starting Coldplug All udev Devices...
[    9.289436] Asymmetric key parser 'pkcs8' registered
[    9.295407] systemd[1]: Mounted Huge Pages File System.
[    9.297675] systemd[1]: Mounted POSIX Message Queue File System.
[    9.299077] XFS: attr2 mount option is deprecated.
[    9.299875] systemd[1]: Mounted Kernel Debug File System.
[    9.302121] systemd[1]: Mounted Kernel Trace File System.
[    9.302305] xfs filesystem being remounted at / supports timestamps unti=
l 2038 (0x7fffffff)
[    9.307207] systemd[1]: Finished Create list of static device nodes for =
the current kernel.
[    9.309211] audit: type=3D1130 audit(1625508112.104:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dkmod-static-nodes comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
[    9.310701] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    9.312189] systemd[1]: Finished Load Kernel Module configfs.
[    9.314011] audit: type=3D1130 audit(1625508112.111:3): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@configfs comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
[    9.314063] audit: type=3D1131 audit(1625508112.111:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@configfs comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
[    9.315399] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    9.316866] systemd[1]: Finished Load Kernel Module drm.
[    9.319018] audit: type=3D1130 audit(1625508112.114:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@drm comm=3D"syste=
md" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=
=3Dsuccess'
[    9.319063] audit: type=3D1131 audit(1625508112.114:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@drm comm=3D"syste=
md" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=
=3Dsuccess'
[    9.320369] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    9.322053] systemd[1]: Finished Load Kernel Module fuse.
[    9.323928] audit: type=3D1130 audit(1625508112.121:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@fuse comm=3D"syst=
emd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? re=
s=3Dsuccess'
[    9.323969] audit: type=3D1131 audit(1625508112.121:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@fuse comm=3D"syst=
emd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? re=
s=3Dsuccess'
[    9.325885] systemd[1]: Finished Load Kernel Modules.
[    9.327726] audit: type=3D1130 audit(1625508112.124:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-modules-load comm=
=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termina=
l=3D? res=3Dsuccess'
[    9.329640] systemd[1]: Finished Remount Root and Kernel File Systems.
[    9.331465] audit: type=3D1130 audit(1625508112.128:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-remount-fs comm=
=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termina=
l=3D? res=3Dsuccess'
[    9.331966] systemd[1]: proc-sys-fs-binfmt_misc.automount: Got automount=
 request for /proc/sys/fs/binfmt_misc, triggered by 268 (systemd-binfmt)
[    9.334658] usb 1-12: New USB device found, idVendor=3D0bda, idProduct=
=3Db00a, bcdDevice=3D 1.10
[    9.334669] usb 1-12: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
[    9.334673] usb 1-12: Product: Bluetooth Radio=20
[    9.334677] usb 1-12: Manufacturer: Realtek=20
[    9.334681] usb 1-12: SerialNumber: 00e04c000001
[    9.337615] systemd[1]: Mounting Arbitrary Executable File Formats File =
System...
[    9.345171] systemd[1]: Mounting FUSE Control File System...
[    9.352671] systemd[1]: Mounting Kernel Configuration File System...
[    9.354660] systemd[1]: Condition check resulted in First Boot Wizard be=
ing skipped.
[    9.356762] systemd[1]: Condition check resulted in Rebuild Hardware Dat=
abase being skipped.
[    9.362335] systemd[1]: Starting Load/Save Random Seed...
[    9.370337] systemd[1]: Starting Apply Kernel Variables...
[    9.377555] systemd[1]: Starting Create System Users...
[    9.384837] systemd[1]: Mounted Arbitrary Executable File Formats File S=
ystem.
[    9.388928] systemd[1]: Mounted FUSE Control File System.
[    9.391926] systemd[1]: Mounted Kernel Configuration File System.
[    9.396765] systemd[1]: Finished Load/Save Random Seed.
[    9.400536] audit: type=3D1130 audit(1625508112.194:11): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-random-seed comm=
=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termina=
l=3D? res=3Dsuccess'
[    9.407538] systemd[1]: Finished Apply Kernel Variables.
[    9.411712] systemd[1]: Finished Set Up Additional Binary Formats.
[    9.416339] systemd[1]: Finished Create System Users.
[    9.418688] systemd[1]: Condition check resulted in First Boot Complete =
being skipped.
[    9.424186] systemd[1]: Starting Create Static Device Nodes in /dev...
[    9.480449] systemd[1]: Finished Create Static Device Nodes in /dev.
[    9.482506] systemd[1]: Reached target Local File Systems (Pre).
[    9.489210] systemd[1]: Mounting /tmp...
[    9.491124] systemd[1]: Condition check resulted in Virtual Machine and =
Container Storage (Compatibility) being skipped.
[    9.503225] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    9.508551] systemd[1]: Mounted /tmp.
[    9.573272] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    9.588922] systemd[1]: Starting Network Service...
[    9.638950] systemd[1]: Started Journal Service.
[    9.664886] systemd-journald[269]: Received client request to flush runt=
ime journal.
[    9.759611] Bluetooth: Core ver 2.22
[    9.759775] NET: Registered protocol family 31
[    9.759778] Bluetooth: HCI device and connection manager initialized
[    9.759794] Bluetooth: HCI socket layer initialized
[    9.759807] Bluetooth: L2CAP socket layer initialized
[    9.759838] Bluetooth: SCO socket layer initialized
[    9.784432] usbcore: registered new interface driver btusb
[    9.786588] Bluetooth: hci0: RTL: examining hci_ver=3D08 hci_rev=3D000c =
lmp_ver=3D08 lmp_subver=3D8821
[    9.789596] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1
[    9.789666] Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_fw.bin
[    9.793321] Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_config.bin
[    9.794035] Bluetooth: hci0: RTL: cfg_sz 10, total sz 31990
[   10.052152] acpi_cpufreq: overriding BIOS provided _PSD data
[   10.063914] acpi-tad ACPI000E:00: Missing _PRW
[   10.241179] ACPI: video: Video Device [VGA1] (multi-head: yes  rom: no  =
post: no)
[   10.264286] acpi device:1e: registered as cooling_device8
[   10.269015] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:1d/LNXVIDEO:01/input/input2
[   10.319302] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:00)
[   10.358026] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[   10.358037] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[   10.358941] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[   10.362274] ccp 0000:0c:00.2: enabling device (0100 -> 0102)
[   10.364925] ccp 0000:0c:00.2: ccp: unable to access the device: you migh=
t be running a broken BIOS.
[   10.375365] ccp 0000:0c:00.2: tee enabled
[   10.375376] ccp 0000:0c:00.2: psp enabled
[   10.394306] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[   10.395169] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[   10.396264] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[   10.471471] input: PC Speaker as /devices/platform/pcspkr/input/input3
[   10.500876] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[   10.500885] RAPL PMU: hw unit of domain package 2^-16 Joules
[   10.533106] cryptd: max_cpu_qlen set to 1000
[   10.572803] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:=
02.1/0000:01:00.0/usb1/1-11/1-11:1.0/0003:046D:C534.0001/input/input4
[   10.601442] libphy: r8169: probed
[   10.603871] r8169 0000:0a:00.0 eth0: RTL8168h/8111h, 00:68:eb:ad:98:43, =
XID 541, IRQ 91
[   10.603884] r8169 0000:0a:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[   10.618131] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   10.632919] AVX2 version of gcm_enc/dec engaged.
[   10.633000] AES CTR mode by8 optimization enabled
[   10.633757] hid-generic 0003:046D:C534.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
[   10.642569] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   10.643042] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[   10.643062] cfg80211: failed to load regulatory.db
[   10.676986] input: Logitech USB Receiver Mouse as /devices/pci0000:00/00=
00:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input5
[   10.680342] input: Logitech USB Receiver Consumer Control as /devices/pc=
i0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/i=
nput/input6
[   10.729484] FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some =
data may be corrupt. Please run fsck.
[   10.738574] input: Logitech USB Receiver System Control as /devices/pci0=
000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/inp=
ut/input7
[   10.740269] hid-generic 0003:046D:C534.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
[   10.740698] usbcore: registered new interface driver usbhid
[   10.740702] usbhid: USB HID core driver
[   10.878631] snd_hda_intel 0000:0c:00.1: enabling device (0100 -> 0102)
[   10.879924] snd_hda_intel 0000:0c:00.1: Handle vga_switcheroo audio clie=
nt
[   10.880070] Bluetooth: hci0: RTL: fw version 0x829a7644
[   10.893377] snd_hda_intel 0000:0c:00.6: enabling device (0100 -> 0102)
[   10.918940] irq 7: nobody cared (try booting with the "irqpoll" option)
[   10.921972] CPU: 4 PID: 363 Comm: systemd-tmpfile Tainted: G    B       =
      5.12.0-rc3-debug-00033-g167e3e00e2be #1
[   10.921980] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[   10.921984] Call Trace:
[   10.921987]  <IRQ>
[   10.921990]  dump_stack+0x9c/0xcf
[   10.922002]  __report_bad_irq+0x43/0xde
[   10.922011]  note_interrupt.cold+0x28/0x8b
[   10.922019]  ? add_interrupt_randomness+0x152/0x270
[   10.922027]  handle_irq_event+0x14e/0x160
[   10.922036]  ? handle_irq_event_percpu+0xf0/0xf0
[   10.922043]  ? _raw_spin_lock+0x81/0xe0
[   10.922050]  ? _raw_spin_lock_bh+0xe0/0xe0
[   10.922057]  handle_fasteoi_irq+0xfa/0x370
[   10.922065]  __common_interrupt+0x4f/0xc0
[   10.922073]  common_interrupt+0x7b/0xa0
[   10.922081]  </IRQ>
[   10.922084]  asm_common_interrupt+0x1e/0x40
[   10.922090] RIP: 0010:file_ra_state_init+0x5/0xb0
[   10.922098] Code: 00 48 0f 44 f0 48 89 35 a9 cd bc 02 e8 d4 d4 e4 ff e9 =
8f fe ff ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 <41=
> 54 55 48 89 f5 53 48 89 fb 48 89 f7 e8 a9 ec 0c 00 48 8b 6d 00
[   10.922104] RSP: 0018:ffffc90000fcf9e8 EFLAGS: 00000246
[   10.922111] RAX: 0000000000000000 RBX: ffff88811ef2e5c0 RCX: ffffffffadc=
a322f
[   10.922115] RDX: dffffc0000000000 RSI: ffff8881258b5ae8 RDI: ffff88811ef=
2e658
[   10.922120] RBP: ffff8881258b5970 R08: ffffffffadca3202 R09: ffff8881258=
b5ad7
[   10.922124] R10: ffffed1024b16b5a R11: 0000000000000001 R12: 00000000000=
00000
[   10.922128] R13: ffff8881258b5970 R14: ffff88811ef2e604 R15: ffff88811ef=
2e600
[   10.922134]  ? do_dentry_open+0x352/0x6d0
[   10.922140]  ? do_dentry_open+0x37f/0x6d0
[   10.922148]  do_dentry_open+0x38f/0x6d0
[   10.922155]  ? xfs_extent_busy_ag_cmp+0x50/0x50 [xfs]
[   10.922565]  path_openat+0x1278/0x1840
[   10.922576]  ? path_lookupat+0x300/0x300
[   10.922583]  ? rwsem_down_write_slowpath+0xb70/0xb70
[   10.922592]  ? handle_mm_fault+0x18f/0x3d0
[   10.922599]  ? do_user_addr_fault+0x34b/0x950
[   10.922607]  do_filp_open+0x11f/0x240
[   10.922615]  ? may_open_dev+0x50/0x50
[   10.922624]  ? __fdget+0x10/0x10
[   10.922630]  ? _raw_spin_lock+0x81/0xe0
[   10.922637]  ? _find_next_bit.constprop.0+0x3e/0xf0
[   10.922645]  ? alloc_fd+0x129/0x280
[   10.922651]  do_sys_openat2+0x114/0x230
[   10.922658]  ? build_open_flags+0x250/0x250
[   10.922666]  __x64_sys_openat+0xcd/0x140
[   10.922672]  ? __x64_sys_open+0x130/0x130
[   10.922679]  ? ktime_get_coarse_real_ts64+0x4a/0x70
[   10.922687]  do_syscall_64+0x33/0x40
[   10.922694]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   10.922701] RIP: 0033:0x7f5dca6be8cc
[   10.922706] Code: 24 18 31 c0 41 83 e2 40 75 44 89 f0 25 00 00 41 00 3d =
00 00 41 00 74 36 44 89 c2 4c 89 ce bf 9c ff ff ff b8 01 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 44 48 8b 54 24 18 64 48 2b 14 25 28 00 00 00
[   10.922712] RSP: 002b:00007ffef51fa140 EFLAGS: 00000287 ORIG_RAX: 000000=
0000000101
[   10.922718] RAX: ffffffffffffffda RBX: 00005598f2a69ad0 RCX: 00007f5dca6=
be8cc
[   10.922723] RDX: 0000000000080000 RSI: 00007f5dc9d0215e RDI: 00000000fff=
fff9c
[   10.922727] RBP: 0000000000000008 R08: 0000000000080000 R09: 00007f5dc9d=
0215e
[   10.922731] R10: 0000000000000000 R11: 0000000000000287 R12: 00007f5dca7=
5555f
[   10.922735] R13: 00005598f2a69ad0 R14: 0000000000000001 R15: 00005598f2a=
6f690
[   10.922742] handlers:
[   10.925696] [<00000000447508a4>] amd_gpio_irq_handler [pinctrl_amd]
[   10.928757] Disabling IRQ #7
[   11.000127] r8169 0000:0a:00.0 enp10s0: renamed from eth0
[   11.040131] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000:=
00/0000:00:08.1/0000:0c:00.1/sound/card0/input10
[   11.062301] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC671: li=
ne_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[   11.062314] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[   11.062321] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[   11.062327] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[   11.062331] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[   11.062335] snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x19
[   11.062340] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1b
[   11.100251] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:0=
8.1/0000:0c:00.6/sound/card1/input12
[   11.136401] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:=
08.1/0000:0c:00.6/sound/card1/input13
[   11.137883] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000=
:00:08.1/0000:0c:00.6/sound/card1/input14
[   11.138953] input: HD-Audio Generic Front Headphone as /devices/pci0000:=
00/0000:00:08.1/0000:0c:00.6/sound/card1/input15
[   11.176742] logitech-djreceiver 0003:046D:C534.0001: hidraw0: USB HID v1=
=2E11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
[   11.227161] Generic FE-GE Realtek PHY r8169-a00:00: attached PHY driver =
(mii_bus:phy_addr=3Dr8169-a00:00, irq=3DMAC)
[   11.237250] kvm: Nested Virtualization enabled
[   11.237675] SVM: kvm: Nested Paging enabled
[   11.237678] SVM: Virtual VMLOAD VMSAVE supported
[   11.237680] SVM: Virtual GIF supported
[   11.254272] rtw_8821ce 0000:09:00.0: enabling device (0100 -> 0103)
[   11.255242] rtw_8821ce 0000:09:00.0: Firmware version 24.8.0, H2C versio=
n 12
[   11.259785] MCE: In-kernel MCE decoding enabled.
[   11.363583] intel_rapl_common: Found RAPL domain package
[   11.363589] intel_rapl_common: Found RAPL domain core
[   11.410765] logitech-djreceiver 0003:046D:C534.0002: hiddev96,hidraw1: U=
SB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
[   11.420576] r8169 0000:0a:00.0 enp10s0: Link is Down
[   11.466717] input: HP WMI hotkeys as /devices/virtual/input/input11
[   11.469832] logitech-djreceiver 0003:046D:C534.0002: device of type eQUA=
D nano Lite (0x0a) connected on slot 1
[   11.471818] logitech-djreceiver 0003:046D:C534.0002: device of type eQUA=
D nano Lite (0x0a) connected on slot 2
[   11.472590] input: Logitech Wireless Keyboard PID:4075 Keyboard as /devi=
ces/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.=
0002/0003:046D:4075.0003/input/input16
[   11.508438] hid-generic 0003:046D:4075.0003: input,hidraw2: USB HID v1.1=
1 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/inp=
ut1:1
[   11.516054] input: Logitech Wireless Mouse PID:4054 Mouse as /devices/pc=
i0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0=
003:046D:4054.0004/input/input21
[   11.517269] hid-generic 0003:046D:4054.0004: input,hidraw3: USB HID v1.1=
1 Mouse [Logitech Wireless Mouse PID:4054] on usb-0000:01:00.0-11/input1:2
[   11.562528] mousedev: PS/2 mouse device common for all mice
[   11.564389] [drm] amdgpu kernel modesetting enabled.
[   11.589805] Virtual CRAT table created for CPU
[   11.590262] amdgpu: Topology: Add CPU node
[   11.591010] checking generic (d0000000 300000) vs hw (d0000000 10000000)
[   11.591018] fb0: switching to amdgpudrmfb from EFI VGA
[   11.592584] Console: switching to colour dummy device 80x25
[   11.592857] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[   11.594681] amdgpu 0000:0c:00.0: enabling device (0106 -> 0107)
[   11.601781] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 =
0x103C:0x87D6 0xCA).
[   11.601801] amdgpu 0000:0c:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re disabled as experimental (default)
[   11.601948] [drm] register mmio base: 0xFCA00000
[   11.601955] [drm] register mmio size: 524288
[   11.601959] [drm] PCIE atomic ops is not supported
[   11.602930] [drm] add ip block number 0 <soc15_common>
[   11.602939] [drm] add ip block number 1 <gmc_v9_0>
[   11.602941] [drm] add ip block number 2 <vega10_ih>
[   11.602944] [drm] add ip block number 3 <psp>
[   11.602946] [drm] add ip block number 4 <smu>
[   11.602949] [drm] add ip block number 5 <gfx_v9_0>
[   11.602951] [drm] add ip block number 6 <sdma_v4_0>
[   11.602954] [drm] add ip block number 7 <dm>
[   11.602956] [drm] add ip block number 8 <vcn_v2_0>
[   11.602959] [drm] add ip block number 9 <jpeg_v2_0>
[   11.603002] amdgpu 0000:0c:00.0: amdgpu: Fetched VBIOS from VFCT
[   11.603051] amdgpu: ATOM BIOS: 113-RENOIR-026
[   11.605135] [drm] VCN decode is enabled in VM mode
[   11.605141] [drm] VCN encode is enabled in VM mode
[   11.605144] [drm] JPEG decode is enabled in VM mode
[   11.606408] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[   11.606531] amdgpu 0000:0c:00.0: amdgpu: VRAM: 512M 0x000000F400000000 -=
 0x000000F41FFFFFFF (512M used)
[   11.606539] amdgpu 0000:0c:00.0: amdgpu: GART: 1024M 0x0000000000000000 =
- 0x000000003FFFFFFF
[   11.606545] amdgpu 0000:0c:00.0: amdgpu: AGP: 267419648M 0x000000F800000=
000 - 0x0000FFFFFFFFFFFF
[   11.606585] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
[   11.606588] [drm] RAM width 128bits DDR4
[   11.607685] [TTM] Zone  kernel: Available graphics memory: 14040156 KiB
[   11.607693] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   11.630603] [drm] amdgpu: 512M of VRAM memory ready
[   11.630690] [drm] amdgpu: 3072M of GTT memory ready.
[   11.630759] ------------[ cut here ]------------
[   11.630762] amdgpu 0000:0c:00.0: Buffer overflow detected. Allocation si=
ze: 3005. Mapping size: 4096.
[   11.630776] WARNING: CPU: 2 PID: 314 at kernel/dma/swiotlb.c:380 swiotlb=
_bounce+0x19b/0x1c0
[   11.630787] Modules linked in: joydev fjes(-) mousedev intel_rapl_msr in=
tel_rapl_common amdgpu(+) edac_mce_amd rtw88_8821ce rtw88_8821c rtw88_pci k=
vm_amd rtw88_core kvm snd_hda_codec_realtek snd_hda_codec_generic hp_wmi(+)=
 ledtrig_audio hid_logitech_dj snd_hda_codec_hdmi wmi_bmof sparse_keymap ir=
qbypass snd_hda_intel mac80211 snd_intel_dspcfg crct10dif_pclmul crc32_pclm=
ul snd_intel_sdw_acpi vfat fat ghash_clmulni_intel snd_hda_codec gpu_sched =
i2c_algo_bit aesni_intel drm_ttm_helper ttm crypto_simd r8169 snd_hda_core =
cryptd drm_kms_helper rapl realtek snd_hwdep cfg80211 mdio_devres pcspkr sn=
d_pcm k10temp cec snd_timer libphy sp5100_tco libarc4 tpm_crb snd syscopyar=
ea i2c_piix4 ccp sysfillrect soundcore sysimgblt fb_sys_fops usbhid tpm_tis=
 tpm_tis_core wmi video tpm gpio_amdpt pinctrl_amd rng_core gpio_generic ma=
c_hid acpi_tad acpi_cpufreq btusb btrtl btbcm btintel bluetooth ecdh_generi=
c rfkill ecc crc16 pkcs8_key_parser drm fuse agpgart bpf_preload ip_tables =
x_tables xfs libcrc32c
[   11.630983]  crc32c_generic crc32c_intel xhci_pci xhci_pci_renesas
[   11.630996] CPU: 2 PID: 314 Comm: systemd-udevd Tainted: G    B         =
    5.12.0-rc3-debug-00033-g167e3e00e2be #1
[   11.631003] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[   11.631007] RIP: 0010:swiotlb_bounce+0x19b/0x1c0
[   11.631014] Code: ef e8 a9 df 28 00 4c 8b 6d 00 48 89 ef e8 4d 23 8c 00 =
4d 89 f0 48 89 d9 4c 89 ea 48 89 c6 48 c7 c7 a0 ed e8 ae e8 3d 57 e7 00 <0f=
> 0b 48 c7 c7 e0 89 5b af 49 89 de e8 74 df 28 00 48 8b 05 dd 41
[   11.631020] RSP: 0018:ffffc9000190f138 EFLAGS: 00010286
[   11.631026] RAX: 0000000000000000 RBX: 0000000000000bbd RCX: 00000000000=
00000
[   11.631030] RDX: 0000000000000027 RSI: 0000000000000004 RDI: fffff520003=
21e19
[   11.631034] RBP: ffff8881050190c8 R08: ffffffffadacdcae R09: ffff8887c32=
a06eb
[   11.631038] R10: ffffed10f86540dd R11: 0000000000000001 R12: 000000000a2=
0d443
[   11.631042] R13: ffff888105081c90 R14: 0000000000001000 R15: 00000000000=
00002
[   11.631046] FS:  00007fbdc0f1ca40(0000) GS:ffff8887c3280000(0000) knlGS:=
0000000000000000
[   11.631051] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.631055] CR2: 00007fd6d40117f8 CR3: 000000013da9c000 CR4: 00000000003=
50ee0
[   11.631060] Call Trace:
[   11.631065]  swiotlb_tbl_map_single+0x6bb/0x6f0
[   11.631074]  swiotlb_map+0xc1/0x3f0
[   11.631080]  ? drm_mm_init+0x126/0x140 [drm]
[   11.631206]  ? swiotlb_sync_single_for_cpu+0x20/0x20
[   11.631213]  ? ttm_range_man_init+0xdd/0x100 [ttm]
[   11.631236]  ? amdgpu_ttm_init.cold+0x153/0x16f [amdgpu]
[   11.632193]  dma_map_page_attrs+0x299/0x390
[   11.632200]  ? dmam_free_coherent+0xe0/0xe0
[   11.632207]  amdgpu_gart_init+0x77/0xf0 [amdgpu]
[   11.632909]  gmc_v9_0_sw_init+0x910/0x980 [amdgpu]
[   11.633492]  ? gmc_v9_0_late_init+0xe0/0xe0 [amdgpu]
[   11.634128]  ? __drmm_add_action+0xf0/0x140 [drm]
[   11.634214]  ? drm_mode_config_cleanup+0x480/0x480 [drm]
[   11.634297]  ? drm_mode_config_cleanup+0x480/0x480 [drm]
[   11.634381]  amdgpu_device_init.cold+0x1483/0x2400 [amdgpu]
[   11.635013]  ? amdgpu_device_cache_pci_state+0x90/0x90 [amdgpu]
[   11.635601]  ? pci_find_saved_ext_cap+0x80/0x80
[   11.635607]  ? pci_bus_read_config_byte+0xf0/0xf0
[   11.635611]  ? __list_add_valid+0x2b/0xa0
[   11.635616]  ? kasan_unpoison+0x3a/0x60
[   11.635621]  ? pci_enable_device_flags+0x19c/0x250
[   11.635625]  ? pci_enable_bridge+0xe0/0xe0
[   11.635630]  amdgpu_driver_load_kms+0xb1/0x3f0 [amdgpu]
[   11.636214]  amdgpu_pci_probe+0x172/0x200 [amdgpu]
[   11.636796]  ? amdgpu_pci_remove+0x80/0x80 [amdgpu]
[   11.637510]  local_pci_probe+0x74/0xc0
[   11.637517]  pci_device_probe+0x1ee/0x300
[   11.637522]  ? pci_device_remove+0x100/0x100
[   11.637527]  ? kernfs_put+0x18/0x30
[   11.637531]  ? sysfs_do_create_link_sd+0x76/0xd0
[   11.637536]  really_probe+0x185/0x6c0
[   11.637541]  driver_probe_device+0x13f/0x1d0
[   11.637545]  device_driver_attach+0x110/0x120
[   11.637549]  ? device_driver_attach+0x120/0x120
[   11.637553]  __driver_attach+0xae/0x1a0
[   11.637557]  ? device_driver_attach+0x120/0x120
[   11.637560]  bus_for_each_dev+0xe6/0x140
[   11.637565]  ? subsys_dev_iter_exit+0x10/0x10
[   11.637569]  ? __list_add_valid+0x2b/0xa0
[   11.637574]  bus_add_driver+0x1f8/0x2e0
[   11.637580]  driver_register+0x10f/0x190
[   11.637584]  ? 0xffffffffc1588000
[   11.637588]  do_one_initcall+0x89/0x2a0
[   11.637593]  ? perf_trace_initcall_level+0x230/0x230
[   11.637597]  ? kfree+0xc3/0x480
[   11.637602]  ? kasan_set_track+0x1c/0x30
[   11.637607]  ? kasan_unpoison+0x3a/0x60
[   11.637611]  ? kasan_unpoison+0x3a/0x60
[   11.637615]  do_init_module+0xfd/0x3c0
[   11.637622]  load_module+0x3f44/0x41a0
[   11.637626]  ? xfs_file_buffered_read+0x82/0x130 [xfs]
[   11.637883]  ? module_frob_arch_sections+0x20/0x20
[   11.637888]  ? kernel_read+0x46/0xb0
[   11.637893]  ? kernel_read_file+0x1d2/0x3e0
[   11.637901]  ? __do_sys_finit_module+0x110/0x1a0
[   11.637905]  __do_sys_finit_module+0x110/0x1a0
[   11.637909]  ? __ia32_sys_init_module+0x40/0x40
[   11.637913]  ? get_nth_filter.part.0+0x170/0x170
[   11.637918]  ? randomize_stack_top+0x80/0x80
[   11.637923]  ? __ia32_compat_sys_newlstat+0x30/0x30
[   11.637929]  ? __audit_syscall_entry+0x193/0x1f0
[   11.637933]  ? ktime_get_coarse_real_ts64+0x4a/0x70
[   11.637938]  do_syscall_64+0x33/0x40
[   11.637944]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   11.637949] RIP: 0033:0x7fbdc184c18d
[   11.637953] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
[   11.637957] RSP: 002b:00007ffeae8de308 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   11.637962] RAX: ffffffffffffffda RBX: 000055db08823060 RCX: 00007fbdc18=
4c18d
[   11.637965] RDX: 0000000000000000 RSI: 00007fbdc19a9a9d RDI: 00000000000=
00018
[   11.637970] RBP: 0000000000020000 R08: 0000000000000000 R09: 00007fbdc1b=
dc5ea
[   11.637973] R10: 0000000000000018 R11: 0000000000000246 R12: 00007fbdc19=
a9a9d
[   11.637975] R13: 0000000000000000 R14: 000055db088292c0 R15: 000055db088=
23060
[   11.637980] ---[ end trace bee6f34729e28f2c ]---
[   11.637985] BUG: unable to handle page fault for address: 000008714b9094=
43
[   11.637995] #PF: supervisor write access in kernel mode
[   11.638001] #PF: error_code(0x0002) - not-present page
[   11.638007] PGD 0 P4D 0=20
[   11.638014] Oops: 0002 [#1] PREEMPT SMP KASAN NOPTI
[   11.638021] CPU: 2 PID: 314 Comm: systemd-udevd Tainted: G    B   W     =
    5.12.0-rc3-debug-00033-g167e3e00e2be #1
[   11.638031] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[   11.638038] RIP: 0010:__memcpy+0x12/0x20
[   11.638044] Code: 74 e0 8b 05 38 4e 67 01 85 c0 75 d6 e8 47 6f 6d ff b8 =
01 00 00 00 c3 cc 0f 1f 44 00 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 <f3=
> 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4
[   11.638058] RSP: 0018:ffffc9000190f188 EFLAGS: 00010206
[   11.638065] RAX: 000008714b909443 RBX: 000000000a20d000 RCX: 00000000000=
00177
[   11.638071] RDX: 0000000000000005 RSI: ffff88800a20d443 RDI: 000008714b9=
09443
[   11.638078] RBP: 0000000000000002 R08: 0000000000000001 R09: 000008714b9=
0a000
[   11.638085] R10: ffffed1001441bff R11: 0000000000000001 R12: 00000000000=
00002
[   11.638091] R13: ffff8887c008f000 R14: 0000000000000048 R15: 00000000000=
00002
[   11.638098] FS:  00007fbdc0f1ca40(0000) GS:ffff8887c3280000(0000) knlGS:=
0000000000000000
[   11.638106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.638112] CR2: 000008714b909443 CR3: 000000013da9c000 CR4: 00000000003=
50ee0
[   11.638119] Call Trace:
[   11.638123]  swiotlb_tbl_map_single+0x6bb/0x6f0
[   11.638133]  swiotlb_map+0xc1/0x3f0
[   11.638141]  ? drm_mm_init+0x126/0x140 [drm]
[   11.638225]  ? swiotlb_sync_single_for_cpu+0x20/0x20
[   11.638232]  ? ttm_range_man_init+0xdd/0x100 [ttm]
[   11.638251]  ? amdgpu_ttm_init.cold+0x153/0x16f [amdgpu]
[   11.638881]  dma_map_page_attrs+0x299/0x390
[   11.638888]  ? dmam_free_coherent+0xe0/0xe0
[   11.638896]  amdgpu_gart_init+0x77/0xf0 [amdgpu]
[   11.639489]  gmc_v9_0_sw_init+0x910/0x980 [amdgpu]
[   11.640090]  ? gmc_v9_0_late_init+0xe0/0xe0 [amdgpu]
[   11.640860]  ? __drmm_add_action+0xf0/0x140 [drm]
[   11.641004]  ? drm_mode_config_cleanup+0x480/0x480 [drm]
[   11.641127]  ? drm_mode_config_cleanup+0x480/0x480 [drm]
[   11.641222]  amdgpu_device_init.cold+0x1483/0x2400 [amdgpu]
[   11.641849]  ? amdgpu_device_cache_pci_state+0x90/0x90 [amdgpu]
[   11.642456]  ? pci_find_saved_ext_cap+0x80/0x80
[   11.642466]  ? pci_bus_read_config_byte+0xf0/0xf0
[   11.642473]  ? __list_add_valid+0x2b/0xa0
[   11.642481]  ? kasan_unpoison+0x3a/0x60
[   11.642490]  ? pci_enable_device_flags+0x19c/0x250
[   11.642497]  ? pci_enable_bridge+0xe0/0xe0
[   11.642505]  amdgpu_driver_load_kms+0xb1/0x3f0 [amdgpu]
[   11.643105]  amdgpu_pci_probe+0x172/0x200 [amdgpu]
[   11.643686]  ? amdgpu_pci_remove+0x80/0x80 [amdgpu]
[   11.644405]  local_pci_probe+0x74/0xc0
[   11.644415]  pci_device_probe+0x1ee/0x300
[   11.644422]  ? pci_device_remove+0x100/0x100
[   11.644430]  ? kernfs_put+0x18/0x30
[   11.644437]  ? sysfs_do_create_link_sd+0x76/0xd0
[   11.644446]  really_probe+0x185/0x6c0
[   11.644453]  driver_probe_device+0x13f/0x1d0
[   11.644460]  device_driver_attach+0x110/0x120
[   11.644467]  ? device_driver_attach+0x120/0x120
[   11.644474]  __driver_attach+0xae/0x1a0
[   11.644480]  ? device_driver_attach+0x120/0x120
[   11.644487]  bus_for_each_dev+0xe6/0x140
[   11.644494]  ? subsys_dev_iter_exit+0x10/0x10
[   11.644501]  ? __list_add_valid+0x2b/0xa0
[   11.644510]  bus_add_driver+0x1f8/0x2e0
[   11.644518]  driver_register+0x10f/0x190
[   11.644525]  ? 0xffffffffc1588000
[   11.644531]  do_one_initcall+0x89/0x2a0
[   11.644539]  ? perf_trace_initcall_level+0x230/0x230
[   11.644547]  ? kfree+0xc3/0x480
[   11.644554]  ? kasan_set_track+0x1c/0x30
[   11.644561]  ? kasan_unpoison+0x3a/0x60
[   11.644568]  ? kasan_unpoison+0x3a/0x60
[   11.644576]  do_init_module+0xfd/0x3c0
[   11.644585]  load_module+0x3f44/0x41a0
[   11.644592]  ? xfs_file_buffered_read+0x82/0x130 [xfs]
[   11.644852]  ? module_frob_arch_sections+0x20/0x20
[   11.644860]  ? kernel_read+0x46/0xb0
[   11.644868]  ? kernel_read_file+0x1d2/0x3e0
[   11.644879]  ? __do_sys_finit_module+0x110/0x1a0
[   11.644886]  __do_sys_finit_module+0x110/0x1a0
[   11.644893]  ? __ia32_sys_init_module+0x40/0x40
[   11.644900]  ? get_nth_filter.part.0+0x170/0x170
[   11.644909]  ? randomize_stack_top+0x80/0x80
[   11.644918]  ? __ia32_compat_sys_newlstat+0x30/0x30
[   11.644927]  ? __audit_syscall_entry+0x193/0x1f0
[   11.644934]  ? ktime_get_coarse_real_ts64+0x4a/0x70
[   11.644943]  do_syscall_64+0x33/0x40
[   11.644951]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   11.644959] RIP: 0033:0x7fbdc184c18d
[   11.644965] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
[   11.644979] RSP: 002b:00007ffeae8de308 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   11.644989] RAX: ffffffffffffffda RBX: 000055db08823060 RCX: 00007fbdc18=
4c18d
[   11.644996] RDX: 0000000000000000 RSI: 00007fbdc19a9a9d RDI: 00000000000=
00018
[   11.645002] RBP: 0000000000020000 R08: 0000000000000000 R09: 00007fbdc1b=
dc5ea
[   11.645009] R10: 0000000000000018 R11: 0000000000000246 R12: 00007fbdc19=
a9a9d
[   11.645015] R13: 0000000000000000 R14: 000055db088292c0 R15: 000055db088=
23060
[   11.645024] Modules linked in: joydev mousedev intel_rapl_msr intel_rapl=
_common amdgpu(+) edac_mce_amd rtw88_8821ce rtw88_8821c rtw88_pci kvm_amd r=
tw88_core kvm snd_hda_codec_realtek snd_hda_codec_generic hp_wmi(+) ledtrig=
_audio hid_logitech_dj snd_hda_codec_hdmi wmi_bmof sparse_keymap irqbypass =
snd_hda_intel mac80211 snd_intel_dspcfg crct10dif_pclmul crc32_pclmul snd_i=
ntel_sdw_acpi vfat fat ghash_clmulni_intel snd_hda_codec gpu_sched i2c_algo=
_bit aesni_intel drm_ttm_helper ttm crypto_simd r8169 snd_hda_core cryptd d=
rm_kms_helper rapl realtek snd_hwdep cfg80211 mdio_devres pcspkr snd_pcm k1=
0temp cec snd_timer libphy sp5100_tco libarc4 tpm_crb snd syscopyarea i2c_p=
iix4 ccp sysfillrect soundcore sysimgblt fb_sys_fops usbhid tpm_tis tpm_tis=
_core wmi video tpm gpio_amdpt pinctrl_amd rng_core gpio_generic mac_hid ac=
pi_tad acpi_cpufreq btusb btrtl btbcm btintel bluetooth ecdh_generic rfkill=
 ecc crc16 pkcs8_key_parser drm fuse agpgart bpf_preload ip_tables x_tables=
 xfs libcrc32c crc32c_generic
[   11.645156]  crc32c_intel xhci_pci xhci_pci_renesas
[   11.645210] CR2: 000008714b909443
[   11.645216] ---[ end trace bee6f34729e28f2d ]---
[   11.645221] RIP: 0010:__memcpy+0x12/0x20
[   11.645227] Code: 74 e0 8b 05 38 4e 67 01 85 c0 75 d6 e8 47 6f 6d ff b8 =
01 00 00 00 c3 cc 0f 1f 44 00 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 <f3=
> 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4
[   11.645241] RSP: 0018:ffffc9000190f188 EFLAGS: 00010206
[   11.645247] RAX: 000008714b909443 RBX: 000000000a20d000 RCX: 00000000000=
00177
[   11.645254] RDX: 0000000000000005 RSI: ffff88800a20d443 RDI: 000008714b9=
09443
[   11.645261] RBP: 0000000000000002 R08: 0000000000000001 R09: 000008714b9=
0a000
[   11.645268] R10: ffffed1001441bff R11: 0000000000000001 R12: 00000000000=
00002
[   11.645274] R13: ffff8887c008f000 R14: 0000000000000048 R15: 00000000000=
00002
[   11.645281] FS:  00007fbdc0f1ca40(0000) GS:ffff8887c3280000(0000) knlGS:=
0000000000000000
[   11.645289] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.645295] CR2: 000008714b909443 CR3: 000000013da9c000 CR4: 00000000003=
50ee0
[   11.911417] input: Logitech Wireless Keyboard PID:4075 as /devices/pci00=
00:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003=
:046D:4075.0003/input/input25
[   11.916555] logitech-hidpp-device 0003:046D:4075.0003: input,hidraw2: US=
B HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:0=
0.0-11/input1:1
[   11.999932] input: Logitech Wireless Mouse as /devices/pci0000:00/0000:0=
0:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4054.0=
004/input/input26
[   12.003578] logitech-hidpp-device 0003:046D:4054.0004: input,hidraw3: US=
B HID v1.11 Mouse [Logitech Wireless Mouse] on usb-0000:01:00.0-11/input1:2
[   12.093114] rtw_8821ce 0000:09:00.0: start vif 74:12:b3:a0:4a:cb on port=
 0
[   14.558903] r8169 0000:0a:00.0 enp10s0: Link is Up - 1Gbps/Full - flow c=
ontrol rx/tx
[   14.558977] IPv6: ADDRCONF(NETDEV_CHANGE): enp10s0: link becomes ready
[   16.594062] kauditd_printk_skb: 32 callbacks suppressed
[   16.594072] audit: type=3D1131 audit(1625508119.391:44): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-rfkill comm=3D"sy=
stemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? =
res=3Dsuccess'
[   22.787517] audit: type=3D1101 audit(1625508125.584:45): pid=3D431 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:accounting grantors=
=3Dpam_access,pam_unix,pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/bin/=
sshd" hostname=3D192.168.4.54 addr=3D192.168.4.54 terminal=3Dssh res=3Dsucc=
ess'
[   22.795143] audit: type=3D1103 audit(1625508125.591:46): pid=3D431 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:setcred grantors=3D=
pam_shells,pam_faillock,pam_permit,pam_env,pam_faillock acct=3D"nathan" exe=
=3D"/usr/bin/sshd" hostname=3D192.168.4.54 addr=3D192.168.4.54 terminal=3Ds=
sh res=3Dsuccess'
[   22.795888] audit: type=3D1006 audit(1625508125.591:47): pid=3D431 uid=
=3D0 old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 se=
s=3D1 res=3D1
[   22.796100] audit: type=3D1300 audit(1625508125.591:47): arch=3Dc000003e=
 syscall=3D1 success=3Dyes exit=3D4 a0=3D3 a1=3D7ffe0d54df00 a2=3D4 a3=3D3e=
8 items=3D0 ppid=3D394 pid=3D431 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D1 comm=3D"ssh=
d" exe=3D"/usr/bin/sshd" key=3D(null)
[   22.800853] audit: type=3D1327 audit(1625508125.591:47): proctitle=3D737=
368643A206E617468616E205B707269765D
[   22.877834] audit: type=3D1130 audit(1625508125.674:48): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser-runtime-dir@1000 com=
m=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termin=
al=3D? res=3Dsuccess'
[   22.917759] audit: type=3D1101 audit(1625508125.714:49): pid=3D434 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:accounting grantors=
=3Dpam_access,pam_unix,pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/lib/=
systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.918096] audit: type=3D1103 audit(1625508125.714:50): pid=3D434 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:setcred grantors=3D=
? acct=3D"nathan" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? te=
rminal=3D? res=3Dfailed'
[   22.918709] audit: type=3D1006 audit(1625508125.714:51): pid=3D434 uid=
=3D0 old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 se=
s=3D2 res=3D1
[   22.918795] audit: type=3D1300 audit(1625508125.714:51): arch=3Dc000003e=
 syscall=3D1 success=3Dyes exit=3D4 a0=3D9 a1=3D7fff13327970 a2=3D4 a3=3D3e=
8 items=3D0 ppid=3D1 pid=3D434 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=3D=
0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D2 comm=3D"(syste=
md)" exe=3D"/usr/lib/systemd/systemd" key=3D(null)
[   30.400687] kauditd_printk_skb: 11 callbacks suppressed
[   30.400699] audit: type=3D1100 audit(1625508133.194:60): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:authentication grantors=3Dpam_f=
aillock,pam_permit,pam_faillock acct=3D"nathan" exe=3D"/usr/bin/doas" hostn=
ame=3Dhp-4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.405376] audit: type=3D1101 audit(1625508133.201:61): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,=
pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/bin/doas" hostname=3Dhp-430=
0G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.406114] audit: type=3D1110 audit(1625508133.201:62): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:setcred grantors=3Dpam_faillock=
,pam_permit,pam_faillock acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-=
4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.407411] audit: type=3D1105 audit(1625508133.204:63): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_open grantors=3Dpam_lim=
its,pam_unix,pam_permit acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-4=
300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.473080] audit: type=3D1106 audit(1625508133.268:64): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_close grantors=3Dpam_li=
mits,pam_unix,pam_permit acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-=
4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.474043] audit: type=3D1104 audit(1625508133.271:65): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:setcred grantors=3Dpam_faillock=
,pam_permit,pam_faillock acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-=
4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   32.679545] audit: type=3D1101 audit(1625508135.474:66): pid=3D646 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,=
pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/bin/doas" hostname=3Dhp-430=
0G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   32.680133] audit: type=3D1110 audit(1625508135.474:67): pid=3D646 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:setcred grantors=3Dpam_faillock=
,pam_permit,pam_env,pam_faillock acct=3D"root" exe=3D"/usr/bin/doas" hostna=
me=3Dhp-4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   32.681346] audit: type=3D1105 audit(1625508135.478:68): pid=3D646 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_open grantors=3Dpam_lim=
its,pam_unix,pam_permit acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-4=
300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'

--/SG/dXypw7vuCiM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="7d31f1c65cc9-debug-1-decoded.log"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 5.12.0-rc3-debug-00033-g167e3e00e2be (nathan@a=
rchlinux-ax161) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PRE=
EMPT Mon Jul 5 10:52:15 MST 2021
[    0.000000] Command line: initrd=3Damd-ucode.img initrd=3Dinitramfs-linu=
x-debug.img root=3DPARTUUID=3D8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel=
_pstate=3Dno_hwp
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009c0ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009c10000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a20cfff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20d000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000b838ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b8390000-0x00000000b86c5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000b8a15000-0x00000000badfefff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000badff000-0x00000000bbffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000bc000000-0x00000000bdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000bf000000-0x00000000bfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd200000-0x00000000fd2fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd600000-0x00000000fd6fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000081f37ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000081f380000-0x000000083fffffff] reser=
ved
[    0.000000] intel_pstate: HWP disabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xb4c66018-0xb4c73457] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xb4c66018-0xb4c73457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009c0ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009c10000-0x0000000009ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a20cf=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20d000-0x000000000affff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000b4c660=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000b4c66018-0x00000000b4c734=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000b4c73458-0x00000000b838ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000b8390000-0x00000000b86c5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000b86c6000-0x00000000b8721f=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000b8722000-0x00000000b8a14f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000b8a15000-0x00000000badfef=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000badff000-0x00000000bbffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000bc000000-0x00000000bdffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000bf000000-0x00000000bfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd200000-0x00000000fd2fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd600000-0x00000000fd6fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000081f37ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000081f380000-0x000000083fffff=
ff] reserved
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi: ACPI=3D0xb8721000 ACPI 2.0=3D0xb8721014 TPMFinalLog=3D0=
xb89c8000 SMBIOS=3D0xbac0f000 SMBIOS 3.0=3D0xbac0e000 MEMATTR=3D0xb5183018 =
ESRT=3D0xb6cf5018 RNG=3D0xbac3e998 TPMEventLog=3D0xb5184018
[    0.000000] efi: seeding entropy pool
[    0.000000] SMBIOS 3.3.0 present.
[    0.000000] DMI: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3792.936 MHz processor
[    0.000280] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000287] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000309] last_pfn =3D 0x81f380 max_arch_pfn =3D 0x400000000
[    0.000615] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.001571] e820: update [mem 0xc0000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.001586] last_pfn =3D 0xbc000 max_arch_pfn =3D 0x400000000
[    0.006163] esrt: Reserving ESRT space from 0x00000000b6cf5018 to 0x0000=
0000b6cf5050.
[    0.006185] e820: update [mem 0xb6cf5000-0xb6cf5fff] usable =3D=3D> rese=
rved
[    0.006628] check: Scanning 1 areas for low memory corruption
[    0.006637] Using GB pages for direct mapping
[    0.012545] Secure boot disabled
[    0.012547] RAMDISK: [mem 0x7f7c7000-0x7fff5fff]
[    0.012570] ACPI: Early table checksum verification disabled
[    0.012577] ACPI: RSDP 0x00000000B8721014 000024 (v02 HPQOEM)
[    0.012586] ACPI: XSDT 0x00000000B8720728 0000EC (v01 HPQOEM SLIC-CPC 01=
072009 AMI  01000013)
[    0.012598] ACPI: FACP 0x00000000B870F000 000114 (v06 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012612] ACPI: DSDT 0x00000000B86FE000 01050C (v02 HPQOEM SLIC-CPC 01=
072009 INTL 20120913)
[    0.012622] ACPI: FACS 0x00000000B89F8000 000040
[    0.012630] ACPI: MSDM 0x00000000B871F000 000055 (v03 HPQOEM SLIC-CPC 01=
072009 AMI  01000013)
[    0.012638] ACPI: SSDT 0x00000000B871E000 000050 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012646] ACPI: IVRS 0x00000000B871D000 0000D0 (v02 HPQOEM SLIC-CPC 00=
000001 AMD  00000000)
[    0.012654] ACPI: SSDT 0x00000000B8715000 007229 (v02 HPQOEM SLIC-CPC 00=
000002 MSFT 04000000)
[    0.012662] ACPI: SSDT 0x00000000B8711000 003BA1 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012670] ACPI: SSDT 0x00000000B8710000 000094 (v02 HPQOEM SLIC-CPC 01=
072009 AMI  01072009)
[    0.012678] ACPI: FIDT 0x00000000B86FD000 00009C (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012686] ACPI: MCFG 0x00000000B86FC000 00003C (v01 HPQOEM SLIC-CPC 01=
072009 MSFT 00010013)
[    0.012694] ACPI: HPET 0x00000000B86FB000 000038 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00000005)
[    0.012702] ACPI: VFCT 0x00000000B86ED000 00D484 (v01 HPQOEM SLIC-CPC 00=
000001 AMD  31504F47)
[    0.012710] ACPI: BGRT 0x00000000B86EC000 000038 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012718] ACPI: TPM2 0x00000000B86EB000 00004C (v04 HPQOEM SLIC-CPC 00=
000001 AMI  00000000)
[    0.012726] ACPI: SSDT 0x00000000B86E9000 001CE4 (v02 HPQOEM SLIC-CPC 00=
000001 AMD  00000001)
[    0.012734] ACPI: CRAT 0x00000000B86E8000 0007E8 (v01 HPQOEM SLIC-CPC 00=
000001 AMD  00000001)
[    0.012742] ACPI: CDIT 0x00000000B86E7000 000029 (v01 HPQOEM SLIC-CPC 00=
000001 AMD  00000001)
[    0.012750] ACPI: SSDT 0x00000000B86E6000 000D37 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012758] ACPI: SSDT 0x00000000B86E4000 0010A5 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012765] ACPI: SSDT 0x00000000B86E0000 00333E (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012773] ACPI: SSDT 0x00000000B86DF000 0000BF (v01 HPQOEM SLIC-CPC 00=
001000 INTL 20120913)
[    0.012781] ACPI: WSMT 0x00000000B86DE000 000028 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012789] ACPI: APIC 0x00000000B86DD000 00015E (v03 HPQOEM SLIC-CPC 01=
072009 AMI  00010013)
[    0.012797] ACPI: SSDT 0x00000000B86DC000 000517 (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012805] ACPI: SSDT 0x00000000B86DA000 0010AF (v01 HPQOEM SLIC-CPC 00=
000001 INTL 20120913)
[    0.012813] ACPI: FPDT 0x00000000B86D9000 000044 (v01 HPQOEM SLIC-CPC 01=
072009 AMI  01000013)
[    0.012827] ACPI: Local APIC address 0xfee00000
[    0.013152] No NUMA configuration found
[    0.013154] Faking a node at [mem 0x0000000000000000-0x000000081f37ffff]
[    0.013164] NODE_DATA(0) allocated [mem 0x81f37c000-0x81f37ffff]
[    0.013278] Zone ranges:
[    0.013280]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.013284]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.013288]   Normal   [mem 0x0000000100000000-0x000000081f37ffff]
[    0.013292]   Device   empty
[    0.013295] Movable zone start for each node
[    0.013297] Early memory node ranges
[    0.013298]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.013301]   node   0: [mem 0x0000000000100000-0x0000000009c0ffff]
[    0.013304]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.013306]   node   0: [mem 0x000000000a20d000-0x000000000affffff]
[    0.013309]   node   0: [mem 0x000000000b020000-0x00000000b838ffff]
[    0.013312]   node   0: [mem 0x00000000badff000-0x00000000bbffffff]
[    0.013314]   node   0: [mem 0x0000000100000000-0x000000081f37ffff]
[    0.013322] Initmem setup node 0 [mem 0x0000000000001000-0x000000081f37f=
fff]
[    0.013326] On node 0 totalpages: 8225939
[    0.013329]   DMA zone: 64 pages used for memmap
[    0.013331]   DMA zone: 26 pages reserved
[    0.013334]   DMA zone: 3999 pages, LIFO batch:0
[    0.015777]   DMA zone: 28769 pages in unavailable ranges
[    0.015779]   DMA32 zone: 11782 pages used for memmap
[    0.015781]   DMA32 zone: 754036 pages, LIFO batch:63
[    0.059946]   DMA32 zone: 28300 pages in unavailable ranges
[    0.059954]   Normal zone: 116686 pages used for memmap
[    0.059956]   Normal zone: 7467904 pages, LIFO batch:63
[    0.477178]   Normal zone: 3200 pages in unavailable ranges
[    0.918352] kasan: KernelAddressSanitizer initialized
[    0.918877] ACPI: PM-Timer IO Port: 0x808
[    0.918881] ACPI: Local APIC address 0xfee00000
[    0.918894] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.918911] IOAPIC[0]: apic_id 9, version 33, address 0xfec00000, GSI 0-=
23
[    0.918918] IOAPIC[1]: apic_id 10, version 33, address 0xfec01000, GSI 2=
4-55
[    0.918923] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.918927] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.918931] ACPI: IRQ0 used by override.
[    0.918934] ACPI: IRQ9 used by override.
[    0.918939] Using ACPI (MADT) for SMP configuration information
[    0.918942] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.918969] e820: update [mem 0xb5158000-0xb517ffff] usable =3D=3D> rese=
rved
[    0.919000] smpboot: Allowing 32 CPUs, 24 hotplug CPUs
[    0.919115] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.919122] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.919129] PM: hibernation: Registered nosave memory: [mem 0x09c10000-0=
x09ffffff]
[    0.919136] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a20cfff]
[    0.919143] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0=
x0b01ffff]
[    0.919150] PM: hibernation: Registered nosave memory: [mem 0xb4c66000-0=
xb4c66fff]
[    0.919157] PM: hibernation: Registered nosave memory: [mem 0xb4c73000-0=
xb4c73fff]
[    0.919164] PM: hibernation: Registered nosave memory: [mem 0xb5158000-0=
xb517ffff]
[    0.919171] PM: hibernation: Registered nosave memory: [mem 0xb6cf5000-0=
xb6cf5fff]
[    0.919179] PM: hibernation: Registered nosave memory: [mem 0xb8390000-0=
xb86c5fff]
[    0.919181] PM: hibernation: Registered nosave memory: [mem 0xb86c6000-0=
xb8721fff]
[    0.919183] PM: hibernation: Registered nosave memory: [mem 0xb8722000-0=
xb8a14fff]
[    0.919186] PM: hibernation: Registered nosave memory: [mem 0xb8a15000-0=
xbadfefff]
[    0.919193] PM: hibernation: Registered nosave memory: [mem 0xbc000000-0=
xbdffffff]
[    0.919196] PM: hibernation: Registered nosave memory: [mem 0xbe000000-0=
xbeffffff]
[    0.919198] PM: hibernation: Registered nosave memory: [mem 0xbf000000-0=
xbfffffff]
[    0.919201] PM: hibernation: Registered nosave memory: [mem 0xc0000000-0=
xefffffff]
[    0.919203] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0=
xf7ffffff]
[    0.919205] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0=
xfd1fffff]
[    0.919208] PM: hibernation: Registered nosave memory: [mem 0xfd200000-0=
xfd2fffff]
[    0.919210] PM: hibernation: Registered nosave memory: [mem 0xfd300000-0=
xfd5fffff]
[    0.919213] PM: hibernation: Registered nosave memory: [mem 0xfd600000-0=
xfd6fffff]
[    0.919215] PM: hibernation: Registered nosave memory: [mem 0xfd700000-0=
xfe9fffff]
[    0.919217] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0=
xfea0ffff]
[    0.919220] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0=
xfeb7ffff]
[    0.919222] PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0=
xfec01fff]
[    0.919225] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0=
xfec0ffff]
[    0.919227] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0=
xfec10fff]
[    0.919229] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0=
xfec2ffff]
[    0.919232] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0=
xfec30fff]
[    0.919234] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0=
xfecfffff]
[    0.919237] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.919239] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed3ffff]
[    0.919241] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0=
xfed44fff]
[    0.919244] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0=
xfed7ffff]
[    0.919246] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfed8ffff]
[    0.919249] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0=
xfedc1fff]
[    0.919251] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0=
xfedcffff]
[    0.919253] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0=
xfedd3fff]
[    0.919256] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0=
xfedd5fff]
[    0.919258] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0=
xfeffffff]
[    0.919261] PM: hibernation: Registered nosave memory: [mem 0xff000000-0=
xffffffff]
[    0.919266] [mem 0xc0000000-0xefffffff] available for PCI devices
[    0.919270] Booting paravirtualized kernel on bare hardware
[    0.919274] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.927878] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:32 =
nr_node_ids:1
[    0.929637] percpu: Embedded 64 pages/cpu s225280 r8192 d28672 u262144
[    0.929671] pcpu-alloc: s225280 r8192 d28672 u262144 alloc=3D1*2097152
[    0.929677] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 1=
3 14 15
[    0.929704] pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 2=
9 30 31
[    0.929806] Built 1 zonelists, mobility grouping on.  Total pages: 80973=
81
[    0.929809] Policy zone: Normal
[    0.929812] Kernel command line: initrd=3Damd-ucode.img initrd=3Dinitram=
fs-linux-debug.img root=3DPARTUUID=3D8680aa0c-cf09-4a69-8cf3-970478040ee7 r=
w intel_pstate=3Dno_hwp
[    0.929899] printk: log_buf_len individual max cpu contribution: 4096 by=
tes
[    0.929901] printk: log_buf_len total cpu_extra contributions: 126976 by=
tes
[    0.929903] printk: log_buf_len min size: 131072 bytes
[    0.930262] printk: log_buf_len: 262144 bytes
[    0.930264] printk: early log buf free: 114328(87%)
[    0.933977] Dentry cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes, linear)
[    0.935848] Inode-cache hash table entries: 2097152 (order: 12, 16777216=
 bytes, linear)
[    0.936118] mem auto-init: stack:off, heap alloc:on, heap free:off
[    1.642466] Memory: 27987960K/32903756K available (20488K kernel code, 7=
279K rwdata, 8472K rodata, 2012K init, 5244K bss, 4915540K reserved, 0K cma=
-reserved)
[    1.642480] random: get_random_u64 called from __kmem_cache_create+0x2a/=
0x540 with crng_init=3D0=20
[    1.643591] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D32, =
Nodes=3D1
[    1.643651] ftrace: allocating 41986 entries in 165 pages
[    1.667334] ftrace: allocated 165 pages with 4 groups
[    1.668416] rcu: Preemptible hierarchical RCU implementation.
[    1.668418] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[    1.668420] rcu: 	RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_ids=
=3D32.
[    1.668422] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    1.668425] 	Trampoline variant of Tasks RCU enabled.
[    1.668427] 	Rude variant of Tasks RCU enabled.
[    1.668428] 	Tracing variant of Tasks RCU enabled.
[    1.668430] rcu: RCU calculated value of scheduler-enlistment delay is 3=
0 jiffies.
[    1.668432] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D32
[    1.700587] NR_IRQS: 20736, nr_irqs: 1224, preallocated irqs: 16
[    1.701467] Console: colour dummy device 80x25
[    1.701534] printk: console [tty0] enabled
[    1.701628] ACPI: Core revision 20210105
[    1.703688] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    1.703717] APIC: Switch to symmetric I/O mode setup
[    1.705705] Switched APIC routing to physical flat.
[    1.707227] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    1.723724] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x6d588d6a09c, max_idle_ns: 881590727049 ns
[    1.723739] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 7588.95 BogoMIPS (lpj=3D12643120)
[    1.723745] pid_max: default: 32768 minimum: 301
[    1.733354] LSM: Security Framework initializing
[    1.733395] Yama: becoming mindful.
[    1.733644] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s, linear)
[    1.733718] Mountpoint-cache hash table entries: 65536 (order: 7, 524288=
 bytes, linear)
[    1.735662] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    1.735762] LVT offset 1 assigned for vector 0xf9
[    1.735819] LVT offset 2 assigned for vector 0xf4
[    1.735836] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    1.735839] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    1.735845] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    1.735849] Spectre V2 : Mitigation: Full AMD retpoline
[    1.735851] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    1.735853] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    1.735855] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    1.735858] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    1.735860] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    1.736225] Freeing SMP alternatives memory: 32K
[    1.844242] smpboot: CPU0: AMD Ryzen 3 4300G with Radeon Graphics (famil=
y: 0x17, model: 0x60, stepping: 0x1)
[    1.845243] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    1.845254] ... version:                0
[    1.845256] ... bit width:              48
[    1.845258] ... generic registers:      6
[    1.845259] ... value mask:             0000ffffffffffff
[    1.845261] ... max period:             00007fffffffffff
[    1.845263] ... fixed-purpose events:   0
[    1.845265] ... event mask:             000000000000003f
[    1.845496] rcu: Hierarchical SRCU implementation.
[    1.849560] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    1.852535] smp: Bringing up secondary CPUs ...
[    1.853409] x86: Booting SMP configuration:
[    1.853412] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
[    1.874254] smp: Brought up 1 node, 8 CPUs
[    1.874260] smpboot: Max logical packages: 4
[    1.874262] smpboot: Total of 8 processors activated (60711.60 BogoMIPS)
[    1.882108] devtmpfs: initialized
[    1.882108] x86/mm: Memory block size: 128MB
[    1.931108] PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20cfff] =
(53248 bytes)
[    1.931108] PM: Registering ACPI NVS region [mem 0xb8722000-0xb8a14fff] =
(3092480 bytes)
[    1.935783] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    1.935824] futex hash table entries: 8192 (order: 7, 524288 bytes, line=
ar)
[    1.936354] pinctrl core: initialized pinctrl subsystem
[    1.937662] PM: RTC time: 18:01:44, date: 2021-07-05
[    1.938802] NET: Registered protocol family 16
[    1.940659] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    1.941182] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    1.941702] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    1.941826] audit: initializing netlink subsys (disabled)
[    1.941904] audit: type=3D2000 audit(1625508104.233:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    1.944097] thermal_sys: Registered thermal governor 'fair_share'
[    1.944100] thermal_sys: Registered thermal governor 'bang_bang'
[    1.944102] thermal_sys: Registered thermal governor 'step_wise'
[    1.944104] thermal_sys: Registered thermal governor 'user_space'
[    1.944106] thermal_sys: Registered thermal governor 'power_allocator'
[    1.944183] cpuidle: using governor ladder
[    1.944183] cpuidle: using governor menu
[    1.944183] ACPI: bus type PCI registered
[    1.944183] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    1.944828] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000=
-0xf7ffffff] (base 0xf0000000)
[    1.944842] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
[    1.950889] PCI: Using configuration type 1 for base access
[    1.983636] Kprobes globally optimized
[    1.983989] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    1.983989] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.992155] ACPI: Added _OSI(Module Device)
[    1.992159] ACPI: Added _OSI(Processor Device)
[    1.992161] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.992163] ACPI: Added _OSI(Processor Aggregator Device)
[    1.992180] ACPI: Added _OSI(Linux-Dell-Video)
[    1.992194] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    1.992207] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    2.797646] ACPI: 12 ACPI AML tables successfully acquired and loaded
[    2.847458] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    3.194961] ACPI: EC: EC started
[    3.194966] ACPI: EC: interrupt blocked
[    3.195008] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    3.195018] ACPI: _SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle trans=
actions
[    3.195024] ACPI: Interpreter enabled
[    3.195193] ACPI: (supports S0 S3 S4 S5)
[    3.195196] ACPI: Using IOAPIC for interrupt routing
[    3.200393] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    3.215236] ACPI: Enabled 4 GPEs in block 00 to 1F
[    3.580211] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    3.580251] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    3.588446] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g AER LTR DPC]
[    3.596390] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability]
[    3.596579] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus 00-7f] only partially covers this bridge
[    3.610071] PCI host bridge to bus 0000:00
[    3.610083] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    3.610096] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    3.610107] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    3.610118] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    3.610130] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    3.610141] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dfff=
f window]
[    3.610152] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfec2fff=
f window]
[    3.610163] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xfffffff=
f window]
[    3.610176] pci_bus 0000:00: root bus resource [bus 00-ff]
[    3.610333] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
[    3.612614] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
[    3.614862] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
[    3.616444] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
[    3.618052] pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
[    3.618078] pci 0000:00:02.1: enabling Extended Tags
[    3.618183] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    3.622301] pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
[    3.622328] pci 0000:00:02.2: enabling Extended Tags
[    3.622432] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
[    3.625017] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
[    3.626612] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
[    3.626637] pci 0000:00:08.1: enabling Extended Tags
[    3.626737] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    3.629320] pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
[    3.629345] pci 0000:00:08.2: enabling Extended Tags
[    3.629445] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    3.632062] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    3.634325] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    3.636604] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
[    3.638170] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
[    3.639716] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
[    3.641299] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
[    3.642859] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
[    3.644429] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
[    3.645990] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
[    3.647557] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
[    3.650047] pci 0000:01:00.0: [1022:43d1] type 00 class 0x0c0330
[    3.650068] pci 0000:01:00.0: reg 0x10: [mem 0xfcda0000-0xfcda7fff 64bit]
[    3.650111] pci 0000:01:00.0: enabling Extended Tags
[    3.650313] pci 0000:01:00.0: PME# supported from D3hot D3cold
[    3.651859] pci 0000:01:00.1: [1022:43c8] type 00 class 0x010601
[    3.651897] pci 0000:01:00.1: reg 0x24: [mem 0xfcd80000-0xfcd9ffff]
[    3.651905] pci 0000:01:00.1: reg 0x30: [mem 0xfcd00000-0xfcd7ffff pref]
[    3.651914] pci 0000:01:00.1: enabling Extended Tags
[    3.652099] pci 0000:01:00.1: PME# supported from D3hot D3cold
[    3.660042] pci 0000:01:00.2: [1022:43c6] type 01 class 0x060400
[    3.660088] pci 0000:01:00.2: enabling Extended Tags
[    3.660269] pci 0000:01:00.2: PME# supported from D3hot D3cold
[    3.661760] pci 0000:00:02.1: PCI bridge to [bus 01-0a]
[    3.661766] pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
[    3.661771] pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
[    3.664265] pci 0000:02:00.0: [1022:43c7] type 01 class 0x060400
[    3.664314] pci 0000:02:00.0: enabling Extended Tags
[    3.664573] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    3.666425] pci 0000:02:01.0: [1022:43c7] type 01 class 0x060400
[    3.666473] pci 0000:02:01.0: enabling Extended Tags
[    3.666735] pci 0000:02:01.0: PME# supported from D3hot D3cold
[    3.668564] pci 0000:02:02.0: [1022:43c7] type 01 class 0x060400
[    3.668612] pci 0000:02:02.0: enabling Extended Tags
[    3.668876] pci 0000:02:02.0: PME# supported from D3hot D3cold
[    3.670718] pci 0000:02:03.0: [1022:43c7] type 01 class 0x060400
[    3.670766] pci 0000:02:03.0: enabling Extended Tags
[    3.671027] pci 0000:02:03.0: PME# supported from D3hot D3cold
[    3.672863] pci 0000:02:04.0: [1022:43c7] type 01 class 0x060400
[    3.672912] pci 0000:02:04.0: enabling Extended Tags
[    3.673170] pci 0000:02:04.0: PME# supported from D3hot D3cold
[    3.675020] pci 0000:02:05.0: [1022:43c7] type 01 class 0x060400
[    3.675069] pci 0000:02:05.0: enabling Extended Tags
[    3.675331] pci 0000:02:05.0: PME# supported from D3hot D3cold
[    3.677201] pci 0000:02:06.0: [1022:43c7] type 01 class 0x060400
[    3.677249] pci 0000:02:06.0: enabling Extended Tags
[    3.677509] pci 0000:02:06.0: PME# supported from D3hot D3cold
[    3.679360] pci 0000:02:07.0: [1022:43c7] type 01 class 0x060400
[    3.679408] pci 0000:02:07.0: enabling Extended Tags
[    3.679668] pci 0000:02:07.0: PME# supported from D3hot D3cold
[    3.681502] pci 0000:01:00.2: PCI bridge to [bus 02-0a]
[    3.681510] pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
[    3.681516] pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
[    3.682091] pci 0000:02:00.0: PCI bridge to [bus 03]
[    3.682671] pci 0000:02:01.0: PCI bridge to [bus 04]
[    3.683240] pci 0000:02:02.0: PCI bridge to [bus 05]
[    3.683819] pci 0000:02:03.0: PCI bridge to [bus 06]
[    3.684392] pci 0000:02:04.0: PCI bridge to [bus 07]
[    3.684675] pci 0000:02:05.0: PCI bridge to [bus 08]
[    3.685027] pci 0000:09:00.0: [10ec:c821] type 00 class 0x028000
[    3.685056] pci 0000:09:00.0: reg 0x10: [io  0xe000-0xe0ff]
[    3.685091] pci 0000:09:00.0: reg 0x18: [mem 0xfcc00000-0xfcc0ffff 64bit]
[    3.685567] pci 0000:09:00.0: supports D1 D2
[    3.685570] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    3.686427] pci 0000:02:06.0: PCI bridge to [bus 09]
[    3.686434] pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
[    3.686439] pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
[    3.686767] pci 0000:0a:00.0: [10ec:8168] type 00 class 0x020000
[    3.686797] pci 0000:0a:00.0: reg 0x10: [io  0xd000-0xd0ff]
[    3.686836] pci 0000:0a:00.0: reg 0x18: [mem 0xfcb04000-0xfcb04fff 64bit]
[    3.686862] pci 0000:0a:00.0: reg 0x20: [mem 0xfcb00000-0xfcb03fff 64bit]
[    3.687312] pci 0000:0a:00.0: supports D1 D2
[    3.687314] pci 0000:0a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    3.688181] pci 0000:02:07.0: PCI bridge to [bus 0a]
[    3.688188] pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
[    3.688193] pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    3.688810] pci 0000:0b:00.0: [1c5c:1339] type 00 class 0x010802
[    3.688830] pci 0000:0b:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
[    3.689078] pci 0000:0b:00.0: supports D1
[    3.689080] pci 0000:0b:00.0: PME# supported from D0 D1 D3hot
[    3.689157] pci 0000:0b:00.0: 15.752 Gb/s available PCIe bandwidth, limi=
ted by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 31.504 Gb/s with 8=
=2E0 GT/s PCIe x4 link)
[    3.689819] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    3.689825] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
[    3.691693] pci 0000:0c:00.0: [1002:1636] type 00 class 0x030000
[    3.691707] pci 0000:0c:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit=
 pref]
[    3.691717] pci 0000:0c:00.0: reg 0x18: [mem 0xe0000000-0xe01fffff 64bit=
 pref]
[    3.691725] pci 0000:0c:00.0: reg 0x20: [io  0xf000-0xf0ff]
[    3.691733] pci 0000:0c:00.0: reg 0x24: [mem 0xfca00000-0xfca7ffff]
[    3.691744] pci 0000:0c:00.0: enabling Extended Tags
[    3.691887] pci 0000:0c:00.0: BAR 0: assigned to efifb
[    3.691937] pci 0000:0c:00.0: PME# supported from D1 D2 D3hot D3cold
[    3.691975] pci 0000:0c:00.0: 126.016 Gb/s available PCIe bandwidth, lim=
ited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s wit=
h 16.0 GT/s PCIe x16 link)
[    3.693671] pci 0000:0c:00.1: [1002:1637] type 00 class 0x040300
[    3.693682] pci 0000:0c:00.1: reg 0x10: [mem 0xfca88000-0xfca8bfff]
[    3.693706] pci 0000:0c:00.1: enabling Extended Tags
[    3.693878] pci 0000:0c:00.1: PME# supported from D1 D2 D3hot D3cold
[    3.695558] pci 0000:0c:00.2: [1022:15df] type 00 class 0x108000
[    3.695574] pci 0000:0c:00.2: reg 0x18: [mem 0xfc900000-0xfc9fffff]
[    3.695587] pci 0000:0c:00.2: reg 0x24: [mem 0xfca8c000-0xfca8dfff]
[    3.695596] pci 0000:0c:00.2: enabling Extended Tags
[    3.697366] pci 0000:0c:00.3: [1022:1639] type 00 class 0x0c0330
[    3.697382] pci 0000:0c:00.3: reg 0x10: [mem 0xfc800000-0xfc8fffff 64bit]
[    3.697409] pci 0000:0c:00.3: enabling Extended Tags
[    3.697581] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    3.699262] pci 0000:0c:00.4: [1022:1639] type 00 class 0x0c0330
[    3.699276] pci 0000:0c:00.4: reg 0x10: [mem 0xfc700000-0xfc7fffff 64bit]
[    3.699303] pci 0000:0c:00.4: enabling Extended Tags
[    3.699470] pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
[    3.701157] pci 0000:0c:00.6: [1022:15e3] type 00 class 0x040300
[    3.701168] pci 0000:0c:00.6: reg 0x10: [mem 0xfca80000-0xfca87fff]
[    3.701192] pci 0000:0c:00.6: enabling Extended Tags
[    3.701357] pci 0000:0c:00.6: PME# supported from D0 D3hot D3cold
[    3.703159] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    3.703165] pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
[    3.703169] pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
[    3.703175] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff=
 64bit pref]
[    3.703911] pci 0000:0d:00.0: [1022:7901] type 00 class 0x010601
[    3.703936] pci 0000:0d:00.0: reg 0x24: [mem 0xfce01000-0xfce017ff]
[    3.703946] pci 0000:0d:00.0: enabling Extended Tags
[    3.704154] pci 0000:0d:00.0: 126.016 Gb/s available PCIe bandwidth, lim=
ited by 8.0 GT/s PCIe x16 link at 0000:00:08.2 (capable of 252.048 Gb/s wit=
h 16.0 GT/s PCIe x16 link)
[    3.705404] pci 0000:0d:00.1: [1022:7901] type 00 class 0x010601
[    3.705429] pci 0000:0d:00.1: reg 0x24: [mem 0xfce00000-0xfce007ff]
[    3.705439] pci 0000:0d:00.1: enabling Extended Tags
[    3.706926] pci 0000:00:08.2: PCI bridge to [bus 0d]
[    3.706933] pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
[    3.719188] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    3.720993] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    3.722685] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    3.724579] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    3.726367] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    3.727890] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    3.729400] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    3.730923] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    3.748921] ACPI: EC: interrupt unblocked
[    3.748925] ACPI: EC: event unblocked
[    3.748931] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    3.748933] ACPI: EC: GPE=3D0x3
[    3.748945] ACPI: _SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization compl=
ete
[    3.748962] ACPI: _SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions a=
nd events
[    3.749531] iommu: Default domain type: Translated
[    3.750467] pci 0000:0c:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    3.750470] pci 0000:0c:00.0: vgaarb: bridge control possible
[    3.750473] pci 0000:0c:00.0: vgaarb: setting as boot device
[    3.750476] vgaarb: loaded
[    3.753243] SCSI subsystem initialized
[    3.753883] libata version 3.00 loaded.
[    3.753932] ACPI: bus type USB registered
[    3.753977] usbcore: registered new interface driver usbfs
[    3.754032] usbcore: registered new interface driver hub
[    3.754119] usbcore: registered new device driver usb
[    3.754432] pps_core: LinuxPPS API ver. 1 registered
[    3.754434] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    3.754483] PTP clock support registered
[    3.754579] EDAC MC: Ver: 3.0.0
[    3.755028] Registered efivars operations
[    3.758940] NetLabel: Initializing
[    3.758943] NetLabel:  domain hash size =3D 128
[    3.758945] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    3.759115] NetLabel:  unlabeled traffic allowed by default
[    3.759150] PCI: Using ACPI for IRQ routing
[    3.763418] PCI: pci_cache_line_size set to 64 bytes
[    3.763519] e820: reserve RAM buffer [mem 0x09c10000-0x0bffffff]
[    3.763535] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    3.763547] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    3.763559] e820: reserve RAM buffer [mem 0xb4c66018-0xb7ffffff]
[    3.763572] e820: reserve RAM buffer [mem 0xb5158000-0xb7ffffff]
[    3.763584] e820: reserve RAM buffer [mem 0xb6cf5000-0xb7ffffff]
[    3.763596] e820: reserve RAM buffer [mem 0xb8390000-0xbbffffff]
[    3.763609] e820: reserve RAM buffer [mem 0x81f380000-0x81fffffff]
[    3.763871] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    3.763879] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    3.767071] clocksource: Switched to clocksource tsc-early
[    3.947809] VFS: Disk quotas dquot_6.6.0
[    3.947952] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    3.949538] pnp: PnP ACPI init
[    3.952235] system 00:00: [mem 0xf0000000-0xf7ffffff] has been reserved
[    3.952300] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    3.954888] system 00:01: [mem 0x820000000-0x83fffffff window] has been =
reserved
[    3.954948] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    3.959738] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    3.977677] system 00:03: [io  0x0a00-0x0a0f] has been reserved
[    3.977699] system 00:03: [io  0x0a10-0x0a1f] has been reserved
[    3.977720] system 00:03: [io  0x0a20-0x0a2f] has been reserved
[    3.977743] system 00:03: [io  0x0a30-0x0a3f] has been reserved
[    3.977763] system 00:03: [io  0x0a40-0x0a4f] has been reserved
[    3.977783] system 00:03: [io  0x0a50-0x0a5f] has been reserved
[    3.977803] system 00:03: [io  0x0a60-0x0a6f] has been reserved
[    3.977823] system 00:03: [io  0x0a70-0x0a7f] has been reserved
[    3.977843] system 00:03: [io  0x0a80-0x0a8f] has been reserved
[    3.977863] system 00:03: [io  0x0a90-0x0b8e] has been reserved
[    3.977884] system 00:03: [io  0x0aa0-0x0aaf] has been reserved
[    3.977904] system 00:03: [io  0x0ab0-0x0abf] has been reserved
[    3.977924] system 00:03: [io  0x0ac0-0x0acf] has been reserved
[    3.977944] system 00:03: [io  0x0ad0-0x0adf] has been reserved
[    3.977979] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    3.985055] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    3.985077] system 00:04: [io  0x040b] has been reserved
[    3.985097] system 00:04: [io  0x04d6] has been reserved
[    3.985117] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    3.985137] system 00:04: [io  0x0c14] has been reserved
[    3.985157] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    3.985177] system 00:04: [io  0x0c52] has been reserved
[    3.985198] system 00:04: [io  0x0c6c] has been reserved
[    3.985221] system 00:04: [io  0x0c6f] has been reserved
[    3.985241] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    3.985261] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    3.985281] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    3.985302] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    3.985327] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    3.985347] system 00:04: [io  0x0800-0x089f] has been reserved
[    3.985367] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    3.985388] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    3.985408] system 00:04: [io  0x0900-0x090f] has been reserved
[    3.985428] system 00:04: [io  0x0910-0x091f] has been reserved
[    3.985460] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    3.985491] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    3.985513] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    3.985536] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    3.985566] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    3.985588] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    3.985611] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    3.985645] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    4.000921] pnp: PnP ACPI: found 5 devices
[    4.022230] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    4.022930] NET: Registered protocol family 2
[    4.025189] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6=
, 262144 bytes, linear)
[    4.025717] TCP established hash table entries: 262144 (order: 9, 209715=
2 bytes, linear)
[    4.027463] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,=
 linear)
[    4.027836] TCP: Hash tables configured (established 262144 bind 65536)
[    4.028821] MPTCP token hash table entries: 32768 (order: 7, 786432 byte=
s, linear)
[    4.029224] UDP hash table entries: 16384 (order: 7, 524288 bytes, linea=
r)
[    4.029555] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, =
linear)
[    4.030765] NET: Registered protocol family 1
[    4.030807] NET: Registered protocol family 44
[    4.030838] pci 0000:02:00.0: PCI bridge to [bus 03]
[    4.030860] pci 0000:02:01.0: PCI bridge to [bus 04]
[    4.030873] pci 0000:02:02.0: PCI bridge to [bus 05]
[    4.030885] pci 0000:02:03.0: PCI bridge to [bus 06]
[    4.030898] pci 0000:02:04.0: PCI bridge to [bus 07]
[    4.030910] pci 0000:02:05.0: PCI bridge to [bus 08]
[    4.030922] pci 0000:02:06.0: PCI bridge to [bus 09]
[    4.030927] pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
[    4.030933] pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
[    4.030944] pci 0000:02:07.0: PCI bridge to [bus 0a]
[    4.030947] pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
[    4.030953] pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    4.030963] pci 0000:01:00.2: PCI bridge to [bus 02-0a]
[    4.030967] pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
[    4.030973] pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
[    4.030982] pci 0000:00:02.1: PCI bridge to [bus 01-0a]
[    4.030985] pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
[    4.030990] pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
[    4.030997] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    4.031001] pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
[    4.031010] pci 0000:00:08.1: PCI bridge to [bus 0c]
[    4.031014] pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
[    4.031018] pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
[    4.031022] pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff=
 64bit pref]
[    4.031029] pci 0000:00:08.2: PCI bridge to [bus 0d]
[    4.031033] pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
[    4.031043] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    4.031047] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    4.031050] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    4.031053] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    4.031057] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff windo=
w]
[    4.031060] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff windo=
w]
[    4.031064] pci_bus 0000:00: resource 10 [mem 0xc0000000-0xfec2ffff wind=
ow]
[    4.031067] pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff wind=
ow]
[    4.031071] pci_bus 0000:01: resource 0 [io  0xd000-0xefff]
[    4.031074] pci_bus 0000:01: resource 1 [mem 0xfcb00000-0xfcdfffff]
[    4.031078] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    4.031081] pci_bus 0000:02: resource 1 [mem 0xfcb00000-0xfccfffff]
[    4.031085] pci_bus 0000:09: resource 0 [io  0xe000-0xefff]
[    4.031088] pci_bus 0000:09: resource 1 [mem 0xfcc00000-0xfccfffff]
[    4.031092] pci_bus 0000:0a: resource 0 [io  0xd000-0xdfff]
[    4.031095] pci_bus 0000:0a: resource 1 [mem 0xfcb00000-0xfcbfffff]
[    4.031098] pci_bus 0000:0b: resource 1 [mem 0xfcf00000-0xfcffffff]
[    4.031102] pci_bus 0000:0c: resource 0 [io  0xf000-0xffff]
[    4.031105] pci_bus 0000:0c: resource 1 [mem 0xfc700000-0xfcafffff]
[    4.031108] pci_bus 0000:0c: resource 2 [mem 0xd0000000-0xe01fffff 64bit=
 pref]
[    4.031112] pci_bus 0000:0d: resource 1 [mem 0xfce00000-0xfcefffff]
[    4.035088] pci 0000:0c:00.1: D0 power state depends on 0000:0c:00.0
[    4.039436] PCI: CLS 64 bytes, default 64
[    4.039874] Trying to unpack rootfs image as initramfs...
[    4.303879] Freeing initrd memory: 8380K
[    4.437100] pci 0000:00:00.2: AMD-Vi: Unable to read/write to IOMMU perf=
 counter.
[    4.437124] fbcon: Taking over console
[    4.438778] pci 0000:00:00.2: can't derive routing for PCI INT A
[    4.438783] pci 0000:00:00.2: PCI INT A: not connected
[    4.439066] pci 0000:00:01.0: Adding to iommu group 0
[    4.439254] pci 0000:00:02.0: Adding to iommu group 1
[    4.439416] pci 0000:00:02.1: Adding to iommu group 2
[    4.439576] pci 0000:00:02.2: Adding to iommu group 3
[    4.439749] pci 0000:00:08.0: Adding to iommu group 4
[    4.439838] pci 0000:00:08.1: Adding to iommu group 4
[    4.439927] pci 0000:00:08.2: Adding to iommu group 4
[    4.440092] pci 0000:00:14.0: Adding to iommu group 5
[    4.440181] pci 0000:00:14.3: Adding to iommu group 5
[    4.440425] pci 0000:00:18.0: Adding to iommu group 6
[    4.440520] pci 0000:00:18.1: Adding to iommu group 6
[    4.440619] pci 0000:00:18.2: Adding to iommu group 6
[    4.440708] pci 0000:00:18.3: Adding to iommu group 6
[    4.440798] pci 0000:00:18.4: Adding to iommu group 6
[    4.440887] pci 0000:00:18.5: Adding to iommu group 6
[    4.440976] pci 0000:00:18.6: Adding to iommu group 6
[    4.441068] pci 0000:00:18.7: Adding to iommu group 6
[    4.441251] pci 0000:01:00.0: Adding to iommu group 7
[    4.441342] pci 0000:01:00.1: Adding to iommu group 7
[    4.441433] pci 0000:01:00.2: Adding to iommu group 7
[    4.441513] pci 0000:02:00.0: Adding to iommu group 7
[    4.441591] pci 0000:02:01.0: Adding to iommu group 7
[    4.441668] pci 0000:02:02.0: Adding to iommu group 7
[    4.441752] pci 0000:02:03.0: Adding to iommu group 7
[    4.441842] pci 0000:02:04.0: Adding to iommu group 7
[    4.441919] pci 0000:02:05.0: Adding to iommu group 7
[    4.442006] pci 0000:02:06.0: Adding to iommu group 7
[    4.442089] pci 0000:02:07.0: Adding to iommu group 7
[    4.442167] pci 0000:09:00.0: Adding to iommu group 7
[    4.442254] pci 0000:0a:00.0: Adding to iommu group 7
[    4.442401] pci 0000:0b:00.0: Adding to iommu group 8
[    4.442495] pci 0000:0c:00.0: Adding to iommu group 4
[    4.442579] pci 0000:0c:00.1: Adding to iommu group 4
[    4.442657] pci 0000:0c:00.2: Adding to iommu group 4
[    4.442736] pci 0000:0c:00.3: Adding to iommu group 4
[    4.442815] pci 0000:0c:00.4: Adding to iommu group 4
[    4.442901] pci 0000:0c:00.6: Adding to iommu group 4
[    4.442980] pci 0000:0d:00.0: Adding to iommu group 4
[    4.443062] pci 0000:0d:00.1: Adding to iommu group 4
[    4.485919] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    4.485927] pci 0000:00:00.2: AMD-Vi: Extended features (0x206d73ef22254=
ade):
[    4.485930]  PPR X2APIC NX GT IA GA PC GA_vAPIC
[    4.485941] AMD-Vi: Interrupt remapping enabled
[    4.485943] AMD-Vi: Virtual APIC enabled
[    4.485944] AMD-Vi: X2APIC enabled
[    4.486507] AMD-Vi: Lazy IO/TLB flushing enabled
[    4.486638] amd_uncore: 4  amd_df counters detected
[    4.486658] amd_uncore: 6  amd_l3 counters detected
[    4.487370] LVT offset 0 assigned for vector 0x400
[    4.487665] perf: AMD IBS detected (0x000003ff)
[    4.493516] check: Scanning for low memory corruption every 60 seconds
[    4.501303] Initialise system trusted keyrings
[    4.501370] Key type blacklist registered
[    4.501686] workingset: timestamp_bits=3D41 max_order=3D23 bucket_order=
=3D0
[    4.535407] zbud: loaded
[    4.543286] Key type asymmetric registered
[    4.543290] Asymmetric key parser 'x509' registered
[    4.543383] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 243)
[    4.543676] io scheduler mq-deadline registered
[    4.543680] io scheduler kyber registered
[    4.544306] io scheduler bfq registered
[    4.548330] pcieport 0000:00:02.1: PME: Signaling with IRQ 26
[    4.549376] pcieport 0000:00:02.2: PME: Signaling with IRQ 27
[    4.550413] pcieport 0000:00:08.1: PME: Signaling with IRQ 28
[    4.552624] pcieport 0000:00:08.2: PME: Signaling with IRQ 29
[    4.566880] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    4.567202] efifb: probing for efifb
[    4.567582] efifb: framebuffer at 0xd0000000, using 3072k, total 3072k
[    4.567585] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
[    4.567588] efifb: scrolling: redraw
[    4.567589] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    4.568816] Console: switching to colour frame buffer device 128x48
[    4.573826] fb0: EFI VGA frame buffer device
[    4.574618] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    4.575001] ACPI: button: Power Button [PWRB]
[    4.575507] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input1
[    4.577445] ACPI: button: Power Button [PWRF]
[    4.578214] Monitor-Mwait will be used to enter C-1 state
[    4.578264] ACPI: _PR_.C000: Found 3 idle states
[    4.579833] ACPI: _PR_.C002: Found 3 idle states
[    4.581513] ACPI: _PR_.C004: Found 3 idle states
[    4.583007] ACPI: _PR_.C006: Found 3 idle states
[    4.584708] ACPI: _PR_.C001: Found 3 idle states
[    4.586254] ACPI: _PR_.C003: Found 3 idle states
[    4.587838] ACPI: _PR_.C005: Found 3 idle states
[    4.589535] ACPI: _PR_.C007: Found 3 idle states
[    4.606622] thermal LNXTHERM:00: registered as thermal_zone0
[    4.606629] ACPI: thermal: Thermal Zone [HPTZ] (30 C)
[    4.608252] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    4.632735] Non-volatile memory driver v1.3
[    4.632741] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    4.645325] nvme nvme0: pci function 0000:0b:00.0
[    4.645645] ahci 0000:01:00.1: version 3.0
[    4.645660] ahci 0000:01:00.1: enabling device (0100 -> 0102)
[    4.647511] ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
[    4.647582] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
ff impl SATA mode
[    4.647587] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo onl=
y pmp pio slum part sxs deso sadm sds apst
[    4.651792] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    4.651913] BUG: KASAN: use-after-free in __iommu_dma_unmap_swiotlb (./i=
nclude/linux/swiotlb.h:114 drivers/iommu/dma-iommu.c:510)=20
[    4.652031] Read of size 8 at addr ffff8887c008f000 by task swapper/0/0

[    4.652162] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3-debug-0=
0033-g167e3e00e2be #1
[    4.652168] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[    4.652172] Call Trace:
[    4.652176]  <IRQ>
[    4.652180] dump_stack (lib/dump_stack.c:122)=20
[    4.652189] print_address_description.constprop.0 (mm/kasan/report.c:233=
)=20
[    4.652196] ? __iommu_dma_unmap_swiotlb (./include/linux/swiotlb.h:114 d=
rivers/iommu/dma-iommu.c:510)=20
[    4.652202] kasan_report.cold (mm/kasan/report.c:400 mm/kasan/report.c:4=
16)=20
[    4.652211] ? __iommu_dma_unmap_swiotlb (./include/linux/swiotlb.h:114 d=
rivers/iommu/dma-iommu.c:510)=20
[    4.652217] __iommu_dma_unmap_swiotlb (./include/linux/swiotlb.h:114 dri=
vers/iommu/dma-iommu.c:510)=20
[    4.652224] nvme_pci_complete_rq (drivers/nvme/host/pci.c:971)=20
[    4.652232] blk_complete_reqs (block/blk-mq.c:575 (discriminator 6))=20
[    4.652239] __do_softirq (./arch/x86/include/asm/jump_label.h:25 ./inclu=
de/linux/jump_label.h:200 ./include/trace/events/irq.h:142 kernel/softirq.c=
:346)=20
[    4.652247] irq_exit_rcu (kernel/softirq.c:221 kernel/softirq.c:422 kern=
el/softirq.c:434)=20
[    4.652254] common_interrupt (arch/x86/kernel/irq.c:240 (discriminator 1=
4))=20
[    4.652261]  </IRQ>
[    4.652264] asm_common_interrupt (./arch/x86/include/asm/idtentry.h:623)=
=20
[    4.652270] RIP: 0010:cpuidle_enter_state (drivers/cpuidle/cpuidle.c:259=
)=20
[ 4.652277] Code: 3d 14 09 b7 51 e8 57 a6 49 ff 49 89 c5 0f 1f 44 00 00 31 =
ff e8 18 bb 49 ff 80 3c 24 00 0f 85 aa 02 00 00 fb 66 0f 1f 44 00 00 <45> 8=
5 f6 0f 88 39 02 00 00 49 63 ee 48 8d 44 6d 00 48 8d 44 85 00
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	3d 14 09 b7 51       	cmp    $0x51b70914,%eax
   5:	e8 57 a6 49 ff       	call   0xffffffffff49a661
   a:	49 89 c5             	mov    %rax,%r13
   d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  12:	31 ff                	xor    %edi,%edi
  14:	e8 18 bb 49 ff       	call   0xffffffffff49bb31
  19:	80 3c 24 00          	cmpb   $0x0,(%rsp)
  1d:	0f 85 aa 02 00 00    	jne    0x2cd
  23:	fb                   	sti   =20
  24:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  2a:*	45 85 f6             	test   %r14d,%r14d		<-- trapping instruction
  2d:	0f 88 39 02 00 00    	js     0x26c
  33:	49 63 ee             	movslq %r14d,%rbp
  36:	48 8d 44 6d 00       	lea    0x0(%rbp,%rbp,2),%rax
  3b:	48 8d 44 85 00       	lea    0x0(%rbp,%rax,4),%rax

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	45 85 f6             	test   %r14d,%r14d
   3:	0f 88 39 02 00 00    	js     0x242
   9:	49 63 ee             	movslq %r14d,%rbp
   c:	48 8d 44 6d 00       	lea    0x0(%rbp,%rbp,2),%rax
  11:	48 8d 44 85 00       	lea    0x0(%rbp,%rax,4),%rax
[    4.652283] RSP: 0018:ffffffffaf807df0 EFLAGS: 00000246
[    4.652289] RAX: 0000000000000000 RBX: ffff88810bd09000 RCX: ffffffffad9=
44885
[    4.652293] RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffff8887c32=
35648
[    4.652297] RBP: 0000000000000003 R08: 0000000000000001 R09: ffff8887c32=
356d7
[    4.652300] R10: ffffed10f8646ada R11: 0000000000000001 R12: ffffffffafc=
5bfc0
[    4.652304] R13: 0000000115446cbb R14: 0000000000000003 R15: ffffffffafc=
5c150
[    4.652309] ? sched_idle_set_state (kernel/sched/sched.h:1981 kernel/sch=
ed/idle.c:22)=20
[    4.652317] ? tick_nohz_idle_stop_tick (kernel/time/tick-sched.c:1029 ke=
rnel/time/tick-sched.c:1043)=20
[    4.652325] cpuidle_enter (drivers/cpuidle/cpuidle.c:353)=20
[    4.652331] do_idle (kernel/sched/idle.c:158 kernel/sched/idle.c:239 ker=
nel/sched/idle.c:300)=20
[    4.652338] ? arch_cpu_idle_exit+0x40/0x40=20
[    4.652345] cpu_startup_entry (kernel/sched/idle.c:396 (discriminator 1)=
)=20
[    4.652350] start_kernel (init/main.c:1066)=20
[    4.652359] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:28=
3)=20

[    4.652395] The buggy address belongs to the page:
[    4.652456] page:00000000a3938bc3 refcount:0 mapcount:0 mapping:00000000=
00000000 index:0x0 pfn:0x7c008f
[    4.652461] flags: 0x2ffff0000000000()
[    4.652466] raw: 02ffff0000000000 ffffea001f0023c8 ffffea001f0023c8 0000=
000000000000
[    4.652470] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000=
000000000000
[    4.652472] page dumped because: kasan: bad access detected

[    4.652491] Memory state around the buggy address:
[    4.652547]  ffff8887c008ef00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652621]  ffff8887c008ef80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652695] >ffff8887c008f000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652768]                    ^
[    4.652803]  ffff8887c008f080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652877]  ffff8887c008f100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff
[    4.652950] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    4.653029] Disabling lock debugging due to kernel taint
[    4.653309] nvme nvme0: missing or invalid SUBNQN field.
[    4.663105] nvme nvme0: 16/0/0 default/read/poll queues
[    4.668311] scsi host0: ahci
[    4.669899]  nvme0n1: p1 p2
[    4.670702] scsi host1: ahci
[    4.672616] scsi host2: ahci
[    4.674521] scsi host3: ahci
[    4.676781] scsi host4: ahci
[    4.678791] scsi host5: ahci
[    4.680663] scsi host6: ahci
[    4.682714] scsi host7: ahci
[    4.683697] ata1: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
100 irq 44
[    4.683702] ata2: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
180 irq 44
[    4.683707] ata3: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
200 irq 44
[    4.683710] ata4: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
280 irq 44
[    4.683714] ata5: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
300 irq 44
[    4.683718] ata6: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
380 irq 44
[    4.683722] ata7: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
400 irq 44
[    4.683726] ata8: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80=
480 irq 44
[    4.684113] ahci 0000:0d:00.0: enabling device (0100 -> 0102)
[    4.686333] ahci 0000:0d:00.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x=
1 impl SATA mode
[    4.686342] ahci 0000:0d:00.0: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part
[    4.688739] scsi host8: ahci
[    4.689732] ata9: SATA max UDMA/133 abar m2048@0xfce01000 port 0xfce0110=
0 irq 62
[    4.689877] ahci 0000:0d:00.1: enabling device (0100 -> 0102)
[    4.691535] ahci 0000:0d:00.1: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x=
1 impl SATA mode
[    4.691544] ahci 0000:0d:00.1: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part
[    4.694012] scsi host9: ahci
[    4.695026] ata10: SATA max UDMA/133 abar m2048@0xfce00000 port 0xfce001=
00 irq 64
[    4.695247] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    4.695279] ehci-pci: EHCI PCI platform driver
[    4.695395] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    4.695415] ohci-pci: OHCI PCI platform driver
[    4.695512] uhci_hcd: USB Universal Host Controller Interface driver
[    4.696210] usbcore: registered new interface driver usbserial_generic
[    4.696264] usbserial: USB Serial support registered for generic
[    4.697317] rtc_cmos 00:02: RTC can wake from S4
[    4.699142] rtc_cmos 00:02: registered as rtc0
[    4.699426] rtc_cmos 00:02: setting system clock to 2021-07-05T18:01:47 =
UTC (1625508107)
[    4.699656] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    4.700290] ledtrig-cpu: registered to indicate activity on CPUs
[    4.705912] hid: raw HID events driver (C) Jiri Kosina
[    4.706429] drop_monitor: Initializing network drop monitor service
[    4.706594] Initializing XFRM netlink socket
[    4.708814] NET: Registered protocol family 10
[    4.733033] Segment Routing with IPv6
[    4.733041] RPL Segment Routing with IPv6
[    4.733175] NET: Registered protocol family 17
[    4.744516] microcode: CPU0: patch_level=3D0x08600106
[    4.744563] microcode: CPU1: patch_level=3D0x08600106
[    4.744657] microcode: CPU2: patch_level=3D0x08600106
[    4.744739] microcode: CPU3: patch_level=3D0x08600106
[    4.744804] microcode: CPU4: patch_level=3D0x08600106
[    4.744848] microcode: CPU5: patch_level=3D0x08600106
[    4.744916] microcode: CPU6: patch_level=3D0x08600106
[    4.744975] microcode: CPU7: patch_level=3D0x08600106
[    4.745002] microcode: Microcode Update Driver: v2.2.
[    4.745820] resctrl: L3 allocation detected
[    4.745827] resctrl: L3DATA allocation detected
[    4.745829] resctrl: L3CODE allocation detected
[    4.745830] resctrl: MB allocation detected
[    4.745832] resctrl: L3 monitoring detected
[    4.745838] IPI shorthand broadcast: enabled
[    4.745984] sched_clock: Marking stable (4739676488, 6007714)->(47476761=
29, -1991927)
[    4.746812] registered taskstats version 1
[    4.746922] Loading compiled-in X.509 certificates
[    4.757340] Loaded X.509 cert 'Build time autogenerated kernel key: 32cf=
4ae6b69274291395e11399683edef2a4e147'
[    4.762638] zswap: loaded using pool lz4/z3fold
[    4.764606] Key type ._fscrypt registered
[    4.764612] Key type .fscrypt registered
[    4.764614] Key type fscrypt-provisioning registered
[    4.776597] PM:   Magic number: 13:252:38
[    4.776765] memory memory207: hash matches
[    4.776798] memory memory74: hash matches
[    4.778951] RAS: Correctable Errors collector initialized.
[    4.995881] ata1: SATA link down (SStatus 0 SControl 300)
[    5.000972] ata9: SATA link down (SStatus 0 SControl 300)
[    5.005458] ata10: SATA link down (SStatus 0 SControl 300)
[    5.310074] ata2: SATA link down (SStatus 0 SControl 300)
[    5.490688] tsc: Refined TSC clocksource calibration: 3819.727 MHz
[    5.490713] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6e1=
e4508946, max_idle_ns: 881590469268 ns
[    5.490821] clocksource: Switched to clocksource tsc
[    5.622021] ata3: SATA link down (SStatus 0 SControl 300)
[    5.932590] ata4: SATA link down (SStatus 0 SControl 300)
[    6.245698] ata5: SATA link down (SStatus 0 SControl 300)
[    6.559773] ata6: SATA link down (SStatus 0 SControl 300)
[    6.872755] ata7: SATA link down (SStatus 0 SControl 300)
[    7.185687] ata8: SATA link down (SStatus 0 SControl 300)
[    7.200470] Freeing unused decrypted memory: 2036K
[    7.201233] Freeing unused kernel image (initmem) memory: 2012K
[    7.201243] Write protecting the kernel read-only data: 32768k
[    7.202524] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    7.203212] Freeing unused kernel image (rodata/data gap) memory: 1768K
[    7.261659] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    7.261671] rodata_test: all tests were successful
[    7.261705] Run /init as init process
[    7.261708]   with arguments:
[    7.261710]     /init
[    7.261712]   with environment:
[    7.261714]     HOME=3D/
[    7.261716]     TERM=3Dlinux
[    8.072610] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    8.072718] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus =
number 1
[    8.128723] xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x1=
10 quirks 0x0000000000000410
[    8.136551] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.12
[    8.136562] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.136567] usb usb1: Product: xHCI Host Controller
[    8.136572] usb usb1: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.136576] usb usb1: SerialNumber: 0000:01:00.0
[    8.139731] hub 1-0:1.0: USB hub found
[    8.139944] hub 1-0:1.0: 14 ports detected
[    8.155361] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    8.155411] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus =
number 2
[    8.155437] xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.155750] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.156512] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.12
[    8.156521] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.156525] usb usb2: Product: xHCI Host Controller
[    8.156528] usb usb2: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.156530] usb usb2: SerialNumber: 0000:01:00.0
[    8.158456] hub 2-0:1.0: USB hub found
[    8.158657] hub 2-0:1.0: 8 ports detected
[    8.171454] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    8.171543] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 3
[    8.172082] xhci_hcd 0000:0c:00.3: hcc params 0x0268ffe5 hci version 0x1=
10 quirks 0x0000000000000410
[    8.178578] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.12
[    8.178589] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.178594] usb usb3: Product: xHCI Host Controller
[    8.178598] usb usb3: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.178602] usb usb3: SerialNumber: 0000:0c:00.3
[    8.181189] hub 3-0:1.0: USB hub found
[    8.181388] hub 3-0:1.0: 4 ports detected
[    8.185965] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    8.186032] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 4
[    8.186059] xhci_hcd 0000:0c:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.186366] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.187099] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.12
[    8.187108] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.187113] usb usb4: Product: xHCI Host Controller
[    8.187117] usb usb4: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.187122] usb usb4: SerialNumber: 0000:0c:00.3
[    8.189404] hub 4-0:1.0: USB hub found
[    8.189539] hub 4-0:1.0: 2 ports detected
[    8.192958] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    8.193016] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus =
number 5
[    8.193395] xhci_hcd 0000:0c:00.4: hcc params 0x0268ffe5 hci version 0x1=
10 quirks 0x0000000000000410
[    8.197879] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.12
[    8.197887] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.197890] usb usb5: Product: xHCI Host Controller
[    8.197893] usb usb5: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.197895] usb usb5: SerialNumber: 0000:0c:00.4
[    8.199515] hub 5-0:1.0: USB hub found
[    8.199659] hub 5-0:1.0: 4 ports detected
[    8.202842] xhci_hcd 0000:0c:00.4: xHCI Host Controller
[    8.202887] xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus =
number 6
[    8.202913] xhci_hcd 0000:0c:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    8.203133] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    8.203610] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.12
[    8.203614] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    8.203618] usb usb6: Product: xHCI Host Controller
[    8.203620] usb usb6: Manufacturer: Linux 5.12.0-rc3-debug-00033-g167e3e=
00e2be xhci-hcd
[    8.203623] usb usb6: SerialNumber: 0000:0c:00.4
[    8.205252] hub 6-0:1.0: USB hub found
[    8.205385] hub 6-0:1.0: 2 ports detected
[    8.483770] usb 1-11: new full-speed USB device number 2 using xhci_hcd
[    8.616313] SGI XFS with ACLs, security attributes, realtime, scrub, rep=
air, quota, no debug enabled
[    8.629895] XFS (nvme0n1p2): Mounting V5 Filesystem
[    8.640814] XFS (nvme0n1p2): Ending clean mount
[    8.643784] xfs filesystem being mounted at /new_root supports timestamp=
s until 2038 (0x7fffffff)
[    8.701705] random: fast init done
[    8.850769] random: crng init done
[    8.850799] systemd[1]: Successfully credited entropy passed from boot l=
oader.
[    8.854073] systemd[1]: systemd 248.3-2-arch running in system mode. (+P=
AM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL =
+ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +L=
IBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +XK=
BCOMMON +UTMP -SYSVINIT default-hierarchy=3Dunified)
[    8.870978] systemd[1]: Detected architecture x86-64.
[    8.874172] systemd[1]: Hostname set to <hp-4300G>.
[    8.883148] usb 1-11: New USB device found, idVendor=3D046d, idProduct=
=3Dc534, bcdDevice=3D29.01
[    8.883160] usb 1-11: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    8.883165] usb 1-11: Product: USB Receiver
[    8.883169] usb 1-11: Manufacturer: Logitech
[    8.964795] systemd-fstab-generator[252]: Mount point  is not a valid pa=
th, ignoring.
[    8.965686] systemd-fstab-generator[252]: Mount point  is not a valid pa=
th, ignoring.
[    9.023787] usb 1-12: new full-speed USB device number 3 using xhci_hcd
[    9.133143] systemd[1]: Queued start job for default target Graphical In=
terface.
[    9.141522] systemd[1]: Created slice system-getty.slice.
[    9.143519] systemd[1]: Created slice system-modprobe.slice.
[    9.148031] systemd[1]: Created slice User and Session Slice.
[    9.148561] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    9.149038] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    9.150164] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    9.150701] systemd[1]: Reached target Local Encrypted Volumes.
[    9.150901] systemd[1]: Reached target Login Prompts.
[    9.151100] systemd[1]: Reached target Paths.
[    9.151278] systemd[1]: Reached target Remote File Systems.
[    9.151475] systemd[1]: Reached target Slices.
[    9.151661] systemd[1]: Reached target Swap.
[    9.151839] systemd[1]: Reached target Local Verity Integrity Protected =
Volumes.
[    9.153881] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    9.157470] systemd[1]: Listening on Process Core Dump Socket.
[    9.159900] systemd[1]: Listening on Journal Audit Socket.
[    9.162031] systemd[1]: Listening on Journal Socket (/dev/log).
[    9.164219] systemd[1]: Listening on Journal Socket.
[    9.166260] systemd[1]: Listening on Network Service Netlink Socket.
[    9.169746] systemd[1]: Listening on udev Control Socket.
[    9.171892] systemd[1]: Listening on udev Kernel Socket.
[    9.178783] systemd[1]: Mounting Huge Pages File System...
[    9.186001] systemd[1]: Mounting POSIX Message Queue File System...
[    9.192864] systemd[1]: Mounting Kernel Debug File System...
[    9.199803] systemd[1]: Mounting Kernel Trace File System...
[    9.207150] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[    9.220054] systemd[1]: Starting Load Kernel Module configfs...
[    9.227187] systemd[1]: Starting Load Kernel Module drm...
[    9.234146] systemd[1]: Starting Load Kernel Module fuse...
[    9.240238] Linux agpgart interface v0.103
[    9.242093] systemd[1]: Starting Set Up Additional Binary Formats...
[    9.243933] systemd[1]: Condition check resulted in File System Check on=
 Root Device being skipped.
[    9.258253] fuse: init (API version 7.33)
[    9.258750] systemd[1]: Starting Journal Service...
[    9.269031] systemd[1]: Starting Load Kernel Modules...
[    9.275818] systemd[1]: Starting Remount Root and Kernel File Systems...
[    9.278268] systemd[1]: Condition check resulted in Repartition Root Dis=
k being skipped.
[    9.285440] systemd[1]: Starting Coldplug All udev Devices...
[    9.289436] Asymmetric key parser 'pkcs8' registered
[    9.295407] systemd[1]: Mounted Huge Pages File System.
[    9.297675] systemd[1]: Mounted POSIX Message Queue File System.
[    9.299077] XFS: attr2 mount option is deprecated.
[    9.299875] systemd[1]: Mounted Kernel Debug File System.
[    9.302121] systemd[1]: Mounted Kernel Trace File System.
[    9.302305] xfs filesystem being remounted at / supports timestamps unti=
l 2038 (0x7fffffff)
[    9.307207] systemd[1]: Finished Create list of static device nodes for =
the current kernel.
[    9.309211] audit: type=3D1130 audit(1625508112.104:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dkmod-static-nodes comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
[    9.310701] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    9.312189] systemd[1]: Finished Load Kernel Module configfs.
[    9.314011] audit: type=3D1130 audit(1625508112.111:3): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@configfs comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
[    9.314063] audit: type=3D1131 audit(1625508112.111:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@configfs comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
[    9.315399] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    9.316866] systemd[1]: Finished Load Kernel Module drm.
[    9.319018] audit: type=3D1130 audit(1625508112.114:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@drm comm=3D"syste=
md" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=
=3Dsuccess'
[    9.319063] audit: type=3D1131 audit(1625508112.114:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@drm comm=3D"syste=
md" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=
=3Dsuccess'
[    9.320369] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    9.322053] systemd[1]: Finished Load Kernel Module fuse.
[    9.323928] audit: type=3D1130 audit(1625508112.121:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@fuse comm=3D"syst=
emd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? re=
s=3Dsuccess'
[    9.323969] audit: type=3D1131 audit(1625508112.121:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dmodprobe@fuse comm=3D"syst=
emd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? re=
s=3Dsuccess'
[    9.325885] systemd[1]: Finished Load Kernel Modules.
[    9.327726] audit: type=3D1130 audit(1625508112.124:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-modules-load comm=
=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termina=
l=3D? res=3Dsuccess'
[    9.329640] systemd[1]: Finished Remount Root and Kernel File Systems.
[    9.331465] audit: type=3D1130 audit(1625508112.128:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-remount-fs comm=
=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termina=
l=3D? res=3Dsuccess'
[    9.331966] systemd[1]: proc-sys-fs-binfmt_misc.automount: Got automount=
 request for /proc/sys/fs/binfmt_misc, triggered by 268 (systemd-binfmt)
[    9.334658] usb 1-12: New USB device found, idVendor=3D0bda, idProduct=
=3Db00a, bcdDevice=3D 1.10
[    9.334669] usb 1-12: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
[    9.334673] usb 1-12: Product: Bluetooth Radio
[    9.334677] usb 1-12: Manufacturer: Realtek
[    9.334681] usb 1-12: SerialNumber: 00e04c000001
[    9.337615] systemd[1]: Mounting Arbitrary Executable File Formats File =
System...
[    9.345171] systemd[1]: Mounting FUSE Control File System...
[    9.352671] systemd[1]: Mounting Kernel Configuration File System...
[    9.354660] systemd[1]: Condition check resulted in First Boot Wizard be=
ing skipped.
[    9.356762] systemd[1]: Condition check resulted in Rebuild Hardware Dat=
abase being skipped.
[    9.362335] systemd[1]: Starting Load/Save Random Seed...
[    9.370337] systemd[1]: Starting Apply Kernel Variables...
[    9.377555] systemd[1]: Starting Create System Users...
[    9.384837] systemd[1]: Mounted Arbitrary Executable File Formats File S=
ystem.
[    9.388928] systemd[1]: Mounted FUSE Control File System.
[    9.391926] systemd[1]: Mounted Kernel Configuration File System.
[    9.396765] systemd[1]: Finished Load/Save Random Seed.
[    9.400536] audit: type=3D1130 audit(1625508112.194:11): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-random-seed comm=
=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termina=
l=3D? res=3Dsuccess'
[    9.407538] systemd[1]: Finished Apply Kernel Variables.
[    9.411712] systemd[1]: Finished Set Up Additional Binary Formats.
[    9.416339] systemd[1]: Finished Create System Users.
[    9.418688] systemd[1]: Condition check resulted in First Boot Complete =
being skipped.
[    9.424186] systemd[1]: Starting Create Static Device Nodes in /dev...
[    9.480449] systemd[1]: Finished Create Static Device Nodes in /dev.
[    9.482506] systemd[1]: Reached target Local File Systems (Pre).
[    9.489210] systemd[1]: Mounting /tmp...
[    9.491124] systemd[1]: Condition check resulted in Virtual Machine and =
Container Storage (Compatibility) being skipped.
[    9.503225] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    9.508551] systemd[1]: Mounted /tmp.
[    9.573272] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    9.588922] systemd[1]: Starting Network Service...
[    9.638950] systemd[1]: Started Journal Service.
[    9.664886] systemd-journald[269]: Received client request to flush runt=
ime journal.
[    9.759611] Bluetooth: Core ver 2.22
[    9.759775] NET: Registered protocol family 31
[    9.759778] Bluetooth: HCI device and connection manager initialized
[    9.759794] Bluetooth: HCI socket layer initialized
[    9.759807] Bluetooth: L2CAP socket layer initialized
[    9.759838] Bluetooth: SCO socket layer initialized
[    9.784432] usbcore: registered new interface driver btusb
[    9.786588] Bluetooth: hci0: RTL: examining hci_ver=3D08 hci_rev=3D000c =
lmp_ver=3D08 lmp_subver=3D8821
[    9.789596] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1
[    9.789666] Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_fw.bin
[    9.793321] Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_config.bin
[    9.794035] Bluetooth: hci0: RTL: cfg_sz 10, total sz 31990
[   10.052152] acpi_cpufreq: overriding BIOS provided _PSD data
[   10.063914] acpi-tad ACPI000E:00: Missing _PRW
[   10.241179] ACPI: video: Video Device [VGA1] (multi-head: yes  rom: no  =
post: no)
[   10.264286] acpi device:1e: registered as cooling_device8
[   10.269015] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:1d/LNXVIDEO:01/input/input2
[   10.319302] acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:00)
[   10.358026] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[   10.358037] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[   10.358941] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[   10.362274] ccp 0000:0c:00.2: enabling device (0100 -> 0102)
[   10.364925] ccp 0000:0c:00.2: ccp: unable to access the device: you migh=
t be running a broken BIOS.
[   10.375365] ccp 0000:0c:00.2: tee enabled
[   10.375376] ccp 0000:0c:00.2: psp enabled
[   10.394306] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[   10.395169] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[   10.396264] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[   10.471471] input: PC Speaker as /devices/platform/pcspkr/input/input3
[   10.500876] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[   10.500885] RAPL PMU: hw unit of domain package 2^-16 Joules
[   10.533106] cryptd: max_cpu_qlen set to 1000
[   10.572803] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:=
02.1/0000:01:00.0/usb1/1-11/1-11:1.0/0003:046D:C534.0001/input/input4
[   10.601442] libphy: r8169: probed
[   10.603871] r8169 0000:0a:00.0 eth0: RTL8168h/8111h, 00:68:eb:ad:98:43, =
XID 541, IRQ 91
[   10.603884] r8169 0000:0a:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[   10.618131] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   10.632919] AVX2 version of gcm_enc/dec engaged.
[   10.633000] AES CTR mode by8 optimization enabled
[   10.633757] hid-generic 0003:046D:C534.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
[   10.642569] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   10.643042] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[   10.643062] cfg80211: failed to load regulatory.db
[   10.676986] input: Logitech USB Receiver Mouse as /devices/pci0000:00/00=
00:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input5
[   10.680342] input: Logitech USB Receiver Consumer Control as /devices/pc=
i0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/i=
nput/input6
[   10.729484] FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some =
data may be corrupt. Please run fsck.
[   10.738574] input: Logitech USB Receiver System Control as /devices/pci0=
000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/inp=
ut/input7
[   10.740269] hid-generic 0003:046D:C534.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
[   10.740698] usbcore: registered new interface driver usbhid
[   10.740702] usbhid: USB HID core driver
[   10.878631] snd_hda_intel 0000:0c:00.1: enabling device (0100 -> 0102)
[   10.879924] snd_hda_intel 0000:0c:00.1: Handle vga_switcheroo audio clie=
nt
[   10.880070] Bluetooth: hci0: RTL: fw version 0x829a7644
[   10.893377] snd_hda_intel 0000:0c:00.6: enabling device (0100 -> 0102)
[   10.918940] irq 7: nobody cared (try booting with the "irqpoll" option)
[   10.921972] CPU: 4 PID: 363 Comm: systemd-tmpfile Tainted: G    B       =
      5.12.0-rc3-debug-00033-g167e3e00e2be #1
[   10.921980] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[   10.921984] Call Trace:
[   10.921987]  <IRQ>
[   10.921990] dump_stack (lib/dump_stack.c:122)=20
[   10.922002] __report_bad_irq (kernel/irq/spurious.c:214)=20
[   10.922011] note_interrupt.cold (kernel/irq/spurious.c:419)=20
[   10.922019] ? add_interrupt_randomness (drivers/char/random.c:1290 (disc=
riminator 1))=20
[   10.922027] handle_irq_event (kernel/irq/handle.c:201 kernel/irq/handle.=
c:213)=20
[   10.922036] ? handle_irq_event_percpu (kernel/irq/handle.c:206)=20
[   10.922043] ? _raw_spin_lock (./arch/x86/include/asm/atomic.h:202 ./incl=
ude/asm-generic/atomic-instrumented.h:707 ./include/asm-generic/qspinlock.h=
:82 ./include/linux/spinlock.h:183 ./include/linux/spinlock_api_smp.h:143 k=
ernel/locking/spinlock.c:151)=20
[   10.922050] ? _raw_spin_lock_bh (kernel/locking/spinlock.c:150)=20
[   10.922057] handle_fasteoi_irq (kernel/irq/chip.c:661 kernel/irq/chip.c:=
716)=20
[   10.922065] __common_interrupt (arch/x86/kernel/irq.c:264 (discriminator=
 22))=20
[   10.922073] common_interrupt (arch/x86/kernel/irq.c:240 (discriminator 1=
4))=20
[   10.922081]  </IRQ>
[   10.922084] asm_common_interrupt (./arch/x86/include/asm/idtentry.h:623)=
=20
[   10.922090] RIP: 0010:file_ra_state_init (mm/readahead.c:35)=20
[ 10.922098] Code: 00 48 0f 44 f0 48 89 35 a9 cd bc 02 e8 d4 d4 e4 ff e9 8f=
 fe ff ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 <41> =
54 55 48 89 f5 53 48 89 fb 48 89 f7 e8 a9 ec 0c 00 48 8b 6d 00
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	00 48 0f             	add    %cl,0xf(%rax)
   3:	44                   	rex.R
   4:	f0 48 89 35 a9 cd bc 	lock mov %rsi,0x2bccda9(%rip)        # 0x2bccdb5
   b:	02=20
   c:	e8 d4 d4 e4 ff       	call   0xffffffffffe4d4e5
  11:	e9 8f fe ff ff       	jmp    0xfffffffffffffea5
  16:	cc                   	int3  =20
  17:	cc                   	int3  =20
  18:	cc                   	int3  =20
  19:	cc                   	int3  =20
  1a:	cc                   	int3  =20
  1b:	cc                   	int3  =20
  1c:	cc                   	int3  =20
  1d:	cc                   	int3  =20
  1e:	cc                   	int3  =20
  1f:	cc                   	int3  =20
  20:	cc                   	int3  =20
  21:	cc                   	int3  =20
  22:	cc                   	int3  =20
  23:	cc                   	int3  =20
  24:	cc                   	int3  =20
  25:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  2a:*	41 54                	push   %r12		<-- trapping instruction
  2c:	55                   	push   %rbp
  2d:	48 89 f5             	mov    %rsi,%rbp
  30:	53                   	push   %rbx
  31:	48 89 fb             	mov    %rdi,%rbx
  34:	48 89 f7             	mov    %rsi,%rdi
  37:	e8 a9 ec 0c 00       	call   0xcece5
  3c:	48 8b 6d 00          	mov    0x0(%rbp),%rbp

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	41 54                	push   %r12
   2:	55                   	push   %rbp
   3:	48 89 f5             	mov    %rsi,%rbp
   6:	53                   	push   %rbx
   7:	48 89 fb             	mov    %rdi,%rbx
   a:	48 89 f7             	mov    %rsi,%rdi
   d:	e8 a9 ec 0c 00       	call   0xcecbb
  12:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
[   10.922104] RSP: 0018:ffffc90000fcf9e8 EFLAGS: 00000246
[   10.922111] RAX: 0000000000000000 RBX: ffff88811ef2e5c0 RCX: ffffffffadc=
a322f
[   10.922115] RDX: dffffc0000000000 RSI: ffff8881258b5ae8 RDI: ffff88811ef=
2e658
[   10.922120] RBP: ffff8881258b5970 R08: ffffffffadca3202 R09: ffff8881258=
b5ad7
[   10.922124] R10: ffffed1024b16b5a R11: 0000000000000001 R12: 00000000000=
00000
[   10.922128] R13: ffff8881258b5970 R14: ffff88811ef2e604 R15: ffff88811ef=
2e600
[   10.922134] ? do_dentry_open (fs/open.c:841)=20
[   10.922140] ? do_dentry_open (fs/open.c:843)=20
[   10.922148] do_dentry_open (fs/open.c:846)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   10.922155] ? xfs_extent_busy_ag_cmp+0x50/0x50 xfs
[   10.922565] path_openat (fs/namei.c:3365 fs/namei.c:3498)=20
[   10.922576] ? path_lookupat (fs/namei.c:3480)=20
[   10.922583] ? rwsem_down_write_slowpath (kernel/locking/rwsem.c:1447)=20
[   10.922592] ? handle_mm_fault (mm/memory.c:4501 mm/memory.c:4565)=20
[   10.922599] ? do_user_addr_fault (./arch/x86/include/asm/jump_label.h:25=
 ./include/linux/jump_label.h:200 ./include/linux/mmap_lock.h:41 ./include/=
linux/mmap_lock.h:144 arch/x86/mm/fault.c:1414)=20
[   10.922607] do_filp_open (fs/namei.c:3525)=20
[   10.922615] ? may_open_dev (fs/namei.c:3519)=20
[   10.922624] ? __fdget (fs/file.c:201)=20
[   10.922630] ? _raw_spin_lock (./arch/x86/include/asm/atomic.h:202 ./incl=
ude/asm-generic/atomic-instrumented.h:707 ./include/asm-generic/qspinlock.h=
:82 ./include/linux/spinlock.h:183 ./include/linux/spinlock_api_smp.h:143 k=
ernel/locking/spinlock.c:151)=20
[   10.922637] ? _find_next_bit.constprop.0 (lib/find_bit.c:41)=20
[   10.922645] ? alloc_fd (fs/file.c:526 (discriminator 13))=20
[   10.922651] do_sys_openat2 (fs/open.c:1187)=20
[   10.922658] ? build_open_flags (fs/open.c:1173)=20
[   10.922666] __x64_sys_openat (fs/open.c:1214)=20
[   10.922672] ? __x64_sys_open (fs/open.c:1214)=20
[   10.922679] ? ktime_get_coarse_real_ts64 (kernel/time/timekeeping.c:2230=
 (discriminator 3))=20
[   10.922687] do_syscall_64 (arch/x86/entry/common.c:46)=20
[   10.922694] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:11=
2)=20
[   10.922701] RIP: 0033:0x7f5dca6be8cc
[ 10.922706] Code: 24 18 31 c0 41 83 e2 40 75 44 89 f0 25 00 00 41 00 3d 00=
 00 41 00 74 36 44 89 c2 4c 89 ce bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> =
3d 00 f0 ff ff 77 44 48 8b 54 24 18 64 48 2b 14 25 28 00 00 00
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	24 18                	and    $0x18,%al
   2:	31 c0                	xor    %eax,%eax
   4:	41 83 e2 40          	and    $0x40,%r10d
   8:	75 44                	jne    0x4e
   a:	89 f0                	mov    %esi,%eax
   c:	25 00 00 41 00       	and    $0x410000,%eax
  11:	3d 00 00 41 00       	cmp    $0x410000,%eax
  16:	74 36                	je     0x4e
  18:	44 89 c2             	mov    %r8d,%edx
  1b:	4c 89 ce             	mov    %r9,%rsi
  1e:	bf 9c ff ff ff       	mov    $0xffffff9c,%edi
  23:	b8 01 01 00 00       	mov    $0x101,%eax
  28:	0f 05                	syscall=20
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping =
instruction
  30:	77 44                	ja     0x76
  32:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  37:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  3e:	00 00=20

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 44                	ja     0x4c
   8:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
   d:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  14:	00 00=20
[   10.922712] RSP: 002b:00007ffef51fa140 EFLAGS: 00000287 ORIG_RAX: 000000=
0000000101
[   10.922718] RAX: ffffffffffffffda RBX: 00005598f2a69ad0 RCX: 00007f5dca6=
be8cc
[   10.922723] RDX: 0000000000080000 RSI: 00007f5dc9d0215e RDI: 00000000fff=
fff9c
[   10.922727] RBP: 0000000000000008 R08: 0000000000080000 R09: 00007f5dc9d=
0215e
[   10.922731] R10: 0000000000000000 R11: 0000000000000287 R12: 00007f5dca7=
5555f
[   10.922735] R13: 00005598f2a69ad0 R14: 0000000000000001 R15: 00005598f2a=
6f690
[   10.922742] handlers:
WARNING! Modules path isn't set, but is needed to parse this symbol
[   10.925696] amd_gpio_irq_handler pinctrl_amd
[   10.928757] Disabling IRQ #7
[   11.000127] r8169 0000:0a:00.0 enp10s0: renamed from eth0
[   11.040131] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000:=
00/0000:00:08.1/0000:0c:00.1/sound/card0/input10
[   11.062301] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC671: li=
ne_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[   11.062314] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[   11.062321] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[   11.062327] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[   11.062331] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[   11.062335] snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x19
[   11.062340] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1b
[   11.100251] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:0=
8.1/0000:0c:00.6/sound/card1/input12
[   11.136401] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:=
08.1/0000:0c:00.6/sound/card1/input13
[   11.137883] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000=
:00:08.1/0000:0c:00.6/sound/card1/input14
[   11.138953] input: HD-Audio Generic Front Headphone as /devices/pci0000:=
00/0000:00:08.1/0000:0c:00.6/sound/card1/input15
[   11.176742] logitech-djreceiver 0003:046D:C534.0001: hidraw0: USB HID v1=
=2E11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
[   11.227161] Generic FE-GE Realtek PHY r8169-a00:00: attached PHY driver =
(mii_bus:phy_addr=3Dr8169-a00:00, irq=3DMAC)
[   11.237250] kvm: Nested Virtualization enabled
[   11.237675] SVM: kvm: Nested Paging enabled
[   11.237678] SVM: Virtual VMLOAD VMSAVE supported
[   11.237680] SVM: Virtual GIF supported
[   11.254272] rtw_8821ce 0000:09:00.0: enabling device (0100 -> 0103)
[   11.255242] rtw_8821ce 0000:09:00.0: Firmware version 24.8.0, H2C versio=
n 12
[   11.259785] MCE: In-kernel MCE decoding enabled.
[   11.363583] intel_rapl_common: Found RAPL domain package
[   11.363589] intel_rapl_common: Found RAPL domain core
[   11.410765] logitech-djreceiver 0003:046D:C534.0002: hiddev96,hidraw1: U=
SB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
[   11.420576] r8169 0000:0a:00.0 enp10s0: Link is Down
[   11.466717] input: HP WMI hotkeys as /devices/virtual/input/input11
[   11.469832] logitech-djreceiver 0003:046D:C534.0002: device of type eQUA=
D nano Lite (0x0a) connected on slot 1
[   11.471818] logitech-djreceiver 0003:046D:C534.0002: device of type eQUA=
D nano Lite (0x0a) connected on slot 2
[   11.472590] input: Logitech Wireless Keyboard PID:4075 Keyboard as /devi=
ces/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.=
0002/0003:046D:4075.0003/input/input16
[   11.508438] hid-generic 0003:046D:4075.0003: input,hidraw2: USB HID v1.1=
1 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/inp=
ut1:1
[   11.516054] input: Logitech Wireless Mouse PID:4054 Mouse as /devices/pc=
i0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0=
003:046D:4054.0004/input/input21
[   11.517269] hid-generic 0003:046D:4054.0004: input,hidraw3: USB HID v1.1=
1 Mouse [Logitech Wireless Mouse PID:4054] on usb-0000:01:00.0-11/input1:2
[   11.562528] mousedev: PS/2 mouse device common for all mice
[   11.564389] [drm] amdgpu kernel modesetting enabled.
[   11.589805] Virtual CRAT table created for CPU
[   11.590262] amdgpu: Topology: Add CPU node
[   11.591010] checking generic (d0000000 300000) vs hw (d0000000 10000000)
[   11.591018] fb0: switching to amdgpudrmfb from EFI VGA
[   11.592584] Console: switching to colour dummy device 80x25
[   11.592857] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[   11.594681] amdgpu 0000:0c:00.0: enabling device (0106 -> 0107)
[   11.601781] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 =
0x103C:0x87D6 0xCA).
[   11.601801] amdgpu 0000:0c:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re disabled as experimental (default)
[   11.601948] [drm] register mmio base: 0xFCA00000
[   11.601955] [drm] register mmio size: 524288
[   11.601959] [drm] PCIE atomic ops is not supported
[   11.602930] [drm] add ip block number 0 <soc15_common>
[   11.602939] [drm] add ip block number 1 <gmc_v9_0>
[   11.602941] [drm] add ip block number 2 <vega10_ih>
[   11.602944] [drm] add ip block number 3 <psp>
[   11.602946] [drm] add ip block number 4 <smu>
[   11.602949] [drm] add ip block number 5 <gfx_v9_0>
[   11.602951] [drm] add ip block number 6 <sdma_v4_0>
[   11.602954] [drm] add ip block number 7 <dm>
[   11.602956] [drm] add ip block number 8 <vcn_v2_0>
[   11.602959] [drm] add ip block number 9 <jpeg_v2_0>
[   11.603002] amdgpu 0000:0c:00.0: amdgpu: Fetched VBIOS from VFCT
[   11.603051] amdgpu: ATOM BIOS: 113-RENOIR-026
[   11.605135] [drm] VCN decode is enabled in VM mode
[   11.605141] [drm] VCN encode is enabled in VM mode
[   11.605144] [drm] JPEG decode is enabled in VM mode
[   11.606408] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[   11.606531] amdgpu 0000:0c:00.0: amdgpu: VRAM: 512M 0x000000F400000000 -=
 0x000000F41FFFFFFF (512M used)
[   11.606539] amdgpu 0000:0c:00.0: amdgpu: GART: 1024M 0x0000000000000000 =
- 0x000000003FFFFFFF
[   11.606545] amdgpu 0000:0c:00.0: amdgpu: AGP: 267419648M 0x000000F800000=
000 - 0x0000FFFFFFFFFFFF
[   11.606585] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
[   11.606588] [drm] RAM width 128bits DDR4
[   11.607685] [TTM] Zone  kernel: Available graphics memory: 14040156 KiB
[   11.607693] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   11.630603] [drm] amdgpu: 512M of VRAM memory ready
[   11.630690] [drm] amdgpu: 3072M of GTT memory ready.
[   11.630759] ------------[ cut here ]------------
[   11.630762] amdgpu 0000:0c:00.0: Buffer overflow detected. Allocation si=
ze: 3005. Mapping size: 4096.
[   11.630776] WARNING: CPU: 2 PID: 314 at kernel/dma/swiotlb.c:380 swiotlb=
_bounce (kernel/dma/swiotlb.c:380)=20
[   11.630787] Modules linked in: joydev fjes(-) mousedev intel_rapl_msr in=
tel_rapl_common amdgpu(+) edac_mce_amd rtw88_8821ce rtw88_8821c rtw88_pci k=
vm_amd rtw88_core kvm snd_hda_codec_realtek snd_hda_codec_generic hp_wmi(+)=
 ledtrig_audio hid_logitech_dj snd_hda_codec_hdmi wmi_bmof sparse_keymap ir=
qbypass snd_hda_intel mac80211 snd_intel_dspcfg crct10dif_pclmul crc32_pclm=
ul snd_intel_sdw_acpi vfat fat ghash_clmulni_intel snd_hda_codec gpu_sched =
i2c_algo_bit aesni_intel drm_ttm_helper ttm crypto_simd r8169 snd_hda_core =
cryptd drm_kms_helper rapl realtek snd_hwdep cfg80211 mdio_devres pcspkr sn=
d_pcm k10temp cec snd_timer libphy sp5100_tco libarc4 tpm_crb snd syscopyar=
ea i2c_piix4 ccp sysfillrect soundcore sysimgblt fb_sys_fops usbhid tpm_tis=
 tpm_tis_core wmi video tpm gpio_amdpt pinctrl_amd rng_core gpio_generic ma=
c_hid acpi_tad acpi_cpufreq btusb btrtl btbcm btintel bluetooth ecdh_generi=
c rfkill ecc crc16 pkcs8_key_parser drm fuse agpgart bpf_preload ip_tables =
x_tables xfs libcrc32c
[   11.630983]  crc32c_generic crc32c_intel xhci_pci xhci_pci_renesas
[   11.630996] CPU: 2 PID: 314 Comm: systemd-udevd Tainted: G    B         =
    5.12.0-rc3-debug-00033-g167e3e00e2be #1
[   11.631003] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[   11.631007] RIP: 0010:swiotlb_bounce (kernel/dma/swiotlb.c:380)=20
[ 11.631014] Code: ef e8 a9 df 28 00 4c 8b 6d 00 48 89 ef e8 4d 23 8c 00 4d=
 89 f0 48 89 d9 4c 89 ea 48 89 c6 48 c7 c7 a0 ed e8 ae e8 3d 57 e7 00 <0f> =
0b 48 c7 c7 e0 89 5b af 49 89 de e8 74 df 28 00 48 8b 05 dd 41
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	ef                   	out    %eax,(%dx)
   1:	e8 a9 df 28 00       	call   0x28dfaf
   6:	4c 8b 6d 00          	mov    0x0(%rbp),%r13
   a:	48 89 ef             	mov    %rbp,%rdi
   d:	e8 4d 23 8c 00       	call   0x8c235f
  12:	4d 89 f0             	mov    %r14,%r8
  15:	48 89 d9             	mov    %rbx,%rcx
  18:	4c 89 ea             	mov    %r13,%rdx
  1b:	48 89 c6             	mov    %rax,%rsi
  1e:	48 c7 c7 a0 ed e8 ae 	mov    $0xffffffffaee8eda0,%rdi
  25:	e8 3d 57 e7 00       	call   0xe75767
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	48 c7 c7 e0 89 5b af 	mov    $0xffffffffaf5b89e0,%rdi
  33:	49 89 de             	mov    %rbx,%r14
  36:	e8 74 df 28 00       	call   0x28dfaf
  3b:	48                   	rex.W
  3c:	8b                   	.byte 0x8b
  3d:	05                   	.byte 0x5
  3e:	dd                   	.byte 0xdd
  3f:	41                   	rex.B

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	0f 0b                	ud2   =20
   2:	48 c7 c7 e0 89 5b af 	mov    $0xffffffffaf5b89e0,%rdi
   9:	49 89 de             	mov    %rbx,%r14
   c:	e8 74 df 28 00       	call   0x28df85
  11:	48                   	rex.W
  12:	8b                   	.byte 0x8b
  13:	05                   	.byte 0x5
  14:	dd                   	.byte 0xdd
  15:	41                   	rex.B
[   11.631020] RSP: 0018:ffffc9000190f138 EFLAGS: 00010286
[   11.631026] RAX: 0000000000000000 RBX: 0000000000000bbd RCX: 00000000000=
00000
[   11.631030] RDX: 0000000000000027 RSI: 0000000000000004 RDI: fffff520003=
21e19
[   11.631034] RBP: ffff8881050190c8 R08: ffffffffadacdcae R09: ffff8887c32=
a06eb
[   11.631038] R10: ffffed10f86540dd R11: 0000000000000001 R12: 000000000a2=
0d443
[   11.631042] R13: ffff888105081c90 R14: 0000000000001000 R15: 00000000000=
00002
[   11.631046] FS:  00007fbdc0f1ca40(0000) GS:ffff8887c3280000(0000) knlGS:=
0000000000000000
[   11.631051] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.631055] CR2: 00007fd6d40117f8 CR3: 000000013da9c000 CR4: 00000000003=
50ee0
[   11.631060] Call Trace:
[   11.631065] swiotlb_tbl_map_single (kernel/dma/swiotlb.c:562)=20
[   11.631074] swiotlb_map (kernel/dma/swiotlb.c:672)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.631080] ? drm_mm_init+0x126/0x140 drm
[   11.631206] ? swiotlb_sync_single_for_cpu (kernel/dma/swiotlb.c:665)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.631213] ? ttm_range_man_init+0xdd/0x100 ttm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.631236] ? amdgpu_ttm_init.cold+0x153/0x16f amdgpu
[   11.632193] dma_map_page_attrs (kernel/dma/direct.h:91 kernel/dma/mappin=
g.c:156)=20
[   11.632200] ? dmam_free_coherent (kernel/dma/mapping.c:145)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.632207] amdgpu_gart_init+0x77/0xf0 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.632909] gmc_v9_0_sw_init+0x910/0x980 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.633492] ? gmc_v9_0_late_init+0xe0/0xe0 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.634128] ? __drmm_add_action+0xf0/0x140 drm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.634214] ? drm_mode_config_cleanup+0x480/0x480 drm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.634297] ? drm_mode_config_cleanup+0x480/0x480 drm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.634381] amdgpu_device_init.cold+0x1483/0x2400 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.635013] ? amdgpu_device_cache_pci_state+0x90/0x90 amdgpu
[   11.635601] ? pci_find_saved_ext_cap (drivers/pci/pci.c:1797)=20
[   11.635607] ? pci_bus_read_config_byte (drivers/pci/access.c:64)=20
[   11.635611] ? __list_add_valid (lib/list_debug.c:26)=20
[   11.635616] ? kasan_unpoison (mm/kasan/shadow.c:102 mm/kasan/shadow.c:13=
6 mm/kasan/shadow.c:109)=20
[   11.635621] ? pci_enable_device_flags (drivers/pci/pci.c:1900)=20
[   11.635625] ? pci_enable_bridge (drivers/pci/pci.c:1868)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.635630] amdgpu_driver_load_kms+0xb1/0x3f0 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.636214] amdgpu_pci_probe+0x172/0x200 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.636796] ? amdgpu_pci_remove+0x80/0x80 amdgpu
[   11.637510] local_pci_probe (drivers/pci/pci-driver.c:309)=20
[   11.637517] pci_device_probe (drivers/pci/pci-driver.c:366 drivers/pci/p=
ci-driver.c:391 drivers/pci/pci-driver.c:434)=20
[   11.637522] ? pci_device_remove (drivers/pci/pci-driver.c:419)=20
[   11.637527] ? kernfs_put (./arch/x86/include/asm/atomic.h:123 (discrimin=
ator 1) ./include/asm-generic/atomic-instrumented.h:749 (discriminator 1) f=
s/kernfs/dir.c:511 (discriminator 1))=20
[   11.637531] ? sysfs_do_create_link_sd (fs/sysfs/symlink.c:48)=20
[   11.637536] really_probe (drivers/base/dd.c:554)=20
[   11.637541] driver_probe_device (drivers/base/dd.c:740)=20
[   11.637545] device_driver_attach (drivers/base/dd.c:1015)=20
[   11.637549] ? device_driver_attach (drivers/base/dd.c:1047)=20
[   11.637553] __driver_attach (drivers/base/dd.c:1094)=20
[   11.637557] ? device_driver_attach (drivers/base/dd.c:1047)=20
[   11.637560] bus_for_each_dev (drivers/base/bus.c:305)=20
[   11.637565] ? subsys_dev_iter_exit (drivers/base/bus.c:294)=20
[   11.637569] ? __list_add_valid (lib/list_debug.c:26)=20
[   11.637574] bus_add_driver (drivers/base/bus.c:623)=20
[   11.637580] driver_register (drivers/base/driver.c:171)=20
[   11.637584]  ? 0xffffffffc1588000
[   11.637588] do_one_initcall (init/main.c:1226)=20
[   11.637593] ? perf_trace_initcall_level (init/main.c:1217)=20
[   11.637597] ? kfree (mm/slub.c:3161 mm/slub.c:4213)=20
[   11.637602] ? kasan_set_track (mm/kasan/common.c:46)=20
[   11.637607] ? kasan_unpoison (mm/kasan/shadow.c:102 mm/kasan/shadow.c:13=
6 mm/kasan/shadow.c:109)=20
[   11.637611] ? kasan_unpoison (mm/kasan/shadow.c:102 mm/kasan/shadow.c:13=
6 mm/kasan/shadow.c:109)=20
[   11.637615] do_init_module (kernel/module.c:3655)=20
[   11.637622] load_module (kernel/module.c:4050)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.637626] ? xfs_file_buffered_read+0x82/0x130 xfs
[   11.637883] ? module_frob_arch_sections+0x20/0x20=20
[   11.637888] ? kernel_read (fs/read_write.c:469)=20
[   11.637893] ? kernel_read_file (./arch/x86/include/asm/atomic.h:95 ./inc=
lude/asm-generic/atomic-instrumented.h:241 ./include/linux/fs.h:2940 fs/ker=
nel_read_file.c:122)=20
[   11.637901] ? __do_sys_finit_module (kernel/module.c:4140)=20
[   11.637905] __do_sys_finit_module (kernel/module.c:4140)=20
[   11.637909] ? __ia32_sys_init_module (kernel/module.c:4118)=20
[   11.637913] ? get_nth_filter.part.0 (kernel/seccomp.c:1157)=20
[   11.637918] ? randomize_stack_top (mm/util.c:509)=20
[   11.637923] ? __ia32_compat_sys_newlstat (fs/stat.c:382)=20
[   11.637929] ? __audit_syscall_entry (kernel/auditsc.c:1689)=20
[   11.637933] ? ktime_get_coarse_real_ts64 (kernel/time/timekeeping.c:2230=
 (discriminator 3))=20
[   11.637938] do_syscall_64 (arch/x86/entry/common.c:46)=20
[   11.637944] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:11=
2)=20
[   11.637949] RIP: 0033:0x7fbdc184c18d
[ 11.637953] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89=
 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> =
3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	b4 0c                	mov    $0xc,%ah
   2:	00 0f                	add    %cl,(%rdi)
   4:	05 eb a9 66 0f       	add    $0xf66a9eb,%eax
   9:	1f                   	(bad) =20
   a:	44 00 00             	add    %r8b,(%rax)
   d:	f3 0f 1e fa          	endbr64=20
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall=20
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping =
instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret   =20
  33:	48 8b 0d b3 6c 0c 00 	mov    0xc6cb3(%rip),%rcx        # 0xc6ced
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret   =20
   9:	48 8b 0d b3 6c 0c 00 	mov    0xc6cb3(%rip),%rcx        # 0xc6cc3
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[   11.637957] RSP: 002b:00007ffeae8de308 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   11.637962] RAX: ffffffffffffffda RBX: 000055db08823060 RCX: 00007fbdc18=
4c18d
[   11.637965] RDX: 0000000000000000 RSI: 00007fbdc19a9a9d RDI: 00000000000=
00018
[   11.637970] RBP: 0000000000020000 R08: 0000000000000000 R09: 00007fbdc1b=
dc5ea
[   11.637973] R10: 0000000000000018 R11: 0000000000000246 R12: 00007fbdc19=
a9a9d
[   11.637975] R13: 0000000000000000 R14: 000055db088292c0 R15: 000055db088=
23060
[   11.637980] ---[ end trace bee6f34729e28f2c ]---
[   11.637985] BUG: unable to handle page fault for address: 000008714b9094=
43
[   11.637995] #PF: supervisor write access in kernel mode
[   11.638001] #PF: error_code(0x0002) - not-present page
[   11.638007] PGD 0 P4D 0
[   11.638014] Oops: 0002 [#1] PREEMPT SMP KASAN NOPTI
[   11.638021] CPU: 2 PID: 314 Comm: systemd-udevd Tainted: G    B   W     =
    5.12.0-rc3-debug-00033-g167e3e00e2be #1
[   11.638031] Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17=
/2020
[   11.638038] RIP: 0010:__memcpy (arch/x86/lib/memcpy_64.S:39)=20
[ 11.638044] Code: 74 e0 8b 05 38 4e 67 01 85 c0 75 d6 e8 47 6f 6d ff b8 01=
 00 00 00 c3 cc 0f 1f 44 00 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 <f3> =
48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	74 e0                	je     0xffffffffffffffe2
   2:	8b 05 38 4e 67 01    	mov    0x1674e38(%rip),%eax        # 0x1674e40
   8:	85 c0                	test   %eax,%eax
   a:	75 d6                	jne    0xffffffffffffffe2
   c:	e8 47 6f 6d ff       	call   0xffffffffff6d6f58
  11:	b8 01 00 00 00       	mov    $0x1,%eax
  16:	c3                   	ret   =20
  17:	cc                   	int3  =20
  18:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 d1             	mov    %rdx,%rcx
  23:	48 c1 e9 03          	shr    $0x3,%rcx
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)		<-- trapping =
instruction
  2d:	89 d1                	mov    %edx,%ecx
  2f:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  31:	c3                   	ret   =20
  32:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  38:	48 89 f8             	mov    %rdi,%rax
  3b:	48 89 d1             	mov    %rdx,%rcx
  3e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
   3:	89 d1                	mov    %edx,%ecx
   5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
   7:	c3                   	ret   =20
   8:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   e:	48 89 f8             	mov    %rdi,%rax
  11:	48 89 d1             	mov    %rdx,%rcx
  14:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
[   11.638058] RSP: 0018:ffffc9000190f188 EFLAGS: 00010206
[   11.638065] RAX: 000008714b909443 RBX: 000000000a20d000 RCX: 00000000000=
00177
[   11.638071] RDX: 0000000000000005 RSI: ffff88800a20d443 RDI: 000008714b9=
09443
[   11.638078] RBP: 0000000000000002 R08: 0000000000000001 R09: 000008714b9=
0a000
[   11.638085] R10: ffffed1001441bff R11: 0000000000000001 R12: 00000000000=
00002
[   11.638091] R13: ffff8887c008f000 R14: 0000000000000048 R15: 00000000000=
00002
[   11.638098] FS:  00007fbdc0f1ca40(0000) GS:ffff8887c3280000(0000) knlGS:=
0000000000000000
[   11.638106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.638112] CR2: 000008714b909443 CR3: 000000013da9c000 CR4: 00000000003=
50ee0
[   11.638119] Call Trace:
[   11.638123] swiotlb_tbl_map_single (kernel/dma/swiotlb.c:562)=20
[   11.638133] swiotlb_map (kernel/dma/swiotlb.c:672)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.638141] ? drm_mm_init+0x126/0x140 drm
[   11.638225] ? swiotlb_sync_single_for_cpu (kernel/dma/swiotlb.c:665)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.638232] ? ttm_range_man_init+0xdd/0x100 ttm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.638251] ? amdgpu_ttm_init.cold+0x153/0x16f amdgpu
[   11.638881] dma_map_page_attrs (kernel/dma/direct.h:91 kernel/dma/mappin=
g.c:156)=20
[   11.638888] ? dmam_free_coherent (kernel/dma/mapping.c:145)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.638896] amdgpu_gart_init+0x77/0xf0 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.639489] gmc_v9_0_sw_init+0x910/0x980 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.640090] ? gmc_v9_0_late_init+0xe0/0xe0 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.640860] ? __drmm_add_action+0xf0/0x140 drm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.641004] ? drm_mode_config_cleanup+0x480/0x480 drm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.641127] ? drm_mode_config_cleanup+0x480/0x480 drm
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.641222] amdgpu_device_init.cold+0x1483/0x2400 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.641849] ? amdgpu_device_cache_pci_state+0x90/0x90 amdgpu
[   11.642456] ? pci_find_saved_ext_cap (drivers/pci/pci.c:1797)=20
[   11.642466] ? pci_bus_read_config_byte (drivers/pci/access.c:64)=20
[   11.642473] ? __list_add_valid (lib/list_debug.c:26)=20
[   11.642481] ? kasan_unpoison (mm/kasan/shadow.c:102 mm/kasan/shadow.c:13=
6 mm/kasan/shadow.c:109)=20
[   11.642490] ? pci_enable_device_flags (drivers/pci/pci.c:1900)=20
[   11.642497] ? pci_enable_bridge (drivers/pci/pci.c:1868)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.642505] amdgpu_driver_load_kms+0xb1/0x3f0 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.643105] amdgpu_pci_probe+0x172/0x200 amdgpu
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.643686] ? amdgpu_pci_remove+0x80/0x80 amdgpu
[   11.644405] local_pci_probe (drivers/pci/pci-driver.c:309)=20
[   11.644415] pci_device_probe (drivers/pci/pci-driver.c:366 drivers/pci/p=
ci-driver.c:391 drivers/pci/pci-driver.c:434)=20
[   11.644422] ? pci_device_remove (drivers/pci/pci-driver.c:419)=20
[   11.644430] ? kernfs_put (./arch/x86/include/asm/atomic.h:123 (discrimin=
ator 1) ./include/asm-generic/atomic-instrumented.h:749 (discriminator 1) f=
s/kernfs/dir.c:511 (discriminator 1))=20
[   11.644437] ? sysfs_do_create_link_sd (fs/sysfs/symlink.c:48)=20
[   11.644446] really_probe (drivers/base/dd.c:554)=20
[   11.644453] driver_probe_device (drivers/base/dd.c:740)=20
[   11.644460] device_driver_attach (drivers/base/dd.c:1015)=20
[   11.644467] ? device_driver_attach (drivers/base/dd.c:1047)=20
[   11.644474] __driver_attach (drivers/base/dd.c:1094)=20
[   11.644480] ? device_driver_attach (drivers/base/dd.c:1047)=20
[   11.644487] bus_for_each_dev (drivers/base/bus.c:305)=20
[   11.644494] ? subsys_dev_iter_exit (drivers/base/bus.c:294)=20
[   11.644501] ? __list_add_valid (lib/list_debug.c:26)=20
[   11.644510] bus_add_driver (drivers/base/bus.c:623)=20
[   11.644518] driver_register (drivers/base/driver.c:171)=20
[   11.644525]  ? 0xffffffffc1588000
[   11.644531] do_one_initcall (init/main.c:1226)=20
[   11.644539] ? perf_trace_initcall_level (init/main.c:1217)=20
[   11.644547] ? kfree (mm/slub.c:3161 mm/slub.c:4213)=20
[   11.644554] ? kasan_set_track (mm/kasan/common.c:46)=20
[   11.644561] ? kasan_unpoison (mm/kasan/shadow.c:102 mm/kasan/shadow.c:13=
6 mm/kasan/shadow.c:109)=20
[   11.644568] ? kasan_unpoison (mm/kasan/shadow.c:102 mm/kasan/shadow.c:13=
6 mm/kasan/shadow.c:109)=20
[   11.644576] do_init_module (kernel/module.c:3655)=20
[   11.644585] load_module (kernel/module.c:4050)=20
WARNING! Modules path isn't set, but is needed to parse this symbol
[   11.644592] ? xfs_file_buffered_read+0x82/0x130 xfs
[   11.644852] ? module_frob_arch_sections+0x20/0x20=20
[   11.644860] ? kernel_read (fs/read_write.c:469)=20
[   11.644868] ? kernel_read_file (./arch/x86/include/asm/atomic.h:95 ./inc=
lude/asm-generic/atomic-instrumented.h:241 ./include/linux/fs.h:2940 fs/ker=
nel_read_file.c:122)=20
[   11.644879] ? __do_sys_finit_module (kernel/module.c:4140)=20
[   11.644886] __do_sys_finit_module (kernel/module.c:4140)=20
[   11.644893] ? __ia32_sys_init_module (kernel/module.c:4118)=20
[   11.644900] ? get_nth_filter.part.0 (kernel/seccomp.c:1157)=20
[   11.644909] ? randomize_stack_top (mm/util.c:509)=20
[   11.644918] ? __ia32_compat_sys_newlstat (fs/stat.c:382)=20
[   11.644927] ? __audit_syscall_entry (kernel/auditsc.c:1689)=20
[   11.644934] ? ktime_get_coarse_real_ts64 (kernel/time/timekeeping.c:2230=
 (discriminator 3))=20
[   11.644943] do_syscall_64 (arch/x86/entry/common.c:46)=20
[   11.644951] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:11=
2)=20
[   11.644959] RIP: 0033:0x7fbdc184c18d
[ 11.644965] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89=
 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> =
3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	b4 0c                	mov    $0xc,%ah
   2:	00 0f                	add    %cl,(%rdi)
   4:	05 eb a9 66 0f       	add    $0xf66a9eb,%eax
   9:	1f                   	(bad) =20
   a:	44 00 00             	add    %r8b,(%rax)
   d:	f3 0f 1e fa          	endbr64=20
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall=20
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping =
instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret   =20
  33:	48 8b 0d b3 6c 0c 00 	mov    0xc6cb3(%rip),%rcx        # 0xc6ced
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret   =20
   9:	48 8b 0d b3 6c 0c 00 	mov    0xc6cb3(%rip),%rcx        # 0xc6cc3
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[   11.644979] RSP: 002b:00007ffeae8de308 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[   11.644989] RAX: ffffffffffffffda RBX: 000055db08823060 RCX: 00007fbdc18=
4c18d
[   11.644996] RDX: 0000000000000000 RSI: 00007fbdc19a9a9d RDI: 00000000000=
00018
[   11.645002] RBP: 0000000000020000 R08: 0000000000000000 R09: 00007fbdc1b=
dc5ea
[   11.645009] R10: 0000000000000018 R11: 0000000000000246 R12: 00007fbdc19=
a9a9d
[   11.645015] R13: 0000000000000000 R14: 000055db088292c0 R15: 000055db088=
23060
[   11.645024] Modules linked in: joydev mousedev intel_rapl_msr intel_rapl=
_common amdgpu(+) edac_mce_amd rtw88_8821ce rtw88_8821c rtw88_pci kvm_amd r=
tw88_core kvm snd_hda_codec_realtek snd_hda_codec_generic hp_wmi(+) ledtrig=
_audio hid_logitech_dj snd_hda_codec_hdmi wmi_bmof sparse_keymap irqbypass =
snd_hda_intel mac80211 snd_intel_dspcfg crct10dif_pclmul crc32_pclmul snd_i=
ntel_sdw_acpi vfat fat ghash_clmulni_intel snd_hda_codec gpu_sched i2c_algo=
_bit aesni_intel drm_ttm_helper ttm crypto_simd r8169 snd_hda_core cryptd d=
rm_kms_helper rapl realtek snd_hwdep cfg80211 mdio_devres pcspkr snd_pcm k1=
0temp cec snd_timer libphy sp5100_tco libarc4 tpm_crb snd syscopyarea i2c_p=
iix4 ccp sysfillrect soundcore sysimgblt fb_sys_fops usbhid tpm_tis tpm_tis=
_core wmi video tpm gpio_amdpt pinctrl_amd rng_core gpio_generic mac_hid ac=
pi_tad acpi_cpufreq btusb btrtl btbcm btintel bluetooth ecdh_generic rfkill=
 ecc crc16 pkcs8_key_parser drm fuse agpgart bpf_preload ip_tables x_tables=
 xfs libcrc32c crc32c_generic
[   11.645156]  crc32c_intel xhci_pci xhci_pci_renesas
[   11.645210] CR2: 000008714b909443
[   11.645216] ---[ end trace bee6f34729e28f2d ]---
[   11.645221] RIP: 0010:__memcpy (arch/x86/lib/memcpy_64.S:39)=20
[ 11.645227] Code: 74 e0 8b 05 38 4e 67 01 85 c0 75 d6 e8 47 6f 6d ff b8 01=
 00 00 00 c3 cc 0f 1f 44 00 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 <f3> =
48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	74 e0                	je     0xffffffffffffffe2
   2:	8b 05 38 4e 67 01    	mov    0x1674e38(%rip),%eax        # 0x1674e40
   8:	85 c0                	test   %eax,%eax
   a:	75 d6                	jne    0xffffffffffffffe2
   c:	e8 47 6f 6d ff       	call   0xffffffffff6d6f58
  11:	b8 01 00 00 00       	mov    $0x1,%eax
  16:	c3                   	ret   =20
  17:	cc                   	int3  =20
  18:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 d1             	mov    %rdx,%rcx
  23:	48 c1 e9 03          	shr    $0x3,%rcx
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)		<-- trapping =
instruction
  2d:	89 d1                	mov    %edx,%ecx
  2f:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  31:	c3                   	ret   =20
  32:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  38:	48 89 f8             	mov    %rdi,%rax
  3b:	48 89 d1             	mov    %rdx,%rcx
  3e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
   3:	89 d1                	mov    %edx,%ecx
   5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
   7:	c3                   	ret   =20
   8:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   e:	48 89 f8             	mov    %rdi,%rax
  11:	48 89 d1             	mov    %rdx,%rcx
  14:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
[   11.645241] RSP: 0018:ffffc9000190f188 EFLAGS: 00010206
[   11.645247] RAX: 000008714b909443 RBX: 000000000a20d000 RCX: 00000000000=
00177
[   11.645254] RDX: 0000000000000005 RSI: ffff88800a20d443 RDI: 000008714b9=
09443
[   11.645261] RBP: 0000000000000002 R08: 0000000000000001 R09: 000008714b9=
0a000
[   11.645268] R10: ffffed1001441bff R11: 0000000000000001 R12: 00000000000=
00002
[   11.645274] R13: ffff8887c008f000 R14: 0000000000000048 R15: 00000000000=
00002
[   11.645281] FS:  00007fbdc0f1ca40(0000) GS:ffff8887c3280000(0000) knlGS:=
0000000000000000
[   11.645289] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.645295] CR2: 000008714b909443 CR3: 000000013da9c000 CR4: 00000000003=
50ee0
[   11.911417] input: Logitech Wireless Keyboard PID:4075 as /devices/pci00=
00:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003=
:046D:4075.0003/input/input25
[   11.916555] logitech-hidpp-device 0003:046D:4075.0003: input,hidraw2: US=
B HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:0=
0.0-11/input1:1
[   11.999932] input: Logitech Wireless Mouse as /devices/pci0000:00/0000:0=
0:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4054.0=
004/input/input26
[   12.003578] logitech-hidpp-device 0003:046D:4054.0004: input,hidraw3: US=
B HID v1.11 Mouse [Logitech Wireless Mouse] on usb-0000:01:00.0-11/input1:2
[   12.093114] rtw_8821ce 0000:09:00.0: start vif 74:12:b3:a0:4a:cb on port=
 0
[   14.558903] r8169 0000:0a:00.0 enp10s0: Link is Up - 1Gbps/Full - flow c=
ontrol rx/tx
[   14.558977] IPv6: ADDRCONF(NETDEV_CHANGE): enp10s0: link becomes ready
[   16.594062] kauditd_printk_skb: 32 callbacks suppressed
[   16.594072] audit: type=3D1131 audit(1625508119.391:44): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-rfkill comm=3D"sy=
stemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? =
res=3Dsuccess'
[   22.787517] audit: type=3D1101 audit(1625508125.584:45): pid=3D431 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:accounting grantors=
=3Dpam_access,pam_unix,pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/bin/=
sshd" hostname=3D192.168.4.54 addr=3D192.168.4.54 terminal=3Dssh res=3Dsucc=
ess'
[   22.795143] audit: type=3D1103 audit(1625508125.591:46): pid=3D431 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:setcred grantors=3D=
pam_shells,pam_faillock,pam_permit,pam_env,pam_faillock acct=3D"nathan" exe=
=3D"/usr/bin/sshd" hostname=3D192.168.4.54 addr=3D192.168.4.54 terminal=3Ds=
sh res=3Dsuccess'
[   22.795888] audit: type=3D1006 audit(1625508125.591:47): pid=3D431 uid=
=3D0 old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 se=
s=3D1 res=3D1
[   22.796100] audit: type=3D1300 audit(1625508125.591:47): arch=3Dc000003e=
 syscall=3D1 success=3Dyes exit=3D4 a0=3D3 a1=3D7ffe0d54df00 a2=3D4 a3=3D3e=
8 items=3D0 ppid=3D394 pid=3D431 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D1 comm=3D"ssh=
d" exe=3D"/usr/bin/sshd" key=3D(null)
[   22.800853] audit: type=3D1327 audit(1625508125.591:47): proctitle=3D737=
368643A206E617468616E205B707269765D
[   22.877834] audit: type=3D1130 audit(1625508125.674:48): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser-runtime-dir@1000 com=
m=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termin=
al=3D? res=3Dsuccess'
[   22.917759] audit: type=3D1101 audit(1625508125.714:49): pid=3D434 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:accounting grantors=
=3Dpam_access,pam_unix,pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/lib/=
systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.918096] audit: type=3D1103 audit(1625508125.714:50): pid=3D434 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'op=3DPAM:setcred grantors=3D=
? acct=3D"nathan" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? te=
rminal=3D? res=3Dfailed'
[   22.918709] audit: type=3D1006 audit(1625508125.714:51): pid=3D434 uid=
=3D0 old-auid=3D4294967295 auid=3D1000 tty=3D(none) old-ses=3D4294967295 se=
s=3D2 res=3D1
[   22.918795] audit: type=3D1300 audit(1625508125.714:51): arch=3Dc000003e=
 syscall=3D1 success=3Dyes exit=3D4 a0=3D9 a1=3D7fff13327970 a2=3D4 a3=3D3e=
8 items=3D0 ppid=3D1 pid=3D434 auid=3D1000 uid=3D0 gid=3D0 euid=3D0 suid=3D=
0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D2 comm=3D"(syste=
md)" exe=3D"/usr/lib/systemd/systemd" key=3D(null)
[   30.400687] kauditd_printk_skb: 11 callbacks suppressed
[   30.400699] audit: type=3D1100 audit(1625508133.194:60): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:authentication grantors=3Dpam_f=
aillock,pam_permit,pam_faillock acct=3D"nathan" exe=3D"/usr/bin/doas" hostn=
ame=3Dhp-4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.405376] audit: type=3D1101 audit(1625508133.201:61): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,=
pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/bin/doas" hostname=3Dhp-430=
0G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.406114] audit: type=3D1110 audit(1625508133.201:62): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:setcred grantors=3Dpam_faillock=
,pam_permit,pam_faillock acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-=
4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.407411] audit: type=3D1105 audit(1625508133.204:63): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_open grantors=3Dpam_lim=
its,pam_unix,pam_permit acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-4=
300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.473080] audit: type=3D1106 audit(1625508133.268:64): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_close grantors=3Dpam_li=
mits,pam_unix,pam_permit acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-=
4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   30.474043] audit: type=3D1104 audit(1625508133.271:65): pid=3D601 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:setcred grantors=3Dpam_faillock=
,pam_permit,pam_faillock acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-=
4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   32.679545] audit: type=3D1101 audit(1625508135.474:66): pid=3D646 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,=
pam_permit,pam_time acct=3D"nathan" exe=3D"/usr/bin/doas" hostname=3Dhp-430=
0G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   32.680133] audit: type=3D1110 audit(1625508135.474:67): pid=3D646 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:setcred grantors=3Dpam_faillock=
,pam_permit,pam_env,pam_faillock acct=3D"root" exe=3D"/usr/bin/doas" hostna=
me=3Dhp-4300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'
[   32.681346] audit: type=3D1105 audit(1625508135.478:68): pid=3D646 uid=
=3D1000 auid=3D1000 ses=3D1 msg=3D'op=3DPAM:session_open grantors=3Dpam_lim=
its,pam_unix,pam_permit acct=3D"root" exe=3D"/usr/bin/doas" hostname=3Dhp-4=
300G addr=3D? terminal=3Dpts/0 res=3Dsuccess'

--/SG/dXypw7vuCiM3--
