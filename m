Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71774218319
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 11:05:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1tgr2mkQzDr8p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 19:05:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1tYX6TrLzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 19:00:16 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0688YWRt081168; Wed, 8 Jul 2020 05:00:11 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324y2xsvkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 05:00:10 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0688kPF1025808;
 Wed, 8 Jul 2020 09:00:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3251w8g7x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 09:00:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068902sN39845996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 09:00:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D03A52077;
 Wed,  8 Jul 2020 09:00:02 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.206.155])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 89E005204E;
 Wed,  8 Jul 2020 09:00:00 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 0/2] Add cpu hotplug support for powerpc/perf/hv-24x7
Date: Wed,  8 Jul 2020 14:29:53 +0530
Message-Id: <20200708085955.655686-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 cotscore=-2147483648 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080061
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

 .../sysfs-bus-event_source-devices-hv_24x7    |  7 ++
 arch/powerpc/perf/hv-24x7.c                   | 79 ++++++++++++++++++-
 include/linux/cpuhotplug.h                    |  1 +
 3 files changed, 86 insertions(+), 1 deletion(-)

-- 
2.26.2

