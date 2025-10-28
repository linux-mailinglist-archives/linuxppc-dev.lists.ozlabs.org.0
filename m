Return-Path: <linuxppc-dev+bounces-13458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82577C15BE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 17:20:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwwZR5Jtwz3c55;
	Wed, 29 Oct 2025 03:19:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761668399;
	cv=none; b=nliToZqPjV7uDT8yrgCjbPyXWCT3x6pdZdG9HAnlkBlfO9I0MufjBEYG8kL/rZKo9eYOmj2yqdRFCmynczTfo4onqV+rHkhSKw7iOYttyroVJ6t5mlaqY7+/xx02ta/zd1EqPpOP4uSB1e8SPQVJxHkplFkE5/nwzam/yM8s3FONj7KLYIMe9J6gLjY5XJ8IhRi12RVtI1tgd8nPMuEKrLI5iUTS9RykmU8o3W6IK3AvXLgtCFj3TLOttOnFlA9Fmu+fX3hjur+LgQUxEnarkczmp4LiBaiJzhXLddTM/V16w3eYeyFqgq2oLs/urP8YdZXunXKxdq+PnDQzjSTVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761668399; c=relaxed/relaxed;
	bh=niIA3RuWaC2fY0iSenjcVGbGvrWkO8+5pRMay2cPrMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnMNHsB4qdFnWk0S9NlwLQSZJ7k38Tm0TRjDdlDI2sJnF4lSPbAR1VTiI66Fplt9a7w4ZRclqZ4SIee1KCZgDqJI1bDATQMQ0Q4o0gFi+AJ6RzCfSCqRgUbudFXOGC1Q6nRN6Q1tf6HdvE0ZJNK25M4yllYlTUkOzELDAFDIFgP9/H1xtOwiDsLiquxyfO8s+0IHy1m92sLQqn3l+PgFnQ3HpKVz0YNZ7JmKBfxEXIwydq5lH016nhSxCjRw5BvIrkEPW9ap8AQEKhoi2VyICHIw0AUnvDWvoTJDuaHF6HcOrKfzwKa3G9GwspTqKy+H9mxWxp46TD6jodw8THMfbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TTTp2/3H; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TTTp2/3H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwwZP33nwz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 03:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761668397; x=1793204397;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ql0oHBgcfkHjGUpO+SghiDYcqKotDono1NNct+0rvfg=;
  b=TTTp2/3HhJKZjIAg6MsjPas82VDBFcEkBe+uIoXpTZgnCoAf2UdJxqUQ
   AHJjTSFj6EBPSAxw7t2AZjZZrC9+W0iq3dgWgKoXs1QtK1tAhxQ1yXXDX
   dJOXORyoMhIaN/BFxYPM+agZnDAliOUeV+ZvpzX4GoImwqZ25QVsLUvI8
   M6OnL5JTxqvB0eew3kCD4Qp+RlESxBxvVsUZCnYP5ReoRk9YflSO4UtSR
   0qjsP5cfydsy9bik7pevpho/xBDSWUbMOXI6Mzfy3FaJQ5zo+SN++aXUx
   qZVZ42mzh6r0MtDC+bD9GInRxEjZEZXYO/w8Lv/ZFJ1gjL+E/E3N7L1js
   A==;
X-CSE-ConnectionGUID: sdgqFoz6SFGWgYGAJyoTyQ==
X-CSE-MsgGUID: pE+nOHvXS0GnK4o3MQddrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74449400"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74449400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:19:54 -0700
X-CSE-ConnectionGUID: UGf4618tTTyI56XQsvU/MQ==
X-CSE-MsgGUID: AY3nXcO2R7KvdLAQ9FIFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="190528315"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:19:53 -0700
Message-ID: <bf4e81e4-70c2-434d-960d-d3b2277ac8ca@linux.intel.com>
Date: Tue, 28 Oct 2025 09:19:43 -0700
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
Subject: Re: [PATCH 1/6 v6] ACPI: extlog: Trace CPER Non-standard Section Body
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 linux-cxl@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Guo Weikang <guoweikang.kernel@gmail.com>,
 Xin Li <xin@zytor.com>, Will Deacon <will@kernel.org>,
 Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan <gshan@redhat.com>,
 Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Li Ming <ming.li@zohomail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Jon Pan-Doh <pandoh@google.com>, Lukas Wunner <lukas@wunner.de>,
 Shiju Jose <shiju.jose@huawei.com>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>
References: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
 <20251023122612.1326748-2-fabio.m.de.francesco@linux.intel.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20251023122612.1326748-2-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/23/2025 5:25 AM, Fabio M. De Francesco wrote:
> ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
> (UEFI v2.10 Appendix N 2.3), extlog_print() does not. This gap was

Latest is v2.11, right? Why not use it for reference?

> noticed by a RAS test that injected CXL protocol errors which were
> notified to extlog_print() via the IOMCA (I/O Machine Check
> Architecture) mechanism. Bring parity to the extlog_print() path by
> including a similar log_non_standard_event().
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>


>  drivers/acpi/acpi_extlog.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index f6b9562779de..47d11cb5c912 100644
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

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


