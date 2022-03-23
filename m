Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA04E56B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 17:45:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNvNY1Hgtz30N9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 03:45:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YzUVucaa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YzUVucaa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNvMt4T7nz2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 03:44:42 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NGVjho004726; 
 Wed, 23 Mar 2022 16:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bR3Xdsc0A/CEVp68Z04s5U/ffS6+4SVOvjC43+ZAa40=;
 b=YzUVucaaU5yV0vnkJHaFFd+8UrRaJplDB96as66T8J4YYHG0himdGCf51LlY3ajgDtOn
 BNNZylPW0cjv70ZaA/U1Ua0z3mEI4hui/cTb4FAsEooO98l/seSWgEtTG/a6PVSr3M7w
 AUSRsSzJbxnaPNAgQBXtp0M+fpDZ3rvSxLL4N3dJ8uDG6BkUnXnZHKoz0HAWJNPulEDb
 Z7hFY0fANCfnhMetD9CO86aTSBpY8DGSkQvm7+NVtPmxF2BPFQHZW+5nxqAOSm5DOhC7
 I7xpZYUyIjqlPC+PPdf0bPEnlAIJzqkBb35gaUe4CEfhuU1+tnrzwKpeBk18t69itNQy 2Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0757875g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:43:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NGhdwY022968;
 Wed, 23 Mar 2022 16:43:57 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t910m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:43:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22NGhsVX26345744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 16:43:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C0A242045;
 Wed, 23 Mar 2022 16:43:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 385434203F;
 Wed, 23 Mar 2022 16:43:49 +0000 (GMT)
Received: from [9.43.30.161] (unknown [9.43.30.161])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 16:43:48 +0000 (GMT)
Message-ID: <51698a4d-1940-2191-5bdc-f3f7e4fa6e0e@linux.ibm.com>
Date: Wed, 23 Mar 2022 22:13:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drivers/nvdimm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <CAPcyv4jNJy70b6jK6S9TYDrLLZxzSNQxfN7-bzOpVa+ffZN3hw@mail.gmail.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <CAPcyv4jNJy70b6jK6S9TYDrLLZxzSNQxfN7-bzOpVa+ffZN3hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g66pYFIrv4bvqoq2-4MUOpsjFTo-mARV
X-Proofpoint-ORIG-GUID: g66pYFIrv4bvqoq2-4MUOpsjFTo-mARV
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230087
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
 maddy@linux.ibm.com, kernel test robot <lkp@intel.com>, "Weiny,
 Ira" <ira.weiny@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Peter Zijlstra <peterz@infradead.org>, rnsastry@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/22/22 07:40, Dan Williams wrote:
> On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> The following build failure occures when CONFIG_PERF_EVENTS is not set
>> as generic pmu functions are not visible in that scenario.
>>
>> |-- s390-randconfig-r044-20220313
>> |   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_migrate_context
>> |   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_register
>> |   `-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_unregister
>>
>> Similar build failure in nds32 architecture:
>> nd_perf.c:(.text+0x21e): undefined reference to `perf_pmu_migrate_context'
>> nd_perf.c:(.text+0x434): undefined reference to `perf_pmu_register'
>> nd_perf.c:(.text+0x57c): undefined reference to `perf_pmu_unregister'
>>
>> Fix this issue by adding check for CONFIG_PERF_EVENTS config option
>> and disabling the nvdimm perf interface incase this config is not set.
>>
>> Also removed function declaration of perf_pmu_migrate_context,
>> perf_pmu_register, perf_pmu_unregister functions from nd.h as these are
>> common pmu functions which are part of perf_event.h and since we
>> are disabling nvdimm perf interface incase CONFIG_PERF_EVENTS option
>> is not set, we not need to declare them in nd.h
>>
>> Fixes: 0fab1ba6ad6b ("drivers/nvdimm: Add perf interface to expose
>> nvdimm performance stats") (Commit id based on linux-next tree)
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> Link: https://lore.kernel.org/all/62317124.YBQFU33+s%2FwdvWGj%25lkp@intel.com/
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>>  drivers/nvdimm/Makefile | 2 +-
>>  include/linux/nd.h      | 7 ++++---
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> ---
>> - This fix patch changes are added and tested on top of linux-next tree
>>   on the 'next-20220315' branch.
>> ---
>> diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
>> index 3fb806748716..ba0296dca9db 100644
>> --- a/drivers/nvdimm/Makefile
>> +++ b/drivers/nvdimm/Makefile
>> @@ -15,7 +15,7 @@ nd_e820-y := e820.o
>>  libnvdimm-y := core.o
>>  libnvdimm-y += bus.o
>>  libnvdimm-y += dimm_devs.o
>> -libnvdimm-y += nd_perf.o
>> +libnvdimm-$(CONFIG_PERF_EVENTS) += nd_perf.o
>>  libnvdimm-y += dimm.o
>>  libnvdimm-y += region_devs.o
>>  libnvdimm-y += region.o
>> diff --git a/include/linux/nd.h b/include/linux/nd.h
>> index 7b2ccbdc1cbc..a4265eaf5ae8 100644
>> --- a/include/linux/nd.h
>> +++ b/include/linux/nd.h
>> @@ -8,8 +8,10 @@
>>  #include <linux/ndctl.h>
>>  #include <linux/device.h>
>>  #include <linux/badblocks.h>
>> +#ifdef CONFIG_PERF_EVENTS
>>  #include <linux/perf_event.h>
> 
> Why must this not be included? Doesn't it already handle the
> CONFIG_PERF_EVENTS=n case internally?
> 
>>  #include <linux/platform_device.h>
> 
> I notice now that this platform-device header should have never been
> added in the first place, just forward declare:
> 
> struct platform_device;

Hi Dan,
    Sure I will do the required changes.

Thanks,
Kajol Jain
> 
>> +#endif
>>
>>  enum nvdimm_event {
>>         NVDIMM_REVALIDATE_POISON,
>> @@ -25,6 +27,7 @@ enum nvdimm_claim_class {
>>         NVDIMM_CCLASS_UNKNOWN,
>>  };
>>
>> +#ifdef CONFIG_PERF_EVENTS
>>  #define NVDIMM_EVENT_VAR(_id)  event_attr_##_id
>>  #define NVDIMM_EVENT_PTR(_id)  (&event_attr_##_id.attr.attr)
> 
> Why must these be inside the ifdef guard?
> 
>>
>> @@ -63,9 +66,7 @@ extern ssize_t nvdimm_events_sysfs_show(struct device *dev,
>>
>>  int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
>>  void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);
> 
> Shouldn't there also be stub functions in the CONFIG_PERF_EVENTS=n case?
> 
> static inline int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm,
> struct platform_device *pdev)
> {
>     return -ENXIO;
> }
> 
> static inline void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu)
> {
> }
> 
>> -void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu);
>> -int perf_pmu_register(struct pmu *pmu, const char *name, int type);
>> -void perf_pmu_unregister(struct pmu *pmu);
> 
> Yeah, I should have caught these earlier.
> 
>> +#endif
>>
>>  struct nd_device_driver {
>>         struct device_driver drv;
>> --
>> 2.31.1
>>
