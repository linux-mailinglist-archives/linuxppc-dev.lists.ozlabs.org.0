Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57E3D8D14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 13:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZX7S4WBjz3bjK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 21:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rjufznQp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=ckoenig.leichtzumerken@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rjufznQp; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZX6z6VVYz306R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 21:51:06 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id h14so2145327wrx.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yp5cWmb4AkxFKBl8NuqRHF/Fj+1O+kz07eQ9B1cFrTM=;
 b=rjufznQpIgT9Y4X5wATRAu5BDsSd6HgqZ5d9ZbD1tV5XqwI37bp4dlZn7sEU3roUWH
 clGVPK5HZt0ibEg3n3rnQO/LLfCGXNB1z/OcJviBqX5BnDvPAT6ovSqtf2GG9z+b2bf5
 hNRMQ5K1GU2t5utAkiIOYPFplsyDtoOtGyLrHrE0gjJStx3UlTxodAu66P1SUyVqHuRo
 M6T6x8SRy36Ns7u7LeNWzv4QGHqMLlVM5YZOdZC2fd6M+9vcopSschELbxKP610fuQ0E
 cnkAxdbpF2osQv7uYuvrxQu8i8zU9T8kP5ggNwdog+ispko+yCugJr87oZyjOacGVREA
 620A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yp5cWmb4AkxFKBl8NuqRHF/Fj+1O+kz07eQ9B1cFrTM=;
 b=trBosbYb+c7LyiE+KdiwaBCWWyXMGOJ09megZ/ATf48kSZRSlSKugdG3BhrYf4upIS
 CbsloGGBRtYhFYVRjbgT6Ycg1bc+cuk4mzQMOMjZapH/9UjeQZGxd65zYm3PzOkgHEHF
 0R5edu9Y4fg6M/pOaXvVmW3yxLFcglRsneuqOsbicr6CU6j1bP2OpvJ5iXkyZj2/et2Y
 MA8kmggnoerUaPqkfZqNpnNT495nw8qKYgTZrYxojvPZazv+6BR8GY8ZNQJY+Z1oP9OR
 yrHZ8FbcSO5oP30HkJEaww/UgPBKjtVNvO4xRcrDxZmfEUj2j0SUtbOiazwxTSVfrjEt
 zFwQ==
X-Gm-Message-State: AOAM532pmeLnBwBCeRxn6mkNDHC6tafgAbIyNbOHjLv3cbi8vr/23c+6
 uzLkSLiUR+4Olh6BfvEOCf4=
X-Google-Smtp-Source: ABdhPJxnFTfpGwAmyL+B5BY1p5oMjCoBMdD/Omxoq7nc4R8MHgQpLQLkqKXCOPeVLSKKDmRSYkfgVw==
X-Received: by 2002:adf:d1c7:: with SMTP id b7mr22336082wrd.108.1627473059546; 
 Wed, 28 Jul 2021 04:50:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a5d:b580:2891:cbac?
 ([2a02:908:1252:fb60:6a5d:b580:2891:cbac])
 by smtp.gmail.com with ESMTPSA id q72sm7758671wme.14.2021.07.28.04.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:50:59 -0700 (PDT)
Subject: Re: [PATCH 00/11] Implement generic prot_guest_has() helper function
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <cover.1627424773.git.thomas.lendacky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5cd35ae7-a7ff-eca4-5d2a-f0dad94e1d7a@gmail.com>
Date: Wed, 28 Jul 2021 13:50:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1627424773.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Andi Kleen <ak@linux.intel.com>, Baoquan He <bhe@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 28.07.21 um 00:26 schrieb Tom Lendacky:
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

As GPU driver dev I'm only one end user of this, but at least from the 
high level point of view that makes totally sense to me.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com>.

We could run that through the AMD GPU unit tests, but I fear we actually 
don't test on a system with SEV/SME active.

Going to raise that on our team call today.

Regards,
Christian.

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

