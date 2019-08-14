Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FEF8EA73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 13:37:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468PZD0c90zDr2m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 21:37:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46822X1yqkzDqvg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 06:57:08 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EKq6KF195959
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:57:05 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ucr0skryv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:57:05 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7EKsxsi016295
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:57:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2u9nj6yvhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:57:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7EKv2eF43778504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 20:57:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC141C605B;
 Wed, 14 Aug 2019 20:57:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8281C6059;
 Wed, 14 Aug 2019 20:57:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.161.5])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 20:57:00 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: Document xmon options
Date: Wed, 14 Aug 2019 15:56:37 -0500
Message-Id: <20190814205638.25322-1-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=817 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140189
X-Mailman-Approved-At: Thu, 15 Aug 2019 21:33:39 +1000
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
Cc: Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Document all options currently supported by xmon debugger.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7ccd158b3894..6d495aab4d0b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5305,3 +5305,22 @@
 			A hex value specifying bitmask with supplemental xhci
 			host controller quirks. Meaning of each bit can be
 			consulted in header drivers/usb/host/xhci.h.
+
+	xmon		[PPC]
+			Format: { early | on | rw | ro | off }
+			Controls if xmon debugger is enabled. Default is off.
+			Passing only "xmon" is equivalent to "xmon=early".
+			early	Call xmon as early as possible on boot; xmon
+				debugger is called from setup_arch().
+			on	xmon debugger hooks will be installed so xmon
+				is only called on a kernel crash. Default mode,
+				i.e. either "ro" or "rw" mode, is controlled
+				with CONFIG_XMON_DEFAULT_RO_MODE.
+			rw	xmon debugger hooks will be installed so xmon
+				is called only on a kernel crash, mode is write,
+				meaning SPR registers, memory and, other data
+				can be written using xmon commands.
+			ro 	same as "rw" option above but SPR registers,
+				memory, and other data can't be written using
+				xmon commands.
+			off	xmon is disabled.
-- 
2.17.1

