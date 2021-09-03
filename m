Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAF3FF9F1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 07:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H15Yj74hZz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 15:14:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FmABiGU2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FmABiGU2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H15VW1gdzz2yQ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 15:11:15 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 183552hW133147; Fri, 3 Sep 2021 01:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eoTJEvz+JydVpcyo3wyKqaG3a7A5ENI2Xhcr/Kl0uXY=;
 b=FmABiGU2i+IssTmvrf3vZScjoGkHZGsnJ5iCQSHE1m7Su7m25zS7HeyPsC0/inJ5VvlI
 8C6AZTzhU0Gpi3rKPS8RvikEI62d0ZiwBpSvvg7sZt+UMeevNTtiFgkMP1AOWQMZ26I1
 jCp6jo/SXLWb5LPmQrhPmm1FzsD1+IjaXZHuRuM5m+bWwRcIqyLKDnzPxkisXtZzbdI5
 jH2wd7+9d9aEQ6RNu1TQdeIzBu9NXrWDntcrBsnRjGqHVG5MBZ6D+fRJ6/jwnNMHD8K8
 ECR3B8wJ28mBb4ziycv90u1qqFvW3TYz+JiOZjKB+H7rxiqF4MaaZ1LWbEpHqAy2DL2A 7A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3au9nd46gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 01:11:02 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18358EHh023744;
 Fri, 3 Sep 2021 05:11:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3au6q7anjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 05:11:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1835AvZa55575018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Sep 2021 05:10:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 892DC4204C;
 Fri,  3 Sep 2021 05:10:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5342742041;
 Fri,  3 Sep 2021 05:10:53 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.43.127.78])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Sep 2021 05:10:53 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [RESEND PATCH v4 4/4] powerpc/papr_scm: Document papr_scm sysfs event
 format entries
Date: Fri,  3 Sep 2021 10:39:14 +0530
Message-Id: <20210903050914.273525-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903050914.273525-1-kjain@linux.ibm.com>
References: <20210903050914.273525-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n9BbT-cotmfn1okyO5TSLQB4iyDtA2TR
X-Proofpoint-ORIG-GUID: n9BbT-cotmfn1okyO5TSLQB4iyDtA2TR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_01:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109030031
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Details is added for the event, cpumask and format attributes
in the ABI documentation.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-bus-papr-pmem | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
index 95254cec92bf..4d86252448f8 100644
--- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
+++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
@@ -61,3 +61,34 @@ Description:
 		* "CchRHCnt" : Cache Read Hit Count
 		* "CchWHCnt" : Cache Write Hit Count
 		* "FastWCnt" : Fast Write Count
+
+What:		/sys/devices/nmemX/format
+Date:		June 2021
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
+Description:	(RO) Attribute group to describe the magic bits
+                that go into perf_event_attr.config for a particular pmu.
+                (See ABI/testing/sysfs-bus-event_source-devices-format).
+
+                Each attribute under this group defines a bit range of the
+                perf_event_attr.config. Supported attribute is listed
+                below::
+
+		    event  = "config:0-4"  - event ID
+
+		For example::
+		    noopstat = "event=0x1"
+
+What:		/sys/devices/nmemX/events
+Date:		June 2021
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
+Description:    (RO) Attribute group to describe performance monitoring
+                events specific to papr-scm. Each attribute in this group describes
+                a single performance monitoring event supported by this nvdimm pmu.
+                The name of the file is the name of the event.
+                (See ABI/testing/sysfs-bus-event_source-devices-events).
+
+What:		/sys/devices/nmemX/cpumask
+Date:		June 2021
+Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
+Description:	(RO) This sysfs file exposes the cpumask which is designated to make
+                HCALLs to retrieve nvdimm pmu event counter data.
-- 
2.26.2

