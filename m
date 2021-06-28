Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48A3B5C7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 12:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD3pB1DvKz3bbR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 20:32:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=yilun.xu@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD1ww5M9Cz3096
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 19:08:16 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="188296783"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="188296783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="446493241"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.162])
 by orsmga007.jf.intel.com with ESMTP; 28 Jun 2021 02:07:05 -0700
Date: Mon, 28 Jun 2021 17:01:46 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [RFC] fpga: dfl: fme: Fix cpu hotplug code
Message-ID: <20210628090146.GA80012@yilunxu-OptiPlex-7050>
References: <20210628071546.167088-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628071546.167088-1-kjain@linux.ibm.com>
X-Mailman-Approved-At: Mon, 28 Jun 2021 20:32:17 +1000
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, luwei.kang@intel.com,
 rnsastry@linux.ibm.com, trix@redhat.com, linux-fpga@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, mdf@kernel.org, will@kernel.org, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's a good fix, you can drop the RFC in commit title. :)

The title could be more specific, like:

    fpga: dfl: fme: Fix cpu hotplug issue in performance reporting

So we know it is for performance reporting feature at first glance.

On Mon, Jun 28, 2021 at 12:45:46PM +0530, Kajol Jain wrote:

> Commit 724142f8c42a ("fpga: dfl: fme: add performance
> reporting support") added performance reporting support
> for FPGA management engine via perf.

May drop this section, it is indicated in the Fixes tag.

> 
> It also added cpu hotplug feature but it didn't add

The performance reporting driver added cpu hotplug ...

> pmu migration call in cpu offline function.
> This can create an issue incase the current designated
> cpu being used to collect fme pmu data got offline,
> as based on current code we are not migrating fme pmu to
> new target cpu. Because of that perf will still try to
> fetch data from that offline cpu and hence we will not
> get counter data.
> 
> Patch fixed this issue by adding pmu_migrate_context call
> in fme_perf_offline_cpu function.
> 
> Fixes: 724142f8c42a ("fpga: dfl: fme: add performance reporting support")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Tested-by: Xu Yilun <yilun.xu@intel.com>

Thanks,
Yilun

> ---
>  drivers/fpga/dfl-fme-perf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> ---
> - This fix patch is not tested (as I don't have required environment).
>   But issue mentioned in the commit msg can be re-created, by starting any
>   fme_perf event and while its still running, offline current designated
>   cpu pointed by cpumask file. Since current code didn't migrating pmu,
>   perf gonna try getting counts from that offlined cpu and hence we will
>   not get event data.
> ---
> diff --git a/drivers/fpga/dfl-fme-perf.c b/drivers/fpga/dfl-fme-perf.c
> index 4299145ef347..b9a54583e505 100644
> --- a/drivers/fpga/dfl-fme-perf.c
> +++ b/drivers/fpga/dfl-fme-perf.c
> @@ -953,6 +953,10 @@ static int fme_perf_offline_cpu(unsigned int cpu, struct hlist_node *node)
>  		return 0;
>  
>  	priv->cpu = target;
> +
> +	/* Migrate fme_perf pmu events to the new target cpu */
> +	perf_pmu_migrate_context(&priv->pmu, cpu, target);
> +
>  	return 0;
>  }
>  
> -- 
> 2.31.1
