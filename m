Return-Path: <linuxppc-dev+bounces-560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3ED9600C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 07:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtFnW428rz2yGd;
	Tue, 27 Aug 2024 15:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724735039;
	cv=none; b=DGDOAV0a7SBxuYDoIZibs5OsGRbgLwzIkHIrRKYnlxlM7IYrWCPrsovMjALdC30bpgVcmwOh2Q0OyurXRzLzWbiXzs1UTW7aOxy3amp1iyR2Ee3nn9R+njq7scb03Xkp7V3/HDUfw9zxDOhvbiNG8l1vfEeiLPem8ULL2JAXqMHN+J+MIsbfsJAvZQpZvxIXKwxOWReJPLx9vOlmOLusw9qwrK6dnYko8l31yNi+1Yp4Rnr5Sv5XZ0Okdz7NwxyLu5vpico70+Ye4so5KHeMR28S6T/C2bl7ZDA6CMcrHQOOt4CXjf/rLyCN/ATHvjrwYFMuSv5QhdFoziJz7FDXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724735039; c=relaxed/relaxed;
	bh=xAJzky6VlIH1RnuZZ+v8zK2DMOHKt74QQUCJakQdb5Y=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-UnRewURL:MIME-Version:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=WrHE9D2uZMQngvw4UR+OElB00L1tHXypw2orfr+VyzZR2m5x4uyOxkmp7uu/esbOkPv0UeZBQ62CRJnjCOTUbLIFFK6YztoJiot5deHZUSI0eBD8fBNqLiCGz2ttUmh/6QU9buWnF/t8kaxNXdwg9OqgEnOWII4txxycqqWNWmFZMRFxMeTM7wHwPcYTIiLBDg3wmaeKLpgt05BHmoZxJAUWuJZ1or9H22DXbtW5DOsuI/T0EryFrHfJFGKHyJ1x9I8NR+szaCtxPs1ugZDv+3TKhr+xh71hkBEchWutBRqP/iCDDiGDZ5z1uvB7tPRfTgjPg4oRiyvGz9rv1reyUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C6K7KLFN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C6K7KLFN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtFnV3cwdz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 15:03:58 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R1xInM014691;
	Tue, 27 Aug 2024 05:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=pp1; bh=xAJzky6VlIH1RnuZZ+v8zK2DMO
	HKt74QQUCJakQdb5Y=; b=C6K7KLFNOTuJ9htRHzHKbjaHt+E7CNpx7t0cHQ5R6U
	aHyr/LiKc6yKJxnUaRDmNHxe+I/7J+xQGOge10hC6jmKbA1wwqEeR52yr2f7sZCs
	1O8ePMce2EggtPPQxbCImk8yTRfYstvkva7WRv2LBj5W9zlE40bcON1zK23KZQTx
	C+6VPDiZhvYkBIxaAOtCUW4IKYwIQu7oFo9HW0fZ4G2WhiHL0R+9rIPoBeXrd3nl
	UavbArx0YGqEjDRz53gPDHjSEYM4CT6lrM6MsJQd94uFkL5Swbyn1kprQ3p7CR4g
	dbidj2mDi8na6B4VLXp4cvtW5ZMf/tIW3RZ+DxiiO44w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417g51hyj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:03:45 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47R4xDON021942;
	Tue, 27 Aug 2024 05:03:44 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417g51hyj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:03:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47R15VWq021741;
	Tue, 27 Aug 2024 05:03:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 417suu9grg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:03:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47R53dk943319728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 05:03:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3D7F2004B;
	Tue, 27 Aug 2024 05:03:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C272820049;
	Tue, 27 Aug 2024 05:03:36 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.171.52.227])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 27 Aug 2024 05:03:36 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Tue, 27 Aug 2024 10:33:35 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ganeshgr@linux.ibm.com,
        sbhat@linux.ibm.com
Subject: Re: [PATCH v2] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
In-Reply-To: <20240823151158.92602-1-nnmlinux@linux.ibm.com>
References: <20240823151158.92602-1-nnmlinux@linux.ibm.com>
Date: Tue, 27 Aug 2024 10:33:35 +0530
Message-ID: <87mskyy2u0.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EBJ-5CNmJ00Fq8A7LUKkvr-9dGVWlGVj
X-Proofpoint-GUID: 91vrVtlJbTAMZB9e6bld7jglgBs4r2UB
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_03,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408270035

Hi Narayana,

Thanks for the patch.

Narayana Murty N <nnmlinux@linux.ibm.com> writes:

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

Code changes LGTM, hence
Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

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
> +		break;
> +	default:
> +		return -ERANGE;
> +	}
> +
> +	return 0;
> +}
> +
>  static struct eeh_ops pseries_eeh_ops = {
>  	.name			= "pseries",
>  	.probe			= pseries_eeh_probe,
> @@ -792,7 +829,7 @@ static struct eeh_ops pseries_eeh_ops = {
>  	.reset			= pseries_eeh_reset,
>  	.get_log		= pseries_eeh_get_log,
>  	.configure_bridge       = pseries_eeh_configure_bridge,
> -	.err_inject		= NULL,
> +	.err_inject		= pseries_eeh_err_inject,
>  	.read_config		= pseries_eeh_read_config,
>  	.write_config		= pseries_eeh_write_config,
>  	.next_error		= NULL,
> -- 
> 2.45.2
>

-- 
Cheers
~ Vaibhav

