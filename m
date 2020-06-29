Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B927620CDFE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 12:44:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wPHd0mwxzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 20:44:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wP7w4HGhzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 20:37:32 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TAZG2l129744; Mon, 29 Jun 2020 06:37:24 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycj8v08k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 06:37:24 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TAWjFq014089;
 Mon, 29 Jun 2020 10:37:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch21ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 10:37:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05TAbKMK8978512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 10:37:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC5C611C050;
 Mon, 29 Jun 2020 10:37:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4E0011C066;
 Mon, 29 Jun 2020 10:37:18 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.48.47])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 10:37:18 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc/cacheinfo: Use cpumap_print to print cpumap
Date: Mon, 29 Jun 2020 16:07:01 +0530
Message-Id: <20200629103703.4538-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629103703.4538-1-srikar@linux.vnet.ibm.com>
References: <20200629103703.4538-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_08:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=924 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 clxscore=1011 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006290075
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tejun Heo had modified shared_cpu_map_show to use scnprintf instead of
cpumap_print during support for *pb[l] format.
Refer commit 0c118b7bd09a ("powerpc: use %*pb[l] to print bitmaps including
cpumasks and nodemasks")

cpumap_print_to_pagebuf is a standard function to print cpumap.  With
commit 9cf79d115f0d ("bitmap: remove explicit newline handling using
scnprintf format string"), there is no need to print explicit newline and
trailing null character. cpumap_print_to_pagebuf internally uses
scnprintf. Hence replace scnprintf with cpumap_print_to_pagebuf.

Note: shared_cpu_map_show in drivers/base/cacheinfo.c already uses
cpumap_print_to_pagebuf.

Before this patch
# cat /sys/devices/system/cpu0/cache/index1/shared_cpu_map
00ff

#
		(Notice the extra blank line).

After this patch
# cat /sys/devices/system/cpu0/cache/index1/shared_cpu_map
00ff
#

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 470336277c67..0d3c45e2fccd 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -652,7 +652,7 @@ static ssize_t shared_cpu_map_show(struct kobject *k, struct kobj_attribute *att
 	struct cache_index_dir *index;
 	struct cache *cache;
 	const struct cpumask *mask;
-	int ret, cpu;
+	int cpu;
 
 	index = kobj_to_cache_index_dir(k);
 	cache = index->cache;
@@ -664,11 +664,7 @@ static ssize_t shared_cpu_map_show(struct kobject *k, struct kobj_attribute *att
 		mask  = &cache->shared_cpu_map;
 	}
 
-	ret = scnprintf(buf, PAGE_SIZE - 1, "%*pb\n",
-			cpumask_pr_args(mask));
-	buf[ret++] = '\n';
-	buf[ret] = '\0';
-	return ret;
+	return cpumap_print_to_pagebuf(false, buf, mask);
 }
 
 static struct kobj_attribute cache_shared_cpu_map_attr =
-- 
2.17.1

