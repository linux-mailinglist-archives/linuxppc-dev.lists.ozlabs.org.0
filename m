Return-Path: <linuxppc-dev+bounces-8696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F0ABCB10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 00:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1Xjz6r8Yz2yRD;
	Tue, 20 May 2025 08:41:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747694519;
	cv=none; b=YRg0tEXFi72bk5e6dSqxV0s1uNSUdmnBJLU0MTzox28/OPFGJm2EDDwby0lQKSCFg16BGumSxbOOEpGVQLgo1t9tZZuQiMOWlYAEtZv12GVkQWlIwsKSkNXeJYPhAGGGOkxND7sK3VUJJr1EGKVdxcDORegjFdvhw7pWcVwqDQtrzwpQ0ySJmkMzGuOuXHz3wPloQ1ar9Q1E6FxIr/2NTIdDWF4KaKCbk6y0FgVH6ghdqMESoZQa8LRVpeFiHNr4FaxQkW99mre2MJmTppN7Xi5vjtcAVtPPCpV7nUdIg0R21bTV6pU4MVJ+RBKRzWztzUytm6Z5OagBpwULzvvP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747694519; c=relaxed/relaxed;
	bh=b37kjNdtmcSPF9wJgIqiQq6aiSlqTFlGmQkeFUkWO9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URzsIPXSFSWW6jcPZ/IjgAK0DBzZs9QCFy5EabAlaVRcXZRNJwLpXg+c1jqXFtme0GdtlyywyzwwLgcWeuMec6ul/q3gOFPdQFa2syHPD/RPCQJshPFGHdEBDWY/c14j52lLpr+YssML/CYzuwJr4TXfC+wCfwsWjK7xwuREywAHVfiM4JRzSzNSImYSgxZMQzMnRTeJV62AaSoD8NqIlFgkaLIW52c2t0vNiuvICSQznrsJejeoJ8pUF8AbxJKVOH9J/Q2MHP8NWUBPxpP938rRqAMCPMqijInSkcPbl+cILKo01M1vh77nmAlXPt/uYweZ4hIhoklq1d8w6vU7qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RHYEmO5S; dkim-atps=neutral; spf=none (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RHYEmO5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Xjx3w9zz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 08:41:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747694518; x=1779230518;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mMXMidsfCoqJOKi8B+7joSdBmF/Wv4ltuLs090jXvPg=;
  b=RHYEmO5SoDmp/MS/F7p8uhDBingyt5DA5GWKBV1NaPAY6zDEpq8Ua9RS
   rAu46TQBsie2nH4YAp0Wdj5v4ugs/1WFT0v6krfTrkUG41kUwf4mhxAEe
   ot3Fub3mRMeEgygTO/EMEGnTofgNsMktAYI2eiS3g8deBDP32owbKWEDg
   OtBVSRWZpVegG6kBDeYSLL0MBHEnIVlk+0ueTdNfxhJuQwV0rl1PzeYEY
   CRdvg9R5JIq1i5I2OzoFB1RFbYxmFq8b4WaJamUblV9LLtL4tSCN9pzTM
   Gg4Ak9hgG24+/eZ1Zvtw66DoAGnLtCiVDxEaFdzgRAoe2+ye5P9F+8kuZ
   w==;
X-CSE-ConnectionGUID: IQe1FoTtSyqsrMArSYJ/eg==
X-CSE-MsgGUID: ALKKC49QTL20mIKzT2KWVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53408065"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53408065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 15:41:53 -0700
X-CSE-ConnectionGUID: 61PQEioIQ/iJ1hNNkacuzg==
X-CSE-MsgGUID: Zp6lnw4ETfKVUtkIljdg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139230552"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 15:41:52 -0700
Message-ID: <1b1b80e2-4f59-462e-96a9-546b1d7a7644@linux.intel.com>
Date: Mon, 19 May 2025 15:41:50 -0700
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
Subject: Re: [PATCH v6 01/16] PCI/DPC: Initialize aer_err_info before using it
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Martin Petersen <martin.petersen@oracle.com>,
 Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>,
 Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
 Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20250519213603.1257897-1-helgaas@kernel.org>
 <20250519213603.1257897-2-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-2-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Previously the struct aer_err_info "info" was allocated on the stack

/s/Previously/Currently ?

> without being initialized, so it contained junk except for the fields we
> explicitly set later.
>
> Initialize "info" at declaration so it starts as all zeroes.

/s/zeroes/zeros

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>   drivers/pci/pcie/dpc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index df42f15c9829..fe7719238456 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>   void dpc_process_error(struct pci_dev *pdev)
>   {
>   	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> -	struct aer_err_info info;
> +	struct aer_err_info info = { 0 };
>   
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


