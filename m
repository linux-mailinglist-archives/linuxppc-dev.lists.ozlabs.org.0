Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C90351BE5E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 20:11:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C66J2XwNzDrBk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 04:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C63c09XrzDqtY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 04:09:30 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TI34Pn131497; Wed, 29 Apr 2020 14:09:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9q2wf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:09:28 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03TI4W3P140412;
 Wed, 29 Apr 2020 14:09:27 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9q2wej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:09:27 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03TI5WE8006665;
 Wed, 29 Apr 2020 18:09:26 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 30mcu70jcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 18:09:26 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03TI9PjV26214756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 18:09:25 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DADD6E050;
 Wed, 29 Apr 2020 18:09:25 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2D8C6E054;
 Wed, 29 Apr 2020 18:09:22 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.80.239.215])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 18:09:22 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH] net/bonding: Do not transition down slave after speed/duplex
 check
Date: Wed, 29 Apr 2020 13:09:19 -0500
Message-Id: <1588183759-7659-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_09:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=1 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290136
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
Cc: Jay Vosburgh <j.vosburgh@gmail.com>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Veaceslav Falico <vfalico@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andy Gospodarek <andy@greyhouse.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following behavior has been observed when testing logical partition
migration of LACP-bonded VNIC devices in a PowerVM pseries environment.

1. When performing the migration, the bond master detects that a slave has
   lost its link, deactivates the LACP port, and sets the port's
   is_enabled flag to false.
2. The slave device then updates it's carrier state to off while it resets
   itself. This update triggers a NETDEV_CHANGE notification, which performs
   a speed and duplex update. The device does not return a valid speed
   and duplex, so the master sets the slave link state to BOND_LINK_FAIL.
3. When the slave VNIC device(s) are active again, some operations, such
   as setting the port's is_enabled flag, are not performed when transitioning
   the link state back to BOND_LINK_UP from BOND_LINK_FAIL, though the state
   prior to the speed check was BOND_LINK_DOWN.

Affected devices are therefore not utilized in the aggregation though they
are operational. The simplest way to fix this seems to be to restrict the
link state change to devices that are currently up and running.

CC: Jay Vosburgh <j.vosburgh@gmail.com>
CC: Veaceslav Falico <vfalico@gmail.com>
CC: Andy Gospodarek <andy@greyhouse.net>
Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/bonding/bond_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 2e70e43c5df5..d840da7cd379 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -3175,7 +3175,8 @@ static int bond_slave_netdev_event(unsigned long event,
 		 * speeds/duplex are available.
 		 */
 		if (bond_update_speed_duplex(slave) &&
-		    BOND_MODE(bond) == BOND_MODE_8023AD) {
+		    BOND_MODE(bond) == BOND_MODE_8023AD &&
+		    slave->link == BOND_LINK_UP) {
 			if (slave->last_link_up)
 				slave->link = BOND_LINK_FAIL;
 			else
-- 
2.18.2

