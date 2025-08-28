Return-Path: <linuxppc-dev+bounces-11454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE2B3AE25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXq2pMVz2yrl;
	Fri, 29 Aug 2025 09:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422555;
	cv=none; b=NrIJip5Pqetogoe7vpGlw3VctpiE8BYtN7By4Vmp2abY+ey/Hkn8do8XSeC2AJw9jWbnG3ECIZXJM4fIWLWwOTuusZPvpSFLk6JUMuf5QmqGD5wN8ywGieLvi4hi4c0FKHfTQSrp65p1ENQ2jVnAHSlnZ1sleFMFo7r2pHUvgfaDBQmCwcjCGz548jbvk/2dSenIjW9PKtr6jJIYq3P13yloSBxnnMf1XXB+KT9DzoI8dQ6PSrBAGR54LYaoAmXvi1KfE6N0AJ4dbs0TDEW0TQYjInmlauhIFSXp+KlJfG/y3MC2+re7omkoorZCqsTiBx9imyGL0Xn/UeDvUCKQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422555; c=relaxed/relaxed;
	bh=n/fW1hcJUV4u8az8Xvqno+grPvLEZLtrEQgvqxZ2oNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GoVOg4+Fh7UaS+cSPQrboqUrtmCEEjxUVRcAz3TncDhYBvTPCQvqWgD/BnptDfEAvv5eoeEuY1dwMIwNAGU+hkaqH0d11KCpvlng5ubDHfL730/5ZwYioID+mQQ6FPj3tdc/rBsNZk2d6toQJ136Ag8eHJbV7S/qtSZJnwnQ4jk/26+4NzFYxlvtoen/Au2g2RmNinb3dS6QdyNvyOoSOHhMctaI9OVqOxdkjTtZdJ2H3wGsGg6oc16/AMDkZLLZF7PX1hA+F/3K8O3bLtrgWxNBphQVS71T+CJ320dUxaaZibHHTH+DrZVhMRy9Avc4sxfBNKqxpIqTkxvqBBD3eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eiWFgIZJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eiWFgIZJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXp4zfLz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:14 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEsMiU007772;
	Thu, 28 Aug 2025 23:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=n/fW1h
	cJUV4u8az8Xvqno+grPvLEZLtrEQgvqxZ2oNw=; b=eiWFgIZJ1sO2XgfUpolPy6
	a1z5KwLO+9vl92h5JGu5BDUlf548TSkGhHLrt5t9cPwFNU5K5rjUuF+s3dIIwGPx
	1cYfw9dkDoxtpCScDHUrXaG+FE/Wriw120NtGTDDhn5So0Sch7Q9bKwK8+RhLTXh
	wA2plvdU2lp8xBYOrh5lcFhtKWlm5kRXZBnKPP8NNwN3r1jOBpzHyY/P6Q/0USnL
	/RatDKu+f8BtFxgJ/7AWpASepCMCwFGpUab+Bdr95YaTXMdO7W9sWOcRmS87SdPG
	VzBC958WnSMQHIJbF8T2M/GxpG3xFtX/JrsKXWG+UbHPb4wewn59/ZCT7W1wjCHw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqcde1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:06 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN96U9012703;
	Thu, 28 Aug 2025 23:09:06 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqcddy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SKP2rW007459;
	Thu, 28 Aug 2025 23:09:05 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyuqfbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN932p15663688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:09:03 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 595B258068;
	Thu, 28 Aug 2025 23:09:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C57658061;
	Thu, 28 Aug 2025 23:09:02 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:09:02 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 9/9] powerpc/pseries: HVPIPE changes to support migration
Date: Thu, 28 Aug 2025 16:08:43 -0700
Message-ID: <20250828230845.2291249-10-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828230845.2291249-1-haren@linux.ibm.com>
References: <20250828230845.2291249-1-haren@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXwKNnEdATpKqd
 +va8M1cS3GKtOg4Ut5Ou6Uq6obvuyllQciMG28ffW2aotbtLS0DE2abMvx+pP/0o3R4ZGcR65xv
 JlZHYSaYqnH8200FWndmJZLXx5Vy/F98QBGO3QEuYga231WMoJQ9YY057QyBOfboLgA36JDA3wp
 qVt5cxDyq5lQmxs4n2QYIyuR4Strgr5zQSWplD8rPPckgDY3CcZvj/HszP3uhlkEnCDP6lD0Msn
 9dAuuvArRtl/rlKS8PTdnCs8tZJRjueECSPRFRN/p0Vol2X0fzOKreMoJU01VWPi5eSqmFNHVtP
 SRpAIVR9xUWsnWDsFDla16bzet5k9D+wi8ktuHIYeNaW4L/8m0EaQXYJt36F94s38WQaM1W9oud
 mdRcYvFp
X-Proofpoint-ORIG-GUID: E8t19ixy6ERzbmXYdjDDjmWevggzb3Vo
X-Proofpoint-GUID: 13XVpq3JJ9uIP64K8gJ8F8-k-mwenVHA
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b0e192 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=S7z50IwEaLHSfgsXjVMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
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
index 504d7f20f0b1..350b416d2e76 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -27,6 +27,7 @@ static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
 static struct workqueue_struct *papr_hvpipe_wq;
 static struct work_struct *papr_hvpipe_work = NULL;
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
 	} else
 		pr_err("hvpipe feature is not enabled %d\n", ret);
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


