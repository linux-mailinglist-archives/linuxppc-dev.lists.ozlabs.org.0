Return-Path: <linuxppc-dev+bounces-11861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F071B482C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 05:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKsJs3yYWz3ckc;
	Mon,  8 Sep 2025 13:05:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757300733;
	cv=none; b=ekMWWpqI23e3zCGqOrHuhFWbJ9CR4ktq3scGB0u7lMQHVcKWpW8nAIlgl3Ek3zLG+IuiPD2J+34nkw8xacIqm71pWpCTcz2xt3jaW9FhVOjCAY/hKs+TGUH6w/bFAKtICpPt1ZLK1w8nFLbgWUeQNqtkVmxcZmFioz7GINJ88ES9ivuC3nj3twsInVzftAauZaVSWB2gMXrWcUI/4Dk8JJko6fsvloNvqMK0hUBYfT+rf/n8Kxb7zhZM5aGoOZpHUNH6FnEcI4NRvfxlA6XrL/jrJnwRo3n0TnlIFyua2LGqoIn2gGZxRBBMO8R7yb4Lf6L+ZReFIQvcGZwwdsiFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757300733; c=relaxed/relaxed;
	bh=iCnbyhgm9dkaGax4TOzVGLmTI6dYOyxEZI9w0FbYwmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcixuR1/WJmscRR7qoXqxuv1qhntMwbZ8Q2P+5u8SZnNjVfp4sR9VHgVM6U+TGM0rNHpIws8oih5n2kq5oMHQGlniLT/8kS//LOAwAj+Ep5OK946tg3kqQZJPn+sQYbgp98kr63R408fACR+7WxjV8R9MBKTjj/uHNeC+50LtqQ/LzPSSCt0f/T3kKwZNO/Vvn5CU4MBs19I5n96SkKiKm08UpYaWNzGueKvr0wDlZSjta/tza78i3yKPQLD+0U0K1MEu0bzyrJPe0cjppgS/hIIPtK3Rr7PhFe1Z76fSEfhQcIKU+SijHd1kLRWc9k5b3dmNczI52wxee5+tJ/Spg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TrfUX0fc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TrfUX0fc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKsJr5zRsz305S
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 13:05:32 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Jux0D011724;
	Mon, 8 Sep 2025 03:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iCnbyh
	gm9dkaGax4TOzVGLmTI6dYOyxEZI9w0FbYwmI=; b=TrfUX0fcgM7ZEPi1iakEfR
	dANPuQsEc7fMakqcdTIMWMiune/lhMATIg4E9Y5iHDRCNsnk03k0RACJl6btuZ3P
	tZS5iEkOcsYBVE4E9VtcQULEw9YfhMC6vlGDGMwnPjWS4ro1QyXCcyUc4KiVwTgw
	m2VPCk0n7otFqNEoMhFIIGAnDXRoA+CfNJluHtNK/sSEZ95ank7GhL2AQCJQ4TJE
	z6NuhqhN/eewVxVuV8ChdCW2lPlL9YdJ8lgBTCQKWVDhmuzTf0Hdsj2e3KSduW3x
	XOuEddHr1GVZbhI+tHK6fOIwDoLXTaySqymPWRseTlZVXt7FJMBKpEkO9C9Rk4SQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycktur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:25 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58834fUC006332;
	Mon, 8 Sep 2025 03:05:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycktun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5880MZ50010618;
	Mon, 8 Sep 2025 03:05:24 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smkywv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:24 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58835K4526083712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 03:05:20 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D677458055;
	Mon,  8 Sep 2025 03:05:20 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76B635804B;
	Mon,  8 Sep 2025 03:05:19 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 03:05:19 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v6 9/9] powerpc/pseries: HVPIPE changes to support migration
Date: Sun,  7 Sep 2025 20:04:57 -0700
Message-ID: <20250908030458.1139163-10-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908030458.1139163-1-haren@linux.ibm.com>
References: <20250908030458.1139163-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: AoQ3ntwCXOWaFJbPy9F5R0Mws3H2l6xD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX8SOsxAHYtlGo
 70oShO62ma/CWeMSaS1mwvgZa8vGfOCNhb/TlWaRnX5PR+0hYqavuOsXtC6LqBCU1bYLusERvH0
 syWNTmD/Mz5+NE4PkjgOcnTpv1myQXDi5B0CFifTtqhM5IHUuEJs4YTI+MFONcEDRq9Uzy/RTE2
 nP8oSduAxaeWvjemRxEqerRoW6xXscjF3hRPSOncswEHCquF2szduV1WmUPNegEwba4FODxwWKf
 yosr5nLKjKEt3Mxx7DAx+c5VsEiib42g1pWeCaQXDfa2GeenmKd05APdrSBHsYVscnxXuu0BXL2
 mfWQw2jFxAThjBUmN51DXMBT8weTCaKVxULwg1sbQd6mA/QNS+4d5Zy3iNds68eK7nuTEk+c9Iw
 XkqB/3V1
X-Proofpoint-GUID: oK6QBRtKdHrA6Q_ADZ6cpVDxZtqA1guU
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68be47f5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=S7z50IwEaLHSfgsXjVMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
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
index cc6b0877f191..41caec982a5f 100644
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
 
@@ -399,6 +412,12 @@ static __poll_t papr_hvpipe_handle_poll(struct file *filp,
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
 
@@ -539,6 +558,12 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
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
 
@@ -697,6 +722,44 @@ static int __init enable_hvpipe_IRQ(void)
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
@@ -740,6 +803,7 @@ static int __init papr_hvpipe_init(void)
 
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


