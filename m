Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9AA7AD1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 07:41:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NXk92zf7zDqrj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 15:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NXgk0lyyzDqpG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 15:39:13 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x845cFa0140094
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Sep 2019 01:39:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut5vw2axy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 01:39:11 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 4 Sep 2019 06:39:09 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Sep 2019 06:39:05 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x845d4ZW42139994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 05:39:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFD1DA405F;
 Wed,  4 Sep 2019 05:39:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A0D8A4064;
 Wed,  4 Sep 2019 05:39:02 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.163])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  4 Sep 2019 05:39:02 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 04 Sep 2019 11:09:01 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/2] powerpc/nvdimm: Use HCALL error as the return value
In-Reply-To: <20190903123452.28620-1-aneesh.kumar@linux.ibm.com>
References: <20190903123452.28620-1-aneesh.kumar@linux.ibm.com>
Date: Wed, 04 Sep 2019 11:09:01 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19090405-0028-0000-0000-000003976ADC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090405-0029-0000-0000-00002459BACD
Message-Id: <87y2z4tybu.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040059
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

Thanks for the patch. Minor review comments below:

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This simplifies the error handling and also enable us to switch to
> H_SCM_QUERY hcall in a later patch on H_OVERLAP error.
>
> We also do some kernel print formatting fixup in this patch.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 26 ++++++++++-------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index a5ac371a3f06..3bef4d298ac6 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -66,28 +66,22 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>  	} while (rc == H_BUSY);
>  
>  	if (rc) {
> -		/* H_OVERLAP needs a separate error path */
> -		if (rc == H_OVERLAP)
> -			return -EBUSY;
> -
>  		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
> -		return -ENXIO;
> +		return rc;
>  	}
>  
>  	p->bound_addr = saved;
> -
> -	dev_dbg(&p->pdev->dev, "bound drc %x to %pR\n", p->drc_index, &p->res);
> -
> -	return 0;

> +	dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
s/0x%x/%#x/
> +	return rc;
rc == 0 always at this point hence 'return 0' should still work.

>  }
>  
> -static int drc_pmem_unbind(struct papr_scm_priv *p)
> +static void drc_pmem_unbind(struct papr_scm_priv *p)
>  {
>  	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>  	uint64_t token = 0;
>  	int64_t rc;
>  
> -	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
> +	dev_dbg(&p->pdev->dev, "unbind drc 0x%x\n", p->drc_index);
>  
>  	/* NB: unbind has the same retry requirements as drc_pmem_bind() */
>  	do {
> @@ -110,10 +104,10 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>  	if (rc)
>  		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
>  	else
> -		dev_dbg(&p->pdev->dev, "unbind drc %x complete\n",
> +		dev_dbg(&p->pdev->dev, "unbind drc 0x%x complete\n",
>  			p->drc_index);
>  
> -	return rc == H_SUCCESS ? 0 : -ENXIO;
> +	return;
I would prefer drc_pmem_unbind() to still return error from the
HCALL. The caller can descide if it wants to ignore the error or not.

>  }
>  
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
> @@ -436,14 +430,16 @@ static int papr_scm_probe(struct platform_device *pdev)
>  	rc = drc_pmem_bind(p);
>  
>  	/* If phyp says drc memory still bound then force unbound and retry */
> -	if (rc == -EBUSY) {
> +	if (rc == H_OVERLAP) {
>  		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
>  		drc_pmem_unbind(p);
>  		rc = drc_pmem_bind(p);
>  	}
>  
> -	if (rc)
> +	if (rc != H_SUCCESS) {
> +		rc = -ENXIO;
>  		goto err;
> +	}
>  
>  	/* setup the resource for the newly bound range */
>  	p->res.start = p->bound_addr;
> -- 
> 2.21.0
>

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

