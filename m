Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8341B779
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 21:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJqB159M4z3bj4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 05:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJq9S64Jfz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 05:20:59 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="221582571"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="221582571"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 12:19:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="554270019"
Received: from oogunmoy-mobl1.amr.corp.intel.com (HELO
 skuppusw-mobl5.amr.corp.intel.com) ([10.212.221.219])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 12:19:51 -0700
Subject: Re: [PATCH v4 0/8] Implement generic cc_platform_has() helper function
To: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
References: <20210928191009.32551-1-bp@alien8.de>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <80593893-c63b-d481-45f1-42a3a6fd762a@linux.intel.com>
Date: Tue, 28 Sep 2021 12:19:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928191009.32551-1-bp@alien8.de>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Young <dyoung@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, kexec@lists.infradead.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/28/21 12:10 PM, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Hi all,
> 
> here's v4 of the cc_platform_has() patchset with feedback incorporated.
> 
> I'm going to route this through tip if there are no objections.

Intel CC support patch is not included in this series. You want me
to address the issue raised by Joerg before merging it?

> 
> Thx.
> 
> Tom Lendacky (8):
>    x86/ioremap: Selectively build arch override encryption functions
>    arch/cc: Introduce a function to check for confidential computing
>      features
>    x86/sev: Add an x86 version of cc_platform_has()
>    powerpc/pseries/svm: Add a powerpc version of cc_platform_has()
>    x86/sme: Replace occurrences of sme_active() with cc_platform_has()
>    x86/sev: Replace occurrences of sev_active() with cc_platform_has()
>    x86/sev: Replace occurrences of sev_es_active() with cc_platform_has()
>    treewide: Replace the use of mem_encrypt_active() with
>      cc_platform_has()
> 
>   arch/Kconfig                                 |  3 +
>   arch/powerpc/include/asm/mem_encrypt.h       |  5 --
>   arch/powerpc/platforms/pseries/Kconfig       |  1 +
>   arch/powerpc/platforms/pseries/Makefile      |  2 +
>   arch/powerpc/platforms/pseries/cc_platform.c | 26 ++++++
>   arch/powerpc/platforms/pseries/svm.c         |  5 +-
>   arch/s390/include/asm/mem_encrypt.h          |  2 -
>   arch/x86/Kconfig                             |  1 +
>   arch/x86/include/asm/io.h                    |  8 ++
>   arch/x86/include/asm/kexec.h                 |  2 +-
>   arch/x86/include/asm/mem_encrypt.h           | 12 +--
>   arch/x86/kernel/Makefile                     |  6 ++
>   arch/x86/kernel/cc_platform.c                | 69 +++++++++++++++
>   arch/x86/kernel/crash_dump_64.c              |  4 +-
>   arch/x86/kernel/head64.c                     |  9 +-
>   arch/x86/kernel/kvm.c                        |  3 +-
>   arch/x86/kernel/kvmclock.c                   |  4 +-
>   arch/x86/kernel/machine_kexec_64.c           | 19 +++--
>   arch/x86/kernel/pci-swiotlb.c                |  9 +-
>   arch/x86/kernel/relocate_kernel_64.S         |  2 +-
>   arch/x86/kernel/sev.c                        |  6 +-
>   arch/x86/kvm/svm/svm.c                       |  3 +-
>   arch/x86/mm/ioremap.c                        | 18 ++--
>   arch/x86/mm/mem_encrypt.c                    | 55 ++++--------
>   arch/x86/mm/mem_encrypt_identity.c           |  9 +-
>   arch/x86/mm/pat/set_memory.c                 |  3 +-
>   arch/x86/platform/efi/efi_64.c               |  9 +-
>   arch/x86/realmode/init.c                     |  8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      |  4 +-
>   drivers/gpu/drm/drm_cache.c                  |  4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |  4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c          |  6 +-
>   drivers/iommu/amd/init.c                     |  7 +-
>   drivers/iommu/amd/iommu.c                    |  3 +-
>   drivers/iommu/amd/iommu_v2.c                 |  3 +-
>   drivers/iommu/iommu.c                        |  3 +-
>   fs/proc/vmcore.c                             |  6 +-
>   include/linux/cc_platform.h                  | 88 ++++++++++++++++++++
>   include/linux/mem_encrypt.h                  |  4 -
>   kernel/dma/swiotlb.c                         |  4 +-
>   40 files changed, 310 insertions(+), 129 deletions(-)
>   create mode 100644 arch/powerpc/platforms/pseries/cc_platform.c
>   create mode 100644 arch/x86/kernel/cc_platform.c
>   create mode 100644 include/linux/cc_platform.h
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
