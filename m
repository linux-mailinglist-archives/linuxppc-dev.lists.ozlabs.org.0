Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20CA1388
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:23:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jwbr6xySzDrPB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JwZ447HdzDrP5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:21:48 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T8JYSv045051; Thu, 29 Aug 2019 04:21:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2up98mun8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 04:21:39 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7T8KExo047660;
 Thu, 29 Aug 2019 04:21:39 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2up98mun8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 04:21:38 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7T8K0b3030484;
 Thu, 29 Aug 2019 08:21:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2ujvv72cuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 08:21:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T8LavY30867832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 08:21:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E6166A054;
 Thu, 29 Aug 2019 08:21:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B0DD6A051;
 Thu, 29 Aug 2019 08:21:35 +0000 (GMT)
Received: from [9.124.35.73] (unknown [9.124.35.73])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 08:21:34 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP
 error
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20190829063347.13966-1-aneesh.kumar@linux.ibm.com>
 <20190829063347.13966-2-aneesh.kumar@linux.ibm.com>
 <CAOSf1CFuU7tCzKfYNDTe5Tut=Mz+2gL+nnvQ74y75PyrhTP7AA@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <93c5f8b0-36c9-d9e7-ac4d-5fb625cab89c@linux.ibm.com>
Date: Thu, 29 Aug 2019 13:51:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CFuU7tCzKfYNDTe5Tut=Mz+2gL+nnvQ74y75PyrhTP7AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290091
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/29/19 1:29 PM, Oliver O'Halloran wrote:
> On Thu, Aug 29, 2019 at 4:34 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Right now we force an unbind of SCM memory at drcindex on H_OVERLAP error.
>> This really slows down operations like kexec where we get the H_OVERLAP
>> error because we don't go through a full hypervisor re init.
> 
> Maybe we should be unbinding it on a kexec().
> 

shouldn't ?

>> H_OVERLAP error for a H_SCM_BIND_MEM hcall indicates that SCM memory at
>> drc index is already bound. Since we don't specify a logical memory
>> address for bind hcall, we can use the H_SCM_QUERY hcall to query
>> the already bound logical address.
> 
> This is a little sketchy since we might have crashed during the
> initial bind. Checking if the last block is bound to where we expect
> it to be might be a good idea. If it's not where we expect it to be,
> then an unbind->bind cycle is the only sane thing to do.
> 


I would not have expected hypervisor to not mark the drc index bound if 
we failed the previous BIND request.

I can query start block and last block logical address and check whether 
the full blocks is indeed mapped.


>> Boot time difference with and without patch is:
>>
>> [    5.583617] IOMMU table initialized, virtual merging enabled
>> [    5.603041] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Retrying bind after unbinding
>> [  301.514221] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Retrying bind after unbinding
>> [  340.057238] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
> 
> Is the unbind significantly slower than a bind? Or is the region here
> just massive?
> 

on unbind. We go two regions one of 60G and other of 10G


>> after fix
>>
>> [    5.101572] IOMMU table initialized, virtual merging enabled
>> [    5.116984] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Querying SCM details
>> [    5.117223] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Querying SCM details
>> [    5.120530] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/papr_scm.c | 26 ++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 220e595cb579..4b74cfe7b334 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -110,6 +110,27 @@ static void drc_pmem_unbind(struct papr_scm_priv *p)
>>          return;
>>   }
>>
>> +static int drc_pmem_query(struct papr_scm_priv *p)
>> +{
>> +       unsigned long ret[PLPAR_HCALL_BUFSIZE];
>> +       int64_t rc;
>> +
>> +
>> +       rc = plpar_hcall(H_SCM_QUERY_BLOCK_MEM_BINDING, ret,
>> +                        p->drc_index, 0);
>> +
>> +       if (rc) {
>> +               dev_err(&p->pdev->dev, "Failed to bind SCM");
>> +               return rc;
>> +       }
>> +
>> +       p->bound_addr = ret[0];
>> +       dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
>> +
>> +       return 0;
>> +}
>> +
>> +
>>   static int papr_scm_meta_get(struct papr_scm_priv *p,
>>                               struct nd_cmd_get_config_data_hdr *hdr)
>>   {
>> @@ -431,9 +452,8 @@ static int papr_scm_probe(struct platform_device *pdev)
>>
>>          /* If phyp says drc memory still bound then force unbound and retry */
>>          if (rc == H_OVERLAP) {
>> -               dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
>> -               drc_pmem_unbind(p);
>> -               rc = drc_pmem_bind(p);
> 
>> +               dev_warn(&pdev->dev, "Querying SCM details\n");
> 
> That's a pretty vague message. If we're going to treat leaving the
> region bound over kexec() as normal then you might want to bump it
> down to pr_info() or so.

sure.

> 
>> +               rc = drc_pmem_query(p);
>>          }
>>
>>          if (rc != H_SUCCESS) {
>> --
>> 2.21.0
>>
> 

