Return-Path: <linuxppc-dev+bounces-10590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940AB1A3D9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 15:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwdJg6fdvz3bby;
	Mon,  4 Aug 2025 23:51:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754315507;
	cv=none; b=Mm2u4kNDPh/WoybXtGwzEE+botiVXZu0OhblczqBWiUvocxw1cjEJjNKfVpuCd6I8aM/pmcdLv3afzRe0AgtOTYiUavvIS9DgZH0nJPP3SnoC6+HKkZfYkD1MscQTv+/kjAscuug5U97ZLdT2Ogr8Zp2rvgw/eKBSdWuN9sRz3S2RJP+1Ul8o8AjhXvtHwCY7ZmxrshcF7bNX8g31kyD+rSMZ3bGO9eh+/ZeTd6bxfwuJ3ABYa0Bkdt4FpSDc86jkN6Ok3prf08dC7JjEF8r9iL6D7MR0VCaTVXpJBFisFgwEXKq4MZOK9ndAAkspepwP4vNhdxP7nZTLCA5N8C4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754315507; c=relaxed/relaxed;
	bh=2Jz1nCpyaLOIAJkaJ2SjsR0y0l57RP3U701r42ajFwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0TrFlEJTahZzQaome6RywkywyMBvklMnes9W3d2TBp4wLf6Kwe+ltLl+wiHqBYlC52b0pXw/Mi4tNYsG+0cGbABbWM4TkFNwV7L03Jsvt8MpSoystHQGGkMLaKlcsPQSzV4frpVtmJQxxZuQ4J0dXgSv3e38ozOfgl26gizpUWWG8D4Yb8wBTsSQg2Zo1CNA72uAl0alSXVwoEP/uLM0fe5ujB0/+g+1rG0X9gm+2oCNdXN9SUwm9AuI5M1rh6ezOu/zfHBxGat3HIgXRENunTcpvLFYV5qNexSieEFXi5E0vWTxb52gwcsZNoMnahpXjD4t2PWhQfslr2Ryd6c/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I95cH5LK; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I95cH5LK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwdJd3qrCz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 23:51:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754315506; x=1785851506;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wAwo3NXJtK1iLZDeAPP1KYlXNSvm8s8ML4jwwp6cXKs=;
  b=I95cH5LKPw+PzCq8TWawE+ND8LtGLirvH1ssfaQtiEYjdH+KS1iV+n8t
   lMfUHQlw2czJdq7LZRVE+Xh6xg/+omJiIddPg9edQAvotgV1qfHsXM3Xp
   k9uXOn4oofsBCQIYmSejBnpDklrJIOO5cKXvN1uhe+IoGRkl8ML8K1mcV
   lEQ/TiPyBK/2evjykNtwIkNCr5OnJLGFYQTdIlzCOn07qpLfRsWfS+nEw
   FjM0JY+GLXKPVlSs4ZNHkHaAeQaL8OPaofmyZmWKbNp1gAi+gSAu7FzyE
   WL2v2IoWBDyjqUG5vVotHkrNKyutqh/LJ4bZrb6Js9uZdRNYDg+ZybTrx
   Q==;
X-CSE-ConnectionGUID: dTUG5axGSKGyGXzUmtOd7w==
X-CSE-MsgGUID: ma6NMwe+TYKYUAp603TN8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56448970"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56448970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 06:50:50 -0700
X-CSE-ConnectionGUID: DcabsRD4Tm63MNlw66PDaQ==
X-CSE-MsgGUID: rjakUT2wQfqFDVRFT7qd+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164494502"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 06:50:48 -0700
Received: from [10.124.223.90] (unknown [10.124.223.90])
	by linux.intel.com (Postfix) with ESMTP id 02EB520B571C;
	Mon,  4 Aug 2025 06:50:30 -0700 (PDT)
Message-ID: <9cd9f4cf-72ab-40f1-9ead-3e6807b4d474@linux.intel.com>
Date: Mon, 4 Aug 2025 06:50:30 -0700
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
To: Breno Leitao <leitao@debian.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/4/25 2:17 AM, Breno Leitao wrote:
> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> does not rate limit, given this is fatal.

Why not add it to pci_print_aer() ?

>
> This prevents a kernel crash triggered by dereferencing a NULL pointer
> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> which already performs this NULL check.

Is this happening during the kernel boot ? What is the frequency and steps
to reproduce? I am curious about why pci_print_aer() is called for a PCI device
without aer_info. Not aer_info means, that particular device is already released
or in the process of release (pci_release_dev()). Is this triggered by using a stale
pci_dev pointer?

>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
> ---
>   drivers/pci/pcie/aer.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 70ac661883672..b5f96fde4dcda 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   
>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>   {
> +	if (!dev->aer_info)
> +		return 1;
> +
>   	switch (severity) {
>   	case AER_NONFATAL:
>   		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
>
> ---
> base-commit: 89748acdf226fd1a8775ff6fa2703f8412b286c8
> change-id: 20250801-aer_crash_2-b21cc2ef0d00
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


