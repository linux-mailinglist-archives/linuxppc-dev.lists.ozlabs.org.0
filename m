Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 082DA1377AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 21:07:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vYt9066rzDqhk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 07:07:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=alex.williamson@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CS+f/8bF; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vYr34tXXzDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 07:05:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578686719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPSR2mIQIOiig6JFjS6VbfWRplkUrgJKyJfU2ImkazE=;
 b=CS+f/8bFqFxdIFc4KssGeAFoY2VCAvbCADzh9OZzPtXz8wReLbVc00r4lIJkPJ0evZ7Vnm
 0fWRnHjMP3er0BMFVYhp1xvBDQQ1s8d9CUGk7eejSSX0ZftmcZb34p+DgYxkT75UD8xy63
 NhZE3TP/GRtwKlqxsByQyPgyp7stIMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-4Ow0hfPtPAC5kkXJwz8rsQ-1; Fri, 10 Jan 2020 11:03:13 -0500
X-MC-Unique: 4Ow0hfPtPAC5kkXJwz8rsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB75107ACC5;
 Fri, 10 Jan 2020 16:03:11 +0000 (UTC)
Received: from x1.home (ovpn-116-128.phx2.redhat.com [10.3.116.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70B1280680;
 Fri, 10 Jan 2020 16:03:10 +0000 (UTC)
Date: Fri, 10 Jan 2020 09:03:06 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] vfio/spapr/nvlink2: Skip unpinning pages on
 error exit
Message-ID: <20200110090306.04683f3c@x1.home>
In-Reply-To: <20191223010927.79843-1-aik@ozlabs.ru>
References: <20191223010927.79843-1-aik@ozlabs.ru>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 Dec 2019 12:09:27 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> The nvlink2 subdriver for IBM Witherspoon machines preregisters
> GPU memory in the IOMMI API so KVM TCE code can map this memory
> for DMA as well. This is done by mm_iommu_newdev() called from
> vfio_pci_nvgpu_regops::mmap.
> 
> In an unlikely event of failure the data->mem remains NULL and
> since mm_iommu_put() (which unregisters the region and unpins memory
> if that was regular memory) does not expect mem==NULL, it should not be
> called.
> 
> This adds a check to only call mm_iommu_put() for a valid data->mem.
> 
> Fixes: 7f92891778df ("vfio_pci: Add NVIDIA GV100GL [Tesla V100 SXM2] subdriver")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  drivers/vfio/pci/vfio_pci_nvlink2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
> index f2983f0f84be..3f5f8198a6bb 100644
> --- a/drivers/vfio/pci/vfio_pci_nvlink2.c
> +++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
> @@ -97,8 +97,10 @@ static void vfio_pci_nvgpu_release(struct vfio_pci_device *vdev,
>  
>  	/* If there were any mappings at all... */
>  	if (data->mm) {
> -		ret = mm_iommu_put(data->mm, data->mem);
> -		WARN_ON(ret);
> +		if (data->mem) {
> +			ret = mm_iommu_put(data->mm, data->mem);
> +			WARN_ON(ret);
> +		}
>  
>  		mmdrop(data->mm);
>  	}

Applied to vfio next branch for v5.6.  Thanks,

Alex

