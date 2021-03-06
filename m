Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0445832F70A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 01:04:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DslFv0fkQz3dP2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 11:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DslFZ1XkZz3cJY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 11:04:01 +1100 (AEDT)
Received: by mail-ot1-f42.google.com with SMTP id b8so3506706oti.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 16:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FCbBlEEqgxfjPjtQfKvWFaWJOfXoBc2uhQxuYQUH8F0=;
 b=gHJVOu8CHyC4LkOOe2uVi5sOxxPa8+TceETilvrZuw+Lk4v2Z5JIFQpYSfvT63QSKy
 0dK/e2OHB8RhZAy1wQsPHwgIS7ZnKPY+pG75Y+qyw+pAS11v33cmxP50xSKuMv5qg/sS
 musC46Mn12lSWSsAxbRnnnjdn7DyJqkFHnSffNBUUMPLhvb40Dk9Sl5WWX50EevF/fLr
 mpVB/Y9TgSb2Sy5CVYTocuJt609zCSVbzf12ziKXc6AbNomxVz8//g/itdqOb+s+Lgsk
 srFWUF93Q5XZdKdNLSVeT4C8lVflrfMV2j34AbLUNc/1zG3hOs+3JSlE+ItfU/Yi24gp
 cvQg==
X-Gm-Message-State: AOAM533EO9+MLogJDbESgg1XdevqfcuQao3FFsYbC6sc0K/YoaQSBiHJ
 G+O4bT86esb+G3Zj9TFDsP9iVAlClEjVbw==
X-Google-Smtp-Source: ABdhPJziiRF0LUOXdpdJ44wHL0ncfsnx4e5XOstUc1IkzuGT7GN7TGFhYs3mAjHGOF1FNc1xB+Z7bQ==
X-Received: by 2002:a05:6830:22c5:: with SMTP id
 q5mr2804262otc.359.1614989038261; 
 Fri, 05 Mar 2021 16:03:58 -0800 (PST)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180])
 by smtp.gmail.com with ESMTPSA id v22sm930852otj.57.2021.03.05.16.03.56
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 16:03:57 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id d20so4420450oiw.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 16:03:56 -0800 (PST)
X-Received: by 2002:a54:4794:: with SMTP id o20mr9228337oic.51.1614989036851; 
 Fri, 05 Mar 2021 16:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20210301084257.945454-1-hch@lst.de>
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 5 Mar 2021 18:03:45 -0600
X-Gmail-Original-Message-ID: <CADRPPNTSzuuqW97_vd3h5cpHe7gOLyw3zCaqapb8YVqPF-rOfA@mail.gmail.com>
Message-ID: <CADRPPNTSzuuqW97_vd3h5cpHe7gOLyw3zCaqapb8YVqPF-rOfA@mail.gmail.com>
Subject: Re: cleanup unused or almost unused IOMMU APIs and the FSL PAMU driver
To: Christoph Hellwig <hch@lst.de>
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Netdev <netdev@vger.kernel.org>,
 freedreno@lists.freedesktop.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 1, 2021 at 2:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> there are a bunch of IOMMU APIs that are entirely unused, or only used as
> a private communication channel between the FSL PAMU driver and it's only
> consumer, the qbman portal driver.
>
> So this series drops a huge chunk of entirely unused FSL PAMU
> functionality, then drops all kinds of unused IOMMU APIs, and then
> replaces what is left of the iommu_attrs with properly typed, smaller
> and easier to use specific APIs.

It looks like the unused APIs were added for functionality that were
never completed later on.  So

Acked-by: Li Yang <leoyang.li@nxp.com>

>
> Diffstat:
>  arch/powerpc/include/asm/fsl_pamu_stash.h   |   12
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    2
>  drivers/iommu/amd/iommu.c                   |   23
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   85 ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  122 +---
>  drivers/iommu/dma-iommu.c                   |    8
>  drivers/iommu/fsl_pamu.c                    |  264 ----------
>  drivers/iommu/fsl_pamu.h                    |   10
>  drivers/iommu/fsl_pamu_domain.c             |  694 ++--------------------------
>  drivers/iommu/fsl_pamu_domain.h             |   46 -
>  drivers/iommu/intel/iommu.c                 |   55 --
>  drivers/iommu/iommu.c                       |   75 ---
>  drivers/soc/fsl/qbman/qman_portal.c         |   56 --
>  drivers/vfio/vfio_iommu_type1.c             |   31 -
>  drivers/vhost/vdpa.c                        |   10
>  include/linux/iommu.h                       |   81 ---
>  16 files changed, 214 insertions(+), 1360 deletions(-)
