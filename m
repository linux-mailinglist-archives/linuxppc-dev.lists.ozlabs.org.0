Return-Path: <linuxppc-dev+bounces-8623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D2ABA818
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 06:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zzr5S5qqVz2ySQ;
	Sat, 17 May 2025 14:07:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747454876;
	cv=none; b=iZpkXhdy2zFfrtNqtHrbvKTwJrv/gtWM97nhMAUWEyBZMJe3IaNt8V25bl/NasAZhuD20tbSFqFM7xsbqcLXidU3/N25auSqU1ru7KNBA0McImGhk8bi9Tnv7hJ4dqtVBO8lmMcGKynregiE+t7WopROyQb0uOCkIgnF4mj74iwRnyhb+DoVutyvT43UTnXi8YqxPAD8SRGKBVLbAiLsHvj+Jj2GtzeOJVi9tHluoZbRWENU82wvSACsSgw9GporsWEeP5ZYaGFZhIwclSNYtYv0GJR14wHW/YhbzECwkLEPFzYycBv8flPwQUSvIaNhgic0jlojVi17HJnj2UL0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747454876; c=relaxed/relaxed;
	bh=ymvD8e9jcGwnNVkRQn5s3e1hF8fazQjFmmeWX4SUgSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnPuurkljT4HD1IockQ1E31xP5U5lQAQhbpUEaegzqj56sGRYkcMRNa/2lobcLpTgU8AfJqHAem0pOOFxHeXr+STJLA0oB/sdrT9F0oSi0x7nFdWUsVst9IRmmyl9GNLA2/HaECcFGmOsvlSyUnbGubmjASWivgGdriKGSHKoqkviCw+3a9O42+xO7UZJDE/JiiR/FAWws+UN2hps6+8kP53zjG2U7TaQlipI1k2/356DsA/tQYpXjbVgQLrk6gZ2FpbYMUMTkUKVob8KUa75xGySpPhNFs9fy9ENbsFTahlNYqQoE/rojKHFyrV8mHcNayRRfP7apl5m+FGCZgBWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QIws/m4G; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QIws/m4G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zzr5P6xn2z2y92
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 14:07:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747454874; x=1778990874;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W77C6inCM1GhXjW9NEVyDcxLiPphMZW3DuLr/4gjI4o=;
  b=QIws/m4GfhtdT3Cu7nBUt6N34Gc4yqcRh4hUj0YyD6k5RZ3zAP/jji2K
   04XikmfAhY3Zut5QsVelJOcdU0hPfE59rJrESs4NmgEXjkPbSUBrMZlmp
   adaKqDXo4/rKz7vAp1Ioxfe7Nttnhytxq0FKrHYJ2E4hyeuk+A3/e7BD/
   8F7Q+LZCEv0bmjL4AsTRuHt3h6CcrCZAQJ1Pcuo0Bkm+JorLFia5os8QM
   wsXzO6XrrEDpx8/uHT88mQpQDXfWe9gma90McPZor29PpN6HaidamRIJM
   v6Du3TRCR3kUt3n4TvRTijUgusKf29xrnRvAGat3NX8gu2KPGasZlONcv
   w==;
X-CSE-ConnectionGUID: QX0xLXZGRtW5vwiP8nyG2w==
X-CSE-MsgGUID: 9fwOEAN/QMiU822HEyFqjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66983843"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="66983843"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 21:07:50 -0700
X-CSE-ConnectionGUID: xspjS1dxSqyEjIEnsuE9wQ==
X-CSE-MsgGUID: nTXEVbBdRa+4hJZ3fPYxYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="142857282"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.220.144]) ([10.124.220.144])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 21:07:49 -0700
Message-ID: <6d946767-aa61-441d-965b-115e415bfd4f@linux.intel.com>
Date: Fri, 16 May 2025 21:07:48 -0700
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
Subject: Re: [PATCH 3/4] PCI/AER: Expose AER panic state via
 pci_aer_panic_enabled()
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 tglx@linutronix.de, kw@linux.com, manivannan.sadhasivam@linaro.org,
 mahesh@linux.ibm.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Hans Zhang <hans.zhang@cixtech.com>
References: <20250516165518.125495-1-18255117159@163.com>
 <20250516165518.125495-4-18255117159@163.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250516165518.125495-4-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/16/25 9:55 AM, Hans Zhang wrote:
> From: Hans Zhang <hans.zhang@cixtech.com>
>
> Add pci_aer_panic_enabled() to check if aer_panic is enabled system-wide.
> Export the function for use in error recovery logic.
>
> Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>
> ---
>   drivers/pci/pci.h      |  2 ++
>   drivers/pci/pcie/aer.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 8ddfc1677eeb..f92928dadc6a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -959,6 +959,7 @@ static inline void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge
>   #ifdef CONFIG_PCIEAER
>   void pci_no_aer(void);
>   void pci_aer_panic(void);
> +bool pci_aer_panic_enabled(void);
>   void pci_aer_init(struct pci_dev *dev);
>   void pci_aer_exit(struct pci_dev *dev);
>   extern const struct attribute_group aer_stats_attr_group;
> @@ -970,6 +971,7 @@ void pci_restore_aer_state(struct pci_dev *dev);
>   #else
>   static inline void pci_no_aer(void) { }
>   static inline void pci_aer_panic(void) { }
> +static inline bool pci_aer_panic_enabled(void) { return false; }
>   static inline void pci_aer_init(struct pci_dev *d) { }
>   static inline void pci_aer_exit(struct pci_dev *d) { }
>   static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index fa51fb8a5fe7..4fd7db90b77c 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -125,6 +125,18 @@ void pci_aer_panic(void)
>   	pcie_aer_panic = true;
>   }
>   
> +/**
> + * pci_aer_panic_enabled() - Are AER panic enabled system-wide?
> + *
> + * Return: true if AER panic has not been globally disabled through ACPI FADT,
> + * PCI bridge quirks, or the "pci=aer_panic" kernel command-line option.

I don't think we have code to disable it via ACPI FADT or PCI bridge quirks
currently, right? If yes, just list what is currently supported.

> + */
> +bool pci_aer_panic_enabled(void)
> +{
> +	return pcie_aer_panic;
> +}
> +EXPORT_SYMBOL(pci_aer_panic_enabled);
> +
>   bool pci_aer_available(void)
>   {
>   	return !pcie_aer_disable && pci_msi_enabled();

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


