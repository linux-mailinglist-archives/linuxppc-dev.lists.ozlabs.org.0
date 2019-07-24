Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E672B46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:20:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tqYx5Sy7zDqGl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:20:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tqWN0QHZzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:17:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O97qqV048294
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:17:48 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2txhcr0m3t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:17:48 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.vnet.ibm.com>;
 Wed, 24 Jul 2019 10:17:46 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 10:17:45 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6O9Hhxv61341868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 09:17:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C747AE04D;
 Wed, 24 Jul 2019 09:17:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36F2FAE057;
 Wed, 24 Jul 2019 09:17:43 +0000 (GMT)
Received: from pomme.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 09:17:43 +0000 (GMT)
Subject: Re: [PATCH v5 4/4] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-5-vaibhav@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Date: Wed, 24 Jul 2019 11:17:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723161357.26718-5-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072409-0008-0000-0000-000003004765
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072409-0009-0000-0000-0000226DD738
Message-Id: <fa75968e-1417-ef02-4f5e-5ba34c778377@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240103
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 23/07/2019 à 18:13, Vaibhav Jain a écrit :
> In some cases initial bind of scm memory for an lpar can fail if
> previously it wasn't released using a scm-unbind hcall. This situation
> can arise due to panic of the previous kernel or forced lpar
> fadump. In such cases the H_SCM_BIND_MEM return a H_OVERLAP error.
> 
> To mitigate such cases the patch updates papr_scm_probe() to force a
> call to drc_pmem_unbind() in case the initial bind of scm memory fails
> with EBUSY error. In case scm-bind operation again fails after the
> forced scm-unbind then we follow the existing error path. We also
> update drc_pmem_bind() to handle the H_OVERLAP error returned by phyp
> and indicate it as a EBUSY error back to the caller.
> 
> Suggested-by: "Oliver O'Halloran" <oohall@gmail.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> Change-log:
> 
> v5:
> * None. Re-spinning the patchset.
> 
> v4:
> * None. Re-spinning the patchset.
> 
> v3:
> * Minor update to a code comment. [Oliver]
> 
> v2:
> * Moved the retry code from drc_pmem_bind() to papr_scm_probe()
>    [Oliver]
> * Changed the type of variable 'rc' in drc_pmem_bind() to
>    int64_t. [Oliver]
> ---
>   arch/powerpc/platforms/pseries/papr_scm.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 82568a7e0a7c..2c07908359b2 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -44,8 +44,9 @@ struct papr_scm_priv {
>   static int drc_pmem_bind(struct papr_scm_priv *p)
>   {
>   	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> -	uint64_t rc, token;
>   	uint64_t saved = 0;
> +	uint64_t token;
> +	int64_t rc;
> 
>   	/*
>   	 * When the hypervisor cannot map all the requested memory in a single
> @@ -65,6 +66,10 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>   	} while (rc == H_BUSY);
> 
>   	if (rc) {
> +		/* H_OVERLAP needs a separate error path */
> +		if (rc == H_OVERLAP)
> +			return -EBUSY;
> +
>   		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
>   		return -ENXIO;
>   	}
> @@ -404,6 +409,14 @@ static int papr_scm_probe(struct platform_device *pdev)
> 
>   	/* request the hypervisor to bind this region to somewhere in memory */
>   	rc = drc_pmem_bind(p);
> +
> +	/* If phyp says drc memory still bound then force unbound and retry */
> +	if (rc == -EBUSY) {
> +		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
> +		drc_pmem_unbind(p);
> +		rc = drc_pmem_bind(p);

In the unlikely case where H_SCM_BIND_MEM is returning H_OVERLAP once the 
unbinding has been done, the error would be silently processed. That sounds 
really unlikely, but should an error message be displayed in this 
particular case ?

> +	}
> +
>   	if (rc)
>   		goto err;
> 

