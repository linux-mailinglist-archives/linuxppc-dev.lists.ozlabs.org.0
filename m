Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61B20CDFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 12:42:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wPFl59VJzDqLw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 20:42:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wP7w2cQyzDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 20:37:31 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TAWE30077172; Mon, 29 Jun 2020 06:37:27 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ybntpake-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 06:37:27 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TAUFnY027280;
 Mon, 29 Jun 2020 10:37:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 31wwr7s143-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 10:37:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05TAa2Z755247294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 10:36:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 976FB11C069;
 Mon, 29 Jun 2020 10:37:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52C211C050;
 Mon, 29 Jun 2020 10:37:21 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.48.47])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 10:37:21 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/cacheinfo: Add per cpu per index shared_cpu_list
Date: Mon, 29 Jun 2020 16:07:03 +0530
Message-Id: <20200629103703.4538-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629103703.4538-1-srikar@linux.vnet.ibm.com>
References: <20200629103703.4538-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_08:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006290071
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike drivers/base/cacheinfo, powerpc cacheinfo code is not exposing
shared_cpu_list under /sys/devices/system/cpu/cpu<n>/cache/index<m>

Add shared_cpu_list to per cpu per index directory to maintain parity
with x86.  Some scripts (example: mmtests
https://github.com/gormanm/mmtests) seem to be looking for
shared_cpu_list instead of shared_cpu_map.

Before this patch
# ls /sys/devices/system/cpu0/cache/index1
coherency_line_size  number_of_sets  size  ways_of_associativity
level                shared_cpu_map  type
# cat /sys/devices/system/cpu0/cache/index1/shared_cpu_map
00ff
#

After this patch
# ls /sys/devices/system/cpu0/cache/index1
coherency_line_size  number_of_sets   shared_cpu_map  type
level                shared_cpu_list  size            ways_of_associativity
# cat /sys/devices/system/cpu0/cache/index1/shared_cpu_map
00ff
# cat /sys/devices/system/cpu0/cache/index1/shared_cpu_list
0-7
#

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 5be870f99623..d8d4552af30a 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -670,12 +670,20 @@ show_shared_cpumap(struct kobject *k, struct kobj_attribute *attr, char *buf, bo
 
 static ssize_t shared_cpu_map_show(struct kobject *k, struct kobj_attribute *attr, char *buf)
 {
-	return show_shared_cpumap(k, attr, buf, false)
+	return show_shared_cpumap(k, attr, buf, false);
+}
+
+static ssize_t shared_cpu_list_show(struct kobject *k, struct kobj_attribute *attr, char *buf)
+{
+	return show_shared_cpumap(k, attr, buf, true);
 }
 
 static struct kobj_attribute cache_shared_cpu_map_attr =
 	__ATTR(shared_cpu_map, 0444, shared_cpu_map_show, NULL);
 
+static struct kobj_attribute cache_shared_cpu_list_attr =
+	__ATTR(shared_cpu_list, 0444, shared_cpu_list_show, NULL);
+
 /* Attributes which should always be created -- the kobject/sysfs core
  * does this automatically via kobj_type->default_attrs.  This is the
  * minimum data required to uniquely identify a cache.
@@ -684,6 +692,7 @@ static struct attribute *cache_index_default_attrs[] = {
 	&cache_type_attr.attr,
 	&cache_level_attr.attr,
 	&cache_shared_cpu_map_attr.attr,
+	&cache_shared_cpu_list_attr.attr,
 	NULL,
 };
 
-- 
2.17.1

