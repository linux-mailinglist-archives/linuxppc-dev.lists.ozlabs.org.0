Return-Path: <linuxppc-dev+bounces-8262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC89AA7AB4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 22:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zq2H70T2fz2yNG;
	Sat,  3 May 2025 06:15:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746216946;
	cv=none; b=e9B7R5QO+BJxw4Pyo6mGD9a9FPfx6zOdKqcff36a6YUXPM9vPCdIgps+cK8CGVh+Dx9OITfwvsOBWsSUF5En0zbWa0v8EwwWkv8uE7Cu7lDaiYgOJlZAipjqrvy0D6DsSzYDHimOzjsHNTusboTSzQqxYdIXxhhljG9/PS/DJMmDIuLGE9GC4Tf/oLYzNEMsr7NroT5bpowTWRgnjsz2sf67vof4IBkw1QclBNyl+Dy7NKT09cVpldQO1zeVQqSmZry0wG7BDJr24LGOiR0vY1dZvNmw176F47H1+jTE8CR9DbNL+60k0tnY55pVzraUgaidX6YzI56KkhPp1c0X9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746216946; c=relaxed/relaxed;
	bh=r9HeAFxjFkW0HNGves/hgPsnmbUEtDcb6IHr8qBuaVU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=SIDqC3bmrk3pZ03j7NTDu8B18djkCVf1vEXIeMyY4LaiqTTp3q2RwdDokI88r8XkXCaE/Y+V+GkfCMzi+tAvD1paitHfb16SccLt7BMDprADLOKCyU0p8euiTV7C0LfaZccFIVbiI3HNXqir0wlRJKBp18fmOtKaRFCTB3sP4i7vKlzLzQrAZ/lMpytriEpNka7BJKsQvfPlsdB+c8NlyA6fSl+i+N9Afiwiv6dmymEQ7eKMfdq+ZEHPt8N/w9+T2+FhGuiRB1isaXH8uQLFxlTafDCImlg8mBJlIrR57Z2tMdwa66Ckw+WN02cu4VXF7saXtwY2Z6bV6dZGddJDsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AbVkqGzN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AbVkqGzN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zq2H53gLcz2xd5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 May 2025 06:15:45 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2279915e06eso28784795ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746216942; x=1746821742; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9HeAFxjFkW0HNGves/hgPsnmbUEtDcb6IHr8qBuaVU=;
        b=AbVkqGzNCawc0euNHNKVXdmxMMGRslR1E1+ufM1NY/wjior3Li7a53wCV5WgS1COON
         zYm+eiypDnh92YwZdrLqN8ROy31w6uQzHYH3BpzxbfcU6K9SJI/SQfyaMDtJFSYY+sU0
         lVe8mYx2tde5OYVP/LRgtwzqmTRHfOM1ZRsSu4btuU72oXJ6+2nqd02DHvmBAsNtrOlv
         LCDNB25CgOKJl7IiSOYotFuwp2i+HBNW/ZvY0lbSoi+JzG2UUWrzTsmooPkz4GwaTwpn
         kjheY7az/Ad1Z4cgHjh/cJ0hRWL69WUVrf2IMlGmPYVLUM6nQol1kPOw6xIq2tXQy4FR
         s4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746216942; x=1746821742;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9HeAFxjFkW0HNGves/hgPsnmbUEtDcb6IHr8qBuaVU=;
        b=G04kW8vTYcPiW3vy3GwmuCTD6yP4eCBDqaOlLjHYL7YonrwOecebcn0mHO8c1SJjZ1
         ilcxF2MiGVvNhJTO/BjrN1E+3ApYxChtSTcg4YKMDiHevezHQcmcJoTxByWuMi3jenQf
         JbPTh3BlhgtHWpCxhbJzm47lDaIqbb/j20ylCvJsJTpHvr895I/7suuepDqM/WYtk/KM
         S7CAYjQRCoT35CsIy+lY1zRhPAJdMnlfy1FNY6ynig6nJKgZ/cIKYNo0tz/w6YcmGRdd
         Rsjx9TBl5nVEsqDF49EqZCMv9M2evuZPKqVUIoBm6UszfHkTvOnvJu0v9tzdqRDvIlts
         4nUA==
X-Forwarded-Encrypted: i=1; AJvYcCU1wW8Wr8iNMMiDQX+Ct386X8qP+qizKYCAKMPKXS9/LG8NDmdftHM+E3OFFypSMUdiN8YvDynCeaH8f2k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+hna6bv2Hbj3poGHBP4+Vk1A+Dd0tbr7we8dKF9tlMt9Af/6O
	7oV/ZIpRvZzK8Pzi7RB2qqpL8HG4GWMue9HI7eJYNR7Xi5cMy9a4
X-Gm-Gg: ASbGnctpVhIv+W3unJ1QQoXlGrwZmK0drr2brps5nR+e0A8cxzJ08F5PcNPyoF/9pAt
	zTLQKzdEwPKzMCVXUsFWOIrLW8jT/1psHo5G8i3bipfkvkL5BDE2hym2x7N+1x3E7vJzjLXdHjn
	yWRQxYGVqol+gpaKLomsdFPzKKagBDs5E4di3OkNTjUPwnVdddrGk8M1aKFnKlLs6HGDt6k+MUH
	GKslKh8b1pn4N+eCa2x3uS7U5iIM3rCjTDxgk9s+0NdKzIoHnxXMMGGtnTnlegPHrjwRJpfvgzY
	pyrUAc/jFAF6sLgdS7dWlHcQ3lVATC9ILw==
X-Google-Smtp-Source: AGHT+IEzcbb+bNqoMPH5ve1w12SSGCYJgqHyRGUk+esr6umKljqxWp9/HXURpNzLg8PPH01q0FwhXA==
X-Received: by 2002:a17:90b:3c4e:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-30a4e5ae12amr6928797a91.11.1746216942127;
        Fri, 02 May 2025 13:15:42 -0700 (PDT)
Received: from dw-tp ([171.76.84.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3474894fsm6227065a91.18.2025.05.02.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:15:41 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: Gaurav Batra <gbatra@linux.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: Memory leak in TCE table userspace view
In-Reply-To: <20250425170806.28987-1-gbatra@linux.ibm.com>
Date: Sat, 03 May 2025 01:23:38 +0530
Message-ID: <874iy2rdq5.fsf@gmail.com>
References: <20250425170806.28987-1-gbatra@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

Gaurav Batra <gbatra@linux.ibm.com> writes:

> When a device is opened by a userspace driver, via VFIO interface, DMA
> window is created. This DMA window has TCE Table and a corresponding
> data for userview of
> TCE table.
>
> When the userspace driver closes the device, all the above infrastructure
> is free'ed and the device control given back to kernel. Both DMA window
> and TCE table is getting free'ed. But due to a code bug, userview of the
> TCE table is not getting free'ed. This is resulting in a memory leak.
>
> Befow is the information from KMEMLEAK
>
> unreferenced object 0xc008000022af0000 (size 16777216):
>   comm "senlib_unit_tes", pid 9346, jiffies 4294983174
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_vmalloc+0xc8/0x1a0
>     __vmalloc_node_range+0x284/0x340
>     vzalloc+0x58/0x70
>     spapr_tce_create_table+0x4b0/0x8d0
>     tce_iommu_create_table+0xcc/0x170 [vfio_iommu_spapr_tce]
>     tce_iommu_create_window+0x144/0x2f0 [vfio_iommu_spapr_tce]
>     tce_iommu_ioctl.part.0+0x59c/0xc90 [vfio_iommu_spapr_tce]
>     vfio_fops_unl_ioctl+0x88/0x280 [vfio]
>     sys_ioctl+0xf4/0x160
>     system_call_exception+0x164/0x310
>     system_call_vectored_common+0xe8/0x278
> unreferenced object 0xc008000023b00000 (size 4194304):
>   comm "senlib_unit_tes", pid 9351, jiffies 4294984116
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_vmalloc+0xc8/0x1a0
>     __vmalloc_node_range+0x284/0x340
>     vzalloc+0x58/0x70
>     spapr_tce_create_table+0x4b0/0x8d0
>     tce_iommu_create_table+0xcc/0x170 [vfio_iommu_spapr_tce]
>     tce_iommu_create_window+0x144/0x2f0 [vfio_iommu_spapr_tce]
>     tce_iommu_create_default_window+0x88/0x120 [vfio_iommu_spapr_tce]
>     tce_iommu_ioctl.part.0+0x57c/0xc90 [vfio_iommu_spapr_tce]
>     vfio_fops_unl_ioctl+0x88/0x280 [vfio]
>     sys_ioctl+0xf4/0x160
>     system_call_exception+0x164/0x310
>     system_call_vectored_common+0xe8/0x278
>
> Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index d6ebc19fb99c..eec333dd2e59 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -197,7 +197,7 @@ static void tce_iommu_userspace_view_free(struct iommu_table *tbl)
>
>  static void tce_free_pSeries(struct iommu_table *tbl)
>  {
> -	if (!tbl->it_userspace)
> +	if (tbl->it_userspace)
>  		tce_iommu_userspace_view_free(tbl);
>  }

Gr8 catch. That clearly looks like a miss in the original code.

vfree() can be called even directly and it says no operation is
performed if addr passed to vfree is NULL. However I don't really see
any value add in doing that except maybe we can kill tce_free_pSeries()
function. But vfree() still does few checks in there. So we may as well
check for a non-null address before calling vfree().

nitpick: I might have re-pharsed the commit msg as:
     powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view

The patch looks good to me purely from the kmemleak bug perspective.
So feel free to take: 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-ritesh

