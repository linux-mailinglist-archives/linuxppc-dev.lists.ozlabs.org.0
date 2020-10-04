Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2728294D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 09:06:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3vsM3z6fzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 18:06:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3vqf3hRczDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Oct 2020 18:04:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cj7zrEnQ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C3vqf2MQZz8tF4
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Oct 2020 18:04:46 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C3vqf1zq1z9sSG; Sun,  4 Oct 2020 18:04:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cj7zrEnQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C3vqd3QyBz9s1t
 for <linuxppc-dev@ozlabs.org>; Sun,  4 Oct 2020 18:04:44 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09472EtK188719
 for <linuxppc-dev@ozlabs.org>; Sun, 4 Oct 2020 03:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=93KvJ1TXhZI5nXGeAmlwXAtgoYSrjKEtGG2ZSkEbpgA=;
 b=cj7zrEnQREpbbK48s7YXeF+jWG1Zxp0RNeLwIwEs3N7yFIuRu30pz4U1BGZUKhedAaWK
 c+bIfxPCL1Wz1fC4CarE4oNcRMGOIE2gy5rjIwcO8+3jeqMguwXU67ExGxX6puPpD814
 OvvoMRFVsUXo7OBxLjCwS5otMANeIGeOM3L/GivV1ok6zxdZL/CbN9GafNsk+lgraNHi
 X1ov8cEKFnAUJ21C/AmJZQiSOv8XEvN8MpLuRizXlyc3qIrZeQO4y40v08AqOEYL9BWP
 Rg/iJbIofpnX4xyM5ycexrg1s63TjDKyjpDLyggj+vNgk+IAymizcpWisscVK8c2hJye 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33y9cn0aa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 04 Oct 2020 03:04:39 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09474dVv195157
 for <linuxppc-dev@ozlabs.org>; Sun, 4 Oct 2020 03:04:39 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33y9cn0a9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Oct 2020 03:04:39 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09472h2O024503;
 Sun, 4 Oct 2020 07:04:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 33xgx80g5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Oct 2020 07:04:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09474Z1J31064508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 4 Oct 2020 07:04:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 129E511C04C;
 Sun,  4 Oct 2020 07:04:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51ED511C054;
 Sun,  4 Oct 2020 07:04:34 +0000 (GMT)
Received: from [192.168.0.63] (unknown [9.199.50.146])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  4 Oct 2020 07:04:34 +0000 (GMT)
Subject: [PATCH] powernv/elog: Fix the race while processing OPAL error log
 event.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Sun, 04 Oct 2020 12:34:33 +0530
Message-ID: <160179507293.1506029.17623234894857363439.stgit@jupiter>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-04_02:2020-10-02,
 2020-10-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=2 clxscore=1011 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010040052
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Every error log reported by OPAL is exported to userspace through a sysfs
interface and notified using kobject_uevent(). The userspace daemon
(opal_errd) then reads the error log and acknowledges it error log is saved
safely to disk. Once acknowledged the kernel removes the respective sysfs
file entry causing respective resources getting released including kobject.

However there are chances where user daemon may already be scanning elog
entries while new sysfs elog entry is being created by kernel. User daemon
may read this new entry and ack it even before kernel can notify userspace
about it through kobject_uevent() call. If that happens then we have a
potential race between elog_ack_store->kobject_put() and kobject_uevent
which can lead to use-after-free issue of a kernfs object resulting into a
kernel crash. This patch fixes this race by protecting a sysfs file
creation/notification using mutex lock per elog record.

Reported-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-elog.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 62ef7ad995da..4bba8f968ced 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -24,6 +24,7 @@ struct elog_obj {
 	uint64_t type;
 	size_t size;
 	char *buffer;
+	struct mutex elog_mutex;
 };
 #define to_elog_obj(x) container_of(x, struct elog_obj, kobj)
 
@@ -73,7 +74,11 @@ static ssize_t elog_ack_store(struct elog_obj *elog_obj,
 			      size_t count)
 {
 	opal_send_ack_elog(elog_obj->id);
+
+	/* Wait until kobject_uevent() is called */
+	mutex_lock(&elog_obj->elog_mutex);
 	sysfs_remove_file_self(&elog_obj->kobj, &attr->attr);
+	mutex_unlock(&elog_obj->elog_mutex);
 	kobject_put(&elog_obj->kobj);
 	return count;
 }
@@ -193,6 +198,7 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	kobject_init(&elog->kobj, &elog_ktype);
 
 	sysfs_bin_attr_init(&elog->raw_attr);
+	mutex_init(&elog->elog_mutex);
 
 	elog->raw_attr.attr.name = "raw";
 	elog->raw_attr.attr.mode = 0400;
@@ -222,13 +228,24 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
 		return NULL;
 	}
 
+	/*
+	 * As soon as sysfs file for this elog is created/activated there is
+	 * chance opal_errd daemon might read and acknowledge this elog before
+	 * kobject_uevent() is called. If that happens then we have a potential
+	 * race between elog_ack_store->kobject_put() and kobject_uevent which
+	 * leads to use-after-free issue of a kernfs object resulting into
+	 * kernel crash. Take a mutex lock to avoid this race.
+	 */
+	mutex_lock(&elog->elog_mutex);
 	rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
 	if (rc) {
 		kobject_put(&elog->kobj);
+		mutex_unlock(&elog->elog_mutex);
 		return NULL;
 	}
 
 	kobject_uevent(&elog->kobj, KOBJ_ADD);
+	mutex_unlock(&elog->elog_mutex);
 
 	return elog;
 }


