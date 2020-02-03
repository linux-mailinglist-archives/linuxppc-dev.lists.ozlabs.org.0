Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E633F15095C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 16:14:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BBDz1DVNzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 02:14:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BB8g2HfczDqM2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 02:10:27 +1100 (AEDT)
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 325E14572F3C4B4F17C1;
 Mon,  3 Feb 2020 15:10:22 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 LHREML712-CAH.china.huawei.com (10.201.108.35) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 3 Feb 2020 15:10:22 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 3 Feb 2020
 15:10:21 +0000
Date: Mon, 3 Feb 2020 15:10:19 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 24/27] nvdimm/ocxl: Implement Overwrite
Message-ID: <20200203151019.0000262f@Huawei.com>
In-Reply-To: <20191203034655.51561-25-alastair@au1.ibm.com>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-25-alastair@au1.ibm.com>
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

On Tue, 3 Dec 2019 14:46:52 +1100
Alastair D'Silva <alastair@au1.ibm.com> wrote:

> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The near storage command 'Secure Erase' overwrites all data on the
> media.
> 
> This patch hooks it up to the security function 'overwrite'.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

A few things to tidy up in here.

Thanks,

Jonathan


> ---
>  drivers/nvdimm/ocxl/scm.c          | 164 ++++++++++++++++++++++++++++-
>  drivers/nvdimm/ocxl/scm_internal.c |   1 +
>  drivers/nvdimm/ocxl/scm_internal.h |  17 +++
>  3 files changed, 180 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvdimm/ocxl/scm.c b/drivers/nvdimm/ocxl/scm.c
> index a81eb5916eb3..8deb7862793c 100644
> --- a/drivers/nvdimm/ocxl/scm.c
> +++ b/drivers/nvdimm/ocxl/scm.c
> @@ -169,6 +169,86 @@ static int scm_reserve_metadata(struct scm_data *scm_data,
>  	return 0;
>  }
>  
> +/**
> + * scm_overwrite() - Overwrite all data on the card
> + * @scm_data: The SCM device data

I would mention in here that this exists with the lock held and
where that is unlocked again.

> + * Return: 0 on success
> + */
> +int scm_overwrite(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	mutex_lock(&scm_data->ns_command.lock);
> +
> +	rc = scm_ns_command_request(scm_data, NS_COMMAND_SECURE_ERASE);
> +	if (rc)

Perhaps change that goto label to reflect it is the error path rather
than a shared exit route.

> +		goto out;
> +
> +	rc = scm_ns_command_execute(scm_data);
> +	if (rc)
> +		goto out;
> +
> +	scm_data->overwrite_state = SCM_OVERWRITE_BUSY;
> +
> +	return 0;
> +
> +out:
> +	mutex_unlock(&scm_data->ns_command.lock);
> +	return rc;
> +}
> +
> +/**
> + * scm_secop_overwrite() - Overwrite all data on the card
> + * @nvdimm: The nvdimm representation of the SCM device to start the overwrite on
> + * @key_data: Unused (no security key implementation)
> + * Return: 0 on success
> + */
> +static int scm_secop_overwrite(struct nvdimm *nvdimm,
> +			       const struct nvdimm_key_data *key_data)
> +{
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +
> +	return scm_overwrite(scm_data);
> +}
> +
> +/**
> + * scm_secop_query_overwrite() - Get the current overwrite state
> + * @nvdimm: The nvdimm representation of the SCM device to start the overwrite on
> + * Return: 0 if successful or idle, -EBUSY if busy, -EFAULT if failed
> + */
> +static int scm_secop_query_overwrite(struct nvdimm *nvdimm)
> +{
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +
> +	if (scm_data->overwrite_state == SCM_OVERWRITE_BUSY)
> +		return -EBUSY;
> +
> +	if (scm_data->overwrite_state == SCM_OVERWRITE_FAILED)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/**
> + * scm_secop_get_flags() - return the security flags for the SCM device

All params need to documented in kernel-doc comments.

> + */
> +static unsigned long scm_secop_get_flags(struct nvdimm *nvdimm,
> +		enum nvdimm_passphrase_type ptype)
> +{
> +	struct scm_data *scm_data = nvdimm_provider_data(nvdimm);
> +
> +	if (scm_data->overwrite_state == SCM_OVERWRITE_BUSY)
> +		return BIT(NVDIMM_SECURITY_OVERWRITE);
> +
> +	return BIT(NVDIMM_SECURITY_DISABLED);
> +}
> +
> +static const struct nvdimm_security_ops sec_ops  = {
> +	.get_flags = scm_secop_get_flags,
> +	.overwrite = scm_secop_overwrite,
> +	.query_overwrite = scm_secop_query_overwrite,
> +};
> +
>  /**
>   * scm_register_lpc_mem() - Discover persistent memory on a device and register it with the NVDIMM subsystem
>   * @scm_data: The SCM device data
> @@ -224,10 +304,10 @@ static int scm_register_lpc_mem(struct scm_data *scm_data)
>  	set_bit(NDD_ALIASING, &nvdimm_flags);
>  
>  	snprintf(serial, sizeof(serial), "%llx", fn_config->serial);
> -	nd_mapping_desc.nvdimm = nvdimm_create(scm_data->nvdimm_bus, scm_data,
> +	nd_mapping_desc.nvdimm = __nvdimm_create(scm_data->nvdimm_bus, scm_data,
>  				 scm_dimm_attribute_groups,
>  				 nvdimm_flags, nvdimm_cmd_mask,
> -				 0, NULL);
> +				 0, NULL, serial, &sec_ops);
>  	if (!nd_mapping_desc.nvdimm)
>  		return -ENOMEM;
>  
> @@ -1530,6 +1610,83 @@ static void scm_dump_error_log(struct scm_data *scm_data)
>  	kfree(buf);
>  }
>  
> +static void scm_handle_nscra_doorbell(struct scm_data *scm_data)
> +{
> +	int rc;
> +
> +	if (scm_data->ns_command.op_code == NS_COMMAND_SECURE_ERASE) {

Feels likely that we are going to end up with quite a few blocks like this as
the driver is extended. Perhaps just start out with a switch statement and
separate functions that it calls?

> +		u64 success, attempted;
> +

One is enough here.

> +
> +		rc = scm_ns_response(scm_data);
> +		if (rc < 0) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;

If this were a separate function as suggested above, I'd use a goto to ensure we
unlock in all paths.

> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +		if (rc != STATUS_SUCCESS)
> +			scm_warn_status(scm_data, "Unexpected status from overwrite", rc);
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_SUCCESS,
> +					     OCXL_HOST_ENDIAN, &success);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_ATTEMPTED,
> +					     OCXL_HOST_ENDIAN, &attempted);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		scm_data->overwrite_state = SCM_OVERWRITE_SUCCESS;
> +		if (success != attempted)
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +
> +		dev_info(&scm_data->dev,
> +			 "Overwritten %llu/%llu accessible pages", success, attempted);

Do we want to spam the log?  Feels like dev_dbg maybe?

> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_DEFECTIVE_SUCCESS,
> +					     OCXL_HOST_ENDIAN, &success);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		rc = ocxl_global_mmio_read64(scm_data->ocxl_afu,
> +					     scm_data->ns_command.response_offset +
> +					     NS_RESPONSE_SECURE_ERASE_DEFECTIVE_ATTEMPTED,
> +					     OCXL_HOST_ENDIAN, &attempted);
> +		if (rc) {
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +			mutex_unlock(&scm_data->ns_command.lock);
> +			return;
> +		}
> +
> +		if (success != attempted)
> +			scm_data->overwrite_state = SCM_OVERWRITE_FAILED;
> +
> +		dev_info(&scm_data->dev,
> +			 "Overwritten %llu/%llu defective pages", success, attempted);

Again, maybe dev_dbg?

> +
> +		scm_ns_response_handled(scm_data);
> +
> +		mutex_unlock(&scm_data->ns_command.lock);
> +		return;
> +	}
> +}
> +
>  static irqreturn_t scm_imn0_handler(void *private)
>  {
>  	struct scm_data *scm_data = private;
> @@ -1537,6 +1694,9 @@ static irqreturn_t scm_imn0_handler(void *private)
>  
>  	(void)scm_chi(scm_data, &chi);
>  
> +	if (chi & GLOBAL_MMIO_CHI_NSCRA)
> +		scm_handle_nscra_doorbell(scm_data);
> +
>  	if (chi & GLOBAL_MMIO_CHI_ELA) {
>  		dev_warn(&scm_data->dev, "Error log is available\n");
>  
> diff --git a/drivers/nvdimm/ocxl/scm_internal.c b/drivers/nvdimm/ocxl/scm_internal.c
> index 8fc849610eaa..db919a23c69b 100644
> --- a/drivers/nvdimm/ocxl/scm_internal.c
> +++ b/drivers/nvdimm/ocxl/scm_internal.c
> @@ -173,6 +173,7 @@ int scm_ns_response_handled(const struct scm_data *scm_data)
>  				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_NSCRA);
>  }
>  
> +

Stray blank line..

>  void scm_warn_status(const struct scm_data *scm_data, const char *message,
>  		     u8 status)
>  {
> diff --git a/drivers/nvdimm/ocxl/scm_internal.h b/drivers/nvdimm/ocxl/scm_internal.h
> index af19813a7f75..4a29088612a9 100644
> --- a/drivers/nvdimm/ocxl/scm_internal.h
> +++ b/drivers/nvdimm/ocxl/scm_internal.h
> @@ -70,6 +70,15 @@
>  #define ADMIN_COMMAND_CMD_CAPS		0x08u
>  #define ADMIN_COMMAND_MAX		0x08u
>  
> +#define NS_COMMAND_SECURE_ERASE	0x20ull
> +
> +#define NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_SUCCESS 0x20
> +#define NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_ATTEMPTED 0x28
> +#define NS_RESPONSE_SECURE_ERASE_DEFECTIVE_SUCCESS 0x30
> +#define NS_RESPONSE_SECURE_ERASE_DEFECTIVE_ATTEMPTED 0x38
> +

Lot of blank lines...

> +
> +
>  #define STATUS_SUCCESS		0x00
>  #define STATUS_MEM_UNAVAILABLE	0x20
>  #define STATUS_BAD_OPCODE	0x50
> @@ -99,6 +108,13 @@ struct scm_function_0 {
>  	struct ocxl_fn *ocxl_fn;
>  };
>  
> +enum overwrite_state {
> +	SCM_OVERWRITE_IDLE = 0,
> +	SCM_OVERWRITE_BUSY,
> +	SCM_OVERWRITE_SUCCESS,
> +	SCM_OVERWRITE_FAILED
> +};
> +
>  struct scm_data {
>  	struct device dev;
>  	struct pci_dev *pdev;
> @@ -116,6 +132,7 @@ struct scm_data {
>  	void *metadata_addr;
>  	struct command_metadata admin_command;
>  	struct command_metadata ns_command;
> +	enum overwrite_state overwrite_state;
>  	struct resource scm_res;
>  	struct nd_region *nd_region;
>  	struct eventfd_ctx *ev_ctx;


