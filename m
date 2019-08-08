Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB28859F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 07:46:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463y6B2lwqzDqbr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 15:46:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463y3Z4tMFzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 15:43:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x785gPsl071897
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 8 Aug 2019 01:43:50 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u89gq8h95-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 01:43:50 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Thu, 8 Aug 2019 06:43:48 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 8 Aug 2019 06:43:47 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x785hkPJ19923142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Aug 2019 05:43:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 528274C046;
 Thu,  8 Aug 2019 05:43:46 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 994EB4C058;
 Thu,  8 Aug 2019 05:43:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.86])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Aug 2019 05:43:45 +0000 (GMT)
Subject: Re: [PATCH] powerpc/fadump: sysfs for fadump memory reservation
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20190806031242.30749-1-sourabhjain@linux.ibm.com>
 <87lfw5vff8.fsf@concordia.ellerman.id.au>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Date: Thu, 8 Aug 2019 11:13:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87lfw5vff8.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19080805-0028-0000-0000-0000038D2333
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080805-0029-0000-0000-0000244F242B
Message-Id: <3b064893-3cf8-1516-b243-e5ac505119fa@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-08_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908080064
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
Cc: mahesh@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/7/19 8:40 AM, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> Add a sys interface to allow querying the memory reserved by fadump
>> for saving the crash dump.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
>>  arch/powerpc/kernel/fadump.c                     | 14 ++++++++++++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
>> index 9ca12830a48e..4a7f6dc556f5 100644
>> --- a/Documentation/powerpc/firmware-assisted-dump.rst
>> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
>> @@ -222,6 +222,11 @@ Here is the list of files under kernel sysfs:
>>      be handled and vmcore will not be captured. This interface can be
>>      easily integrated with kdump service start/stop.
>>  
>> +/sys/kernel/fadump_mem_reserved
>> +
>> +   This is used to display the memory reserved by fadump for saving the
>> +   crash dump.
>> +
>>   /sys/kernel/fadump_release_mem
>>      This file is available only when fadump is active during
>>      second kernel. This is used to release the reserved memory
> 
> Dumping these in /sys/kernel is pretty gross, but I guess that ship has
> sailed.
> 
> But please add it to Documentation/ABI, and Cc the appropriate lists/people.

Sure, I will write the ABI documentation and will send the next version.

> 
> cheers
> 
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 4eab97292cc2..70d49013ebec 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1514,6 +1514,13 @@ static ssize_t fadump_enabled_show(struct kobject *kobj,
>>  	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
>>  }
>>  
>> +static ssize_t fadump_mem_reserved_show(struct kobject *kobj,
>> +					struct kobj_attribute *attr,
>> +					char *buf)
>> +{
>> +	return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
>> +}
>> +
>>  static ssize_t fadump_register_show(struct kobject *kobj,
>>  					struct kobj_attribute *attr,
>>  					char *buf)
>> @@ -1632,6 +1639,9 @@ static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
>>  static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
>>  						0644, fadump_register_show,
>>  						fadump_register_store);
>> +static struct kobj_attribute fadump_mem_reserved_attr =
>> +			__ATTR(fadump_mem_reserved, 0444,
>> +			fadump_mem_reserved_show, NULL);
>>  
>>  DEFINE_SHOW_ATTRIBUTE(fadump_region);
>>  
>> @@ -1663,6 +1673,10 @@ static void fadump_init_files(void)
>>  			printk(KERN_ERR "fadump: unable to create sysfs file"
>>  				" fadump_release_mem (%d)\n", rc);
>>  	}
>> +	rc = sysfs_create_file(kernel_kobj, &fadump_mem_reserved_attr.attr);
>> +	if (rc)
>> +		pr_err("unable to create sysfs file fadump_mem_reserved (%d)\n",
>> +			rc);
>>  	return;
>>  }
>>  
>> -- 
>> 2.17.2

