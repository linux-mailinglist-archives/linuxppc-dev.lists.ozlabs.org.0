Return-Path: <linuxppc-dev+bounces-11831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C65B47305
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyS22HYZz3clq;
	Sun,  7 Sep 2025 01:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174018;
	cv=none; b=LwoGGy2ZWuIo9MpNeHXrib39jMKjvN5Mt7kmj0j4tbMVJSK5jyyOoz4y1zLSE4gIiJ8BmQT5HM42CweFKgzgEPNh5QckoTnXzhyrJGs8Gk+woWC+EVPr+R2BstEh/FYIqVSTeAOzS6xndBQMtyeVegumUQbh2nM612vLbaBRKEV+xCW1TFiF72v9/DmU34bsZtcv7oJGr+lZ5msr18PzvtxUi7rdv84MgWK6akswOsQzwbEHIpQctBDW5/ha4GJzm5pOyYGnVVrZdte0sXJBRbTqR7TyIGm0X7eXyfRfjMNKx5ZiJyWQRv41PF6+OiB5ZQ8RDuaq7MMrlxD1Ox+PxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174018; c=relaxed/relaxed;
	bh=O9q0FHkpxFl3w0WFRpKTifrN+l+JsSE8NRq7brYK7UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZbzXEzXFI8vb+u+WrWT3hRKgIM7w5MDk0d0NGj+Ws72bWAE47BZrpPPLb7xSSDLwLdMyboDm1ygGsVGTnNIRhjkrOJI8oJ2p8Yc7XtBzCzl6L4Tv0/zgmme/O/yXIvQYRHZU5KNP40rBRaOqBoCNRZs9MiOXOfufA8Xk09wTZ9S/OGycjkOmTiOfMpn9I1jS9AmBkEpflwOEJIlpF1KhJtdwnSF1Kr+Og7vWM0TRoq4RBkGxtCfLiXeqOnmVqty5XFFWukk1XwVGZHfH6YB+w9Rii+Sn+0Mu4KJQxks90lFp3eHlUErNRhH6Ql5fAEc2XmC9Rmvk8PhCc4gb4uQLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GOBSqq4f; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GOBSqq4f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyS14yKZz3clc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586DVDvr020732;
	Sat, 6 Sep 2025 15:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=O9q0FH
	kpxFl3w0WFRpKTifrN+l+JsSE8NRq7brYK7UQ=; b=GOBSqq4fnEqlutE6S9KodI
	jmnGrF5qMC1UtNwlMm2x6nQfWIQyyWJ+NS0apM4FVXyfdTZL9U873Vh/FqdZkhHH
	vUW93k5vy56ZYsaqXMYkBbWWpx6FJFTs/zkK9CrSo5JCR7qIBx1HjnUcPLIwKXXX
	nEQ2oAvI//5TCv+rsxDcfziCjcyBDLyI5SJcmUejTgLv0RBNTa5F32rpoy5Wamze
	N8+rJqgXcz6zBeop3HAsb3XYo9MpzsbkY5V4PMQNLk/kDS1RgNayfEjQlzCCeDYL
	LvErScBP09EdN3kZ9bH+zJZqal4T6qbU2Zb0jvpC17K2ZtHIps+QJl8YSRosD7Aw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:31 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586FrUkY010887;
	Sat, 6 Sep 2025 15:53:30 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586DVAFo021191;
	Sat, 6 Sep 2025 15:53:29 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmq69jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:29 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrPnQ55378274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:26 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDF595805A;
	Sat,  6 Sep 2025 15:53:25 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01E085803F;
	Sat,  6 Sep 2025 15:53:25 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:24 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 9/9] powerpc/pseries: HVPIPE changes to support migration
Date: Sat,  6 Sep 2025 08:53:07 -0700
Message-ID: <20250906155308.705926-10-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906155308.705926-1-haren@linux.ibm.com>
References: <20250906155308.705926-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EQmlNblEojbB2Hf-RdAfQq4nLF4BFtLn
X-Proofpoint-ORIG-GUID: yr5p0SGRH77q3djqodSbT-Bzt0s8Fzas
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68bc58fb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=S7z50IwEaLHSfgsXjVMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX0Lir3RI1St5h
 aPO9xwQ+jcOU7/aF4DIgM+jI3LCUzCG1J0DSO4x7Vl2tvJ7RxaX9/eXhh4wt9lMYx+/xpX1juQ+
 jgI8GRkV93/Ow2Ng+89yDUKrzYPcZMWtnhnv75p4+vCFK8MBbu25IBkDVhucPYwvqeFy0tSDnOp
 MvSKzuXIIKIiSLCeClGZfSs2zrkoTPpg7uzRZeT5vSA/igFyecKdvxyaHcrl8AwZQ5oYP7iKADQ
 dRPNFAsFRvZnhOLd5QhgnL7yvLHlsG7/3OtjRXY8qfhHZWUDPIZjmBhrmqpEXU9+VJGxR2hdOqA
 k3v1LRTxEW5c305gOnNLNbznJbr30dNfJ/GZrWG07cN7hMbfOvLVGxaWubo34hWmRMAXfaoVtP+
 RELIG77j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The hypervisor assigns one pipe per partition for all sources and
assigns new pipe after migration. Also the partition ID that is
used by source as its target ID may be changed after the migration.
So disable hvpipe during SUSPEND event with ‘hvpipe enable’ system
parameter value = 0 and enable it after migration during RESUME
event with  hvpipe enable’ system parameter value = 1.

The user space calls such as ioctl()/ read() / write() / poll()
returns  -ENXIO between SUSPEND and RESUME events. The user space
process can close FD and reestablish connection with new FD after
migration if needed (Example: source IDs are changed).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c    |  3 +
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 64 ++++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  6 ++
 3 files changed, 73 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 62bd8e2d5d4c..95fe802ccdfd 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -28,6 +28,7 @@
 #include <asm/rtas.h>
 #include "pseries.h"
 #include "vas.h"	/* vas_migration_handler() */
+#include "papr-hvpipe.h"	/* hvpipe_migration_handler() */
 #include "../../kernel/cacheinfo.h"
 
 static struct kobject *mobility_kobj;
@@ -744,6 +745,7 @@ static int pseries_migrate_partition(u64 handle)
 	 * by closing VAS windows at the beginning of this function.
 	 */
 	vas_migration_handler(VAS_SUSPEND);
+	hvpipe_migration_handler(HVPIPE_SUSPEND);
 
 	ret = wait_for_vasi_session_suspending(handle);
 	if (ret)
@@ -770,6 +772,7 @@ static int pseries_migrate_partition(u64 handle)
 
 out:
 	vas_migration_handler(VAS_RESUME);
+	hvpipe_migration_handler(HVPIPE_RESUME);
 
 	return ret;
 }
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 43f5dfb8b6af..4183e9cbfb87 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -27,6 +27,7 @@ static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
 static struct workqueue_struct *papr_hvpipe_wq;
 static struct work_struct *papr_hvpipe_work;
 static int hvpipe_check_exception_token;
+static bool hvpipe_feature;
 
 /*
  * New PowerPC FW provides support for partitions and various
@@ -233,6 +234,12 @@ static ssize_t papr_hvpipe_handle_write(struct file *file,
 	unsigned long ret, len;
 	char *area_buf;
 
+	/*
+	 * Return -ENXIO during migration
+	 */
+	if (!hvpipe_feature)
+		return -ENXIO;
+
 	if (!src_info)
 		return -EIO;
 
@@ -325,6 +332,12 @@ static ssize_t papr_hvpipe_handle_read(struct file *file,
 	struct papr_hvpipe_hdr hdr;
 	long ret;
 
+	/*
+	 * Return -ENXIO during migration
+	 */
+	if (!hvpipe_feature)
+		return -ENXIO;
+
 	if (!src_info)
 		return -EIO;
 
@@ -401,6 +414,12 @@ static unsigned int papr_hvpipe_handle_poll(struct file *filp,
 {
 	struct hvpipe_source_info *src_info = filp->private_data;
 
+	/*
+	 * Return -ENXIO during migration
+	 */
+	if (!hvpipe_feature)
+		return -ENXIO;
+
 	if (!src_info)
 		return -EIO;
 
@@ -541,6 +560,12 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
 	u32 srcID;
 	long ret;
 
+	/*
+	 * Return -ENXIO during migration
+	 */
+	if (!hvpipe_feature)
+		return -ENXIO;
+
 	if (get_user(srcID, argp))
 		return -EFAULT;
 
@@ -699,6 +724,44 @@ static int __init enable_hvpipe_IRQ(void)
 	return 0;
 }
 
+void hvpipe_migration_handler(int action)
+{
+	pr_info("hvpipe migration event %d\n", action);
+
+	/*
+	 * HVPIPE is not used (Failed to create /dev/papr-hvpipe).
+	 * So nothing to do for migration.
+	 */
+	if (!papr_hvpipe_work)
+		return;
+
+	switch (action) {
+	case HVPIPE_SUSPEND:
+		if (hvpipe_feature) {
+			/*
+			 * Disable hvpipe_feature to the user space.
+			 * It will be enabled with RESUME event.
+			 */
+			hvpipe_feature = false;
+			/*
+			 * set system parameter hvpipe 'disable'
+			 */
+			set_hvpipe_sys_param(0);
+		}
+		break;
+	case HVPIPE_RESUME:
+		/*
+		 * set system parameter hvpipe 'enable'
+		 */
+		if (!set_hvpipe_sys_param(1))
+			hvpipe_feature = true;
+		else
+			pr_err("hvpipe is not enabled after migration\n");
+
+		break;
+	}
+}
+
 static const struct file_operations papr_hvpipe_ops = {
 	.unlocked_ioctl	=	papr_hvpipe_dev_ioctl,
 };
@@ -742,6 +805,7 @@ static int __init papr_hvpipe_init(void)
 
 	if (!ret) {
 		pr_info("hvpipe feature is enabled\n");
+		hvpipe_feature = true;
 		return 0;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
index aab7f77e087d..c343f4230865 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
@@ -11,6 +11,11 @@
 
 #define	HVPIPE_HDR_LEN	sizeof(struct papr_hvpipe_hdr)
 
+enum hvpipe_migrate_action {
+	HVPIPE_SUSPEND,
+	HVPIPE_RESUME,
+};
+
 struct hvpipe_source_info {
 	struct list_head list;	/* list of sources */
 	u32 srcID;
@@ -33,4 +38,5 @@ struct hvpipe_event_buf {
 				/* with specified src ID */
 };
 
+void hvpipe_migration_handler(int action);
 #endif /* _PAPR_HVPIPE_H */
-- 
2.50.1


