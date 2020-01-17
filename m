Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03738140DC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 16:23:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zlFz63rBzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 02:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zgtM2dQhzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 23:51:37 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HClHkp084857; Fri, 17 Jan 2020 07:51:21 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xk0qrutb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 07:51:21 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00HClJCH085200;
 Fri, 17 Jan 2020 07:51:21 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xk0qrutam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 07:51:21 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00HCjUki024202;
 Fri, 17 Jan 2020 12:51:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2xhmfa8w4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 12:51:20 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00HCpJct54460730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 12:51:20 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD246B2065;
 Fri, 17 Jan 2020 12:51:19 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C096EB205F;
 Fri, 17 Jan 2020 12:51:14 +0000 (GMT)
Received: from [9.102.19.8] (unknown [9.102.19.8])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jan 2020 12:51:14 +0000 (GMT)
Message-ID: <1579265473.17382.5.camel@abdul>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when
 unloading mpt3sas driver
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Fri, 17 Jan 2020 18:21:13 +0530
In-Reply-To: <20200116174443.GA30158@infradead.org>
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
 <20200109142218.GA16477@infradead.org>
 <1578980874.11996.3.camel@abdul.in.ibm.com>
 <20200116174443.GA30158@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 mlxlogscore=873
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170102
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Chaitra P B <chaitra.basappa@broadcom.com>,
 linux-scsi <linux-scsi@vger.kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 manvanth <manvanth@linux.vnet.ibm.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>, jcmvbkbc@gmail.com,
 iommu@lists.linux-foundation.org, linux-next <linux-next@vger.kernel.org>,
 Oliver <oohall@gmail.com>, "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-01-16 at 09:44 -0800, Christoph Hellwig wrote:
> Hi Abdul,
> 
> I think the problem is that mpt3sas has some convoluted logic to do
> some DMA allocations with a 32-bit coherent mask, and then switches
> to a 63 or 64 bit mask, which is not supported by the DMA API.
> 
> Can you try the patch below?

Thank you Christoph, with the given patch applied the bug is not seen.

rmmod of mpt3sas driver is successful, no kernel Oops

Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

> 
> ---
> From 0738b1704ed528497b41b0408325f6828a8e51f6 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Thu, 16 Jan 2020 18:31:38 +0100
> Subject: mpt3sas: don't change the dma coherent mask after allocations
> 
> The DMA layer does not allow changing the DMA coherent mask after
> there are outstanding allocations.  Stop doing that and always
> use a 32-bit coherent DMA mask in mpt3sas.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/scsi/mpt3sas/mpt3sas_base.c | 67 ++++++++---------------------
>  drivers/scsi/mpt3sas/mpt3sas_base.h |  2 -
>  2 files changed, 19 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
> index fea3cb6a090b..3b51bed05008 100644
> --- a/drivers/scsi/mpt3sas/mpt3sas_base.c
> +++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
> @@ -2706,58 +2706,38 @@ _base_build_sg_ieee(struct MPT3SAS_ADAPTER *ioc, void *psge,
>  static int
>  _base_config_dma_addressing(struct MPT3SAS_ADAPTER *ioc, struct pci_dev *pdev)
>  {
> -	u64 required_mask, coherent_mask;
>  	struct sysinfo s;
> -	/* Set 63 bit DMA mask for all SAS3 and SAS35 controllers */
> -	int dma_mask = (ioc->hba_mpi_version_belonged > MPI2_VERSION) ? 63 : 64;
> -
> -	if (ioc->is_mcpu_endpoint)
> -		goto try_32bit;
> +	int dma_mask;
> 
> -	required_mask = dma_get_required_mask(&pdev->dev);
> -	if (sizeof(dma_addr_t) == 4 || required_mask == 32)
> -		goto try_32bit;
> -
> -	if (ioc->dma_mask)
> -		coherent_mask = DMA_BIT_MASK(dma_mask);
> +	if (ioc->is_mcpu_endpoint ||
> +	    sizeof(dma_addr_t) == 4 ||
> +	    dma_get_required_mask(&pdev->dev) <= 32)
> +		dma_mask = 32;
> +	/* Set 63 bit DMA mask for all SAS3 and SAS35 controllers */
> +	else if (ioc->hba_mpi_version_belonged > MPI2_VERSION)
> +		dma_mask = 63;
>  	else
> -		coherent_mask = DMA_BIT_MASK(32);
> +		dma_mask = 64;
> 
>  	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(dma_mask)) ||
> -	    dma_set_coherent_mask(&pdev->dev, coherent_mask))
> -		goto try_32bit;
> -
> -	ioc->base_add_sg_single = &_base_add_sg_single_64;
> -	ioc->sge_size = sizeof(Mpi2SGESimple64_t);
> -	ioc->dma_mask = dma_mask;
> -	goto out;
> -
> - try_32bit:
> -	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)))
> +	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32)))
>  		return -ENODEV;
> 
> -	ioc->base_add_sg_single = &_base_add_sg_single_32;
> -	ioc->sge_size = sizeof(Mpi2SGESimple32_t);
> -	ioc->dma_mask = 32;
> - out:
> +	if (dma_mask > 32) {
> +		ioc->base_add_sg_single = &_base_add_sg_single_64;
> +		ioc->sge_size = sizeof(Mpi2SGESimple64_t);
> +	} else {
> +		ioc->base_add_sg_single = &_base_add_sg_single_32;
> +		ioc->sge_size = sizeof(Mpi2SGESimple32_t);
> +	}
> +
>  	si_meminfo(&s);
>  	ioc_info(ioc, "%d BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (%ld kB)\n",
> -		 ioc->dma_mask, convert_to_kb(s.totalram));
> +		 dma_mask, convert_to_kb(s.totalram));
> 
>  	return 0;
>  }
> 
> -static int
> -_base_change_consistent_dma_mask(struct MPT3SAS_ADAPTER *ioc,
> -				      struct pci_dev *pdev)
> -{
> -	if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(ioc->dma_mask))) {
> -		if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32)))
> -			return -ENODEV;
> -	}
> -	return 0;
> -}
> -
>  /**
>   * _base_check_enable_msix - checks MSIX capabable.
>   * @ioc: per adapter object
> @@ -5030,14 +5010,6 @@ _base_allocate_memory_pools(struct MPT3SAS_ADAPTER *ioc)
>  		total_sz += sz;
>  	} while (ioc->rdpq_array_enable && (++i < ioc->reply_queue_count));
> 
> -	if (ioc->dma_mask > 32) {
> -		if (_base_change_consistent_dma_mask(ioc, ioc->pdev) != 0) {
> -			ioc_warn(ioc, "no suitable consistent DMA mask for %s\n",
> -				 pci_name(ioc->pdev));
> -			goto out;
> -		}
> -	}
> -
>  	ioc->scsiio_depth = ioc->hba_queue_depth -
>  	    ioc->hi_priority_depth - ioc->internal_depth;
> 
> @@ -6965,7 +6937,6 @@ mpt3sas_base_attach(struct MPT3SAS_ADAPTER *ioc)
>  	ioc->smp_affinity_enable = smp_affinity_enable;
> 
>  	ioc->rdpq_array_enable_assigned = 0;
> -	ioc->dma_mask = 0;
>  	if (ioc->is_aero_ioc)
>  		ioc->base_readl = &_base_readl_aero;
>  	else
> diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.h b/drivers/scsi/mpt3sas/mpt3sas_base.h
> index faca0a5e71f8..e57cade1155c 100644
> --- a/drivers/scsi/mpt3sas/mpt3sas_base.h
> +++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
> @@ -1011,7 +1011,6 @@ typedef void (*MPT3SAS_FLUSH_RUNNING_CMDS)(struct MPT3SAS_ADAPTER *ioc);
>   * @ir_firmware: IR firmware present
>   * @bars: bitmask of BAR's that must be configured
>   * @mask_interrupts: ignore interrupt
> - * @dma_mask: used to set the consistent dma mask
>   * @pci_access_mutex: Mutex to synchronize ioctl, sysfs show path and
>   *			pci resource handling
>   * @fault_reset_work_q_name: fw fault work queue
> @@ -1185,7 +1184,6 @@ struct MPT3SAS_ADAPTER {
>  	u8		ir_firmware;
>  	int		bars;
>  	u8		mask_interrupts;
> -	int		dma_mask;
> 
>  	/* fw fault handler */
>  	char		fault_reset_work_q_name[20];


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



