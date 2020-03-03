Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CAB176FB6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 08:05:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wp1C5WD2zDqS2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 18:05:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wnz351bxzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 18:03:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02370ft4145553
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 02:03:09 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmqaqq98-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 02:03:08 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Tue, 3 Mar 2020 07:03:05 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 07:02:58 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02372vBr55443644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 07:02:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DEEE5204E;
 Tue,  3 Mar 2020 07:02:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 768D152050;
 Tue,  3 Mar 2020 07:02:56 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 27901A024B;
 Tue,  3 Mar 2020 18:02:51 +1100 (AEDT)
Subject: Re: [PATCH v3 20/27] powerpc/powernv/pmem: Forward events to userspace
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-21-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Tue, 3 Mar 2020 18:02:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-21-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030307-4275-0000-0000-000003A7C872
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030307-4276-0000-0000-000038BCCF7D
Message-Id: <d50b19fc-b88a-b4de-4cc5-07790a4ddac0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_01:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030053
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

On 21/2/20 2:27 pm, Alastair D'Silva wrote:> @@ -938,6 +955,51 @@ static 
int ioctl_controller_stats(struct ocxlpmem *ocxlpmem,
>   	return rc;
>   }
>   
> +static int ioctl_eventfd(struct ocxlpmem *ocxlpmem,
> +		 struct ioctl_ocxl_pmem_eventfd __user *uarg)
> +{
> +	struct ioctl_ocxl_pmem_eventfd args;
> +
> +	if (copy_from_user(&args, uarg, sizeof(args)))
> +		return -EFAULT;
> +
> +	if (ocxlpmem->ev_ctx)
> +		return -EINVAL;

I think EBUSY is more appropriate here.

> +
> +	ocxlpmem->ev_ctx = eventfd_ctx_fdget(args.eventfd);
> +	if (!ocxlpmem->ev_ctx)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int ioctl_event_check(struct ocxlpmem *ocxlpmem, u64 __user *uarg)
> +{
> +	u64 val = 0;
> +	int rc;
> +	u64 chi = 0;
> +
> +	rc = ocxlpmem_chi(ocxlpmem, &chi);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (chi & GLOBAL_MMIO_CHI_ELA)
> +		val |= IOCTL_OCXL_PMEM_EVENT_ERROR_LOG_AVAILABLE;
> +
> +	if (chi & GLOBAL_MMIO_CHI_CDA)
> +		val |= IOCTL_OCXL_PMEM_EVENT_CONTROLLER_DUMP_AVAILABLE;
> +
> +	if (chi & GLOBAL_MMIO_CHI_CFFS)
> +		val |= IOCTL_OCXL_PMEM_EVENT_FIRMWARE_FATAL;
> +
> +	if (chi & GLOBAL_MMIO_CHI_CHFS)
> +		val |= IOCTL_OCXL_PMEM_EVENT_HARDWARE_FATAL;
> +
> +	rc = copy_to_user((u64 __user *) uarg, &val, sizeof(val));
> +
> +	return rc;
> +}
> +
>   static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
>   {
>   	struct ocxlpmem *ocxlpmem = file->private_data;
> @@ -966,6 +1028,15 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
>   		rc = ioctl_controller_stats(ocxlpmem,
>   					    (struct ioctl_ocxl_pmem_controller_stats __user *)args);
>   		break;
> +
> +	case IOCTL_OCXL_PMEM_EVENTFD:
> +		rc = ioctl_eventfd(ocxlpmem,
> +				   (struct ioctl_ocxl_pmem_eventfd __user *)args);
> +		break;
> +
> +	case IOCTL_OCXL_PMEM_EVENT_CHECK:
> +		rc = ioctl_event_check(ocxlpmem, (u64 __user *)args);
> +		break;
>   	}
>   
>   	return rc;
> @@ -1107,6 +1178,146 @@ static void dump_error_log(struct ocxlpmem *ocxlpmem)
>   	kfree(buf);
>   }
>   
> +static irqreturn_t imn0_handler(void *private)
> +{
> +	struct ocxlpmem *ocxlpmem = private;
> +	u64 chi = 0;
> +
> +	(void)ocxlpmem_chi(ocxlpmem, &chi);
> +
> +	if (chi & GLOBAL_MMIO_CHI_ELA) {
> +		dev_warn(&ocxlpmem->dev, "Error log is available\n");
> +
> +		if (ocxlpmem->ev_ctx)
> +			eventfd_signal(ocxlpmem->ev_ctx, 1);
> +	}
> +
> +	if (chi & GLOBAL_MMIO_CHI_CDA) {
> +		dev_warn(&ocxlpmem->dev, "Controller dump is available\n");
> +
> +		if (ocxlpmem->ev_ctx)
> +			eventfd_signal(ocxlpmem->ev_ctx, 1);
> +	}
> +
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t imn1_handler(void *private)
> +{
> +	struct ocxlpmem *ocxlpmem = private;
> +	u64 chi = 0;
> +
> +	(void)ocxlpmem_chi(ocxlpmem, &chi);
> +
> +	if (chi & (GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS)) {
> +		dev_err(&ocxlpmem->dev,
> +			"Controller status is fatal, chi=0x%llx, going offline\n", chi);
> +
> +		if (ocxlpmem->nvdimm_bus) {
> +			nvdimm_bus_unregister(ocxlpmem->nvdimm_bus);
> +			ocxlpmem->nvdimm_bus = NULL;
> +		}
> +
> +		if (ocxlpmem->ev_ctx)
> +			eventfd_signal(ocxlpmem->ev_ctx, 1);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +
> +/**
> + * ocxlpmem_setup_irq() - Set up the IRQs for the OpenCAPI Persistent Memory device
> + * @ocxlpmem: the device metadata
> + * Return: 0 on success, negative on failure
> + */
> +static int ocxlpmem_setup_irq(struct ocxlpmem *ocxlpmem)
> +{
> +	int rc;
> +	u64 irq_addr;
> +
> +	rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context, &ocxlpmem->irq_id[0]);
> +	if (rc)
> +		return rc;
> +
> +	rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[0],
> +				  imn0_handler, NULL, ocxlpmem);
> +
> +	irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context, ocxlpmem->irq_id[0]);
> +	if (!irq_addr)
> +		return -EINVAL;
> +
> +	ocxlpmem->irq_addr[0] = ioremap(irq_addr, PAGE_SIZE);
> +	if (!ocxlpmem->irq_addr[0])
> +		return -EINVAL;

Something other than EINVAL for these two

> +
> +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA0_OHP,
> +				      OCXL_LITTLE_ENDIAN,
> +				      (u64)ocxlpmem->irq_addr[0]);
> +	if (rc)
> +		goto out_irq0;
> +
> +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA0_CFP,
> +				      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out_irq0;
> +
> +	rc = ocxl_afu_irq_alloc(ocxlpmem->ocxl_context, &ocxlpmem->irq_id[1]);
> +	if (rc)
> +		goto out_irq0;
> +
> +
> +	rc = ocxl_irq_set_handler(ocxlpmem->ocxl_context, ocxlpmem->irq_id[1],
> +				  imn1_handler, NULL, ocxlpmem);
> +	if (rc)
> +		goto out_irq0;
> +
> +	irq_addr = ocxl_afu_irq_get_addr(ocxlpmem->ocxl_context, ocxlpmem->irq_id[1]);
> +	if (!irq_addr) {
> +		rc = -EFAULT;
> +		goto out_irq0;
> +	}
> +
> +	ocxlpmem->irq_addr[1] = ioremap(irq_addr, PAGE_SIZE);
> +	if (!ocxlpmem->irq_addr[1]) {
> +		rc = -EINVAL;
> +		goto out_irq0;
> +	}
> +
> +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA1_OHP,
> +				      OCXL_LITTLE_ENDIAN,
> +				      (u64)ocxlpmem->irq_addr[1]);
> +	if (rc)
> +		goto out_irq1;
> +
> +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_IMA1_CFP,
> +				      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out_irq1;
> +
> +	// Enable doorbells
> +	rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIE,
> +				    OCXL_LITTLE_ENDIAN,
> +				    GLOBAL_MMIO_CHI_ELA | GLOBAL_MMIO_CHI_CDA |
> +				    GLOBAL_MMIO_CHI_CFFS | GLOBAL_MMIO_CHI_CHFS |
> +				    GLOBAL_MMIO_CHI_NSCRA);

We don't actually do anything in the handlers with NSCRA...

> +	if (rc)
> +		goto out_irq1;
> +
> +	return 0;
> +
> +out_irq1:
> +	iounmap(ocxlpmem->irq_addr[1]);
> +	ocxlpmem->irq_addr[1] = NULL;
> +
> +out_irq0:
> +	iounmap(ocxlpmem->irq_addr[0]);
> +	ocxlpmem->irq_addr[0] = NULL;
> +
> +	return rc;
> +}
> +
>   /**
>    * probe_function0() - Set up function 0 for an OpenCAPI persistent memory device
>    * This is important as it enables templates higher than 0 across all other functions,
> @@ -1216,6 +1427,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		goto err;
>   	}
>   
> +	if (ocxlpmem_setup_irq(ocxlpmem)) {
> +		dev_err(&pdev->dev, "Could not set up OCXL IRQs\n");
> +		goto err;
> +	}
> +
>   	if (setup_command_metadata(ocxlpmem)) {
>   		dev_err(&pdev->dev, "Could not read OCXL command matada\n");
>   		goto err;
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> index b953ee522ed4..927690f4888f 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> @@ -103,6 +103,10 @@ struct ocxlpmem {
>   	struct pci_dev *pdev;
>   	struct cdev cdev;
>   	struct ocxl_fn *ocxl_fn;
> +#define SCM_IRQ_COUNT 2
> +	int irq_id[SCM_IRQ_COUNT];
> +	struct dev_pagemap irq_pgmap[SCM_IRQ_COUNT];
> +	void *irq_addr[SCM_IRQ_COUNT];

I think this should be tagged __iomem

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

