Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6E584AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 16:43:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZN174Wd3zDqGb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 00:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZMyC0JYvzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 00:40:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5REafep053846
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:40:31 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tcy4rah8b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:40:30 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 27 Jun 2019 15:40:28 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 15:40:26 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5REePXk47906924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 14:40:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C38A42041;
 Thu, 27 Jun 2019 14:40:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E3142042;
 Thu, 27 Jun 2019 14:40:21 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.85.70])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 27 Jun 2019 14:40:21 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 27 Jun 2019 20:10:20 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] powerpc/papr_scm: Update drc_pmem_unbind() to use
 H_SCM_UNBIND_ALL
In-Reply-To: <4a460995-f7c5-22bf-028e-628d984dce96@linux.ibm.com>
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-3-vaibhav@linux.ibm.com>
 <4a460995-f7c5-22bf-028e-628d984dce96@linux.ibm.com>
Date: Thu, 27 Jun 2019 20:10:20 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062714-0012-0000-0000-0000032D1100
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062714-0013-0000-0000-000021664F86
Message-Id: <87o92jum5n.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270170
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

Thanks for reviewing this patch Aneesh,

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 6/26/19 7:34 PM, Vaibhav Jain wrote:
>> The new hcall named H_SCM_UNBIND_ALL has been introduce that can
>> unbind all or specific scm memory assigned to an lpar. This is
>> more efficient than using H_SCM_UNBIND_MEM as currently we don't
>> support partial unbind of scm memory.
>> 
>> Hence this patch proposes following changes to drc_pmem_unbind():
>> 
>>      * Update drc_pmem_unbind() to replace hcall H_SCM_UNBIND_MEM to
>>        H_SCM_UNBIND_ALL.
>> 
>>      * Update drc_pmem_unbind() to handles cases when PHYP asks the guest
>>        kernel to wait for specific amount of time before retrying the
>>        hcall via the 'LONG_BUSY' return value.
>> 
>>      * Ensure appropriate error code is returned back from the function
>>        in case of an error.
>> 
>> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>> Change-log:
>> 
>> v3:
>> * Fixed a build warning reported by kbuild-robot.
>> * Updated patch description to put emphasis on 'scm memory' instead of
>>    'scm drc memory blocks' as for phyp there is a stark difference
>>    between how drc are managed for scm memory v/s regular memory. [Oliver]
>> 
>> v2:
>> * Added a dev_dbg when unbind operation succeeds [Oliver]
>> * Changed type of variable 'rc' to int64_t [Oliver]
>> * Removed the code that was logging a warning in case bind operation
>>    takes >1-seconds [Oliver]
>> * Spinned off changes to hvcall.h as a separate patch. [Oliver]
>> ---
>>   arch/powerpc/platforms/pseries/papr_scm.c | 29 +++++++++++++++++------
>>   1 file changed, 22 insertions(+), 7 deletions(-)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 96c53b23e58f..c01a03fd3ee7 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/sched.h>
>>   #include <linux/libnvdimm.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/delay.h>
>>   
>>   #include <asm/plpar_wrappers.h>
>>   
>> @@ -77,22 +78,36 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>>   static int drc_pmem_unbind(struct papr_scm_priv *p)
>>   {
>>   	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>> -	uint64_t rc, token;
>> +	uint64_t token = 0;
>> +	int64_t rc;
>>   
>> -	token = 0;
>> +	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
>>   
>> -	/* NB: unbind has the same retry requirements mentioned above */
>> +	/* NB: unbind has the same retry requirements as drc_pmem_bind() */
>>   	do {
>> -		rc = plpar_hcall(H_SCM_UNBIND_MEM, ret, p->drc_index,
>> -				p->bound_addr, p->blocks, token);
>> +
>> +		/* Unbind of all SCM resources associated with drcIndex */
>> +		rc = plpar_hcall(H_SCM_UNBIND_ALL, ret, H_UNBIND_SCOPE_DRC,
>> +				 p->drc_index, token);
>>   		token = ret[0];
>> -		cond_resched();
>> +
>> +		/* Check if we are stalled for some time */
>> +		if (H_IS_LONG_BUSY(rc)) {
>> +			msleep(get_longbusy_msecs(rc));
>> +			rc = H_BUSY;
>> +		} else if (rc == H_BUSY) {
>> +			cond_resched();
>> +		}
>> +
>>   	} while (rc == H_BUSY);
>>   
>>   	if (rc)
>>   		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
>> +	else
>> +		dev_dbg(&p->pdev->dev, "unbind drc %x complete\n",
>> +			p->drc_index);
>>   
> Can we add p->drc_index as part of these messages? Also s/%x/0x%x ?
the scm platform device has the name of the form
"ibm,persistent-memory:ibm,pmemory@44100002" which also contains the
drc_index. So i think printing it again in this message would be
redundant.

>
>
>> -	return !!rc;
>> +	return rc == H_SUCCESS ? 0 : -ENXIO;
>>   }
>>   
> The error -ENXIO is confusing. Can we keep the HCALL error as return for 
> this? We don't check error from this. If we can't take any action based 
> on the return. Then may be make it  void?
>
Wanted to keep the behaviour of this function symmetric to
drc_pmem_bind() which when updated in the next patch returns a kernel
error code instead of hcall error.

Agree that we arent using the return
value of this function right now but this may change in the future.

>
>>   static int papr_scm_meta_get(struct papr_scm_priv *p,
>> 
>
>
> -aneesh

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

