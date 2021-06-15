Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E250A3A77A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zv82t91z308f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:08:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XRJX8a48;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XRJX8a48; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zth6nRbz2xy3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:08:28 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F74LuV189650; Tue, 15 Jun 2021 03:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=A5nmxMUcOd52gR6kUFRv7h1Kn6QnWMiWs74/ebOHLMs=;
 b=XRJX8a48t68mXbD+x9sHslG2Y+H7oBAfgpA3zZcRg9gpIB6PYT2ltcXu0B3KiRAdRUW/
 90XQIR2Ne3+ky9pW1g2uT2VVcQG4crib/1y10GixlE1qem+uqFMaElEPLWgktr69ILFG
 CCGzEEwL0xEjC6LS3YXnQMJBKemimkBqylm+eRwZUjytJrJqF6qG70R9pc2TVh6Towmt
 nwebbBjK7OsGGGUEQ2jfQZoKmqQTV4oaxAKlic1Rn442bHgRSXOU3xtVEtnBIKhwlraS
 j7i53ERKxaMbFHPmQbJmkDvp5XRDr4q/dMvymIdYbNe9l8ZJwXnLDIm3XZmDsE19Kokz hg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396q76gmq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:08:21 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F78KOU032395;
 Tue, 15 Jun 2021 07:08:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 394mj8sa9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:08:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15F77DJl31195404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:07:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 776554C040;
 Tue, 15 Jun 2021 07:08:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1833B4C04E;
 Tue, 15 Jun 2021 07:08:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.27.150])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:08:14 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] Make cache-object aware of L3 siblings by parsing "ibm,
 thread-groups" property
Date: Tue, 15 Jun 2021 12:38:01 +0530
Message-Id: <20210615070804.390341-1-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LxQWqhpPnV5SaY_9dNh7jE0HvA809BlZ
X-Proofpoint-GUID: LxQWqhpPnV5SaY_9dNh7jE0HvA809BlZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150042
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
Cc: mikey@neuling.org, svaidy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
This patch-set series is based on top of v5.13-rc2

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

 arch/powerpc/include/asm/smp.h  |   5 ++
 arch/powerpc/kernel/cacheinfo.c | 124 ++++++++++++++++----------------
 arch/powerpc/kernel/smp.c       |  24 +++++--
 3 files changed, 84 insertions(+), 69 deletions(-)

-- 
2.26.3

