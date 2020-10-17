Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B00BC29133E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 18:45:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CD8623rddzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 03:45:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CD82m4jXjzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 03:42:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m0j/v78m; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CD82m0Drjz8tWl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 03:42:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CD82l5BYPz9sTm; Sun, 18 Oct 2020 03:42:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m0j/v78m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CD82l10YSz9sTc;
 Sun, 18 Oct 2020 03:42:54 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09HGWrnE014304; Sat, 17 Oct 2020 12:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KoJEHBiuTjcOoLn1o4nXTi1I5ovDFdMPF2d0CTC/yyI=;
 b=m0j/v78mTtAL/YVSKsurkfbjvjPnVSBadP5J+L8MMO5+zI59sfdCVjYtv31h8QLtHSWa
 2u/g023Qi7kXouP78HlOr5mUtsw8XXNN315ugQnw/V+rUpvKHC/rNZf+IS5fTqYwMWH9
 6KxbGtNKtAQk9iU1OizdHs+XJznFLJElaMlO9ybhmaG6D154olswODVOdksuwOEnM6bY
 SRVEHyIkjtcEkS3FYs3Ylm7/kAv6/70IisCE/QCeUVOxrExRf16DLZmXGLOHNaKNrESz
 YHaphCeqqJ6YqtACA79cxjXxkpZr/uzHqql3d7CU928Jd9uB7ZPU9ks/5W2wlxiqJUJ0 pQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3483sfgp9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 12:42:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09HGbVu8014647;
 Sat, 17 Oct 2020 16:42:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 347qvh8gft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 16:42:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09HGgkN530540182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Oct 2020 16:42:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A047A4051;
 Sat, 17 Oct 2020 16:42:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FA26A4040;
 Sat, 17 Oct 2020 16:42:45 +0000 (GMT)
Received: from hegdevasant.in.ibm.com (unknown [9.199.43.235])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 17 Oct 2020 16:42:44 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/powernv/dump: Handle multiple writes to ack attribute
Date: Sat, 17 Oct 2020 22:12:36 +0530
Message-Id: <20201017164236.264713-1-hegdevasant@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-17_14:2020-10-16,
 2020-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=755
 lowpriorityscore=0 impostorscore=0 suspectscore=1 priorityscore=1501
 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010170115
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
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

Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-dump.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 0e6693bacb7e..00c5a59d82d9 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -88,9 +88,14 @@ static ssize_t dump_ack_store(struct dump_obj *dump_obj,
 			      const char *buf,
 			      size_t count)
 {
-	dump_send_ack(dump_obj->id);
-	sysfs_remove_file_self(&dump_obj->kobj, &attr->attr);
-	kobject_put(&dump_obj->kobj);
+	/*
+	 * Try to self remove this attribute. If we are successful,
+	 * delete the kobject itself.
+	 */
+	if (sysfs_remove_file_self(&dump_obj->kobj, &attr->attr)) {
+		dump_send_ack(dump_obj->id);
+		kobject_put(&dump_obj->kobj);
+	}
 	return count;
 }
 
-- 
2.26.2

