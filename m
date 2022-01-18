Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02791492CE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 19:01:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jdc5k608mz30gW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 05:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBQRrDoD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cBQRrDoD; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jdc504VwFz2ynQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 05:00:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642528836; x=1674064836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CRtIESfBEA71HQ0JS1NDcLZUx6UJPI9YfbeDGWxPrcU=;
 b=cBQRrDoDw2i2XAiHsergMm5TZ0isOkIreCmvWeSJwDkUsvBBqIXuSMLX
 7V89NVytvKaH8RiELVk8P0ERu+V3vfB7uaFXIFNjSX5WBjrVuJ1+la1G4
 4McsvPcxUj5BAChgJUFU0rtsJfut/nMeokOgXq8D3oGXOwn9znQsAPzI/
 HMlxbXrZXqLkROqTKQZDcRMlzzg2mVCnvA4Xsb7nCeFygqTpCfRoDj8CQ
 B42O4z5gMjYevbr/1/zP1E0DQTw6F6A29dJcP73DnOJyNdJR/8zokQhK6
 XabiAQLwGgzdu2+CKrhCSAHg5W4SrGdpadCWC+3mCtDr2J6jjPoy1Nryv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="243700808"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="243700808"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 09:59:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="625588407"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 09:59:16 -0800
Date: Tue, 18 Jan 2022 09:59:15 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/papr_scm: Implement initial support for
 injecting smart errors
Message-ID: <20220118175915.GB209936@iweiny-DESK2.sc.intel.com>
Mail-Followup-To: Vaibhav Jain <vaibhav@linux.ibm.com>,
 nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
References: <20220113120252.1145671-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113120252.1145671-1-vaibhav@linux.ibm.com>
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
Cc: nvdimm@lists.linux.dev, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 13, 2022 at 05:32:52PM +0530, Vaibhav Jain wrote:
[snip]

>  
> +/* Inject a smart error Add the dirty-shutdown-counter value to the pdsm */
> +static int papr_pdsm_smart_inject(struct papr_scm_priv *p,
> +				  union nd_pdsm_payload *payload)
> +{
> +	int rc;
> +	u32 supported_flags = 0;
> +	u64 mask = 0, override = 0;
> +
> +	/* Check for individual smart error flags and update mask and override */
> +	if (payload->smart_inject.flags & PDSM_SMART_INJECT_HEALTH_FATAL) {
> +		supported_flags |= PDSM_SMART_INJECT_HEALTH_FATAL;
> +		mask |= PAPR_PMEM_HEALTH_FATAL;
> +		override |= payload->smart_inject.fatal_enable ?
> +			PAPR_PMEM_HEALTH_FATAL : 0;
> +	}
> +
> +	if (payload->smart_inject.flags & PDSM_SMART_INJECT_BAD_SHUTDOWN) {
> +		supported_flags |= PDSM_SMART_INJECT_BAD_SHUTDOWN;
> +		mask |= PAPR_PMEM_SHUTDOWN_DIRTY;
> +		override |= payload->smart_inject.unsafe_shutdown_enable ?
> +			PAPR_PMEM_SHUTDOWN_DIRTY : 0;
> +	}
> +

I'm struggling to see why there is a need for both a flag and an 8 bit 'enable'
value?

Ira
