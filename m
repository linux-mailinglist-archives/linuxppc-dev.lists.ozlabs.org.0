Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F9BC651
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 13:12:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cz6v2LXzzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:12:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cyvx4rjLzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 21:02:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8OAvmpY103179; Tue, 24 Sep 2019 07:02:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7gh1bqey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 07:02:49 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8OAvvMk103681;
 Tue, 24 Sep 2019 07:02:48 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7gh1bqej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 07:02:48 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8OAxtXT000351;
 Tue, 24 Sep 2019 11:02:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 2v5bg72ruk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 11:02:47 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8OB2kJE32637390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 11:02:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40FE728064;
 Tue, 24 Sep 2019 11:02:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C742328066;
 Tue, 24 Sep 2019 11:02:44 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.33.32])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 11:02:44 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/2] powerpc/nvdimm: Use HCALL error as the return value
In-Reply-To: <87y2z4tybu.fsf@vajain21.in.ibm.com>
References: <20190903123452.28620-1-aneesh.kumar@linux.ibm.com>
 <87y2z4tybu.fsf@vajain21.in.ibm.com>
Date: Tue, 24 Sep 2019 16:32:42 +0530
Message-ID: <877e5yot2l.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240111
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Hi Aneesh,
>
> Thanks for the patch. Minor review comments below:
>
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>
>> This simplifies the error handling and also enable us to switch to
>> H_SCM_QUERY hcall in a later patch on H_OVERLAP error.
>>
>> We also do some kernel print formatting fixup in this patch.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 26 ++++++++++-------------
>>  1 file changed, 11 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index a5ac371a3f06..3bef4d298ac6 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -66,28 +66,22 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>>  	} while (rc == H_BUSY);
>>  
>>  	if (rc) {
>> -		/* H_OVERLAP needs a separate error path */
>> -		if (rc == H_OVERLAP)
>> -			return -EBUSY;
>> -
>>  		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
>> -		return -ENXIO;
>> +		return rc;
>>  	}
>>  
>>  	p->bound_addr = saved;
>> -
>> -	dev_dbg(&p->pdev->dev, "bound drc %x to %pR\n", p->drc_index, &p->res);
>> -
>> -	return 0;
>
>> +	dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
> s/0x%x/%#x/

I never used #x, I guess both gives similar output? Any specific reason
one is prefered over the other?


>> +	return rc;
> rc == 0 always at this point hence 'return 0' should still work.
>
>>  }
>>  
>> -static int drc_pmem_unbind(struct papr_scm_priv *p)
>> +static void drc_pmem_unbind(struct papr_scm_priv *p)
>>  {
>>  	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>>  	uint64_t token = 0;
>>  	int64_t rc;
>>  
>> -	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
>> +	dev_dbg(&p->pdev->dev, "unbind drc 0x%x\n", p->drc_index);
>>  
>>  	/* NB: unbind has the same retry requirements as drc_pmem_bind() */
>>  	do {
>> @@ -110,10 +104,10 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>>  	if (rc)
>>  		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
>>  	else
>> -		dev_dbg(&p->pdev->dev, "unbind drc %x complete\n",
>> +		dev_dbg(&p->pdev->dev, "unbind drc 0x%x complete\n",
>>  			p->drc_index);
>>  
>> -	return rc == H_SUCCESS ? 0 : -ENXIO;
>> +	return;
> I would prefer drc_pmem_unbind() to still return error from the
> HCALL. The caller can descide if it wants to ignore the error or not.

We should do that when we know what we should do with unbind errors.
Currently we ignore the error and if we are ignoring why bother to return?

>
>>  }
>>  
>>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>> @@ -436,14 +430,16 @@ static int papr_scm_probe(struct platform_device *pdev)
>>  	rc = drc_pmem_bind(p);
>>  
>>  	/* If phyp says drc memory still bound then force unbound and retry */
>> -	if (rc == -EBUSY) {
>> +	if (rc == H_OVERLAP) {
>>  		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
>>  		drc_pmem_unbind(p);
>>  		rc = drc_pmem_bind(p);
>>  	}
>>  
>> -	if (rc)
>> +	if (rc != H_SUCCESS) {
>> +		rc = -ENXIO;
>>  		goto err;
>> +	}
>>  
>>  	/* setup the resource for the newly bound range */
>>  	p->res.start = p->bound_addr;
>> -- 
>> 2.21.0
>>


-aneesh
