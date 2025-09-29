Return-Path: <linuxppc-dev+bounces-12622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC1BA9C2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 17:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cb4PJ3TBsz3cYk;
	Tue, 30 Sep 2025 01:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759158612;
	cv=none; b=R/GklPLVEwFu3tq1BMiLM5Esywosak2GoDBh1CNz/MYi611G8g8z65RQapoQPgd+tN+VpoWq0OemfoXe+q6N0Gi1I9WPFTaMKOd978dsqe9H+Ws34qilxYR5mE0VtVv+/3n4caoEVcb6wzQS30KqormwVcK3a2YIK92tqWZnyhE8P0t7Z0wK234fravO/Lgmaa/7KymTx5fOaI5/mTlxTNTesyu90FaIDDpfd9uto2cqbtEgxFATM4f8e2lVnTyYv93k8u/iFjyIG41C1RmYiM1wB6pUscTukQ7nufdcW3EKkYd/4lEQAiehbywmTkb+ZWBa2a3FTCJI3cCVhVfLew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759158612; c=relaxed/relaxed;
	bh=CS8rDo5XB0GnRD3kx0/jgiZYn1co1mGnY8KoXMTWVYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZdfxERcgJM3wkQdTT2bKtPJua+PWsp3usuDO1e2zCJl/0dfltsAAR98eWiWlF4DbZZhy/AbzeXB1LMpVNkYFIvDIb9g6o/5GKNTF+pwPgbQZQzFKiDEq/LSOXNSfGUb7Z1lj6gCOS2qElvTch0RAyg+oKgD4bLifaZmwW7vcM2dBTYr6/objA2LlPFy9jEpM/1MZIN2OjYDHPZxxzG0XKV9xFMpTWByZ2cXrjq+n01f5zyGAY1KgSp3ZdnRc2YFS8qEQTMwP+b/9UE6aPh+Ke1XdvCr3LoW5/kIpe6OobJTvCcAl2Ns7WecG3um2OOpWOL3SF+L7ABO874lW5Kjig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P1yBw9E4; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P1yBw9E4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cb4PG0QMKz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Sep 2025 01:10:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759158610; x=1790694610;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n5QdAwV9GL/hI15XCi4gHWJImJrNkPzAtoinWYP2mKw=;
  b=P1yBw9E4vEFpsQJtpAq8Y5qWRcYfHbN1OTJD1AfX4U5FVlhPpyeceJlg
   h0jifUhyRgh90ITH5dNKH7Vqx17TvL+Fgl743d3H5f9xySKWeomvud7Cq
   0E3KEHaJJ4HucoR8fypBrT/g2Svvcwm8iVeRtUJrjgIjzbzlDCcNk/GCV
   QDG/EUJVBXiPxssGgueNi0Tndk/V+fITUtEugfTfr3XNV9spDGtG6ba0q
   OXZRzJz3gY1bcaZ1saOQhC9z8kZfwRWDGDnOq56TU5fSkeQmz12IHXegP
   KruepUCiuMR0wEupprzh97NyBPO7wxkGvdpxzu/egU3m8xv1kAT1WP7gh
   Q==;
X-CSE-ConnectionGUID: psJo92D0Ti2s10Uw6PTQcw==
X-CSE-MsgGUID: ObAKmO9lT1Ks8ZfToiZu0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65217342"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65217342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 08:10:05 -0700
X-CSE-ConnectionGUID: /YEP9TeGQ/StrMSbFoGWVA==
X-CSE-MsgGUID: KANyAnmdQYurhc68KUp4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="182544766"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 08:10:04 -0700
Received: from [10.124.221.178] (unknown [10.124.221.178])
	by linux.intel.com (Postfix) with ESMTP id 8817020B5713;
	Mon, 29 Sep 2025 08:10:03 -0700 (PDT)
Message-ID: <7b5c1235-df92-4f18-936c-3d7c0d3a6cb3@linux.intel.com>
Date: Mon, 29 Sep 2025 08:10:03 -0700
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
Subject: Re: [PATCH RESEND] PCI/AER: Check for NULL aer_info before
 ratelimiting in pci_print_aer()
To: Breno Leitao <leitao@debian.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/29/25 2:15 AM, Breno Leitao wrote:
> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> does not rate limit, given this is fatal.
>
> This prevents a kernel crash triggered by dereferencing a NULL pointer
> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> which already performs this NULL check.
>
> Cc: stable@vger.kernel.org
> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> - This problem is still happening in upstream, and unfortunately no action
>    was done in the previous discussion.
> - Link to previous post:
>    https://lore.kernel.org/r/20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org
> ---

Although we haven't identified the path that triggers this issue, adding this check is harmless.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>



>   drivers/pci/pcie/aer.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d7167..55abc5e17b8b1 100644
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
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
> change-id: 20250801-aer_crash_2-b21cc2ef0d00
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


