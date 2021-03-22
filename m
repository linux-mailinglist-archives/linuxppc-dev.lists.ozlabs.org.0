Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F8344DAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 18:47:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F424l464Gz30CT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 04:47:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I9GpX39Y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I9GpX39Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com;
 envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=I9GpX39Y; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=I9GpX39Y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F424J2MyKz301B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 04:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616435193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJwiSS+T6VPqw/HeedjTiXeqD0yZ8fDdEubPYZui8ak=;
 b=I9GpX39Y9Obvftz6ycjr8/CaXx/PYF7WDLf9ACGNKWVXTl0okIyV+Qw8y2JfEDYu42L4ZQ
 qT86FbE3rSdJ4tQow0JbYLRUoiKrEaRIJV93q2HX5k13/BbptOXZqMZSdvD7xQgko7CY7Q
 s6NFIh1j9QQKk8o0HdhyhKGnlTZlXQI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616435193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJwiSS+T6VPqw/HeedjTiXeqD0yZ8fDdEubPYZui8ak=;
 b=I9GpX39Y9Obvftz6ycjr8/CaXx/PYF7WDLf9ACGNKWVXTl0okIyV+Qw8y2JfEDYu42L4ZQ
 qT86FbE3rSdJ4tQow0JbYLRUoiKrEaRIJV93q2HX5k13/BbptOXZqMZSdvD7xQgko7CY7Q
 s6NFIh1j9QQKk8o0HdhyhKGnlTZlXQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-CsGnQE7FPTSOCUMojFYzmw-1; Mon, 22 Mar 2021 13:46:30 -0400
X-MC-Unique: CsGnQE7FPTSOCUMojFYzmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DA6B18C89D9;
 Mon, 22 Mar 2021 17:46:27 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-120.phx2.redhat.com
 [10.3.112.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AC7F60240;
 Mon, 22 Mar 2021 17:46:24 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:46:23 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] vfio/pci: remove vfio_pci_nvlink2
Message-ID: <20210322114623.2f929b07@omen.home.shazbot.org>
In-Reply-To: <20210322150155.797882-2-hch@lst.de>
References: <20210322150155.797882-1-hch@lst.de>
 <20210322150155.797882-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Paul Mackerras <paulus@samba.org>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Mar 2021 16:01:54 +0100
Christoph Hellwig <hch@lst.de> wrote:
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 8ce36c1d53ca11..db7e782419d5d9 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -332,19 +332,6 @@ struct vfio_region_info_cap_type {
>  #define VFIO_REGION_SUBTYPE_INTEL_IGD_HOST_CFG	(2)
>  #define VFIO_REGION_SUBTYPE_INTEL_IGD_LPC_CFG	(3)
>  
> -/* 10de vendor PCI sub-types */
> -/*
> - * NVIDIA GPU NVlink2 RAM is coherent RAM mapped onto the host address space.
> - */
> -#define VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM	(1)
> -
> -/* 1014 vendor PCI sub-types */
> -/*
> - * IBM NPU NVlink2 ATSD (Address Translation Shootdown) register of NPU
> - * to do TLB invalidation on a GPU.
> - */
> -#define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD	(1)
> -
>  /* sub-types for VFIO_REGION_TYPE_GFX */
>  #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
>  
> @@ -637,33 +624,6 @@ struct vfio_device_migration_info {
>   */
>  #define VFIO_REGION_INFO_CAP_MSIX_MAPPABLE	3
>  
> -/*
> - * Capability with compressed real address (aka SSA - small system address)
> - * where GPU RAM is mapped on a system bus. Used by a GPU for DMA routing
> - * and by the userspace to associate a NVLink bridge with a GPU.
> - */
> -#define VFIO_REGION_INFO_CAP_NVLINK2_SSATGT	4
> -
> -struct vfio_region_info_cap_nvlink2_ssatgt {
> -	struct vfio_info_cap_header header;
> -	__u64 tgt;
> -};
> -
> -/*
> - * Capability with an NVLink link speed. The value is read by
> - * the NVlink2 bridge driver from the bridge's "ibm,nvlink-speed"
> - * property in the device tree. The value is fixed in the hardware
> - * and failing to provide the correct value results in the link
> - * not working with no indication from the driver why.
> - */
> -#define VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD	5
> -
> -struct vfio_region_info_cap_nvlink2_lnkspd {
> -	struct vfio_info_cap_header header;
> -	__u32 link_speed;
> -	__u32 __pad;
> -};
> -
>  /**
>   * VFIO_DEVICE_GET_IRQ_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 9,
>   *				    struct vfio_irq_info)

I'll leave any attempt to defend keeping this code to Alexey, but
minimally these region sub-types and capability IDs should probably be
reserved to avoid breaking whatever userspace might exist to consume
these.  Our ID space is sufficiently large that we don't need to
recycle them any time soon.  Thanks,

Alex

