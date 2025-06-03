Return-Path: <linuxppc-dev+bounces-9120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D7ACCECC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 23:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBk645fFTz2ySg;
	Wed,  4 Jun 2025 07:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748985372;
	cv=none; b=Jg7y2NuxW6L4AsF0yvJJ816KYuIVJCeRteooIlKDDUBdZhuzj5QRaTB30ghGqtCdXitEObFXzmEQzqPntXy/DtI0MhsmTR36cp1BbwPc6wXEpfzovOk1Z24w5IoWTcSoF8GsUW3Vtv1/J5fnDBU8RG3XWyJ44BwblueHL0xkif0Yh2YFO3WOUm+4Jx71Ym8KPWzwVOaL/EgV/pdDfNCLY/Oxwq4R4XDEeSBfGJuXTeAEapnyDkadQ7RbPlB4/PqlNP8VCYRsEe1c3V2uIOZc/S6axl095eIpeV1lZazgVOWf0w/hx8URtwlVJ1AFhDeDlMMHNVG7EmvcM2anrlT47w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748985372; c=relaxed/relaxed;
	bh=ljbuoxnXbJU5gw/REDtCCD2JuvU3OEdUycniFZoTyuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTr7YtUzVgHvvv4R+sFujQcfkG2UXLqwjWsZxu8z/uF1nVQWvmpo8Ty5xwQ2ZX31tG4cIOt5N+SUZpv8/nkiRwTqhzXB8oXzHwzT//stsNAjy+hjkNzZ03bPdSsMtJpqoJku8+RaP6Risiy88uj6pf/FyDj7Qsh9Ys9diWDbyJcqxuQMC/7a67+/ijZmzSi3Lc6oNlQsnAf2vmaQfVB97hGKPcBKb2NHx/vDIyJSSlJdlMS0RLM9oTzJddpmR61x6+otHYXYiSnpPs1pg9uNu8kYCUp2Fyeb/1XA+I/5G+nCu/6AX8Ju0yib3AdCjn+zsdzSe/wfwRHKVyeB8Iv7Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUhAlaGE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUhAlaGE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 04 Jun 2025 07:16:07 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBk5z1qLzz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 07:16:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748985367; x=1780521367;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+8XUA1Yj3EXGtJ0QJw8cNrvcC7jxpUxiyf5VO6aExHY=;
  b=OUhAlaGE83F/4Zw4LEDgUKjweal5dRK4LfgRT1swg+48rdyCXLUW3eo6
   5ZXNlSDClTARrmU6/Y3dO/vbvIRUuqA5kJ4YO1dZBWWJg4bpzYr9YXhTM
   55kzCjMxp0OMOgHzoqgCelZTPugebJPiejfNxnYJ2J19AhQVMFA0TorQq
   MUE09QMqfwbVggu8PYlhWpEwM3PR4F1VTLBSARhHAL/D0o1guOA4yYswW
   WqPTB48K0W+7lJdShip+MVBtJJCJDS3okGHCf1ki2uiBpOkZOMQcIYnJ3
   jmWbrV4OD8lQRU3lgtt0tDMQvwqN6FIxCLxK0AkpQ0GBwdD7ZzBnpw7Wf
   g==;
X-CSE-ConnectionGUID: ethuIsfjQT2IJtjgQ74X2g==
X-CSE-MsgGUID: bNdS5XTAQkSzpqV/G8DAtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62401775"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="62401775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:14:59 -0700
X-CSE-ConnectionGUID: hpPJib8GR+u14TohnCFh2Q==
X-CSE-MsgGUID: 6cFTCHi2Qb2p+BeJdAgY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="145927047"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.110.198]) ([10.125.110.198])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:14:58 -0700
Message-ID: <d74249cf-e3e3-4e5c-a086-26e5a91750c7@intel.com>
Date: Tue, 3 Jun 2025 14:14:56 -0700
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
Subject: Re: [PATCH 1/4 v3] ACPI: extlog: Trace CPER Non-standard Section Body
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>
References: <20250603155536.577493-1-fabio.m.de.francesco@linux.intel.com>
 <20250603155536.577493-2-fabio.m.de.francesco@linux.intel.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250603155536.577493-2-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 6/3/25 8:54 AM, Fabio M. De Francesco wrote:
> ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
> (UEFI v2.10 Appendix N 2.3), extlog_print() does not. This gap was
> noticed by a RAS test that injected CXL protocol errors which were
> notified to extlog_print() via the IOMCA (I/O Machine Check
> Architecture) mechanism. Bring parity to the extlog_print() path by
> including a similar log_non_standard_event().
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/acpi/acpi_extlog.c | 6 ++++++
>  drivers/ras/ras.c          | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index f6b9562779de0..47d11cb5c9120 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -183,6 +183,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			if (gdata->error_data_length >= sizeof(*mem))
>  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>  						       (u8)gdata->error_severity);
> +		} else {
> +			void *err = acpi_hest_get_payload(gdata);
> +
> +			log_non_standard_event(sec_type, fru_id, fru_text,
> +					       gdata->error_severity, err,
> +					       gdata->error_data_length);
>  		}
>  	}
>  
> diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
> index a6e4792a1b2e9..ac0e132ccc3eb 100644
> --- a/drivers/ras/ras.c
> +++ b/drivers/ras/ras.c
> @@ -51,6 +51,7 @@ void log_non_standard_event(const guid_t *sec_type, const guid_t *fru_id,
>  {
>  	trace_non_standard_event(sec_type, fru_id, fru_text, sev, err, len);
>  }
> +EXPORT_SYMBOL_GPL(log_non_standard_event);
>  
>  void log_arm_hw_error(struct cper_sec_proc_arm *err)
>  {


