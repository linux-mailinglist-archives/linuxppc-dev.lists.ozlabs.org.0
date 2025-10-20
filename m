Return-Path: <linuxppc-dev+bounces-13073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6CBF2FBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 20:44:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr48x5vvwz3069;
	Tue, 21 Oct 2025 05:44:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760985873;
	cv=none; b=jDl3nXlrAfQHfkWi16gB01q+jApiuC5631bglLrg2x3xm/LUl1iDozcD781NxHbs3dpM4uLg668FYkeUVRuwPzxFXeU7u0H1Jgi+PdUHxYsy/7ohbXi03QmDp+4wo/7tUegmQKGnLIzWAOjbWh31nrbz3pPqiYX+QT24h0oXjBh6Pv9qXSthw37x2xtYDP1jmyBqXDPVzTYqPLlN28xOq2JPeYxjxOxKN+y1o3AZeyN61HFdyedNhq225s4jYmu7aPCAc/Tn6Owdh+c7ekjYJmaI1YGc1cndDxsnM3oDLugyhxFO+KGMv8fRqv4R3kZJWXoAfVZr0y5NkEcBwhxu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760985873; c=relaxed/relaxed;
	bh=raZL6yUq24ciJtyqDrZLNwmutI7Uk9/HC8PzJ8j3lk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRMIlK9dsS/pMriIHUPZLXfKbrHpGFp2thVIVPNYlyj/or15wlTmOCGjJOhDKSNVcpvq5lhQhmkPzvUksl6zNqWHgJhidjrLfIq1ae4AYqO6LNz6iPaFZNG+UeEyco/r/a7JPL/xlKu9m0kU8aDvqH1V/wulv9PdL3dL1aLwuUjO93g3KFEWm8pHUCVCPP5+1uTqW3sXmbKIyXaSg4mfPuUxblDOkTJkfHe8ROXKMvZeUHwsNWYEZU30qsVBceOLqLxczbpEMrtEdhjYexbodL2itZUte+tqABvBCVbhNjIt97iPnZ9woJczEKC/MfpolU2psTpovdcOBTr9fDIkwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jYjYjVeC; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jYjYjVeC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr48w4028z3046
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760985873; x=1792521873;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2ObGbCiinnX3wPS7uUgNt+y3BLvTCTRExvI5scP0FeU=;
  b=jYjYjVeC5Nc8bt8uCSzTqABvcaGiKDdDQxINyByV+2gHHaD/aTF+W+Uo
   +MQi5vCacgXDFWDyB+VP7DAJKo/a8LrwS1g8lX+6eylaX0+2reQk+vrrq
   WB3YUfieMEo0TvUb1hc5Ti1+LBmGSCup9ETCtK9gq8lIIhQflnesmgGci
   mbo/1oxuskqpu2uuc4Oc6kY5ObZ+i9eg+Hsd1BlouM9FqAZS7yvI4S+QA
   4lrykohP1YepafcSfPNoBeDEdnGpUYY66XVro+kLSgqqX80segNuPJLEf
   tCAgx4WGxcc9W4LMe6365r2BYLiTAwEIKhTtQhubl3yiw2TApf3z6J4CW
   Q==;
X-CSE-ConnectionGUID: jKlf/mxuQ2Oyv++Dyge/Mw==
X-CSE-MsgGUID: oAfFxH17TAuV3OI6el4DNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80733410"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="80733410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:44:30 -0700
X-CSE-ConnectionGUID: d3FDiBHcSTm/bxR2PbwNyw==
X-CSE-MsgGUID: sqgpukQaQ9i3T7zLdkbnzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187416595"
Received: from skuppusw-desk2.jf.intel.com (HELO [10.165.154.101]) ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:44:30 -0700
Message-ID: <8cfebb7f-e557-493f-9458-f770fd459d06@linux.intel.com>
Date: Mon, 20 Oct 2025 11:44:29 -0700
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
Subject: Re: [PATCH v6 5/5] PCI/AER: Clear both AER fatal and non-fatal status
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-6-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20251015024159.56414-6-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/14/25 19:41, Shuai Xue wrote:
> The DPC driver clears AER fatal status for the port that reported the
> error, but not for the downstream device that deteced the error.  The
> current recovery code only clears non-fatal AER status, leaving fatal
> status bits set in the error device.
>
> Use pci_aer_raw_clear_status() to clear both fatal and non-fatal error
> status in the error device, ensuring all AER status bits are properly
> cleared after recovery.
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

I think it needs to go to stable tree. Any Fixes: commit ?

>   drivers/pci/pcie/err.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 097990094b71..28c5ca7d86ce 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -290,7 +290,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	 */
>   	if (pcie_aer_is_native(dev)) {
>   		pcie_clear_device_status(dev);
> -		pci_aer_clear_nonfatal_status(dev);
> +		pci_aer_raw_clear_status(dev);
>   	}
>   
>   	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

