Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3B28DA0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 08:49:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB31w2SybzDqZV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 17:49:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kmhXH/k0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB30J4Q9czDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 17:48:32 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E6XBvG104275; Wed, 14 Oct 2020 02:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=09xdRXwQeYc6EBUXVJFyK9pxHBS/lt7tZ3GjFGZqXuM=;
 b=kmhXH/k0+V8U35Bqk61vhoKaHkPY5Np9WVH4+1huMaliEMgA29YTBNLNt5s6qlkt9Uln
 +VH+VwwQVGbat2Ny7L1iTN9P/vPaNpniajgYn2uWZ8QCOh8mP0pHCGlYhkf0oy2dAme4
 Vn0gCFStludfWGI4FNnCaHmRQ6GD9nKKs14uqm64yV6osFfgfm+fh7+CYWjymgTz/4FS
 A+2lrFBKuaULCCzy9Qx3WJtwDTH6XSQ30OrvjNmtHlB34JGtEjP+TRWJc2sw9ZySsk4b
 WsvoC963Af52J2daIG6OR1yiPlzUVEJR0xK1FAawrE/x6vPrAlSIQFGPXxBUyViJ4ueh 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345uymgkn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 02:48:25 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09E6XHpr104487;
 Wed, 14 Oct 2020 02:48:25 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345uymgkmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 02:48:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E6lqBb002501;
 Wed, 14 Oct 2020 06:48:24 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3434k9ph7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 06:48:24 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09E6mNF352232476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 06:48:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A660D112066;
 Wed, 14 Oct 2020 06:48:23 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F9E6112061;
 Wed, 14 Oct 2020 06:48:21 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.69.185])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 14 Oct 2020 06:48:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/opal_elog: Handle multiple writes to ack attribute
Date: Wed, 14 Oct 2020 12:18:13 +0530
Message-Id: <20201014064813.109515-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_03:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=954 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140045
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
 Oliver O'Halloran <oohall@gmail.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Even though we use self removing sysfs helper, we still need
to make sure we do the final kobject delete conditionally.
sysfs_remove_file_self() will handle parallel calls to remove
the sysfs attribute file and returns true only in the caller
that removed the attribute file. The other parallel callers
are returned false. Do the final kobject delete checking
the return value of sysfs_remove_file_self().

Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-elog.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 5e33b1fc67c2..37b380eef41a 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -72,9 +72,14 @@ static ssize_t elog_ack_store(struct elog_obj *elog_obj,
 			      const char *buf,
 			      size_t count)
 {
-	opal_send_ack_elog(elog_obj->id);
-	sysfs_remove_file_self(&elog_obj->kobj, &attr->attr);
-	kobject_put(&elog_obj->kobj);
+	/*
+	 * Try to self remove this attribute. If we are successful,
+	 * delete the kobject itself.
+	 */
+	if (sysfs_remove_file_self(&elog_obj->kobj, &attr->attr)) {
+		opal_send_ack_elog(elog_obj->id);
+		kobject_put(&elog_obj->kobj);
+	}
 	return count;
 }
 
-- 
2.26.2

