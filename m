Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2195A41AF3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 14:43:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJfLm0WCKz2ymN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 22:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dx1j8l2d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dx1j8l2d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJfL14n3lz2xrl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 22:42:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SC9LvJ005896; 
 Tue, 28 Sep 2021 08:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=/IiP3OJn3/x2BE7U7GqNBNSQHO3LlVNZfJj+YeFRfp0=;
 b=dx1j8l2dKmtv4WpBoBkDYv+Kp0UI3/wBBRSTylQ/ecjVhbJps2Cgw5aZle8Ne8bwbcH8
 +qGZ//dE6530YRwHYloZHXE/7HUh0BvwmdiS249jD6QocnLCO2WySqxOiLHVEX/WCCb7
 0JTYB1kE7oYQA/KXwO5q7CMqBeXyeH6f7Ik2XUYAH4k4fttTIlYC3iUFHsxcG8Eq7ITe
 gB9OlH1fUOoqLroXiY2H4x5dAxgTj1qsr5es2DVCufDnRwzhzNRRWlsBv8hjU2WWcgPm
 ushkSd2gv8bCrdl0o1KEDnR79Z+ZZWYtj/whmtpOnrAp9AaAk4q6uZjN7bPkXTkosq3V IA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bc092c57f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 08:42:20 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SCXq9Q024042;
 Tue, 28 Sep 2021 12:42:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3b9ud9cdjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 12:42:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SCgBpc60817880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 12:42:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B437A4055;
 Tue, 28 Sep 2021 12:42:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC458A407C;
 Tue, 28 Sep 2021 12:42:05 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.50.245]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 12:42:05 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [PATCH v5 0/4] Add perf interface to expose nvdimm
Date: Tue, 28 Sep 2021 18:11:56 +0530
Message-Id: <20210928124200.146331-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C4Xjjt1gIybISOgXYVSmu7hynCqz5I_C
X-Proofpoint-GUID: C4Xjjt1gIybISOgXYVSmu7hynCqz5I_C
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280071
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
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset adds performance stats reporting support for nvdimm.
Added interface includes support for pmu register/unregister
functions. A structure is added called nvdimm_pmu to be used for
adding arch/platform specific data such as cpumask, nvdimm device
pointer and pmu event functions like event_init/add/read/del.
User could use the standard perf tool to access perf events
exposed via pmu.

Interface also defines supported event list, config fields for the
event attributes and their corresponding bit values which are exported
via sysfs. Patch 3 exposes IBM pseries platform nmem* device
performance stats using this interface.

Result from power9 pseries lpar with 2 nvdimm device:

Ex: List all event by perf list

command:# perf list nmem

  nmem0/cache_rh_cnt/                                [Kernel PMU event]
  nmem0/cache_wh_cnt/                                [Kernel PMU event]
  nmem0/cri_res_util/                                [Kernel PMU event]
  nmem0/ctl_res_cnt/                                 [Kernel PMU event]
  nmem0/ctl_res_tm/                                  [Kernel PMU event]
  nmem0/fast_w_cnt/                                  [Kernel PMU event]
  nmem0/host_l_cnt/                                  [Kernel PMU event]
  nmem0/host_l_dur/                                  [Kernel PMU event]
  nmem0/host_s_cnt/                                  [Kernel PMU event]
  nmem0/host_s_dur/                                  [Kernel PMU event]
  nmem0/med_r_cnt/                                   [Kernel PMU event]
  nmem0/med_r_dur/                                   [Kernel PMU event]
  nmem0/med_w_cnt/                                   [Kernel PMU event]
  nmem0/med_w_dur/                                   [Kernel PMU event]
  nmem0/mem_life/                                    [Kernel PMU event]
  nmem0/poweron_secs/                                [Kernel PMU event]
  ...
  nmem1/mem_life/                                    [Kernel PMU event]
  nmem1/poweron_secs/                                [Kernel PMU event]

Patch1:
        Introduces the nvdimm_pmu structure
Patch2:
        Adds common interface to add arch/platform specific data
        includes nvdimm device pointer, pmu data along with
        pmu event functions. It also defines supported event list
        and adds attribute groups for format, events and cpumask.
        It also adds code for cpu hotplug support.
Patch3:
        Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
        nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
        capabilities, cpumask and event functions and then registers
        the pmu by adding callbacks to register_nvdimm_pmu.
Patch4:
        Sysfs documentation patch

Changelog
---
v4 -> v5:
- Remove multiple variables defined in nvdimm_pmu structure include
  name and pmu functions(event_int/add/del/read) as they are just
  used to copy them again in pmu variable. Now we are directly doing
  this step in arch specific code as suggested by Dan Williams.

- Remove attribute group field from nvdimm pmu structure and
  defined these attribute groups in common interface which
  includes format, event list along with cpumask as suggested by
  Dan Williams.
  Since we added static defination for attrbute groups needed in
  common interface, removes corresponding code from papr.

- Add nvdimm pmu event list with event codes in the common interface.

- Remove Acked-by/Reviewed-by/Tested-by tags as code is refactored
  to handle review comments from Dan.

- Make nvdimm_pmu_free_hotplug_memory function static as reported
  by kernel test robot, also add corresponding Reported-by tag.

- Link to the patchset v4: https://lkml.org/lkml/2021/9/3/45

v3 -> v4
- Rebase code on top of current papr_scm code without any logical
  changes.

- Added Acked-by tag from Peter Zijlstra and Reviewed by tag
  from Madhavan Srinivasan.

- Link to the patchset v3: https://lkml.org/lkml/2021/6/17/605

v2 -> v3
- Added Tested-by tag.

- Fix nvdimm mailing list in the ABI Documentation.

- Link to the patchset v2: https://lkml.org/lkml/2021/6/14/25

v1 -> v2
- Fix hotplug code by adding pmu migration call
  incase current designated cpu got offline. As
  pointed by Peter Zijlstra.

- Removed the retun -1 part from cpu hotplug offline
  function.

- Link to the patchset v1: https://lkml.org/lkml/2021/6/8/500

Kajol Jain (4):
  drivers/nvdimm: Add nvdimm pmu structure
  drivers/nvdimm: Add perf interface to expose nvdimm performance stats
  powerpc/papr_scm: Add perf interface support
  docs: ABI: sysfs-bus-nvdimm: Document sysfs event format entries for
    nvdimm pmu

 Documentation/ABI/testing/sysfs-bus-nvdimm |  35 +++
 arch/powerpc/include/asm/device.h          |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c  | 225 ++++++++++++++
 drivers/nvdimm/Makefile                    |   1 +
 drivers/nvdimm/nd_perf.c                   | 328 +++++++++++++++++++++
 include/linux/nd.h                         |  41 +++
 6 files changed, 635 insertions(+)
 create mode 100644 drivers/nvdimm/nd_perf.c

-- 
2.26.2

