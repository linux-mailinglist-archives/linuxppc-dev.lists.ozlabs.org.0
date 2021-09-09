Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4A404695
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 09:57:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4rv520DJz2ynD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 17:57:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=egF8pC+O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=egF8pC+O; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4rtL4K4Mz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 17:56:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1897Whjm143815; Thu, 9 Sep 2021 03:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PTPm0p4IxBQUznI62xHHOA822jwtiq7XV+4FXi4+I44=;
 b=egF8pC+OWTFAYjrqprZWvQ/iYoOuQyo6u6MCvOrq3UoTbcBWtGZJBT1dQ7zllArxo6Qt
 RlPE7XlFYdbQqKBCSibclhxV6jLgt5+PMonlMPs4tLP1V/hajMWjVpqokxntDVp57NI9
 hujfqJ1mBTUsXk6C1gErmisuRNhu0JtuAzE6e3Y0Sr9AzoOnznCICQl9L3T2ffJjGYHp
 5EWAmSoP51+DL4W4yWd7hD3y9iix3caUR5pxxrOW+yUfeWLZc2h14BtMTk2DGPiZUsz8
 ynoDQfy7f4Hx++L3ovtIw938OwXytr7tI1Q7plE/fJq42tKv73n7k3aKp57cbIDZqa6J QQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ayd20su5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 03:56:01 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1897pToV027760;
 Thu, 9 Sep 2021 07:56:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3axcnpwr72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 07:56:00 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1897txMk30933342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Sep 2021 07:55:59 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4952136055;
 Thu,  9 Sep 2021 07:55:58 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1B9B13604F;
 Thu,  9 Sep 2021 07:55:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.32.15])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Sep 2021 07:55:53 +0000 (GMT)
Subject: Re: [RESEND PATCH v4 1/4] drivers/nvdimm: Add nvdimm pmu structure
To: Dan Williams <dan.j.williams@intel.com>
References: <20210903050914.273525-1-kjain@linux.ibm.com>
 <20210903050914.273525-2-kjain@linux.ibm.com>
 <CAPcyv4jSL2cDxGiXEtyyce3eNEE_QUnnMjuLXb3iCwO8_7a7LQ@mail.gmail.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <d7f8bf51-059f-4496-37c4-6516a703e209@linux.ibm.com>
Date: Thu, 9 Sep 2021 13:25:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jSL2cDxGiXEtyyce3eNEE_QUnnMjuLXb3iCwO8_7a7LQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S7uiPZdrlEIqpATK11BGtF6zHBKzKQU6
X-Proofpoint-ORIG-GUID: S7uiPZdrlEIqpATK11BGtF6zHBKzKQU6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_02:2021-09-07,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090044
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



On 9/8/21 3:29 AM, Dan Williams wrote:
> Hi Kajol,
> 
> Apologies for the delay in responding to this series, some comments below:

Hi Dan,
    No issues, thanks for reviewing the patches.

> 
> On Thu, Sep 2, 2021 at 10:10 PM Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> A structure is added, called nvdimm_pmu, for performance
>> stats reporting support of nvdimm devices. It can be used to add
>> nvdimm pmu data such as supported events and pmu event functions
>> like event_init/add/read/del with cpu hotplug support.
>>
>> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  include/linux/nd.h | 43 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>
>> diff --git a/include/linux/nd.h b/include/linux/nd.h
>> index ee9ad76afbba..712499cf7335 100644
>> --- a/include/linux/nd.h
>> +++ b/include/linux/nd.h
>> @@ -8,6 +8,8 @@
>>  #include <linux/ndctl.h>
>>  #include <linux/device.h>
>>  #include <linux/badblocks.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/perf_event.h>
>>
>>  enum nvdimm_event {
>>         NVDIMM_REVALIDATE_POISON,
>> @@ -23,6 +25,47 @@ enum nvdimm_claim_class {
>>         NVDIMM_CCLASS_UNKNOWN,
>>  };
>>
>> +/* Event attribute array index */
>> +#define NVDIMM_PMU_FORMAT_ATTR         0
>> +#define NVDIMM_PMU_EVENT_ATTR          1
>> +#define NVDIMM_PMU_CPUMASK_ATTR                2
>> +#define NVDIMM_PMU_NULL_ATTR           3
>> +
>> +/**
>> + * struct nvdimm_pmu - data structure for nvdimm perf driver
>> + *
>> + * @name: name of the nvdimm pmu device.
>> + * @pmu: pmu data structure for nvdimm performance stats.
>> + * @dev: nvdimm device pointer.
>> + * @functions(event_init/add/del/read): platform specific pmu functions.
> 
> This is not valid kernel-doc:
> 
> include/linux/nd.h:67: warning: Function parameter or member
> 'event_init' not described in 'nvdimm_pmu'
> include/linux/nd.h:67: warning: Function parameter or member 'add' not
> described in 'nvdimm_pmu'
> include/linux/nd.h:67: warning: Function parameter or member 'del' not
> described in 'nvdimm_pmu'
> include/linux/nd.h:67: warning: Function parameter or member 'read'
> not described in 'nvdimm_pmu'
> 
> ...but I think rather than fixing those up 'struct nvdimm_pmu' should be pruned.
> 
> It's not clear to me that it is worth the effort to describe these
> details to the nvdimm core which is just going to turn around and call
> the pmu core. I'd just as soon have the driver call the pmu core
> directly, optionally passing in attributes and callbacks that come
> from the nvdimm core and/or the nvdimm provider.

The intend for adding these callbacks(event_init/add/del/read) is to give
flexibility to the nvdimm core to add some common checks/routines if required
in the future. Those checks can be common for all architecture with still having the
ability to call arch/platform specific driver code to use its own routines.

But as you said, currently we don't have any common checks and it directly
calling platform specific code, so we can get rid of it. 
Should we remove this part for now?
  

> 
> Otherwise it's also not clear which of these structure members are
> used at runtime vs purely used as temporary storage to pass parameters
> to the pmu core.
> 
>> + * @attr_groups: data structure for events, formats and cpumask
>> + * @cpu: designated cpu for counter access.
>> + * @node: node for cpu hotplug notifier link.
>> + * @cpuhp_state: state for cpu hotplug notification.
>> + * @arch_cpumask: cpumask to get designated cpu for counter access.
>> + */
>> +struct nvdimm_pmu {
>> +       const char *name;
>> +       struct pmu pmu;
>> +       struct device *dev;
>> +       int (*event_init)(struct perf_event *event);
>> +       int  (*add)(struct perf_event *event, int flags);
>> +       void (*del)(struct perf_event *event, int flags);
>> +       void (*read)(struct perf_event *event);
>> +       /*
>> +        * Attribute groups for the nvdimm pmu. Index 0 used for
>> +        * format attribute, index 1 used for event attribute,
>> +        * index 2 used for cpusmask attribute and index 3 kept as NULL.
>> +        */
>> +       const struct attribute_group *attr_groups[4];
> 
> Following from above, I'd rather this was organized as static
> attributes with an is_visible() helper for the groups for any dynamic
> aspects. That mirrors the behavior of nvdimm_create() and allows for
> device drivers to compose the attribute groups from a core set and /
> or a provider specific set.

Since we don't have any common events right now, Can I use papr
attributes directly or should we create dummy events for common thing and
then merged it with papr event list.

Thanks,
Kajol Jain

> 
>> +       int cpu;
>> +       struct hlist_node node;
>> +       enum cpuhp_state cpuhp_state;
>> +
>> +       /* cpumask provided by arch/platform specific code */
>> +       struct cpumask arch_cpumask;
>> +};
>> +
>>  struct nd_device_driver {
>>         struct device_driver drv;
>>         unsigned long type;
>> --
>> 2.26.2
>>
