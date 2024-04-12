Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D88A2B89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 11:49:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4vrIoMz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGBbj0W1Xz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 19:49:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4vrIoMz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGBb036pFz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 19:48:28 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43C8xbQZ011718;
	Fri, 12 Apr 2024 09:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uU3ddZTZnfj2imegTYFWr1RmtP0XBLlrav0o/68Y/Rc=;
 b=b4vrIoMz1qdeWGzfATZKQiUokOKXi7ushEFEwHfshhjhCfFwdjfjQM3VzglQkXU+oZL3
 S6jUzaHs+PrvOj+ZAzCE06eTVenqn92FxV7NyVE+ZzREjOHhRUyM0Op8nePiuqJfB4OO
 vbNK2ZkiBuFwzwws3AcSWBAqhLt39dwM9+glyfaKt2EpR6GfXYSXdyO9GqPv6Tk/Aq+5
 aJm0MnhQOAXjSF0Fc72MPfViTwt1RRvpELZtAPz32BghW4FwhHpeea+bpg4+n0o1mIVD
 Z06FYJUOS2AUtAHpwlpYwCTr6wg18NX2JibmHMIjtX4uRyIOR8D3own92qsryCRtLAOF iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xf15v86vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:48:23 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43C9mNkr024881;
	Fri, 12 Apr 2024 09:48:23 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xf15v86v8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:48:23 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43C8bbJF021485;
	Fri, 12 Apr 2024 09:21:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbjxm8pgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:21:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43C9LY8B51183954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Apr 2024 09:21:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F6362004D;
	Fri, 12 Apr 2024 09:21:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4BA52004E;
	Fri, 12 Apr 2024 09:21:32 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.ibm.com.com (unknown [9.79.183.6])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Apr 2024 09:21:32 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc/pseries: Add pool idle time at LPAR boot
Date: Fri, 12 Apr 2024 14:50:46 +0530
Message-Id: <20240412092047.455483-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240412092047.455483-1-sshegde@linux.ibm.com>
References: <20240412092047.455483-1-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zv9mw922diKb40Pk7uA18GxCdn5WfjDk
X-Proofpoint-GUID: 6OnZn7-JcTVcE-GtxJetSWSPYMIQppWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_06,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404120070
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
Cc: nathanl@linux.ibm.com, tyreld@linux.ibm.com, sshegde@linux.ibm.com, npiggin@gmail.com, mahesh@linux.ibm.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When there are no options specified for lparstat, it is expected to
give reports since LPAR(Logical Partition) boot.

APP(Available Processor Pool) is an indicator of how many cores in the
shared pool are free to use in Shared Processor LPAR(SPLPAR). APP is
derived using pool_idle_time which is obtained using H_PIC call.

The interval based reports show correct APP value while since boot
report shows very high APP values. This happens because in that case APP
is obtained by dividing pool idle time by LPAR uptime. Since pool idle
time is reported by the PowerVM hypervisor since its boot, it need not
align with LPAR boot.

To fix that export boot pool idle time in lparcfg and powerpc-utils will
use this info to derive APP as below for since boot reports.

APP = (pool idle time - boot pool idle time) / (uptime * timebase)

Results:: Observe APP values.
====================== Shared LPAR ================================
lparstat
System Configuration
type=Shared mode=Uncapped smt=8 lcpu=12 mem=15573440 kB cpus=37 ent=12.00

reboot
stress-ng --cpu=$(nproc) -t 600
sleep 600
So in this case app is expected to close to 37-6=31.

====== 6.9-rc1 and lparstat 1.3.10  =============
%user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
----- ----- -----    -----    ----- ----- ----- ----- ----- -----
47.48  0.01  0.00    52.51     0.00  0.00 47.49 69099.72 541547    21

=== With this patch and powerpc-utils patch to do the above equation ===
%user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
----- ----- -----    -----    ----- ----- ----- ----- ----- -----
47.48  0.01  0.00    52.51     5.73 47.75 47.49 31.21 541753    21
=====================================================================

Note: physc, purr/idle purr being inaccurate is being handled in a
separate patch in powerpc-utils tree.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 39 ++++++++++++++++++------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f73c4d1c26af..5c2a3e802a02 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -170,20 +170,24 @@ static void show_gpci_data(struct seq_file *m)
 	kfree(buf);
 }

-static unsigned h_pic(unsigned long *pool_idle_time,
-		      unsigned long *num_procs)
+static long h_pic(unsigned long *pool_idle_time,
+		  unsigned long *num_procs)
 {
-	unsigned long rc;
-	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};

 	rc = plpar_hcall(H_PIC, retbuf);

-	*pool_idle_time = retbuf[0];
-	*num_procs = retbuf[1];
+	if (pool_idle_time)
+		*pool_idle_time = retbuf[0];
+	if (num_procs)
+		*num_procs = retbuf[1];

 	return rc;
 }

+unsigned long boot_pool_idle_time;
+
 /*
  * parse_ppp_data
  * Parse out the data returned from h_get_ppp and h_pic
@@ -215,9 +219,15 @@ static void parse_ppp_data(struct seq_file *m)
 		seq_printf(m, "pool_capacity=%d\n",
 			   ppp_data.active_procs_in_pool * 100);

-		h_pic(&pool_idle_time, &pool_procs);
-		seq_printf(m, "pool_idle_time=%ld\n", pool_idle_time);
-		seq_printf(m, "pool_num_procs=%ld\n", pool_procs);
+		/* In case h_pic call is not successful, this would result in
+		 * APP values being wrong in tools like lparstat.
+		 */
+
+		if (h_pic(&pool_idle_time, &pool_procs) == H_SUCCESS) {
+			seq_printf(m, "pool_idle_time=%ld\n", pool_idle_time);
+			seq_printf(m, "pool_num_procs=%ld\n", pool_procs);
+			seq_printf(m, "boot_pool_idle_time=%ld\n", boot_pool_idle_time);
+		}
 	}

 	seq_printf(m, "unallocated_capacity_weight=%d\n",
@@ -792,6 +802,7 @@ static const struct proc_ops lparcfg_proc_ops = {
 static int __init lparcfg_init(void)
 {
 	umode_t mode = 0444;
+	long retval;

 	/* Allow writing if we have FW_FEATURE_SPLPAR */
 	if (firmware_has_feature(FW_FEATURE_SPLPAR))
@@ -801,6 +812,16 @@ static int __init lparcfg_init(void)
 		printk(KERN_ERR "Failed to create powerpc/lparcfg\n");
 		return -EIO;
 	}
+
+	/* If this call fails, it would result in APP values
+	 * being wrong for since boot reports of lparstat
+	 */
+	retval = h_pic(&boot_pool_idle_time, NULL);
+
+	if (retval != H_SUCCESS)
+		pr_debug("H_PIC failed during lparcfg init retval: %ld\n",
+			 retval);
+
 	return 0;
 }
 machine_device_initcall(pseries, lparcfg_init);
--
2.39.3

