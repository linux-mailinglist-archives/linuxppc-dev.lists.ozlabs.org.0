Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244C4046B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 10:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4s3h0gXmz2ynq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 18:04:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gTLK95O0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gTLK95O0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4s2z6VJNz2xYX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 18:03:55 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1897ahcN114438; Thu, 9 Sep 2021 04:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7NDctDKZ9OagMfyBYzyLTXP07dMs9RZei5vrG+DTorg=;
 b=gTLK95O0Od3Njwkp39IElv0d82qsGxN1PnAh4Wed8Oss3na+9WDDnAz6let0FnIotJAL
 YaYUkb6nJ0XbGRl+VzeLjL4Wk5D+1778oCrHND5HmXdvvG6XyM8BMReblmKJfRYZhLJp
 GjDp2y/8EyfZZxI9dQAmg6M4Yla5GWm9HHjVO5TqIgAYVHRrlvF6UjtTHYxmqKB5zaV1
 QMvKFb/zMk5F5TSlgvhMrzGObyL0+jIGCbCzLIGw8GSa9e6ksUTPlHZ1Fg0ckS3C5KGK
 VwLAIgAseko9YwE2ZS7tLykO9RCZnIbxquDTYkGzCVzPnjv0Q0YFf+sY6Y0+4ULF5OJp UQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axp75j9ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 04:03:32 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1897vUnO005639;
 Thu, 9 Sep 2021 08:03:30 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3axcnpwx5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 08:03:30 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18983T6D46072196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Sep 2021 08:03:29 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3002D13604F;
 Thu,  9 Sep 2021 08:03:29 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 418F2136059;
 Thu,  9 Sep 2021 08:03:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.32.15])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Sep 2021 08:03:23 +0000 (GMT)
Subject: Re: [RESEND PATCH v4 4/4] powerpc/papr_scm: Document papr_scm sysfs
 event format entries
To: Dan Williams <dan.j.williams@intel.com>
References: <20210903050914.273525-1-kjain@linux.ibm.com>
 <20210903050914.273525-5-kjain@linux.ibm.com>
 <CAPcyv4h-MgZmteMSUfdeQL+XCxL5HvxK87HA3JYB0OoQUaPipQ@mail.gmail.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <09823156-2797-af1d-23ce-d31ae86770d9@linux.ibm.com>
Date: Thu, 9 Sep 2021 13:33:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h-MgZmteMSUfdeQL+XCxL5HvxK87HA3JYB0OoQUaPipQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o7CiklJZumpKrb--ptNKPiFQhS6LFcUI
X-Proofpoint-ORIG-GUID: o7CiklJZumpKrb--ptNKPiFQhS6LFcUI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_02:2021-09-07,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109090044
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Santosh Sivaraj <santosh@fossix.org>,
 maddy@linux.ibm.com, "Weiny, Ira" <ira.weiny@intel.com>,
 rnsastry@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 atrajeev@linux.vnet.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/8/21 6:33 AM, Dan Williams wrote:
> On Thu, Sep 2, 2021 at 10:11 PM Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> Details is added for the event, cpumask and format attributes
>> in the ABI documentation.
>>
>> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  Documentation/ABI/testing/sysfs-bus-papr-pmem | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> index 95254cec92bf..4d86252448f8 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> +++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> @@ -61,3 +61,34 @@ Description:
>>                 * "CchRHCnt" : Cache Read Hit Count
>>                 * "CchWHCnt" : Cache Write Hit Count
>>                 * "FastWCnt" : Fast Write Count
>> +
>> +What:          /sys/devices/nmemX/format
>> +Date:          June 2021
>> +Contact:       linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
>> +Description:   (RO) Attribute group to describe the magic bits
>> +                that go into perf_event_attr.config for a particular pmu.
>> +                (See ABI/testing/sysfs-bus-event_source-devices-format).
>> +
>> +                Each attribute under this group defines a bit range of the
>> +                perf_event_attr.config. Supported attribute is listed
>> +                below::
>> +
>> +                   event  = "config:0-4"  - event ID
>> +
>> +               For example::
>> +                   noopstat = "event=0x1"
>> +
>> +What:          /sys/devices/nmemX/events
> 
> That's not a valid sysfs path. Did you mean /sys/bus/nd/devices/nmemX?

Hi Dan,
  Thanks, I will correct it and update it to `/sys/bus/event_source/devices/`
where perf creates sysfs files for given pmu.

> 
>> +Date:          June 2021
>> +Contact:       linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
>> +Description:    (RO) Attribute group to describe performance monitoring
>> +                events specific to papr-scm. Each attribute in this group describes
>> +                a single performance monitoring event supported by this nvdimm pmu.
>> +                The name of the file is the name of the event.
>> +                (See ABI/testing/sysfs-bus-event_source-devices-events).
> 
> Given these events are in the generic namespace the ABI documentation
> should be generic as well. So I think move these entries to
> Documentation/ABI/testing/sysfs-bus-nvdimm directly.
> 
> You can still mention papr-scm, but I would expect something like:
> 
> What:           /sys/bus/nd/devices/nmemX/events
> Date:           September 2021
> KernelVersion:  5.16
> Contact:        Kajol Jain <kjain@linux.ibm.com>
> Description:
>                 (RO) Attribute group to describe performance monitoring events
>                 for the nvdimm memory device. Each attribute in this group
>                 describes a single performance monitoring event supported by
>                 this nvdimm pmu.  The name of the file is the name of the event.
>                 (See ABI/testing/sysfs-bus-event_source-devices-events). A
>                 listing of the events supported by a given nvdimm provider type
>                 can be found in Documentation/driver-api/nvdimm/$provider, for
>                 example: Documentation/driver-api/nvdimm/papr-scm.
> 
> 

I will update it accordingly.

> 
>> +
>> +What:          /sys/devices/nmemX/cpumask
>> +Date:          June 2021
>> +Contact:       linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
>> +Description:   (RO) This sysfs file exposes the cpumask which is designated to make
>> +                HCALLs to retrieve nvdimm pmu event counter data.
> 
> Seems this one would be provider generic, so no need to refer to PPC
> specific concepts like HCALLs.
> 

Sure will update it.

Thanks,
Kajol Jain
