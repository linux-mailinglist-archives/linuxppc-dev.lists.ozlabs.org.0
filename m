Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE87282F40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 06:14:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4S0D3XVmzDqGP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 15:14:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4Ryj566hzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 15:12:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KOBGOqiu; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C4Ryj3g6nz8tGy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 15:12:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C4Ryj3971z9sSs; Mon,  5 Oct 2020 15:12:45 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KOBGOqiu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C4Ryh6H6rz9sSn
 for <linuxppc-dev@ozlabs.org>; Mon,  5 Oct 2020 15:12:44 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09542A59006072
 for <linuxppc-dev@ozlabs.org>; Mon, 5 Oct 2020 00:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=0EcimQihIIl+9J5KBu6TnIqMHhSl2m5TVfaT1fRK3yA=;
 b=KOBGOqiu1s3uS2fHCtejZrYfkNH3BLInX+oCcRKM0bA/2XQHn9lO1dNiCKPorGTxZTeh
 lglxhNUVILGMQYBIFwHl2QzHWVEn+l6KUS8NYVVqB3svz/u9Sgxw16i3yolC5KyzawvN
 3Tw9GmziHUHg+mm6UHjCTzelAHGiJZ0u5P3P13HfCzwqKp6En0rYwtb6Ioea0eSH9QI7
 yI+GzbiXfpHj44mxxRo5PfjYvuYxhgot2b+lrrjnC4mHhhVu/jhk/hTuFmUyq9Sr3pwQ
 IxibkcpvbvUo0fQYVpsGLh5VJLkb8qfPx0HLaMZgYYf/I/Y4dgisIrGmUzpR3wccgyVM DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33yv1d89r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 05 Oct 2020 00:12:42 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09542xmA008706
 for <linuxppc-dev@ozlabs.org>; Mon, 5 Oct 2020 00:12:41 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33yv1d89qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 00:12:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0954Ce7j026880;
 Mon, 5 Oct 2020 04:12:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 33xgjh1rqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 04:12:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0954Cb4Q30998876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Oct 2020 04:12:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5864F5204F;
 Mon,  5 Oct 2020 04:12:37 +0000 (GMT)
Received: from [192.168.0.63] (unknown [9.85.81.3])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9BE9D52050;
 Mon,  5 Oct 2020 04:12:36 +0000 (GMT)
Subject: [PATCH v2] powernv/elog: Fix the race while processing OPAL error log
 event.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 05 Oct 2020 09:42:35 +0530
Message-ID: <160187115555.1589942.2124270585910076829.stgit@jupiter>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_03:2020-10-02,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=2 mlxscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050029
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
creation/notification by holding an additional reference count on kobject
until we safely send kobject_uevent().

Reported-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
Change in v2:
- Instead of mutex and use extra reference count on kobject to avoid the
  race.
---
 arch/powerpc/platforms/powernv/opal-elog.c |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 62ef7ad995da..230f102e87c0 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -222,13 +222,28 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
 		return NULL;
 	}
 
+	/*
+	 * As soon as sysfs file for this elog is created/activated there is
+	 * chance opal_errd daemon might read and acknowledge this elog before
+	 * kobject_uevent() is called. If that happens then we have a potential
+	 * race between elog_ack_store->kobject_put() and kobject_uevent which
+	 * leads to use-after-free issue of a kernfs object resulting into
+	 * kernel crash. To avoid this race take an additional reference count
+	 * on kobject until we safely send kobject_uevent().
+	 */
+
+	kobject_get(&elog->kobj);  /* extra reference count */
 	rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
 	if (rc) {
+		kobject_put(&elog->kobj);
+		/* Drop the extra reference count  */
 		kobject_put(&elog->kobj);
 		return NULL;
 	}
 
 	kobject_uevent(&elog->kobj, KOBJ_ADD);
+	/* Drop the extra reference count  */
+	kobject_put(&elog->kobj);
 
 	return elog;
 }


