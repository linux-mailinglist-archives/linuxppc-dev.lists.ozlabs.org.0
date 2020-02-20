Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1A166A49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 23:22:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NpxQ5jxzzDqhK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 09:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=alex.williamson@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ExxJP6Bt; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Npvt5r8jzDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 09:21:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582237270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obxVXBYRAmnOA1SZMlmZvsbkXpHvqTIQ+TOcUb8T0eE=;
 b=ExxJP6BtaG89KK/JdTc+ND1yzjYLOWOpUM4QB2DuBCBrET2IWLNSLO6T0a8M+wHroZXMJH
 CcoaYMXecVbwEqfmKTBajECS0hiT4dt+wUaQV7YbF+LSt8w66V4HxV4KTsJXxyp5VDuomB
 Gy89wiMsRybUV121nBm8N0sF+BdkW0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-otoHWshVPT-jZMjRZUw8mQ-1; Thu, 20 Feb 2020 13:19:46 -0500
X-MC-Unique: otoHWshVPT-jZMjRZUw8mQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5E51005510;
 Thu, 20 Feb 2020 18:19:44 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43BA386E0D;
 Thu, 20 Feb 2020 18:19:43 +0000 (UTC)
Date: Thu, 20 Feb 2020 11:19:42 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 5/5] vfio/spapr_tce: Advertise and allow a huge
 DMA windows at 4GB
Message-ID: <20200220111942.2b53414a@w520.home>
In-Reply-To: <20200218073650.16149-6-aik@ozlabs.ru>
References: <20200218073650.16149-1-aik@ozlabs.ru>
 <20200218073650.16149-6-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Feb 2020 18:36:50 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> So far the only option for a big 64big DMA window was a window located
> at 0x800.0000.0000.0000 (1<<59) which creates problems for devices
> supporting smaller DMA masks.
> 
> This exploits a POWER9 PHB option to allow the second DMA window to map
> at 0 and advertises it with a 4GB offset to avoid overlap with
> the default 32bit window.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  include/uapi/linux/vfio.h           |  2 ++
>  drivers/vfio/vfio_iommu_spapr_tce.c | 10 ++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 9e843a147ead..c7f89d47335a 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -831,9 +831,11 @@ struct vfio_iommu_spapr_tce_info {
>  	__u32 argsz;
>  	__u32 flags;
>  #define VFIO_IOMMU_SPAPR_INFO_DDW	(1 << 0)	/* DDW supported */
> +#define VFIO_IOMMU_SPAPR_INFO_DDW_START	(1 << 1)	/* DDW offset */
>  	__u32 dma32_window_start;	/* 32 bit window start (bytes) */
>  	__u32 dma32_window_size;	/* 32 bit window size (bytes) */
>  	struct vfio_iommu_spapr_tce_ddw_info ddw;
> +	__u64 dma64_window_start;
>  };
>  
>  #define VFIO_IOMMU_SPAPR_TCE_GET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 16b3adc508db..4f22be3c4aa2 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -691,7 +691,7 @@ static long tce_iommu_create_window(struct tce_container *container,
>  	container->tables[num] = tbl;
>  
>  	/* Return start address assigned by platform in create_table() */
> -	*start_addr = tbl->it_offset << tbl->it_page_shift;
> +	*start_addr = tbl->it_dmaoff << tbl->it_page_shift;
>  
>  	return 0;
>  
> @@ -842,7 +842,13 @@ static long tce_iommu_ioctl(void *iommu_data,
>  			info.ddw.levels = table_group->max_levels;
>  		}
>  
> -		ddwsz = offsetofend(struct vfio_iommu_spapr_tce_info, ddw);
> +		ddwsz = offsetofend(struct vfio_iommu_spapr_tce_info,
> +				dma64_window_start);

This breaks existing users, now they no longer get the ddw struct
unless their argsz also includes the new dma64 window field.

> +
> +		if (info.argsz >= ddwsz) {
> +			info.flags |= VFIO_IOMMU_SPAPR_INFO_DDW_START;
> +			info.dma64_window_start = table_group->tce64_start;
> +		}

This is inconsistent with ddw where we set the flag regardless of
argsz, but obviously only provide the field to the user if they've
provided room for it.  Thanks,

Alex

>  
>  		if (info.argsz >= ddwsz)
>  			minsz = ddwsz;

