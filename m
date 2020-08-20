Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917624C8C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 01:48:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXhDY6PqMzDqyx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 09:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lBI80qt1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXhBq0lwlzDqx1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 09:46:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KNWpEw114447; Thu, 20 Aug 2020 19:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=LWvgozH5vCWQa6DI9mHHCsXlRgKTLkBwgr56N3JBteM=;
 b=lBI80qt1adQ1aj3+OHi0Bfuwb49yLnIKeghJkY4Ank1eu0SO3+wh5tqg6Jvaw6uSErsL
 Jve/D8qm+Ffyg8/iYTMv7/5+9cqvJtaRASwovGGhukf6dEhqDkc6r3+ygBtfugdHlV9O
 W+cZo97lOH0JiG2oCZ3xRWeIYcam5N5vHU6Z4AYsK9lFl1Q1reIsLxLBcLGEiwju3pb3
 mYGEokgkQpxVNyNDrc55D5jj12XqLObxu25PgwQ8wa3pjz9Lo/JW1n4IVgXvHrkfxDdP
 ejiEspS8ZtasluAPQKpfOjiUjoPkeoamxOgQJh79FX80S98RERpKPmXroQZXOzQbKai0 tg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3314mx5mpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 19:46:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KNiq1i020052;
 Thu, 20 Aug 2020 23:46:47 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3304tkyvff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 23:46:47 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07KNkkEA53215654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 23:46:47 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF71FAE05C;
 Thu, 20 Aug 2020 23:46:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FE70AE05F;
 Thu, 20 Aug 2020 23:46:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 20 Aug 2020 23:46:46 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] tty: hvcs: Don't NULL tty->driver_data until hvcs_cleanup()
Date: Thu, 20 Aug 2020 18:46:38 -0500
Message-Id: <20200820234643.70412-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_07:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=3 mlxlogscore=963 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200193
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Jason Yan <yanaijie@huawei.com>,
 "open list:HYPERVISOR VIRTUAL CONSOLE DRIVER"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code currently NULLs tty->driver_data in hvcs_close() with the
intent of informing the next call to hvcs_open() that device needs to be
reconfigured. However, when hvcs_cleanup() is called we copy hvcsd from
tty->driver_data which was previoulsy NULLed by hvcs_close() and our
call to tty_port_put(&hvcsd->port) doesn't actually do anything since
&hvcsd->port ends up translating to NULL by chance. This has the side
effect that when hvcs_remove() is called we have one too many port
references preventing hvcs_destuct_port() from ever being called. This
also prevents us from reusing the /dev/hvcsX node in a future
hvcs_probe() and we can eventually run out of /dev/hvcsX devices.

Fix this by waiting to NULL tty->driver_data in hvcs_cleanup().

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 55105ac38f89..509d1042825a 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -1216,13 +1216,6 @@ static void hvcs_close(struct tty_struct *tty, struct file *filp)
 
 		tty_wait_until_sent(tty, HVCS_CLOSE_WAIT);
 
-		/*
-		 * This line is important because it tells hvcs_open that this
-		 * device needs to be re-configured the next time hvcs_open is
-		 * called.
-		 */
-		tty->driver_data = NULL;
-
 		free_irq(irq, hvcsd);
 		return;
 	} else if (hvcsd->port.count < 0) {
@@ -1237,6 +1230,13 @@ static void hvcs_cleanup(struct tty_struct * tty)
 {
 	struct hvcs_struct *hvcsd = tty->driver_data;
 
+	/*
+	 * This line is important because it tells hvcs_open that this
+	 * device needs to be re-configured the next time hvcs_open is
+	 * called.
+	 */
+	tty->driver_data = NULL;
+
 	tty_port_put(&hvcsd->port);
 }
 
-- 
2.27.0

