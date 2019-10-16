Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5628D995F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 20:42:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46th3h2WRFzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 05:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tgwy6Wn6zDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 05:36:18 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9GIHbGG037636
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 14:36:15 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vp67rn79u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 14:36:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9GINLKM018200
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:36:14 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2vk6f7rg71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:36:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9GIaCP251970334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 18:36:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EBB2BE04F;
 Wed, 16 Oct 2019 18:36:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85259BE051;
 Wed, 16 Oct 2019 18:36:12 +0000 (GMT)
Received: from localhost (unknown [9.41.179.251])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 18:36:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/pseries: address checkpatch warnings in
 dlpar_offline_cpu
Date: Wed, 16 Oct 2019 13:36:10 -0500
Message-Id: <20191016183611.10867-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191016183611.10867-1-nathanl@linux.ibm.com>
References: <20191016183611.10867-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160151
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove some stray blank lines, convert a printk to pr_warn, and
address a line length violation.

One functional change: use WARN_ON instead of BUG_ON in case H_PROD of
a ceded thread yields an unexpected result from the platform. We can
expect this code path to get uninterruptibly stuck in __cpu_die() if
this happens, but that's more desirable than crashing.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: b6db63d1a7f0 ("pseries/pseries: Add code to online/offline CPUs of a DLPAR node")
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index bbda646b63b5..f3f54ef645e1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -539,7 +539,6 @@ static int dlpar_offline_cpu(struct device_node *dn)
 					goto out;
 				cpu_maps_update_begin();
 				break;
-
 			}
 
 			/*
@@ -547,19 +546,19 @@ static int dlpar_offline_cpu(struct device_node *dn)
 			 * Upgrade it's state to CPU_STATE_OFFLINE.
 			 */
 			set_preferred_offline_state(cpu, CPU_STATE_OFFLINE);
-			BUG_ON(plpar_hcall_norets(H_PROD, thread)
-								!= H_SUCCESS);
+			WARN_ON(plpar_hcall_norets(H_PROD, thread) != H_SUCCESS);
 			__cpu_die(cpu);
 			break;
 		}
-		if (cpu == num_possible_cpus())
-			printk(KERN_WARNING "Could not find cpu to offline with physical id 0x%x\n", thread);
+		if (cpu == num_possible_cpus()) {
+			pr_warn("Could not find cpu to offline with physical id 0x%x\n",
+				thread);
+		}
 	}
 	cpu_maps_update_done();
 
 out:
 	return rc;
-
 }
 
 static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
-- 
2.20.1

