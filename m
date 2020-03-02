Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED417536E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:48:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W8MB4TbmzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:48:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W83S6y0YzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:34:44 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225ML8d186061
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:34:42 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmfyjwm3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:34:42 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Mon, 2 Mar 2020 05:34:39 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:34:31 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225YUBS55115938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:34:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 628A111C052;
 Mon,  2 Mar 2020 05:34:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAB9411C05B;
 Mon,  2 Mar 2020 05:34:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Mar 2020 05:34:29 +0000 (GMT)
Received: from [9.102.43.192] (unknown [9.102.43.192])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7CC49A00BE;
 Mon,  2 Mar 2020 16:34:21 +1100 (AEDT)
Subject: Re: [PATCH v3 16/27] powerpc/powernv/pmem: Register a character
 device for userspace to interact with
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-17-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 2 Mar 2020 16:34:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-17-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0012-0000-0000-0000038C0E32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0013-0000-0000-000021C8BFB4
Message-Id: <1e980dc7-109a-d96f-1329-1c38918e2bba@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=2
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020039
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch introduces a character device (/dev/ocxl-scmX) which further
> patches will use to interact with userspace.

As with the comments on other patches in this series, this commit 
message is lacking in explanation. What's the purpose of this device?

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
> +	 * is protected by a re0ference counter on the device. By the time the
> +	 * minor number of a device is removed from the idr, the ref count of
> +	 * the device is already at 0, so no user API will access that AFU and
> +	 * this function can't return it.
> +	 */
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

If the driver is going to be called "ocxlpmem" can we standardise on 
that without the extra hyphen?

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
-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

