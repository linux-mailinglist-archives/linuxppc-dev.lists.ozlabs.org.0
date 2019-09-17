Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD47B4797
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 08:37:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XYLz4cwFzF441
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 16:37:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XYJV3mnHzF3rx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 16:35:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H6Xn3r125843
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 02:35:17 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2rxytk89-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 02:35:17 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 17 Sep 2019 07:35:15 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 07:35:10 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H6ZAUH48103650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 06:35:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E6FAE055;
 Tue, 17 Sep 2019 06:35:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48D79AE045;
 Tue, 17 Sep 2019 06:35:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 06:35:09 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CE93DA019A;
 Tue, 17 Sep 2019 16:35:04 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Date: Tue, 17 Sep 2019 16:35:04 +1000
In-Reply-To: <20190917014307.30485-6-alastair@au1.ibm.com>
References: <20190917014307.30485-1-alastair@au1.ibm.com>
 <20190917014307.30485-6-alastair@au1.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091706-0012-0000-0000-0000034D01C2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091706-0013-0000-0000-000021877A4D
Message-Id: <832772dd7c22e100bfa81f77993f6cda5e40bfc4.camel@au1.ibm.com>
Subject: Re:  [PATCH 5/5] ocxl: Provide additional metadata to userspace
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=778 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170071
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
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-17 at 11:43 +1000, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch exposes the OpenCAPI device serial number to
> userspace.
> 
> It also includes placeholders for the LPC & special purpose
> memory information (which will be populated in a subsequent patch)
> to avoid creating excessive versions of the IOCTL.
> 

I think it makes more sense to fold in the population of LPC & special
purpose memory into this patch, I'll address this in the next spin.

> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/misc/ocxl/config.c | 46
> ++++++++++++++++++++++++++++++++++++++
>  drivers/misc/ocxl/file.c   |  3 ++-
>  include/misc/ocxl.h        |  1 +
>  include/uapi/misc/ocxl.h   |  9 +++++++-
>  4 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index fb0c3b6f8312..a9203c309365 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -71,6 +71,51 @@ static int find_dvsec_afu_ctrl(struct pci_dev
> *dev, u8 afu_idx)
>  	return 0;
>  }
>  
> +/**
> + * Find a related PCI device (function 0)
> + * @device: PCI device to match
> + *
> + * Returns a pointer to the related device, or null if not found
> + */
> +static struct pci_dev *get_function_0(struct pci_dev *dev)
> +{
> +	unsigned int devfn = PCI_DEVFN(PCI_SLOT(dev->devfn), 0); //
> Look for function 0
> +
> +	return pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus),
> +					dev->bus->number, devfn);
> +}
> +
> +static void read_serial(struct pci_dev *dev, struct ocxl_fn_config
> *fn)
> +{
> +	u32 low, high;
> +	int pos;
> +
> +	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DSN);
> +	if (pos) {
> +		pci_read_config_dword(dev, pos + 0x04, &low);
> +		pci_read_config_dword(dev, pos + 0x08, &high);
> +
> +		fn->serial = low | ((u64)high) << 32;
> +
> +		return;
> +	}
> +
> +	if (PCI_FUNC(dev->devfn) != 0) {
> +		struct pci_dev *related = get_function_0(dev);
> +
> +		if (!related) {
> +			fn->serial = 0;
> +			return;
> +		}
> +
> +		read_serial(related, fn);
> +		pci_dev_put(related);
> +		return;
> +	}
> +
> +	fn->serial = 0;
> +}
> +
>  static void read_pasid(struct pci_dev *dev, struct ocxl_fn_config
> *fn)
>  {
>  	u16 val;
> @@ -208,6 +253,7 @@ int ocxl_config_read_function(struct pci_dev
> *dev, struct ocxl_fn_config *fn)
>  	int rc;
>  
>  	read_pasid(dev, fn);
> +	read_serial(dev, fn);
>  
>  	rc = read_dvsec_tl(dev, fn);
>  	if (rc) {
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 2870c25da166..08f6f594a11d 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -98,13 +98,14 @@ static long afu_ioctl_get_metadata(struct
> ocxl_context *ctx,
>  
>  	memset(&arg, 0, sizeof(arg));
>  
> -	arg.version = 0;
> +	arg.version = 1;
>  
>  	arg.afu_version_major = ctx->afu->config.version_major;
>  	arg.afu_version_minor = ctx->afu->config.version_minor;
>  	arg.pasid = ctx->pasid;
>  	arg.pp_mmio_size = ctx->afu->config.pp_mmio_stride;
>  	arg.global_mmio_size = ctx->afu->config.global_mmio_size;
> +	arg.serial = ctx->afu->fn->config.serial;
>  
>  	if (copy_to_user(uarg, &arg, sizeof(arg)))
>  		return -EFAULT;
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index a1897737908d..da75db149e6c 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -46,6 +46,7 @@ struct ocxl_fn_config {
>  	int dvsec_afu_info_pos; /* offset of the AFU information DVSEC
> */
>  	s8 max_pasid_log;
>  	s8 max_afu_index;
> +	u64 serial;
>  };
>  
>  enum ocxl_endian {
> diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
> index 6d29a60a896a..d4c6bf10580c 100644
> --- a/include/uapi/misc/ocxl.h
> +++ b/include/uapi/misc/ocxl.h
> @@ -45,7 +45,14 @@ struct ocxl_ioctl_metadata {
>  
>  	/* End version 0 fields */
>  
> -	__u64 reserved[13]; /* Total of 16*u64 */
> +	// Version 1 fields
> +	__u64 lpc_mem_size;
> +	__u64 special_purpose_mem_size;
> +	__u64 serial;		// Device serial number
> +
> +	// End version 1 fields
> +
> +	__u64 reserved[10]; // Total of 16*u64
>  };
>  
>  struct ocxl_ioctl_p9_wait {
> -- 
> 2.21.0

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

