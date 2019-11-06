Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D88F0AF8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 01:19:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4776bW5fcMzF3hL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4776K81k8ZzF59T
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 11:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4776K724fpz8tVR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 11:06:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4776K71YMSz9sPK; Wed,  6 Nov 2019 11:06:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4776K64KmYz9sPF
 for <linuxppc-dev@ozlabs.org>; Wed,  6 Nov 2019 11:06:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA606k0o003293; Tue, 5 Nov 2019 19:06:46 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3hxp21s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 19:06:46 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA606dXa018665;
 Wed, 6 Nov 2019 00:06:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 2w11e72g20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 00:06:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA606c5w47251768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 00:06:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7EB5BE056;
 Wed,  6 Nov 2019 00:06:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9F41BE053;
 Wed,  6 Nov 2019 00:06:37 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.85.144.27])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Nov 2019 00:06:37 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH] powerpc/pseries/mobility: notify network peers after
 migration
Date: Tue,  5 Nov 2019 18:06:34 -0600
Message-Id: <1572998794-9392-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050195
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
Cc: nathanl@linux.ibm.com, netdev@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, msuchanek@suse.com,
 tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After a migration, it is necessary to send a gratuitous ARP
from all running interfaces so that the rest of the network
is aware of its new location. However, some supported network
devices are unaware that they have been migrated. To avoid network
interruptions and other unwanted behavior, force a GARP on all
valid, running interfaces as part of the post_mobility_fixup
routine.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index b571285f6c14..c1abc14cf2bb 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -17,6 +17,9 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/stringify.h>
+#include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
+#include <net/net_namespace.h>
 
 #include <asm/machdep.h>
 #include <asm/rtas.h>
@@ -331,6 +334,8 @@ void post_mobility_fixup(void)
 {
 	int rc;
 	int activate_fw_token;
+	struct net_device *netdev;
+	struct net *net;
 
 	activate_fw_token = rtas_token("ibm,activate-firmware");
 	if (activate_fw_token == RTAS_UNKNOWN_SERVICE) {
@@ -371,6 +376,21 @@ void post_mobility_fixup(void)
 	/* Possibly switch to a new RFI flush type */
 	pseries_setup_rfi_flush();
 
+	/* need to force a gratuitous ARP on running interfaces */
+	rtnl_lock();
+	for_each_net(net) {
+		for_each_netdev(net, netdev) {
+			if (netif_device_present(netdev) &&
+			    netif_running(netdev) &&
+			    !(netdev->flags & (IFF_NOARP | IFF_LOOPBACK)))
+				call_netdevice_notifiers(NETDEV_NOTIFY_PEERS,
+							 netdev);
+				call_netdevice_notifiers(NETDEV_RESEND_IGMP,
+							 netdev);
+		}
+	}
+	rtnl_unlock();
+
 	return;
 }
 
-- 
2.12.3

