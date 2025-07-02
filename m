Return-Path: <linuxppc-dev+bounces-10062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EAAF64FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2s3Dx2z3bh0;
	Thu,  3 Jul 2025 08:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494514;
	cv=none; b=Z3eb4AvEQNbKgJpXoYiYDDVEAfwlXNVjekxmxDrVRUu2gLPk1GM9WrlN2Wwt+X9/PXcSiOeSH7d83LK9xoBgHbpTx/tqvti5DEe7pbPntAojoyHGFJMuYgzJynV3LUl/wHgfGDALP/bTN/M3pr/7RTz7D4zODkfom0A9BFpprI48jr6Fu6VEkJr4D6w35+DftjJDeX9z/mdavGcOxcPoSMqMxQPpXs7MH+StuqoNwP4xRgpbNWxFg7SjRoF67FsphFHvoYNL3dH3zojKy5lPm5BjorodUZToZ7HjX8H66rgUgrpS2XudsNcfRZ48wmGznTrDBNJAWivCVMNwRoLcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494514; c=relaxed/relaxed;
	bh=tO94Zj0rK2g+6Hnn8XHzjG8rPFm6cTZD4TL33ikoSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gRCQ7Xuo2ZUxEyFIHBm7cdpnUUK20EIrnz8Jnm1L7YiWqSIO68iDvkPgNv7bHsHtj0bhATHDwYBmRV6Zue8zqdpLQtZ3LtWFUDKXtyXNxE7fEyA3VeqA2ZjVQxCoggaBiOKGp1aPRxo8Chi1E49g7J04uFJJmR+77/K6T8xGqwxOIXWaC4Rkh6fmDgbASx93twaIBziCLrmXdamPJ1ILK2/SbyHT8KkHpF8X/9Bg0LzuL9QkcRGcQAg4kaQuZxl7vwY1OfcbzQHNsCH0cia5n94bzCKg0kD1m2e8epDQBDluffc30IL6lTnBirNmgRearRIl7VzfMOMVUPjiePgHuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XbPaOr0J; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XbPaOr0J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2p08FGz3bNt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:13 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EY5O2029408;
	Wed, 2 Jul 2025 22:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tO94Zj
	0rK2g+6Hnn8XHzjG8rPFm6cTZD4TL33ikoSv0=; b=XbPaOr0JLFEbAYcwyfX5bn
	c7N65odG+vLkpPXfTFFLhMP6XevKLv4CV1yNbVODlEH5qwdTPhIZW90/ScI9mENm
	6shjcgHbmgnuLTB6mX/+U6B9pR1kw8J6lMQn3D6uriPnhfypOtko4eVx1u0F9Nn2
	fM7AyI43At5lU7nRxqIhs2XoI0SNzvxNvBheta1yRW2ieZJUMAkAlYcAC0Q2Q10m
	b3u+UpmoyutQQEod9VNGf18HAgumC/23LaYMlcG7LpkOcy2/5Qg1KSqSqd4TnybH
	UQti/is7b/jQzNpowSxUAJTgA2ObuqIuQ8MH6z5zQqq4FitpXDE15r6HqdOSCahw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrrb1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:06 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562MF5P1003433;
	Wed, 2 Jul 2025 22:15:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrrb1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562IYFmP006904;
	Wed, 2 Jul 2025 22:15:05 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jvxmhkj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEttd28443248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:55 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA48D58061;
	Wed,  2 Jul 2025 22:15:00 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 180AB5803F;
	Wed,  2 Jul 2025 22:15:00 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:59 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 9/9] powerpc/pseries: HVPIPE changes to support migration
Date: Wed,  2 Jul 2025 15:14:43 -0700
Message-ID: <20250702221444.879256-10-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250702221444.879256-1-haren@linux.ibm.com>
References: <20250702221444.879256-1-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=6865af6a cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=S7z50IwEaLHSfgsXjVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: m-0ifBWqwtQgxN-_-Cd7-l5gZMDRV3l8
X-Proofpoint-ORIG-GUID: DOLwiivE0i9ao707s4ykrzeZn0byax_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfX6NDJ5pJYzgK2 QdPYxA0vWQN94/AL0VsrNGi0HH2CNxXYjE3ojQ+Vy78Eg9K5ROjjbU48qLCXv4xu4eHuWzqEjcy F1y26DjbPwjyjHtHwSTZzd3fg3cgZZFSc96C41MMVIJTiD+7LMpf2hkppuUmvPDNKGIq2GqYlfs
 4B2qvbA6VAgAxjIr3oOxNVNdSan9SK9edduBwcIAYFqgpwUXB9yHUSwMZh3YM1LxsbHGkbI35Jo eyW1hXOppy7cqvyC0tEKJx9jISy2JhIsXLm4UTQzcM0MnfpoVecygR2352PNIhTZCNYZFtTR2j0 JplNvE2XuF1aVvR0Fq3I2H5XNu9nnoOa5aOS6eAyqtoB6B/K/8bMhn/Vkp0oBcryzw3PHErGLJl
 vKRgHXiTRvXA4/5RCIOqsmjBqIerJsmmiFjWZudeXOBGaYi13+0tsurbfhlLvDj+K74zi3Hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=979
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
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
---
 arch/powerpc/platforms/pseries/mobility.c    |  3 ++
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 53 ++++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  6 +++
 3 files changed, 62 insertions(+)

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
index b103dde7d584..5ef1a26f61a2 100644
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
 
@@ -530,6 +549,12 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
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
 
@@ -688,6 +713,33 @@ static int __init enable_hvpipe_IRQ(void)
 	return 0;
 }
 
+void hvpipe_migration_handler(int action)
+{
+	pr_info("hvpipe migration event %d\n", action);
+
+	switch (action) {
+	case HVPIPE_SUSPEND:
+		if (hvpipe_feature) {
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
@@ -726,6 +778,7 @@ static int __init papr_hvpipe_init(void)
 		ret = misc_register(&papr_hvpipe_dev);
 		if (!ret) {
 			pr_info("hvpipe feature is enabled\n");
+			hvpipe_feature = true;
 			return 0;
 		} else
 			pr_err("misc-dev registration failed %d\n", ret);
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
2.43.5


