Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93303ED9BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:17:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpHpq3qRWz3cPn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 01:17:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TTNUJxcq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TTNUJxcq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpHp35wzgz300b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 01:17:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GF4LmG096244; Mon, 16 Aug 2021 11:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=77OMHVAJ+sap+19YlcRQVh76SBmswR9LELxGKC+kib8=;
 b=TTNUJxcqtv9Ey2IHuuIRcYfJAzRk3Dq4OHmqFlfJe0kk7dpAZyGv4K7Eh/HgjKeUM0FT
 G0wC0iwb3U3/tpF1FinAUSyKsymPB5Y3aN9mk57okrjk5VHLKwqGL++A5TaBy5u77r8F
 Tb98aI1lnv9LmvUdS9LK97KSopKaf9DXQLrcn73pQaQJRl4b2R+WjZlMPL8j+2wyaSwt
 YMSazxZG309yQyK0uthpcvUM0DGUWVkAVfMTNtd5IrvuJxfpNIvMBkpgEeMX7qmyguZG
 +96975kowiGXGvRvtZHcLLwVsuHEd3yHSvZAhqjdo5zCzAcVxeeVGHmH3WxfzQDz7djR bQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetr6bf0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 11:17:08 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17GFCwbN031595;
 Mon, 16 Aug 2021 15:17:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3ae5fb4q2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 15:17:07 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17GFH6IE30736862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 15:17:06 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 408E028059;
 Mon, 16 Aug 2021 15:17:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CDC328060;
 Mon, 16 Aug 2021 15:17:06 +0000 (GMT)
Received: from localhost (unknown [9.211.33.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 15:17:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/cpuhp: fix non-NUMA build
Date: Mon, 16 Aug 2021 10:17:05 -0500
Message-Id: <20210816151705.2786296-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H_KVEExRApqhaMaf_HW9-JkuTmzzjvay
X-Proofpoint-ORIG-GUID: H_KVEExRApqhaMaf_HW9-JkuTmzzjvay
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_05:2021-08-16,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxlogscore=997 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160096
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
Cc: ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_NUMA unset, direct references to node_to_cpumask_map don't
work:

   arch/powerpc/platforms/pseries/hotplug-cpu.c: In function 'pseries_cpu_hotplug_init':
>> arch/powerpc/platforms/pseries/hotplug-cpu.c:1022:8: error: 'node_to_cpumask_map' undeclared (first use in this
>> function)
    1022 |        node_to_cpumask_map[node]);
	 |        ^~~~~~~~~~~~~~~~~~~

Use cpumask_of_node() here instead.

Fixes: bd1dd4c5f528 ("powerpc/pseries: Prevent free CPU ids being reused on another node")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 1ef40ef699a6..d646c22e94ab 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -1021,7 +1021,7 @@ static int __init pseries_cpu_hotplug_init(void)
 			/* Record ids of CPU added at boot time */
 			cpumask_or(node_recorded_ids_map[node],
 				   node_recorded_ids_map[node],
-				   node_to_cpumask_map[node]);
+				   cpumask_of_node(node));
 		}
 
 		of_reconfig_notifier_register(&pseries_smp_nb);
-- 
2.31.1

