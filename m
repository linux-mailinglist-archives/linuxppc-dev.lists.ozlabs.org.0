Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEEB4C4046
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 09:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4jsl5Jkqz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 19:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RngiZfhX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RngiZfhX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4jrz41s7z3bP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 19:40:18 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21P5Oad6022991; 
 Fri, 25 Feb 2022 08:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=z+VP8CX+cr2B+PpF69r1ywigrZMWVEGEGBq6lY5qvn4=;
 b=RngiZfhXxAZlAzsL2J2DuLOE45wkvsOhS7y4JQIAgvEEGP+l/AGlHPxRPyNVfa+HWrlb
 FAbMM6Toc6pAPlX0kmr2ep7FRJxXC0XNWvxi7OE5sjBbH9dZwdZ+gOpGlGGWtHU8mxbv
 OGzejbU/nUoAdpwQRYTZD2c4HYJIk7Wi7LskhVBaNrSxUiJCmQx90Y23xUgfjGSHs2h9
 3WTT8HaxdTTM9LFkZXTB2rBI9RuUpMefy/3XiHRrT68tOTPWR/kW63YSl6FW8tn1nUz6
 h8stfkSwMd1T8HkNr20f8nm9yevJCRVDi1zuXdIZsmzA8hfOYSg89L1Fg5BMX0rnrWAI zQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edsju4bca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 08:39:54 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21P8XOni014216;
 Fri, 25 Feb 2022 08:39:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3ear69mybh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 08:39:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21P8dlDi43778320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 08:39:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFCEDA405C;
 Fri, 25 Feb 2022 08:39:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D51B4A4054;
 Fri, 25 Feb 2022 08:39:42 +0000 (GMT)
Received: from [9.43.81.146] (unknown [9.43.81.146])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Feb 2022 08:39:42 +0000 (GMT)
Message-ID: <a41bb801-7062-c625-3ec2-75345b927851@linux.ibm.com>
Date: Fri, 25 Feb 2022 14:09:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/4] Add perf interface to expose nvdimm
Content-Language: en-US
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 Nageswara Sastry <rnsastry@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
References: <20220217163357.276036-1-kjain@linux.ibm.com>
 <ddf18609-84ad-e263-7dff-7b2cc68557ef@linux.ibm.com>
 <ea6bc468-c7ae-c844-5111-8f0dc3207f89@linux.ibm.com>
 <125761cdabbfeaf6615e67d087ec113408f8eb7e.camel@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <125761cdabbfeaf6615e67d087ec113408f8eb7e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Cc7EYTXHdvDoyfqMjiUCMMAIbjriStdM
X-Proofpoint-GUID: Cc7EYTXHdvDoyfqMjiUCMMAIbjriStdM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_06,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250043
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
Cc: vaibhav@linux.ibm.com, santosh@fossix.org, maddy@linux.ibm.com,
 tglx@linutronix.de, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/25/22 13:17, Aneesh Kumar K V wrote:
> On Fri, 2022-02-25 at 12:08 +0530, kajoljain wrote:
>>
>>
>> On 2/25/22 11:25, Nageswara Sastry wrote:
>>>
>>>
>>> On 17/02/22 10:03 pm, Kajol Jain wrote:
>>>>
> ....
>>>>
>>>> Changelog
>>>
>>> Tested these patches with the automated tests at
>>> avocado-misc-tests/perf/perf_nmem.py
>>> URL:
>>> https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/perf/perf_nmem.py
>>>
>>>
>>> 1. On the system where target id and online id were different then
>>> not
>>> seeing value in 'cpumask' and those tests failed.
>>>
>>> Example:
>>> Log from dmesg
>>> ...
>>> papr_scm ibm,persistent-memory:ibm,pmemory@44100003: Region
>>> registered
>>> with target node 1 and online node 0
>>> ...
>>
>> Hi Nageswara Sastry,
>>        Thanks for testing the patch set. Yes you right, incase target
>> node id and online node id is different, it can happen when target
>> node is not online and hence can cause this issue, thanks for
>> pointing
>> it.
>>
>> Function dev_to_node will return node id for a given nvdimm device
>> which
>> can be offline in some scenarios. We should use numa node id return
>> by
>> numa_map_to_online_node function in that scenario. This function
>> incase
>> given node is offline, it will lookup for next closest online node
>> and
>> return that nodeid.
>>
>> Can you try with below change and see, if you are still getting this
>> issue. Please let me know.
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
>> b/arch/powerpc/platforms/pseries/papr_scm.c
>> index bdf2620db461..4dd513d7c029 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -536,7 +536,7 @@ static void papr_scm_pmu_register(struct
>> papr_scm_priv *p)
>>                                 PERF_PMU_CAP_NO_EXCLUDE;
>>
>>         /*updating the cpumask variable */
>> -       nodeid = dev_to_node(&p->pdev->dev);
>> +       nodeid = numa_map_to_online_node(dev_to_node(&p->pdev->dev));
>>         nd_pmu->arch_cpumask = *cpumask_of_node(nodeid);
>>
>>>
> 
> Can you use p->region->numa_node? 

Hi Aneesh,
      Thanks for reviewing the changes. Actually we can't use numa_node
field of region structure directly inside papr_scm.c as we will get
dereferencing issue

Result of build with this change:

arch/powerpc/platforms/pseries/papr_scm.c: In function
'papr_scm_pmu_register':
arch/powerpc/platforms/pseries/papr_scm.c:539:21: error: dereferencing
pointer to incomplete type 'struct nd_region'
  nodeid = &p->region->numa_node;
                     ^~
make[3]: *** [scripts/Makefile.build:288:
arch/powerpc/platforms/pseries/papr_scm.o] Error 1
make[2]: *** [scripts/Makefile.build:550:
arch/powerpc/platforms/pseries] Erro

This is because, this structure is defined inside drivers/nvdimm/nd.h
code which is not included in this file.

So, thats why I am using
`numa_map_to_online_node(dev_to_node(&p->pdev->dev));` directly.

Let me know if you are ok with initial change.

Thanks,
Kajol Jain

> 
> -aneesh
> 
> 
