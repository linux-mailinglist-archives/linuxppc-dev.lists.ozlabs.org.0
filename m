Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D24244D5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 19:12:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSqk92PHHzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 03:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSqgw5QwBzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 03:10:09 +1000 (AEST)
IronPort-SDR: IC1OUOfoprvzCASS71+re0eNk2xrZrajuwzZ9pQ89dv5IOurBXSMBLD12axyl5FgHdzxi4w75W
 ejRU/4wgp+5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="172501475"
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; d="scan'208";a="172501475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 10:10:06 -0700
IronPort-SDR: Cp6itaVGonyNUKcEiO366ZJ9krA+qVT4np+ED814mQm5fM8nI4/GrFwV888bHjHAPPag9JjpXO
 H74OosB/hqTQ==
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; d="scan'208";a="496239063"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 10:10:06 -0700
Date: Fri, 14 Aug 2020 10:10:06 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] libnvdimm: Add a NULL entry to
 'nvdimm_firmware_attributes'
Message-ID: <20200814171005.GB3142014@iweiny-DESK2.sc.intel.com>
References: <20200814150509.225615-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814150509.225615-1-vaibhav@linux.ibm.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 14, 2020 at 08:35:09PM +0530, Vaibhav Jain wrote:
> We recently discovered a kernel oops with 'papr_scm' module while
> booting ppc64 phyp guest with following back-trace:
> 
> BUG: Kernel NULL pointer dereference on write at 0x00000188
> Faulting instruction address: 0xc0000000005d7084
> Oops: Kernel access of bad area, sig: 11 [#1]
> <snip>
> Call Trace:
>  internal_create_group+0x128/0x4c0 (unreliable)
>  internal_create_groups.part.4+0x70/0x130
>  device_add+0x458/0x9c0
>  nd_async_device_register+0x28/0xa0 [libnvdimm]
>  async_run_entry_fn+0x78/0x1f0
>  process_one_work+0x2c0/0x5b0
>  worker_thread+0x88/0x650
>  kthread+0x1a8/0x1b0
>  ret_from_kernel_thread+0x5c/0x6c
> 
> A bisect lead to the 'commit 48001ea50d17f ("PM, libnvdimm: Add runtime
> firmware activation support")' and on investigation discovered that
> the newly introduced 'struct attribute *nvdimm_firmware_attributes[]'
> is missing a terminating NULL entry in the array. This causes a loop
> in sysfs's 'create_files()' to read garbage beyond bounds of
> 'nvdimm_firmware_attributes' and trigger the oops.
> 
> Fixes: 48001ea50d17f ("PM, libnvdimm: Add runtime firmware activation support")
> Reported-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/nvdimm/dimm_devs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvdimm/dimm_devs.c b/drivers/nvdimm/dimm_devs.c
> index 61374def51555..b59032e0859b7 100644
> --- a/drivers/nvdimm/dimm_devs.c
> +++ b/drivers/nvdimm/dimm_devs.c
> @@ -529,6 +529,7 @@ static DEVICE_ATTR_ADMIN_RW(activate);
>  static struct attribute *nvdimm_firmware_attributes[] = {
>  	&dev_attr_activate.attr,
>  	&dev_attr_result.attr,
> +	NULL,
>  };
>  
>  static umode_t nvdimm_firmware_visible(struct kobject *kobj, struct attribute *a, int n)
> -- 
> 2.26.2
> 
