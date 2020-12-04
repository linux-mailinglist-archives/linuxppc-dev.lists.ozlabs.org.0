Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDBE2CE72A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 05:55:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnL3j16kWzDr8p
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=suNmWu0W; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnKy33nPyzDrN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 15:50:03 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B44cWwT050445; Thu, 3 Dec 2020 23:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=DVPyRZisQebFdRzsZYkMxjFlCMHhb8Pssm/fUvp1D+0=;
 b=suNmWu0WlI8OG1Kq00UjIMIo7novl7WCFy7rMXFSvWEQtoXm1WLvglXxLYG3xixYe6eu
 ZSp+alx1C8itJlzhsRomnAwFNl5Liti0kn1eolh3jQE20YJEOfOTd6KBSrexrQU5s727
 OvrNsPWSC9V8AsL4dNQKw3BasazxhOdj2KR6Q1HgkolmSdBOvSiDOVo/l0VxfMMcxarv
 oobmuO1hVnOIggCxE+3wlQtBxjRJUARcC64qvC2FYOw2UcOX9y+d3ZCIynWGti/mEi80
 h/pE3XAduGqKNwG5YL1T+GCg2i5wTOHtriZorP4aAOjLzt6nCNShwvFF58sD7BAJcF+D 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357d37sx8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 23:49:08 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B44jI1m071360;
 Thu, 3 Dec 2020 23:49:08 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357d37sx88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 23:49:08 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B44lSHO002170;
 Fri, 4 Dec 2020 04:49:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 356q6qs5w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 04:49:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B44n6ox20578640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 04:49:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B91D8BE04F;
 Fri,  4 Dec 2020 04:49:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AFAFBE054;
 Fri,  4 Dec 2020 04:49:06 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.56.248])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 04:49:06 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id B69542E4200; Fri,  4 Dec 2020 10:19:01 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH 3/3] powerpc/cacheinfo: Print correct cache-sibling map/list
 for L2 cache
Date: Fri,  4 Dec 2020 10:18:47 +0530
Message-Id: <1607057327-29822-4-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_01:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012040024
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

On POWER platforms where only some groups of threads within a core
share the L2-cache (indicated by the ibm,thread-groups device-tree
property), we currently print the incorrect shared_cpu_map/list for
L2-cache in the sysfs.

This patch reports the correct shared_cpu_map/list on such platforms.

Example:
On a platform with "ibm,thread-groups" set to
                 00000001 00000002 00000004 00000000
                 00000002 00000004 00000006 00000001
                 00000003 00000005 00000007 00000002
                 00000002 00000004 00000000 00000002
                 00000004 00000006 00000001 00000003
                 00000005 00000007

This indicates that threads {0,2,4,6} in the core share the L2-cache
and threads {1,3,5,7} in the core share the L2 cache.

However, without the patch, the shared_cpu_map/list for L2 for CPUs 0,
1 is reported in the sysfs as follows:

/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list:0-7
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_map:000000,000000ff

/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_list:0-7
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map:000000,000000ff

With the patch, the shared_cpu_map/list for L2 cache for CPUs 0, 1 is
correctly reported as follows:

/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list:0,2,4,6
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_map:000000,00000055

/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_list:1,3,5,7
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map:000000,000000aa

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 65ab9fc..1cc8f37 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -651,15 +651,22 @@ static unsigned int index_dir_to_cpu(struct cache_index_dir *index)
 	return dev->id;
 }
 
+extern bool thread_group_shares_l2;
 /*
  * On big-core systems, each core has two groups of CPUs each of which
  * has its own L1-cache. The thread-siblings which share l1-cache with
  * @cpu can be obtained via cpu_smallcore_mask().
+ *
+ * On some big-core systems, the L2 cache is shared only between some
+ * groups of siblings. This is already parsed and encoded in
+ * cpu_l2_cache_mask().
  */
 static const struct cpumask *get_big_core_shared_cpu_map(int cpu, struct cache *cache)
 {
 	if (cache->level == 1)
 		return cpu_smallcore_mask(cpu);
+	if (cache->level == 2 && thread_group_shares_l2)
+		return cpu_l2_cache_mask(cpu);
 
 	return &cache->shared_cpu_map;
 }
-- 
1.9.4

