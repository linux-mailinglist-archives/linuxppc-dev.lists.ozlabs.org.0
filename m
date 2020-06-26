Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C320AA37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 03:43:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tKQT4Z0szDqk8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 11:42:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jsnitsel@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=X/eFoFsF; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=X/eFoFsF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tKNx0htkzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 11:41:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593135691;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uo+JSVhYTDvCZf7XIZ/u95KoeLyqGn7ATOJ0JQcKOAM=;
 b=X/eFoFsFmrSbMLbNmJKeyyAEAHG7l3ofIliReS4d7ekfU1heo0/igwtG+a387YlX7omkws
 p38azIUcV41Rp852YgHbuY8eI/G9xs2cv9MXEzh57/mHZhnJDM2S4ZnfDTV0CuMz8CJM5Q
 YYc4h10GBBAPXx+wkfFXgsnzXEo8JYs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593135691;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uo+JSVhYTDvCZf7XIZ/u95KoeLyqGn7ATOJ0JQcKOAM=;
 b=X/eFoFsFmrSbMLbNmJKeyyAEAHG7l3ofIliReS4d7ekfU1heo0/igwtG+a387YlX7omkws
 p38azIUcV41Rp852YgHbuY8eI/G9xs2cv9MXEzh57/mHZhnJDM2S4ZnfDTV0CuMz8CJM5Q
 YYc4h10GBBAPXx+wkfFXgsnzXEo8JYs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-BzhLMH2lOCiZLIm7WwDi1g-1; Thu, 25 Jun 2020 21:41:29 -0400
X-MC-Unique: BzhLMH2lOCiZLIm7WwDi1g-1
Received: by mail-qt1-f200.google.com with SMTP id b1so5418517qti.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 18:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uo+JSVhYTDvCZf7XIZ/u95KoeLyqGn7ATOJ0JQcKOAM=;
 b=EotwPHkKDA05MXCtrm/2COjDwnbh53nkHgylNZDi4tLmnvD1dtRTmcYKhMlormIEuJ
 +SD4XlANMxJd1j/wIck8fthWuBxOGpk/LagJ/Zu/zcQeWhabEG7HlpPLKC1dHGTqlway
 5j0bZJ1iV5eN9FFYzBHM/cGyWnx9KQj4mW4ACRf3S4C0vsBrWBSpOfWyWU5uCsihQzNs
 IFWwhpt3UWY7oqK2qha2ONAbHf+DZz+vPNSRJImrcI6biZ1W+VHrWCwD3gauZhgV4YHP
 PiNw7FlvNhofgMogJVHEa6WqvLVx1ABGgAyJbPmO4QsFJSHEqTtKB9pzGNGZD58BSAbJ
 24Cw==
X-Gm-Message-State: AOAM5318pv/cthet04BUxtuEYB+PgQBS4iPZqnhMn0QzU8RpM5qIOw8Z
 AZJTOqSVT2CJfaNdJ4cdv1w4gijQmlvl+/aK2ONwTNFfKcOzQ3CvS2sJ5cikimBPPYNHej53TMm
 UoAlEIFqsTh1wUpd/0yxu2tSdPQ==
X-Received: by 2002:ac8:4c88:: with SMTP id j8mr485608qtv.57.1593135689033;
 Thu, 25 Jun 2020 18:41:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE0WP3An23id/QtUmTXvQBy3iL8fWfM574b18RON6eZLnCxQ/UjBX9iOp11Y71pEOcFwhWWA==
X-Received: by 2002:ac8:4c88:: with SMTP id j8mr485566qtv.57.1593135688592;
 Thu, 25 Jun 2020 18:41:28 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id 19sm7136347qke.44.2020.06.25.18.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 18:41:27 -0700 (PDT)
Date: Thu, 25 Jun 2020 18:41:26 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 00/13] iommu: Remove usage of dev->archdata.iommu
Message-ID: <20200626014126.vbjw5jh7wqrpm4oc@cantor>
Mail-Followup-To: Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, x86@kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 intel-gfx@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>
References: <20200625130836.1916-1-joro@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200625130836.1916-1-joro@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jun 25 20, Joerg Roedel wrote:
>From: Joerg Roedel <jroedel@suse.de>
>
>Hi,
>
>here is a patch-set to remove the usage of dev->archdata.iommu from
>the IOMMU code in the kernel and replace its uses by the iommu per-device
>private data field. The changes also remove the field entirely from
>the architectures which no longer need it.
>
>On PowerPC the field is called dev->archdata.iommu_domain and was only
>used by the PAMU IOMMU driver. It gets removed as well.
>
>The patches have been runtime tested on Intel VT-d and compile tested
>with allyesconfig for:
>
>	* x86 (32 and 64 bit)
>	* arm and arm64
>	* ia64 (only drivers/ because build failed for me in
>	        arch/ia64)
>	* PPC64
>
>Besides that the changes also survived my IOMMU tree compile tests.
>
>Please review.
>
>Regards,
>
>	Joerg
>
>Joerg Roedel (13):
>  iommu/exynos: Use dev_iommu_priv_get/set()
>  iommu/vt-d: Use dev_iommu_priv_get/set()
>  iommu/msm: Use dev_iommu_priv_get/set()
>  iommu/omap: Use dev_iommu_priv_get/set()
>  iommu/rockchip: Use dev_iommu_priv_get/set()
>  iommu/tegra: Use dev_iommu_priv_get/set()
>  iommu/pamu: Use dev_iommu_priv_get/set()
>  iommu/mediatek: Do no use dev->archdata.iommu
>  x86: Remove dev->archdata.iommu pointer
>  ia64: Remove dev->archdata.iommu pointer
>  arm: Remove dev->archdata.iommu pointer
>  arm64: Remove dev->archdata.iommu pointer
>  powerpc/dma: Remove dev->archdata.iommu_domain
>
> arch/arm/include/asm/device.h                 |  3 ---
> arch/arm64/include/asm/device.h               |  3 ---
> arch/ia64/include/asm/device.h                |  3 ---
> arch/powerpc/include/asm/device.h             |  3 ---
> arch/x86/include/asm/device.h                 |  3 ---
> .../gpu/drm/i915/selftests/mock_gem_device.c  | 10 ++++++++--
> drivers/iommu/exynos-iommu.c                  | 20 +++++++++----------
> drivers/iommu/fsl_pamu_domain.c               |  8 ++++----
> drivers/iommu/intel/iommu.c                   | 18 ++++++++---------
> drivers/iommu/msm_iommu.c                     |  4 ++--
> drivers/iommu/mtk_iommu.h                     |  2 ++
> drivers/iommu/mtk_iommu_v1.c                  | 10 ++++------
> drivers/iommu/omap-iommu.c                    | 20 +++++++++----------
> drivers/iommu/rockchip-iommu.c                |  8 ++++----
> drivers/iommu/tegra-gart.c                    |  8 ++++----
> drivers/iommu/tegra-smmu.c                    |  8 ++++----
> .../media/platform/s5p-mfc/s5p_mfc_iommu.h    |  4 +++-
> 17 files changed, 64 insertions(+), 71 deletions(-)
>
>-- 
>2.27.0
>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

