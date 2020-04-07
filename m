Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8971A09A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:58:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xLtH4Y5wzDqTV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 18:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xLf56q2nzDqcP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 18:48:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0378Ydvw028371; Tue, 7 Apr 2020 04:48:09 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082pe73we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 04:48:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0378jK2H017907;
 Tue, 7 Apr 2020 08:48:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 306hv64bm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 08:48:08 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0378m79L37880126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 08:48:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A4AF2805C;
 Tue,  7 Apr 2020 08:48:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B000C28058;
 Tue,  7 Apr 2020 08:48:06 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.178.96])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 08:48:06 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id CD1652E33BA; Tue,  7 Apr 2020 14:17:59 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v5 5/5] Documentation: Document sysfs interfaces purr, spurr,
 idle_purr, idle_spurr
Date: Tue,  7 Apr 2020 14:17:43 +0530
Message-Id: <1586249263-14048-6-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070068
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

Add documentation for the following sysfs interfaces:
/sys/devices/system/cpu/cpuX/purr
/sys/devices/system/cpu/cpuX/spurr
/sys/devices/system/cpu/cpuX/idle_purr
/sys/devices/system/cpu/cpuX/idle_spurr

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 Documentation/ABI/testing/sysfs-devices-system-cpu | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 2e0e3b4..b73b8b5 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -580,3 +580,42 @@ Description:	Secure Virtual Machine
 		If 1, it means the system is using the Protected Execution
 		Facility in POWER9 and newer processors. i.e., it is a Secure
 		Virtual Machine.
+
+What: 		/sys/devices/system/cpu/cpuX/purr
+Date:		Apr 2005
+Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
+Description:	PURR ticks for this CPU since the system boot.
+
+		The Processor Utilization Resources Register (PURR) is
+		a 64-bit counter which provides an estimate of the
+		resources used by the CPU thread. The contents of this
+		register increases monotonically. This sysfs interface
+		exposes the number of PURR ticks for cpuX.
+
+What: 		/sys/devices/system/cpu/cpuX/spurr
+Date:		Dec 2006
+Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
+Description:	SPURR ticks for this CPU since the system boot.
+
+		The Scaled Processor Utilization Resources Register
+		(SPURR) is a 64-bit counter that provides a frequency
+		invariant estimate of the resources used by the CPU
+		thread. The contents of this register increases
+		monotonically. This sysfs interface exposes the number
+		of SPURR ticks for cpuX.
+
+What: 		/sys/devices/system/cpu/cpuX/idle_purr
+Date:		Apr 2020
+Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
+Description:	PURR ticks for cpuX when it was idle.
+
+		This sysfs interface exposes the number of PURR ticks
+		for cpuX when it was idle.
+
+What: 		/sys/devices/system/cpu/cpuX/idle_spurr
+Date:		Apr 2020
+Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
+Description:	SPURR ticks for cpuX when it was idle.
+
+		This sysfs interface exposes the number of SPURR ticks
+		for cpuX when it was idle.
-- 
1.9.4

