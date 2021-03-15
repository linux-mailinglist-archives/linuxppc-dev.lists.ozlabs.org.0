Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFE33C8BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:48:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzqmz6TcNz309f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:48:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VfPcA0Ij;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VfPcA0Ij; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzqmX6Xw4z2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 08:48:28 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FLYFqS030697; Mon, 15 Mar 2021 17:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=iAyKZDpJ5s3o/1yy81QDoXVoZTWX12vRGKv8qlZCbhI=;
 b=VfPcA0Ij9huaFCRSO13F8u/XRh/HmuL0GAwWUxLuxelN3j3TdlSeyQ39inFpoaOk2ETA
 cXIiB+s/0mhOTCmRO/x9gadLaf4knbaL6oPYdFZmk/uXUV6AgVVstCckNT2rrxgjfy/3
 /XJviNi85Oi+jwvcch+MPZqyz1bbW61z7OzS8Zu8bihDPxdWVYGZqDTqxke1SlROR83s
 QfrIgJIsaohBlPUGQ1bj+g8R08jNDGZJ1MUNyVGXVVDoDUFVNY0wkmAaGwmiSc4AXCfB
 rksEG58J3o5DfA1Sro0yxgRzfPkDINeiOraS9ucxxnzwldEQN/3REcojPANGltmuBfuy BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ada7bp45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 17:48:25 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FLjc8D081920;
 Mon, 15 Mar 2021 17:48:25 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ada7bp42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 17:48:24 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FLWhrS006762;
 Mon, 15 Mar 2021 21:48:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 378ubt8mf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 21:48:24 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FLmNqK22479256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 21:48:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A20936E04E;
 Mon, 15 Mar 2021 21:48:23 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 663DC6E04C;
 Mon, 15 Mar 2021 21:48:23 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 21:48:23 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: bhelgaas@google.com
Subject: [PATCH v2] rpadlpar: fix potential drc_name corruption in store
 functions
Date: Mon, 15 Mar 2021 15:48:21 -0600
Message-Id: <20210315214821.452959-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_12:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150145
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both add_slot_store() and remove_slot_store() try to fix up the drc_name
copied from the store buffer by placing a NULL terminator at nbyte + 1
or in place of a '\n' if present. However, the static buffer that we
copy the drc_name data into is not zeored and can contain anything past
the n-th byte. This is problematic if a '\n' byte appears in that buffer
after nbytes and the string copied into the store buffer was not NULL
terminated to start with as the strchr() search for a '\n' byte will mark
this incorrectly as the end of the drc_name string resulting in a drc_name
string that contains garbage data after the n-th byte. The following
debugging shows an example of the drmgr utility writing "PHB 4543" to
the add_slot sysfs attribute, but add_slot_store logging a corrupted
string value.

[135823.702864] drmgr: drmgr: -c phb -a -s PHB 4543 -d 1
[135823.702879] add_slot_store: drc_name = PHB 4543°|<82>!, rc = -19

Fix this by using strscpy() instead of memcpy() to ensure the string is
NULL terminated when copied into the static drc_name buffer. Further,
since the string is now NULL terminated the code only needs to change
'\n' to '\0' when present.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---

Changes in v2:
* use strscpy instead of memcpy (suggested by mpe)

 drivers/pci/hotplug/rpadlpar_sysfs.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/hotplug/rpadlpar_sysfs.c b/drivers/pci/hotplug/rpadlpar_sysfs.c
index cdbfa5df3a51..dbfa0b55d31a 100644
--- a/drivers/pci/hotplug/rpadlpar_sysfs.c
+++ b/drivers/pci/hotplug/rpadlpar_sysfs.c
@@ -34,12 +34,11 @@ static ssize_t add_slot_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (nbytes >= MAX_DRC_NAME_LEN)
 		return 0;
 
-	memcpy(drc_name, buf, nbytes);
+	strscpy(drc_name, buf, nbytes + 1);
 
 	end = strchr(drc_name, '\n');
-	if (!end)
-		end = &drc_name[nbytes];
-	*end = '\0';
+	if (end)
+		*end = '\0';
 
 	rc = dlpar_add_slot(drc_name);
 	if (rc)
@@ -65,12 +64,11 @@ static ssize_t remove_slot_store(struct kobject *kobj,
 	if (nbytes >= MAX_DRC_NAME_LEN)
 		return 0;
 
-	memcpy(drc_name, buf, nbytes);
+	strscpy(drc_name, buf, nbytes + 1);
 
 	end = strchr(drc_name, '\n');
-	if (!end)
-		end = &drc_name[nbytes];
-	*end = '\0';
+	if (end)
+		*end = '\0';
 
 	rc = dlpar_remove_slot(drc_name);
 	if (rc)
-- 
2.27.0

