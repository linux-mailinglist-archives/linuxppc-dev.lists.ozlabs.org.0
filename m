Return-Path: <linuxppc-dev+bounces-13448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD82C15429
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 15:54:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwtgg68Jbz3dTY;
	Wed, 29 Oct 2025 01:54:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761663263;
	cv=none; b=GRvbzYEtnEaEjTIdRfWEX/uvd9FckIJoahdB4k7xx+q3B1N+fJg06Di8rrUY5gv2j9NM8Rn2BpI0d1tSRHEV6cLBiJwfWEqALcRWd+J7Zc6cfe8DzrCuyhKLFeCazpxdRF2BUr04TbLnz2rpE7khUt7easQqr+ujJOMF7w9+IpU5Pz7QDOhib4ys+Xs9/kO74WfzWPdd8/KqOj2Zyr3Kf07hCy/AcRtmwnvPIlJia0ycCBRA/s4Vbq6BwEmHHgnerdeTqGFditgJTp87TTxERy0/JBQCwoa1H8NWx2gLwU5fowv/apR770VVHI+PWZ2cvxlmV9fZ4FycoxNpBgAuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761663263; c=relaxed/relaxed;
	bh=8ZlGzCfWx6hQca2N67AU/T4OIDshHG9Jx91UXAF3QDk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TjO+pF8pf8zb7XdlngR9CTJXgUZ5u0ECsGUxVPK2Rwf7Nr49mmHijZYZXTMl2cAfvvHRCIYPyTFZYT4dN8Fo1wgdweSVdu4tUBd8FbvEg/bsW3zs0iHakOkG29yn++sK6cH09zcG7j41IwKEnJWgjSdNbDgb+M5tssiRjuxAN+f4UF3H5BSMPDLgZbW3Ql0Z7LAhsp9w3V+IQna9jlV8I1NyuqiT06Ak6ab5PfVKfhCKf5q1nsQAnuKOTrIJ46ZIcUCoGZhj317+PgUrjrpWT/wN74py0M4jQo+UllObrXO3lOyQ2VRxSbniLvflAGunYgmlJHZL5YjuSxoQ4poDIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 355 seconds by postgrey-1.37 at boromir; Wed, 29 Oct 2025 01:54:22 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwtgf2XSGz3cnS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:54:22 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cwtbY1HTSz6HJcR;
	Tue, 28 Oct 2025 22:50:49 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 303081402EF;
	Tue, 28 Oct 2025 22:54:19 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 28 Oct
 2025 14:54:17 +0000
Date: Tue, 28 Oct 2025 14:54:15 +0000
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
	Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Huacai Chen
	<chenhuacai@kernel.org>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Arnd Bergmann <arnd@arndb.de>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, "Guo
 Weikang" <guoweikang.kernel@gmail.com>, Xin Li <xin@zytor.com>, Will Deacon
	<will@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan
	<gshan@redhat.com>, Smita Koralahalli
	<Smita.KoralahalliChannabasappa@amd.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6n?=
 =?ISO-8859-1?Q?ig?= <u.kleine-koenig@baylibre.com>, Li Ming
	<ming.li@zohomail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Karolina Stolarek
	<karolina.stolarek@oracle.com>, Jon Pan-Doh <pandoh@google.com>, "Lukas
 Wunner" <lukas@wunner.de>, Shiju Jose <shiju.jose@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 4/6 v6] acpi/ghes: Add helper for CXL protocol errors
 checks
Message-ID: <20251028145415.000034bd@huawei.com>
In-Reply-To: <20251023122612.1326748-5-fabio.m.de.francesco@linux.intel.com>
References: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
	<20251023122612.1326748-5-fabio.m.de.francesco@linux.intel.com>
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
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 23 Oct 2025 14:25:39 +0200
"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:

> Move the CPER CXL protocol errors validity out of

validity check

> cxl_cper_post_prot_err() to cxl_cper_sec_prot_err_valid() and limit the

to new cxl_cper_sec_prot_err_valid() 

as otherwise it sounds like it already exists.

> serial number check only to CXL agents that are CXL devices (UEFI v2.10,
> Appendix N.2.13).

Perhaps a little more here on why.  I assume because you are going to have
a second user for it, but good to say that. Also serves to justify the
export.

> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
>  include/cxl/event.h      | 10 ++++++++++
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index d6fe5f020e96..e69ae864f43d 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -706,30 +706,42 @@ static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
>  static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
>  struct work_struct *cxl_cper_prot_err_work;
>  
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> +int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)

Useful to return an error number?  Or would a bool be better given it is either
valid or not?

Otherwise looks good to me,

Jonathan

>  {
> -	struct cxl_cper_prot_err_work_data wd;
> -	u8 *dvsec_start, *cap_start;
> -
>  	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
>  		pr_err_ratelimited("CXL CPER invalid agent type\n");
> -		return;
> +		return -EINVAL;
>  	}
>  
>  	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
>  		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> -		return;
> +		return -EINVAL;
>  	}
>  
>  	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
>  		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
>  				   prot_err->err_len);
> -		return;
> +		return -EINVAL;
>  	}
>  
> -	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> -		pr_warn(FW_WARN "CXL CPER no device serial number\n");
> +	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
> +	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
> +	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> +		pr_warn_ratelimited(FW_WARN
> +				    "CXL CPER no device serial number\n");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
> +
> +static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +				   int severity)
> +{
> +	struct cxl_cper_prot_err_work_data wd;
> +	u8 *dvsec_start, *cap_start;
> +
> +	if (cxl_cper_sec_prot_err_valid(prot_err))
> +		return;
>  
>  	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
>  



