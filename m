Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A032FB355
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 08:41:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKgZx3qGRzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:41:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CloMoG8R; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKgT92XTqzDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 18:36:44 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J7X2kM113164; Tue, 19 Jan 2021 02:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=+qIzXIBMsoplKGqI4+slcFF/1Ae/KuT5AYoNIFZCeYk=;
 b=CloMoG8R9lJlgcj21AxKhZSfewBzaW6MojVjS9RNmPOAvb9x1itSGaEBvj+ZrQDl3xPJ
 JmGcPBn8g2xLSBEobsBNThDqDI+MhYlCSX7F9oustC/MBaQFzhvRMWd4P+mjBfizuoDg
 YtUCDV5/FHW15eMw8rEtVkw07DIMY5ayzq0KPe7MXWNtJMYeH3B78iEPLyMdUassSIt2
 7Jp6Mmqzkjx094Kuu/TYarmtiUxsDOWXJsu6+4+d2CQuB5hWRYOoERN+yQPpnX2LjuXk
 NpNxnG2ZfiQqaC0g0i9iLBFAwF3TMbmfaBgcmXv0NaAYObvafN7FkOX2atqJ+n6dSRaf ow== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365t87195n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 02:36:37 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J7W4SN004403;
 Tue, 19 Jan 2021 07:36:34 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 363qs8vgxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 07:36:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J7aXQL33423776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 07:36:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 573B42805E;
 Tue, 19 Jan 2021 07:36:33 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 877EE2805C;
 Tue, 19 Jan 2021 07:36:32 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.213.81])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 07:36:32 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 01E2F2E2EE0; Tue, 19 Jan 2021 13:06:27 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: [PATCH 0/2] powerpc/cacheinfo: Add "ibm,thread-groups" awareness
Date: Tue, 19 Jan 2021 13:06:18 +0530
Message-Id: <1611041780-8640-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_01:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=860 clxscore=1015 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190044
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Hi,

Currently the cacheinfo code on powerpc indexes the "cache" objects
(modelling the L1/L2/L3 caches) where the key is device-tree node
corresponding to that cache. On some of the POWER server platforms
thread-groups within the core share different sets of caches (Eg: On
SMT8 POWER9 systems, threads 0,2,4,6 of a core share L1 cache and
threads 1,3,5,7 of the same core share another L1 cache). On such
platforms, there is a single device-tree node corresponding to that
cache and the cache-configuration within the threads of the core is
indicated via "ibm,thread-groups" device-tree property.

Since the current code is not aware of the "ibm,thread-groups"
property, on the aforementoined systems, cacheinfo code still treats
all the threads in the core to be sharing the cache because of the
single device-tree node (In the earlier example, the cacheinfo code
would says CPUs 0-7 share L1 cache).

In this patch series, we make the powerpc cacheinfo code aware of the
"ibm,thread-groups" property. We indexe the "cache" objects by the
key-pair (device-tree node, thread-group id). For any CPUX, for a
given level of cache, the thread-group id is defined to be the first
CPU in the "ibm,thread-groups" cache-group containing CPUX. For levels
of cache which are not represented in "ibm,thread-groups" property,
the thread-group id is -1.

We can now remove the helper function get_shared_cpu_map() and
index_dir_to_cpu() since the cache->shared_cpu_map contains the
correct satate of the thread-siblings sharing the cache.

This has been tested on a SMT8 POWER9 system where L1 cache is split
between groups of threads in the core and on an SMT8 POWER10 system
where L1 and L2 caches are split between groups of threads in a core.

With this patch series, on POWER10 SMT8 system, we see the following
reported via sysfs:

$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8-15
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:8-15

$ ppc64_cpu --smt=4
$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8-11
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:8-11

$ ppc64_cpu --smt=2
$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8-9
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:8-9

$ ppc64_cpu --smt=1
$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8

Gautham R. Shenoy (2):
  powerpc/cacheinfo: Lookup cache by dt node and thread-group id
  powerpc/cacheinfo: Remove the redundant get_shared_cpu_map()

 arch/powerpc/include/asm/smp.h  |   3 +
 arch/powerpc/kernel/cacheinfo.c | 121 ++++++++++++++++++++--------------------
 2 files changed, 62 insertions(+), 62 deletions(-)

-- 
1.9.4

