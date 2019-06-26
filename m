Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4456DEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 17:43:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YnPP3TZNzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 01:43:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YnMR3M13zDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:41:54 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QFbIUH129010
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 11:41:52 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tc9hvxehm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 11:41:52 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 26 Jun 2019 16:41:50 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Jun 2019 16:41:48 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5QFfllG46465512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 15:41:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 482102805E;
 Wed, 26 Jun 2019 15:41:47 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E8EE28059;
 Wed, 26 Jun 2019 15:41:44 +0000 (GMT)
Received: from [9.85.69.70] (unknown [9.85.69.70])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jun 2019 15:41:43 +0000 (GMT)
Subject: Re: [PATCH v3 2/3] powerpc/papr_scm: Update drc_pmem_unbind() to use
 H_SCM_UNBIND_ALL
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-3-vaibhav@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Wed, 26 Jun 2019 21:11:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626140404.27448-3-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062615-0072-0000-0000-000004414979
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011335; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223589; UDB=6.00643932; IPR=6.01004768; 
 MB=3.00027477; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-26 15:41:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062615-0073-0000-0000-00004CB17292
Message-Id: <4a460995-f7c5-22bf-028e-628d984dce96@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260182
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/26/19 7:34 PM, Vaibhav Jain wrote:
> The new hcall named H_SCM_UNBIND_ALL has been introduce that can
> unbind all or specific scm memory assigned to an lpar. This is
> more efficient than using H_SCM_UNBIND_MEM as currently we don't
> support partial unbind of scm memory.
> 
> Hence this patch proposes following changes to drc_pmem_unbind():
> 
>      * Update drc_pmem_unbind() to replace hcall H_SCM_UNBIND_MEM to
>        H_SCM_UNBIND_ALL.
> 
>      * Update drc_pmem_unbind() to handles cases when PHYP asks the guest
>        kernel to wait for specific amount of time before retrying the
>        hcall via the 'LONG_BUSY' return value.
> 
>      * Ensure appropriate error code is returned back from the function
>        in case of an error.
> 
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
> 
> v3:
> * Fixed a build warning reported by kbuild-robot.
> * Updated patch description to put emphasis on 'scm memory' instead of
>    'scm drc memory blocks' as for phyp there is a stark difference
>    between how drc are managed for scm memory v/s regular memory. [Oliver]
> 
> v2:
> * Added a dev_dbg when unbind operation succeeds [Oliver]
> * Changed type of variable 'rc' to int64_t [Oliver]
> * Removed the code that was logging a warning in case bind operation
>    takes >1-seconds [Oliver]
> * Spinned off changes to hvcall.h as a separate patch. [Oliver]
> ---
>   arch/powerpc/platforms/pseries/papr_scm.c | 29 +++++++++++++++++------
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 96c53b23e58f..c01a03fd3ee7 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -11,6 +11,7 @@
>   #include <linux/sched.h>
>   #include <linux/libnvdimm.h>
>   #include <linux/platform_device.h>
> +#include <linux/delay.h>
>   
>   #include <asm/plpar_wrappers.h>
>   
> @@ -77,22 +78,36 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>   static int drc_pmem_unbind(struct papr_scm_priv *p)
>   {
>   	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> -	uint64_t rc, token;
> +	uint64_t token = 0;
> +	int64_t rc;
>   
> -	token = 0;
> +	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
>   
> -	/* NB: unbind has the same retry requirements mentioned above */
> +	/* NB: unbind has the same retry requirements as drc_pmem_bind() */
>   	do {
> -		rc = plpar_hcall(H_SCM_UNBIND_MEM, ret, p->drc_index,
> -				p->bound_addr, p->blocks, token);
> +
> +		/* Unbind of all SCM resources associated with drcIndex */
> +		rc = plpar_hcall(H_SCM_UNBIND_ALL, ret, H_UNBIND_SCOPE_DRC,
> +				 p->drc_index, token);
>   		token = ret[0];
> -		cond_resched();
> +
> +		/* Check if we are stalled for some time */
> +		if (H_IS_LONG_BUSY(rc)) {
> +			msleep(get_longbusy_msecs(rc));
> +			rc = H_BUSY;
> +		} else if (rc == H_BUSY) {
> +			cond_resched();
> +		}
> +
>   	} while (rc == H_BUSY);
>   
>   	if (rc)
>   		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
> +	else
> +		dev_dbg(&p->pdev->dev, "unbind drc %x complete\n",
> +			p->drc_index);
>   
Can we add p->drc_index as part of these messages? Also s/%x/0x%x ?


> -	return !!rc;
> +	return rc == H_SUCCESS ? 0 : -ENXIO;
>   }
>   
The error -ENXIO is confusing. Can we keep the HCALL error as return for 
this? We don't check error from this. If we can't take any action based 
on the return. Then may be make it  void?


>   static int papr_scm_meta_get(struct papr_scm_priv *p,
> 


-aneesh

