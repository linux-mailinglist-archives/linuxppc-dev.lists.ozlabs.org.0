Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E66190331
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:11:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mYB33qygzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 12:11:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mY7q3gzLzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 12:09:58 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O13fja080081
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:09:56 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywd8chj93-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:09:56 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Tue, 24 Mar 2020 01:09:53 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 01:09:51 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02O19o6Y51052772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 01:09:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83D204C046;
 Tue, 24 Mar 2020 01:09:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DECCC4C044;
 Tue, 24 Mar 2020 01:09:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2020 01:09:49 +0000 (GMT)
Received: from [9.81.204.7] (unknown [9.81.204.7])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F152FA021A;
 Tue, 24 Mar 2020 12:09:43 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v3] ocxl: control via sysfs whether the FPGA is reloaded
 on a link reset
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 clombard@linux.ibm.com, felix@linux.ibm.com, alastair@au1.ibm.com
References: <20200318100210.80035-1-fbarrat@linux.ibm.com>
Date: Tue, 24 Mar 2020 12:09:40 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318100210.80035-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032401-0008-0000-0000-00000362B08A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032401-0009-0000-0000-00004A841B04
Message-Id: <5bda885b-4c3b-3612-277a-d2b9ec213d4c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_10:2020-03-23,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003240001
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/3/20 9:02 pm, Frederic Barrat wrote:
> From: Philippe Bergheaud <felix@linux.ibm.com>
> 
> Some opencapi FPGA images allow to control if the FPGA should be reloaded
> on the next adapter reset. If it is supported, the image specifies it
> through a Vendor Specific DVSEC in the config space of function 0.
> 
> Signed-off-by: Philippe Bergheaud <felix@linux.ibm.com>

As I've raised privately - I think we need an additional identifier 
within the Vendor-Specific DVSEC to distinguish between the IBM 
reference implementation of the CFG subsystem and alternative 
implementations that may use the Vendor-Specific DVSEC for other purposes.

Further comments below.

> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index c8e19bfb5ef9..b364b6ceb996 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -71,6 +71,20 @@ static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
>   	return 0;
>   }
>   
> +/**
> + * get_function_0() - Find a related PCI device (function 0)
> + * @device: PCI device to match
> + *
> + * Returns a pointer to the related device, or null if not found
> + */
> +static struct pci_dev *get_function_0(struct pci_dev *dev)
> +{
> +	unsigned int devfn = PCI_DEVFN(PCI_SLOT(dev->devfn), 0);
> +
> +	return pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus),
> +					   dev->bus->number, devfn);
> +}
> +
>   static void read_pasid(struct pci_dev *dev, struct ocxl_fn_config *fn)
>   {
>   	u16 val;
> @@ -159,7 +173,7 @@ static int read_dvsec_afu_info(struct pci_dev *dev, struct ocxl_fn_config *fn)
>   static int read_dvsec_vendor(struct pci_dev *dev)
>   {
>   	int pos;
> -	u32 cfg, tlx, dlx;
> +	u32 cfg, tlx, dlx, reset_reload;
>   
>   	/*
>   	 * vendor specific DVSEC is optional
> @@ -183,6 +197,58 @@ static int read_dvsec_vendor(struct pci_dev *dev)
>   	dev_dbg(&dev->dev, "  CFG version = 0x%x\n", cfg);
>   	dev_dbg(&dev->dev, "  TLX version = 0x%x\n", tlx);
>   	dev_dbg(&dev->dev, "  DLX version = 0x%x\n", dlx);
> +
> +	if (ocxl_config_get_reset_reload(dev, &reset_reload) != 0)
> +		dev_dbg(&dev->dev, "  ResetReload is not available\n");
> +	else
> +		dev_dbg(&dev->dev, "  ResetReload = 0x%x\n", reset_reload);
> +	return 0;
> +}
> +
> +int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val)
> +{
> +	int reset_reload = -1;

Would prefer if this was a u32, to match the type in the 
pci_read_config_dword() signature

> +	int pos = 0;
> +	struct pci_dev *dev0 = dev;
> +
> +	if (PCI_FUNC(dev->devfn) != 0)
> +		dev0 = get_function_0(dev);
> +
> +	if (dev0)
> +		pos = find_dvsec(dev0, OCXL_DVSEC_VENDOR_ID);
> +
> +	if (pos)
> +		pci_read_config_dword(dev0,
> +				      pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
> +				      &reset_reload);
> +	if (reset_reload == -1)
> +		return reset_reload;

Can we safely assume that 0xFFFFFFFF is never going to be a valid value 
for this dword? The document I'm looking at only states that bits 31:1 
are reserved, not that any of them are guaranteed to be a 0 in a future 
revision.

> +
> +	*val = reset_reload & BIT(0);
> +	return 0;
> +}
> +
> +int ocxl_config_set_reset_reload(struct pci_dev *dev, int val)
> +{
> +	int reset_reload = -1;
> +	int pos = 0;
> +	struct pci_dev *dev0 = dev;
> +
> +	if (PCI_FUNC(dev->devfn) != 0)
> +		dev0 = get_function_0(dev);
> +
> +	if (dev0)
> +		pos = find_dvsec(dev0, OCXL_DVSEC_VENDOR_ID);
> +
> +	if (pos)
> +		pci_read_config_dword(dev0,
> +				      pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
> +				      &reset_reload);
> +	if (reset_reload == -1)
> +		return reset_reload;
> +
> +	val &= BIT(0);

I think we want to keep the existing value of reserved bits.

Something like

	val = (val & BIT(0)) | (reset_reload & ~BIT(0));

?

> +	pci_write_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD, val);
>   	return 0;
>   }
>   
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 345bf843a38e..af9a84aeee6f 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -112,6 +112,12 @@ void ocxl_actag_afu_free(struct ocxl_fn *fn, u32 start, u32 size);
>    */
>   int ocxl_config_get_pasid_info(struct pci_dev *dev, int *count);
>   
> +/*
> + * Control whether the FPGA is reloaded on a link reset
> + */
> +int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val);
> +int ocxl_config_set_reset_reload(struct pci_dev *dev, int val);
> +
>   /*
>    * Check if an AFU index is valid for the given function.
>    *
> diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
> index 58f1ba264206..8f69f7311343 100644
> --- a/drivers/misc/ocxl/sysfs.c
> +++ b/drivers/misc/ocxl/sysfs.c
> @@ -51,11 +51,46 @@ static ssize_t contexts_show(struct device *device,
>   			afu->pasid_count, afu->pasid_max);
>   }
>   
> +static ssize_t reload_on_reset_show(struct device *device,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	struct ocxl_afu *afu = to_afu(device);
> +	struct ocxl_fn *fn = afu->fn;
> +	struct pci_dev *pci_dev = to_pci_dev(fn->dev.parent);
> +	int val;
> +
> +	if (ocxl_config_get_reset_reload(pci_dev, &val))
> +		return scnprintf(buf, PAGE_SIZE, "unavailable\n");
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
> +}
> +
> +static ssize_t reload_on_reset_store(struct device *device,
> +		struct device_attribute *attr,
> +		const char *buf, size_t count)
> +{
> +	struct ocxl_afu *afu = to_afu(device);
> +	struct ocxl_fn *fn = afu->fn;
> +	struct pci_dev *pci_dev = to_pci_dev(fn->dev.parent);
> +	int rc, val;
> +
> +	rc = sscanf(buf, "%i", &val);

Checkpatch suggests turning this into kstrtoint()

https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/12312//artifact/linux/checkpatch.log

> +	if ((rc != 1) || !(val == 1 || val == 0))
> +		return -EINVAL;
> +
> +	if (ocxl_config_set_reset_reload(pci_dev, val))
> +		return -ENODEV;
> +
> +	return count;
> +}
> +
>   static struct device_attribute afu_attrs[] = {
>   	__ATTR_RO(global_mmio_size),
>   	__ATTR_RO(pp_mmio_size),
>   	__ATTR_RO(afu_version),
>   	__ATTR_RO(contexts),
> +	__ATTR_RW(reload_on_reset),
>   };
>   
>   static ssize_t global_mmio_read(struct file *filp, struct kobject *kobj,
> diff --git a/include/misc/ocxl-config.h b/include/misc/ocxl-config.h
> index 3526fa996a22..ccfd3b463517 100644
> --- a/include/misc/ocxl-config.h
> +++ b/include/misc/ocxl-config.h
> @@ -41,5 +41,6 @@
>   #define   OCXL_DVSEC_VENDOR_CFG_VERS            0x0C
>   #define   OCXL_DVSEC_VENDOR_TLX_VERS            0x10
>   #define   OCXL_DVSEC_VENDOR_DLX_VERS            0x20
> +#define   OCXL_DVSEC_VENDOR_RESET_RELOAD        0x38
>   
>   #endif /* _OCXL_CONFIG_H_ */
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

