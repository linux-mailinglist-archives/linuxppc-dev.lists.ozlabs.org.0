Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECAA754E38
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 12:06:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s/nCZJyq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3gpX0x5xz3c2Z
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 20:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s/nCZJyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3gnb5XSkz30fF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jul 2023 20:05:23 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36G9kaqs015139;
	Sun, 16 Jul 2023 10:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YOv08gZ3Gl/29VU7Mm5/WhFKSB1jBdQwzywQT/bu5EY=;
 b=s/nCZJyqOwEc9iAyzo2Gh6PrFJwta4QWEROU2umBiBkBoK2RyLoYc0uMo++nmd1Y81Dz
 tZMiwlTMULURm0h0i0X60nq/nw0G/Og2S0DjJB/NuV5ND9kimpb0LURxK6G9etq8gGUJ
 9pyd7cGAOkHeedPGSsgikM9FJ6ZtiT+4xfeFy0vmOE3Qa39F/GWXcaq9Jt8x2/BwtCz0
 oUZRlHiZYnlIpvXmCBvY8JCVniuFYa+tvwh04wV2aNLtMKymTmoIRIRpt96mep3+0owk
 lzuGaIytYjcI3FgzC7h3y5Tg2CTbwFMA4RZt/ZmFYXPIsgkay33wFw9L5typNEhWw/Pl EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rve7dg89x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jul 2023 10:05:15 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36GA0Sl4010420;
	Sun, 16 Jul 2023 10:05:14 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rve7dg898-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jul 2023 10:05:14 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36G9vFVT002885;
	Sun, 16 Jul 2023 10:05:14 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3ruk358yyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jul 2023 10:05:14 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36GA5CnC22085988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 16 Jul 2023 10:05:12 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E88E75805A;
	Sun, 16 Jul 2023 10:05:11 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4345658054;
	Sun, 16 Jul 2023 10:05:10 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.80.155])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 16 Jul 2023 10:05:10 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries/vas: Hold mmap_mutex after mmap lock during window close
Date: Sun, 16 Jul 2023 03:05:06 -0700
Message-Id: <20230716100506.7833-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DyT7s9dJZYW9oo00I-rjO9IovZnHrUGo
X-Proofpoint-GUID: tdqAjiaiWiK0bgOwUeFWT2FjBDVzUxOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-15_14,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307160093
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 8ef7b9e1765a ("powerpc/pseries/vas: Close windows with DLPAR
core removal") unmaps the window paste address and issues HCALL to
close window in the hypervisor for migration or DLPAR core removal
events. So holds mmap_mutex and then mmap lock before unmap the
paste address. But if the user space issue mmap paste address at
the same time with the migration event, coproc_mmap() is called
after holding the mmap lock which can trigger deadlock when trying
to acquire mmap_mutex in coproc_mmap().

t1: mmap() call to mmap              t2: Migration event
    window paste address

do_mmap2()                           migration_store()
 ksys_mmap_pgoff()                    pseries_migrate_partition()
  vm_mmap_pgoff()                      vas_migration_handler()
    Acquire mmap lock                   reconfig_close_windows()
    do_mmap()                             lock mmap_mutex
     mmap_region()                        Acquire mmap lock
      call_mmap()                         //Wait for mmap lock
       coproc_mmap()                        unmap vma
         lock mmap_mutex                    update window status
         //wait for mmap_mutex            Release mmap lock
          mmap vma                        unlock mmap_mutex
          update window status
         unlock mmap_mutex
    ...
    Release mmap lock

Fix this deadlock issue by holding mmap lock first before mmap_mutex
in reconfig_close_windows().

Fixes: 8ef7b9e1765a ("powerpc/pseries/vas: Close windows with DLPAR core removal")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>

---
Changes from v1:
- Update commit log with more description on deadlock traces
---
 arch/powerpc/platforms/pseries/vas.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 513180467562..15d958e38eca 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -744,6 +744,12 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
 		}
 
 		task_ref = &win->vas_win.task_ref;
+		/*
+		 * VAS mmap (coproc_mmap()) and its fault handler
+		 * (vas_mmap_fault()) are called after holding mmap lock.
+		 * So hold mmap mutex after mmap_lock to avoid deadlock.
+		 */
+		mmap_write_lock(task_ref->mm);
 		mutex_lock(&task_ref->mmap_mutex);
 		vma = task_ref->vma;
 		/*
@@ -752,7 +758,6 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
 		 */
 		win->vas_win.status |= flag;
 
-		mmap_write_lock(task_ref->mm);
 		/*
 		 * vma is set in the original mapping. But this mapping
 		 * is done with mmap() after the window is opened with ioctl.
@@ -762,8 +767,8 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
 		if (vma)
 			zap_vma_pages(vma);
 
-		mmap_write_unlock(task_ref->mm);
 		mutex_unlock(&task_ref->mmap_mutex);
+		mmap_write_unlock(task_ref->mm);
 		/*
 		 * Close VAS window in the hypervisor, but do not
 		 * free vas_window struct since it may be reused
-- 
2.26.3

