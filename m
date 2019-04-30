Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E755EF93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 06:27:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tT5L6nVGzDqRn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=andrew.donnellan@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tT3n2lt0zDq7g
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 14:25:56 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U4LpRs029046
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 00:25:53 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6e9j207a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 00:25:53 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <andrew.donnellan@au1.ibm.com>;
 Tue, 30 Apr 2019 05:25:51 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 05:25:48 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U4PlH158851398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 04:25:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85A744C04A;
 Tue, 30 Apr 2019 04:25:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2D704C044;
 Tue, 30 Apr 2019 04:25:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 04:25:46 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D61FEA01D2;
 Tue, 30 Apr 2019 14:25:44 +1000 (AEST)
Subject: Re: [PATCH v4 2/7] ocxl: Don't pass pci_dev around
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190327053137.15173-1-alastair@au1.ibm.com>
 <20190327053137.15173-3-alastair@au1.ibm.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Tue, 30 Apr 2019 14:25:44 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190327053137.15173-3-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19043004-0008-0000-0000-000002E1ADC5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043004-0009-0000-0000-0000224E13CA
Message-Id: <f550af38-35b8-0e77-0833-e23ab2c4aa76@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300028
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
> This data is already available in a struct
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

> ---
>   drivers/misc/ocxl/core.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> index 1a4411b72d35..2f2fe12eac1e 100644
> --- a/drivers/misc/ocxl/core.c
> +++ b/drivers/misc/ocxl/core.c
> @@ -66,10 +66,11 @@ static int set_afu_device(struct ocxl_afu *afu, const char *location)
>   	return rc;
>   }
>   
> -static int assign_afu_actag(struct ocxl_afu *afu, struct pci_dev *dev)
> +static int assign_afu_actag(struct ocxl_afu *afu)
>   {
>   	struct ocxl_fn *fn = afu->fn;
>   	int actag_count, actag_offset;
> +	struct pci_dev *pci_dev = to_pci_dev(fn->dev.parent);
>   
>   	/*
>   	 * if there were not enough actags for the function, each afu
> @@ -79,16 +80,16 @@ static int assign_afu_actag(struct ocxl_afu *afu, struct pci_dev *dev)
>   		fn->actag_enabled / fn->actag_supported;
>   	actag_offset = ocxl_actag_afu_alloc(fn, actag_count);
>   	if (actag_offset < 0) {
> -		dev_err(&afu->dev, "Can't allocate %d actags for AFU: %d\n",
> +		dev_err(&pci_dev->dev, "Can't allocate %d actags for AFU: %d\n",
>   			actag_count, actag_offset);
>   		return actag_offset;
>   	}
>   	afu->actag_base = fn->actag_base + actag_offset;
>   	afu->actag_enabled = actag_count;
>   
> -	ocxl_config_set_afu_actag(dev, afu->config.dvsec_afu_control_pos,
> +	ocxl_config_set_afu_actag(pci_dev, afu->config.dvsec_afu_control_pos,
>   				afu->actag_base, afu->actag_enabled);
> -	dev_dbg(&afu->dev, "actag base=%d enabled=%d\n",
> +	dev_dbg(&pci_dev->dev, "actag base=%d enabled=%d\n",
>   		afu->actag_base, afu->actag_enabled);
>   	return 0;
>   }
> @@ -103,10 +104,11 @@ static void reclaim_afu_actag(struct ocxl_afu *afu)
>   	ocxl_actag_afu_free(afu->fn, start_offset, size);
>   }
>   
> -static int assign_afu_pasid(struct ocxl_afu *afu, struct pci_dev *dev)
> +static int assign_afu_pasid(struct ocxl_afu *afu)
>   {
>   	struct ocxl_fn *fn = afu->fn;
>   	int pasid_count, pasid_offset;
> +	struct pci_dev *pci_dev = to_pci_dev(fn->dev.parent);
>   
>   	/*
>   	 * We only support the case where the function configuration
> @@ -115,7 +117,7 @@ static int assign_afu_pasid(struct ocxl_afu *afu, struct pci_dev *dev)
>   	pasid_count = 1 << afu->config.pasid_supported_log;
>   	pasid_offset = ocxl_pasid_afu_alloc(fn, pasid_count);
>   	if (pasid_offset < 0) {
> -		dev_err(&afu->dev, "Can't allocate %d PASIDs for AFU: %d\n",
> +		dev_err(&pci_dev->dev, "Can't allocate %d PASIDs for AFU: %d\n",
>   			pasid_count, pasid_offset);
>   		return pasid_offset;
>   	}
> @@ -123,10 +125,10 @@ static int assign_afu_pasid(struct ocxl_afu *afu, struct pci_dev *dev)
>   	afu->pasid_count = 0;
>   	afu->pasid_max = pasid_count;
>   
> -	ocxl_config_set_afu_pasid(dev, afu->config.dvsec_afu_control_pos,
> +	ocxl_config_set_afu_pasid(pci_dev, afu->config.dvsec_afu_control_pos,
>   				afu->pasid_base,
>   				afu->config.pasid_supported_log);
> -	dev_dbg(&afu->dev, "PASID base=%d, enabled=%d\n",
> +	dev_dbg(&pci_dev->dev, "PASID base=%d, enabled=%d\n",
>   		afu->pasid_base, pasid_count);
>   	return 0;
>   }
> @@ -172,9 +174,10 @@ static void release_fn_bar(struct ocxl_fn *fn, int bar)
>   	WARN_ON(fn->bar_used[idx] < 0);
>   }
>   
> -static int map_mmio_areas(struct ocxl_afu *afu, struct pci_dev *dev)
> +static int map_mmio_areas(struct ocxl_afu *afu)
>   {
>   	int rc;
> +	struct pci_dev *pci_dev = to_pci_dev(afu->fn->dev.parent);
>   
>   	rc = reserve_fn_bar(afu->fn, afu->config.global_mmio_bar);
>   	if (rc)
> @@ -187,10 +190,10 @@ static int map_mmio_areas(struct ocxl_afu *afu, struct pci_dev *dev)
>   	}
>   
>   	afu->global_mmio_start =
> -		pci_resource_start(dev, afu->config.global_mmio_bar) +
> +		pci_resource_start(pci_dev, afu->config.global_mmio_bar) +
>   		afu->config.global_mmio_offset;
>   	afu->pp_mmio_start =
> -		pci_resource_start(dev, afu->config.pp_mmio_bar) +
> +		pci_resource_start(pci_dev, afu->config.pp_mmio_bar) +
>   		afu->config.pp_mmio_offset;
>   
>   	afu->global_mmio_ptr = ioremap(afu->global_mmio_start,
> @@ -198,7 +201,7 @@ static int map_mmio_areas(struct ocxl_afu *afu, struct pci_dev *dev)
>   	if (!afu->global_mmio_ptr) {
>   		release_fn_bar(afu->fn, afu->config.pp_mmio_bar);
>   		release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> -		dev_err(&dev->dev, "Error mapping global mmio area\n");
> +		dev_err(&pci_dev->dev, "Error mapping global mmio area\n");
>   		return -ENOMEM;
>   	}
>   
> @@ -234,17 +237,17 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>   	if (rc)
>   		return rc;
>   
> -	rc = assign_afu_actag(afu, dev);
> +	rc = assign_afu_actag(afu);
>   	if (rc)
>   		return rc;
>   
> -	rc = assign_afu_pasid(afu, dev);
> +	rc = assign_afu_pasid(afu);
>   	if (rc) {
>   		reclaim_afu_actag(afu);
>   		return rc;
>   	}
>   
> -	rc = map_mmio_areas(afu, dev);
> +	rc = map_mmio_areas(afu);
>   	if (rc) {
>   		reclaim_afu_pasid(afu);
>   		reclaim_afu_actag(afu);
> @@ -331,7 +334,7 @@ void remove_afu(struct ocxl_afu *afu)
>   	device_unregister(&afu->dev);
>   }
>   
> -static struct ocxl_fn *alloc_function(struct pci_dev *dev)
> +static struct ocxl_fn *alloc_function(void)
>   {
>   	struct ocxl_fn *fn;
>   
> @@ -342,6 +345,7 @@ static struct ocxl_fn *alloc_function(struct pci_dev *dev)
>   	INIT_LIST_HEAD(&fn->afu_list);
>   	INIT_LIST_HEAD(&fn->pasid_list);
>   	INIT_LIST_HEAD(&fn->actag_list);
> +
>   	return fn;
>   }
>   
> @@ -491,7 +495,7 @@ struct ocxl_fn *init_function(struct pci_dev *dev)
>   	struct ocxl_fn *fn;
>   	int rc;
>   
> -	fn = alloc_function(dev);
> +	fn = alloc_function();
>   	if (!fn)
>   		return ERR_PTR(-ENOMEM);
>   
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

