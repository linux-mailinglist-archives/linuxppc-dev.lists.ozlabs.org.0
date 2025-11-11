Return-Path: <linuxppc-dev+bounces-14104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0BDC4ED37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 16:42:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5W4j5xZBz2yvL;
	Wed, 12 Nov 2025 02:42:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762875749;
	cv=none; b=XVocpnw53EPzgcvqXgUpGgdzg64V5T0ty69n8ovMpunJMiKTtVMVuG8DamlMQUNg4Twc8ItnRK8gVwboZfplQz+0AzHxlTtns2rgo4hc1P7lePp6Vg7nYFw3zqb+O7aAObKHsjxw3dR9fWr0cOHQoCgfNOCcku6iXom2GZSpixt9MeQFYNcJJp8c6l2EH63kFiOpqMIiYv+eIq0nHg/iz9bvwR8YXiZY3xqpzzzEdKPXyzCfiS905thaf56ZlvIEb4K15jf0hUMG0hKquqtOLLsjgkUByjoeB2z0gINqZmF5GbAsalOjn3qeDba1/qf9lWyb2ttkps9me4HDhAR3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762875749; c=relaxed/relaxed;
	bh=/A2jOHaHkZ0d81xVTiFIiTf5AtUpqvDyZTJRzE8ATV8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fv3PWeMkqcrFV5pkbTqiN0UVppWVv4BhV42JmRX4sVmuD9ZEuMlqVhdRmojWcIJBfF8MDn8OYogtUTqGhzxV9/29RNjqNx3ygn16c+XLHHYdwIydpf//9Z9kiyLl0cl/+2dqsw//KPqViUVA2dujDAO0hphtfqsdndUFeqMj5T8vLDP6DsJNwkgwT42Ow37EnJVGHQTPYN5LSTkhEoZHIIXBdb8jlaHNix91NFtVz3Xz0bIYhBA44gu0VOz8m+KpGJ3mWsAbX5TAzdNVxa03XYqV4ay6RdKCtcsBxW5c7Ar9PCX2sXHVVxW2y+hlW+T0FO+YR3j77H6ht84ka2ybtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5W4h3763z2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 02:42:26 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d5W4F1G38zHnGgv;
	Tue, 11 Nov 2025 23:42:05 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E6F31400D9;
	Tue, 11 Nov 2025 23:42:22 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 11 Nov
 2025 15:42:21 +0000
Date: Tue, 11 Nov 2025 15:42:20 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
CC: <linux-cxl@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"Len Brown" <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav
 Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
	"Davidlohr Bueso" <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	"Alison Schofield" <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/6 v7] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Message-ID: <20251111154220.00004767@huawei.com>
In-Reply-To: <20251104182446.863422-4-fabio.m.de.francesco@linux.intel.com>
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
	<20251104182446.863422-4-fabio.m.de.francesco@linux.intel.com>
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
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue,  4 Nov 2025 19:22:34 +0100
"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:

> GHES handles the PCI Express Error Section and also the Compute Express
> Link (CXL) Protocol Error Section. Two of its functions depend on the
> APEI PCIe AER logging/recovering support (ACPI_APEI_PCIEAER).
> 
> Make GHES select ACPI_APEI_PCIEAER and remove the conditional
> compilation from the body of two static functions that handle the CPER
> Error Sections mentioned above.

Hi Fabio,

I'm not seeing a justification here for the change and there may be
APEI platforms without PCI support.  So is this just to simplify things or
is there a functional reason that it is necessary?

Jonathan

> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/apei/Kconfig | 2 ++
>  drivers/acpi/apei/ghes.c  | 4 ----
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
> index 070c07d68dfb..cdf3cfa233b9 100644
> --- a/drivers/acpi/apei/Kconfig
> +++ b/drivers/acpi/apei/Kconfig
> @@ -23,6 +23,8 @@ config ACPI_APEI_GHES
>  	select ACPI_HED
>  	select IRQ_WORK
>  	select GENERIC_ALLOCATOR
> +	select PCIEAER
> +	select ACPI_APEI_PCIEAER
>  	select ARM_SDE_INTERFACE if ARM64
>  	help
>  	  Generic Hardware Error Source provides a way to report
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 97ee19f2cae0..d6fe5f020e96 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -613,7 +613,6 @@ static bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
>   */
>  static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  {
> -#ifdef CONFIG_ACPI_APEI_PCIEAER
>  	struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
>  
>  	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
> @@ -646,7 +645,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  				  (struct aer_capability_regs *)
>  				  aer_info);
>  	}
> -#endif
>  }
>  
>  static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
> @@ -711,7 +709,6 @@ struct work_struct *cxl_cper_prot_err_work;
>  static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
>  				   int severity)
>  {
> -#ifdef CONFIG_ACPI_APEI_PCIEAER
>  	struct cxl_cper_prot_err_work_data wd;
>  	u8 *dvsec_start, *cap_start;
>  
> @@ -767,7 +764,6 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
>  	}
>  
>  	schedule_work(cxl_cper_prot_err_work);
> -#endif
>  }
>  
>  int cxl_cper_register_prot_err_work(struct work_struct *work)


