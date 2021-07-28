Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF173D94B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 19:56:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZhF443MKz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 03:56:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kTBdKhsy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kTBdKhsy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZhDZ1gblz30G4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 03:56:29 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SHfMcZ019519; Wed, 28 Jul 2021 13:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=NjJERWBzb5zoFgT/vmq+Cee4cs9QR24pOH5MI9bLb5k=;
 b=kTBdKhsyur3uPG+xONait3i4Tffjjbb/OFGWeefDgDVXUt5FOdTFWnrW1YsblbxniIx8
 z0U4AJhNJTrR4PG9R8CJjEOMgtJoY3WZcccYMMZ57Fbv3bdRDMEI7lab2VOdWgBuC3Du
 7SqY9WUcPDxQTMRUQXQuW03ZfoWoN5jNHc0+P9aZO797OYKevUDeWg6Qp+3GXFa0yL0I
 UkTjmKtSg3PuCDhNLm6BdNfeWiXZNyW2hOb4psss+oGwaqwtXGeQ0VTSsG1zsOgJ80Ku
 nkIIiHg3SJm8ELx+A1Muq2a+8glLx+b6+lYJ8ahaWht0RF+C+GfA+1nlUlMybvN8mYWs lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a38texnd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 13:56:20 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16SHjAU6035592;
 Wed, 28 Jul 2021 13:56:20 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a38texncc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 13:56:20 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SHsk1M009290;
 Wed, 28 Jul 2021 17:56:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3a235krsvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 17:56:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16SHuFMD19988770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 17:56:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F4D152051;
 Wed, 28 Jul 2021 17:56:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.1.109])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3B13652050;
 Wed, 28 Jul 2021 17:56:11 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv2 0/3] Subject: [PATCHv2 0/3] Make cache-object aware of L3
 siblings by parsing "ibm, thread-groups" property
Date: Wed, 28 Jul 2021 23:26:04 +0530
Message-Id: <20210728175607.591679-1-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FSesK1WUlaNKzZgds2cvNtqBph7JxHbZ
X-Proofpoint-ORIG-GUID: QdvteKlnFTtwC56ZP9UyKcFsbktVDUsq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_08:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280099
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 parths1229@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes from v1 -> v2:
- Based on Gautham's comments, use a separate thread_group_l3_cache_map
  and modify parsing code to build cache_map for L3. This makes the
  cache_map building code isolated from the parsing code.
v1 can be found at:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-June/230680.html

On POWER10 big-core system, the L3 cache reflected by sysfs contains all
the CPUs in the big-core.

grep . /sys/devices/system/cpu/cpu0/cache/index*/shared_cpu_list
/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list:0,2,4,6
/sys/devices/system/cpu/cpu0/cache/index1/shared_cpu_list:0,2,4,6
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list:0,2,4,6
/sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list:0-7

In the above example, CPU-0 observes CPU 0-7 in L3 (index3) cache, which
is not correct as only the CPUs in small core share the L3 cache.

The "ibm,thread-groups" contains property "2" to indicate that the CPUs
share both the L2 and L3 caches. This patch-set uses this property to
reflect correct L3 topology to a cache-object.

After applying this patch-set, the topology looks like:
$> ppc64_cpu --smt=8
$> grep . /sys/devices/system/cpu/cpu[89]/cache/*/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:9,11,13,15


$> ppc64_cpu --smt=4
$> grep . /sys/devices/system/cpu/cpu[89]/cache/*/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:9,11

$> ppc64_cpu --smt=2
$> grep . /sys/devices/system/cpu/cpu[89]/cache/*/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:9

$> ppc64_cpu --smt=1
grep . /sys/devices/system/cpu/cpu[89]/cache/*/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8

Patches Organization:
=====================
This patch-set series is based on top of v5.14-rc2

- Patch 1-2: Add functionality to introduce awareness for
"ibm,thread-groups". Original (not merged) posted version can be found at:
https://lore.kernel.org/linuxppc-dev/1611041780-8640-1-git-send-email-ego@linux.vnet.ibm.co
- Patch 3: Use existing L2 cache_map to detect L3 cache siblings


Gautham R. Shenoy (2):
  powerpc/cacheinfo: Lookup cache by dt node and thread-group id
  powerpc/cacheinfo: Remove the redundant get_shared_cpu_map()

Parth Shah (1):
  powerpc/smp: Use existing L2 cache_map cpumask to find L3 cache
    siblings

 arch/powerpc/include/asm/smp.h  |   6 ++
 arch/powerpc/kernel/cacheinfo.c | 124 ++++++++++++++++----------------
 arch/powerpc/kernel/smp.c       |  70 ++++++++++++------
 3 files changed, 115 insertions(+), 85 deletions(-)

-- 
2.26.3

