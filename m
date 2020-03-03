Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06506177260
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 10:29:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WsDH49d1zDqNk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 20:29:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WsBl1ZLYzDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 20:28:30 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0239QLvi115117
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 04:28:27 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfmyrh898-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 04:28:27 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 3 Mar 2020 09:28:25 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 09:28:16 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0239RH5f50463074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 09:27:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AC3E5204E;
 Tue,  3 Mar 2020 09:28:15 +0000 (GMT)
Received: from pic2.home (unknown [9.145.93.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2C40752051;
 Tue,  3 Mar 2020 09:28:14 +0000 (GMT)
Subject: Re: [PATCH v3 16/27] powerpc/powernv/pmem: Register a character
 device for userspace to interact with
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-17-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 3 Mar 2020 10:28:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-17-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030309-4275-0000-0000-000003A7D8ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030309-4276-0000-0000-000038BCE05A
Message-Id: <e9ebc395-9748-61a2-9125-eefc5c763332@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_02:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 suspectscore=2 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030073
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
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2020 à 04:27, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch introduces a character device (/dev/ocxl-scmX) which further
> patches will use to interact with userspace.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/platforms/powernv/pmem/ocxl.c    | 116 +++++++++++++++++-
>   .../platforms/powernv/pmem/ocxl_internal.h    |   2 +
>   2 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> index b8bd7e703b19..63109a870d2c 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> @@ -10,6 +10,7 @@
>   #include <misc/ocxl.h>
>   #include <linux/delay.h>
>   #include <linux/ndctl.h>
> +#include <linux/fs.h>
>   #include <linux/mm_types.h>
>   #include <linux/memory_hotplug.h>
>   #include "ocxl_internal.h"
> @@ -339,6 +340,9 @@ static void free_ocxlpmem(struct ocxlpmem *ocxlpmem)
>   
>   	free_minor(ocxlpmem);
>   
> +	if (ocxlpmem->cdev.owner)
> +		cdev_del(&ocxlpmem->cdev);
> +
>   	if (ocxlpmem->metadata_addr)
>   		devm_memunmap(&ocxlpmem->dev, ocxlpmem->metadata_addr);
>   
> @@ -396,6 +400,70 @@ static int ocxlpmem_register(struct ocxlpmem *ocxlpmem)
>   	return device_register(&ocxlpmem->dev);
>   }
>   
> +static void ocxlpmem_put(struct ocxlpmem *ocxlpmem)
> +{
> +	put_device(&ocxlpmem->dev);
> +}
> +
> +static struct ocxlpmem *ocxlpmem_get(struct ocxlpmem *ocxlpmem)
> +{
> +	return (get_device(&ocxlpmem->dev) == NULL) ? NULL : ocxlpmem;
> +}
> +
> +static struct ocxlpmem *find_and_get_ocxlpmem(dev_t devno)
> +{
> +	struct ocxlpmem *ocxlpmem;
> +	int minor = MINOR(devno);
> +	/*
> +	 * We don't declare an RCU critical section here, as our AFU
> +	 * is protected by a reference counter on the device. By the time the
> +	 * minor number of a device is removed from the idr, the ref count of
> +	 * the device is already at 0, so no user API will access that AFU and
> +	 * this function can't return it.
> +	 */


I fixed something related in the ocxl driver (which had enough changes 
with the introduction of the "info" device to make a similar comment 
become wrong). See commit a58d37bce0d21. The issue is handling a 
simultaneous open() and removal of the device through /sysfs as best we can.

We are on a file open path and it's not like we're going to have a 
thousand clients, so performance is not that critical. We can take the 
mutex before searching in the IDR and release it after we increment the 
reference count on the device.
But that's not enough: we could still find the device in the IDR while 
it is being removed in free_ocxlpmem(). I believe the only safe way to 
address it is by removing the user-facing APIs (the char device) before 
calling device_unregister(). So that it's not possible to find the 
device in file_open() if it's in the middle of being removed.

   Fred


> +	ocxlpmem = idr_find(&minors_idr, minor);
> +	if (ocxlpmem)
> +		ocxlpmem_get(ocxlpmem);
> +	return ocxlpmem;
> +}
> +
> +static int file_open(struct inode *inode, struct file *file)
> +{
> +	struct ocxlpmem *ocxlpmem;
> +
> +	ocxlpmem = find_and_get_ocxlpmem(inode->i_rdev);
> +	if (!ocxlpmem)
> +		return -ENODEV;
> +
> +	file->private_data = ocxlpmem;
> +	return 0;
> +}
> +
> +static int file_release(struct inode *inode, struct file *file)
> +{
> +	struct ocxlpmem *ocxlpmem = file->private_data;
> +
> +	ocxlpmem_put(ocxlpmem);
> +	return 0;
> +}
> +
> +static const struct file_operations fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= file_open,
> +	.release	= file_release,
> +};
> +
> +/**
> + * create_cdev() - Create the chardev in /dev for the device
> + * @ocxlpmem: the SCM metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int create_cdev(struct ocxlpmem *ocxlpmem)
> +{
> +	cdev_init(&ocxlpmem->cdev, &fops);
> +	return cdev_add(&ocxlpmem->cdev, ocxlpmem->dev.devt, 1);
> +}
> +
>   /**
>    * ocxlpmem_remove() - Free an OpenCAPI persistent memory device
>    * @pdev: the PCI device information struct
> @@ -572,6 +640,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		goto err;
>   	}
>   
> +	if (create_cdev(ocxlpmem)) {
> +		dev_err(&pdev->dev, "Could not create character device\n");
> +		goto err;
> +	}


As already mentioned in a previous patch, we branch to the err label so 
rc needs to be set to a valid error.



> +
>   	elapsed = 0;
>   	timeout = ocxlpmem->readiness_timeout + ocxlpmem->memory_available_timeout;
>   	while (!is_usable(ocxlpmem, false)) {
> @@ -613,20 +686,59 @@ static struct pci_driver pci_driver = {
>   	.shutdown = ocxlpmem_remove,
>   };
>   
> +static int file_init(void)
> +{
> +	int rc;
> +
> +	mutex_init(&minors_idr_lock);
> +	idr_init(&minors_idr);
> +
> +	rc = alloc_chrdev_region(&ocxlpmem_dev, 0, NUM_MINORS, "ocxl-pmem");
> +	if (rc) {
> +		idr_destroy(&minors_idr);
> +		pr_err("Unable to allocate OpenCAPI persistent memory major number: %d\n", rc);
> +		return rc;
> +	}
> +
> +	ocxlpmem_class = class_create(THIS_MODULE, "ocxl-pmem");
> +	if (IS_ERR(ocxlpmem_class)) {
> +		idr_destroy(&minors_idr);
> +		pr_err("Unable to create ocxl-pmem class\n");
> +		unregister_chrdev_region(ocxlpmem_dev, NUM_MINORS);
> +		return PTR_ERR(ocxlpmem_class);
> +	}
> +
> +	return 0;
> +}
> +
> +static void file_exit(void)
> +{
> +	class_destroy(ocxlpmem_class);
> +	unregister_chrdev_region(ocxlpmem_dev, NUM_MINORS);
> +	idr_destroy(&minors_idr);
> +}
> +
>   static int __init ocxlpmem_init(void)
>   {
> -	int rc = 0;
> +	int rc;
>   
> -	rc = pci_register_driver(&pci_driver);
> +	rc = file_init();
>   	if (rc)
>   		return rc;
>   
> +	rc = pci_register_driver(&pci_driver);
> +	if (rc) {
> +		file_exit();
> +		return rc;
> +	}
> +
>   	return 0;
>   }
>   
>   static void ocxlpmem_exit(void)
>   {
>   	pci_unregister_driver(&pci_driver);
> +	file_exit();
>   }
>   
>   module_init(ocxlpmem_init);
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> index 28e2020f6355..d2d81fec7bb1 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> @@ -2,6 +2,7 @@
>   // Copyright 2019 IBM Corp.
>   
>   #include <linux/pci.h>
> +#include <linux/cdev.h>
>   #include <misc/ocxl.h>
>   #include <linux/libnvdimm.h>
>   #include <linux/mm.h>
> @@ -99,6 +100,7 @@ struct ocxlpmem_function0 {
>   struct ocxlpmem {
>   	struct device dev;
>   	struct pci_dev *pdev;
> +	struct cdev cdev;
>   	struct ocxl_fn *ocxl_fn;
>   	struct nd_interleave_set nd_set;
>   	struct nvdimm_bus_descriptor bus_desc;
> 

