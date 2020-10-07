Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431D285CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 12:22:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5r4B3Sq9zDqLV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 21:22:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5qzN5jXWzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 21:18:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cTAucJNa; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C5qzN2bJCz8tYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 21:18:08 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C5qzN1DD7z9sTD; Wed,  7 Oct 2020 21:18:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cTAucJNa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C5qzM4w6vz9sSf;
 Wed,  7 Oct 2020 21:18:07 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097A3jwS074053; Wed, 7 Oct 2020 06:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IH+lntnLJ65BkyY9enkkYAwTVl95czv9VW2SShU2DGE=;
 b=cTAucJNaHgRGAjcb5SMYjyRf9kjKwFMW4tXjgRPD0WI5TPc7yZEEJtmjuUXURzPeSkvp
 kKLTJBxSrzDVmIAH+1+aXB/Fxau2m8/4SmQmsdyINRGn0Rp35j35LnK0NIZ0koqluxcA
 G3zoihtbl3BN1G//C6n9vz3BMLHy6D5mA30bnmREcUpy2YCnSFHOx5wGYdU6OxggkPHs
 qNbK/MDDZ0u+4UU307QeXTmDZXsJ+zwiX9P1a4opp9fZEBg1eF39prYgUGYcimAc6hB5
 P9iGH12heyGZFJexUZOTHHbZo+VCWE0J8hLO0cnS5NGHs5iYdEonvGaldAQrXp+M3seA nQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341awyhjbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 06:18:05 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097AHX04006362;
 Wed, 7 Oct 2020 10:18:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 33xgx7t5qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 10:18:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 097AI0Tc35455270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 10:18:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E25135204E;
 Wed,  7 Oct 2020 10:18:00 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.85.85.113])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1FC4652052;
 Wed,  7 Oct 2020 10:17:58 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/powernv/elog: Reduce elog message severity
Date: Wed,  7 Oct 2020 15:47:56 +0530
Message-Id: <20201007101756.40811-1-hegdevasant@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_05:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=1 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=570 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070066
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

OPAL interrupts kernel whenever it has new error log. Kernel calls
interrupt handler (elog_event()) to retrieve event. elog_event makes
OPAL API call (opal_get_elog_size()) to retrieve elog info.

In some case before kernel makes opal_get_elog_size() call, it gets interrupt
again. So second time when elog_event() calls opal_get_elog_size API OPAL
returns error. Its safe to ignore this error. Hence reduce the severity
of log message.

CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-elog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 62ef7ad995da..67f435bb1ec4 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -247,7 +247,7 @@ static irqreturn_t elog_event(int irq, void *data)
 
 	rc = opal_get_elog_size(&id, &size, &type);
 	if (rc != OPAL_SUCCESS) {
-		pr_err("ELOG: OPAL log info read failed\n");
+		pr_debug("ELOG: OPAL log info read failed\n");
 		return IRQ_HANDLED;
 	}
 
-- 
2.26.2

