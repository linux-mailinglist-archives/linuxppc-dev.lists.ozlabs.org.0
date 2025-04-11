Return-Path: <linuxppc-dev+bounces-7589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8D4A85408
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 08:20:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYmjx1rPKz3bsY;
	Fri, 11 Apr 2025 16:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744351440;
	cv=none; b=LvDUrmr/X1VbCtFdRS4kDgNsrh2TnstweqMUU4dUNHNed3QGBZW2mM/Sbs+FAaYypb3cnMPe+QYUxTr4ufuo4CWT0ErWttvcQI+VNcy9t/jODXv44iSXmOIYCIW/3GX0co7mPt83a8Ff2RvHbJ4Jwv3xu4xezqt9sCt0zYLi1Q7p3pVJYXrorrlH4PvK2Vp7V2kC0qwwzAgwvSzBRQPGcaprzMTvTVLPX8di8vy2mnrD4mre+WdfngPtaWaI+582XDloNa5A0MD1X9YYWXO8CFucbbQEEWEY7ZY5yWBDveqy80yxXC51Ao75+ruPDdi0SUOgR08/Mwmxz3AuUyo1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744351440; c=relaxed/relaxed;
	bh=uJQQMibyfuVjox29xt3pah4Pv5FCw5xqsgjOfo50QKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOlIZ2ASJ/l77LJD+soDFnvb8pjibN2KfuvNedvkVrNV031da4nPxFNwd03aWd/5Hb8fmcSHuAkZ0ZGvhHWmPDobeERYsitVMtyNPL0SuKecPNtg/KkxEPCLATE9P+nQOKC5/ngHF+6x6YRt34SlLIiuo5CSytaB32lfa/hXHqAilNXjsihate7Og314sKLSeGrRol3TTB347xG7+h+NSlQ7WQzvsw2XhtxMJ/OL7ebxdfzt57zSUAFV7J44YVsyZELjRIM9SokAwptb9Zd+IjixAc3Qjtml5qwC3qlp8n6CEBwpxlu5b3Mha6wk1VveFFQXlUKGLPXhUhORFm0CEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCUhBYLK; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=michal.swiatkowski@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCUhBYLK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=michal.swiatkowski@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 11 Apr 2025 16:03:58 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYmMy0gmgz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:03:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744351438; x=1775887438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKf5KeOfLVorPYyoK1YgtGvlZbAV4fKd+y+iIgoc1QM=;
  b=OCUhBYLKPxxELCoSZ/DwtPkdU1wsF2nzxi+EJLtNSxY2y2iakdNwqxXb
   r0vse8bLbbdM18GMpSFVt2XrfityyIdAzEnmhl6ZznDwdLDFk9aYbiPB2
   sa9xQXbvbOkuCGaXiqQiYAOuE/lrXTh+HIj85QwQRXU85LPAjUN1Jb6PZ
   jWcKxN06x4LmOYnYvRhR/R5OAhAXzZxnh1f8bDRHQeyHgH/DfISzYDHAp
   +1fk4H/ZDMY/5kwfP6v7blKl3JweM4XpFjJUUQfq5sirBdZWyVO9JFEVW
   hAeP/NwXdtPt0zNMUOhk9ni32jIv2lDDHVd5/Bkn91iizZtpmn88xUnIR
   A==;
X-CSE-ConnectionGUID: dIYLDlIKSlu5jTOddqzY0g==
X-CSE-MsgGUID: DkoG84rVSyecCnt+IesXwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45134284"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45134284"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 23:02:49 -0700
X-CSE-ConnectionGUID: Ffy9UZLTSQ+xVtBq5owDwg==
X-CSE-MsgGUID: m+1ODMQyQL+LR7bUxitJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129072671"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 23:02:48 -0700
Date: Fri, 11 Apr 2025 08:02:31 +0200
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] ibmveth: Use WARN_ON with error handling rather
 than BUG_ON
Message-ID: <Z/iwd8qonlrfOkO5@mev-dev.igk.intel.com>
References: <20250410183918.422936-1-davemarq@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410183918.422936-1-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 10, 2025 at 01:39:18PM -0500, Dave Marquardt wrote:
> - Replaced BUG_ON calls with WARN_ON calls with error handling,
>   with calls to a new ibmveth_reset routine, which resets the device.
> - Added KUnit tests for ibmveth_remove_buffer_from_pool and
>   ibmveth_rxq_get_buffer under new IBMVETH_KUNIT_TEST config option.
> - Removed unneeded forward declaration of ibmveth_rxq_harvest_buffer.

It will be great if you split this patch into 3 patches according to
your description.

> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/Kconfig   |  13 ++
>  drivers/net/ethernet/ibm/ibmveth.c | 242 ++++++++++++++++++++++++++---
>  drivers/net/ethernet/ibm/ibmveth.h |  65 ++++----
>  3 files changed, 269 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/Kconfig b/drivers/net/ethernet/ibm/Kconfig
> index c0c112d95b89..4f4b23465c47 100644
> --- a/drivers/net/ethernet/ibm/Kconfig
> +++ b/drivers/net/ethernet/ibm/Kconfig
> @@ -27,6 +27,19 @@ config IBMVETH
>  	  To compile this driver as a module, choose M here. The module will
>  	  be called ibmveth.
>  
> +config IBMVETH_KUNIT_TEST
> +	bool "KUnit test for IBM LAN Virtual Ethernet support" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	depends on KUNIT=y && IBMVETH=y
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for the IBM LAN Virtual Ethernet driver.
> +
> +	  For more information on KUnit and unit tests in general, please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +	  If unsure, say N.
> +
>  source "drivers/net/ethernet/ibm/emac/Kconfig"
>  
>  config EHEA
> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index 04192190beba..ea201e5cc8bc 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -28,6 +28,7 @@
>  #include <linux/ip.h>
>  #include <linux/ipv6.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
>  #include <asm/hvcall.h>
>  #include <linux/atomic.h>
>  #include <asm/vio.h>
> @@ -39,8 +40,6 @@
>  #include "ibmveth.h"
>  
>  static irqreturn_t ibmveth_interrupt(int irq, void *dev_instance);
> -static void ibmveth_rxq_harvest_buffer(struct ibmveth_adapter *adapter,
> -				       bool reuse);
>  static unsigned long ibmveth_get_desired_dma(struct vio_dev *vdev);
>  
>  static struct kobj_type ktype_veth_pool;
> @@ -231,7 +230,10 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
>  		index = pool->free_map[free_index];
>  		skb = NULL;
>  
> -		BUG_ON(index == IBM_VETH_INVALID_MAP);
> +		if (WARN_ON(index == IBM_VETH_INVALID_MAP)) {
> +			(void)schedule_work(&adapter->work);

What is the purpose of void casting here (and in other places in this
patch)?

> +			goto failure2;

Maybe increment_buffer_failure, or sth that is telling what happen after
goto.

> +		}
>  
>  		/* are we allocating a new buffer or recycling an old one */
>  		if (pool->skbuff[index])
> @@ -300,6 +302,7 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
>  		                 DMA_FROM_DEVICE);
>  	dev_kfree_skb_any(pool->skbuff[index]);
>  	pool->skbuff[index] = NULL;
> +failure2:
>  	adapter->replenish_add_buff_failure++;
>  
>  	mb();
> @@ -370,20 +373,36 @@ static void ibmveth_free_buffer_pool(struct ibmveth_adapter *adapter,
>  	}
>  }
>  

[...]

