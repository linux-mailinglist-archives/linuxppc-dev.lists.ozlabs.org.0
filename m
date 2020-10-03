Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68628222E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 09:53:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3JyK3y71zDqWW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 17:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L1k7JBtK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3JtY5jbszDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Oct 2020 17:50:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0937XGpw065638; Sat, 3 Oct 2020 03:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kVXBChdGvbOnDMJDAWcNE+RFmBGxGfFUEsPc0Ss0VRY=;
 b=L1k7JBtKshw6U1XiblNwhBEN5YdWDu5Vaq8WHDYDgzbG3RNdZpGjfAO8JmJn3Qxjv8UP
 BrmJM3hM2bDq9fYRMdYz0Uw65n6Ljb2PyCOsVWL+5OYiRJHWMqIvESaZDtmWS4GOvMaI
 SzNUi6V8mNk7Sq3anvDv7BtpW/hARFaW4ldDK86tJXOpf1ks4cEs1uYn4RbbCkOQ1p4L
 wSz7OaeQ6j6JgnpGHpuk+RB9Gm4P1E1+9nDtRxStJm2UjwrOb7DGiW/f2Bv8ljysDj3W
 TNcD2zawyIAMxyKoX+4kfj4upCD2YJOBEprp0kPg+tXYDpAwyQCDwZaK9RlUAs99iZ0+ vQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33xk7w26nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 03:50:08 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0937Wnge011259;
 Sat, 3 Oct 2020 07:50:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 33xgjh83f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 07:50:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0937o3n830998934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 3 Oct 2020 07:50:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5692B4C050;
 Sat,  3 Oct 2020 07:50:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89C324C040;
 Sat,  3 Oct 2020 07:50:01 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.50.127])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  3 Oct 2020 07:50:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] Documentation/ABI: Add ABI documentation for hv-24x7
 format
Date: Sat,  3 Oct 2020 13:19:40 +0530
Message-Id: <20201003074943.338618-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201003074943.338618-1-kjain@linux.ibm.com>
References: <20201003074943.338618-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-03_03:2020-10-02,
 2020-10-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010030063
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds ABI documentation for hv-24x7 format.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_24x7    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
index e82fc37be802..6bec9a13a493 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
@@ -1,3 +1,28 @@
+What:           /sys/bus/event_source/devices/hv_24x7/format
+Date:           September 2020
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:    Read-only. Attribute group to describe the magic bits
+                that go into perf_event_attr.config for a particular pmu.
+                (See ABI/testing/sysfs-bus-event_source-devices-format).
+
+                Each attribute under this group defines a bit range of the
+                perf_event_attr.config. All supported attributes are listed
+                below.
+
+				chip = "config:16-31"
+				core  = "config:16-31"
+				domain = "config:0-3"
+				lpar = "config:0-15"
+				offset = "config:32-63"
+				vcpu = "config:16-31"
+
+               For example,
+
+		PM_PB_CYC =  "domain=1,offset=0x80,chip=?,lpar=0x0"
+
+		In this event, '?' after chip specifies that
+		this value will be provided by user while running this event.
+
 What:		/sys/bus/event_source/devices/hv_24x7/interface/catalog
 Date:		February 2014
 Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
-- 
2.26.2

