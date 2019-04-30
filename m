Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 981ACEF61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 06:22:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tSzS1cyjzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:22:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=andrew.donnellan@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tSxv1TqgzDq7g
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 14:20:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U4GpBR116667
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 00:20:47 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s6e5b23es-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 00:20:47 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <andrew.donnellan@au1.ibm.com>;
 Tue, 30 Apr 2019 05:20:44 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 05:20:41 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U4Ke4755967848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 04:20:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95098AE04D;
 Tue, 30 Apr 2019 04:20:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8D3AE051;
 Tue, 30 Apr 2019 04:20:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 04:20:39 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6D2B0A01D2;
 Tue, 30 Apr 2019 14:20:38 +1000 (AEST)
Subject: Re: [PATCH v4 1/7] ocxl: Split pci.c
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190327053137.15173-1-alastair@au1.ibm.com>
 <20190327053137.15173-2-alastair@au1.ibm.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Tue, 30 Apr 2019 14:20:31 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190327053137.15173-2-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19043004-4275-0000-0000-0000032FC12D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043004-4276-0000-0000-0000383F183C
Message-Id: <bbe09c5e-5570-4048-5dce-181ae4348ca0@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300027
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/3/19 4:31 pm, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> In preparation for making core code available for external drivers,
> move the core code out of pci.c and into core.c
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

There doesn't seem to be much left in pci.c, is there?

Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

> ---
>   drivers/misc/ocxl/Makefile        |   1 +
>   drivers/misc/ocxl/core.c          | 517 +++++++++++++++++++++++++++++
>   drivers/misc/ocxl/ocxl_internal.h |   5 +
>   drivers/misc/ocxl/pci.c           | 519 +-----------------------------
>   4 files changed, 524 insertions(+), 518 deletions(-)
>   create mode 100644 drivers/misc/ocxl/core.c
> 
> diff --git a/drivers/misc/ocxl/Makefile b/drivers/misc/ocxl/Makefile
> index 5229dcda8297..bc4e39bfda7b 100644
> --- a/drivers/misc/ocxl/Makefile
> +++ b/drivers/misc/ocxl/Makefile
> @@ -3,6 +3,7 @@ ccflags-$(CONFIG_PPC_WERROR)	+= -Werror
>   
>   ocxl-y				+= main.o pci.o config.o file.o pasid.o
>   ocxl-y				+= link.o context.o afu_irq.o sysfs.o trace.o
> +ocxl-y				+= core.o
>   obj-$(CONFIG_OCXL)		+= ocxl.o
>   
>   # For tracepoints to include our trace.h from tracepoint infrastructure:
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> new file mode 100644
> index 000000000000..1a4411b72d35
> --- /dev/null
> +++ b/drivers/misc/ocxl/core.c
> @@ -0,0 +1,517 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2019 IBM Corp.
> +#include <linux/idr.h>
> +#include "ocxl_internal.h"
> +
> +static struct ocxl_fn *ocxl_fn_get(struct ocxl_fn *fn)
> +{
> +	return (get_device(&fn->dev) == NULL) ? NULL : fn;
> +}
> +
> +static void ocxl_fn_put(struct ocxl_fn *fn)
> +{
> +	put_device(&fn->dev);
> +}
> +
> +struct ocxl_afu *ocxl_afu_get(struct ocxl_afu *afu)
> +{
> +	return (get_device(&afu->dev) == NULL) ? NULL : afu;
> +}
> +
> +void ocxl_afu_put(struct ocxl_afu *afu)
> +{
> +	put_device(&afu->dev);
> +}
> +
> +static struct ocxl_afu *alloc_afu(struct ocxl_fn *fn)
> +{
> +	struct ocxl_afu *afu;
> +
> +	afu = kzalloc(sizeof(struct ocxl_afu), GFP_KERNEL);
> +	if (!afu)
> +		return NULL;
> +
> +	mutex_init(&afu->contexts_lock);
> +	mutex_init(&afu->afu_control_lock);
> +	idr_init(&afu->contexts_idr);
> +	afu->fn = fn;
> +	ocxl_fn_get(fn);
> +	return afu;
> +}
> +
> +static void free_afu(struct ocxl_afu *afu)
> +{
> +	idr_destroy(&afu->contexts_idr);
> +	ocxl_fn_put(afu->fn);
> +	kfree(afu);
> +}
> +
> +static void free_afu_dev(struct device *dev)
> +{
> +	struct ocxl_afu *afu = to_ocxl_afu(dev);
> +
> +	ocxl_unregister_afu(afu);
> +	free_afu(afu);
> +}
> +
> +static int set_afu_device(struct ocxl_afu *afu, const char *location)
> +{
> +	struct ocxl_fn *fn = afu->fn;
> +	int rc;
> +
> +	afu->dev.parent = &fn->dev;
> +	afu->dev.release = free_afu_dev;
> +	rc = dev_set_name(&afu->dev, "%s.%s.%hhu", afu->config.name, location,
> +		afu->config.idx);
> +	return rc;
> +}
> +
> +static int assign_afu_actag(struct ocxl_afu *afu, struct pci_dev *dev)
> +{
> +	struct ocxl_fn *fn = afu->fn;
> +	int actag_count, actag_offset;
> +
> +	/*
> +	 * if there were not enough actags for the function, each afu
> +	 * reduces its count as well
> +	 */
> +	actag_count = afu->config.actag_supported *
> +		fn->actag_enabled / fn->actag_supported;
> +	actag_offset = ocxl_actag_afu_alloc(fn, actag_count);
> +	if (actag_offset < 0) {
> +		dev_err(&afu->dev, "Can't allocate %d actags for AFU: %d\n",
> +			actag_count, actag_offset);
> +		return actag_offset;
> +	}
> +	afu->actag_base = fn->actag_base + actag_offset;
> +	afu->actag_enabled = actag_count;
> +
> +	ocxl_config_set_afu_actag(dev, afu->config.dvsec_afu_control_pos,
> +				afu->actag_base, afu->actag_enabled);
> +	dev_dbg(&afu->dev, "actag base=%d enabled=%d\n",
> +		afu->actag_base, afu->actag_enabled);
> +	return 0;
> +}
> +
> +static void reclaim_afu_actag(struct ocxl_afu *afu)
> +{
> +	struct ocxl_fn *fn = afu->fn;
> +	int start_offset, size;
> +
> +	start_offset = afu->actag_base - fn->actag_base;
> +	size = afu->actag_enabled;
> +	ocxl_actag_afu_free(afu->fn, start_offset, size);
> +}
> +
> +static int assign_afu_pasid(struct ocxl_afu *afu, struct pci_dev *dev)
> +{
> +	struct ocxl_fn *fn = afu->fn;
> +	int pasid_count, pasid_offset;
> +
> +	/*
> +	 * We only support the case where the function configuration
> +	 * requested enough PASIDs to cover all AFUs.
> +	 */
> +	pasid_count = 1 << afu->config.pasid_supported_log;
> +	pasid_offset = ocxl_pasid_afu_alloc(fn, pasid_count);
> +	if (pasid_offset < 0) {
> +		dev_err(&afu->dev, "Can't allocate %d PASIDs for AFU: %d\n",
> +			pasid_count, pasid_offset);
> +		return pasid_offset;
> +	}
> +	afu->pasid_base = fn->pasid_base + pasid_offset;
> +	afu->pasid_count = 0;
> +	afu->pasid_max = pasid_count;
> +
> +	ocxl_config_set_afu_pasid(dev, afu->config.dvsec_afu_control_pos,
> +				afu->pasid_base,
> +				afu->config.pasid_supported_log);
> +	dev_dbg(&afu->dev, "PASID base=%d, enabled=%d\n",
> +		afu->pasid_base, pasid_count);
> +	return 0;
> +}
> +
> +static void reclaim_afu_pasid(struct ocxl_afu *afu)
> +{
> +	struct ocxl_fn *fn = afu->fn;
> +	int start_offset, size;
> +
> +	start_offset = afu->pasid_base - fn->pasid_base;
> +	size = 1 << afu->config.pasid_supported_log;
> +	ocxl_pasid_afu_free(afu->fn, start_offset, size);
> +}
> +
> +static int reserve_fn_bar(struct ocxl_fn *fn, int bar)
> +{
> +	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> +	int rc, idx;
> +
> +	if (bar != 0 && bar != 2 && bar != 4)
> +		return -EINVAL;
> +
> +	idx = bar >> 1;
> +	if (fn->bar_used[idx]++ == 0) {
> +		rc = pci_request_region(dev, bar, "ocxl");
> +		if (rc)
> +			return rc;
> +	}
> +	return 0;
> +}
> +
> +static void release_fn_bar(struct ocxl_fn *fn, int bar)
> +{
> +	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> +	int idx;
> +
> +	if (bar != 0 && bar != 2 && bar != 4)
> +		return;
> +
> +	idx = bar >> 1;
> +	if (--fn->bar_used[idx] == 0)
> +		pci_release_region(dev, bar);
> +	WARN_ON(fn->bar_used[idx] < 0);
> +}
> +
> +static int map_mmio_areas(struct ocxl_afu *afu, struct pci_dev *dev)
> +{
> +	int rc;
> +
> +	rc = reserve_fn_bar(afu->fn, afu->config.global_mmio_bar);
> +	if (rc)
> +		return rc;
> +
> +	rc = reserve_fn_bar(afu->fn, afu->config.pp_mmio_bar);
> +	if (rc) {
> +		release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> +		return rc;
> +	}
> +
> +	afu->global_mmio_start =
> +		pci_resource_start(dev, afu->config.global_mmio_bar) +
> +		afu->config.global_mmio_offset;
> +	afu->pp_mmio_start =
> +		pci_resource_start(dev, afu->config.pp_mmio_bar) +
> +		afu->config.pp_mmio_offset;
> +
> +	afu->global_mmio_ptr = ioremap(afu->global_mmio_start,
> +				afu->config.global_mmio_size);
> +	if (!afu->global_mmio_ptr) {
> +		release_fn_bar(afu->fn, afu->config.pp_mmio_bar);
> +		release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> +		dev_err(&dev->dev, "Error mapping global mmio area\n");
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * Leave an empty page between the per-process mmio area and
> +	 * the AFU interrupt mappings
> +	 */
> +	afu->irq_base_offset = afu->config.pp_mmio_stride + PAGE_SIZE;
> +	return 0;
> +}
> +
> +static void unmap_mmio_areas(struct ocxl_afu *afu)
> +{
> +	if (afu->global_mmio_ptr) {
> +		iounmap(afu->global_mmio_ptr);
> +		afu->global_mmio_ptr = NULL;
> +	}
> +	afu->global_mmio_start = 0;
> +	afu->pp_mmio_start = 0;
> +	release_fn_bar(afu->fn, afu->config.pp_mmio_bar);
> +	release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> +}
> +
> +static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
> +{
> +	int rc;
> +
> +	rc = ocxl_config_read_afu(dev, &afu->fn->config, &afu->config, afu_idx);
> +	if (rc)
> +		return rc;
> +
> +	rc = set_afu_device(afu, dev_name(&dev->dev));
> +	if (rc)
> +		return rc;
> +
> +	rc = assign_afu_actag(afu, dev);
> +	if (rc)
> +		return rc;
> +
> +	rc = assign_afu_pasid(afu, dev);
> +	if (rc) {
> +		reclaim_afu_actag(afu);
> +		return rc;
> +	}
> +
> +	rc = map_mmio_areas(afu, dev);
> +	if (rc) {
> +		reclaim_afu_pasid(afu);
> +		reclaim_afu_actag(afu);
> +		return rc;
> +	}
> +	return 0;
> +}
> +
> +static void deconfigure_afu(struct ocxl_afu *afu)
> +{
> +	unmap_mmio_areas(afu);
> +	reclaim_afu_pasid(afu);
> +	reclaim_afu_actag(afu);
> +}
> +
> +static int activate_afu(struct pci_dev *dev, struct ocxl_afu *afu)
> +{
> +	int rc;
> +
> +	ocxl_config_set_afu_state(dev, afu->config.dvsec_afu_control_pos, 1);
> +	/*
> +	 * Char device creation is the last step, as processes can
> +	 * call our driver immediately, so all our inits must be finished.
> +	 */
> +	rc = ocxl_create_cdev(afu);
> +	if (rc)
> +		return rc;
> +	return 0;
> +}
> +
> +static void deactivate_afu(struct ocxl_afu *afu)
> +{
> +	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> +
> +	ocxl_destroy_cdev(afu);
> +	ocxl_config_set_afu_state(dev, afu->config.dvsec_afu_control_pos, 0);
> +}
> +
> +int init_afu(struct pci_dev *dev, struct ocxl_fn *fn, u8 afu_idx)
> +{
> +	int rc;
> +	struct ocxl_afu *afu;
> +
> +	afu = alloc_afu(fn);
> +	if (!afu)
> +		return -ENOMEM;
> +
> +	rc = configure_afu(afu, afu_idx, dev);
> +	if (rc) {
> +		free_afu(afu);
> +		return rc;
> +	}
> +
> +	rc = ocxl_register_afu(afu);
> +	if (rc)
> +		goto err;
> +
> +	rc = ocxl_sysfs_add_afu(afu);
> +	if (rc)
> +		goto err;
> +
> +	rc = activate_afu(dev, afu);
> +	if (rc)
> +		goto err_sys;
> +
> +	list_add_tail(&afu->list, &fn->afu_list);
> +	return 0;
> +
> +err_sys:
> +	ocxl_sysfs_remove_afu(afu);
> +err:
> +	deconfigure_afu(afu);
> +	device_unregister(&afu->dev);
> +	return rc;
> +}
> +
> +void remove_afu(struct ocxl_afu *afu)
> +{
> +	list_del(&afu->list);
> +	ocxl_context_detach_all(afu);
> +	deactivate_afu(afu);
> +	ocxl_sysfs_remove_afu(afu);
> +	deconfigure_afu(afu);
> +	device_unregister(&afu->dev);
> +}
> +
> +static struct ocxl_fn *alloc_function(struct pci_dev *dev)
> +{
> +	struct ocxl_fn *fn;
> +
> +	fn = kzalloc(sizeof(struct ocxl_fn), GFP_KERNEL);
> +	if (!fn)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&fn->afu_list);
> +	INIT_LIST_HEAD(&fn->pasid_list);
> +	INIT_LIST_HEAD(&fn->actag_list);
> +	return fn;
> +}
> +
> +static void free_function(struct ocxl_fn *fn)
> +{
> +	WARN_ON(!list_empty(&fn->afu_list));
> +	WARN_ON(!list_empty(&fn->pasid_list));
> +	kfree(fn);
> +}
> +
> +static void free_function_dev(struct device *dev)
> +{
> +	struct ocxl_fn *fn = to_ocxl_function(dev);
> +
> +	free_function(fn);
> +}
> +
> +static int set_function_device(struct ocxl_fn *fn, struct pci_dev *dev)
> +{
> +	int rc;
> +
> +	fn->dev.parent = &dev->dev;
> +	fn->dev.release = free_function_dev;
> +	rc = dev_set_name(&fn->dev, "ocxlfn.%s", dev_name(&dev->dev));
> +	if (rc)
> +		return rc;
> +	pci_set_drvdata(dev, fn);
> +	return 0;
> +}
> +
> +static int assign_function_actag(struct ocxl_fn *fn)
> +{
> +	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> +	u16 base, enabled, supported;
> +	int rc;
> +
> +	rc = ocxl_config_get_actag_info(dev, &base, &enabled, &supported);
> +	if (rc)
> +		return rc;
> +
> +	fn->actag_base = base;
> +	fn->actag_enabled = enabled;
> +	fn->actag_supported = supported;
> +
> +	ocxl_config_set_actag(dev, fn->config.dvsec_function_pos,
> +			fn->actag_base,	fn->actag_enabled);
> +	dev_dbg(&fn->dev, "actag range starting at %d, enabled %d\n",
> +		fn->actag_base, fn->actag_enabled);
> +	return 0;
> +}
> +
> +static int set_function_pasid(struct ocxl_fn *fn)
> +{
> +	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> +	int rc, desired_count, max_count;
> +
> +	/* A function may not require any PASID */
> +	if (fn->config.max_pasid_log < 0)
> +		return 0;
> +
> +	rc = ocxl_config_get_pasid_info(dev, &max_count);
> +	if (rc)
> +		return rc;
> +
> +	desired_count = 1 << fn->config.max_pasid_log;
> +
> +	if (desired_count > max_count) {
> +		dev_err(&fn->dev,
> +			"Function requires more PASIDs than is available (%d vs. %d)\n",
> +			desired_count, max_count);
> +		return -ENOSPC;
> +	}
> +
> +	fn->pasid_base = 0;
> +	return 0;
> +}
> +
> +static int configure_function(struct ocxl_fn *fn, struct pci_dev *dev)
> +{
> +	int rc;
> +
> +	rc = pci_enable_device(dev);
> +	if (rc) {
> +		dev_err(&dev->dev, "pci_enable_device failed: %d\n", rc);
> +		return rc;
> +	}
> +
> +	/*
> +	 * Once it has been confirmed to work on our hardware, we
> +	 * should reset the function, to force the adapter to restart
> +	 * from scratch.
> +	 * A function reset would also reset all its AFUs.
> +	 *
> +	 * Some hints for implementation:
> +	 *
> +	 * - there's not status bit to know when the reset is done. We
> +	 *   should try reading the config space to know when it's
> +	 *   done.
> +	 * - probably something like:
> +	 *	Reset
> +	 *	wait 100ms
> +	 *	issue config read
> +	 *	allow device up to 1 sec to return success on config
> +	 *	read before declaring it broken
> +	 *
> +	 * Some shared logic on the card (CFG, TLX) won't be reset, so
> +	 * there's no guarantee that it will be enough.
> +	 */
> +	rc = ocxl_config_read_function(dev, &fn->config);
> +	if (rc)
> +		return rc;
> +
> +	rc = set_function_device(fn, dev);
> +	if (rc)
> +		return rc;
> +
> +	rc = assign_function_actag(fn);
> +	if (rc)
> +		return rc;
> +
> +	rc = set_function_pasid(fn);
> +	if (rc)
> +		return rc;
> +
> +	rc = ocxl_link_setup(dev, 0, &fn->link);
> +	if (rc)
> +		return rc;
> +
> +	rc = ocxl_config_set_TL(dev, fn->config.dvsec_tl_pos);
> +	if (rc) {
> +		ocxl_link_release(dev, fn->link);
> +		return rc;
> +	}
> +	return 0;
> +}
> +
> +static void deconfigure_function(struct ocxl_fn *fn)
> +{
> +	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> +
> +	ocxl_link_release(dev, fn->link);
> +	pci_disable_device(dev);
> +}
> +
> +struct ocxl_fn *init_function(struct pci_dev *dev)
> +{
> +	struct ocxl_fn *fn;
> +	int rc;
> +
> +	fn = alloc_function(dev);
> +	if (!fn)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rc = configure_function(fn, dev);
> +	if (rc) {
> +		free_function(fn);
> +		return ERR_PTR(rc);
> +	}
> +
> +	rc = device_register(&fn->dev);
> +	if (rc) {
> +		deconfigure_function(fn);
> +		put_device(&fn->dev);
> +		return ERR_PTR(rc);
> +	}
> +	return fn;
> +}
> +
> +void remove_function(struct ocxl_fn *fn)
> +{
> +	deconfigure_function(fn);
> +	device_unregister(&fn->dev);
> +}
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 06fd98c989c8..81086534dab5 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -150,4 +150,9 @@ int ocxl_afu_irq_set_fd(struct ocxl_context *ctx, u64 irq_offset,
>   			int eventfd);
>   u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, u64 irq_offset);
>   
> +struct ocxl_fn *init_function(struct pci_dev *dev);
> +void remove_function(struct ocxl_fn *fn);
> +int init_afu(struct pci_dev *dev, struct ocxl_fn *fn, u8 afu_idx);
> +void remove_afu(struct ocxl_afu *afu);
> +
>   #endif /* _OCXL_INTERNAL_H_ */
> diff --git a/drivers/misc/ocxl/pci.c b/drivers/misc/ocxl/pci.c
> index 21f425472a82..4ed7cb1a667f 100644
> --- a/drivers/misc/ocxl/pci.c
> +++ b/drivers/misc/ocxl/pci.c
> @@ -1,9 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0+
> -// Copyright 2017 IBM Corp.
> +// Copyright 2019 IBM Corp.
>   #include <linux/module.h>
> -#include <linux/pci.h>
> -#include <linux/idr.h>
> -#include <asm/pnv-ocxl.h>
>   #include "ocxl_internal.h"
>   
>   /*
> @@ -17,520 +14,6 @@ static const struct pci_device_id ocxl_pci_tbl[] = {
>   };
>   MODULE_DEVICE_TABLE(pci, ocxl_pci_tbl);
>   
> -
> -static struct ocxl_fn *ocxl_fn_get(struct ocxl_fn *fn)
> -{
> -	return (get_device(&fn->dev) == NULL) ? NULL : fn;
> -}
> -
> -static void ocxl_fn_put(struct ocxl_fn *fn)
> -{
> -	put_device(&fn->dev);
> -}
> -
> -struct ocxl_afu *ocxl_afu_get(struct ocxl_afu *afu)
> -{
> -	return (get_device(&afu->dev) == NULL) ? NULL : afu;
> -}
> -
> -void ocxl_afu_put(struct ocxl_afu *afu)
> -{
> -	put_device(&afu->dev);
> -}
> -
> -static struct ocxl_afu *alloc_afu(struct ocxl_fn *fn)
> -{
> -	struct ocxl_afu *afu;
> -
> -	afu = kzalloc(sizeof(struct ocxl_afu), GFP_KERNEL);
> -	if (!afu)
> -		return NULL;
> -
> -	mutex_init(&afu->contexts_lock);
> -	mutex_init(&afu->afu_control_lock);
> -	idr_init(&afu->contexts_idr);
> -	afu->fn = fn;
> -	ocxl_fn_get(fn);
> -	return afu;
> -}
> -
> -static void free_afu(struct ocxl_afu *afu)
> -{
> -	idr_destroy(&afu->contexts_idr);
> -	ocxl_fn_put(afu->fn);
> -	kfree(afu);
> -}
> -
> -static void free_afu_dev(struct device *dev)
> -{
> -	struct ocxl_afu *afu = to_ocxl_afu(dev);
> -
> -	ocxl_unregister_afu(afu);
> -	free_afu(afu);
> -}
> -
> -static int set_afu_device(struct ocxl_afu *afu, const char *location)
> -{
> -	struct ocxl_fn *fn = afu->fn;
> -	int rc;
> -
> -	afu->dev.parent = &fn->dev;
> -	afu->dev.release = free_afu_dev;
> -	rc = dev_set_name(&afu->dev, "%s.%s.%hhu", afu->config.name, location,
> -		afu->config.idx);
> -	return rc;
> -}
> -
> -static int assign_afu_actag(struct ocxl_afu *afu, struct pci_dev *dev)
> -{
> -	struct ocxl_fn *fn = afu->fn;
> -	int actag_count, actag_offset;
> -
> -	/*
> -	 * if there were not enough actags for the function, each afu
> -	 * reduces its count as well
> -	 */
> -	actag_count = afu->config.actag_supported *
> -		fn->actag_enabled / fn->actag_supported;
> -	actag_offset = ocxl_actag_afu_alloc(fn, actag_count);
> -	if (actag_offset < 0) {
> -		dev_err(&afu->dev, "Can't allocate %d actags for AFU: %d\n",
> -			actag_count, actag_offset);
> -		return actag_offset;
> -	}
> -	afu->actag_base = fn->actag_base + actag_offset;
> -	afu->actag_enabled = actag_count;
> -
> -	ocxl_config_set_afu_actag(dev, afu->config.dvsec_afu_control_pos,
> -				afu->actag_base, afu->actag_enabled);
> -	dev_dbg(&afu->dev, "actag base=%d enabled=%d\n",
> -		afu->actag_base, afu->actag_enabled);
> -	return 0;
> -}
> -
> -static void reclaim_afu_actag(struct ocxl_afu *afu)
> -{
> -	struct ocxl_fn *fn = afu->fn;
> -	int start_offset, size;
> -
> -	start_offset = afu->actag_base - fn->actag_base;
> -	size = afu->actag_enabled;
> -	ocxl_actag_afu_free(afu->fn, start_offset, size);
> -}
> -
> -static int assign_afu_pasid(struct ocxl_afu *afu, struct pci_dev *dev)
> -{
> -	struct ocxl_fn *fn = afu->fn;
> -	int pasid_count, pasid_offset;
> -
> -	/*
> -	 * We only support the case where the function configuration
> -	 * requested enough PASIDs to cover all AFUs.
> -	 */
> -	pasid_count = 1 << afu->config.pasid_supported_log;
> -	pasid_offset = ocxl_pasid_afu_alloc(fn, pasid_count);
> -	if (pasid_offset < 0) {
> -		dev_err(&afu->dev, "Can't allocate %d PASIDs for AFU: %d\n",
> -			pasid_count, pasid_offset);
> -		return pasid_offset;
> -	}
> -	afu->pasid_base = fn->pasid_base + pasid_offset;
> -	afu->pasid_count = 0;
> -	afu->pasid_max = pasid_count;
> -
> -	ocxl_config_set_afu_pasid(dev, afu->config.dvsec_afu_control_pos,
> -				afu->pasid_base,
> -				afu->config.pasid_supported_log);
> -	dev_dbg(&afu->dev, "PASID base=%d, enabled=%d\n",
> -		afu->pasid_base, pasid_count);
> -	return 0;
> -}
> -
> -static void reclaim_afu_pasid(struct ocxl_afu *afu)
> -{
> -	struct ocxl_fn *fn = afu->fn;
> -	int start_offset, size;
> -
> -	start_offset = afu->pasid_base - fn->pasid_base;
> -	size = 1 << afu->config.pasid_supported_log;
> -	ocxl_pasid_afu_free(afu->fn, start_offset, size);
> -}
> -
> -static int reserve_fn_bar(struct ocxl_fn *fn, int bar)
> -{
> -	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> -	int rc, idx;
> -
> -	if (bar != 0 && bar != 2 && bar != 4)
> -		return -EINVAL;
> -
> -	idx = bar >> 1;
> -	if (fn->bar_used[idx]++ == 0) {
> -		rc = pci_request_region(dev, bar, "ocxl");
> -		if (rc)
> -			return rc;
> -	}
> -	return 0;
> -}
> -
> -static void release_fn_bar(struct ocxl_fn *fn, int bar)
> -{
> -	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> -	int idx;
> -
> -	if (bar != 0 && bar != 2 && bar != 4)
> -		return;
> -
> -	idx = bar >> 1;
> -	if (--fn->bar_used[idx] == 0)
> -		pci_release_region(dev, bar);
> -	WARN_ON(fn->bar_used[idx] < 0);
> -}
> -
> -static int map_mmio_areas(struct ocxl_afu *afu, struct pci_dev *dev)
> -{
> -	int rc;
> -
> -	rc = reserve_fn_bar(afu->fn, afu->config.global_mmio_bar);
> -	if (rc)
> -		return rc;
> -
> -	rc = reserve_fn_bar(afu->fn, afu->config.pp_mmio_bar);
> -	if (rc) {
> -		release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> -		return rc;
> -	}
> -
> -	afu->global_mmio_start =
> -		pci_resource_start(dev, afu->config.global_mmio_bar) +
> -		afu->config.global_mmio_offset;
> -	afu->pp_mmio_start =
> -		pci_resource_start(dev, afu->config.pp_mmio_bar) +
> -		afu->config.pp_mmio_offset;
> -
> -	afu->global_mmio_ptr = ioremap(afu->global_mmio_start,
> -				afu->config.global_mmio_size);
> -	if (!afu->global_mmio_ptr) {
> -		release_fn_bar(afu->fn, afu->config.pp_mmio_bar);
> -		release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> -		dev_err(&dev->dev, "Error mapping global mmio area\n");
> -		return -ENOMEM;
> -	}
> -
> -	/*
> -	 * Leave an empty page between the per-process mmio area and
> -	 * the AFU interrupt mappings
> -	 */
> -	afu->irq_base_offset = afu->config.pp_mmio_stride + PAGE_SIZE;
> -	return 0;
> -}
> -
> -static void unmap_mmio_areas(struct ocxl_afu *afu)
> -{
> -	if (afu->global_mmio_ptr) {
> -		iounmap(afu->global_mmio_ptr);
> -		afu->global_mmio_ptr = NULL;
> -	}
> -	afu->global_mmio_start = 0;
> -	afu->pp_mmio_start = 0;
> -	release_fn_bar(afu->fn, afu->config.pp_mmio_bar);
> -	release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> -}
> -
> -static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
> -{
> -	int rc;
> -
> -	rc = ocxl_config_read_afu(dev, &afu->fn->config, &afu->config, afu_idx);
> -	if (rc)
> -		return rc;
> -
> -	rc = set_afu_device(afu, dev_name(&dev->dev));
> -	if (rc)
> -		return rc;
> -
> -	rc = assign_afu_actag(afu, dev);
> -	if (rc)
> -		return rc;
> -
> -	rc = assign_afu_pasid(afu, dev);
> -	if (rc) {
> -		reclaim_afu_actag(afu);
> -		return rc;
> -	}
> -
> -	rc = map_mmio_areas(afu, dev);
> -	if (rc) {
> -		reclaim_afu_pasid(afu);
> -		reclaim_afu_actag(afu);
> -		return rc;
> -	}
> -	return 0;
> -}
> -
> -static void deconfigure_afu(struct ocxl_afu *afu)
> -{
> -	unmap_mmio_areas(afu);
> -	reclaim_afu_pasid(afu);
> -	reclaim_afu_actag(afu);
> -}
> -
> -static int activate_afu(struct pci_dev *dev, struct ocxl_afu *afu)
> -{
> -	int rc;
> -
> -	ocxl_config_set_afu_state(dev, afu->config.dvsec_afu_control_pos, 1);
> -	/*
> -	 * Char device creation is the last step, as processes can
> -	 * call our driver immediately, so all our inits must be finished.
> -	 */
> -	rc = ocxl_create_cdev(afu);
> -	if (rc)
> -		return rc;
> -	return 0;
> -}
> -
> -static void deactivate_afu(struct ocxl_afu *afu)
> -{
> -	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> -
> -	ocxl_destroy_cdev(afu);
> -	ocxl_config_set_afu_state(dev, afu->config.dvsec_afu_control_pos, 0);
> -}
> -
> -static int init_afu(struct pci_dev *dev, struct ocxl_fn *fn, u8 afu_idx)
> -{
> -	int rc;
> -	struct ocxl_afu *afu;
> -
> -	afu = alloc_afu(fn);
> -	if (!afu)
> -		return -ENOMEM;
> -
> -	rc = configure_afu(afu, afu_idx, dev);
> -	if (rc) {
> -		free_afu(afu);
> -		return rc;
> -	}
> -
> -	rc = ocxl_register_afu(afu);
> -	if (rc)
> -		goto err;
> -
> -	rc = ocxl_sysfs_add_afu(afu);
> -	if (rc)
> -		goto err;
> -
> -	rc = activate_afu(dev, afu);
> -	if (rc)
> -		goto err_sys;
> -
> -	list_add_tail(&afu->list, &fn->afu_list);
> -	return 0;
> -
> -err_sys:
> -	ocxl_sysfs_remove_afu(afu);
> -err:
> -	deconfigure_afu(afu);
> -	device_unregister(&afu->dev);
> -	return rc;
> -}
> -
> -static void remove_afu(struct ocxl_afu *afu)
> -{
> -	list_del(&afu->list);
> -	ocxl_context_detach_all(afu);
> -	deactivate_afu(afu);
> -	ocxl_sysfs_remove_afu(afu);
> -	deconfigure_afu(afu);
> -	device_unregister(&afu->dev);
> -}
> -
> -static struct ocxl_fn *alloc_function(struct pci_dev *dev)
> -{
> -	struct ocxl_fn *fn;
> -
> -	fn = kzalloc(sizeof(struct ocxl_fn), GFP_KERNEL);
> -	if (!fn)
> -		return NULL;
> -
> -	INIT_LIST_HEAD(&fn->afu_list);
> -	INIT_LIST_HEAD(&fn->pasid_list);
> -	INIT_LIST_HEAD(&fn->actag_list);
> -	return fn;
> -}
> -
> -static void free_function(struct ocxl_fn *fn)
> -{
> -	WARN_ON(!list_empty(&fn->afu_list));
> -	WARN_ON(!list_empty(&fn->pasid_list));
> -	kfree(fn);
> -}
> -
> -static void free_function_dev(struct device *dev)
> -{
> -	struct ocxl_fn *fn = to_ocxl_function(dev);
> -
> -	free_function(fn);
> -}
> -
> -static int set_function_device(struct ocxl_fn *fn, struct pci_dev *dev)
> -{
> -	int rc;
> -
> -	fn->dev.parent = &dev->dev;
> -	fn->dev.release = free_function_dev;
> -	rc = dev_set_name(&fn->dev, "ocxlfn.%s", dev_name(&dev->dev));
> -	if (rc)
> -		return rc;
> -	pci_set_drvdata(dev, fn);
> -	return 0;
> -}
> -
> -static int assign_function_actag(struct ocxl_fn *fn)
> -{
> -	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> -	u16 base, enabled, supported;
> -	int rc;
> -
> -	rc = ocxl_config_get_actag_info(dev, &base, &enabled, &supported);
> -	if (rc)
> -		return rc;
> -
> -	fn->actag_base = base;
> -	fn->actag_enabled = enabled;
> -	fn->actag_supported = supported;
> -
> -	ocxl_config_set_actag(dev, fn->config.dvsec_function_pos,
> -			fn->actag_base,	fn->actag_enabled);
> -	dev_dbg(&fn->dev, "actag range starting at %d, enabled %d\n",
> -		fn->actag_base, fn->actag_enabled);
> -	return 0;
> -}
> -
> -static int set_function_pasid(struct ocxl_fn *fn)
> -{
> -	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> -	int rc, desired_count, max_count;
> -
> -	/* A function may not require any PASID */
> -	if (fn->config.max_pasid_log < 0)
> -		return 0;
> -
> -	rc = ocxl_config_get_pasid_info(dev, &max_count);
> -	if (rc)
> -		return rc;
> -
> -	desired_count = 1 << fn->config.max_pasid_log;
> -
> -	if (desired_count > max_count) {
> -		dev_err(&fn->dev,
> -			"Function requires more PASIDs than is available (%d vs. %d)\n",
> -			desired_count, max_count);
> -		return -ENOSPC;
> -	}
> -
> -	fn->pasid_base = 0;
> -	return 0;
> -}
> -
> -static int configure_function(struct ocxl_fn *fn, struct pci_dev *dev)
> -{
> -	int rc;
> -
> -	rc = pci_enable_device(dev);
> -	if (rc) {
> -		dev_err(&dev->dev, "pci_enable_device failed: %d\n", rc);
> -		return rc;
> -	}
> -
> -	/*
> -	 * Once it has been confirmed to work on our hardware, we
> -	 * should reset the function, to force the adapter to restart
> -	 * from scratch.
> -	 * A function reset would also reset all its AFUs.
> -	 *
> -	 * Some hints for implementation:
> -	 *
> -	 * - there's not status bit to know when the reset is done. We
> -	 *   should try reading the config space to know when it's
> -	 *   done.
> -	 * - probably something like:
> -	 *	Reset
> -	 *	wait 100ms
> -	 *	issue config read
> -	 *	allow device up to 1 sec to return success on config
> -	 *	read before declaring it broken
> -	 *
> -	 * Some shared logic on the card (CFG, TLX) won't be reset, so
> -	 * there's no guarantee that it will be enough.
> -	 */
> -	rc = ocxl_config_read_function(dev, &fn->config);
> -	if (rc)
> -		return rc;
> -
> -	rc = set_function_device(fn, dev);
> -	if (rc)
> -		return rc;
> -
> -	rc = assign_function_actag(fn);
> -	if (rc)
> -		return rc;
> -
> -	rc = set_function_pasid(fn);
> -	if (rc)
> -		return rc;
> -
> -	rc = ocxl_link_setup(dev, 0, &fn->link);
> -	if (rc)
> -		return rc;
> -
> -	rc = ocxl_config_set_TL(dev, fn->config.dvsec_tl_pos);
> -	if (rc) {
> -		ocxl_link_release(dev, fn->link);
> -		return rc;
> -	}
> -	return 0;
> -}
> -
> -static void deconfigure_function(struct ocxl_fn *fn)
> -{
> -	struct pci_dev *dev = to_pci_dev(fn->dev.parent);
> -
> -	ocxl_link_release(dev, fn->link);
> -	pci_disable_device(dev);
> -}
> -
> -static struct ocxl_fn *init_function(struct pci_dev *dev)
> -{
> -	struct ocxl_fn *fn;
> -	int rc;
> -
> -	fn = alloc_function(dev);
> -	if (!fn)
> -		return ERR_PTR(-ENOMEM);
> -
> -	rc = configure_function(fn, dev);
> -	if (rc) {
> -		free_function(fn);
> -		return ERR_PTR(rc);
> -	}
> -
> -	rc = device_register(&fn->dev);
> -	if (rc) {
> -		deconfigure_function(fn);
> -		put_device(&fn->dev);
> -		return ERR_PTR(rc);
> -	}
> -	return fn;
> -}
> -
> -static void remove_function(struct ocxl_fn *fn)
> -{
> -	deconfigure_function(fn);
> -	device_unregister(&fn->dev);
> -}
> -
>   static int ocxl_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   {
>   	int rc, afu_count = 0;
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

