Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC79B7F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 22:56:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FYbL6yHvzDrDg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 06:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FYL85pPXzDqTl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 06:44:48 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D268A2892A;
 Fri, 23 Aug 2019 20:44:45 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D08B5D6B2;
 Fri, 23 Aug 2019 20:44:44 +0000 (UTC)
Date: Fri, 23 Aug 2019 14:44:38 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] vfio/spapr_tce: Fix incorrect tce_iommu_group
 memory free
Message-ID: <20190823144438.03238f16@x1.home>
In-Reply-To: <20190819015117.94878-1-aik@ozlabs.ru>
References: <20190819015117.94878-1-aik@ozlabs.ru>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 23 Aug 2019 20:44:45 +0000 (UTC)
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
Cc: Jose Ricardo Ziviani <joserz@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Aug 2019 11:51:17 +1000
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> The @tcegrp variable is used in 1) a loop over attached groups
> 2) it stores a pointer to a newly allocated tce_iommu_group if 1) found
> nothing. However the error handler does not distinguish how we got there
> and incorrectly releases memory for a found+incompatible group.
> 
> This fixes it by adding another error handling case.
> 
> Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Applied to vfio next branch with Paul's R-b.  Thanks,

Alex

> 
> The bug is there since 2157e7b82f3b but it would not appear in practice
> before 0bd971676e68, hence that "Fixes". Or it still should be
> 157e7b82f3b ("vfio: powerpc/spapr: Register memory and define IOMMU v2")
> ?
> 
> Found it when tried adding a "compound PE" (GPU + NPUs) to a container
> with a passed through xHCI host. The compatibility test (->create_table
> should be equal) treats them as incompatible which might a bug (or
> we are just suboptimal here) on its own.
> 
> ---
>  drivers/vfio/vfio_iommu_spapr_tce.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 8ce9ad21129f..babef8b00daf 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -1234,7 +1234,7 @@ static long tce_iommu_take_ownership_ddw(struct tce_container *container,
>  static int tce_iommu_attach_group(void *iommu_data,
>  		struct iommu_group *iommu_group)
>  {
> -	int ret;
> +	int ret = 0;
>  	struct tce_container *container = iommu_data;
>  	struct iommu_table_group *table_group;
>  	struct tce_iommu_group *tcegrp = NULL;
> @@ -1287,13 +1287,13 @@ static int tce_iommu_attach_group(void *iommu_data,
>  			!table_group->ops->release_ownership) {
>  		if (container->v2) {
>  			ret = -EPERM;
> -			goto unlock_exit;
> +			goto free_exit;
>  		}
>  		ret = tce_iommu_take_ownership(container, table_group);
>  	} else {
>  		if (!container->v2) {
>  			ret = -EPERM;
> -			goto unlock_exit;
> +			goto free_exit;
>  		}
>  		ret = tce_iommu_take_ownership_ddw(container, table_group);
>  		if (!tce_groups_attached(container) && !container->tables[0])
> @@ -1305,10 +1305,11 @@ static int tce_iommu_attach_group(void *iommu_data,
>  		list_add(&tcegrp->next, &container->group_list);
>  	}
>  
> -unlock_exit:
> +free_exit:
>  	if (ret && tcegrp)
>  		kfree(tcegrp);
>  
> +unlock_exit:
>  	mutex_unlock(&container->lock);
>  
>  	return ret;

