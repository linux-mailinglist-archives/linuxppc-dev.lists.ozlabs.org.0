Return-Path: <linuxppc-dev+bounces-11398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014FB38A90
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 21:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBwL33Qvrz305n;
	Thu, 28 Aug 2025 05:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756324651;
	cv=none; b=S+SWZt7BDoGBd8se2kcB4ZQDCE3L1en60BwqXc9fo7zd7nd6bEoRTxNztmpaKc3CN4aBlgXCmaDjx8errs59o/8pkNseN+zY+1YXnt6nPCXPGonO9nME6egqenWdxkKVYahBhF7DmJEVqlUPEyn67VVJlT9MLjvUYbcRRUIh4k36lfHTnfUO3LMzrUqLkx7gB67Md7SZxxm+ixukYCMy9KAcg9StgF/jWYaI4gSDUnTje/VOO+F2Wr9vmS8JjhpgI7JaSe5ZTiYLKdL0FsOF6xZ9+kFTCe6PtThQHWwMY10vd5MwcZuvghy8vI0icQSupW8HsBmO5VfUSwSwH7gK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756324651; c=relaxed/relaxed;
	bh=qpETWSDCwSSfcjhsMmWO6pRDlg6Tn8yNvf0Nb8QIhK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhD6PQrFZTxj6iWxw64T5DprQYvunuzCTboECRItR6kCZd6ns2zHM2dL/55axS+a/A1U3itcYIcUbg8ODgOUB5wlmnAIUzDXyy1ChrN69UE80exjiqByDl+GdxYe57LshSd76W+Mkw2gSEzrDqLT1ntlrNjRVcWuUBqnyPN5ftCdKVFCQVNlolJEmJ6xPuGZ652X8bVjhFcZV8eHk40zg9gDCTm9PZn/72Zs66X80rozv3VoaHxZYVVNGcJV2lzzcw6HDY4T3l6ZRniy7cSK5jPWxO8arJYVpkxpQrrW+/BkoCmPqQZIaqExqi5J+qo8hsQA2VyPIy7mLLZbtWRggQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Id3YGZXU; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Id3YGZXU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBwL10HlBz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 05:57:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756324649; x=1787860649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dN/0LGTTO2mIMuv5CAHk8QNgW0R0zS/JdxacWvuYn5s=;
  b=Id3YGZXUgV73+xpvmmrtU1JLlQBN1EkYWxWcHlNJ1LvMBEnD1QNcvl8w
   PlACseUMfKx8ODmRdVBoE1oy9Dpj/VeCQX1ME/VlAg41VMCXyzpnLspJa
   nIutxpdTUoSYyo7aCixONtfnKX2rmZ7eE3fPrcBOCpdoypJWI6LDBSkSj
   UsHcZEKevkbpjsMrfojtXn1DWXCv3JfEmI7SFGo3NVjDJl6CA+/YcVm2+
   c3TEl5+ZN/+WTOjVvL8iO1E6jeYwWdTI6WYTVUAdnELi1fmVglQMoMTko
   V90ZV16lqPVXo1tiUl1sj+TIVPbNxBYuzhNiVRXuXD4QtP2fWpKiPNJ9e
   w==;
X-CSE-ConnectionGUID: 5aniK1fHSYCgG6X6yy/dPg==
X-CSE-MsgGUID: NeKFWzfNQROmcKPWhn+gow==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62229477"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="62229477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 12:57:24 -0700
X-CSE-ConnectionGUID: s2dnWLKURQGgaASzRZRyYQ==
X-CSE-MsgGUID: MvZNH5TnRHeDmqnNozbKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="200820932"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 12:57:23 -0700
Received: from [10.124.223.227] (unknown [10.124.223.227])
	by linux.intel.com (Postfix) with ESMTP id 8CC2820B571C;
	Wed, 27 Aug 2025 12:57:22 -0700 (PDT)
Message-ID: <64a661bd-cb64-4850-90d8-f34de9457173@linux.intel.com>
Date: Wed, 27 Aug 2025 12:56:41 -0700
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
Subject: Re: [PATCH] PCI/AER: Support errors introduced by PCIe r6.0
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
References: <21f1875b18d4078c99353378f37dcd6b994f6d4e.1756301211.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <21f1875b18d4078c99353378f37dcd6b994f6d4e.1756301211.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/27/25 6:41 AM, Lukas Wunner wrote:
> PCIe r6.0 defined five additional errors in the Uncorrectable Error
> Status, Mask and Severity Registers (PCIe r7.0 sec 7.8.4.2ff).

is 2ff a typo ?

>
> lspci has been supporting them since commit 144b0911cc0b ("ls-ecaps:
> extend decode support for more fields for AER CE and UE status"):
>
> https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/commit/?id=144b0911cc0b
>
> Amend the AER driver to recognize them as well, instead of logging them as
> "Unknown Error Bit".
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> Last amendment of aer_uncorrectable_error_string[] was in 2019 for an
> error introduced in PCIe r3.1, see commit 6458b438ebc1 ("PCI/AER: Add
> PoisonTLPBlocked to Uncorrectable error counters").
>
>   drivers/pci/pcie/aer.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c19..15ed541 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -43,7 +43,7 @@
>   #define AER_ERROR_SOURCES_MAX		128
>   
>   #define AER_MAX_TYPEOF_COR_ERRS		16	/* as per PCI_ERR_COR_STATUS */
> -#define AER_MAX_TYPEOF_UNCOR_ERRS	27	/* as per PCI_ERR_UNCOR_STATUS*/
> +#define AER_MAX_TYPEOF_UNCOR_ERRS	32	/* as per PCI_ERR_UNCOR_STATUS*/
>   
>   struct aer_err_source {
>   	u32 status;			/* PCI_ERR_ROOT_STATUS */
> @@ -525,11 +525,11 @@ void pci_aer_exit(struct pci_dev *dev)
>   	"AtomicOpBlocked",		/* Bit Position 24	*/
>   	"TLPBlockedErr",		/* Bit Position 25	*/
>   	"PoisonTLPBlocked",		/* Bit Position 26	*/
> -	NULL,				/* Bit Position 27	*/
> -	NULL,				/* Bit Position 28	*/
> -	NULL,				/* Bit Position 29	*/
> -	NULL,				/* Bit Position 30	*/
> -	NULL,				/* Bit Position 31	*/
> +	"DMWrReqBlocked",		/* Bit Position 27	*/
> +	"IDECheck",			/* Bit Position 28	*/
> +	"MisIDETLP",			/* Bit Position 29	*/
> +	"PCRC_CHECK",			/* Bit Position 30	*/
> +	"TLPXlatBlocked",		/* Bit Position 31	*/
>   };
>   
>   static const char *aer_agent_string[] = {

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


