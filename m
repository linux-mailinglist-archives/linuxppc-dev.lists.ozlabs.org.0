Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3335D4C3E1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 06:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4fDP2x4rz3cJm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 16:56:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DyDQSbBy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DyDQSbBy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4fCd4c9Dz3bPJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 16:56:13 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21P26u2D027975; 
 Fri, 25 Feb 2022 05:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6CJctlUsAEa037jTCe9hwS0ZjCv6ZOroQTo7flzb4VQ=;
 b=DyDQSbBypHfc+W0wX1FzuWOvkzuxL3YdaLKwWabyj14hLApB1rxj5O3e5jp5yUfSM96k
 PPl7kVWgwYGbKnlMd7P5gIrKh239uXgfCHhRWWxkf5bJJZSTvEzUqBaFItGDSZFEP4YF
 wkf2yVsfuelRYm7+bZ7ysjr/C7CRfPRKWCEtT3duZ4xwf/PsizG04vdfKLhEt28NuKE4
 fGAJQr+HajtbwZqPjVeG95Ey8C9k3cESJQOJNjDdwc8zkU2rynvbqPF6imY5lE1IWXO8
 xbC5bLFIqfz1lp4BpwS0KvVuDERAqn8NPY1q4ouqFR/ho37vaSC4uSk4It9yjuQG1drb xw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edxfejcyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 05:55:38 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21P5bB5R002916;
 Fri, 25 Feb 2022 05:55:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3ear69uuyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 05:55:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21P5tXI359834872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 05:55:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A91F8AE056;
 Fri, 25 Feb 2022 05:55:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BE91AE055;
 Fri, 25 Feb 2022 05:55:30 +0000 (GMT)
Received: from [9.43.62.191] (unknown [9.43.62.191])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Feb 2022 05:55:30 +0000 (GMT)
Message-ID: <ddf18609-84ad-e263-7dff-7b2cc68557ef@linux.ibm.com>
Date: Fri, 25 Feb 2022 11:25:28 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 0/4] Add perf interface to expose nvdimm
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
References: <20220217163357.276036-1-kjain@linux.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20220217163357.276036-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -2GuibtIWnUufZvcW9B7g78-509iVow5
X-Proofpoint-GUID: -2GuibtIWnUufZvcW9B7g78-509iVow5
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250026
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



On 17/02/22 10:03 pm, Kajol Jain wrote:
> Patchset adds performance stats reporting support for nvdimm.
> Added interface includes support for pmu register/unregister
> functions. A structure is added called nvdimm_pmu to be used for
> adding arch/platform specific data such as cpumask, nvdimm device
> pointer and pmu event functions like event_init/add/read/del.
> User could use the standard perf tool to access perf events
> exposed via pmu.
> 
> Interface also defines supported event list, config fields for the
> event attributes and their corresponding bit values which are exported
> via sysfs. Patch 3 exposes IBM pseries platform nmem* device
> performance stats using this interface.
> 
> Result from power9 pseries lpar with 2 nvdimm device:
> 
> Ex: List all event by perf list
> 
> command:# perf list nmem
> 
>    nmem0/cache_rh_cnt/                                [Kernel PMU event]
>    nmem0/cache_wh_cnt/                                [Kernel PMU event]
>    nmem0/cri_res_util/                                [Kernel PMU event]
>    nmem0/ctl_res_cnt/                                 [Kernel PMU event]
>    nmem0/ctl_res_tm/                                  [Kernel PMU event]
>    nmem0/fast_w_cnt/                                  [Kernel PMU event]
>    nmem0/host_l_cnt/                                  [Kernel PMU event]
>    nmem0/host_l_dur/                                  [Kernel PMU event]
>    nmem0/host_s_cnt/                                  [Kernel PMU event]
>    nmem0/host_s_dur/                                  [Kernel PMU event]
>    nmem0/med_r_cnt/                                   [Kernel PMU event]
>    nmem0/med_r_dur/                                   [Kernel PMU event]
>    nmem0/med_w_cnt/                                   [Kernel PMU event]
>    nmem0/med_w_dur/                                   [Kernel PMU event]
>    nmem0/mem_life/                                    [Kernel PMU event]
>    nmem0/poweron_secs/                                [Kernel PMU event]
>    ...
>    nmem1/mem_life/                                    [Kernel PMU event]
>    nmem1/poweron_secs/                                [Kernel PMU event]
> 
> Patch1:
>          Introduces the nvdimm_pmu structure
> Patch2:
>          Adds common interface to add arch/platform specific data
>          includes nvdimm device pointer, pmu data along with
>          pmu event functions. It also defines supported event list
>          and adds attribute groups for format, events and cpumask.
>          It also adds code for cpu hotplug support.
> Patch3:
>          Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>          nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
>          capabilities, cpumask and event functions and then registers
>          the pmu by adding callbacks to register_nvdimm_pmu.
> Patch4:
>          Sysfs documentation patch
> 
> Changelog

Tested these patches with the automated tests at 
avocado-misc-tests/perf/perf_nmem.py
URL:
https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/perf/perf_nmem.py

1. On the system where target id and online id were different then not 
seeing value in 'cpumask' and those tests failed.

Example:
Log from dmesg
...
papr_scm ibm,persistent-memory:ibm,pmemory@44100003: Region registered 
with target node 1 and online node 0
...

tests log:
  (1/9) perf_nmem.py:perfNMEM.test_pmu_register_dmesg: PASS (1.13 s)
  (2/9) perf_nmem.py:perfNMEM.test_sysfs: PASS (1.10 s)
  (3/9) perf_nmem.py:perfNMEM.test_pmu_count: PASS (1.07 s)
  (4/9) perf_nmem.py:perfNMEM.test_all_events: PASS (18.14 s)
  (5/9) perf_nmem.py:perfNMEM.test_all_group_events: PASS (2.18 s)
  (6/9) perf_nmem.py:perfNMEM.test_mixed_events: CANCEL: With single PMU 
mixed events test is not possible. (1.10 s)
  (7/9) perf_nmem.py:perfNMEM.test_pmu_cpumask: ERROR: invalid literal 
for int() with base 10: '' (1.10 s)
  (8/9) perf_nmem.py:perfNMEM.test_cpumask: ERROR: invalid literal for 
int() with base 10: '' (1.10 s)
  (9/9) perf_nmem.py:perfNMEM.test_cpumask_cpu_off: ERROR: invalid 
literal for int() with base 10: '' (1.07 s)

2. On the system where target id and online id were same then seeing 
value in 'cpumask' and those tests pass.

tests log:
  (1/9) perf_nmem.py:perfNMEM.test_pmu_register_dmesg: PASS (1.16 s)
  (2/9) perf_nmem.py:perfNMEM.test_sysfs: PASS (1.10 s)
  (3/9) perf_nmem.py:perfNMEM.test_pmu_count: PASS (1.12 s)
  (4/9) perf_nmem.py:perfNMEM.test_all_events: PASS (18.10 s)
  (5/9) perf_nmem.py:perfNMEM.test_all_group_events: PASS (2.23 s)
  (6/9) perf_nmem.py:perfNMEM.test_mixed_events: CANCEL: With single PMU 
mixed events test is not possible. (1.13 s)
  (7/9) perf_nmem.py:perfNMEM.test_pmu_cpumask: PASS (1.08 s)
  (8/9) perf_nmem.py:perfNMEM.test_cpumask: PASS (1.09 s)
  (9/9) perf_nmem.py:perfNMEM.test_cpumask_cpu_off: PASS (1.62 s)

> ---
> Resend v5 -> v6
> - No logic change, just a rebase to latest upstream and
>    tested the patchset.
> 
> - Link to the patchset Resend v5: https://lkml.org/lkml/2021/11/15/3979
> 
> v5 -> Resend v5
> - Resend the patchset
> 
> - Link to the patchset v5: https://lkml.org/lkml/2021/9/28/643
> 
> v4 -> v5:
> - Remove multiple variables defined in nvdimm_pmu structure include
>    name and pmu functions(event_int/add/del/read) as they are just
>    used to copy them again in pmu variable. Now we are directly doing
>    this step in arch specific code as suggested by Dan Williams.
> 
> - Remove attribute group field from nvdimm pmu structure and
>    defined these attribute groups in common interface which
>    includes format, event list along with cpumask as suggested by
>    Dan Williams.
>    Since we added static defination for attrbute groups needed in
>    common interface, removes corresponding code from papr.
> 
> - Add nvdimm pmu event list with event codes in the common interface.
> 
> - Remove Acked-by/Reviewed-by/Tested-by tags as code is refactored
>    to handle review comments from Dan.
> 
> - Make nvdimm_pmu_free_hotplug_memory function static as reported
>    by kernel test robot, also add corresponding Reported-by tag.
> 
> - Link to the patchset v4: https://lkml.org/lkml/2021/9/3/45
> 
> v3 -> v4
> - Rebase code on top of current papr_scm code without any logical
>    changes.
> 
> - Added Acked-by tag from Peter Zijlstra and Reviewed by tag
>    from Madhavan Srinivasan.
> 
> - Link to the patchset v3: https://lkml.org/lkml/2021/6/17/605
> 
> v2 -> v3
> - Added Tested-by tag.
> 
> - Fix nvdimm mailing list in the ABI Documentation.
> 
> - Link to the patchset v2: https://lkml.org/lkml/2021/6/14/25
> 
> v1 -> v2
> - Fix hotplug code by adding pmu migration call
>    incase current designated cpu got offline. As
>    pointed by Peter Zijlstra.
> 
> - Removed the retun -1 part from cpu hotplug offline
>    function.
> 
> - Link to the patchset v1: https://lkml.org/lkml/2021/6/8/500
> 
> Kajol Jain (4):
>    drivers/nvdimm: Add nvdimm pmu structure
>    drivers/nvdimm: Add perf interface to expose nvdimm performance stats
>    powerpc/papr_scm: Add perf interface support
>    docs: ABI: sysfs-bus-nvdimm: Document sysfs event format entries for
>      nvdimm pmu
> 
>   Documentation/ABI/testing/sysfs-bus-nvdimm |  35 +++
>   arch/powerpc/include/asm/device.h          |   5 +
>   arch/powerpc/platforms/pseries/papr_scm.c  | 225 ++++++++++++++
>   drivers/nvdimm/Makefile                    |   1 +
>   drivers/nvdimm/nd_perf.c                   | 328 +++++++++++++++++++++
>   include/linux/nd.h                         |  41 +++
>   6 files changed, 635 insertions(+)
>   create mode 100644 drivers/nvdimm/nd_perf.c
> 

-- 
Thanks and Regards
R.Nageswara Sastry
