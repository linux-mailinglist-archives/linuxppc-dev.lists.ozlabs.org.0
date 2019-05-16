Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF921FDC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:39:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Fxk412NzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 12:39:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454FvF6cYZzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 12:37:29 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G2bQZG091747
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:37:26 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sgw8f47kn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:37:26 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.ibm.com>;
 Thu, 16 May 2019 03:37:13 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 03:37:11 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4G2bAR928180702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 02:37:10 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95D092805A;
 Thu, 16 May 2019 02:37:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F399628067;
 Thu, 16 May 2019 02:37:09 +0000 (GMT)
Received: from ltcalpine2-lp11.aus.stglabs.ibm.com (unknown [9.40.195.194])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 02:37:09 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/pseries: Don't update cpu topology after PRRN
 event
Date: Wed, 15 May 2019 21:37:06 -0500
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190516023706.50118-1-tyreld@linux.ibm.com>
References: <20190516023706.50118-1-tyreld@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19051602-0064-0000-0000-000003DF1AE2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011104; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203939; UDB=6.00631989; IPR=6.00984869; 
 MB=3.00026909; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-16 02:37:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051602-0065-0000-0000-00003D7C7648
Message-Id: <20190516023706.50118-3-tyreld@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=925 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160017
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, mingming.cao@ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we receive a PRRN event through the event-scan interface we call
pseries_devicetree_update() to update the affinty properties in our
device tree via RTAS. Following this our implemenation attempts to both
frob the existing kernel cpu numa affinities of the live system with the
new device tree properties while also performing a full cpu hotplug
readd of the affected cpus in resposne to the a OF property notifier
triggerd by the device tree update.

This patch does away with the topology update call to frob the
associativity since the DLPAR readd will put the cpu in the proper
numa node when its added back.

Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/rtasd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index 8a1746d755c9..d3aa3a056d8e 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -285,7 +285,6 @@ static void handle_prrn_event(s32 scope)
 	 * the RTAS event.
 	 */
 	pseries_devicetree_update(-scope);
-	numa_update_cpu_topology(false);
 }
 
 static void handle_rtas_event(const struct rtas_error_log *log)
-- 
2.18.1

