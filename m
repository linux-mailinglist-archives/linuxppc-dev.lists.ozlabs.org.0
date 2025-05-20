Return-Path: <linuxppc-dev+bounces-8742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE71EABD6B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sgg5F0Qz3bn1;
	Tue, 20 May 2025 21:26:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747740367;
	cv=none; b=Duox7Ytfx7bAkY7eOcwG6cmjRDS9cOGstJul5ENjxHRQXaGwwz7usK0zHq8W4zIZjUyVJqAMTfvlrcCHabXiIlCopfjjo6mnyNIkGEPJ0UwFzEjXw7afC//JQrxGfyL0gvNepMP2pKOCn8OIlhE1ZYj8d01oDjQfboGSoCuzsuh8D9mqhhivRxhtCHX4fp5me1+lKULb+Z88r8zW+tcUwq7Z5xTMX3xHvOCICznRF+iOBOpyMljv7ss+SpRjb8zsh5zHXgaMUt719iNN3cRZXe9CkAf25XpbTq2vbYnJhFw0vT3xq2ceZvHvunjP7Kmdt7ObWT6HFjEwlcH5SsdVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747740367; c=relaxed/relaxed;
	bh=xRduYVYG77ZlIM1rb3633pI600fjLDVOd2EHLVBdMCw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7AV5yfnumZ0qMM9sp2/FqG8Kffw/hhLp6U8qEgpdXG2IUcXsMFmxtBSVqaQFNf9g3jF0jhBXx1qzQW5KUoES7JhxnRLOjcC9N8rgNkTverCAuO7QVXYMbR098raoCrm366GtYVzZnEGWyBrcEV2FhOsNs7UT9Cvdbik5lFg3UvK8+LFFhZiTPK60OKQ4gtH4WLjtFm6Zj5jsGn6GJFkPdKSQpxv9tRhr9ldqSNKzgXRkvLQn4iAanNiU42eJkNgVY6nkI2cufmjEiUqJTBgVRBjDxwIWJZPjmp4GxH+ID4Xr1QbV5GK/B3EHKVH1hFphOC2V5CBuI80wSZu8bD+lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1sgf20Wkz3blk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:26:04 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b1sBD4ZWFz6M4rd;
	Tue, 20 May 2025 19:04:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 77202140114;
	Tue, 20 May 2025 19:08:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 May
 2025 13:08:53 +0200
Date: Tue, 20 May 2025 12:08:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <linux-edac@vger.kernel.org>
Subject: Re: [PATCH 1/4 v2] ACPI: extlog: Trace CPER Non-standard Section
 Body
Message-ID: <20250520120851.000062cf@huawei.com>
In-Reply-To: <20250429172109.3199192-2-fabio.m.de.francesco@linux.intel.com>
References: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
	<20250429172109.3199192-2-fabio.m.de.francesco@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 29 Apr 2025 19:21:06 +0200
"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:

> ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
> (UEFI v2.10 Appendix N 2.3), extlog_print() does not. This gap was
> noticed by a RAS test that injected CXL protocol errors which were
> notified to extlog_print() via the IOMCA (I/O Machine Check
> Architecture) mechanism. Bring parity to the extlog_print() path by
> including a similar log_non_standard_event().
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
Makes sense to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/acpi/acpi_extlog.c | 6 ++++++
>  drivers/ras/ras.c          | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index f7fb7205028d..caca6ccd6e99 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -182,6 +182,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
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
> index a6e4792a1b2e..ac0e132ccc3e 100644
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


