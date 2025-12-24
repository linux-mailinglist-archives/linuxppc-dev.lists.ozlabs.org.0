Return-Path: <linuxppc-dev+bounces-14977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE465CDB28F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 03:20:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbbFx3RQLz2xqG;
	Wed, 24 Dec 2025 13:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766542853;
	cv=none; b=U0nazFSnMkQ3DHiD+b/g8YN+986WHfq3/8IgV0Eb73hjO3JtFvcale7VP2p2sq7+8X1Fnj4x9Th6U+xuF4q4OSEuiISwk9xsCEzVM4VpO7zjp7VXLxtzsDCFSe7xVKsLgyREcZaKR97Refhag6+bfhJ61rNStPx4WdIj4+41oOqicoFZqcMWCW1s4CH4iaTWrduJng/IhXsnvLAsihbzqa643u/oqiRvNu6E959CX5Q5W1JAa5GvWpzGItOpLkWJK2rvjD6959APdWP2XONDNQ/PJF92m4mXyTEQFl/d/oWt2kuRip6JmUJ8Zv+x78p/CIPC6pPboimDfwlPQB501A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766542853; c=relaxed/relaxed;
	bh=DsuUw8mDsVFd2QwMG/+NlitjPB43hNju25EUa8abfJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0L1TUVNe5UxN3Ah5qoZ1j1X0CKkL4LcNlvUPhNNCBscj+4tBbsp2/qyoKZ39qzpcYCCq94RBkB+afqwKYylULZNIhAyx9bAlgSVUSPEFnZx46Rj9AQOx2OHloUEhWEMYMKEyd/snLG153f+/duCwP8D8bX6TEp0QYZryajhkIgBuUIZVdDV5ZCJSXof4FCC+LPjjT4v7nhLzX7ko3WfroaGNAIRb0iTV89/iY5Oh/pCAckfPoGOpbq6/gHgEbcGOxBYWcNkbmWbHQE6PEEh5Mp0pk+eYruM6AIP5ru2iqPn9aayI7wcpWvsBLIQcXsw6JHUTyk0382QkNKg5kxUHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YXpCVweg; dkim-atps=neutral; spf=pass (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YXpCVweg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbbFt0D5Cz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 13:20:47 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766542842; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=DsuUw8mDsVFd2QwMG/+NlitjPB43hNju25EUa8abfJ4=;
	b=YXpCVwegg8RZ9E7xPMXXrHkhODPY1fiMdbG4eXtIXPiBap0V0t8f5xq4V3WjWQFtPb9M777FqG0VAa1Zz2c0pCSNcL2WZKMh4TTUx1UfGwfbboPD2xNPrD6lWVgkcUS8GoqNQ7VlVrfU626Ap/lKJVHp0U6srj+PzPZ9BlJRaJU=
Received: from 30.246.163.226(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WvZKr8p_1766542840 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 24 Dec 2025 10:20:41 +0800
Message-ID: <eb991e64-21ec-4d26-b5cc-e2061163d0c4@linux.alibaba.com>
Date: Wed, 24 Dec 2025 10:20:39 +0800
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
Subject: Re: [PATCH 2/5 v8] ACPI: extlog: Trace CPER PCI Express Error Section
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 linux-cxl@vger.kernel.org
Cc: Rafael J Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <20251219124042.3759749-1-fabio.m.de.francesco@linux.intel.com>
 <20251219124042.3759749-3-fabio.m.de.francesco@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20251219124042.3759749-3-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/19/25 8:39 PM, Fabio M. De Francesco wrote:
> I/O Machine Check Architecture events may signal failing PCIe components
> or links. The AER event contains details on what was happening on the wire
> when the error was signaled.
> 
> Trace the CPER PCIe Error section (UEFI v2.11, Appendix N.2.7) reported
> by the I/O MCA.
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>   drivers/acpi/acpi_extlog.c | 34 ++++++++++++++++++++++++++++++++++
>   drivers/pci/pcie/aer.c     |  2 +-
>   2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index 47d11cb5c9120..88a2237772c26 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -132,6 +132,36 @@ static int print_extlog_rcd(const char *pfx,
>   	return 1;
>   }
>   
> +static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
> +			      int severity)
> +{
> +#ifdef ACPI_APEI_PCIEAER
> +	struct aer_capability_regs *aer;
> +	struct pci_dev *pdev;
> +	unsigned int devfn;
> +	unsigned int bus;
> +	int aer_severity;
> +	int domain;
> +
> +	if (!(pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
> +	      pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO))
> +		return;
> +
> +	aer_severity = cper_severity_to_aer(severity);
> +	aer = (struct aer_capability_regs *)pcie_err->aer_info;
> +	domain = pcie_err->device_id.segment;
> +	bus = pcie_err->device_id.bus;
> +	devfn = PCI_DEVFN(pcie_err->device_id.device,
> +			  pcie_err->device_id.function);
> +	pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
> +	if (!pdev)
> +		return;
> +
> +	pci_print_aer(pdev, aer_severity, aer);
> +	pci_dev_put(pdev);
> +#endif
> +}
> +
>   static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			void *data)
>   {
> @@ -183,6 +213,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			if (gdata->error_data_length >= sizeof(*mem))
>   				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>   						       (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> +			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
> +
> +			extlog_print_pcie(pcie_err, gdata->error_severity);

Hi, Fabio,

If PCIe errors are signaled by IOMCA, do we also need to queue a work to
recover the error like we do in ghes_handle_aer()?

Thanks.
Shuai

