Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA663AAC72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 08:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5C2C27rNz3f0f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:34:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G1IjcJCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G1IjcJCT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5C1k2dv5z2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:33:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H6KVqR026133; Thu, 17 Jun 2021 02:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PpBlJMekb7/xP2iTzZYrGLtbYT9ZT6tGKIE7GTX75SM=;
 b=G1IjcJCT31ASjBNcOGYhDKgKRhuDPEr6b9rUhl4E/ard6X5+tH5X5ooYm+D1OGGchYrS
 qj3uz9AnqDgeGAgSL2l0AXXeK/bsm9njz/THEaQlMm0WoT8xeGKrzvW3Y3Z4ANwIxdqR
 D0N2tRrNZmXvZHyW2bUj8GZqqYYc431NN1Kh0WXpROqF1LaVOX+SCFHx3N//QB0NjWGN
 oEAxJfJNBE9pfGLrTAmczOcFDzz40NOIZqCw3KHemR4NBbevgrKcGQJgcBem7TNR+7N4
 3Ohi22vDyRcWO+Va7Zq8lN6wfJbg3d6VQPt4L2r6mhAWIOQbJhBWOL56B97uKGiQZr7V JQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39811u88w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 02:33:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H6VVrT016986;
 Thu, 17 Jun 2021 06:33:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj9pgf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 06:33:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H6X51Y12649114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 06:33:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F40C1C6059;
 Thu, 17 Jun 2021 06:33:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FBBDC6055;
 Thu, 17 Jun 2021 06:32:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.36.139])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 06:32:58 +0000 (GMT)
Subject: Re: [PATCH v2 0/4] Add perf interface to expose nvdimm
To: Nageswara Sastry <rnsastry@linux.ibm.com>
References: <20210614052326.285710-1-kjain@linux.ibm.com>
 <B216F74B-8542-4363-8A82-1E392D9C5929@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <14a63986-8a99-26dc-d207-7ff902df3afa@linux.ibm.com>
Date: Thu, 17 Jun 2021 12:02:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <B216F74B-8542-4363-8A82-1E392D9C5929@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7R4RhjD38HIv6GWshwH_hBt71ej_o28-
X-Proofpoint-GUID: 7R4RhjD38HIv6GWshwH_hBt71ej_o28-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106170041
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
Cc: nvdimm@lists.linux.dev, santosh@fossix.org, maddy@linux.vnet.ibm.com,
 ira.weiny@intel.com, peterz@infradead.org, linux-kernel@vger.kernel.org,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, aneesh.kumar@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/16/21 4:25 PM, Nageswara Sastry wrote:
> 
> 
>> On 14-Jun-2021, at 10:53 AM, Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> Patchset adds performance stats reporting support for nvdimm.
>> Added interface includes support for pmu register/unregister
>> functions. A structure is added called nvdimm_pmu to be used for
>> adding arch/platform specific data such as supported events, cpumask
>> pmu event functions like event_init/add/read/del.
>> User could use the standard perf tool to access perf
>> events exposed via pmu.
>>
>> Added implementation to expose IBM pseries platform nmem*
>> device performance stats using this interface.
>> ...
>>
>> Patch1:
>>        Introduces the nvdimm_pmu structure
>> Patch2:
>> 	Adds common interface to add arch/platform specific data
>> 	includes supported events, pmu event functions. It also
>> 	adds code for cpu hotplug support.
>> Patch3:
>>        Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>>        nmem* pmu. It fills in the nvdimm_pmu structure with event attrs
>>        cpumask andevent functions and then registers the pmu by adding
>>        callbacks to register_nvdimm_pmu.
>> Patch4:
>>        Sysfs documentation patch
> 
> Tested with the following scenarios:
> 1. Check dmesg for nmem PMU registered messages.
> 2. Listed nmem events using 'perf list and perf list nmem'
> 3. Ran 'perf stat' with single event, grouping events, events from same pmu,
>    different pmu and invalid events
> 4. Read from sysfs files, Writing in to sysfs files
> 5. While running nmem events with perf stat, offline cpu from the nmem?/cpumask
> 
> While running the above functionality worked as expected, no error messages seen
> in dmesg.
> 
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

Hi Nageswara,
     Thanks for testing the patch-set.
There is a nit change which need to be done in patch 4(Documentation patch).
We need to update nvdimm mailing list from linux-nvdimm@lists.01.org to
nvdimm@lists.linux.dev.
I will make this change and send a new patch-set with your tested-by tag.

Thanks,
Kajol Jain

> 
>>
>> Changelog
>> ---
>> PATCH v1 -> PATCH v2
>> - Fix hotplug code by adding pmu migration call
>>  incase current designated cpu got offline. As
>>  pointed by Peter Zijlstra.
>>
>> - Removed the retun -1 part from cpu hotplug offline
>>  function.
>>
>> - Link to the previous patchset : https://lkml.org/lkml/2021/6/8/500
>> ---
>> Kajol Jain (4):
>>  drivers/nvdimm: Add nvdimm pmu structure
>>  drivers/nvdimm: Add perf interface to expose nvdimm performance stats
>>  powerpc/papr_scm: Add perf interface support
>>  powerpc/papr_scm: Document papr_scm sysfs event format entries
>>
>> Documentation/ABI/testing/sysfs-bus-papr-pmem |  31 ++
>> arch/powerpc/include/asm/device.h             |   5 +
>> arch/powerpc/platforms/pseries/papr_scm.c     | 365 ++++++++++++++++++
>> drivers/nvdimm/Makefile                       |   1 +
>> drivers/nvdimm/nd_perf.c                      | 230 +++++++++++
>> include/linux/nd.h                            |  46 +++
>> 6 files changed, 678 insertions(+)
>> create mode 100644 drivers/nvdimm/nd_perf.c
>>
> Thanks and Regards,
> R.Nageswara Sastry
> 
>>
> 
