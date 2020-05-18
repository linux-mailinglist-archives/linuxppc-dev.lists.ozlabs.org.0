Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 790181D785E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 14:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QdPt6lCpzDqHG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 22:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qd5p3gfyzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 22:06:22 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IBWwRf175339; Mon, 18 May 2020 08:06:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312wsgu0y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 08:06:05 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IBWxnl175362;
 Mon, 18 May 2020 08:05:55 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312wsgu0m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 08:05:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IC5P57023635;
 Mon, 18 May 2020 12:05:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3127t5m3cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 12:05:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04IC5ZmN63373558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 12:05:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABA9E4C050;
 Mon, 18 May 2020 12:05:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C647C4C040;
 Mon, 18 May 2020 12:05:31 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.37.39])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 May 2020 12:05:31 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, suka@us.ibm.com,
 nathanl@linux.ibm.com
Subject: [PATCH v9 4/5] Documentation/ABI: Add ABI documentation for chips and
 sockets
Date: Mon, 18 May 2020 17:34:51 +0530
Message-Id: <20200518120452.15082-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200518120452.15082-1-kjain@linux.ibm.com>
References: <20200518120452.15082-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_05:2020-05-15,
 2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 cotscore=-2147483648 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005180105
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, mpetlan@redhat.com,
 peterz@infradead.org, gregkh@linuxfoundation.org,
 alexander.shishkin@linux.intel.com, kjain@linux.ibm.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com, namhyung@kernel.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add documentation for the following sysfs files:
/sys/devices/hv_24x7/interface/chipspersocket,
/sys/devices/hv_24x7/interface/sockets,
/sys/devices/hv_24x7/interface/coresperchip

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_24x7    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
index ec27c6c9e737..e8698afcd952 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
@@ -22,6 +22,27 @@ Description:
 		Exposes the "version" field of the 24x7 catalog. This is also
 		extractable from the provided binary "catalog" sysfs entry.
 
+What:		/sys/devices/hv_24x7/interface/sockets
+Date:		May 2020
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	read only
+		This sysfs interface exposes the number of sockets present in the
+		system.
+
+What:		/sys/devices/hv_24x7/interface/chipspersocket
+Date:		May 2020
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	read only
+		This sysfs interface exposes the number of chips per socket
+		present in the system.
+
+What:		/sys/devices/hv_24x7/interface/coresperchip
+Date:		May 2020
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	read only
+		This sysfs interface exposes the number of cores per chip
+		present in the system.
+
 What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
 Date:		February 2014
 Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
-- 
2.18.2

