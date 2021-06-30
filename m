Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BDB3B7B62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 03:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GF3zX2Vtxz309Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 11:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZrP1J2sp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZrP1J2sp; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GF3yv1bZkz2yNR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 11:43:35 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 208FA61D81;
 Wed, 30 Jun 2021 01:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625017411;
 bh=amEkbjsSwgY3M1jUxO/2NmeBoHeUq3+mIk6P11gk4Og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZrP1J2spjwRkKn5ofA3edFhF7yqkdeJUlkVykRTK5gRjacWiRF9eziQMCJ66JvddE
 xxby/GvXcv7sUEIQqwGmQskTCIuHRtV6yp4SqeoxbU+XKeMa/PPXMw2ZYZWlXwqrPn
 18zNNvdovs7mX4SlJVXwmtUcPwdXxw6F21SK2cgGq1syXqg+2vrXj5cUoKzY0EYQkw
 S1+uSmJNPxHigRHFwFOgWU/2keF8Gd4WQ5Ju2MQHn1+qC0peGRZSWjtaNhcEGYqA1x
 T+yCPUbaw9EY4103T5H0gMQUrS/a+uG4ZuW5g9FchOGBOCI/ew/A6uOTjFezef5blV
 aEPAuoG9gN7tg==
Date: Tue, 29 Jun 2021 18:43:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="QbssCZQk3Ov6WW0W"
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-7-tientzu@chromium.org>
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
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, quic_qiancai@quicinc.com,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--QbssCZQk3Ov6WW0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 24, 2021 at 11:55:20PM +0800, Claire Chang wrote:
> Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> use it to determine whether to bounce the data or not. This will be
> useful later to allow for different pools.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

This patch as commit af452ec1b1a3 ("swiotlb: Use is_swiotlb_force_bounce
for swiotlb data bouncing") causes my Ryzen 3 4300G system to fail to
get to an X session consistently (although not every single time),
presumably due to a crash in the AMDGPU driver that I see in dmesg.

I have attached logs at af452ec1b1a3 and f127c9556a8e and I am happy
to provide any further information, debug, or test patches as necessary.

Cheers,
Nathan

--QbssCZQk3Ov6WW0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="af452ec1b1a3.log"

-- Journal begins at Mon 2021-06-28 09:22:12 MST, ends at Tue 2021-06-29 18:29:54 MST. --
Jun 29 18:28:41 hp-4300G kernel: Linux version 5.12.0-rc3-00025-gaf452ec1b1a3 (nathan@archlinux-ax161) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.50.20210627) #1 SMP PREEMPT Tue Jun 29 18:25:35 MST 2021
Jun 29 18:28:41 hp-4300G kernel: Command line: initrd=\amd-ucode.img initrd=\initramfs-linux-next-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp irqpoll
Jun 29 18:28:41 hp-4300G kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Jun 29 18:28:41 hp-4300G kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Jun 29 18:28:41 hp-4300G kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Jun 29 18:28:41 hp-4300G kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Jun 29 18:28:41 hp-4300G kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
Jun 29 18:28:41 hp-4300G kernel: BIOS-provided physical RAM map:
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x0000000000100000-0x0000000009c0ffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x0000000009c10000-0x0000000009ffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x000000000a200000-0x000000000a20cfff] ACPI NVS
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x000000000a20d000-0x000000000affffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x000000000b020000-0x00000000b838ffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000b8390000-0x00000000b86c5fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI data
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI NVS
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000b8a15000-0x00000000badfefff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000badff000-0x00000000bbffffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000bc000000-0x00000000bdffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000bf000000-0x00000000bfffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fd200000-0x00000000fd2fffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fd600000-0x00000000fd6fffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usable
Jun 29 18:28:41 hp-4300G kernel: BIOS-e820: [mem 0x000000021f380000-0x000000023fffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: intel_pstate: HWP disabled
Jun 29 18:28:41 hp-4300G kernel: NX (Execute Disable) protection: active
Jun 29 18:28:41 hp-4300G kernel: e820: update [mem 0xb4c66018-0xb4c73457] usable ==> usable
Jun 29 18:28:41 hp-4300G kernel: e820: update [mem 0xb4c66018-0xb4c73457] usable ==> usable
Jun 29 18:28:41 hp-4300G kernel: extended physical RAM map:
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x0000000000100000-0x0000000009c0ffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x0000000009c10000-0x0000000009ffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x000000000a200000-0x000000000a20cfff] ACPI NVS
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x000000000a20d000-0x000000000affffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x000000000b000000-0x000000000b01ffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x000000000b020000-0x00000000b4c66017] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000b4c66018-0x00000000b4c73457] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000b4c73458-0x00000000b838ffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000b8390000-0x00000000b86c5fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI data
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI NVS
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000b8a15000-0x00000000badfefff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000badff000-0x00000000bbffffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000bc000000-0x00000000bdffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000bf000000-0x00000000bfffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fd200000-0x00000000fd2fffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fd600000-0x00000000fd6fffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x0000000100000000-0x000000021f37ffff] usable
Jun 29 18:28:41 hp-4300G kernel: reserve setup_data: [mem 0x000000021f380000-0x000000023fffffff] reserved
Jun 29 18:28:41 hp-4300G kernel: efi: EFI v2.70 by American Megatrends
Jun 29 18:28:41 hp-4300G kernel: efi: ACPI=0xb8721000 ACPI 2.0=0xb8721014 TPMFinalLog=0xb89c8000 SMBIOS=0xbac0f000 SMBIOS 3.0=0xbac0e000 MEMATTR=0xb5184018 ESRT=0xb6dde918 RNG=0xbac3e998 TPMEventLog=0xb5185018 
Jun 29 18:28:41 hp-4300G kernel: efi: seeding entropy pool
Jun 29 18:28:41 hp-4300G kernel: SMBIOS 3.3.0 present.
Jun 29 18:28:41 hp-4300G kernel: DMI: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
Jun 29 18:28:41 hp-4300G kernel: tsc: Fast TSC calibration using PIT
Jun 29 18:28:41 hp-4300G kernel: tsc: Detected 3793.033 MHz processor
Jun 29 18:28:41 hp-4300G kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Jun 29 18:28:41 hp-4300G kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
Jun 29 18:28:41 hp-4300G kernel: last_pfn = 0x21f380 max_arch_pfn = 0x400000000
Jun 29 18:28:41 hp-4300G kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
Jun 29 18:28:41 hp-4300G kernel: e820: update [mem 0xc0000000-0xffffffff] usable ==> reserved
Jun 29 18:28:41 hp-4300G kernel: last_pfn = 0xbc000 max_arch_pfn = 0x400000000
Jun 29 18:28:41 hp-4300G kernel: esrt: Reserving ESRT space from 0x00000000b6dde918 to 0x00000000b6dde950.
Jun 29 18:28:41 hp-4300G kernel: e820: update [mem 0xb6dde000-0xb6ddefff] usable ==> reserved
Jun 29 18:28:41 hp-4300G kernel: check: Scanning 1 areas for low memory corruption
Jun 29 18:28:41 hp-4300G kernel: Using GB pages for direct mapping
Jun 29 18:28:41 hp-4300G kernel: Secure boot disabled
Jun 29 18:28:41 hp-4300G kernel: RAMDISK: [mem 0x7f859000-0x7fff5fff]
Jun 29 18:28:41 hp-4300G kernel: ACPI: Early table checksum verification disabled
Jun 29 18:28:41 hp-4300G kernel: ACPI: RSDP 0x00000000B8721014 000024 (v02 HPQOEM)
Jun 29 18:28:41 hp-4300G kernel: ACPI: XSDT 0x00000000B8720728 0000EC (v01 HPQOEM SLIC-CPC 01072009 AMI  01000013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: FACP 0x00000000B870F000 000114 (v06 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: DSDT 0x00000000B86FE000 01050C (v02 HPQOEM SLIC-CPC 01072009 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: FACS 0x00000000B89F8000 000040
Jun 29 18:28:41 hp-4300G kernel: ACPI: MSDM 0x00000000B871F000 000055 (v03 HPQOEM SLIC-CPC 01072009 AMI  01000013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B871E000 000050 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: IVRS 0x00000000B871D000 0000D0 (v02 HPQOEM SLIC-CPC 00000001 AMD  00000000)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B8715000 007229 (v02 HPQOEM SLIC-CPC 00000002 MSFT 04000000)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B8711000 003BA1 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B8710000 000094 (v02 HPQOEM SLIC-CPC 01072009 AMI  01072009)
Jun 29 18:28:41 hp-4300G kernel: ACPI: FIDT 0x00000000B86FD000 00009C (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: MCFG 0x00000000B86FC000 00003C (v01 HPQOEM SLIC-CPC 01072009 MSFT 00010013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: HPET 0x00000000B86FB000 000038 (v01 HPQOEM SLIC-CPC 01072009 AMI  00000005)
Jun 29 18:28:41 hp-4300G kernel: ACPI: VFCT 0x00000000B86ED000 00D484 (v01 HPQOEM SLIC-CPC 00000001 AMD  31504F47)
Jun 29 18:28:41 hp-4300G kernel: ACPI: BGRT 0x00000000B86EC000 000038 (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: TPM2 0x00000000B86EB000 00004C (v04 HPQOEM SLIC-CPC 00000001 AMI  00000000)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86E9000 001CE4 (v02 HPQOEM SLIC-CPC 00000001 AMD  00000001)
Jun 29 18:28:41 hp-4300G kernel: ACPI: CRAT 0x00000000B86E8000 0007E8 (v01 HPQOEM SLIC-CPC 00000001 AMD  00000001)
Jun 29 18:28:41 hp-4300G kernel: ACPI: CDIT 0x00000000B86E7000 000029 (v01 HPQOEM SLIC-CPC 00000001 AMD  00000001)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86E6000 000D37 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86E4000 0010A5 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86E0000 00333E (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86DF000 0000BF (v01 HPQOEM SLIC-CPC 00001000 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: WSMT 0x00000000B86DE000 000028 (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: APIC 0x00000000B86DD000 00015E (v03 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86DC000 000517 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: SSDT 0x00000000B86DA000 0010AF (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:28:41 hp-4300G kernel: ACPI: FPDT 0x00000000B86D9000 000044 (v01 HPQOEM SLIC-CPC 01072009 AMI  01000013)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Local APIC address 0xfee00000
Jun 29 18:28:41 hp-4300G kernel: No NUMA configuration found
Jun 29 18:28:41 hp-4300G kernel: Faking a node at [mem 0x0000000000000000-0x000000021f37ffff]
Jun 29 18:28:41 hp-4300G kernel: NODE_DATA(0) allocated [mem 0x21f37c000-0x21f37ffff]
Jun 29 18:28:41 hp-4300G kernel: Zone ranges:
Jun 29 18:28:41 hp-4300G kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Jun 29 18:28:41 hp-4300G kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Jun 29 18:28:41 hp-4300G kernel:   Normal   [mem 0x0000000100000000-0x000000021f37ffff]
Jun 29 18:28:41 hp-4300G kernel:   Device   empty
Jun 29 18:28:41 hp-4300G kernel: Movable zone start for each node
Jun 29 18:28:41 hp-4300G kernel: Early memory node ranges
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x0000000000001000-0x000000000009ffff]
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x0000000000100000-0x0000000009c0ffff]
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x000000000a20d000-0x000000000affffff]
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x000000000b020000-0x00000000b838ffff]
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x00000000badff000-0x00000000bbffffff]
Jun 29 18:28:41 hp-4300G kernel:   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
Jun 29 18:28:41 hp-4300G kernel: Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37ffff]
Jun 29 18:28:41 hp-4300G kernel: On node 0 totalpages: 1934483
Jun 29 18:28:41 hp-4300G kernel:   DMA zone: 64 pages used for memmap
Jun 29 18:28:41 hp-4300G kernel:   DMA zone: 26 pages reserved
Jun 29 18:28:41 hp-4300G kernel:   DMA zone: 3999 pages, LIFO batch:0
Jun 29 18:28:41 hp-4300G kernel:   DMA zone: 28769 pages in unavailable ranges
Jun 29 18:28:41 hp-4300G kernel:   DMA32 zone: 11782 pages used for memmap
Jun 29 18:28:41 hp-4300G kernel:   DMA32 zone: 754036 pages, LIFO batch:63
Jun 29 18:28:41 hp-4300G kernel:   DMA32 zone: 28300 pages in unavailable ranges
Jun 29 18:28:41 hp-4300G kernel:   Normal zone: 18382 pages used for memmap
Jun 29 18:28:41 hp-4300G kernel:   Normal zone: 1176448 pages, LIFO batch:63
Jun 29 18:28:41 hp-4300G kernel:   Normal zone: 3200 pages in unavailable ranges
Jun 29 18:28:41 hp-4300G kernel: ACPI: PM-Timer IO Port: 0x808
Jun 29 18:28:41 hp-4300G kernel: ACPI: Local APIC address 0xfee00000
Jun 29 18:28:41 hp-4300G kernel: ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
Jun 29 18:28:41 hp-4300G kernel: IOAPIC[0]: apic_id 9, version 33, address 0xfec00000, GSI 0-23
Jun 29 18:28:41 hp-4300G kernel: IOAPIC[1]: apic_id 10, version 33, address 0xfec01000, GSI 24-55
Jun 29 18:28:41 hp-4300G kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Jun 29 18:28:41 hp-4300G kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
Jun 29 18:28:41 hp-4300G kernel: ACPI: IRQ0 used by override.
Jun 29 18:28:41 hp-4300G kernel: ACPI: IRQ9 used by override.
Jun 29 18:28:41 hp-4300G kernel: Using ACPI (MADT) for SMP configuration information
Jun 29 18:28:41 hp-4300G kernel: ACPI: HPET id: 0x10228201 base: 0xfed00000
Jun 29 18:28:41 hp-4300G kernel: e820: update [mem 0xb5158000-0xb517ffff] usable ==> reserved
Jun 29 18:28:41 hp-4300G kernel: smpboot: Allowing 32 CPUs, 24 hotplug CPUs
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x09c10000-0x09ffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a20cfff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb4c66000-0xb4c66fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb4c73000-0xb4c73fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb5158000-0xb517ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb6dde000-0xb6ddefff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb8390000-0xb86c5fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb86c6000-0xb8721fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb8722000-0xb8a14fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb8a15000-0xbadfefff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xbc000000-0xbdffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xbe000000-0xbeffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xbf000000-0xbfffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xefffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfd1fffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd200000-0xfd2fffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd300000-0xfd5fffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd600000-0xfd6fffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd700000-0xfe9fffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0xfeffffff]
Jun 29 18:28:41 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
Jun 29 18:28:41 hp-4300G kernel: [mem 0xc0000000-0xefffffff] available for PCI devices
Jun 29 18:28:41 hp-4300G kernel: Booting paravirtualized kernel on bare hardware
Jun 29 18:28:41 hp-4300G kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
Jun 29 18:28:41 hp-4300G kernel: setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:32 nr_node_ids:1
Jun 29 18:28:41 hp-4300G kernel: percpu: Embedded 56 pages/cpu s192512 r8192 d28672 u262144
Jun 29 18:28:41 hp-4300G kernel: pcpu-alloc: s192512 r8192 d28672 u262144 alloc=1*2097152
Jun 29 18:28:41 hp-4300G kernel: pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
Jun 29 18:28:41 hp-4300G kernel: pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 29 30 31 
Jun 29 18:28:41 hp-4300G kernel: Built 1 zonelists, mobility grouping on.  Total pages: 1904229
Jun 29 18:28:41 hp-4300G kernel: Policy zone: Normal
Jun 29 18:28:41 hp-4300G kernel: Kernel command line: initrd=\amd-ucode.img initrd=\initramfs-linux-next-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp irqpoll
Jun 29 18:28:41 hp-4300G kernel: Misrouted IRQ fixup and polling support enabled
Jun 29 18:28:41 hp-4300G kernel: This may significantly impact system performance
Jun 29 18:28:41 hp-4300G kernel: printk: log_buf_len individual max cpu contribution: 4096 bytes
Jun 29 18:28:41 hp-4300G kernel: printk: log_buf_len total cpu_extra contributions: 126976 bytes
Jun 29 18:28:41 hp-4300G kernel: printk: log_buf_len min size: 131072 bytes
Jun 29 18:28:41 hp-4300G kernel: printk: log_buf_len: 262144 bytes
Jun 29 18:28:41 hp-4300G kernel: printk: early log buf free: 114232(87%)
Jun 29 18:28:41 hp-4300G kernel: Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: mem auto-init: stack:off, heap alloc:on, heap free:off
Jun 29 18:28:41 hp-4300G kernel: Memory: 7409704K/7737932K available (14344K kernel code, 2035K rwdata, 4856K rodata, 1648K init, 4340K bss, 327968K reserved, 0K cma-reserved)
Jun 29 18:28:41 hp-4300G kernel: random: get_random_u64 called from __kmem_cache_create+0x2a/0x560 with crng_init=0
Jun 29 18:28:41 hp-4300G kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
Jun 29 18:28:41 hp-4300G kernel: ftrace: allocating 41885 entries in 164 pages
Jun 29 18:28:41 hp-4300G kernel: ftrace: allocated 164 pages with 3 groups
Jun 29 18:28:41 hp-4300G kernel: rcu: Preemptible hierarchical RCU implementation.
Jun 29 18:28:41 hp-4300G kernel: rcu:         RCU dyntick-idle grace-period acceleration is enabled.
Jun 29 18:28:41 hp-4300G kernel: rcu:         RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=32.
Jun 29 18:28:41 hp-4300G kernel: rcu:         RCU priority boosting: priority 1 delay 500 ms.
Jun 29 18:28:41 hp-4300G kernel:         Trampoline variant of Tasks RCU enabled.
Jun 29 18:28:41 hp-4300G kernel:         Rude variant of Tasks RCU enabled.
Jun 29 18:28:41 hp-4300G kernel:         Tracing variant of Tasks RCU enabled.
Jun 29 18:28:41 hp-4300G kernel: rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
Jun 29 18:28:41 hp-4300G kernel: rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
Jun 29 18:28:41 hp-4300G kernel: NR_IRQS: 20736, nr_irqs: 1224, preallocated irqs: 16
Jun 29 18:28:41 hp-4300G kernel: Console: colour dummy device 80x25
Jun 29 18:28:41 hp-4300G kernel: printk: console [tty0] enabled
Jun 29 18:28:41 hp-4300G kernel: ACPI: Core revision 20210105
Jun 29 18:28:41 hp-4300G kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
Jun 29 18:28:41 hp-4300G kernel: APIC: Switch to symmetric I/O mode setup
Jun 29 18:28:41 hp-4300G kernel: Switched APIC routing to physical flat.
Jun 29 18:28:41 hp-4300G kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Jun 29 18:28:41 hp-4300G kernel: clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6d59455212d, max_idle_ns: 881590509164 ns
Jun 29 18:28:41 hp-4300G kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 7589.15 BogoMIPS (lpj=12643443)
Jun 29 18:28:41 hp-4300G kernel: pid_max: default: 32768 minimum: 301
Jun 29 18:28:41 hp-4300G kernel: LSM: Security Framework initializing
Jun 29 18:28:41 hp-4300G kernel: Yama: becoming mindful.
Jun 29 18:28:41 hp-4300G kernel: Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: x86/cpu: User Mode Instruction Prevention (UMIP) activated
Jun 29 18:28:41 hp-4300G kernel: LVT offset 1 assigned for vector 0xf9
Jun 29 18:28:41 hp-4300G kernel: LVT offset 2 assigned for vector 0xf4
Jun 29 18:28:41 hp-4300G kernel: Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
Jun 29 18:28:41 hp-4300G kernel: Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
Jun 29 18:28:41 hp-4300G kernel: Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Jun 29 18:28:41 hp-4300G kernel: Spectre V2 : Mitigation: Full AMD retpoline
Jun 29 18:28:41 hp-4300G kernel: Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Jun 29 18:28:41 hp-4300G kernel: Spectre V2 : Enabling Restricted Speculation for firmware calls
Jun 29 18:28:41 hp-4300G kernel: Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Jun 29 18:28:41 hp-4300G kernel: Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
Jun 29 18:28:41 hp-4300G kernel: Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
Jun 29 18:28:41 hp-4300G kernel: Freeing SMP alternatives memory: 36K
Jun 29 18:28:41 hp-4300G kernel: smpboot: CPU0: AMD Ryzen 3 4300G with Radeon Graphics (family: 0x17, model: 0x60, stepping: 0x1)
Jun 29 18:28:41 hp-4300G kernel: Performance Events: Fam17h+ core perfctr, AMD PMU driver.
Jun 29 18:28:41 hp-4300G kernel: ... version:                0
Jun 29 18:28:41 hp-4300G kernel: ... bit width:              48
Jun 29 18:28:41 hp-4300G kernel: ... generic registers:      6
Jun 29 18:28:41 hp-4300G kernel: ... value mask:             0000ffffffffffff
Jun 29 18:28:41 hp-4300G kernel: ... max period:             00007fffffffffff
Jun 29 18:28:41 hp-4300G kernel: ... fixed-purpose events:   0
Jun 29 18:28:41 hp-4300G kernel: ... event mask:             000000000000003f
Jun 29 18:28:41 hp-4300G kernel: rcu: Hierarchical SRCU implementation.
Jun 29 18:28:41 hp-4300G kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Jun 29 18:28:41 hp-4300G kernel: smp: Bringing up secondary CPUs ...
Jun 29 18:28:41 hp-4300G kernel: x86: Booting SMP configuration:
Jun 29 18:28:41 hp-4300G kernel: .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
Jun 29 18:28:41 hp-4300G kernel: smp: Brought up 1 node, 8 CPUs
Jun 29 18:28:41 hp-4300G kernel: smpboot: Max logical packages: 4
Jun 29 18:28:41 hp-4300G kernel: smpboot: Total of 8 processors activated (60712.21 BogoMIPS)
Jun 29 18:28:41 hp-4300G kernel: devtmpfs: initialized
Jun 29 18:28:41 hp-4300G kernel: x86/mm: Memory block size: 128MB
Jun 29 18:28:41 hp-4300G kernel: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20cfff] (53248 bytes)
Jun 29 18:28:41 hp-4300G kernel: PM: Registering ACPI NVS region [mem 0xb8722000-0xb8a14fff] (3092480 bytes)
Jun 29 18:28:41 hp-4300G kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
Jun 29 18:28:41 hp-4300G kernel: futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: pinctrl core: initialized pinctrl subsystem
Jun 29 18:28:41 hp-4300G kernel: PM: RTC time: 01:28:37, date: 2021-06-30
Jun 29 18:28:41 hp-4300G kernel: NET: Registered protocol family 16
Jun 29 18:28:41 hp-4300G kernel: DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
Jun 29 18:28:41 hp-4300G kernel: DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
Jun 29 18:28:41 hp-4300G kernel: DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
Jun 29 18:28:41 hp-4300G kernel: audit: initializing netlink subsys (disabled)
Jun 29 18:28:41 hp-4300G kernel: audit: type=2000 audit(1625016517.143:1): state=initialized audit_enabled=0 res=1
Jun 29 18:28:41 hp-4300G kernel: thermal_sys: Registered thermal governor 'fair_share'
Jun 29 18:28:41 hp-4300G kernel: thermal_sys: Registered thermal governor 'bang_bang'
Jun 29 18:28:41 hp-4300G kernel: thermal_sys: Registered thermal governor 'step_wise'
Jun 29 18:28:41 hp-4300G kernel: thermal_sys: Registered thermal governor 'user_space'
Jun 29 18:28:41 hp-4300G kernel: thermal_sys: Registered thermal governor 'power_allocator'
Jun 29 18:28:41 hp-4300G kernel: cpuidle: using governor ladder
Jun 29 18:28:41 hp-4300G kernel: cpuidle: using governor menu
Jun 29 18:28:41 hp-4300G kernel: ACPI: bus type PCI registered
Jun 29 18:28:41 hp-4300G kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Jun 29 18:28:41 hp-4300G kernel: PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
Jun 29 18:28:41 hp-4300G kernel: PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
Jun 29 18:28:41 hp-4300G kernel: PCI: Using configuration type 1 for base access
Jun 29 18:28:41 hp-4300G kernel: Kprobes globally optimized
Jun 29 18:28:41 hp-4300G kernel: HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
Jun 29 18:28:41 hp-4300G kernel: HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(Module Device)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(Processor Device)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(Processor Aggregator Device)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(Linux-Dell-Video)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
Jun 29 18:28:41 hp-4300G kernel: ACPI: 12 ACPI AML tables successfully acquired and loaded
Jun 29 18:28:41 hp-4300G kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: EC started
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: interrupt blocked
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle transactions
Jun 29 18:28:41 hp-4300G kernel: ACPI: Interpreter enabled
Jun 29 18:28:41 hp-4300G kernel: ACPI: (supports S0 S3 S4 S5)
Jun 29 18:28:41 hp-4300G kernel: ACPI: Using IOAPIC for interrupt routing
Jun 29 18:28:41 hp-4300G kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Jun 29 18:28:41 hp-4300G kernel: ACPI: Enabled 4 GPEs in block 00 to 1F
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Jun 29 18:28:41 hp-4300G kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
Jun 29 18:28:41 hp-4300G kernel: acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR DPC]
Jun 29 18:28:41 hp-4300G kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
Jun 29 18:28:41 hp-4300G kernel: acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-7f] only partially covers this bridge
Jun 29 18:28:41 hp-4300G kernel: PCI host bridge to bus 0000:00
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfec2ffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.0: [1022:43d1] type 00 class 0x0c0330
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.0: reg 0x10: [mem 0xfcda0000-0xfcda7fff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.1: [1022:43c8] type 00 class 0x010601
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.1: reg 0x24: [mem 0xfcd80000-0xfcd9ffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.1: reg 0x30: [mem 0xfcd00000-0xfcd7ffff pref]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.1: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.1: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2: [1022:43c6] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1: PCI bridge to [bus 01-0a]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:00.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:00.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:00.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:01.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:01.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:01.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:02.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:02.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:02.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:03.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:03.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:03.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:04.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:04.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:04.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:05.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:05.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:05.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0: PME# supported from D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2: PCI bridge to [bus 02-0a]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:01.0: PCI bridge to [bus 04]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:02.0: PCI bridge to [bus 05]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:03.0: PCI bridge to [bus 06]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:04.0: PCI bridge to [bus 07]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:05.0: PCI bridge to [bus 08]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:09:00.0: [10ec:c821] type 00 class 0x028000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:09:00.0: reg 0x10: [io  0xe000-0xe0ff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:09:00.0: reg 0x18: [mem 0xfcc00000-0xfcc0ffff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:09:00.0: supports D1 D2
Jun 29 18:28:41 hp-4300G kernel: pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0: PCI bridge to [bus 09]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: [10ec:8168] type 00 class 0x020000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: reg 0x10: [io  0xd000-0xd0ff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: reg 0x18: [mem 0xfcb04000-0xfcb04fff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: reg 0x20: [mem 0xfcb00000-0xfcb03fff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: supports D1 D2
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0: PCI bridge to [bus 0a]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0b:00.0: [1c5c:1339] type 00 class 0x010802
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0b:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0b:00.0: supports D1
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0b:00.0: PME# supported from D0 D1 D3hot
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0b:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2: PCI bridge to [bus 0b]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: [1002:1636] type 00 class 0x030000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit pref]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: reg 0x18: [mem 0xe0000000-0xe01fffff 64bit pref]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: reg 0x20: [io  0xf000-0xf0ff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: reg 0x24: [mem 0xfca00000-0xfca7ffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: BAR 0: assigned to efifb
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: PME# supported from D1 D2 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.1: [1002:1637] type 00 class 0x040300
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.1: reg 0x10: [mem 0xfca88000-0xfca8bfff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.1: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.1: PME# supported from D1 D2 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.2: [1022:15df] type 00 class 0x108000
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.2: reg 0x18: [mem 0xfc900000-0xfc9fffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.2: reg 0x24: [mem 0xfca8c000-0xfca8dfff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.2: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.3: [1022:1639] type 00 class 0x0c0330
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.3: reg 0x10: [mem 0xfc800000-0xfc8fffff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.3: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.4: [1022:1639] type 00 class 0x0c0330
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.4: reg 0x10: [mem 0xfc700000-0xfc7fffff 64bit]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.4: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.6: [1022:15e3] type 00 class 0x040300
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.6: reg 0x10: [mem 0xfca80000-0xfca87fff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.6: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.6: PME# supported from D0 D3hot D3cold
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1: PCI bridge to [bus 0c]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff 64bit pref]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.0: [1022:7901] type 00 class 0x010601
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.0: reg 0x24: [mem 0xfce01000-0xfce017ff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.0: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.2 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.1: [1022:7901] type 00 class 0x010601
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.1: reg 0x24: [mem 0xfce00000-0xfce007ff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.1: enabling Extended Tags
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2: PCI bridge to [bus 0d]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: interrupt unblocked
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: event unblocked
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
Jun 29 18:28:41 hp-4300G kernel: ACPI: EC: GPE=0x3
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization complete
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions and events
Jun 29 18:28:41 hp-4300G kernel: iommu: Default domain type: Translated 
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: vgaarb: bridge control possible
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: vgaarb: setting as boot device
Jun 29 18:28:41 hp-4300G kernel: vgaarb: loaded
Jun 29 18:28:41 hp-4300G kernel: SCSI subsystem initialized
Jun 29 18:28:41 hp-4300G kernel: libata version 3.00 loaded.
Jun 29 18:28:41 hp-4300G kernel: ACPI: bus type USB registered
Jun 29 18:28:41 hp-4300G kernel: usbcore: registered new interface driver usbfs
Jun 29 18:28:41 hp-4300G kernel: usbcore: registered new interface driver hub
Jun 29 18:28:41 hp-4300G kernel: usbcore: registered new device driver usb
Jun 29 18:28:41 hp-4300G kernel: pps_core: LinuxPPS API ver. 1 registered
Jun 29 18:28:41 hp-4300G kernel: pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Jun 29 18:28:41 hp-4300G kernel: PTP clock support registered
Jun 29 18:28:41 hp-4300G kernel: EDAC MC: Ver: 3.0.0
Jun 29 18:28:41 hp-4300G kernel: Registered efivars operations
Jun 29 18:28:41 hp-4300G kernel: NetLabel: Initializing
Jun 29 18:28:41 hp-4300G kernel: NetLabel:  domain hash size = 128
Jun 29 18:28:41 hp-4300G kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
Jun 29 18:28:41 hp-4300G kernel: NetLabel:  unlabeled traffic allowed by default
Jun 29 18:28:41 hp-4300G kernel: PCI: Using ACPI for IRQ routing
Jun 29 18:28:41 hp-4300G kernel: PCI: pci_cache_line_size set to 64 bytes
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0x09c10000-0x0bffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb4c66018-0xb7ffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb5158000-0xb7ffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb6dde000-0xb7ffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb8390000-0xbbffffff]
Jun 29 18:28:41 hp-4300G kernel: e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
Jun 29 18:28:41 hp-4300G kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Jun 29 18:28:41 hp-4300G kernel: hpet0: 3 comparators, 32-bit 14.318180 MHz counter
Jun 29 18:28:41 hp-4300G kernel: clocksource: Switched to clocksource tsc-early
Jun 29 18:28:41 hp-4300G kernel: VFS: Disk quotas dquot_6.6.0
Jun 29 18:28:41 hp-4300G kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Jun 29 18:28:41 hp-4300G kernel: pnp: PnP ACPI init
Jun 29 18:28:41 hp-4300G kernel: system 00:00: [mem 0xf0000000-0xf7ffffff] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
Jun 29 18:28:41 hp-4300G kernel: system 00:01: [mem 0x220000000-0x23fffffff window] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Jun 29 18:28:41 hp-4300G kernel: pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a00-0x0a0f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a10-0x0a1f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a20-0x0a2f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a30-0x0a3f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a40-0x0a4f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a50-0x0a5f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a60-0x0a6f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a70-0x0a7f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a80-0x0a8f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0a90-0x0b8e] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0aa0-0x0aaf] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0ab0-0x0abf] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0ac0-0x0acf] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: [io  0x0ad0-0x0adf] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x04d0-0x04d1] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x040b] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x04d6] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0c00-0x0c01] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0c14] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0c50-0x0c51] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0c52] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0c6c] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0c6f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0cd0-0x0cd1] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0cd2-0x0cd3] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0cd4-0x0cd5] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0cd6-0x0cd7] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0cd8-0x0cdf] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0800-0x089f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0b00-0x0b0f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0b20-0x0b3f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0900-0x090f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [io  0x0910-0x091f] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xfec00000-0xfec00fff] could not be reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xfec01000-0xfec01fff] could not be reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: [mem 0xff000000-0xffffffff] has been reserved
Jun 29 18:28:41 hp-4300G kernel: system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
Jun 29 18:28:41 hp-4300G kernel: pnp: PnP ACPI: found 5 devices
Jun 29 18:28:41 hp-4300G kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Jun 29 18:28:41 hp-4300G kernel: NET: Registered protocol family 2
Jun 29 18:28:41 hp-4300G kernel: tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: TCP: Hash tables configured (established 65536 bind 65536)
Jun 29 18:28:41 hp-4300G kernel: MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
Jun 29 18:28:41 hp-4300G kernel: NET: Registered protocol family 1
Jun 29 18:28:41 hp-4300G kernel: NET: Registered protocol family 44
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:01.0: PCI bridge to [bus 04]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:02.0: PCI bridge to [bus 05]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:03.0: PCI bridge to [bus 06]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:04.0: PCI bridge to [bus 07]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:05.0: PCI bridge to [bus 08]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0: PCI bridge to [bus 09]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0: PCI bridge to [bus 0a]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2: PCI bridge to [bus 02-0a]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1: PCI bridge to [bus 01-0a]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2: PCI bridge to [bus 0b]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1: PCI bridge to [bus 0c]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff 64bit pref]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2: PCI bridge to [bus 0d]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 10 [mem 0xc0000000-0xfec2ffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff window]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:01: resource 0 [io  0xd000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:01: resource 1 [mem 0xfcb00000-0xfcdfffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:02: resource 1 [mem 0xfcb00000-0xfccfffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:09: resource 0 [io  0xe000-0xefff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:09: resource 1 [mem 0xfcc00000-0xfccfffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0a: resource 0 [io  0xd000-0xdfff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0a: resource 1 [mem 0xfcb00000-0xfcbfffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0b: resource 1 [mem 0xfcf00000-0xfcffffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0c: resource 0 [io  0xf000-0xffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0c: resource 1 [mem 0xfc700000-0xfcafffff]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0c: resource 2 [mem 0xd0000000-0xe01fffff 64bit pref]
Jun 29 18:28:41 hp-4300G kernel: pci_bus 0000:0d: resource 1 [mem 0xfce00000-0xfcefffff]
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.1: D0 power state depends on 0000:0c:00.0
Jun 29 18:28:41 hp-4300G kernel: PCI: CLS 64 bytes, default 64
Jun 29 18:28:41 hp-4300G kernel: Trying to unpack rootfs image as initramfs...
Jun 29 18:28:41 hp-4300G kernel: Freeing initrd memory: 7796K
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.2: AMD-Vi: Unable to read/write to IOMMU perf counter.
Jun 29 18:28:41 hp-4300G kernel: fbcon: Taking over console
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.2: can't derive routing for PCI INT A
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.2: PCI INT A: not connected
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:01.0: Adding to iommu group 0
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.0: Adding to iommu group 1
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.1: Adding to iommu group 2
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:02.2: Adding to iommu group 3
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.0: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.1: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:08.2: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:14.0: Adding to iommu group 5
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:14.3: Adding to iommu group 5
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.0: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.1: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.2: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.3: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.4: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.5: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.6: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:18.7: Adding to iommu group 6
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.1: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:01:00.2: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:00.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:01.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:02.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:03.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:04.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:05.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:06.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:02:07.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:09:00.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0a:00.0: Adding to iommu group 7
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0b:00.0: Adding to iommu group 8
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.0: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.1: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.2: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.3: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.4: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0c:00.6: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.0: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:0d:00.1: Adding to iommu group 4
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
Jun 29 18:28:41 hp-4300G kernel: pci 0000:00:00.2: AMD-Vi: Extended features (0x206d73ef22254ade):
Jun 29 18:28:41 hp-4300G kernel:  PPR X2APIC NX GT IA GA PC GA_vAPIC
Jun 29 18:28:41 hp-4300G kernel: AMD-Vi: Interrupt remapping enabled
Jun 29 18:28:41 hp-4300G kernel: AMD-Vi: Virtual APIC enabled
Jun 29 18:28:41 hp-4300G kernel: AMD-Vi: X2APIC enabled
Jun 29 18:28:41 hp-4300G kernel: AMD-Vi: Lazy IO/TLB flushing enabled
Jun 29 18:28:41 hp-4300G kernel: amd_uncore: 4  amd_df counters detected
Jun 29 18:28:41 hp-4300G kernel: amd_uncore: 6  amd_l3 counters detected
Jun 29 18:28:41 hp-4300G kernel: LVT offset 0 assigned for vector 0x400
Jun 29 18:28:41 hp-4300G kernel: perf: AMD IBS detected (0x000003ff)
Jun 29 18:28:41 hp-4300G kernel: check: Scanning for low memory corruption every 60 seconds
Jun 29 18:28:41 hp-4300G kernel: Initialise system trusted keyrings
Jun 29 18:28:41 hp-4300G kernel: Key type blacklist registered
Jun 29 18:28:41 hp-4300G kernel: workingset: timestamp_bits=41 max_order=21 bucket_order=0
Jun 29 18:28:41 hp-4300G kernel: zbud: loaded
Jun 29 18:28:41 hp-4300G kernel: Key type asymmetric registered
Jun 29 18:28:41 hp-4300G kernel: Asymmetric key parser 'x509' registered
Jun 29 18:28:41 hp-4300G kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
Jun 29 18:28:41 hp-4300G kernel: io scheduler mq-deadline registered
Jun 29 18:28:41 hp-4300G kernel: io scheduler kyber registered
Jun 29 18:28:41 hp-4300G kernel: io scheduler bfq registered
Jun 29 18:28:41 hp-4300G kernel: pcieport 0000:00:02.1: PME: Signaling with IRQ 26
Jun 29 18:28:41 hp-4300G kernel: pcieport 0000:00:02.2: PME: Signaling with IRQ 27
Jun 29 18:28:41 hp-4300G kernel: pcieport 0000:00:08.1: PME: Signaling with IRQ 28
Jun 29 18:28:41 hp-4300G kernel: pcieport 0000:00:08.2: PME: Signaling with IRQ 29
Jun 29 18:28:41 hp-4300G kernel: shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Jun 29 18:28:41 hp-4300G kernel: efifb: probing for efifb
Jun 29 18:28:41 hp-4300G kernel: efifb: framebuffer at 0xd0000000, using 3072k, total 3072k
Jun 29 18:28:41 hp-4300G kernel: efifb: mode is 1024x768x32, linelength=4096, pages=1
Jun 29 18:28:41 hp-4300G kernel: efifb: scrolling: redraw
Jun 29 18:28:41 hp-4300G kernel: efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
Jun 29 18:28:41 hp-4300G kernel: Console: switching to colour frame buffer device 128x48
Jun 29 18:28:41 hp-4300G kernel: fb0: EFI VGA frame buffer device
Jun 29 18:28:41 hp-4300G kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
Jun 29 18:28:41 hp-4300G kernel: ACPI: button: Power Button [PWRB]
Jun 29 18:28:41 hp-4300G kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
Jun 29 18:28:41 hp-4300G kernel: ACPI: button: Power Button [PWRF]
Jun 29 18:28:41 hp-4300G kernel: Monitor-Mwait will be used to enter C-1 state
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C000: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C002: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C004: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C006: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C001: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C003: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C005: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: ACPI: \_PR_.C007: Found 3 idle states
Jun 29 18:28:41 hp-4300G kernel: thermal LNXTHERM:00: registered as thermal_zone0
Jun 29 18:28:41 hp-4300G kernel: ACPI: thermal: Thermal Zone [HPTZ] (30 C)
Jun 29 18:28:41 hp-4300G kernel: Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
Jun 29 18:28:41 hp-4300G kernel: Non-volatile memory driver v1.3
Jun 29 18:28:41 hp-4300G kernel: AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
Jun 29 18:28:41 hp-4300G kernel: nvme nvme0: pci function 0000:0b:00.0
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:01:00.1: version 3.0
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:01:00.1: enabling device (0100 -> 0102)
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
Jun 29 18:28:41 hp-4300G kernel: scsi host0: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host1: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host2: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host3: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host4: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host5: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host6: ahci
Jun 29 18:28:41 hp-4300G kernel: scsi host7: ahci
Jun 29 18:28:41 hp-4300G kernel: ata1: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80100 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata2: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80180 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata3: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80200 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata4: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80280 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata5: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80300 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata6: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80380 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata7: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80400 irq 44
Jun 29 18:28:41 hp-4300G kernel: ata8: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80480 irq 44
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:0d:00.0: enabling device (0100 -> 0102)
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:0d:00.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:0d:00.0: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
Jun 29 18:28:41 hp-4300G kernel: scsi host8: ahci
Jun 29 18:28:41 hp-4300G kernel: ata9: SATA max UDMA/133 abar m2048@0xfce01000 port 0xfce01100 irq 46
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:0d:00.1: enabling device (0100 -> 0102)
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:0d:00.1: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
Jun 29 18:28:41 hp-4300G kernel: ahci 0000:0d:00.1: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
Jun 29 18:28:41 hp-4300G kernel: scsi host9: ahci
Jun 29 18:28:41 hp-4300G kernel: ata10: SATA max UDMA/133 abar m2048@0xfce00000 port 0xfce00100 irq 48
Jun 29 18:28:41 hp-4300G kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Jun 29 18:28:41 hp-4300G kernel: ehci-pci: EHCI PCI platform driver
Jun 29 18:28:41 hp-4300G kernel: ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
Jun 29 18:28:41 hp-4300G kernel: ohci-pci: OHCI PCI platform driver
Jun 29 18:28:41 hp-4300G kernel: uhci_hcd: USB Universal Host Controller Interface driver
Jun 29 18:28:41 hp-4300G kernel: usbcore: registered new interface driver usbserial_generic
Jun 29 18:28:41 hp-4300G kernel: usbserial: USB Serial support registered for generic
Jun 29 18:28:41 hp-4300G kernel: rtc_cmos 00:02: RTC can wake from S4
Jun 29 18:28:41 hp-4300G kernel: rtc_cmos 00:02: registered as rtc0
Jun 29 18:28:41 hp-4300G kernel: rtc_cmos 00:02: setting system clock to 2021-06-30T01:28:38 UTC (1625016518)
Jun 29 18:28:41 hp-4300G kernel: rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
Jun 29 18:28:41 hp-4300G kernel: ledtrig-cpu: registered to indicate activity on CPUs
Jun 29 18:28:41 hp-4300G kernel: hid: raw HID events driver (C) Jiri Kosina
Jun 29 18:28:41 hp-4300G kernel: drop_monitor: Initializing network drop monitor service
Jun 29 18:28:41 hp-4300G kernel: Initializing XFRM netlink socket
Jun 29 18:28:41 hp-4300G kernel: NET: Registered protocol family 10
Jun 29 18:28:41 hp-4300G kernel: nvme nvme0: missing or invalid SUBNQN field.
Jun 29 18:28:41 hp-4300G kernel: Segment Routing with IPv6
Jun 29 18:28:41 hp-4300G kernel: RPL Segment Routing with IPv6
Jun 29 18:28:41 hp-4300G kernel: NET: Registered protocol family 17
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU0: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU1: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU2: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU3: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU4: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU5: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU6: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: CPU7: patch_level=0x08600106
Jun 29 18:28:41 hp-4300G kernel: microcode: Microcode Update Driver: v2.2.
Jun 29 18:28:41 hp-4300G kernel: resctrl: L3 allocation detected
Jun 29 18:28:41 hp-4300G kernel: resctrl: L3DATA allocation detected
Jun 29 18:28:41 hp-4300G kernel: resctrl: L3CODE allocation detected
Jun 29 18:28:41 hp-4300G kernel: resctrl: MB allocation detected
Jun 29 18:28:41 hp-4300G kernel: resctrl: L3 monitoring detected
Jun 29 18:28:41 hp-4300G kernel: IPI shorthand broadcast: enabled
Jun 29 18:28:41 hp-4300G kernel: sched_clock: Marking stable (480878644, 416905)->(484173894, -2878345)
Jun 29 18:28:41 hp-4300G kernel: registered taskstats version 1
Jun 29 18:28:41 hp-4300G kernel: Loading compiled-in X.509 certificates
Jun 29 18:28:41 hp-4300G kernel: Loaded X.509 cert 'Build time autogenerated kernel key: 344a5c3e232222f5edf962ab341f037cc1f1c148'
Jun 29 18:28:41 hp-4300G kernel: nvme nvme0: 16/0/0 default/read/poll queues
Jun 29 18:28:41 hp-4300G kernel: zswap: loaded using pool lz4/z3fold
Jun 29 18:28:41 hp-4300G kernel: Key type ._fscrypt registered
Jun 29 18:28:41 hp-4300G kernel: Key type .fscrypt registered
Jun 29 18:28:41 hp-4300G kernel: Key type fscrypt-provisioning registered
Jun 29 18:28:41 hp-4300G kernel: PM:   Magic number: 9:284:459
Jun 29 18:28:41 hp-4300G kernel: RAS: Correctable Errors collector initialized.
Jun 29 18:28:41 hp-4300G kernel:  nvme0n1: p1 p2
Jun 29 18:28:41 hp-4300G kernel: ata1: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata9: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata10: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata2: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata3: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: tsc: Refined TSC clocksource calibration: 3819.679 MHz
Jun 29 18:28:41 hp-4300G kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6e1dec388f1, max_idle_ns: 881590444886 ns
Jun 29 18:28:41 hp-4300G kernel: clocksource: Switched to clocksource tsc
Jun 29 18:28:41 hp-4300G kernel: ata4: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata5: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata6: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata7: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: ata8: SATA link down (SStatus 0 SControl 300)
Jun 29 18:28:41 hp-4300G kernel: Freeing unused decrypted memory: 2036K
Jun 29 18:28:41 hp-4300G kernel: Freeing unused kernel image (initmem) memory: 1648K
Jun 29 18:28:41 hp-4300G kernel: Write protecting the kernel read-only data: 22528k
Jun 29 18:28:41 hp-4300G kernel: Freeing unused kernel image (text/rodata gap) memory: 2036K
Jun 29 18:28:41 hp-4300G kernel: Freeing unused kernel image (rodata/data gap) memory: 1288K
Jun 29 18:28:41 hp-4300G kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
Jun 29 18:28:41 hp-4300G kernel: rodata_test: all tests were successful
Jun 29 18:28:41 hp-4300G kernel: Run /init as init process
Jun 29 18:28:41 hp-4300G kernel:   with arguments:
Jun 29 18:28:41 hp-4300G kernel:     /init
Jun 29 18:28:41 hp-4300G kernel:   with environment:
Jun 29 18:28:41 hp-4300G kernel:     HOME=/
Jun 29 18:28:41 hp-4300G kernel:     TERM=linux
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:01:00.0: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000410
Jun 29 18:28:41 hp-4300G kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
Jun 29 18:28:41 hp-4300G kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:28:41 hp-4300G kernel: usb usb1: Product: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: usb usb1: Manufacturer: Linux 5.12.0-rc3-00025-gaf452ec1b1a3 xhci-hcd
Jun 29 18:28:41 hp-4300G kernel: usb usb1: SerialNumber: 0000:01:00.0
Jun 29 18:28:41 hp-4300G kernel: hub 1-0:1.0: USB hub found
Jun 29 18:28:41 hp-4300G kernel: hub 1-0:1.0: 14 ports detected
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:01:00.0: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperSpeed
Jun 29 18:28:41 hp-4300G kernel: usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
Jun 29 18:28:41 hp-4300G kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
Jun 29 18:28:41 hp-4300G kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:28:41 hp-4300G kernel: usb usb2: Product: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: usb usb2: Manufacturer: Linux 5.12.0-rc3-00025-gaf452ec1b1a3 xhci-hcd
Jun 29 18:28:41 hp-4300G kernel: usb usb2: SerialNumber: 0000:01:00.0
Jun 29 18:28:41 hp-4300G kernel: hub 2-0:1.0: USB hub found
Jun 29 18:28:41 hp-4300G kernel: hub 2-0:1.0: 8 ports detected
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.3: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus number 3
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.3: hcc params 0x0268ffe5 hci version 0x110 quirks 0x0000000000000410
Jun 29 18:28:41 hp-4300G kernel: usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
Jun 29 18:28:41 hp-4300G kernel: usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:28:41 hp-4300G kernel: usb usb3: Product: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: usb usb3: Manufacturer: Linux 5.12.0-rc3-00025-gaf452ec1b1a3 xhci-hcd
Jun 29 18:28:41 hp-4300G kernel: usb usb3: SerialNumber: 0000:0c:00.3
Jun 29 18:28:41 hp-4300G kernel: hub 3-0:1.0: USB hub found
Jun 29 18:28:41 hp-4300G kernel: hub 3-0:1.0: 4 ports detected
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.3: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus number 4
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.3: Host supports USB 3.1 Enhanced SuperSpeed
Jun 29 18:28:41 hp-4300G kernel: usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
Jun 29 18:28:41 hp-4300G kernel: usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
Jun 29 18:28:41 hp-4300G kernel: usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:28:41 hp-4300G kernel: usb usb4: Product: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: usb usb4: Manufacturer: Linux 5.12.0-rc3-00025-gaf452ec1b1a3 xhci-hcd
Jun 29 18:28:41 hp-4300G kernel: usb usb4: SerialNumber: 0000:0c:00.3
Jun 29 18:28:41 hp-4300G kernel: hub 4-0:1.0: USB hub found
Jun 29 18:28:41 hp-4300G kernel: hub 4-0:1.0: 2 ports detected
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.4: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus number 5
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.4: hcc params 0x0268ffe5 hci version 0x110 quirks 0x0000000000000410
Jun 29 18:28:41 hp-4300G kernel: usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
Jun 29 18:28:41 hp-4300G kernel: usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:28:41 hp-4300G kernel: usb usb5: Product: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: usb usb5: Manufacturer: Linux 5.12.0-rc3-00025-gaf452ec1b1a3 xhci-hcd
Jun 29 18:28:41 hp-4300G kernel: usb usb5: SerialNumber: 0000:0c:00.4
Jun 29 18:28:41 hp-4300G kernel: hub 5-0:1.0: USB hub found
Jun 29 18:28:41 hp-4300G kernel: hub 5-0:1.0: 4 ports detected
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.4: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus number 6
Jun 29 18:28:41 hp-4300G kernel: xhci_hcd 0000:0c:00.4: Host supports USB 3.1 Enhanced SuperSpeed
Jun 29 18:28:41 hp-4300G kernel: usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
Jun 29 18:28:41 hp-4300G kernel: usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
Jun 29 18:28:41 hp-4300G kernel: usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:28:41 hp-4300G kernel: usb usb6: Product: xHCI Host Controller
Jun 29 18:28:41 hp-4300G kernel: usb usb6: Manufacturer: Linux 5.12.0-rc3-00025-gaf452ec1b1a3 xhci-hcd
Jun 29 18:28:41 hp-4300G kernel: usb usb6: SerialNumber: 0000:0c:00.4
Jun 29 18:28:41 hp-4300G kernel: hub 6-0:1.0: USB hub found
Jun 29 18:28:41 hp-4300G kernel: hub 6-0:1.0: 2 ports detected
Jun 29 18:28:41 hp-4300G kernel: SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
Jun 29 18:28:41 hp-4300G kernel: XFS (nvme0n1p2): Mounting V5 Filesystem
Jun 29 18:28:41 hp-4300G kernel: XFS (nvme0n1p2): Ending clean mount
Jun 29 18:28:41 hp-4300G kernel: xfs filesystem being mounted at /new_root supports timestamps until 2038 (0x7fffffff)
Jun 29 18:28:41 hp-4300G kernel: random: fast init done
Jun 29 18:28:41 hp-4300G kernel: random: crng init done
Jun 29 18:28:41 hp-4300G systemd[1]: Successfully credited entropy passed from boot loader.
Jun 29 18:28:41 hp-4300G systemd[1]: systemd 248.3-2-arch running in system mode. (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
Jun 29 18:28:41 hp-4300G systemd[1]: Detected architecture x86-64.
Jun 29 18:28:41 hp-4300G systemd[1]: Hostname set to <hp-4300G>.
Jun 29 18:28:41 hp-4300G systemd-fstab-generator[247]: Mount point  is not a valid path, ignoring.
Jun 29 18:28:41 hp-4300G systemd-fstab-generator[247]: Mount point  is not a valid path, ignoring.
Jun 29 18:28:41 hp-4300G systemd[1]: Queued start job for default target Graphical Interface.
Jun 29 18:28:41 hp-4300G systemd[1]: Created slice system-getty.slice.
Jun 29 18:28:41 hp-4300G systemd[1]: Created slice system-modprobe.slice.
Jun 29 18:28:41 hp-4300G systemd[1]: Created slice User and Session Slice.
Jun 29 18:28:41 hp-4300G systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
Jun 29 18:28:41 hp-4300G systemd[1]: Started Forward Password Requests to Wall Directory Watch.
Jun 29 18:28:41 hp-4300G systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Local Encrypted Volumes.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Login Prompts.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Paths.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Remote File Systems.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Slices.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Swap.
Jun 29 18:28:41 hp-4300G systemd[1]: Reached target Local Verity Integrity Protected Volumes.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on Device-mapper event daemon FIFOs.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on Process Core Dump Socket.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on Journal Audit Socket.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on Journal Socket (/dev/log).
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on Journal Socket.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on Network Service Netlink Socket.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on udev Control Socket.
Jun 29 18:28:41 hp-4300G systemd[1]: Listening on udev Kernel Socket.
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting Huge Pages File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting POSIX Message Queue File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting Kernel Debug File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting Kernel Trace File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Create list of static device nodes for the current kernel...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Load Kernel Module configfs...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Load Kernel Module drm...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Load Kernel Module fuse...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Set Up Additional Binary Formats...
Jun 29 18:28:41 hp-4300G systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
Jun 29 18:28:41 hp-4300G kernel: Linux agpgart interface v0.103
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Journal Service...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Load Kernel Modules...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Remount Root and Kernel File Systems...
Jun 29 18:28:41 hp-4300G systemd[1]: Condition check resulted in Repartition Root Disk being skipped.
Jun 29 18:28:41 hp-4300G kernel: fuse: init (API version 7.33)
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Coldplug All udev Devices...
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted Huge Pages File System.
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted POSIX Message Queue File System.
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted Kernel Debug File System.
Jun 29 18:28:41 hp-4300G kernel: Asymmetric key parser 'pkcs8' registered
Jun 29 18:28:41 hp-4300G kernel: XFS: attr2 mount option is deprecated.
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted Kernel Trace File System.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Create list of static device nodes for the current kernel.
Jun 29 18:28:41 hp-4300G kernel: xfs filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
Jun 29 18:28:41 hp-4300G kernel: audit: type=1130 audit(1625016521.439:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G systemd[1]: modprobe@configfs.service: Deactivated successfully.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Load Kernel Module configfs.
Jun 29 18:28:41 hp-4300G kernel: audit: type=1130 audit(1625016521.439:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@configfs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G kernel: audit: type=1131 audit(1625016521.439:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@configfs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G systemd[1]: modprobe@fuse.service: Deactivated successfully.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Load Kernel Module fuse.
Jun 29 18:28:41 hp-4300G kernel: audit: type=1130 audit(1625016521.443:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G kernel: audit: type=1131 audit(1625016521.443:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@fuse comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Load Kernel Modules.
Jun 29 18:28:41 hp-4300G kernel: audit: type=1130 audit(1625016521.443:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Remount Root and Kernel File Systems.
Jun 29 18:28:41 hp-4300G kernel: audit: type=1130 audit(1625016521.443:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G systemd[1]: proc-sys-fs-binfmt_misc.automount: Got automount request for /proc/sys/fs/binfmt_misc, triggered by 263 (systemd-binfmt)
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting Arbitrary Executable File Formats File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting FUSE Control File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Mounting Kernel Configuration File System...
Jun 29 18:28:41 hp-4300G systemd[1]: Condition check resulted in First Boot Wizard being skipped.
Jun 29 18:28:41 hp-4300G systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Load/Save Random Seed...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Apply Kernel Variables...
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Create System Users...
Jun 29 18:28:41 hp-4300G systemd[1]: modprobe@drm.service: Deactivated successfully.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Load Kernel Module drm.
Jun 29 18:28:41 hp-4300G kernel: audit: type=1130 audit(1625016521.453:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G kernel: audit: type=1131 audit(1625016521.453:10): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted Arbitrary Executable File Formats File System.
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted FUSE Control File System.
Jun 29 18:28:41 hp-4300G systemd[1]: Mounted Kernel Configuration File System.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Load/Save Random Seed.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Set Up Additional Binary Formats.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Apply Kernel Variables.
Jun 29 18:28:41 hp-4300G systemd[1]: Condition check resulted in First Boot Complete being skipped.
Jun 29 18:28:41 hp-4300G systemd[1]: Finished Create System Users.
Jun 29 18:28:41 hp-4300G systemd[1]: Starting Create Static Device Nodes in /dev...
Jun 29 18:28:41 hp-4300G systemd[1]: Started Journal Service.
Jun 29 18:28:41 hp-4300G kernel: usb 1-11: new full-speed USB device number 2 using xhci_hcd
Jun 29 18:28:41 hp-4300G kernel: acpi_cpufreq: overriding BIOS provided _PSD data
Jun 29 18:28:41 hp-4300G kernel: acpi-tad ACPI000E:00: Missing _PRW
Jun 29 18:28:41 hp-4300G kernel: ACPI: video: Video Device [VGA1] (multi-head: yes  rom: no  post: no)
Jun 29 18:28:41 hp-4300G kernel: acpi device:1e: registered as cooling_device8
Jun 29 18:28:41 hp-4300G kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1d/LNXVIDEO:01/input/input2
Jun 29 18:28:41 hp-4300G kernel: acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
Jun 29 18:28:41 hp-4300G kernel: piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
Jun 29 18:28:41 hp-4300G kernel: piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
Jun 29 18:28:41 hp-4300G kernel: piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
Jun 29 18:28:41 hp-4300G kernel: ccp 0000:0c:00.2: enabling device (0100 -> 0102)
Jun 29 18:28:41 hp-4300G kernel: ccp 0000:0c:00.2: ccp: unable to access the device: you might be running a broken BIOS.
Jun 29 18:28:41 hp-4300G kernel: input: PC Speaker as /devices/platform/pcspkr/input/input3
Jun 29 18:28:41 hp-4300G kernel: ccp 0000:0c:00.2: tee enabled
Jun 29 18:28:41 hp-4300G kernel: ccp 0000:0c:00.2: psp enabled
Jun 29 18:28:41 hp-4300G kernel: cfg80211: Loading compiled-in X.509 certificates for regulatory database
Jun 29 18:28:41 hp-4300G kernel: FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
Jun 29 18:28:41 hp-4300G kernel: cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
Jun 29 18:28:41 hp-4300G kernel: platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
Jun 29 18:28:41 hp-4300G kernel: cfg80211: failed to load regulatory.db
Jun 29 18:28:41 hp-4300G kernel: usb 1-11: New USB device found, idVendor=046d, idProduct=c534, bcdDevice=29.01
Jun 29 18:28:41 hp-4300G kernel: usb 1-11: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Jun 29 18:28:41 hp-4300G kernel: usb 1-11: Product: USB Receiver
Jun 29 18:28:41 hp-4300G kernel: usb 1-11: Manufacturer: Logitech
Jun 29 18:28:41 hp-4300G kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Jun 29 18:28:41 hp-4300G kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
Jun 29 18:28:41 hp-4300G kernel: sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
Jun 29 18:28:41 hp-4300G kernel: RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
Jun 29 18:28:41 hp-4300G kernel: RAPL PMU: hw unit of domain package 2^-16 Joules
Jun 29 18:28:41 hp-4300G kernel: cryptd: max_cpu_qlen set to 1000
Jun 29 18:28:41 hp-4300G kernel: AVX2 version of gcm_enc/dec engaged.
Jun 29 18:28:41 hp-4300G kernel: AES CTR mode by8 optimization enabled
Jun 29 18:28:41 hp-4300G kernel: libphy: r8169: probed
Jun 29 18:28:41 hp-4300G kernel: r8169 0000:0a:00.0 eth0: RTL8168h/8111h, 00:68:eb:ad:98:43, XID 541, IRQ 91
Jun 29 18:28:41 hp-4300G kernel: r8169 0000:0a:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
Jun 29 18:28:41 hp-4300G kernel: snd_hda_intel 0000:0c:00.1: enabling device (0100 -> 0102)
Jun 29 18:28:41 hp-4300G kernel: snd_hda_intel 0000:0c:00.1: Handle vga_switcheroo audio client
Jun 29 18:28:41 hp-4300G kernel: snd_hda_intel 0000:0c:00.6: enabling device (0100 -> 0102)
Jun 29 18:28:42 hp-4300G kernel: r8169 0000:0a:00.0 enp10s0: renamed from eth0
Jun 29 18:28:42 hp-4300G kernel: usb 1-12: new full-speed USB device number 3 using xhci_hcd
Jun 29 18:28:42 hp-4300G kernel: rtw_8821ce 0000:09:00.0: enabling device (0100 -> 0103)
Jun 29 18:28:42 hp-4300G kernel: rtw_8821ce 0000:09:00.0: Firmware version 24.8.0, H2C version 12
Jun 29 18:28:42 hp-4300G kernel: input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:0c:00.1/sound/card0/input5
Jun 29 18:28:42 hp-4300G kernel: input: HP WMI hotkeys as /devices/virtual/input/input4
Jun 29 18:28:42 hp-4300G kernel: Generic FE-GE Realtek PHY r8169-a00:00: attached PHY driver (mii_bus:phy_addr=r8169-a00:00, irq=MAC)
Jun 29 18:28:42 hp-4300G kernel: [drm] amdgpu kernel modesetting enabled.
Jun 29 18:28:42 hp-4300G kernel: Virtual CRAT table created for CPU
Jun 29 18:28:42 hp-4300G kernel: amdgpu: Topology: Add CPU node
Jun 29 18:28:42 hp-4300G kernel: checking generic (d0000000 300000) vs hw (d0000000 10000000)
Jun 29 18:28:42 hp-4300G kernel: fb0: switching to amdgpudrmfb from EFI VGA
Jun 29 18:28:42 hp-4300G kernel: Console: switching to colour dummy device 80x25
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: enabling device (0106 -> 0107)
Jun 29 18:28:42 hp-4300G kernel: [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x103C:0x87D6 0xCA).
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
Jun 29 18:28:42 hp-4300G kernel: [drm] register mmio base: 0xFCA00000
Jun 29 18:28:42 hp-4300G kernel: [drm] register mmio size: 524288
Jun 29 18:28:42 hp-4300G kernel: [drm] PCIE atomic ops is not supported
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC671: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    inputs:
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
Jun 29 18:28:42 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:      Line=0x1b
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 0 <soc15_common>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 1 <gmc_v9_0>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 2 <vega10_ih>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 3 <psp>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 4 <smu>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 5 <gfx_v9_0>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 6 <sdma_v4_0>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 7 <dm>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 8 <vcn_v2_0>
Jun 29 18:28:42 hp-4300G kernel: [drm] add ip block number 9 <jpeg_v2_0>
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: Fetched VBIOS from VFCT
Jun 29 18:28:42 hp-4300G kernel: amdgpu: ATOM BIOS: 113-RENOIR-026
Jun 29 18:28:42 hp-4300G kernel: [drm] VCN decode is enabled in VM mode
Jun 29 18:28:42 hp-4300G kernel: [drm] VCN encode is enabled in VM mode
Jun 29 18:28:42 hp-4300G kernel: [drm] JPEG decode is enabled in VM mode
Jun 29 18:28:42 hp-4300G kernel: [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
Jun 29 18:28:42 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
Jun 29 18:28:42 hp-4300G kernel: [drm] Detected VRAM RAM=512M, BAR=512M
Jun 29 18:28:42 hp-4300G kernel: [drm] RAM width 64bits DDR4
Jun 29 18:28:42 hp-4300G kernel: [TTM] Zone  kernel: Available graphics memory: 3750314 KiB
Jun 29 18:28:42 hp-4300G kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
Jun 29 18:28:42 hp-4300G kernel: [drm] amdgpu: 512M of VRAM memory ready
Jun 29 18:28:42 hp-4300G kernel: [drm] amdgpu: 3072M of GTT memory ready.
Jun 29 18:28:42 hp-4300G kernel: BUG: unable to handle page fault for address: 00000000003a8290
Jun 29 18:28:42 hp-4300G kernel: #PF: supervisor write access in kernel mode
Jun 29 18:28:42 hp-4300G kernel: #PF: error_code(0x0002) - not-present page
Jun 29 18:28:42 hp-4300G kernel: PGD 0 P4D 0 
Jun 29 18:28:42 hp-4300G kernel: Oops: 0002 [#1] PREEMPT SMP NOPTI
Jun 29 18:28:42 hp-4300G kernel: CPU: 2 PID: 296 Comm: systemd-udevd Not tainted 5.12.0-rc3-00025-gaf452ec1b1a3 #1
Jun 29 18:28:42 hp-4300G kernel: Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
Jun 29 18:28:42 hp-4300G kernel: RIP: 0010:native_queued_spin_lock_slowpath+0x1c2/0x200
Jun 29 18:28:42 hp-4300G kernel: Code: ff ff f3 90 8b 02 85 c0 74 ee eb f6 c1 ef 12 83 e0 03 83 ef 01 48 c1 e0 05 48 63 ff 48 05 80 d5 02 00 48 03 04 fd 00 69 e3 a9 <48> 89 08 8b 41 08 85 c0 75 09 f3 90 8b 41 08 85 c0 74 f7 48 8b 39
Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
Jun 29 18:28:42 hp-4300G kernel: Call Trace:
Jun 29 18:28:42 hp-4300G kernel:  _raw_spin_lock_irqsave+0x39/0x50
Jun 29 18:28:42 hp-4300G kernel:  swiotlb_tbl_map_single+0x12b/0x4c0
Jun 29 18:28:42 hp-4300G kernel:  ? sysvec_call_function+0xb/0x90
Jun 29 18:28:42 hp-4300G kernel:  ? asm_sysvec_call_function+0x12/0x20
Jun 29 18:28:42 hp-4300G kernel:  swiotlb_map+0x5d/0x260
Jun 29 18:28:42 hp-4300G kernel:  dma_map_page_attrs+0x151/0x220
Jun 29 18:28:42 hp-4300G kernel:  amdgpu_gart_init+0x43/0x90 [amdgpu]
Jun 29 18:28:42 hp-4300G kernel:  gmc_v9_0_sw_init+0x51c/0x560 [amdgpu]
Jun 29 18:28:42 hp-4300G kernel:  amdgpu_device_init.cold+0x120e/0x19d7 [amdgpu]
Jun 29 18:28:42 hp-4300G kernel:  ? pci_conf1_read+0x9b/0xf0
Jun 29 18:28:42 hp-4300G kernel:  ? pci_bus_read_config_word+0x49/0x70
Jun 29 18:28:42 hp-4300G kernel:  amdgpu_driver_load_kms+0x65/0x260 [amdgpu]
Jun 29 18:28:42 hp-4300G kernel:  amdgpu_pci_probe+0x11f/0x1b0 [amdgpu]
Jun 29 18:28:42 hp-4300G kernel:  local_pci_probe+0x42/0x80
Jun 29 18:28:42 hp-4300G kernel:  ? pci_match_device+0xd7/0x110
Jun 29 18:28:42 hp-4300G kernel:  pci_device_probe+0xfa/0x1b0
Jun 29 18:28:42 hp-4300G kernel:  really_probe+0xf2/0x440
Jun 29 18:28:42 hp-4300G kernel:  driver_probe_device+0xe1/0x150
Jun 29 18:28:42 hp-4300G kernel:  device_driver_attach+0xa1/0xb0
Jun 29 18:28:42 hp-4300G kernel:  __driver_attach+0x8a/0x150
Jun 29 18:28:42 hp-4300G kernel:  ? device_driver_attach+0xb0/0xb0
Jun 29 18:28:42 hp-4300G kernel:  ? device_driver_attach+0xb0/0xb0
Jun 29 18:28:42 hp-4300G kernel:  bus_for_each_dev+0x78/0xc0
Jun 29 18:28:42 hp-4300G kernel:  bus_add_driver+0x12b/0x1e0
Jun 29 18:28:42 hp-4300G kernel:  driver_register+0x8f/0xe0
Jun 29 18:28:42 hp-4300G kernel:  ? 0xffffffffc1c42000
Jun 29 18:28:42 hp-4300G kernel:  do_one_initcall+0x44/0x200
Jun 29 18:28:42 hp-4300G kernel:  ? do_init_module+0x23/0x260
Jun 29 18:28:42 hp-4300G kernel:  ? kmem_cache_alloc_trace+0x161/0x2d0
Jun 29 18:28:42 hp-4300G kernel:  do_init_module+0x5c/0x260
Jun 29 18:28:42 hp-4300G kernel:  __do_sys_finit_module+0xb1/0x110
Jun 29 18:28:42 hp-4300G kernel:  do_syscall_64+0x33/0x40
Jun 29 18:28:42 hp-4300G kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
Jun 29 18:28:42 hp-4300G kernel: RIP: 0033:0x7f1f892be18d
Jun 29 18:28:42 hp-4300G kernel: Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
Jun 29 18:28:42 hp-4300G kernel: RSP: 002b:00007ffd0caa5d58 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
Jun 29 18:28:42 hp-4300G kernel: RAX: ffffffffffffffda RBX: 000055f12c90e9c0 RCX: 00007f1f892be18d
Jun 29 18:28:42 hp-4300G kernel: RDX: 0000000000000000 RSI: 00007f1f8941ba9d RDI: 0000000000000018
Jun 29 18:28:42 hp-4300G kernel: RBP: 0000000000020000 R08: 0000000000000000 R09: 00007f1f8964e5ea
Jun 29 18:28:42 hp-4300G kernel: R10: 0000000000000018 R11: 0000000000000246 R12: 00007f1f8941ba9d
Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000000000 R14: 000055f12c90ac20 R15: 000055f12c90e9c0
Jun 29 18:28:42 hp-4300G kernel: Modules linked in: kvm_amd(+) snd_hda_codec_realtek(+) amdgpu(+) rtw88_8821ce(+) snd_hda_codec_generic hp_wmi wmi_bmof sparse_keymap fjes(-) ledtrig_audio snd_hda_codec_hdmi pcc_cpufreq(-) kvm rtw88_8821c gpu_sched i2c_algo_bit drm_ttm_helper rtw88_pci snd_hda_intel ttm irqbypass snd_intel_dspcfg crct10dif_pclmul drm_kms_helper rtw88_core crc32_pclmul snd_intel_sdw_acpi ghash_clmulni_intel snd_hda_codec cec mac80211 snd_hda_core syscopyarea snd_hwdep aesni_intel snd_pcm crypto_simd snd_timer cryptd sysfillrect sp5100_tco rapl snd r8169 sysimgblt vfat pcspkr i2c_piix4 k10temp fat ccp soundcore fb_sys_fops cfg80211 realtek mdio_devres libphy rfkill libarc4 wmi video tpm_crb tpm_tis gpio_amdpt gpio_generic tpm_tis_core tpm mac_hid rng_core pinctrl_amd acpi_tad acpi_cpufreq drm pkcs8_key_parser fuse agpgart bpf_preload ip_tables x_tables xfs libcrc32c crc32c_generic crc32c_intel xhci_pci xhci_pci_renesas
Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290
Jun 29 18:28:42 hp-4300G kernel: ---[ end trace f6c00070cdcfa658 ]---
Jun 29 18:28:42 hp-4300G kernel: RIP: 0010:native_queued_spin_lock_slowpath+0x1c2/0x200
Jun 29 18:28:42 hp-4300G kernel: Code: ff ff f3 90 8b 02 85 c0 74 ee eb f6 c1 ef 12 83 e0 03 83 ef 01 48 c1 e0 05 48 63 ff 48 05 80 d5 02 00 48 03 04 fd 00 69 e3 a9 <48> 89 08 8b 41 08 85 c0 75 09 f3 90 8b 41 08 85 c0 74 f7 48 8b 39
Jun 29 18:28:42 hp-4300G kernel: RSP: 0018:ffffadb4013db9e8 EFLAGS: 00010006
Jun 29 18:28:42 hp-4300G kernel: RAX: 00000000003a8290 RBX: 0000000000000000 RCX: ffff8900572ad580
Jun 29 18:28:42 hp-4300G kernel: RDX: ffff89005653f024 RSI: 00000000000c0000 RDI: 0000000000001d17
Jun 29 18:28:42 hp-4300G kernel: RBP: 000000000a20d000 R08: 00000000000c0000 R09: 0000000000000000
Jun 29 18:28:42 hp-4300G kernel: R10: 000000000a20d000 R11: ffff89005653f000 R12: 0000000000000212
Jun 29 18:28:42 hp-4300G kernel: R13: 0000000000001000 R14: 0000000000000002 R15: 0000000000200000
Jun 29 18:28:42 hp-4300G kernel: FS:  00007f1f8898ea40(0000) GS:ffff890057280000(0000) knlGS:0000000000000000
Jun 29 18:28:42 hp-4300G kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 29 18:28:42 hp-4300G kernel: CR2: 00000000003a8290 CR3: 00000001020d0000 CR4: 0000000000350ee0
Jun 29 18:28:42 hp-4300G kernel: note: systemd-udevd[296] exited with preempt_count 1
Jun 29 18:28:42 hp-4300G kernel: kvm: Nested Virtualization enabled
Jun 29 18:28:42 hp-4300G kernel: SVM: kvm: Nested Paging enabled
Jun 29 18:28:42 hp-4300G kernel: SVM: Virtual VMLOAD VMSAVE supported
Jun 29 18:28:42 hp-4300G kernel: SVM: Virtual GIF supported
Jun 29 18:28:42 hp-4300G kernel: input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input6
Jun 29 18:28:42 hp-4300G kernel: input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input7
Jun 29 18:28:42 hp-4300G kernel: input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input8
Jun 29 18:28:42 hp-4300G kernel: input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input9
Jun 29 18:28:42 hp-4300G kernel: MCE: In-kernel MCE decoding enabled.
Jun 29 18:28:42 hp-4300G kernel: r8169 0000:0a:00.0 enp10s0: Link is Down
Jun 29 18:28:42 hp-4300G kernel: intel_rapl_common: Found RAPL domain package
Jun 29 18:28:42 hp-4300G kernel: intel_rapl_common: Found RAPL domain core
Jun 29 18:28:42 hp-4300G kernel: usb 1-12: New USB device found, idVendor=0bda, idProduct=b00a, bcdDevice= 1.10
Jun 29 18:28:42 hp-4300G kernel: usb 1-12: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Jun 29 18:28:42 hp-4300G kernel: usb 1-12: Product: Bluetooth Radio 
Jun 29 18:28:42 hp-4300G kernel: usb 1-12: Manufacturer: Realtek 
Jun 29 18:28:42 hp-4300G kernel: usb 1-12: SerialNumber: 00e04c000001
Jun 29 18:28:42 hp-4300G kernel: input: Logitech USB Receiver as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.0/0003:046D:C534.0001/input/input10
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: Core ver 2.22
Jun 29 18:28:42 hp-4300G kernel: NET: Registered protocol family 31
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: HCI device and connection manager initialized
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: HCI socket layer initialized
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: L2CAP socket layer initialized
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: SCO socket layer initialized
Jun 29 18:28:42 hp-4300G kernel: usbcore: registered new interface driver btusb
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: hci0: RTL: examining hci_ver=08 hci_rev=000c lmp_ver=08 lmp_subver=8821
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: hci0: RTL: rom_version status=0 version=1
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_fw.bin
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_config.bin
Jun 29 18:28:42 hp-4300G kernel: Bluetooth: hci0: RTL: cfg_sz 10, total sz 31990
Jun 29 18:28:42 hp-4300G kernel: hid-generic 0003:046D:C534.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
Jun 29 18:28:42 hp-4300G kernel: rtw_8821ce 0000:09:00.0: start vif 74:12:b3:a0:4a:cb on port 0
Jun 29 18:28:43 hp-4300G kernel: input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input11
Jun 29 18:28:43 hp-4300G kernel: input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input12
Jun 29 18:28:43 hp-4300G kernel: input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input13
Jun 29 18:28:43 hp-4300G kernel: hid-generic 0003:046D:C534.0002: input,hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
Jun 29 18:28:43 hp-4300G kernel: usbcore: registered new interface driver usbhid
Jun 29 18:28:43 hp-4300G kernel: usbhid: USB HID core driver
Jun 29 18:28:43 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0001: hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
Jun 29 18:28:43 hp-4300G kernel: Bluetooth: hci0: RTL: fw version 0x829a7644
Jun 29 18:28:44 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0002: hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
Jun 29 18:28:44 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0002: device of type eQUAD nano Lite (0x0a) connected on slot 1
Jun 29 18:28:44 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0002: device of type eQUAD nano Lite (0x0a) connected on slot 2
Jun 29 18:28:44 hp-4300G kernel: mousedev: PS/2 mouse device common for all mice
Jun 29 18:28:44 hp-4300G kernel: input: Logitech Wireless Keyboard PID:4075 Keyboard as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4075.0003/input/input16
Jun 29 18:28:44 hp-4300G kernel: hid-generic 0003:046D:4075.0003: input,hidraw2: USB HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/input1:1
Jun 29 18:28:44 hp-4300G kernel: input: Logitech Wireless Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4054.0004/input/input21
Jun 29 18:28:44 hp-4300G kernel: logitech-hidpp-device 0003:046D:4054.0004: input,hidraw2: USB HID v1.11 Mouse [Logitech Wireless Mouse] on usb-0000:01:00.0-11/input1:2
Jun 29 18:28:44 hp-4300G kernel: input: Logitech Wireless Keyboard PID:4075 as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4075.0003/input/input22
Jun 29 18:28:44 hp-4300G kernel: logitech-hidpp-device 0003:046D:4075.0003: input,hidraw3: USB HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/input1:1
Jun 29 18:28:45 hp-4300G kernel: r8169 0000:0a:00.0 enp10s0: Link is Up - 1Gbps/Full - flow control rx/tx
Jun 29 18:28:45 hp-4300G kernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp10s0: link becomes ready
Jun 29 18:28:47 hp-4300G kernel: kauditd_printk_skb: 35 callbacks suppressed
Jun 29 18:28:47 hp-4300G kernel: audit: type=1131 audit(1625016527.419:46): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:28:50 hp-4300G kernel: irq 7: nobody cared (try booting with the "irqpoll" option)
Jun 29 18:28:50 hp-4300G kernel: CPU: 4 PID: 0 Comm: swapper/4 Tainted: G      D           5.12.0-rc3-00025-gaf452ec1b1a3 #1
Jun 29 18:28:50 hp-4300G kernel: Hardware name: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
Jun 29 18:28:50 hp-4300G kernel: Call Trace:
Jun 29 18:28:50 hp-4300G kernel:  <IRQ>
Jun 29 18:28:50 hp-4300G kernel:  dump_stack+0x76/0x94
Jun 29 18:28:50 hp-4300G kernel:  __report_bad_irq+0x35/0xaa
Jun 29 18:28:50 hp-4300G kernel:  note_interrupt.cold+0xb/0x64
Jun 29 18:28:50 hp-4300G kernel:  handle_irq_event+0xa9/0xb0
Jun 29 18:28:50 hp-4300G kernel:  handle_fasteoi_irq+0x8a/0x1f0
Jun 29 18:28:50 hp-4300G kernel:  __common_interrupt+0x41/0xa0
Jun 29 18:28:50 hp-4300G kernel:  common_interrupt+0x7e/0xa0
Jun 29 18:28:50 hp-4300G kernel:  </IRQ>
Jun 29 18:28:50 hp-4300G kernel:  asm_common_interrupt+0x1e/0x40
Jun 29 18:28:50 hp-4300G kernel: RIP: 0010:cpuidle_enter_state+0xc7/0x380
Jun 29 18:28:50 hp-4300G kernel: Code: 8b 3d d5 18 e2 56 e8 e8 b4 8d ff 49 89 c5 0f 1f 44 00 00 31 ff e8 e9 c1 8d ff 45 84 ff 0f 85 da 01 00 00 fb 66 0f 1f 44 00 00 <45> 85 f6 0f 88 11 01 00 00 49 63 d6 4c 2b 2c 24 48 8d 04 52 48 8d
Jun 29 18:28:50 hp-4300G kernel: RSP: 0018:ffffadb4001a7ea8 EFLAGS: 00000246
Jun 29 18:28:50 hp-4300G kernel: RAX: ffff89005732c7c0 RBX: 0000000000000003 RCX: 000000000000001f
Jun 29 18:28:50 hp-4300G kernel: RDX: 0000000000000000 RSI: 000000002182bb3a RDI: 0000000000000000
Jun 29 18:28:50 hp-4300G kernel: RBP: ffff88ff43cea800 R08: 00000002ce7b160d R09: 000000031c28bc9a
Jun 29 18:28:50 hp-4300G kernel: R10: 0000000000000002 R11: 0000000000000002 R12: ffffffffaa149be0
Jun 29 18:28:50 hp-4300G kernel: R13: 00000002ce7b160d R14: 0000000000000003 R15: 0000000000000000
Jun 29 18:28:50 hp-4300G kernel:  ? cpuidle_enter_state+0xb7/0x380
Jun 29 18:28:50 hp-4300G kernel:  cpuidle_enter+0x29/0x40
Jun 29 18:28:50 hp-4300G kernel:  do_idle+0x1d5/0x270
Jun 29 18:28:50 hp-4300G kernel:  cpu_startup_entry+0x19/0x20
Jun 29 18:28:50 hp-4300G kernel:  secondary_startup_64_no_verify+0xc2/0xcb
Jun 29 18:28:50 hp-4300G kernel: handlers:
Jun 29 18:28:50 hp-4300G kernel: [<00000000e83c4a82>] amd_gpio_irq_handler [pinctrl_amd]
Jun 29 18:28:50 hp-4300G kernel: Disabling IRQ #7
Jun 29 18:29:54 hp-4300G kernel: audit: type=1101 audit(1625016594.700:47): pid=429 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/bin/sshd" hostname=192.168.4.54 addr=192.168.4.54 terminal=ssh res=success'
Jun 29 18:29:54 hp-4300G kernel: audit: type=1103 audit(1625016594.703:48): pid=429 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=pam_shells,pam_faillock,pam_permit,pam_env,pam_faillock acct="nathan" exe="/usr/bin/sshd" hostname=192.168.4.54 addr=192.168.4.54 terminal=ssh res=success'
Jun 29 18:29:54 hp-4300G kernel: audit: type=1006 audit(1625016594.703:49): pid=429 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=1 res=1
Jun 29 18:29:54 hp-4300G kernel: audit: type=1300 audit(1625016594.703:49): arch=c000003e syscall=1 success=yes exit=4 a0=3 a1=7fffd1265250 a2=4 a3=3e8 items=0 ppid=359 pid=429 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=1 comm="sshd" exe="/usr/bin/sshd" key=(null)
Jun 29 18:29:54 hp-4300G kernel: audit: type=1327 audit(1625016594.703:49): proctitle=737368643A206E617468616E205B707269765D
Jun 29 18:29:54 hp-4300G kernel: audit: type=1130 audit(1625016594.716:50): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:29:54 hp-4300G kernel: audit: type=1101 audit(1625016594.720:51): pid=432 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:29:54 hp-4300G kernel: audit: type=1103 audit(1625016594.720:52): pid=432 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=? acct="nathan" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
Jun 29 18:29:54 hp-4300G kernel: audit: type=1006 audit(1625016594.723:53): pid=432 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
Jun 29 18:29:54 hp-4300G kernel: audit: type=1300 audit(1625016594.723:53): arch=c000003e syscall=1 success=yes exit=4 a0=9 a1=7ffd5ba43a80 a2=4 a3=3e8 items=0 ppid=1 pid=432 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=2 comm="(systemd)" exe="/usr/lib/systemd/systemd" key=(null)

--QbssCZQk3Ov6WW0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="f127c9556a8e.log"

-- Journal begins at Mon 2021-06-28 09:22:12 MST, ends at Tue 2021-06-29 18:40:31 MST. --
Jun 29 18:40:01 hp-4300G kernel: Linux version 5.12.0-rc3-00024-gf127c9556a8e (nathan@archlinux-ax161) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.50.20210627) #1 SMP PREEMPT Tue Jun 29 18:31:18 MST 2021
Jun 29 18:40:01 hp-4300G kernel: Command line: initrd=\amd-ucode.img initrd=\initramfs-linux-next-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp irqpoll
Jun 29 18:40:01 hp-4300G kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Jun 29 18:40:01 hp-4300G kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Jun 29 18:40:01 hp-4300G kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Jun 29 18:40:01 hp-4300G kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Jun 29 18:40:01 hp-4300G kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
Jun 29 18:40:01 hp-4300G kernel: BIOS-provided physical RAM map:
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x0000000000100000-0x0000000009c0ffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x0000000009c10000-0x0000000009ffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x000000000a200000-0x000000000a20cfff] ACPI NVS
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x000000000a20d000-0x000000000affffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x000000000b020000-0x00000000b838ffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000b8390000-0x00000000b86c5fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI data
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI NVS
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000b8a15000-0x00000000badfefff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000badff000-0x00000000bbffffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000bc000000-0x00000000bdffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000bf000000-0x00000000bfffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fd200000-0x00000000fd2fffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fd600000-0x00000000fd6fffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usable
Jun 29 18:40:01 hp-4300G kernel: BIOS-e820: [mem 0x000000021f380000-0x000000023fffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: intel_pstate: HWP disabled
Jun 29 18:40:01 hp-4300G kernel: NX (Execute Disable) protection: active
Jun 29 18:40:01 hp-4300G kernel: e820: update [mem 0xb4c66018-0xb4c73457] usable ==> usable
Jun 29 18:40:01 hp-4300G kernel: e820: update [mem 0xb4c66018-0xb4c73457] usable ==> usable
Jun 29 18:40:01 hp-4300G kernel: extended physical RAM map:
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x0000000000100000-0x0000000009c0ffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x0000000009c10000-0x0000000009ffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x000000000a200000-0x000000000a20cfff] ACPI NVS
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x000000000a20d000-0x000000000affffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x000000000b000000-0x000000000b01ffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x000000000b020000-0x00000000b4c66017] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000b4c66018-0x00000000b4c73457] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000b4c73458-0x00000000b838ffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000b8390000-0x00000000b86c5fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000b86c6000-0x00000000b8721fff] ACPI data
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000b8722000-0x00000000b8a14fff] ACPI NVS
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000b8a15000-0x00000000badfefff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000badff000-0x00000000bbffffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000bc000000-0x00000000bdffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000bf000000-0x00000000bfffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fd200000-0x00000000fd2fffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fd600000-0x00000000fd6fffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x0000000100000000-0x000000021f37ffff] usable
Jun 29 18:40:01 hp-4300G kernel: reserve setup_data: [mem 0x000000021f380000-0x000000023fffffff] reserved
Jun 29 18:40:01 hp-4300G kernel: efi: EFI v2.70 by American Megatrends
Jun 29 18:40:01 hp-4300G kernel: efi: ACPI=0xb8721000 ACPI 2.0=0xb8721014 TPMFinalLog=0xb89c8000 SMBIOS=0xbac0f000 SMBIOS 3.0=0xbac0e000 MEMATTR=0xb5184018 ESRT=0xb6dde918 RNG=0xbac3e998 TPMEventLog=0xb5185018 
Jun 29 18:40:01 hp-4300G kernel: efi: seeding entropy pool
Jun 29 18:40:01 hp-4300G kernel: SMBIOS 3.3.0 present.
Jun 29 18:40:01 hp-4300G kernel: DMI: HP HP Desktop M01-F1xxx/87D6, BIOS F.12 12/17/2020
Jun 29 18:40:01 hp-4300G kernel: tsc: Fast TSC calibration using PIT
Jun 29 18:40:01 hp-4300G kernel: tsc: Detected 3792.694 MHz processor
Jun 29 18:40:01 hp-4300G kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Jun 29 18:40:01 hp-4300G kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
Jun 29 18:40:01 hp-4300G kernel: last_pfn = 0x21f380 max_arch_pfn = 0x400000000
Jun 29 18:40:01 hp-4300G kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
Jun 29 18:40:01 hp-4300G kernel: e820: update [mem 0xc0000000-0xffffffff] usable ==> reserved
Jun 29 18:40:01 hp-4300G kernel: last_pfn = 0xbc000 max_arch_pfn = 0x400000000
Jun 29 18:40:01 hp-4300G kernel: esrt: Reserving ESRT space from 0x00000000b6dde918 to 0x00000000b6dde950.
Jun 29 18:40:01 hp-4300G kernel: e820: update [mem 0xb6dde000-0xb6ddefff] usable ==> reserved
Jun 29 18:40:01 hp-4300G kernel: check: Scanning 1 areas for low memory corruption
Jun 29 18:40:01 hp-4300G kernel: Using GB pages for direct mapping
Jun 29 18:40:01 hp-4300G kernel: Secure boot disabled
Jun 29 18:40:01 hp-4300G kernel: RAMDISK: [mem 0x7f859000-0x7fff5fff]
Jun 29 18:40:01 hp-4300G kernel: ACPI: Early table checksum verification disabled
Jun 29 18:40:01 hp-4300G kernel: ACPI: RSDP 0x00000000B8721014 000024 (v02 HPQOEM)
Jun 29 18:40:01 hp-4300G kernel: ACPI: XSDT 0x00000000B8720728 0000EC (v01 HPQOEM SLIC-CPC 01072009 AMI  01000013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: FACP 0x00000000B870F000 000114 (v06 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: DSDT 0x00000000B86FE000 01050C (v02 HPQOEM SLIC-CPC 01072009 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: FACS 0x00000000B89F8000 000040
Jun 29 18:40:01 hp-4300G kernel: ACPI: MSDM 0x00000000B871F000 000055 (v03 HPQOEM SLIC-CPC 01072009 AMI  01000013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B871E000 000050 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: IVRS 0x00000000B871D000 0000D0 (v02 HPQOEM SLIC-CPC 00000001 AMD  00000000)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B8715000 007229 (v02 HPQOEM SLIC-CPC 00000002 MSFT 04000000)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B8711000 003BA1 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B8710000 000094 (v02 HPQOEM SLIC-CPC 01072009 AMI  01072009)
Jun 29 18:40:01 hp-4300G kernel: ACPI: FIDT 0x00000000B86FD000 00009C (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: MCFG 0x00000000B86FC000 00003C (v01 HPQOEM SLIC-CPC 01072009 MSFT 00010013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: HPET 0x00000000B86FB000 000038 (v01 HPQOEM SLIC-CPC 01072009 AMI  00000005)
Jun 29 18:40:01 hp-4300G kernel: ACPI: VFCT 0x00000000B86ED000 00D484 (v01 HPQOEM SLIC-CPC 00000001 AMD  31504F47)
Jun 29 18:40:01 hp-4300G kernel: ACPI: BGRT 0x00000000B86EC000 000038 (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: TPM2 0x00000000B86EB000 00004C (v04 HPQOEM SLIC-CPC 00000001 AMI  00000000)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86E9000 001CE4 (v02 HPQOEM SLIC-CPC 00000001 AMD  00000001)
Jun 29 18:40:01 hp-4300G kernel: ACPI: CRAT 0x00000000B86E8000 0007E8 (v01 HPQOEM SLIC-CPC 00000001 AMD  00000001)
Jun 29 18:40:01 hp-4300G kernel: ACPI: CDIT 0x00000000B86E7000 000029 (v01 HPQOEM SLIC-CPC 00000001 AMD  00000001)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86E6000 000D37 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86E4000 0010A5 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86E0000 00333E (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86DF000 0000BF (v01 HPQOEM SLIC-CPC 00001000 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: WSMT 0x00000000B86DE000 000028 (v01 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: APIC 0x00000000B86DD000 00015E (v03 HPQOEM SLIC-CPC 01072009 AMI  00010013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86DC000 000517 (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: SSDT 0x00000000B86DA000 0010AF (v01 HPQOEM SLIC-CPC 00000001 INTL 20120913)
Jun 29 18:40:01 hp-4300G kernel: ACPI: FPDT 0x00000000B86D9000 000044 (v01 HPQOEM SLIC-CPC 01072009 AMI  01000013)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Local APIC address 0xfee00000
Jun 29 18:40:01 hp-4300G kernel: No NUMA configuration found
Jun 29 18:40:01 hp-4300G kernel: Faking a node at [mem 0x0000000000000000-0x000000021f37ffff]
Jun 29 18:40:01 hp-4300G kernel: NODE_DATA(0) allocated [mem 0x21f37c000-0x21f37ffff]
Jun 29 18:40:01 hp-4300G kernel: Zone ranges:
Jun 29 18:40:01 hp-4300G kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Jun 29 18:40:01 hp-4300G kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Jun 29 18:40:01 hp-4300G kernel:   Normal   [mem 0x0000000100000000-0x000000021f37ffff]
Jun 29 18:40:01 hp-4300G kernel:   Device   empty
Jun 29 18:40:01 hp-4300G kernel: Movable zone start for each node
Jun 29 18:40:01 hp-4300G kernel: Early memory node ranges
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x0000000000001000-0x000000000009ffff]
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x0000000000100000-0x0000000009c0ffff]
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x000000000a20d000-0x000000000affffff]
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x000000000b020000-0x00000000b838ffff]
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x00000000badff000-0x00000000bbffffff]
Jun 29 18:40:01 hp-4300G kernel:   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
Jun 29 18:40:01 hp-4300G kernel: Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37ffff]
Jun 29 18:40:01 hp-4300G kernel: On node 0 totalpages: 1934483
Jun 29 18:40:01 hp-4300G kernel:   DMA zone: 64 pages used for memmap
Jun 29 18:40:01 hp-4300G kernel:   DMA zone: 26 pages reserved
Jun 29 18:40:01 hp-4300G kernel:   DMA zone: 3999 pages, LIFO batch:0
Jun 29 18:40:01 hp-4300G kernel:   DMA zone: 28769 pages in unavailable ranges
Jun 29 18:40:01 hp-4300G kernel:   DMA32 zone: 11782 pages used for memmap
Jun 29 18:40:01 hp-4300G kernel:   DMA32 zone: 754036 pages, LIFO batch:63
Jun 29 18:40:01 hp-4300G kernel:   DMA32 zone: 28300 pages in unavailable ranges
Jun 29 18:40:01 hp-4300G kernel:   Normal zone: 18382 pages used for memmap
Jun 29 18:40:01 hp-4300G kernel:   Normal zone: 1176448 pages, LIFO batch:63
Jun 29 18:40:01 hp-4300G kernel:   Normal zone: 3200 pages in unavailable ranges
Jun 29 18:40:01 hp-4300G kernel: ACPI: PM-Timer IO Port: 0x808
Jun 29 18:40:01 hp-4300G kernel: ACPI: Local APIC address 0xfee00000
Jun 29 18:40:01 hp-4300G kernel: ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
Jun 29 18:40:01 hp-4300G kernel: IOAPIC[0]: apic_id 9, version 33, address 0xfec00000, GSI 0-23
Jun 29 18:40:01 hp-4300G kernel: IOAPIC[1]: apic_id 10, version 33, address 0xfec01000, GSI 24-55
Jun 29 18:40:01 hp-4300G kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Jun 29 18:40:01 hp-4300G kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
Jun 29 18:40:01 hp-4300G kernel: ACPI: IRQ0 used by override.
Jun 29 18:40:01 hp-4300G kernel: ACPI: IRQ9 used by override.
Jun 29 18:40:01 hp-4300G kernel: Using ACPI (MADT) for SMP configuration information
Jun 29 18:40:01 hp-4300G kernel: ACPI: HPET id: 0x10228201 base: 0xfed00000
Jun 29 18:40:01 hp-4300G kernel: e820: update [mem 0xb5158000-0xb517ffff] usable ==> reserved
Jun 29 18:40:01 hp-4300G kernel: smpboot: Allowing 32 CPUs, 24 hotplug CPUs
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x09c10000-0x09ffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a20cfff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb4c66000-0xb4c66fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb4c73000-0xb4c73fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb5158000-0xb517ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb6dde000-0xb6ddefff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb8390000-0xb86c5fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb86c6000-0xb8721fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb8722000-0xb8a14fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xb8a15000-0xbadfefff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xbc000000-0xbdffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xbe000000-0xbeffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xbf000000-0xbfffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xefffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfd1fffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd200000-0xfd2fffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd300000-0xfd5fffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd600000-0xfd6fffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfd700000-0xfe9fffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0xfeffffff]
Jun 29 18:40:01 hp-4300G kernel: PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
Jun 29 18:40:01 hp-4300G kernel: [mem 0xc0000000-0xefffffff] available for PCI devices
Jun 29 18:40:01 hp-4300G kernel: Booting paravirtualized kernel on bare hardware
Jun 29 18:40:01 hp-4300G kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
Jun 29 18:40:01 hp-4300G kernel: setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:32 nr_node_ids:1
Jun 29 18:40:01 hp-4300G kernel: percpu: Embedded 56 pages/cpu s192512 r8192 d28672 u262144
Jun 29 18:40:01 hp-4300G kernel: pcpu-alloc: s192512 r8192 d28672 u262144 alloc=1*2097152
Jun 29 18:40:01 hp-4300G kernel: pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
Jun 29 18:40:01 hp-4300G kernel: pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 29 30 31 
Jun 29 18:40:01 hp-4300G kernel: Built 1 zonelists, mobility grouping on.  Total pages: 1904229
Jun 29 18:40:01 hp-4300G kernel: Policy zone: Normal
Jun 29 18:40:01 hp-4300G kernel: Kernel command line: initrd=\amd-ucode.img initrd=\initramfs-linux-next-llvm.img root=PARTUUID=8680aa0c-cf09-4a69-8cf3-970478040ee7 rw intel_pstate=no_hwp irqpoll
Jun 29 18:40:01 hp-4300G kernel: Misrouted IRQ fixup and polling support enabled
Jun 29 18:40:01 hp-4300G kernel: This may significantly impact system performance
Jun 29 18:40:01 hp-4300G kernel: printk: log_buf_len individual max cpu contribution: 4096 bytes
Jun 29 18:40:01 hp-4300G kernel: printk: log_buf_len total cpu_extra contributions: 126976 bytes
Jun 29 18:40:01 hp-4300G kernel: printk: log_buf_len min size: 131072 bytes
Jun 29 18:40:01 hp-4300G kernel: printk: log_buf_len: 262144 bytes
Jun 29 18:40:01 hp-4300G kernel: printk: early log buf free: 114232(87%)
Jun 29 18:40:01 hp-4300G kernel: Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: mem auto-init: stack:off, heap alloc:on, heap free:off
Jun 29 18:40:01 hp-4300G kernel: Memory: 7409704K/7737932K available (14344K kernel code, 2035K rwdata, 4856K rodata, 1648K init, 4340K bss, 327968K reserved, 0K cma-reserved)
Jun 29 18:40:01 hp-4300G kernel: random: get_random_u64 called from __kmem_cache_create+0x2a/0x560 with crng_init=0
Jun 29 18:40:01 hp-4300G kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
Jun 29 18:40:01 hp-4300G kernel: ftrace: allocating 41885 entries in 164 pages
Jun 29 18:40:01 hp-4300G kernel: ftrace: allocated 164 pages with 3 groups
Jun 29 18:40:01 hp-4300G kernel: rcu: Preemptible hierarchical RCU implementation.
Jun 29 18:40:01 hp-4300G kernel: rcu:         RCU dyntick-idle grace-period acceleration is enabled.
Jun 29 18:40:01 hp-4300G kernel: rcu:         RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=32.
Jun 29 18:40:01 hp-4300G kernel: rcu:         RCU priority boosting: priority 1 delay 500 ms.
Jun 29 18:40:01 hp-4300G kernel:         Trampoline variant of Tasks RCU enabled.
Jun 29 18:40:01 hp-4300G kernel:         Rude variant of Tasks RCU enabled.
Jun 29 18:40:01 hp-4300G kernel:         Tracing variant of Tasks RCU enabled.
Jun 29 18:40:01 hp-4300G kernel: rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
Jun 29 18:40:01 hp-4300G kernel: rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
Jun 29 18:40:01 hp-4300G kernel: NR_IRQS: 20736, nr_irqs: 1224, preallocated irqs: 16
Jun 29 18:40:01 hp-4300G kernel: Console: colour dummy device 80x25
Jun 29 18:40:01 hp-4300G kernel: printk: console [tty0] enabled
Jun 29 18:40:01 hp-4300G kernel: ACPI: Core revision 20210105
Jun 29 18:40:01 hp-4300G kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
Jun 29 18:40:01 hp-4300G kernel: APIC: Switch to symmetric I/O mode setup
Jun 29 18:40:01 hp-4300G kernel: Switched APIC routing to physical flat.
Jun 29 18:40:01 hp-4300G kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Jun 29 18:40:01 hp-4300G kernel: clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6d56c6114d4, max_idle_ns: 881591138569 ns
Jun 29 18:40:01 hp-4300G kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 7588.44 BogoMIPS (lpj=12642313)
Jun 29 18:40:01 hp-4300G kernel: pid_max: default: 32768 minimum: 301
Jun 29 18:40:01 hp-4300G kernel: LSM: Security Framework initializing
Jun 29 18:40:01 hp-4300G kernel: Yama: becoming mindful.
Jun 29 18:40:01 hp-4300G kernel: Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: x86/cpu: User Mode Instruction Prevention (UMIP) activated
Jun 29 18:40:01 hp-4300G kernel: LVT offset 1 assigned for vector 0xf9
Jun 29 18:40:01 hp-4300G kernel: LVT offset 2 assigned for vector 0xf4
Jun 29 18:40:01 hp-4300G kernel: Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
Jun 29 18:40:01 hp-4300G kernel: Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
Jun 29 18:40:01 hp-4300G kernel: Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Jun 29 18:40:01 hp-4300G kernel: Spectre V2 : Mitigation: Full AMD retpoline
Jun 29 18:40:01 hp-4300G kernel: Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Jun 29 18:40:01 hp-4300G kernel: Spectre V2 : Enabling Restricted Speculation for firmware calls
Jun 29 18:40:01 hp-4300G kernel: Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Jun 29 18:40:01 hp-4300G kernel: Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
Jun 29 18:40:01 hp-4300G kernel: Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
Jun 29 18:40:01 hp-4300G kernel: Freeing SMP alternatives memory: 36K
Jun 29 18:40:01 hp-4300G kernel: smpboot: CPU0: AMD Ryzen 3 4300G with Radeon Graphics (family: 0x17, model: 0x60, stepping: 0x1)
Jun 29 18:40:01 hp-4300G kernel: Performance Events: Fam17h+ core perfctr, AMD PMU driver.
Jun 29 18:40:01 hp-4300G kernel: ... version:                0
Jun 29 18:40:01 hp-4300G kernel: ... bit width:              48
Jun 29 18:40:01 hp-4300G kernel: ... generic registers:      6
Jun 29 18:40:01 hp-4300G kernel: ... value mask:             0000ffffffffffff
Jun 29 18:40:01 hp-4300G kernel: ... max period:             00007fffffffffff
Jun 29 18:40:01 hp-4300G kernel: ... fixed-purpose events:   0
Jun 29 18:40:01 hp-4300G kernel: ... event mask:             000000000000003f
Jun 29 18:40:01 hp-4300G kernel: rcu: Hierarchical SRCU implementation.
Jun 29 18:40:01 hp-4300G kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Jun 29 18:40:01 hp-4300G kernel: smp: Bringing up secondary CPUs ...
Jun 29 18:40:01 hp-4300G kernel: x86: Booting SMP configuration:
Jun 29 18:40:01 hp-4300G kernel: .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
Jun 29 18:40:01 hp-4300G kernel: smp: Brought up 1 node, 8 CPUs
Jun 29 18:40:01 hp-4300G kernel: smpboot: Max logical packages: 4
Jun 29 18:40:01 hp-4300G kernel: smpboot: Total of 8 processors activated (60707.56 BogoMIPS)
Jun 29 18:40:01 hp-4300G kernel: devtmpfs: initialized
Jun 29 18:40:01 hp-4300G kernel: x86/mm: Memory block size: 128MB
Jun 29 18:40:01 hp-4300G kernel: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20cfff] (53248 bytes)
Jun 29 18:40:01 hp-4300G kernel: PM: Registering ACPI NVS region [mem 0xb8722000-0xb8a14fff] (3092480 bytes)
Jun 29 18:40:01 hp-4300G kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
Jun 29 18:40:01 hp-4300G kernel: futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: pinctrl core: initialized pinctrl subsystem
Jun 29 18:40:01 hp-4300G kernel: PM: RTC time: 01:39:57, date: 2021-06-30
Jun 29 18:40:01 hp-4300G kernel: NET: Registered protocol family 16
Jun 29 18:40:01 hp-4300G kernel: DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
Jun 29 18:40:01 hp-4300G kernel: DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
Jun 29 18:40:01 hp-4300G kernel: DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
Jun 29 18:40:01 hp-4300G kernel: audit: initializing netlink subsys (disabled)
Jun 29 18:40:01 hp-4300G kernel: audit: type=2000 audit(1625017197.143:1): state=initialized audit_enabled=0 res=1
Jun 29 18:40:01 hp-4300G kernel: thermal_sys: Registered thermal governor 'fair_share'
Jun 29 18:40:01 hp-4300G kernel: thermal_sys: Registered thermal governor 'bang_bang'
Jun 29 18:40:01 hp-4300G kernel: thermal_sys: Registered thermal governor 'step_wise'
Jun 29 18:40:01 hp-4300G kernel: thermal_sys: Registered thermal governor 'user_space'
Jun 29 18:40:01 hp-4300G kernel: thermal_sys: Registered thermal governor 'power_allocator'
Jun 29 18:40:01 hp-4300G kernel: cpuidle: using governor ladder
Jun 29 18:40:01 hp-4300G kernel: cpuidle: using governor menu
Jun 29 18:40:01 hp-4300G kernel: ACPI: bus type PCI registered
Jun 29 18:40:01 hp-4300G kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Jun 29 18:40:01 hp-4300G kernel: PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
Jun 29 18:40:01 hp-4300G kernel: PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
Jun 29 18:40:01 hp-4300G kernel: PCI: Using configuration type 1 for base access
Jun 29 18:40:01 hp-4300G kernel: Kprobes globally optimized
Jun 29 18:40:01 hp-4300G kernel: HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
Jun 29 18:40:01 hp-4300G kernel: HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(Module Device)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(Processor Device)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(Processor Aggregator Device)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(Linux-Dell-Video)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
Jun 29 18:40:01 hp-4300G kernel: ACPI: 12 ACPI AML tables successfully acquired and loaded
Jun 29 18:40:01 hp-4300G kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: EC started
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: interrupt blocked
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC used to handle transactions
Jun 29 18:40:01 hp-4300G kernel: ACPI: Interpreter enabled
Jun 29 18:40:01 hp-4300G kernel: ACPI: (supports S0 S3 S4 S5)
Jun 29 18:40:01 hp-4300G kernel: ACPI: Using IOAPIC for interrupt routing
Jun 29 18:40:01 hp-4300G kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Jun 29 18:40:01 hp-4300G kernel: ACPI: Enabled 4 GPEs in block 00 to 1F
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Jun 29 18:40:01 hp-4300G kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
Jun 29 18:40:01 hp-4300G kernel: acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR DPC]
Jun 29 18:40:01 hp-4300G kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
Jun 29 18:40:01 hp-4300G kernel: acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-7f] only partially covers this bridge
Jun 29 18:40:01 hp-4300G kernel: PCI host bridge to bus 0000:00
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfec2ffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2: [1022:1635] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.0: [1022:43d1] type 00 class 0x0c0330
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.0: reg 0x10: [mem 0xfcda0000-0xfcda7fff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.1: [1022:43c8] type 00 class 0x010601
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.1: reg 0x24: [mem 0xfcd80000-0xfcd9ffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.1: reg 0x30: [mem 0xfcd00000-0xfcd7ffff pref]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.1: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.1: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2: [1022:43c6] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1: PCI bridge to [bus 01-0a]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:00.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:00.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:00.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:01.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:01.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:01.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:02.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:02.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:02.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:03.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:03.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:03.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:04.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:04.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:04.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:05.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:05.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:05.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0: [1022:43c7] type 01 class 0x060400
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0: PME# supported from D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2: PCI bridge to [bus 02-0a]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:01.0: PCI bridge to [bus 04]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:02.0: PCI bridge to [bus 05]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:03.0: PCI bridge to [bus 06]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:04.0: PCI bridge to [bus 07]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:05.0: PCI bridge to [bus 08]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:09:00.0: [10ec:c821] type 00 class 0x028000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:09:00.0: reg 0x10: [io  0xe000-0xe0ff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:09:00.0: reg 0x18: [mem 0xfcc00000-0xfcc0ffff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:09:00.0: supports D1 D2
Jun 29 18:40:01 hp-4300G kernel: pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0: PCI bridge to [bus 09]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: [10ec:8168] type 00 class 0x020000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: reg 0x10: [io  0xd000-0xd0ff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: reg 0x18: [mem 0xfcb04000-0xfcb04fff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: reg 0x20: [mem 0xfcb00000-0xfcb03fff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: supports D1 D2
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0: PCI bridge to [bus 0a]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0b:00.0: [1c5c:1339] type 00 class 0x010802
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0b:00.0: reg 0x10: [mem 0xfcf00000-0xfcf03fff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0b:00.0: supports D1
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0b:00.0: PME# supported from D0 D1 D3hot
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0b:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:02.2 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2: PCI bridge to [bus 0b]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: [1002:1636] type 00 class 0x030000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bit pref]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: reg 0x18: [mem 0xe0000000-0xe01fffff 64bit pref]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: reg 0x20: [io  0xf000-0xf0ff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: reg 0x24: [mem 0xfca00000-0xfca7ffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: BAR 0: assigned to efifb
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: PME# supported from D1 D2 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.1: [1002:1637] type 00 class 0x040300
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.1: reg 0x10: [mem 0xfca88000-0xfca8bfff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.1: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.1: PME# supported from D1 D2 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.2: [1022:15df] type 00 class 0x108000
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.2: reg 0x18: [mem 0xfc900000-0xfc9fffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.2: reg 0x24: [mem 0xfca8c000-0xfca8dfff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.2: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.3: [1022:1639] type 00 class 0x0c0330
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.3: reg 0x10: [mem 0xfc800000-0xfc8fffff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.3: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.4: [1022:1639] type 00 class 0x0c0330
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.4: reg 0x10: [mem 0xfc700000-0xfc7fffff 64bit]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.4: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.4: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.6: [1022:15e3] type 00 class 0x040300
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.6: reg 0x10: [mem 0xfca80000-0xfca87fff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.6: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.6: PME# supported from D0 D3hot D3cold
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1: PCI bridge to [bus 0c]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff 64bit pref]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.0: [1022:7901] type 00 class 0x010601
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.0: reg 0x24: [mem 0xfce01000-0xfce017ff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.0: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.2 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.1: [1022:7901] type 00 class 0x010601
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.1: reg 0x24: [mem 0xfce00000-0xfce007ff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.1: enabling Extended Tags
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2: PCI bridge to [bus 0d]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: interrupt unblocked
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: event unblocked
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
Jun 29 18:40:01 hp-4300G kernel: ACPI: EC: GPE=0x3
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_SB_.PCI0.SBRG.EC0_: Boot DSDT EC initialization complete
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_SB_.PCI0.SBRG.EC0_: EC: Used to handle transactions and events
Jun 29 18:40:01 hp-4300G kernel: iommu: Default domain type: Translated 
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: vgaarb: bridge control possible
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: vgaarb: setting as boot device
Jun 29 18:40:01 hp-4300G kernel: vgaarb: loaded
Jun 29 18:40:01 hp-4300G kernel: SCSI subsystem initialized
Jun 29 18:40:01 hp-4300G kernel: libata version 3.00 loaded.
Jun 29 18:40:01 hp-4300G kernel: ACPI: bus type USB registered
Jun 29 18:40:01 hp-4300G kernel: usbcore: registered new interface driver usbfs
Jun 29 18:40:01 hp-4300G kernel: usbcore: registered new interface driver hub
Jun 29 18:40:01 hp-4300G kernel: usbcore: registered new device driver usb
Jun 29 18:40:01 hp-4300G kernel: pps_core: LinuxPPS API ver. 1 registered
Jun 29 18:40:01 hp-4300G kernel: pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Jun 29 18:40:01 hp-4300G kernel: PTP clock support registered
Jun 29 18:40:01 hp-4300G kernel: EDAC MC: Ver: 3.0.0
Jun 29 18:40:01 hp-4300G kernel: Registered efivars operations
Jun 29 18:40:01 hp-4300G kernel: NetLabel: Initializing
Jun 29 18:40:01 hp-4300G kernel: NetLabel:  domain hash size = 128
Jun 29 18:40:01 hp-4300G kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
Jun 29 18:40:01 hp-4300G kernel: NetLabel:  unlabeled traffic allowed by default
Jun 29 18:40:01 hp-4300G kernel: PCI: Using ACPI for IRQ routing
Jun 29 18:40:01 hp-4300G kernel: PCI: pci_cache_line_size set to 64 bytes
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0x09c10000-0x0bffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb4c66018-0xb7ffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb5158000-0xb7ffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb6dde000-0xb7ffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0xb8390000-0xbbffffff]
Jun 29 18:40:01 hp-4300G kernel: e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
Jun 29 18:40:01 hp-4300G kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Jun 29 18:40:01 hp-4300G kernel: hpet0: 3 comparators, 32-bit 14.318180 MHz counter
Jun 29 18:40:01 hp-4300G kernel: clocksource: Switched to clocksource tsc-early
Jun 29 18:40:01 hp-4300G kernel: VFS: Disk quotas dquot_6.6.0
Jun 29 18:40:01 hp-4300G kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Jun 29 18:40:01 hp-4300G kernel: pnp: PnP ACPI init
Jun 29 18:40:01 hp-4300G kernel: system 00:00: [mem 0xf0000000-0xf7ffffff] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
Jun 29 18:40:01 hp-4300G kernel: system 00:01: [mem 0x220000000-0x23fffffff window] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Jun 29 18:40:01 hp-4300G kernel: pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a00-0x0a0f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a10-0x0a1f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a20-0x0a2f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a30-0x0a3f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a40-0x0a4f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a50-0x0a5f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a60-0x0a6f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a70-0x0a7f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a80-0x0a8f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0a90-0x0b8e] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0aa0-0x0aaf] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0ab0-0x0abf] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0ac0-0x0acf] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: [io  0x0ad0-0x0adf] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x04d0-0x04d1] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x040b] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x04d6] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0c00-0x0c01] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0c14] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0c50-0x0c51] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0c52] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0c6c] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0c6f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0cd0-0x0cd1] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0cd2-0x0cd3] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0cd4-0x0cd5] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0cd6-0x0cd7] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0cd8-0x0cdf] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0800-0x089f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0b00-0x0b0f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0b20-0x0b3f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0900-0x090f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [io  0x0910-0x091f] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xfec00000-0xfec00fff] could not be reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xfec01000-0xfec01fff] could not be reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: [mem 0xff000000-0xffffffff] has been reserved
Jun 29 18:40:01 hp-4300G kernel: system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
Jun 29 18:40:01 hp-4300G kernel: pnp: PnP ACPI: found 5 devices
Jun 29 18:40:01 hp-4300G kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Jun 29 18:40:01 hp-4300G kernel: NET: Registered protocol family 2
Jun 29 18:40:01 hp-4300G kernel: tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: TCP: Hash tables configured (established 65536 bind 65536)
Jun 29 18:40:01 hp-4300G kernel: MPTCP token hash table entries: 8192 (order: 5, 196608 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
Jun 29 18:40:01 hp-4300G kernel: NET: Registered protocol family 1
Jun 29 18:40:01 hp-4300G kernel: NET: Registered protocol family 44
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:00.0: PCI bridge to [bus 03]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:01.0: PCI bridge to [bus 04]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:02.0: PCI bridge to [bus 05]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:03.0: PCI bridge to [bus 06]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:04.0: PCI bridge to [bus 07]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:05.0: PCI bridge to [bus 08]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0: PCI bridge to [bus 09]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0:   bridge window [io  0xe000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0:   bridge window [mem 0xfcc00000-0xfccfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0: PCI bridge to [bus 0a]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0:   bridge window [io  0xd000-0xdfff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2: PCI bridge to [bus 02-0a]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2:   bridge window [io  0xd000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2:   bridge window [mem 0xfcb00000-0xfccfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1: PCI bridge to [bus 01-0a]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1:   bridge window [io  0xd000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1:   bridge window [mem 0xfcb00000-0xfcdfffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2: PCI bridge to [bus 0b]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2:   bridge window [mem 0xfcf00000-0xfcffffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1: PCI bridge to [bus 0c]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1:   bridge window [io  0xf000-0xffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xfc700000-0xfcafffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1:   bridge window [mem 0xd0000000-0xe01fffff 64bit pref]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2: PCI bridge to [bus 0d]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2:   bridge window [mem 0xfce00000-0xfcefffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 10 [mem 0xc0000000-0xfec2ffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff window]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:01: resource 0 [io  0xd000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:01: resource 1 [mem 0xfcb00000-0xfcdfffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:02: resource 1 [mem 0xfcb00000-0xfccfffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:09: resource 0 [io  0xe000-0xefff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:09: resource 1 [mem 0xfcc00000-0xfccfffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0a: resource 0 [io  0xd000-0xdfff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0a: resource 1 [mem 0xfcb00000-0xfcbfffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0b: resource 1 [mem 0xfcf00000-0xfcffffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0c: resource 0 [io  0xf000-0xffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0c: resource 1 [mem 0xfc700000-0xfcafffff]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0c: resource 2 [mem 0xd0000000-0xe01fffff 64bit pref]
Jun 29 18:40:01 hp-4300G kernel: pci_bus 0000:0d: resource 1 [mem 0xfce00000-0xfcefffff]
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.1: D0 power state depends on 0000:0c:00.0
Jun 29 18:40:01 hp-4300G kernel: PCI: CLS 64 bytes, default 64
Jun 29 18:40:01 hp-4300G kernel: Trying to unpack rootfs image as initramfs...
Jun 29 18:40:01 hp-4300G kernel: Freeing initrd memory: 7796K
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.2: AMD-Vi: Unable to read/write to IOMMU perf counter.
Jun 29 18:40:01 hp-4300G kernel: fbcon: Taking over console
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.2: can't derive routing for PCI INT A
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.2: PCI INT A: not connected
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:01.0: Adding to iommu group 0
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.0: Adding to iommu group 1
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.1: Adding to iommu group 2
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:02.2: Adding to iommu group 3
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.0: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.1: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:08.2: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:14.0: Adding to iommu group 5
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:14.3: Adding to iommu group 5
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.0: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.1: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.2: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.3: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.4: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.5: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.6: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:18.7: Adding to iommu group 6
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.1: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:01:00.2: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:00.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:01.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:02.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:03.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:04.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:05.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:06.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:02:07.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:09:00.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0a:00.0: Adding to iommu group 7
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0b:00.0: Adding to iommu group 8
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.0: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.1: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.2: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.3: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.4: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0c:00.6: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.0: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:0d:00.1: Adding to iommu group 4
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
Jun 29 18:40:01 hp-4300G kernel: pci 0000:00:00.2: AMD-Vi: Extended features (0x206d73ef22254ade):
Jun 29 18:40:01 hp-4300G kernel:  PPR X2APIC NX GT IA GA PC GA_vAPIC
Jun 29 18:40:01 hp-4300G kernel: AMD-Vi: Interrupt remapping enabled
Jun 29 18:40:01 hp-4300G kernel: AMD-Vi: Virtual APIC enabled
Jun 29 18:40:01 hp-4300G kernel: AMD-Vi: X2APIC enabled
Jun 29 18:40:01 hp-4300G kernel: AMD-Vi: Lazy IO/TLB flushing enabled
Jun 29 18:40:01 hp-4300G kernel: amd_uncore: 4  amd_df counters detected
Jun 29 18:40:01 hp-4300G kernel: amd_uncore: 6  amd_l3 counters detected
Jun 29 18:40:01 hp-4300G kernel: LVT offset 0 assigned for vector 0x400
Jun 29 18:40:01 hp-4300G kernel: perf: AMD IBS detected (0x000003ff)
Jun 29 18:40:01 hp-4300G kernel: check: Scanning for low memory corruption every 60 seconds
Jun 29 18:40:01 hp-4300G kernel: Initialise system trusted keyrings
Jun 29 18:40:01 hp-4300G kernel: Key type blacklist registered
Jun 29 18:40:01 hp-4300G kernel: workingset: timestamp_bits=41 max_order=21 bucket_order=0
Jun 29 18:40:01 hp-4300G kernel: zbud: loaded
Jun 29 18:40:01 hp-4300G kernel: Key type asymmetric registered
Jun 29 18:40:01 hp-4300G kernel: Asymmetric key parser 'x509' registered
Jun 29 18:40:01 hp-4300G kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
Jun 29 18:40:01 hp-4300G kernel: io scheduler mq-deadline registered
Jun 29 18:40:01 hp-4300G kernel: io scheduler kyber registered
Jun 29 18:40:01 hp-4300G kernel: io scheduler bfq registered
Jun 29 18:40:01 hp-4300G kernel: pcieport 0000:00:02.1: PME: Signaling with IRQ 26
Jun 29 18:40:01 hp-4300G kernel: pcieport 0000:00:02.2: PME: Signaling with IRQ 27
Jun 29 18:40:01 hp-4300G kernel: pcieport 0000:00:08.1: PME: Signaling with IRQ 28
Jun 29 18:40:01 hp-4300G kernel: pcieport 0000:00:08.2: PME: Signaling with IRQ 29
Jun 29 18:40:01 hp-4300G kernel: shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Jun 29 18:40:01 hp-4300G kernel: efifb: probing for efifb
Jun 29 18:40:01 hp-4300G kernel: efifb: framebuffer at 0xd0000000, using 3072k, total 3072k
Jun 29 18:40:01 hp-4300G kernel: efifb: mode is 1024x768x32, linelength=4096, pages=1
Jun 29 18:40:01 hp-4300G kernel: efifb: scrolling: redraw
Jun 29 18:40:01 hp-4300G kernel: efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
Jun 29 18:40:01 hp-4300G kernel: Console: switching to colour frame buffer device 128x48
Jun 29 18:40:01 hp-4300G kernel: fb0: EFI VGA frame buffer device
Jun 29 18:40:01 hp-4300G kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
Jun 29 18:40:01 hp-4300G kernel: ACPI: button: Power Button [PWRB]
Jun 29 18:40:01 hp-4300G kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
Jun 29 18:40:01 hp-4300G kernel: ACPI: button: Power Button [PWRF]
Jun 29 18:40:01 hp-4300G kernel: Monitor-Mwait will be used to enter C-1 state
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C000: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C002: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C004: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C006: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C001: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C003: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C005: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: ACPI: \_PR_.C007: Found 3 idle states
Jun 29 18:40:01 hp-4300G kernel: thermal LNXTHERM:00: registered as thermal_zone0
Jun 29 18:40:01 hp-4300G kernel: ACPI: thermal: Thermal Zone [HPTZ] (30 C)
Jun 29 18:40:01 hp-4300G kernel: Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
Jun 29 18:40:01 hp-4300G kernel: Non-volatile memory driver v1.3
Jun 29 18:40:01 hp-4300G kernel: AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
Jun 29 18:40:01 hp-4300G kernel: nvme nvme0: pci function 0000:0b:00.0
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:01:00.1: version 3.0
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:01:00.1: enabling device (0100 -> 0102)
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
Jun 29 18:40:01 hp-4300G kernel: scsi host0: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host1: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host2: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host3: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host4: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host5: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host6: ahci
Jun 29 18:40:01 hp-4300G kernel: scsi host7: ahci
Jun 29 18:40:01 hp-4300G kernel: ata1: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80100 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata2: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80180 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata3: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80200 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata4: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80280 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata5: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80300 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata6: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80380 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata7: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80400 irq 44
Jun 29 18:40:01 hp-4300G kernel: ata8: SATA max UDMA/133 abar m131072@0xfcd80000 port 0xfcd80480 irq 44
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:0d:00.0: enabling device (0100 -> 0102)
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:0d:00.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:0d:00.0: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
Jun 29 18:40:01 hp-4300G kernel: scsi host8: ahci
Jun 29 18:40:01 hp-4300G kernel: ata9: SATA max UDMA/133 abar m2048@0xfce01000 port 0xfce01100 irq 46
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:0d:00.1: enabling device (0100 -> 0102)
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:0d:00.1: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
Jun 29 18:40:01 hp-4300G kernel: ahci 0000:0d:00.1: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
Jun 29 18:40:01 hp-4300G kernel: scsi host9: ahci
Jun 29 18:40:01 hp-4300G kernel: ata10: SATA max UDMA/133 abar m2048@0xfce00000 port 0xfce00100 irq 48
Jun 29 18:40:01 hp-4300G kernel: ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Jun 29 18:40:01 hp-4300G kernel: ehci-pci: EHCI PCI platform driver
Jun 29 18:40:01 hp-4300G kernel: ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
Jun 29 18:40:01 hp-4300G kernel: ohci-pci: OHCI PCI platform driver
Jun 29 18:40:01 hp-4300G kernel: uhci_hcd: USB Universal Host Controller Interface driver
Jun 29 18:40:01 hp-4300G kernel: usbcore: registered new interface driver usbserial_generic
Jun 29 18:40:01 hp-4300G kernel: usbserial: USB Serial support registered for generic
Jun 29 18:40:01 hp-4300G kernel: rtc_cmos 00:02: RTC can wake from S4
Jun 29 18:40:01 hp-4300G kernel: rtc_cmos 00:02: registered as rtc0
Jun 29 18:40:01 hp-4300G kernel: rtc_cmos 00:02: setting system clock to 2021-06-30T01:39:58 UTC (1625017198)
Jun 29 18:40:01 hp-4300G kernel: rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
Jun 29 18:40:01 hp-4300G kernel: ledtrig-cpu: registered to indicate activity on CPUs
Jun 29 18:40:01 hp-4300G kernel: hid: raw HID events driver (C) Jiri Kosina
Jun 29 18:40:01 hp-4300G kernel: drop_monitor: Initializing network drop monitor service
Jun 29 18:40:01 hp-4300G kernel: Initializing XFRM netlink socket
Jun 29 18:40:01 hp-4300G kernel: NET: Registered protocol family 10
Jun 29 18:40:01 hp-4300G kernel: nvme nvme0: missing or invalid SUBNQN field.
Jun 29 18:40:01 hp-4300G kernel: Segment Routing with IPv6
Jun 29 18:40:01 hp-4300G kernel: RPL Segment Routing with IPv6
Jun 29 18:40:01 hp-4300G kernel: NET: Registered protocol family 17
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU0: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU1: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU2: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU3: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU4: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU5: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU6: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: CPU7: patch_level=0x08600106
Jun 29 18:40:01 hp-4300G kernel: microcode: Microcode Update Driver: v2.2.
Jun 29 18:40:01 hp-4300G kernel: resctrl: L3 allocation detected
Jun 29 18:40:01 hp-4300G kernel: resctrl: L3DATA allocation detected
Jun 29 18:40:01 hp-4300G kernel: resctrl: L3CODE allocation detected
Jun 29 18:40:01 hp-4300G kernel: resctrl: MB allocation detected
Jun 29 18:40:01 hp-4300G kernel: resctrl: L3 monitoring detected
Jun 29 18:40:01 hp-4300G kernel: IPI shorthand broadcast: enabled
Jun 29 18:40:01 hp-4300G kernel: sched_clock: Marking stable (481827256, 421468)->(484410312, -2161588)
Jun 29 18:40:01 hp-4300G kernel: registered taskstats version 1
Jun 29 18:40:01 hp-4300G kernel: Loading compiled-in X.509 certificates
Jun 29 18:40:01 hp-4300G kernel: nvme nvme0: 16/0/0 default/read/poll queues
Jun 29 18:40:01 hp-4300G kernel: Loaded X.509 cert 'Build time autogenerated kernel key: 22ba77e5a745fb64a1c258554eb6d5c653018035'
Jun 29 18:40:01 hp-4300G kernel: zswap: loaded using pool lz4/z3fold
Jun 29 18:40:01 hp-4300G kernel: Key type ._fscrypt registered
Jun 29 18:40:01 hp-4300G kernel: Key type .fscrypt registered
Jun 29 18:40:01 hp-4300G kernel: Key type fscrypt-provisioning registered
Jun 29 18:40:01 hp-4300G kernel: PM:   Magic number: 9:490:661
Jun 29 18:40:01 hp-4300G kernel: RAS: Correctable Errors collector initialized.
Jun 29 18:40:01 hp-4300G kernel:  nvme0n1: p1 p2
Jun 29 18:40:01 hp-4300G kernel: ata1: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata9: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata10: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata2: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6d56c6114d4, max_idle_ns: 881591138569 ns
Jun 29 18:40:01 hp-4300G kernel: clocksource: Switched to clocksource tsc
Jun 29 18:40:01 hp-4300G kernel: ata3: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata4: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata5: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata6: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata7: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: ata8: SATA link down (SStatus 0 SControl 300)
Jun 29 18:40:01 hp-4300G kernel: Freeing unused decrypted memory: 2036K
Jun 29 18:40:01 hp-4300G kernel: Freeing unused kernel image (initmem) memory: 1648K
Jun 29 18:40:01 hp-4300G kernel: Write protecting the kernel read-only data: 22528k
Jun 29 18:40:01 hp-4300G kernel: Freeing unused kernel image (text/rodata gap) memory: 2036K
Jun 29 18:40:01 hp-4300G kernel: Freeing unused kernel image (rodata/data gap) memory: 1288K
Jun 29 18:40:01 hp-4300G kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
Jun 29 18:40:01 hp-4300G kernel: rodata_test: all tests were successful
Jun 29 18:40:01 hp-4300G kernel: Run /init as init process
Jun 29 18:40:01 hp-4300G kernel:   with arguments:
Jun 29 18:40:01 hp-4300G kernel:     /init
Jun 29 18:40:01 hp-4300G kernel:   with environment:
Jun 29 18:40:01 hp-4300G kernel:     HOME=/
Jun 29 18:40:01 hp-4300G kernel:     TERM=linux
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:01:00.0: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000410
Jun 29 18:40:01 hp-4300G kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
Jun 29 18:40:01 hp-4300G kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:40:01 hp-4300G kernel: usb usb1: Product: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: usb usb1: Manufacturer: Linux 5.12.0-rc3-00024-gf127c9556a8e xhci-hcd
Jun 29 18:40:01 hp-4300G kernel: usb usb1: SerialNumber: 0000:01:00.0
Jun 29 18:40:01 hp-4300G kernel: hub 1-0:1.0: USB hub found
Jun 29 18:40:01 hp-4300G kernel: hub 1-0:1.0: 14 ports detected
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:01:00.0: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:01:00.0: Host supports USB 3.1 Enhanced SuperSpeed
Jun 29 18:40:01 hp-4300G kernel: usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
Jun 29 18:40:01 hp-4300G kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
Jun 29 18:40:01 hp-4300G kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:40:01 hp-4300G kernel: usb usb2: Product: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: usb usb2: Manufacturer: Linux 5.12.0-rc3-00024-gf127c9556a8e xhci-hcd
Jun 29 18:40:01 hp-4300G kernel: usb usb2: SerialNumber: 0000:01:00.0
Jun 29 18:40:01 hp-4300G kernel: hub 2-0:1.0: USB hub found
Jun 29 18:40:01 hp-4300G kernel: hub 2-0:1.0: 8 ports detected
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.3: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus number 3
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.3: hcc params 0x0268ffe5 hci version 0x110 quirks 0x0000000000000410
Jun 29 18:40:01 hp-4300G kernel: usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
Jun 29 18:40:01 hp-4300G kernel: usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:40:01 hp-4300G kernel: usb usb3: Product: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: usb usb3: Manufacturer: Linux 5.12.0-rc3-00024-gf127c9556a8e xhci-hcd
Jun 29 18:40:01 hp-4300G kernel: usb usb3: SerialNumber: 0000:0c:00.3
Jun 29 18:40:01 hp-4300G kernel: hub 3-0:1.0: USB hub found
Jun 29 18:40:01 hp-4300G kernel: hub 3-0:1.0: 4 ports detected
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.3: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus number 4
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.3: Host supports USB 3.1 Enhanced SuperSpeed
Jun 29 18:40:01 hp-4300G kernel: usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
Jun 29 18:40:01 hp-4300G kernel: usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
Jun 29 18:40:01 hp-4300G kernel: usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:40:01 hp-4300G kernel: usb usb4: Product: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: usb usb4: Manufacturer: Linux 5.12.0-rc3-00024-gf127c9556a8e xhci-hcd
Jun 29 18:40:01 hp-4300G kernel: usb usb4: SerialNumber: 0000:0c:00.3
Jun 29 18:40:01 hp-4300G kernel: hub 4-0:1.0: USB hub found
Jun 29 18:40:01 hp-4300G kernel: hub 4-0:1.0: 2 ports detected
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.4: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus number 5
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.4: hcc params 0x0268ffe5 hci version 0x110 quirks 0x0000000000000410
Jun 29 18:40:01 hp-4300G kernel: usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.12
Jun 29 18:40:01 hp-4300G kernel: usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:40:01 hp-4300G kernel: usb usb5: Product: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: usb usb5: Manufacturer: Linux 5.12.0-rc3-00024-gf127c9556a8e xhci-hcd
Jun 29 18:40:01 hp-4300G kernel: usb usb5: SerialNumber: 0000:0c:00.4
Jun 29 18:40:01 hp-4300G kernel: hub 5-0:1.0: USB hub found
Jun 29 18:40:01 hp-4300G kernel: hub 5-0:1.0: 4 ports detected
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.4: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.4: new USB bus registered, assigned bus number 6
Jun 29 18:40:01 hp-4300G kernel: xhci_hcd 0000:0c:00.4: Host supports USB 3.1 Enhanced SuperSpeed
Jun 29 18:40:01 hp-4300G kernel: usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
Jun 29 18:40:01 hp-4300G kernel: usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.12
Jun 29 18:40:01 hp-4300G kernel: usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Jun 29 18:40:01 hp-4300G kernel: usb usb6: Product: xHCI Host Controller
Jun 29 18:40:01 hp-4300G kernel: usb usb6: Manufacturer: Linux 5.12.0-rc3-00024-gf127c9556a8e xhci-hcd
Jun 29 18:40:01 hp-4300G kernel: usb usb6: SerialNumber: 0000:0c:00.4
Jun 29 18:40:01 hp-4300G kernel: hub 6-0:1.0: USB hub found
Jun 29 18:40:01 hp-4300G kernel: hub 6-0:1.0: 2 ports detected
Jun 29 18:40:01 hp-4300G kernel: SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
Jun 29 18:40:01 hp-4300G kernel: XFS (nvme0n1p2): Mounting V5 Filesystem
Jun 29 18:40:01 hp-4300G kernel: XFS (nvme0n1p2): Ending clean mount
Jun 29 18:40:01 hp-4300G kernel: xfs filesystem being mounted at /new_root supports timestamps until 2038 (0x7fffffff)
Jun 29 18:40:01 hp-4300G kernel: random: fast init done
Jun 29 18:40:01 hp-4300G kernel: random: crng init done
Jun 29 18:40:01 hp-4300G systemd[1]: Successfully credited entropy passed from boot loader.
Jun 29 18:40:01 hp-4300G systemd[1]: systemd 248.3-2-arch running in system mode. (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
Jun 29 18:40:01 hp-4300G systemd[1]: Detected architecture x86-64.
Jun 29 18:40:01 hp-4300G systemd[1]: Hostname set to <hp-4300G>.
Jun 29 18:40:01 hp-4300G systemd-fstab-generator[250]: Mount point  is not a valid path, ignoring.
Jun 29 18:40:01 hp-4300G systemd-fstab-generator[250]: Mount point  is not a valid path, ignoring.
Jun 29 18:40:01 hp-4300G systemd[1]: Queued start job for default target Graphical Interface.
Jun 29 18:40:01 hp-4300G systemd[1]: Created slice system-getty.slice.
Jun 29 18:40:01 hp-4300G systemd[1]: Created slice system-modprobe.slice.
Jun 29 18:40:01 hp-4300G systemd[1]: Created slice User and Session Slice.
Jun 29 18:40:01 hp-4300G systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
Jun 29 18:40:01 hp-4300G systemd[1]: Started Forward Password Requests to Wall Directory Watch.
Jun 29 18:40:01 hp-4300G systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Local Encrypted Volumes.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Login Prompts.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Paths.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Remote File Systems.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Slices.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Swap.
Jun 29 18:40:01 hp-4300G systemd[1]: Reached target Local Verity Integrity Protected Volumes.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on Device-mapper event daemon FIFOs.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on Process Core Dump Socket.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on Journal Audit Socket.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on Journal Socket (/dev/log).
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on Journal Socket.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on Network Service Netlink Socket.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on udev Control Socket.
Jun 29 18:40:01 hp-4300G systemd[1]: Listening on udev Kernel Socket.
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting Huge Pages File System...
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting POSIX Message Queue File System...
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting Kernel Debug File System...
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting Kernel Trace File System...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Create list of static device nodes for the current kernel...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Load Kernel Module configfs...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Load Kernel Module drm...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Load Kernel Module fuse...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Set Up Additional Binary Formats...
Jun 29 18:40:01 hp-4300G systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
Jun 29 18:40:01 hp-4300G kernel: Linux agpgart interface v0.103
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Journal Service...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Load Kernel Modules...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Remount Root and Kernel File Systems...
Jun 29 18:40:01 hp-4300G systemd[1]: Condition check resulted in Repartition Root Disk being skipped.
Jun 29 18:40:01 hp-4300G kernel: fuse: init (API version 7.33)
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Coldplug All udev Devices...
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted Huge Pages File System.
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted POSIX Message Queue File System.
Jun 29 18:40:01 hp-4300G kernel: XFS: attr2 mount option is deprecated.
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted Kernel Debug File System.
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted Kernel Trace File System.
Jun 29 18:40:01 hp-4300G kernel: Asymmetric key parser 'pkcs8' registered
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Create list of static device nodes for the current kernel.
Jun 29 18:40:01 hp-4300G systemd[1]: modprobe@configfs.service: Deactivated successfully.
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Load Kernel Module configfs.
Jun 29 18:40:01 hp-4300G systemd[1]: modprobe@drm.service: Deactivated successfully.
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Load Kernel Module drm.
Jun 29 18:40:01 hp-4300G systemd[1]: modprobe@fuse.service: Deactivated successfully.
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Load Kernel Module fuse.
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Load Kernel Modules.
Jun 29 18:40:01 hp-4300G systemd[1]: proc-sys-fs-binfmt_misc.automount: Got automount request for /proc/sys/fs/binfmt_misc, triggered by 265 (systemd-binfmt)
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting Arbitrary Executable File Formats File System...
Jun 29 18:40:01 hp-4300G kernel: xfs filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting FUSE Control File System...
Jun 29 18:40:01 hp-4300G systemd[1]: Mounting Kernel Configuration File System...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Apply Kernel Variables...
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Remount Root and Kernel File Systems.
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.694:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted Arbitrary Executable File Formats File System.
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted FUSE Control File System.
Jun 29 18:40:01 hp-4300G systemd[1]: Mounted Kernel Configuration File System.
Jun 29 18:40:01 hp-4300G systemd[1]: Condition check resulted in First Boot Wizard being skipped.
Jun 29 18:40:01 hp-4300G systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Load/Save Random Seed...
Jun 29 18:40:01 hp-4300G systemd[1]: Starting Create System Users...
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Set Up Additional Binary Formats.
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.700:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-binfmt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Apply Kernel Variables.
Jun 29 18:40:01 hp-4300G kernel: usb 1-11: new full-speed USB device number 2 using xhci_hcd
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.700:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G systemd[1]: Finished Load/Save Random Seed.
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.710:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-random-seed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G systemd[1]: Condition check resulted in First Boot Complete being skipped.
Jun 29 18:40:01 hp-4300G systemd[1]: Started Journal Service.
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.720:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.724:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-sysusers comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.734:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G kernel: audit: type=1130 audit(1625017201.740:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:01 hp-4300G kernel: audit: type=1334 audit(1625017201.744:10): prog-id=7 op=LOAD
Jun 29 18:40:01 hp-4300G kernel: acpi-tad ACPI000E:00: Missing _PRW
Jun 29 18:40:01 hp-4300G kernel: acpi_cpufreq: overriding BIOS provided _PSD data
Jun 29 18:40:01 hp-4300G kernel: ACPI: video: Video Device [VGA1] (multi-head: yes  rom: no  post: no)
Jun 29 18:40:01 hp-4300G kernel: acpi device:1e: registered as cooling_device8
Jun 29 18:40:01 hp-4300G kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1d/LNXVIDEO:01/input/input2
Jun 29 18:40:01 hp-4300G kernel: acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
Jun 29 18:40:01 hp-4300G kernel: input: PC Speaker as /devices/platform/pcspkr/input/input3
Jun 29 18:40:01 hp-4300G kernel: RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
Jun 29 18:40:01 hp-4300G kernel: RAPL PMU: hw unit of domain package 2^-16 Joules
Jun 29 18:40:01 hp-4300G kernel: ccp 0000:0c:00.2: enabling device (0100 -> 0102)
Jun 29 18:40:01 hp-4300G kernel: ccp 0000:0c:00.2: ccp: unable to access the device: you might be running a broken BIOS.
Jun 29 18:40:01 hp-4300G kernel: piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
Jun 29 18:40:01 hp-4300G kernel: piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
Jun 29 18:40:01 hp-4300G kernel: cryptd: max_cpu_qlen set to 1000
Jun 29 18:40:01 hp-4300G kernel: piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
Jun 29 18:40:01 hp-4300G kernel: FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
Jun 29 18:40:01 hp-4300G kernel: ccp 0000:0c:00.2: tee enabled
Jun 29 18:40:01 hp-4300G kernel: ccp 0000:0c:00.2: psp enabled
Jun 29 18:40:01 hp-4300G kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Jun 29 18:40:01 hp-4300G kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
Jun 29 18:40:01 hp-4300G kernel: sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
Jun 29 18:40:01 hp-4300G kernel: AVX2 version of gcm_enc/dec engaged.
Jun 29 18:40:01 hp-4300G kernel: AES CTR mode by8 optimization enabled
Jun 29 18:40:01 hp-4300G kernel: cfg80211: Loading compiled-in X.509 certificates for regulatory database
Jun 29 18:40:01 hp-4300G kernel: cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
Jun 29 18:40:01 hp-4300G kernel: platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
Jun 29 18:40:01 hp-4300G kernel: cfg80211: failed to load regulatory.db
Jun 29 18:40:02 hp-4300G kernel: input: HP WMI hotkeys as /devices/virtual/input/input4
Jun 29 18:40:02 hp-4300G kernel: snd_hda_intel 0000:0c:00.1: enabling device (0100 -> 0102)
Jun 29 18:40:02 hp-4300G kernel: snd_hda_intel 0000:0c:00.1: Handle vga_switcheroo audio client
Jun 29 18:40:02 hp-4300G kernel: snd_hda_intel 0000:0c:00.6: enabling device (0100 -> 0102)
Jun 29 18:40:02 hp-4300G kernel: libphy: r8169: probed
Jun 29 18:40:02 hp-4300G kernel: r8169 0000:0a:00.0 eth0: RTL8168h/8111h, 00:68:eb:ad:98:43, XID 541, IRQ 91
Jun 29 18:40:02 hp-4300G kernel: r8169 0000:0a:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
Jun 29 18:40:02 hp-4300G kernel: r8169 0000:0a:00.0 enp10s0: renamed from eth0
Jun 29 18:40:02 hp-4300G kernel: usb 1-11: New USB device found, idVendor=046d, idProduct=c534, bcdDevice=29.01
Jun 29 18:40:02 hp-4300G kernel: usb 1-11: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Jun 29 18:40:02 hp-4300G kernel: usb 1-11: Product: USB Receiver
Jun 29 18:40:02 hp-4300G kernel: usb 1-11: Manufacturer: Logitech
Jun 29 18:40:02 hp-4300G kernel: Generic FE-GE Realtek PHY r8169-a00:00: attached PHY driver (mii_bus:phy_addr=r8169-a00:00, irq=MAC)
Jun 29 18:40:02 hp-4300G kernel: input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:0c:00.1/sound/card0/input5
Jun 29 18:40:02 hp-4300G kernel: kvm: Nested Virtualization enabled
Jun 29 18:40:02 hp-4300G kernel: SVM: kvm: Nested Paging enabled
Jun 29 18:40:02 hp-4300G kernel: SVM: Virtual VMLOAD VMSAVE supported
Jun 29 18:40:02 hp-4300G kernel: SVM: Virtual GIF supported
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC671: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:    inputs:
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
Jun 29 18:40:02 hp-4300G kernel: snd_hda_codec_realtek hdaudioC1D0:      Line=0x1b
Jun 29 18:40:02 hp-4300G kernel: usb 1-12: new full-speed USB device number 3 using xhci_hcd
Jun 29 18:40:02 hp-4300G kernel: input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input6
Jun 29 18:40:02 hp-4300G kernel: input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input7
Jun 29 18:40:02 hp-4300G kernel: input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input8
Jun 29 18:40:02 hp-4300G kernel: input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:0c:00.6/sound/card1/input9
Jun 29 18:40:02 hp-4300G kernel: MCE: In-kernel MCE decoding enabled.
Jun 29 18:40:02 hp-4300G kernel: r8169 0000:0a:00.0 enp10s0: Link is Down
Jun 29 18:40:02 hp-4300G kernel: intel_rapl_common: Found RAPL domain package
Jun 29 18:40:02 hp-4300G kernel: intel_rapl_common: Found RAPL domain core
Jun 29 18:40:02 hp-4300G kernel: usb 1-12: New USB device found, idVendor=0bda, idProduct=b00a, bcdDevice= 1.10
Jun 29 18:40:02 hp-4300G kernel: usb 1-12: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Jun 29 18:40:02 hp-4300G kernel: usb 1-12: Product: Bluetooth Radio 
Jun 29 18:40:02 hp-4300G kernel: usb 1-12: Manufacturer: Realtek 
Jun 29 18:40:02 hp-4300G kernel: usb 1-12: SerialNumber: 00e04c000001
Jun 29 18:40:02 hp-4300G kernel: [drm] amdgpu kernel modesetting enabled.
Jun 29 18:40:02 hp-4300G kernel: Virtual CRAT table created for CPU
Jun 29 18:40:02 hp-4300G kernel: amdgpu: Topology: Add CPU node
Jun 29 18:40:02 hp-4300G kernel: checking generic (d0000000 300000) vs hw (d0000000 10000000)
Jun 29 18:40:02 hp-4300G kernel: fb0: switching to amdgpudrmfb from EFI VGA
Jun 29 18:40:02 hp-4300G kernel: Console: switching to colour dummy device 80x25
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: enabling device (0106 -> 0107)
Jun 29 18:40:02 hp-4300G kernel: [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x103C:0x87D6 0xCA).
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
Jun 29 18:40:02 hp-4300G kernel: [drm] register mmio base: 0xFCA00000
Jun 29 18:40:02 hp-4300G kernel: [drm] register mmio size: 524288
Jun 29 18:40:02 hp-4300G kernel: [drm] PCIE atomic ops is not supported
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 0 <soc15_common>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 1 <gmc_v9_0>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 2 <vega10_ih>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 3 <psp>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 4 <smu>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 5 <gfx_v9_0>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 6 <sdma_v4_0>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 7 <dm>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 8 <vcn_v2_0>
Jun 29 18:40:02 hp-4300G kernel: [drm] add ip block number 9 <jpeg_v2_0>
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: Fetched VBIOS from VFCT
Jun 29 18:40:02 hp-4300G kernel: amdgpu: ATOM BIOS: 113-RENOIR-026
Jun 29 18:40:02 hp-4300G kernel: rtw_8821ce 0000:09:00.0: enabling device (0100 -> 0103)
Jun 29 18:40:02 hp-4300G kernel: [drm] VCN decode is enabled in VM mode
Jun 29 18:40:02 hp-4300G kernel: [drm] VCN encode is enabled in VM mode
Jun 29 18:40:02 hp-4300G kernel: [drm] JPEG decode is enabled in VM mode
Jun 29 18:40:02 hp-4300G kernel: [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
Jun 29 18:40:02 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
Jun 29 18:40:02 hp-4300G kernel: [drm] Detected VRAM RAM=512M, BAR=512M
Jun 29 18:40:02 hp-4300G kernel: [drm] RAM width 64bits DDR4
Jun 29 18:40:02 hp-4300G kernel: [TTM] Zone  kernel: Available graphics memory: 3750314 KiB
Jun 29 18:40:02 hp-4300G kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
Jun 29 18:40:02 hp-4300G kernel: rtw_8821ce 0000:09:00.0: Firmware version 24.8.0, H2C version 12
Jun 29 18:40:02 hp-4300G kernel: [drm] amdgpu: 512M of VRAM memory ready
Jun 29 18:40:02 hp-4300G kernel: [drm] amdgpu: 3072M of GTT memory ready.
Jun 29 18:40:02 hp-4300G kernel: [drm] GART: num cpu pages 262144, num gpu pages 262144
Jun 29 18:40:02 hp-4300G kernel: [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
Jun 29 18:40:02 hp-4300G kernel: input: Logitech USB Receiver as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.0/0003:046D:C534.0001/input/input10
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: Core ver 2.22
Jun 29 18:40:02 hp-4300G kernel: NET: Registered protocol family 31
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: HCI device and connection manager initialized
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: HCI socket layer initialized
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: L2CAP socket layer initialized
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: SCO socket layer initialized
Jun 29 18:40:02 hp-4300G kernel: [drm] Loading DMUB firmware via PSP: version=0x00000000
Jun 29 18:40:02 hp-4300G kernel: usbcore: registered new interface driver btusb
Jun 29 18:40:02 hp-4300G kernel: hid-generic 0003:046D:C534.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: hci0: RTL: examining hci_ver=08 hci_rev=000c lmp_ver=08 lmp_subver=8821
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: hci0: RTL: rom_version status=0 version=1
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_fw.bin
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: hci0: RTL: loading rtl_bt/rtl8821c_config.bin
Jun 29 18:40:02 hp-4300G kernel: Bluetooth: hci0: RTL: cfg_sz 10, total sz 31990
Jun 29 18:40:02 hp-4300G kernel: [drm] Found VCN firmware Version ENC: 1.7 DEC: 4 VEP: 0 Revision: 17
Jun 29 18:40:02 hp-4300G kernel: [drm] PSP loading VCN firmware
Jun 29 18:40:03 hp-4300G kernel: rtw_8821ce 0000:09:00.0: start vif 74:12:b3:a0:4a:cb on port 0
Jun 29 18:40:03 hp-4300G kernel: [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
Jun 29 18:40:03 hp-4300G kernel: input: Logitech USB Receiver Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input11
Jun 29 18:40:03 hp-4300G kernel: input: Logitech USB Receiver Consumer Control as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input12
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: RAS: optional ras ta ucode is not available
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: RAP: optional rap ta ucode is not available
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: SMU is initialized successfully!
Jun 29 18:40:03 hp-4300G kernel: [drm] kiq ring mec 2 pipe 1 q 0
Jun 29 18:40:03 hp-4300G kernel: [drm] Display Core initialized with v3.2.122!
Jun 29 18:40:03 hp-4300G kernel: [drm] DMUB hardware initialized: version=0x01020008
Jun 29 18:40:03 hp-4300G kernel: input: Logitech USB Receiver System Control as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/input/input13
Jun 29 18:40:03 hp-4300G kernel: hid-generic 0003:046D:C534.0002: input,hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
Jun 29 18:40:03 hp-4300G kernel: usbcore: registered new interface driver usbhid
Jun 29 18:40:03 hp-4300G kernel: usbhid: USB HID core driver
Jun 29 18:40:03 hp-4300G kernel: snd_hda_intel 0000:0c:00.1: bound 0000:0c:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Jun 29 18:40:03 hp-4300G kernel: [drm] VCN decode and encode initialized successfully(under DPG Mode).
Jun 29 18:40:03 hp-4300G kernel: [drm] JPEG decode initialized successfully.
Jun 29 18:40:03 hp-4300G kernel: kfd kfd: Allocated 3969056 bytes on gart
Jun 29 18:40:03 hp-4300G kernel: Virtual CRAT table created for GPU
Jun 29 18:40:03 hp-4300G kernel: amdgpu: Topology: Add dGPU node [0x1636:0x1002]
Jun 29 18:40:03 hp-4300G kernel: kfd kfd: added device 1002:1636
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 18, active_cu_number 26
Jun 29 18:40:03 hp-4300G kernel: [drm] fb mappable at 0x220CD1000
Jun 29 18:40:03 hp-4300G kernel: [drm] vram apper at 0x220000000
Jun 29 18:40:03 hp-4300G kernel: [drm] size 8294400
Jun 29 18:40:03 hp-4300G kernel: [drm] fb depth is 24
Jun 29 18:40:03 hp-4300G kernel: [drm]    pitch is 7680
Jun 29 18:40:03 hp-4300G kernel: fbcon: amdgpudrmfb (fb0) is primary device
Jun 29 18:40:03 hp-4300G kernel: Console: switching to colour frame buffer device 240x67
Jun 29 18:40:03 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0001: hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:01:00.0-11/input0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: [drm] fb0: amdgpudrmfb frame buffer device
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 1
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 1
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 1
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 1
Jun 29 18:40:03 hp-4300G kernel: amdgpu 0000:0c:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 1
Jun 29 18:40:03 hp-4300G kernel: [drm] Initialized amdgpu 3.40.0 20150101 for 0000:0c:00.0 on minor 0
Jun 29 18:40:03 hp-4300G kernel: kauditd_printk_skb: 26 callbacks suppressed
Jun 29 18:40:03 hp-4300G kernel: audit: type=1130 audit(1625017203.727:37): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-backlight@backlight:acpi_video0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:03 hp-4300G kernel: Bluetooth: hci0: RTL: fw version 0x829a7644
Jun 29 18:40:03 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0002: hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:01:00.0-11/input1
Jun 29 18:40:03 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0002: device of type eQUAD nano Lite (0x0a) connected on slot 1
Jun 29 18:40:03 hp-4300G kernel: logitech-djreceiver 0003:046D:C534.0002: device of type eQUAD nano Lite (0x0a) connected on slot 2
Jun 29 18:40:03 hp-4300G kernel: mousedev: PS/2 mouse device common for all mice
Jun 29 18:40:03 hp-4300G kernel: input: Logitech Wireless Keyboard PID:4075 Keyboard as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4075.0003/input/input16
Jun 29 18:40:03 hp-4300G kernel: hid-generic 0003:046D:4075.0003: input,hidraw2: USB HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/input1:1
Jun 29 18:40:04 hp-4300G kernel: input: Logitech Wireless Mouse as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4054.0004/input/input21
Jun 29 18:40:04 hp-4300G kernel: logitech-hidpp-device 0003:046D:4054.0004: input,hidraw2: USB HID v1.11 Mouse [Logitech Wireless Mouse] on usb-0000:01:00.0-11/input1:2
Jun 29 18:40:04 hp-4300G kernel: input: Logitech Wireless Keyboard PID:4075 as /devices/pci0000:00/0000:00:02.1/0000:01:00.0/usb1/1-11/1-11:1.1/0003:046D:C534.0002/0003:046D:4075.0003/input/input22
Jun 29 18:40:04 hp-4300G kernel: logitech-hidpp-device 0003:046D:4075.0003: input,hidraw3: USB HID v1.11 Keyboard [Logitech Wireless Keyboard PID:4075] on usb-0000:01:00.0-11/input1:1
Jun 29 18:40:04 hp-4300G kernel: audit: type=1103 audit(1625017204.490:38): pid=464 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=pam_env,pam_permit acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
Jun 29 18:40:04 hp-4300G kernel: audit: type=1130 audit(1625017204.647:39): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@973 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:04 hp-4300G kernel: audit: type=1101 audit(1625017204.654:40): pid=468 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:04 hp-4300G kernel: audit: type=1103 audit(1625017204.654:41): pid=468 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=? acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
Jun 29 18:40:04 hp-4300G kernel: audit: type=1006 audit(1625017204.654:42): pid=468 uid=0 old-auid=4294967295 auid=973 tty=(none) old-ses=4294967295 ses=1 res=1
Jun 29 18:40:04 hp-4300G kernel: audit: type=1300 audit(1625017204.654:42): arch=c000003e syscall=1 success=yes exit=3 a0=9 a1=7ffc7624c2f0 a2=3 a3=3cd items=0 ppid=1 pid=468 auid=973 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=1 comm="(systemd)" exe="/usr/lib/systemd/systemd" key=(null)
Jun 29 18:40:04 hp-4300G kernel: audit: type=1327 audit(1625017204.654:42): proctitle="(systemd)"
Jun 29 18:40:04 hp-4300G kernel: audit: type=1105 audit(1625017204.657:43): pid=468 uid=0 auid=973 ses=1 msg='op=PAM:session_open grantors=pam_loginuid,pam_loginuid,pam_keyinit,pam_limits,pam_unix,pam_permit,pam_mail,pam_systemd,pam_env acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:04 hp-4300G kernel: audit: type=1334 audit(1625017204.660:44): prog-id=15 op=LOAD
Jun 29 18:40:06 hp-4300G kernel: r8169 0000:0a:00.0 enp10s0: Link is Up - 1Gbps/Full - flow control rx/tx
Jun 29 18:40:06 hp-4300G kernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp10s0: link becomes ready
Jun 29 18:40:31 hp-4300G kernel: kauditd_printk_skb: 6 callbacks suppressed
Jun 29 18:40:31 hp-4300G kernel: audit: type=1101 audit(1625017231.361:49): pid=520 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/bin/sshd" hostname=192.168.4.54 addr=192.168.4.54 terminal=ssh res=success'
Jun 29 18:40:31 hp-4300G kernel: audit: type=1103 audit(1625017231.401:50): pid=520 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=pam_shells,pam_faillock,pam_permit,pam_env,pam_faillock acct="nathan" exe="/usr/bin/sshd" hostname=192.168.4.54 addr=192.168.4.54 terminal=ssh res=success'
Jun 29 18:40:31 hp-4300G kernel: audit: type=1006 audit(1625017231.401:51): pid=520 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
Jun 29 18:40:31 hp-4300G kernel: audit: type=1300 audit(1625017231.401:51): arch=c000003e syscall=1 success=yes exit=4 a0=3 a1=7ffd3b8c3e70 a2=4 a3=3e8 items=0 ppid=375 pid=520 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=2 comm="sshd" exe="/usr/bin/sshd" key=(null)
Jun 29 18:40:31 hp-4300G kernel: audit: type=1327 audit(1625017231.401:51): proctitle=737368643A206E617468616E205B707269765D
Jun 29 18:40:31 hp-4300G kernel: audit: type=1130 audit(1625017231.424:52): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:31 hp-4300G kernel: audit: type=1101 audit(1625017231.427:53): pid=523 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:accounting grantors=pam_access,pam_unix,pam_permit,pam_time acct="nathan" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jun 29 18:40:31 hp-4300G kernel: audit: type=1103 audit(1625017231.427:54): pid=523 uid=0 auid=4294967295 ses=4294967295 msg='op=PAM:setcred grantors=? acct="nathan" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=failed'
Jun 29 18:40:31 hp-4300G kernel: audit: type=1006 audit(1625017231.427:55): pid=523 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=3 res=1
Jun 29 18:40:31 hp-4300G kernel: audit: type=1300 audit(1625017231.427:55): arch=c000003e syscall=1 success=yes exit=4 a0=9 a1=7ffc7624c2f0 a2=4 a3=3e8 items=0 ppid=1 pid=523 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=3 comm="(systemd)" exe="/usr/lib/systemd/systemd" key=(null)

--QbssCZQk3Ov6WW0W--
