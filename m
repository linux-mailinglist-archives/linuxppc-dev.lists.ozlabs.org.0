Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B844FE60D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 18:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBMV5g7rz3bhK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 02:41:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWuD9R47;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QWuD9R47; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdBLr1PB9z2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 02:41:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CGDZsV029887; 
 Tue, 12 Apr 2022 16:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=LE535E2ZSsCYjUm2u5nT2c7n/KI2GcedAR+J8mt26M0=;
 b=QWuD9R47mwcgpx7HgSp4Iy8/LMqHGvVm/tLCofzn9ZB/hIxQ148oV38PbuIrT3FicgFT
 qcIIfLnUHP97n9hwZKku1OWew8fktqjaAb3Kv5vQomunudKAn6rUeNXZqUX97TXPCPP4
 BFB4b5t1SHQweyMdOHBNo/5hA1g0iLvYgww/HogHjKwvd7I2TErOwosb8T/lGWUE2Jr+
 fIc89Oletd9gJTiOtJKiCgknXJ3KS2lCZTTn6PqEz5sYF6Ew141/tFtqn/MOKroZEtLK
 0uaM1EeS62WLAU7zmD9fXdT7S29Mp9aO+4Wc8vJyO0zpJkUKhRFbKWG2rCNhAntYHG55 nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fdcrjrjc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:14 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGZ3Fl031289;
 Tue, 12 Apr 2022 16:41:14 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fdcrjrjbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:13 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGY5Ji009516;
 Tue, 12 Apr 2022 16:41:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3fb1s8m8ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGf86O40567142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:41:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A22D8AE051;
 Tue, 12 Apr 2022 16:41:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D72DAAE04D;
 Tue, 12 Apr 2022 16:41:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.3.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 16:41:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH V3 0/2] Fix perf bench numa to work with machines having #CPUs
 > 1K
Date: Tue, 12 Apr 2022 22:10:57 +0530
Message-Id: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: isgCRUbZeKHNqvogx-vg97hrxlBbI9Is
X-Proofpoint-ORIG-GUID: AkCToOTRQ7TrovAZmyLbaRPvbxiY0LVD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204120079
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The perf benchmark for collections: numa hits failure in system
configuration with CPU's more than 1024. These benchmarks uses
"sched_getaffinity" and "sched_setaffinity" in the code to
work with affinity.

Example snippet from numa benchmark:
<<>>
perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
Aborted (core dumped)
<<>>

bind_to_node function uses "sched_getaffinity" to save the cpumask.
This fails with EINVAL because the default mask size in glibc is 1024

To overcome this 1024 CPUs mask size limitation of cpu_set_t,
change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
allocate cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.

Fix all the relevant places in the code to use mask size which is large
enough to represent number of possible CPU's in the system.

This patchset also address a fix for parse_setup_cpu_list function in
numa bench to check if input CPU is online before binding task to
that CPU. This is to fix failures where, though CPU number is within
max CPU, it could happen that CPU is offline. Here, sched_setaffinity
will result in failure when using cpumask having that cpu bit set
in the mask.

Patch 1 address fix for parse_setup_cpu_list to check if CPU used to bind
task is online. Patch 2 has fix for bench numa to work with machines
having #CPUs > 1K

Athira Rajeev (2):
  tools/perf: Fix perf bench numa testcase to check if CPU used to bind
    task is online
  perf bench: Fix numa bench to fix usage of affinity for machines with
    #CPUs > 1K

Changelog:
v2 -> v3
Link to the v2 version :
https://lore.kernel.org/all/20220406175113.87881-1-atrajeev@linux.vnet.ibm.com/
 - From the v2 version, patch 1 and patch 2 are now part of upstream.
 - This v3 version separates patch 3 and patch 4 to address review
   comments from arnaldo which includes using sysfs__read_str for reading
   sysfs file and fixing the compilation issues observed in debian

 tools/perf/bench/numa.c  | 136 +++++++++++++++++++++++++++++----------
 tools/perf/util/header.c |  51 +++++++++++++++
 tools/perf/util/header.h |   1 +
 3 files changed, 153 insertions(+), 35 deletions(-)

-- 
2.35.1

