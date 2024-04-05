Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B3899A76
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 12:15:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oNUi+/Mt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9vWb0LHsz3vcM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 21:15:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oNUi+/Mt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9vVm5SWLz3d2d
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 21:14:56 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 435A6K2A006805;
	Fri, 5 Apr 2024 10:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Hx2YDPEnJP9LRZn14VGOIvgB+f/N82JjcJSGoPd5kEk=;
 b=oNUi+/Mtnu8sr0amAB4IlgS4OoIPT9Bu9TxCd+TFvlvREbYuU7x7XEkOyjI8Nonfb+qP
 +S3JQ8vXqIWtrc+7G2rv+K6GYZ//itdaaSS/IePmOZLEVv2I0i/UuvYo1SHhxlUqxKox
 UNzOYfUgShTAFWBv2sB7Klxw/y72TmfT/Afdf2VvjSdB+NCvtSSQOnxwcNTcc6+rObxe
 kD67ilrmrmQqpqwB3IFUKh+A4rAKxMIBjJ7ng+ucSQ2Tr1DnD9rvvoHxVVs/245zAOWW
 vjuAfBdDp7Qdos1jTYweb0VGXtZgL3L4jivZoO9J9YNg3cQS6nr3Vr46fgyfZ2idtRdU CA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xaf8400q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 10:14:18 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 435AEHkI019704;
	Fri, 5 Apr 2024 10:14:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xaf8400px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 10:14:17 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4359YjW2009115;
	Fri, 5 Apr 2024 10:14:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x9epy1t6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 10:14:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 435AEAGB30016144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Apr 2024 10:14:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF98720065;
	Fri,  5 Apr 2024 10:14:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E9C92004E;
	Fri,  5 Apr 2024 10:14:09 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.ibm.com.com (unknown [9.79.178.28])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Apr 2024 10:14:09 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries: Add pool idle time at LPAR boot
Date: Fri,  5 Apr 2024 15:43:40 +0530
Message-Id: <20240405101340.149171-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qmM6DW13Mo_g3PSs7FAHgHEB6iuAKIcm
X-Proofpoint-GUID: jk8KrTTZXQgUDbnp9mKlWKxUAl8RFZhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_09,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404050075
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
Cc: tyreld@linux.ibm.com, sshegde@linux.ibm.com, npiggin@gmail.com, mahesh@linux.ibm.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When there are no options specified for lparstat, it is expected to
give reports since LPAR(Logical Partition) boot. App is an indicator
for available processor pool in an Shared Processor LPAR(SPLPAR). App is
derived using pool_idle_time which is obtained using H_PIC call.

The interval based reports show correct App value while since boot
report shows very high App values. This happens because in that case app
is obtained by dividing pool idle time by LPAR uptime. Since pool idle
time is reported by the PowerVM hypervisor since its boot, it need not
align with LPAR boot. This leads to large App values.

To fix that export boot pool idle time in lparcfg and powerpc-utils will
use this info to derive App as below for since boot reports.

App = (pool idle time - boot pool idle time) / (uptime * timebase)

Results:: Observe app values.
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
Note:

This patch needs to merged first in the kernel for the powerpc-utils
patches to work. powerpc-utils patches will be posted to its mailing
list and link would be found in the reply to this patch if available.

arch/powerpc/platforms/pseries/lparcfg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f73c4d1c26af..8df4e7c529d7 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -184,6 +184,8 @@ static unsigned h_pic(unsigned long *pool_idle_time,
 	return rc;
 }

+unsigned long boot_pool_idle_time;
+
 /*
  * parse_ppp_data
  * Parse out the data returned from h_get_ppp and h_pic
@@ -218,6 +220,7 @@ static void parse_ppp_data(struct seq_file *m)
 		h_pic(&pool_idle_time, &pool_procs);
 		seq_printf(m, "pool_idle_time=%ld\n", pool_idle_time);
 		seq_printf(m, "pool_num_procs=%ld\n", pool_procs);
+		seq_printf(m, "boot_pool_idle_time=%ld\n", boot_pool_idle_time);
 	}

 	seq_printf(m, "unallocated_capacity_weight=%d\n",
@@ -792,6 +795,7 @@ static const struct proc_ops lparcfg_proc_ops = {
 static int __init lparcfg_init(void)
 {
 	umode_t mode = 0444;
+	unsigned long num_procs;

 	/* Allow writing if we have FW_FEATURE_SPLPAR */
 	if (firmware_has_feature(FW_FEATURE_SPLPAR))
@@ -801,6 +805,9 @@ static int __init lparcfg_init(void)
 		printk(KERN_ERR "Failed to create powerpc/lparcfg\n");
 		return -EIO;
 	}
+
+	h_pic(&boot_pool_idle_time, &num_procs);
+
 	return 0;
 }
 machine_device_initcall(pseries, lparcfg_init);
--
2.39.3

