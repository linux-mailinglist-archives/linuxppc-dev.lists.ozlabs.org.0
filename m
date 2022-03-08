Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E414D0F2E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 06:28:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCP4C0jVpz3bXR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 16:28:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ofcnTAK2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ofcnTAK2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCP3S0nTRz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 16:27:31 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2281sisC003613; 
 Tue, 8 Mar 2022 05:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2NuPl/gKTfNiuEy8jxBmbGhyS01zHEB1cp3HGCW8c40=;
 b=ofcnTAK2IzY0XY2LtnOw1NEVeJxrpBFU4Mksb42x36v8Vkv2dwRTsIwYKJZwRU1nMZYS
 /4gmKLJZuHlPnycKEFRGgnyku3ExAgLJbQgXB8kEaVu799NNlXaJnJh9bbqC44XW4sc4
 hpytXKOZTikpSX1TrjOdQvx4baNV7GOGSG7yT6fbkpRcY6ezpfSEueOQvKs7FG35aXTY
 AaxhyHCQW4NDRuCjNkh4VZOkx2gXf2KVVEbO/+rVbUx9GgTufghA7MykUbfqxFnPqv+/
 m07alKpWEXW73cxh9SQTqlxIl6skIxPD/SbdOlTPb7DMIol2Ma31VFkJhB3vlZ1W5G2q SA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enww73p6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 05:26:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2285CWIN016187;
 Tue, 8 Mar 2022 05:26:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8dh4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 05:26:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2285QpXI50921940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 05:26:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 394F5AE045;
 Tue,  8 Mar 2022 05:26:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6012AE053;
 Tue,  8 Mar 2022 05:26:46 +0000 (GMT)
Received: from [9.43.61.97] (unknown [9.43.61.97])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Mar 2022 05:26:46 +0000 (GMT)
Message-ID: <38ab9d45-e756-80b2-1b56-287c43c84ca2@linux.ibm.com>
Date: Tue, 8 Mar 2022 10:56:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 0/4] Add perf interface to expose nvdimm
Content-Language: en-US
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
References: <20220225143024.47947-1-kjain@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220225143024.47947-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6lmNjVgsjJFS08nZkTtsgDi_kKhZ8v8k
X-Proofpoint-GUID: 6lmNjVgsjJFS08nZkTtsgDi_kKhZ8v8k
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203080022
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, vaibhav@linux.ibm.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dan,
    Can you take this patch-set if it looks fine to you.

Thanks,
Kajol Jain

On 2/25/22 20:00, Kajol Jain wrote:
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
>   nmem0/cache_rh_cnt/                                [Kernel PMU event]
>   nmem0/cache_wh_cnt/                                [Kernel PMU event]
>   nmem0/cri_res_util/                                [Kernel PMU event]
>   nmem0/ctl_res_cnt/                                 [Kernel PMU event]
>   nmem0/ctl_res_tm/                                  [Kernel PMU event]
>   nmem0/fast_w_cnt/                                  [Kernel PMU event]
>   nmem0/host_l_cnt/                                  [Kernel PMU event]
>   nmem0/host_l_dur/                                  [Kernel PMU event]
>   nmem0/host_s_cnt/                                  [Kernel PMU event]
>   nmem0/host_s_dur/                                  [Kernel PMU event]
>   nmem0/med_r_cnt/                                   [Kernel PMU event]
>   nmem0/med_r_dur/                                   [Kernel PMU event]
>   nmem0/med_w_cnt/                                   [Kernel PMU event]
>   nmem0/med_w_dur/                                   [Kernel PMU event]
>   nmem0/mem_life/                                    [Kernel PMU event]
>   nmem0/poweron_secs/                                [Kernel PMU event]
>   ...
>   nmem1/mem_life/                                    [Kernel PMU event]
>   nmem1/poweron_secs/                                [Kernel PMU event]
> 
> Patch1:
>         Introduces the nvdimm_pmu structure
> Patch2:
>         Adds common interface to add arch/platform specific data
>         includes nvdimm device pointer, pmu data along with
>         pmu event functions. It also defines supported event list
>         and adds attribute groups for format, events and cpumask.
>         It also adds code for cpu hotplug support.
> Patch3:
>         Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>         nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
>         capabilities, cpumask and event functions and then registers
>         the pmu by adding callbacks to register_nvdimm_pmu.
> Patch4:
>         Sysfs documentation patch
> 
> Changelog
> ---
> v6 -> v7
> - Add function call to numa_map_to_online_node function inorder to
>   get online numa node. As the node id returned by function dev_to_node
>   can be offline in some scenarios and can create issue in hotplug code
>   as reported by Nageswara R Sastry.
> 
> - Add function declaration of perf_pmu_register, perf_pmu_unregister
>   and  perf_pmu_migrate_context functions in nd.h file to resolve
>   the implicit-function-declaration warning as reported by kernel test
>   robot.
>   Link: https://lore.kernel.org/all/202202241242.zqzGkguy-lkp@intel.com/
> 
> - Add Tested-by, Acked-by and Reported-by tags from Peter Zijlstra
>   and Nageswara R Sastry.
> 
> - Link to the patchset v6: https://lkml.org/lkml/2022/2/17/857
> 
> Resend v5 -> v6
> - No logic change, just a rebase to latest upstream and
>   tested the patchset.
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
>   name and pmu functions(event_int/add/del/read) as they are just
>   used to copy them again in pmu variable. Now we are directly doing
>   this step in arch specific code as suggested by Dan Williams.
> 
> - Remove attribute group field from nvdimm pmu structure and
>   defined these attribute groups in common interface which
>   includes format, event list along with cpumask as suggested by
>   Dan Williams.
>   Since we added static defination for attrbute groups needed in
>   common interface, removes corresponding code from papr.
> 
> - Add nvdimm pmu event list with event codes in the common interface.
> 
> - Remove Acked-by/Reviewed-by/Tested-by tags as code is refactored
>   to handle review comments from Dan.
> 
> - Make nvdimm_pmu_free_hotplug_memory function static as reported
>   by kernel test robot, also add corresponding Reported-by tag.
> 
> - Link to the patchset v4: https://lkml.org/lkml/2021/9/3/45
> 
> v3 -> v4
> - Rebase code on top of current papr_scm code without any logical
>   changes.
> 
> - Added Acked-by tag from Peter Zijlstra and Reviewed by tag
>   from Madhavan Srinivasan.
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
>   incase current designated cpu got offline. As
>   pointed by Peter Zijlstra.
> 
> - Removed the retun -1 part from cpu hotplug offline
>   function.
> 
> - Link to the patchset v1: https://lkml.org/lkml/2021/6/8/500
> 
> Kajol Jain (4):
>   drivers/nvdimm: Add nvdimm pmu structure
>   drivers/nvdimm: Add perf interface to expose nvdimm performance stats
>   powerpc/papr_scm: Add perf interface support
>   docs: ABI: sysfs-bus-nvdimm: Document sysfs event format entries for
>     nvdimm pmu
> 
>  Documentation/ABI/testing/sysfs-bus-nvdimm |  35 +++
>  arch/powerpc/include/asm/device.h          |   5 +
>  arch/powerpc/platforms/pseries/papr_scm.c  | 225 ++++++++++++++
>  drivers/nvdimm/Makefile                    |   1 +
>  drivers/nvdimm/nd_perf.c                   | 328 +++++++++++++++++++++
>  include/linux/nd.h                         |  44 +++
>  6 files changed, 638 insertions(+)
>  create mode 100644 drivers/nvdimm/nd_perf.c
> 
