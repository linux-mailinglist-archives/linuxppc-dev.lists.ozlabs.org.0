Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC646150850
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 15:24:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B9853Lb1zDqPT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 01:24:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.76.210; helo=huawei.com;
 envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=Huawei.com
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B95v5kGnzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 01:22:59 +1100 (AEDT)
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id CEB0FD4404B5C2881A6C;
 Mon,  3 Feb 2020 14:22:56 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml707-cah.china.huawei.com (10.201.108.48) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 3 Feb 2020 14:22:56 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 3 Feb 2020
 14:22:56 +0000
Date: Mon, 3 Feb 2020 14:22:54 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 14/27] nvdimm/ocxl: Add support for near storage
 commands
Message-ID: <20200203142254.00007377@Huawei.com>
In-Reply-To: <20191203034655.51561-15-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-15-alastair@au1.ibm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.57]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 alastair@d-silva.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>, Dan Williams <dan.j.williams@intel.com>, Hari
 Bathini <hbathini@linux.ibm.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Dec 2019 14:46:42 +1100
Alastair D'Silva <alastair@au1.ibm.com> wrote:

> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Similar to the previous patch, this adds support for near storage commands.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/nvdimm/ocxl/scm.c          |  6 +++++
>  drivers/nvdimm/ocxl/scm_internal.c | 41 ++++++++++++++++++++++++++++++
>  drivers/nvdimm/ocxl/scm_internal.h | 38 +++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
> 
> diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
> index 1e175f3c3cf2..6c16ca7fabfa 100644
> --- a/drivers/nvdimm/ocxl/scm.c
> +++ b/drivers/nvdimm/ocxl/scm.c
> @@ -310,12 +310,18 @@ static int scm_setup_command_metadata(struct scm_data *scm_data)
>  	int rc;
>  
>  	mutex_init(&scm_data->admin_command.lock);
> +	mutex_init(&scm_data->ns_command.lock);
>  
>  	rc = scm_extract_command_metadata(scm_data, GLOBAL_MMIO_ACMA_CREQO,
>  					  &scm_data->admin_command);
>  	if (rc)
>  		return rc;
>  
> +	rc = scm_extract_command_metadata(scm_data, GLOBAL_MMIO_NSCMA_CREQO,
> +					  &scm_data->ns_command);
> +	if (rc)
> +		return rc;
> +

Ah. So much for my comment in previous patch.  Ignore that...

>  	return 0;
>  }
>  
> diff --git a/drivers/nvdimm/ocxl/scm_internal.c b/drivers/nvdimm/ocxl/scm_internal.c
> index 7b11b56863fb..c405f1d8afb8 100644
> --- a/drivers/nvdimm/ocxl/scm_internal.c
> +++ b/drivers/nvdimm/ocxl/scm_internal.c
> @@ -132,6 +132,47 @@ int scm_admin_response_handled(const struct scm_data *scm_data)
>  				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_ACRA);
>  }
>  
> +int scm_ns_command_request(struct scm_data *scm_data, u8 op_code)
> +{
> +	u64 val;
> +	int rc = ocxl_global_mmio_read64(scm_data->ocxl_afu, GLOBAL_MMIO_CHI,
> +					 OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	if (!(val & GLOBAL_MMIO_CHI_NSCRA))
> +		return -EBUSY;
> +
> +	return scm_command_request(scm_data, &scm_data->ns_command, op_code);
> +}
> +
> +int scm_ns_response(const struct scm_data *scm_data)
> +{
> +	return scm_command_response(scm_data, &scm_data->ns_command);
> +}
> +
> +int scm_ns_command_execute(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_HCI,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_HCI_NSCRW);
> +}
> +
> +bool scm_ns_command_complete(const struct scm_data *scm_data)
> +{
> +	u64 val = 0;
> +	int rc = scm_chi(scm_data, &val);
> +
> +	WARN_ON(rc);
> +
> +	return (val & GLOBAL_MMIO_CHI_NSCRA) != 0;
> +}
> +
> +int scm_ns_response_handled(const struct scm_data *scm_data)
> +{
> +	return ocxl_global_mmio_set64(scm_data->ocxl_afu, GLOBAL_MMIO_CHIC,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_NSCRA);
> +}
> +
>  void scm_warn_status(const struct scm_data *scm_data, const char *message,
>  		     u8 status)
>  {
> diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
> index 9bff684cd069..9575996a89e7 100644
> --- a/drivers/nvdimm/ocxl/scm_internal.h
> +++ b/drivers/nvdimm/ocxl/scm_internal.h
> @@ -108,6 +108,7 @@ struct scm_data {
>  	struct ocxl_context *ocxl_context;
>  	void *metadata_addr;
>  	struct command_metadata admin_command;
> +	struct command_metadata ns_command;
>  	struct resource scm_res;
>  	struct nd_region *nd_region;
>  	char fw_version[8+1];
> @@ -176,6 +177,42 @@ int scm_admin_command_complete_timeout(const struct scm_data *scm_data,
>   */
>  int scm_admin_response_handled(const struct scm_data *scm_data);
>  
> +/**
> + * scm_ns_command_request() - Issue a near storage command request
> + * @scm_data: a pointer to the SCM device data
> + * @op_code: The op-code for the command
> + * Returns an identifier for the command, or negative on error
> + */
> +int scm_ns_command_request(struct scm_data *scm_data, u8 op_code);
> +
> +/**
> + * scm_ns_response() - Validate a near storage response
> + * @scm_data: a pointer to the SCM device data
> + * Returns the status code of the command, or negative on error
> + */
> +int scm_ns_response(const struct scm_data *scm_data);
> +
> +/**
> + * scm_ns_command_execute() - Notify the controller to start processing a pending near storage command
> + * @scm_data: a pointer to the SCM device data
> + * Returns 0 on success, negative on error
> + */
> +int scm_ns_command_execute(const struct scm_data *scm_data);
> +
> +/**
> + * scm_ns_command_complete() - Is a near storage command executing
> + * scm_data: a pointer to the SCM device data
> + * Returns true if the previous admin command has completed
> + */
> +bool scm_ns_command_complete(const struct scm_data *scm_data);
> +
> +/**
> + * scm_ns_response_handled() - Notify the controller that the near storage response has been handled
> + * scm_data: a pointer to the SCM device data
> + * Returns 0 on success, negative on failure
> + */
> +int scm_ns_response_handled(const struct scm_data *scm_data);
> +
>  /**
>   * scm_warn_status() - Emit a kernel warning showing a command status.
>   * @scm_data: a pointer to the SCM device data
> @@ -184,3 +221,4 @@ int scm_admin_response_handled(const struct scm_data *scm_data);
>   */
>  void scm_warn_status(const struct scm_data *scm_data, const char *message,
>  		     u8 status);
> +
Stray blank line!

Now we are into the real nitpicks.  Not enough coffee.

Jonathan


