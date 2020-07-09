Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451C2197CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 07:23:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Phr2Dh6zDqdT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:23:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Pbg6ncqzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 15:18:55 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06951wOr091202; Thu, 9 Jul 2020 01:18:49 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325uqv1m98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 01:18:48 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0695ExrR015302;
 Thu, 9 Jul 2020 05:18:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 325mr2rcb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 05:18:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0695IhMN12976412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 05:18:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2247A405F;
 Thu,  9 Jul 2020 05:18:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8604A4054;
 Thu,  9 Jul 2020 05:18:41 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.221.181])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 05:18:41 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 0/2] Add cpu hotplug support for powerpc/perf/hv-24x7
Date: Thu,  9 Jul 2020 10:48:34 +0530
Message-Id: <20200709051836.723765-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_01:2020-07-08,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007090034
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, suka@us.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset add cpu hotplug support for hv_24x7 driver by adding
online/offline cpu hotplug function. It also add sysfs file
"cpumask" to expose current online cpu that can be used for
hv_24x7 event count.

Changelog:
v4 -> v5
- Since we are making PMU fail incase hotplug init failed, hence
  directly adding cpumask attr inside if_attrs rather then creating
  new attribute_group as suggested by Madhavan Srinivasan.

v3 -> v4
- Make PMU initialization fail incase hotplug init failed. Rather then
  just printing error msg.
- Did some nits changes like removing extra comment and initialising
  target value part as suggested by Michael Ellerman
- Retained Reviewd-by tag because the changes were fixes to some nits.

- Incase we sequentially offline multiple cpus, taking cpumask_first() may
  add some latency in that scenario.

  So, I was trying to test benchmark in power9 lpar with 16 cpu,
  by off-lining cpu 0-14

With cpumask_last: This is what I got.

real	0m2.812s
user	0m0.002s
sys	0m0.003s

With cpulast_any:
real	0m3.690s
user	0m0.002s
sys	0m0.062s

That's why I just went with cpumask_last thing.

v2 -> v3
- Corrected some of the typo mistakes and update commit message
  as suggested by Gautham R Shenoy.
- Added Reviewed-by tag for the first patch in the patchset.

v1 -> v2
- Changed function to pick active cpu incase of offline
  from "cpumask_any_but" to "cpumask_last", as
  cpumask_any_but function pick very next online cpu and incase where
  we are sequentially off-lining multiple cpus, "pmu_migrate_context"
  can add extra latency.
  - Suggested by: Gautham R Shenoy.

- Change documentation for cpumask and rather then hardcode the
  initialization for cpumask_attr_group, add loop to get very first
  NULL as suggested by Gautham R Shenoy.

Kajol Jain (2):
  powerpc/perf/hv-24x7: Add cpu hotplug support
  powerpc/hv-24x7: Add sysfs files inside hv-24x7 device to show cpumask

 .../sysfs-bus-event_source-devices-hv_24x7    |  7 +++
 arch/powerpc/perf/hv-24x7.c                   | 54 +++++++++++++++++++
 include/linux/cpuhotplug.h                    |  1 +
 3 files changed, 62 insertions(+)

-- 
2.26.2

