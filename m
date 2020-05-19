Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 454251DA0C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 21:14:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RQYJ2yj7zDqwm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 05:14:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RQGp07RMzDqCR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 05:01:53 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JIXUXq142820; Tue, 19 May 2020 15:01:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312bg7kgcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:01:17 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04JIXVk5142941;
 Tue, 19 May 2020 15:01:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312bg7kgbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:01:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JJ0aoT004655;
 Tue, 19 May 2020 19:01:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 313xehj6bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 19:01:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04JJ1AxA65012106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 19:01:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8232A11C050;
 Tue, 19 May 2020 19:01:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37E3C11C04A;
 Tue, 19 May 2020 19:01:07 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.89.230])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 19 May 2020 19:01:07 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Wed, 20 May 2020 00:31:06 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v7 1/5] powerpc: Document details on H_SCM_HEALTH hcall
Date: Wed, 20 May 2020 00:30:54 +0530
Message-Id: <20200519190058.257981-2-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519190058.257981-1-vaibhav@linux.ibm.com>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_07:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 cotscore=-2147483648 malwarescore=0
 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190157
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add documentation to 'papr_hcalls.rst' describing the bitmap flags
that are returned from H_SCM_HEALTH hcall as per the PAPR-SCM
specification.

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

Resend:
* None

v6..v7:
* None

v5..v6
* New patch in the series
---
 Documentation/powerpc/papr_hcalls.rst | 43 ++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
index 3493631a60f8..9a5ba5eaf323 100644
--- a/Documentation/powerpc/papr_hcalls.rst
+++ b/Documentation/powerpc/papr_hcalls.rst
@@ -220,13 +220,48 @@ from the LPAR memory.
 **H_SCM_HEALTH**
 
 | Input: drcIndex
-| Out: *health-bitmap, health-bit-valid-bitmap*
+| Out: *health-bitmap (r4), health-bit-valid-bitmap (r5)*
 | Return Value: *H_Success, H_Parameter, H_Hardware*
 
 Given a DRC Index return the info on predictive failure and overall health of
-the NVDIMM. The asserted bits in the health-bitmap indicate a single predictive
-failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
-valid.
+the NVDIMM. The asserted bits in the health-bitmap indicate one or more states
+(described in table below) of the NVDIMM and health-bit-valid-bitmap indicate
+which bits in health-bitmap are valid.
+
+Health Bitmap Flags:
+
++------+-----------------------------------------------------------------------+
+|  Bit |               Definition                                              |
++======+=======================================================================+
+|  00  | SCM device is unable to persist memory contents.                      |
+|      | If the system is powered down, nothing will be saved.                 |
++------+-----------------------------------------------------------------------+
+|  01  | SCM device failed to persist memory contents. Either contents were not|
+|      | saved successfully on power down or were not restored properly on     |
+|      | power up.                                                             |
++------+-----------------------------------------------------------------------+
+|  02  | SCM device contents are persisted from previous IPL. The data from    |
+|      | the last boot were successfully restored.                             |
++------+-----------------------------------------------------------------------+
+|  03  | SCM device contents are not persisted from previous IPL. There was no |
+|      | data to restore from the last boot.                                   |
++------+-----------------------------------------------------------------------+
+|  04  | SCM device memory life remaining is critically low                    |
++------+-----------------------------------------------------------------------+
+|  05  | SCM device will be garded off next IPL due to failure                 |
++------+-----------------------------------------------------------------------+
+|  06  | SCM contents cannot persist due to current platform health status. A  |
+|      | hardware failure may prevent data from being saved or restored.       |
++------+-----------------------------------------------------------------------+
+|  07  | SCM device is unable to persist memory contents in certain conditions |
++------+-----------------------------------------------------------------------+
+|  08  | SCM device is encrypted                                               |
++------+-----------------------------------------------------------------------+
+|  09  | SCM device has successfully completed a requested erase or secure     |
+|      | erase procedure.                                                      |
++------+-----------------------------------------------------------------------+
+|10:63 | Reserved / Unused                                                     |
++------+-----------------------------------------------------------------------+
 
 **H_SCM_PERFORMANCE_STATS**
 
-- 
2.26.2

