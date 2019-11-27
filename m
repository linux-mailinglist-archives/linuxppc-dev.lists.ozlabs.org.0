Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A310AF87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 13:26:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NKkh0rTtzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 23:26:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NKBN1LwFzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 23:01:47 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARBqHb3052908; Wed, 27 Nov 2019 07:01:41 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whmsy9j0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 07:01:40 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xARC079Y018086;
 Wed, 27 Nov 2019 12:01:40 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2wevd6wee7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 12:01:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xARC1cla52953450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 12:01:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38130BE058;
 Wed, 27 Nov 2019 12:01:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E82E5BE051;
 Wed, 27 Nov 2019 12:01:37 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.209])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 12:01:37 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 94E682E3020; Wed, 27 Nov 2019 17:31:35 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH 3/3] Documentation: Document sysfs interfaces purr, spurr,
 idle_purr, idle_spurr
Date: Wed, 27 Nov 2019 17:31:12 +0530
Message-Id: <1574856072-30972-4-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1011 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270104
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
index fc20cde..ecd23fb 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -574,3 +574,42 @@ Description:	Secure Virtual Machine
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
+Date:		Nov 2019
+Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
+Description:	PURR ticks for cpuX when it was idle.
+
+		This sysfs interface exposes the number of PURR ticks
+		for cpuX when it was idle.
+
+What: 		/sys/devices/system/cpu/cpuX/spurr
+Date:		Nov 2019
+Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
+Description:	SPURR ticks for cpuX when it was idle.
+
+		This sysfs interface exposes the number of SPURR ticks
+		for cpuX when it was idle.
-- 
1.9.4

