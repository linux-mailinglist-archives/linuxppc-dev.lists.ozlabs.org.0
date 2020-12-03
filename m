Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0C2CE320
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 00:51:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnCKt2hhrzDrMC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 10:51:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com;
 envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DUzvJNaY; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DUzvJNaY; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnCGp2vGgzDrJ5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 10:49:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607039340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2PLhlAnoOsX/pwTCtmcWSJg6wOqgMga2gkoIQHGoBg=;
 b=DUzvJNaYLBzzDrp6s1uoIXsyjSPf4L4GV0i5wwkjAcn8AgJX4mYDsnL6Nb1lFmPmUgXDaB
 9DX4spRrcIRM57L02ElyO5DxcboydbZd3NZbfyl00TDlnt5IIEiXpLWoVkrZ+p47ns0lsC
 NpvP2xtuyghWr+zMX6w6Us5tuOmQNP4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607039340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2PLhlAnoOsX/pwTCtmcWSJg6wOqgMga2gkoIQHGoBg=;
 b=DUzvJNaYLBzzDrp6s1uoIXsyjSPf4L4GV0i5wwkjAcn8AgJX4mYDsnL6Nb1lFmPmUgXDaB
 9DX4spRrcIRM57L02ElyO5DxcboydbZd3NZbfyl00TDlnt5IIEiXpLWoVkrZ+p47ns0lsC
 NpvP2xtuyghWr+zMX6w6Us5tuOmQNP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-rNmOTHbUNfuBpzE4t0YOvg-1; Thu, 03 Dec 2020 18:48:56 -0500
X-MC-Unique: rNmOTHbUNfuBpzE4t0YOvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6192C10766BA;
 Thu,  3 Dec 2020 23:48:54 +0000 (UTC)
Received: from w520.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 490AF1A8A0;
 Thu,  3 Dec 2020 23:48:52 +0000 (UTC)
Date: Thu, 3 Dec 2020 16:48:52 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] vfio/pci/nvlink2: Do not attempt NPU2 setup
 on POWER8NVL NPU
Message-ID: <20201203164852.46d5f7c0@w520.home>
In-Reply-To: <20201122073950.15684-1-aik@ozlabs.ru>
References: <20201122073950.15684-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, stable@vger.kernel.org,
 Leonardo Augusto =?UTF-8?B?R3VpbWFyw6Nlcw==?= Garcia <lagarcia@br.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 22 Nov 2020 18:39:50 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> We execute certain NPU2 setup code (such as mapping an LPID to a device
> in NPU2) unconditionally if an Nvlink bridge is detected. However this
> cannot succeed on POWER8NVL machines as the init helpers return an error
> other than ENODEV which means the device is there is and setup failed so
> vfio_pci_enable() fails and pass through is not possible.
> 
> This changes the two NPU2 related init helpers to return -ENODEV if
> there is no "memory-region" device tree property as this is
> the distinction between NPU and NPU2.
> 
> Tested on
> - POWER9 pvr=004e1201, Ubuntu 19.04 host, Ubuntu 18.04 vm,
>   NVIDIA GV100 10de:1db1 driver 418.39
> - POWER8 pvr=004c0100, RHEL 7.6 host, Ubuntu 16.10 vm,
>   NVIDIA P100 10de:15f9 driver 396.47
> 
> Fixes: 7f92891778df ("vfio_pci: Add NVIDIA GV100GL [Tesla V100 SXM2] subdriver")
> Cc: stable@vger.kernel.org # 5.0
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * updated commit log with tested configs and replaced P8+ with POWER8NVL for clarity
> ---
>  drivers/vfio/pci/vfio_pci_nvlink2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Thanks, applies to vfio next branch for v5.11.

Alex


> 
> diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
> index 65c61710c0e9..9adcf6a8f888 100644
> --- a/drivers/vfio/pci/vfio_pci_nvlink2.c
> +++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
> @@ -231,7 +231,7 @@ int vfio_pci_nvdia_v100_nvlink2_init(struct vfio_pci_device *vdev)
>  		return -EINVAL;
>  
>  	if (of_property_read_u32(npu_node, "memory-region", &mem_phandle))
> -		return -EINVAL;
> +		return -ENODEV;
>  
>  	mem_node = of_find_node_by_phandle(mem_phandle);
>  	if (!mem_node)
> @@ -393,7 +393,7 @@ int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
>  	int ret;
>  	struct vfio_pci_npu2_data *data;
>  	struct device_node *nvlink_dn;
> -	u32 nvlink_index = 0;
> +	u32 nvlink_index = 0, mem_phandle = 0;
>  	struct pci_dev *npdev = vdev->pdev;
>  	struct device_node *npu_node = pci_device_to_OF_node(npdev);
>  	struct pci_controller *hose = pci_bus_to_host(npdev->bus);
> @@ -408,6 +408,9 @@ int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
>  	if (!pnv_pci_get_gpu_dev(vdev->pdev))
>  		return -ENODEV;
>  
> +	if (of_property_read_u32(npu_node, "memory-region", &mem_phandle))
> +		return -ENODEV;
> +
>  	/*
>  	 * NPU2 normally has 8 ATSD registers (for concurrency) and 6 links
>  	 * so we can allocate one register per link, using nvlink index as

