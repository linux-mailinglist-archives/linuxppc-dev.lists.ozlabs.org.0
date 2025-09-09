Return-Path: <linuxppc-dev+bounces-11914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF4B4A5C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnW3Cpkz3cl0;
	Tue,  9 Sep 2025 18:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407471;
	cv=none; b=OJT/Dhv9TajmRaiLbQPl7JnPHduBIWr5XvkLcX4pEkE8ZQGYLAe6FyaOjr76WhIzy8LpLRuMWeNAKtIshnKxRIB9m/rlAGjqH60cz47Ri3/yADMtIUncGrgAynyMPh2YuYpmHmPXuw32oPL+3QnBRCvHYkjDSXVUKbj+wYE4vIbtNEHWIAwGF9TK9hnuKrAe5cSHKOjBNPrvfnd0bxKKKED60BEiPpyBOnmaksl9CEw4vWxMEvLLo1iyuRmkRH651vSDOfZrB+M3SANBQMEZHcJQ6bzXj7CSZwUXf8TWnmN/nqh0LYRJSIDY5T7lDeVTWH8BqOkIw4QSZ82U4BvyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407471; c=relaxed/relaxed;
	bh=GhV0OluLKlExvlstR6zjU5GiNqzlWhpPMxi1a9ttAVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6c85jLjtbjgBMYgrENSD1i+0D43m/zn28U7RdMBT/bB6cNI8EX2w97zL2xhTk/RdRR24L3KcpWrqqAFZqxwVwAPQRT2U32nt9qByI0MK/e+3Xei6IEKS2Rl2fl8TXEyQep2Qh/ytZAC2C01o9vIs6KaCzFCpzHKuiVeWe+0CFVPj6z/7xmPLbooiM5Q+BNQFT3CcJIom0El1BqO/ryWACwzY5nERqXHx0wTK94RpIHFfIo3R0m3C1IjAhxPGcr5k2NxSxIIJfQJg3G3EwlNuMuqngwskAJOFRjMMzXUJDw9vmM4CYEf88ya7E9zfFhij9mtdMGXHqzldqEdyg000Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JgeFfL9Z; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JgeFfL9Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnV62f3z3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:30 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588JcIRd015555;
	Tue, 9 Sep 2025 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GhV0Ol
	uLKlExvlstR6zjU5GiNqzlWhpPMxi1a9ttAVg=; b=JgeFfL9ZrAm2ZwbB7xhdx9
	mbw5oXmRVxmt+k8og/VV4QMicYEqEquFzknIst1HzcYpMwIJ0rnVhxKuF4UJn2s8
	2bcJ9y3dzRLyP0L7y5tLqXGUeuRmKrArBCdK+AmEXj5nUSurgdH9++bf0wa7eqVG
	quJuUVvjYO2EllRvpugYGhaz+pMciLnqB/5BTJ7MRrOScmFUFc6A4xdRKQIIeYV0
	Y3EwkH9NZw6+4jiOiSFlcCaOnm5pJP/aPDnvR/LG+IKqdlvpwp5zwTVJ1KrZ6mbQ
	DGIQNYJQa0BcJLdorlKON4/1aWxFYOaICvFm+p5cGAEVPg7oIidCr4Va2LLA1JHg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff6m2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:23 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898XEvH024998;
	Tue, 9 Sep 2025 08:44:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff6m2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896t4bI010594;
	Tue, 9 Sep 2025 08:44:22 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smt58w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:22 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898iJIJ31588884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:19 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A0CD58061;
	Tue,  9 Sep 2025 08:44:19 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97F4258057;
	Tue,  9 Sep 2025 08:44:18 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:18 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 9/9] powerpc/pseries: HVPIPE changes to support migration
Date: Tue,  9 Sep 2025 01:44:01 -0700
Message-ID: <20250909084402.1488456-10-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909084402.1488456-1-haren@linux.ibm.com>
References: <20250909084402.1488456-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: qpMTOsUZssA3VEXYosXw1e5qY2It8cgG
X-Proofpoint-GUID: nZpwAsfz3g20HZ3ec28i-4waCoXlaQe4
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bfe8e7 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=my1_s58Wc0bmUrhXt8wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX4XUikQV4Hryk
 y/1KcdreZoAja0qX6IRTexBAb14FbOvxYxQAn5g5xlb7giiHA1m2E/svR4JFkHp/UjCf4HF5CvO
 t+o7FXNdQNkyjfRmNbXKjeDoVW7PYUClj/NeFbSABm6KdE48XKlsVnd0PBHSejCnDBYDjZvpDtv
 MUwAPf9yLPrOZUT8M9GanYdbiNqZN5tEL3/jJ7C6ible1DNBu+4PWVXxrE50tcnqggjTUdLK6wP
 KAHXLZ8vz55tutH2G1ei88qnac6NOuFk9W4I7xU9Bnn5lDcwNYyqdioUd4z6V6PE8WULyPT/ffM
 ShpSEzpKpT0VEw/KHgFPIllNTDFHNw4k2KtHg7Ap3S1ksmCisSK2bzp7BFijaUG1qDAndA6TzQG
 UXI9jP+j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
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
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 65 ++++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  6 ++
 3 files changed, 74 insertions(+)

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
index 65368dbb134b..21a2f447c43f 100644
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
 	__be64 *area_be;
 
+	/*
+	 * Return -ENXIO during migration
+	 */
+	if (!hvpipe_feature)
+		return -ENXIO;
+
 	if (!src_info)
 		return -EIO;
 
@@ -323,6 +330,12 @@ static ssize_t papr_hvpipe_handle_read(struct file *file,
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
 
@@ -399,6 +412,13 @@ static __poll_t papr_hvpipe_handle_poll(struct file *filp,
 {
 	struct hvpipe_source_info *src_info = filp->private_data;
 
+	/*
+	 * HVPIPE is disabled during SUSPEND and enabled after migration.
+	 * So return POLLRDHUP during migration
+	 */
+	if (!hvpipe_feature)
+		return POLLRDHUP;
+
 	if (!src_info)
 		return POLLNVAL;
 
@@ -539,6 +559,12 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
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
 
@@ -697,6 +723,44 @@ static int __init enable_hvpipe_IRQ(void)
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
@@ -740,6 +804,7 @@ static int __init papr_hvpipe_init(void)
 
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


