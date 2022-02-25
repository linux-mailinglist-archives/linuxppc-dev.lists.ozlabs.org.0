Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7E4C4324
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 12:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4nDc58lRz3cN1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 22:12:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nzh6qnmQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nzh6qnmQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4nCr0nvHz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 22:11:51 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PAIBJ9021201; 
 Fri, 25 Feb 2022 11:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hcvTpBy/x5shNurAmWWK6P9i6O4+gs2ZmkPe3rZKF5s=;
 b=nzh6qnmQyaXIe3zacHIW7c3HrCeqyyK73/S+R7IkkA4B3u56uD7PtwsVM1EOilB8tcxI
 s5ItiYgicrewNStZFhiHISSFZrmV8uv0NGuNvKjERVKOkCedBt/d8fMgz4mIOhy21jFc
 sbkb9S8J4YWB9H3u/g799R4dZ5UkrO5COpUvqnKuDitWiCLiiRWuMBxuUM0T2TnejTFQ
 SZKD1E2kMC+kL/HhkvWjwht2/6wnpmIw9+uaKzxPA0U29+MPlzhKTSko5frA34ZSBzb0
 Bnm8E5gOKDjyMNwbpcpzRYu8NLrsKqZb4MxxDo/FJXhthansmj88Ozf/DmV5QWFlVLP9 Ug== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eew86s6qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 11:11:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PB82fh024443;
 Fri, 25 Feb 2022 11:11:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3eeg2s3rmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 11:11:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21PBBRrD37749246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 11:11:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD0A7AE051;
 Fri, 25 Feb 2022 11:11:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE673AE057;
 Fri, 25 Feb 2022 11:11:24 +0000 (GMT)
Received: from [9.43.44.169] (unknown [9.43.44.169])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Feb 2022 11:11:24 +0000 (GMT)
Message-ID: <d7945e63-4cd6-1947-ed9f-a81203226c47@linux.ibm.com>
Date: Fri, 25 Feb 2022 16:41:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v6 0/4] Add perf interface to expose nvdimm
To: kajoljain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
References: <20220217163357.276036-1-kjain@linux.ibm.com>
 <ddf18609-84ad-e263-7dff-7b2cc68557ef@linux.ibm.com>
 <ea6bc468-c7ae-c844-5111-8f0dc3207f89@linux.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <ea6bc468-c7ae-c844-5111-8f0dc3207f89@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AtPbqZXfbZsrpl84U7JlwtAKWyPtg-Ud
X-Proofpoint-GUID: AtPbqZXfbZsrpl84U7JlwtAKWyPtg-Ud
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_07,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0 impostorscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250060
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 atrajeev@linux.vnet.ibm.com, vaibhav@linux.ibm.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25/02/22 12:08 pm, kajoljain wrote:
> 
> 
> On 2/25/22 11:25, Nageswara Sastry wrote:
>>
>>
>> On 17/02/22 10:03 pm, Kajol Jain wrote:
>>> Patchset adds performance stats reporting support for nvdimm.
>>> Added interface includes support for pmu register/unregister
>>> functions. A structure is added called nvdimm_pmu to be used for
>>> adding arch/platform specific data such as cpumask, nvdimm device
>>> pointer and pmu event functions like event_init/add/read/del.
>>> User could use the standard perf tool to access perf events
>>> exposed via pmu.
>>>
>>> Interface also defines supported event list, config fields for the
>>> event attributes and their corresponding bit values which are exported
>>> via sysfs. Patch 3 exposes IBM pseries platform nmem* device
>>> performance stats using this interface.
>>>
>>> Result from power9 pseries lpar with 2 nvdimm device:
>>>
>>> Ex: List all event by perf list
>>>
>>> command:# perf list nmem
>>>
>>>     nmem0/cache_rh_cnt/                                [Kernel PMU event]
>>>     nmem0/cache_wh_cnt/                                [Kernel PMU event]
>>>     nmem0/cri_res_util/                                [Kernel PMU event]
>>>     nmem0/ctl_res_cnt/                                 [Kernel PMU event]
>>>     nmem0/ctl_res_tm/                                  [Kernel PMU event]
>>>     nmem0/fast_w_cnt/                                  [Kernel PMU event]
>>>     nmem0/host_l_cnt/                                  [Kernel PMU event]
>>>     nmem0/host_l_dur/                                  [Kernel PMU event]
>>>     nmem0/host_s_cnt/                                  [Kernel PMU event]
>>>     nmem0/host_s_dur/                                  [Kernel PMU event]
>>>     nmem0/med_r_cnt/                                   [Kernel PMU event]
>>>     nmem0/med_r_dur/                                   [Kernel PMU event]
>>>     nmem0/med_w_cnt/                                   [Kernel PMU event]
>>>     nmem0/med_w_dur/                                   [Kernel PMU event]
>>>     nmem0/mem_life/                                    [Kernel PMU event]
>>>     nmem0/poweron_secs/                                [Kernel PMU event]
>>>     ...
>>>     nmem1/mem_life/                                    [Kernel PMU event]
>>>     nmem1/poweron_secs/                                [Kernel PMU event]
>>>
>>> Patch1:
>>>           Introduces the nvdimm_pmu structure
>>> Patch2:
>>>           Adds common interface to add arch/platform specific data
>>>           includes nvdimm device pointer, pmu data along with
>>>           pmu event functions. It also defines supported event list
>>>           and adds attribute groups for format, events and cpumask.
>>>           It also adds code for cpu hotplug support.
>>> Patch3:
>>>           Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>>>           nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
>>>           capabilities, cpumask and event functions and then registers
>>>           the pmu by adding callbacks to register_nvdimm_pmu.
>>> Patch4:
>>>           Sysfs documentation patch
>>>
>>> Changelog
>>
>> Tested these patches with the automated tests at
>> avocado-misc-tests/perf/perf_nmem.py
>> URL:
>> https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/perf/perf_nmem.py
>>
>>
>> 1. On the system where target id and online id were different then not
>> seeing value in 'cpumask' and those tests failed.
>>
>> Example:
>> Log from dmesg
>> ...
>> papr_scm ibm,persistent-memory:ibm,pmemory@44100003: Region registered
>> with target node 1 and online node 0
>> ...
> 
> Hi Nageswara Sastry,
>         Thanks for testing the patch set. Yes you right, incase target
> node id and online node id is different, it can happen when target
> node is not online and hence can cause this issue, thanks for pointing
> it.
> 
> Function dev_to_node will return node id for a given nvdimm device which
> can be offline in some scenarios. We should use numa node id return by
> numa_map_to_online_node function in that scenario. This function incase
> given node is offline, it will lookup for next closest online node and
> return that nodeid.
> 
> Can you try with below change and see, if you are still getting this
> issue. Please let me know.
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
> b/arch/powerpc/platforms/pseries/papr_scm.c
> index bdf2620db461..4dd513d7c029 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -536,7 +536,7 @@ static void papr_scm_pmu_register(struct
> papr_scm_priv *p)
>                                  PERF_PMU_CAP_NO_EXCLUDE;
> 
>          /*updating the cpumask variable */
> -       nodeid = dev_to_node(&p->pdev->dev);
> +       nodeid = numa_map_to_online_node(dev_to_node(&p->pdev->dev));
>          nd_pmu->arch_cpumask = *cpumask_of_node(nodeid);
> 
> Thanks,
> Kajol Jain
> 

With the above patch all the tests are passing on the system where 
target id and online id were different. Here is the the result:

(1/9) perf_nmem.py:perfNMEM.test_pmu_register_dmesg: PASS (3.47 s)
(2/9) perf_nmem.py:perfNMEM.test_sysfs: PASS (1.15 s)
(3/9) perf_nmem.py:perfNMEM.test_pmu_count: PASS (1.08 s)
(4/9) perf_nmem.py:perfNMEM.test_all_events: PASS (18.15 s)
(5/9) perf_nmem.py:perfNMEM.test_all_group_events: PASS (2.22 s)
(6/9) perf_nmem.py:perfNMEM.test_mixed_events: CANCEL: With single PMU 
mixed events test is not possible. (1.18 s)
(7/9) perf_nmem.py:perfNMEM.test_pmu_cpumask: PASS (1.12 s)
(8/9) perf_nmem.py:perfNMEM.test_cpumask: PASS (1.17 s)
(9/9) perf_nmem.py:perfNMEM.test_cpumask_cpu_off: PASS (1.81 s)

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

-- 
Thanks and Regards
R.Nageswara Sastry
