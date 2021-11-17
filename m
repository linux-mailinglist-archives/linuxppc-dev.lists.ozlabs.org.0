Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A44540CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 07:18:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvCRH5mJPz2ywT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 17:18:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2XvYBE8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q2XvYBE8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvCQZ1jrTz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 17:17:41 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH67dDG002885; 
 Wed, 17 Nov 2021 06:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=smJOSVium3d6C14sPyr6rq3vtLfqVfytj8v6BcCQ3Ig=;
 b=Q2XvYBE8MXtIbOApvoqT8AhRZooKfzY1AKmGUJgX1VuuzftC+d50fQzdkrcMufsrDVWq
 KaLp3qFiqCb9pN2IPQH4WdSemv8aFPq1tuhv43rEoIlhyNROyc/Oj9usDqad+ul8hvpO
 a15jUx4zNxtciFvkPoj7DYg65z3yKilTMKUrZAeo4hbMoX/wXA2qbBJsxYqNP0JQknQL
 p4CYVvJi9SmPORRpMtrCfCl9wf6eK95n5CQcWtfLde6KHY5XP6kJd7hNqLdg2bo9F3/p
 Ph1Sm6pcbXaPOJp/xTsF4Z2HEP60dYyiSpqTHouCDqgo0pBAZl15dhrMYXOJJC9kwtYo hw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ccuvr8b59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:17:15 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5wJJ0027967;
 Wed, 17 Nov 2021 06:17:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3ca509w0hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:17:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AH6H9cM57672138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 06:17:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1182642054;
 Wed, 17 Nov 2021 06:17:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FC7242041;
 Wed, 17 Nov 2021 06:17:05 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown
 [9.43.2.55]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 06:17:05 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 0/4] Add perf interface to expose nvdimm
To: LEROY Christophe <christophe.leroy@csgroup.eu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>
References: <20211116044904.48718-1-kjain@linux.ibm.com>
 <8bc3f62b-881f-d919-8726-95610d1bc133@csgroup.eu>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <8a989060-0be5-0e50-e824-c18d67874863@linux.ibm.com>
Date: Wed, 17 Nov 2021 11:47:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8bc3f62b-881f-d919-8726-95610d1bc133@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fASwfLnI_kx8olk5V8UFP1VKra5h0nst
X-Proofpoint-ORIG-GUID: fASwfLnI_kx8olk5V8UFP1VKra5h0nst
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_01,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170029
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
Cc: "santosh@fossix.org" <santosh@fossix.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>,
 "vaibhav@linux.ibm.com" <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/16/21 8:29 PM, LEROY Christophe wrote:
> Hi
> 
> Le 16/11/2021 à 05:49, Kajol Jain a écrit :
>> Patchset adds performance stats reporting support for nvdimm.
>> Added interface includes support for pmu register/unregister
>> functions. A structure is added called nvdimm_pmu to be used for
>> adding arch/platform specific data such as cpumask, nvdimm device
>> pointer and pmu event functions like event_init/add/read/del.
>> User could use the standard perf tool to access perf events
>> exposed via pmu.
>>
>> Interface also defines supported event list, config fields for the
>> event attributes and their corresponding bit values which are exported
>> via sysfs. Patch 3 exposes IBM pseries platform nmem* device
>> performance stats using this interface.
> 
> You resending your v5 series ? Is there any news since your submittion 
> last month that's awaiting in patchwork here at 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=264422 ?

Hi Christophe,
      There is no code side changes from the last v5 version. Since, I
am looking for reviews, again posted this patchset with RESEND tag.

Thanks,
Kajol Jain

> 
> Christophe
> 
> 
>>
>> Result from power9 pseries lpar with 2 nvdimm device:
>>
>> Ex: List all event by perf list
>>
>> command:# perf list nmem
>>
>>    nmem0/cache_rh_cnt/                                [Kernel PMU event]
>>    nmem0/cache_wh_cnt/                                [Kernel PMU event]
>>    nmem0/cri_res_util/                                [Kernel PMU event]
>>    nmem0/ctl_res_cnt/                                 [Kernel PMU event]
>>    nmem0/ctl_res_tm/                                  [Kernel PMU event]
>>    nmem0/fast_w_cnt/                                  [Kernel PMU event]
>>    nmem0/host_l_cnt/                                  [Kernel PMU event]
>>    nmem0/host_l_dur/                                  [Kernel PMU event]
>>    nmem0/host_s_cnt/                                  [Kernel PMU event]
>>    nmem0/host_s_dur/                                  [Kernel PMU event]
>>    nmem0/med_r_cnt/                                   [Kernel PMU event]
>>    nmem0/med_r_dur/                                   [Kernel PMU event]
>>    nmem0/med_w_cnt/                                   [Kernel PMU event]
>>    nmem0/med_w_dur/                                   [Kernel PMU event]
>>    nmem0/mem_life/                                    [Kernel PMU event]
>>    nmem0/poweron_secs/                                [Kernel PMU event]
>>    ...
>>    nmem1/mem_life/                                    [Kernel PMU event]
>>    nmem1/poweron_secs/                                [Kernel PMU event]
>>
>> Patch1:
>>          Introduces the nvdimm_pmu structure
>> Patch2:
>>          Adds common interface to add arch/platform specific data
>>          includes nvdimm device pointer, pmu data along with
>>          pmu event functions. It also defines supported event list
>>          and adds attribute groups for format, events and cpumask.
>>          It also adds code for cpu hotplug support.
>> Patch3:
>>          Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>>          nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
>>          capabilities, cpumask and event functions and then registers
>>          the pmu by adding callbacks to register_nvdimm_pmu.
>> Patch4:
>>          Sysfs documentation patch
>>
>> Changelog
>> ---
>> v4 -> v5:
>> - Remove multiple variables defined in nvdimm_pmu structure include
>>    name and pmu functions(event_int/add/del/read) as they are just
>>    used to copy them again in pmu variable. Now we are directly doing
>>    this step in arch specific code as suggested by Dan Williams.
>>
>> - Remove attribute group field from nvdimm pmu structure and
>>    defined these attribute groups in common interface which
>>    includes format, event list along with cpumask as suggested by
>>    Dan Williams.
>>    Since we added static defination for attrbute groups needed in
>>    common interface, removes corresponding code from papr.
>>
>> - Add nvdimm pmu event list with event codes in the common interface.
>>
>> - Remove Acked-by/Reviewed-by/Tested-by tags as code is refactored
>>    to handle review comments from Dan.
>>
>> - Make nvdimm_pmu_free_hotplug_memory function static as reported
>>    by kernel test robot, also add corresponding Reported-by tag.
>>
>> - Link to the patchset v4: https://lkml.org/lkml/2021/9/3/45
>>
>> v3 -> v4
>> - Rebase code on top of current papr_scm code without any logical
>>    changes.
>>
>> - Added Acked-by tag from Peter Zijlstra and Reviewed by tag
>>    from Madhavan Srinivasan.
>>
>> - Link to the patchset v3: https://lkml.org/lkml/2021/6/17/605
>>
>> v2 -> v3
>> - Added Tested-by tag.
>>
>> - Fix nvdimm mailing list in the ABI Documentation.
>>
>> - Link to the patchset v2: https://lkml.org/lkml/2021/6/14/25
>>
>> v1 -> v2
>> - Fix hotplug code by adding pmu migration call
>>    incase current designated cpu got offline. As
>>    pointed by Peter Zijlstra.
>>
>> - Removed the retun -1 part from cpu hotplug offline
>>    function.
>>
>> - Link to the patchset v1: https://lkml.org/lkml/2021/6/8/500
>>
>> Kajol Jain (4):
>>    drivers/nvdimm: Add nvdimm pmu structure
>>    drivers/nvdimm: Add perf interface to expose nvdimm performance stats
>>    powerpc/papr_scm: Add perf interface support
>>    docs: ABI: sysfs-bus-nvdimm: Document sysfs event format entries for
>>      nvdimm pmu
>>
>>   Documentation/ABI/testing/sysfs-bus-nvdimm |  35 +++
>>   arch/powerpc/include/asm/device.h          |   5 +
>>   arch/powerpc/platforms/pseries/papr_scm.c  | 225 ++++++++++++++
>>   drivers/nvdimm/Makefile                    |   1 +
>>   drivers/nvdimm/nd_perf.c                   | 328 +++++++++++++++++++++
>>   include/linux/nd.h                         |  41 +++
>>   6 files changed, 635 insertions(+)
>>   create mode 100644 drivers/nvdimm/nd_perf.c
