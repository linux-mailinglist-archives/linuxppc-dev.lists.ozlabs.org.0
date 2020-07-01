Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A121025E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 05:10:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xR7f16BXzDqnx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 13:10:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xR5q3MVwzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 13:09:19 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06133MeD089383; Tue, 30 Jun 2020 23:09:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32083f0dc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 23:09:12 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 061340tk091798;
 Tue, 30 Jun 2020 23:09:12 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32083f0db3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 23:09:11 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06134gCO020898;
 Wed, 1 Jul 2020 03:09:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 31wyyatm5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:09:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0613972p41746660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 03:09:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14FC2A4057;
 Wed,  1 Jul 2020 03:09:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22851A4053;
 Wed,  1 Jul 2020 03:09:05 +0000 (GMT)
Received: from [9.79.220.179] (unknown [9.79.220.179])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 03:09:04 +0000 (GMT)
Subject: Re: [PATCH v6 6/8] powerpc/pmem: Avoid the barrier in flush routines
To: Dan Williams <dan.j.williams@intel.com>
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
 <20200629160940.GU21462@kitsune.suse.cz> <87lfk5hahc.fsf@linux.ibm.com>
 <CAPcyv4hEV=Ps=t=3qsFq3Ob1jzf=ptoZmYTDkgr8D_G0op8uvQ@mail.gmail.com>
 <20200630085413.GW21462@kitsune.suse.cz>
 <9204289b-2274-b5c1-2cd5-8ed5ce28efb4@linux.ibm.com>
 <CAPcyv4gHHjifQcLMdVgo9CyixHxe6OkCYdQ7Jfu2YB7tBqpDNg@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <4a7bf5c8-a5c7-4292-c7ad-89bcefd7b22d@linux.ibm.com>
Date: Wed, 1 Jul 2020 08:39:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gHHjifQcLMdVgo9CyixHxe6OkCYdQ7Jfu2YB7tBqpDNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_01:2020-07-01,
 2020-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=897 suspectscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010019
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/1/20 1:15 AM, Dan Williams wrote:
> On Tue, Jun 30, 2020 at 2:21 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
> [..]
>>>> The bio argument isn't for range based flushing, it is for flush
>>>> operations that need to complete asynchronously.
>>> How does the block layer determine that the pmem device needs
>>> asynchronous fushing?
>>>
>>
>>          set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
>>
>> and dax_synchronous(dev)
> 
> Yes, but I think it is overkill to have an indirect function call just
> for a single instruction.
> 
> How about something like this instead, to share a common pmem_wmb()
> across x86 and powerpc.
> 
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index 20ff30c2ab93..b14009060c83 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -1180,6 +1180,13 @@ int nvdimm_flush(struct nd_region *nd_region,
> struct bio *bio)
>   {
>          int rc = 0;
> 
> +       /*
> +        * pmem_wmb() is needed to 'sfence' all previous writes such
> +        * that they are architecturally visible for the platform buffer
> +        * flush.
> +        */
> +       pmem_wmb();
> +
>          if (!nd_region->flush)
>                  rc = generic_nvdimm_flush(nd_region);
>          else {
> @@ -1206,17 +1213,14 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
>          idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
> 
>          /*
> -        * The first wmb() is needed to 'sfence' all previous writes
> -        * such that they are architecturally visible for the platform
> -        * buffer flush.  Note that we've already arranged for pmem
> -        * writes to avoid the cache via memcpy_flushcache().  The final
> -        * wmb() ensures ordering for the NVDIMM flush write.
> +        * Note that we've already arranged for pmem writes to avoid the
> +        * cache via memcpy_flushcache().  The final wmb() ensures
> +        * ordering for the NVDIMM flush write.
>           */
> -       wmb();


The series already convert this to pmem_wmb().

>          for (i = 0; i < nd_region->ndr_mappings; i++)
>                  if (ndrd_get_flush_wpq(ndrd, i, 0))
>                          writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
> -       wmb();
> +       pmem_wmb();


Should this be pmem_wmb()? This is ordering the above writeq() right?

> 
>          return 0;
>   }
> 

This still results in two pmem_wmb() on platforms that doesn't have 
flush_wpq. I was trying to avoid that by adding a nd_region->flush call 
back.

-aneesh
