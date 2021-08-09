Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB83E3DC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 03:43:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjf4J4MQ4z3bhb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 11:43:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjf3t58JHz3015
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 11:43:05 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="201783568"
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="201783568"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2021 18:42:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="670624711"
Received: from ctrondse-mobl.amr.corp.intel.com (HELO
 skuppusw-mobl5.amr.corp.intel.com) ([10.212.77.4])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2021 18:41:57 -0700
Subject: Re: [PATCH 00/11] Implement generic prot_guest_has() helper function
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <cover.1627424773.git.thomas.lendacky@amd.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <0d75f283-50b7-460d-3165-185cb955bd70@linux.intel.com>
Date: Sun, 8 Aug 2021 18:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1627424773.git.thomas.lendacky@amd.com>
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Andi Kleen <ak@linux.intel.com>, Baoquan He <bhe@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Tom,

On 7/27/21 3:26 PM, Tom Lendacky wrote:
> This patch series provides a generic helper function, prot_guest_has(),
> to replace the sme_active(), sev_active(), sev_es_active() and
> mem_encrypt_active() functions.
> 
> It is expected that as new protected virtualization technologies are
> added to the kernel, they can all be covered by a single function call
> instead of a collection of specific function calls all called from the
> same locations.
> 
> The powerpc and s390 patches have been compile tested only. Can the
> folks copied on this series verify that nothing breaks for them.

With this patch set, select ARCH_HAS_PROTECTED_GUEST and set
CONFIG_AMD_MEM_ENCRYPT=n, creates following error.

ld: arch/x86/mm/ioremap.o: in function `early_memremap_is_setup_data':
arch/x86/mm/ioremap.c:672: undefined reference to `early_memremap_decrypted'

It looks like early_memremap_is_setup_data() is not protected with
appropriate config.


> 
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Will Deacon <will@kernel.org>
> 
> ---
> 
> Patches based on:
>    https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
>    commit 79e920060fa7 ("Merge branch 'WIP/fixes'")
> 
> Tom Lendacky (11):
>    mm: Introduce a function to check for virtualization protection
>      features
>    x86/sev: Add an x86 version of prot_guest_has()
>    powerpc/pseries/svm: Add a powerpc version of prot_guest_has()
>    x86/sme: Replace occurrences of sme_active() with prot_guest_has()
>    x86/sev: Replace occurrences of sev_active() with prot_guest_has()
>    x86/sev: Replace occurrences of sev_es_active() with prot_guest_has()
>    treewide: Replace the use of mem_encrypt_active() with
>      prot_guest_has()
>    mm: Remove the now unused mem_encrypt_active() function
>    x86/sev: Remove the now unused mem_encrypt_active() function
>    powerpc/pseries/svm: Remove the now unused mem_encrypt_active()
>      function
>    s390/mm: Remove the now unused mem_encrypt_active() function
> 
>   arch/Kconfig                               |  3 ++
>   arch/powerpc/include/asm/mem_encrypt.h     |  5 --
>   arch/powerpc/include/asm/protected_guest.h | 30 +++++++++++
>   arch/powerpc/platforms/pseries/Kconfig     |  1 +
>   arch/s390/include/asm/mem_encrypt.h        |  2 -
>   arch/x86/Kconfig                           |  1 +
>   arch/x86/include/asm/kexec.h               |  2 +-
>   arch/x86/include/asm/mem_encrypt.h         | 13 +----
>   arch/x86/include/asm/protected_guest.h     | 27 ++++++++++
>   arch/x86/kernel/crash_dump_64.c            |  4 +-
>   arch/x86/kernel/head64.c                   |  4 +-
>   arch/x86/kernel/kvm.c                      |  3 +-
>   arch/x86/kernel/kvmclock.c                 |  4 +-
>   arch/x86/kernel/machine_kexec_64.c         | 19 +++----
>   arch/x86/kernel/pci-swiotlb.c              |  9 ++--
>   arch/x86/kernel/relocate_kernel_64.S       |  2 +-
>   arch/x86/kernel/sev.c                      |  6 +--
>   arch/x86/kvm/svm/svm.c                     |  3 +-
>   arch/x86/mm/ioremap.c                      | 16 +++---
>   arch/x86/mm/mem_encrypt.c                  | 60 +++++++++++++++-------
>   arch/x86/mm/mem_encrypt_identity.c         |  3 +-
>   arch/x86/mm/pat/set_memory.c               |  3 +-
>   arch/x86/platform/efi/efi_64.c             |  9 ++--
>   arch/x86/realmode/init.c                   |  8 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  4 +-
>   drivers/gpu/drm/drm_cache.c                |  4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c        |  6 +--
>   drivers/iommu/amd/init.c                   |  7 +--
>   drivers/iommu/amd/iommu.c                  |  3 +-
>   drivers/iommu/amd/iommu_v2.c               |  3 +-
>   drivers/iommu/iommu.c                      |  3 +-
>   fs/proc/vmcore.c                           |  6 +--
>   include/linux/mem_encrypt.h                |  4 --
>   include/linux/protected_guest.h            | 37 +++++++++++++
>   kernel/dma/swiotlb.c                       |  4 +-
>   36 files changed, 218 insertions(+), 104 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/protected_guest.h
>   create mode 100644 arch/x86/include/asm/protected_guest.h
>   create mode 100644 include/linux/protected_guest.h
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
