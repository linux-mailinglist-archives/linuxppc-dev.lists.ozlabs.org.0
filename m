Return-Path: <linuxppc-dev+bounces-970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C096B651
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 11:19:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzH4F1gWLz2yXY;
	Wed,  4 Sep 2024 19:19:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725441549;
	cv=none; b=Jg7A5gXAnn3nxgozndqV9ftSj0z/NAFvWql2nQOxPbFv/LElym8TzOi3T81v/L4tUVvTVgU9YMP4yhDfNWGrVbeD1dD89RGmKfo9QOqWvlnxp16exGKulkrVwHzBpWS/5OKu38MOKbe4qvsF4YIjLgkBY2CWWWmQuNOf1QVbg/qiF9AVV7aW+7d6EC1OAHHgonAOOAOobeTkgQSU8E/knkOuYwmD2oig5Md96iGIYKuxR/gTJlLvj9HV46zwNTeBVYm/gLz80vLsHTn/tavDBMMVVJdNpRhDo9SwSrt63WGhrZboqszynA5rrUawpC5abfGD3f9yyRob8C7jVUSNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725441549; c=relaxed/relaxed;
	bh=No+ZWBVLeGFEntqxKUPXdow5p2Qk0f8/DwriUb8SxDM=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:In-Reply-To:MIME-Version; b=PTQj6T2NMQw+9cjHT6yX9TK13KXuYQ6L7TTSxAXC2S+pAKAk9iVjqziNUcyN8RgtNXy2bgbrsPdfLA5/WSe/ghCBqgHX0/k8vwMMaiXFGsqtxrga16XPuZ+DklZckOhTW9wLs995MoNSXHm5OURLSDaDGCSXDU6BpMJs/5goxp1a2Xn/bAZhGoHG2WNnN9HovZfwJ7/IQYomNTWkkt4khDComZhrXexCvWpNCuJhrrKH912BEIJAUlIwpj0Todi9Fmxl2dlw1vFIGP2dNeX/jwOhz2J4kAS8KvnWvRzQ5azrttAwwKW+U1sE/WbAOIMtoazcJA/As2aUWkuRmHLYMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qaNOBQy9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qaNOBQy9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzH4D3QbBz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 19:19:07 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4848NRVI005433;
	Wed, 4 Sep 2024 09:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:reply-to:references:content-type
	:in-reply-to:mime-version; s=pp1; bh=No+ZWBVLeGFEntqxKUPXdow5p2Q
	k0f8/DwriUb8SxDM=; b=qaNOBQy9Xfw3JJ/UJtcCtCh/i/Vw3EizXCnI2Cpn86h
	iE/B50YF4OAIM7b2O1T0v5PQkEL/NOgb9NRpZyJnh4/WY15Yshz1p6AWQeWzG+iQ
	WBKdDvis8DPazVfTsYTH7JaptCTuu4UnNA8CMVJ9X60IfyL7sqU+XG9fi7jDs5HF
	+hGEuAUAbWmemgsm+bxW3i5Wgs2QCZ8SCYn7K0PsBQ/8bU6FpgHmgPX11NZ55K4z
	tEpBY2B6wBKI3n4HlD33IvSGIO5nDjqE2MltFmq4SD4FTXKyq04ZKcAjcRgmxKdQ
	79Cfo5LchW/nwpliW88hOY7kM5X2FJozl7Qa0nkyPEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41brkqtmk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 09:18:55 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4849EMiu013481;
	Wed, 4 Sep 2024 09:18:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41brkqtmju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 09:18:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4848dWYD018726;
	Wed, 4 Sep 2024 09:18:54 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41cdw174a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 09:18:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4849Io9F15139186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Sep 2024 09:18:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E0C12004E;
	Wed,  4 Sep 2024 09:18:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CE2E2004B;
	Wed,  4 Sep 2024 09:18:48 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.216.36])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Sep 2024 09:18:48 +0000 (GMT)
Date: Wed, 4 Sep 2024 14:48:46 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com,
        ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH v2] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Message-ID: <hop6tsixsczuktfowy5hqo6hbfllogomkxgjvkimrxm7bt3pt3@hcvxg552xkoc>
Reply-To: mahesh@linux.ibm.com
References: <20240823151158.92602-1-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823151158.92602-1-nnmlinux@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 049Qn5xHnq_pk63kbZqNV7QrvbNft6W6
X-Proofpoint-ORIG-GUID: VvBqTS0_l0D8lbvtSckAPfRNPsDqGlFA
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_07,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040067

On 2024-08-23 10:11:58 Fri, Narayana Murty N wrote:
> VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
> due to missing implementation of err_inject eeh_ops for pseries.
> This patch implements pseries_eeh_err_inject in eeh_ops/pseries
> eeh_ops. Implements support for injecting MMIO load/store error
> for testing from user space.
> 
> The check on PCI error type code is moved to platform code, since
> the eeh_pe_inject_err can be allowed to more error types depending
> on platform requirement.
> 
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
> 
> Testing:
> ========
> vfio-test [1] by Alex Willamson, was forked and updated to add
> support inject error on pSeries guest and used to test this
> patch[2].
> 
> References:
> ===========
> [1] https://github.com/awilliam/tests
> [2] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex
> 
> ================
> Changelog:
> V1:https://lore.kernel.org/all/20240822082713.529982-1-nnmlinux@linux.ibm.com/
> - Resolved build issues for ppc64|le_defconfig by moving the
> pseries_eeh_err_inject() definition outside of the CONFIG_PCI_IOV
> code block.
> - New eeh_pe_inject_mmio_error wrapper function added to avoid
> CONFIG_EEH is not set.
> ---
>  arch/powerpc/include/asm/eeh.h               |  6 ++-
>  arch/powerpc/kernel/eeh.c                    |  9 +++--
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 39 +++++++++++++++++++-
>  3 files changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 91a9fd53254f..8da6b047a4fe 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -308,7 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
>  int eeh_pe_configure(struct eeh_pe *pe);
>  int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>  		      unsigned long addr, unsigned long mask);
> -
> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev);
>  /**
>   * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
>   *
> @@ -338,6 +338,10 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
>  	return 0;
>  }
>  
> +static inline int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
> +{
> +	return -ENXIO;
> +}
>  #define eeh_dev_check_failure(x) (0)
>  
>  static inline void eeh_addr_cache_init(void) { }
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index d03f17987fca..49ab11a287a3 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1537,10 +1537,6 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>  	if (!eeh_ops || !eeh_ops->err_inject)
>  		return -ENOENT;
>  
> -	/* Check on PCI error type */
> -	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
> -		return -EINVAL;
> -
>  	/* Check on PCI error function */
>  	if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
>  		return -EINVAL;
> @@ -1851,6 +1847,11 @@ static const struct file_operations eeh_dev_break_fops = {
>  	.read   = eeh_debugfs_dev_usage,
>  };
>  
> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
> +{
> +	return eeh_debugfs_break_device(pdev);
> +}
> +
>  static ssize_t eeh_dev_can_recover(struct file *filp,
>  				   const char __user *user_buf,
>  				   size_t count, loff_t *ppos)
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index b1ae0c0d1187..1893f66371fa 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -784,6 +784,43 @@ static int pseries_notify_resume(struct eeh_dev *edev)
>  }
>  #endif
>  
> +/**
> + * pseries_eeh_err_inject - Inject specified error to the indicated PE
> + * @pe: the indicated PE
> + * @type: error type
> + * @func: specific error type
> + * @addr: address
> + * @mask: address mask
> + * The routine is called to inject specified error, which is
> + * determined by @type and @func, to the indicated PE
> + */
> +static int pseries_eeh_err_inject(struct eeh_pe *pe, int type, int func,
> +				  unsigned long addr, unsigned long mask)
> +{
> +	struct	eeh_dev	*pdev;
> +
> +	/* Check on PCI error type */
> +	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
> +		return -EINVAL;
> +
> +	switch (func) {
> +	case EEH_ERR_FUNC_LD_MEM_ADDR:
> +	case EEH_ERR_FUNC_LD_MEM_DATA:
> +	case EEH_ERR_FUNC_ST_MEM_ADDR:
> +	case EEH_ERR_FUNC_ST_MEM_DATA:
> +		/* injects a MMIO error for all pdev's belonging to PE */
> +		pci_lock_rescan_remove();
> +		list_for_each_entry(pdev, &pe->edevs, entry)
> +			eeh_pe_inject_mmio_error(pdev->pdev);
> +		pci_unlock_rescan_remove();


Changes looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

I have tested this with your VFIO chenges at https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex

Tested-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

