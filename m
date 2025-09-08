Return-Path: <linuxppc-dev+bounces-11856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A97B482C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 05:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKsJf3bBfz3ccr;
	Mon,  8 Sep 2025 13:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757300722;
	cv=none; b=MjIytPu5nDf4oRQDg2RlOesMXbxutydr3pKdUt3RWMtqJ+Y8FTKYM/oKNIWAkitP8DhaPk4MRIk2afmEtB8hWJf8h5F62UB1LVffAVSf+JT8qZFDXLq2tVHmZD1bEu1KKW6duKkxdoB4xU15NkifuegkwJLXfHUOIQ25qrzvdHlLoGelWm0sUGLif/ygeiOVEDesXZycqpzOhTnxCC98uTho4OER2a/uEXeDUhXuLvCjViognqU0glV3DKuMEMNY8HrU2KkJkGUDYr2IC4fvhgno6yq4OyXnuQEttRNzer9pP/lRPDJnLrFoPH7soyK98MbSuitQplzhD1ziz47HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757300722; c=relaxed/relaxed;
	bh=VE9HVbgZq1v9+FyV1FeLD+eYu2v5+3S41m6erZXNs7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGmedhOITXQ84BATXpyK6v5X7bArtQg+JtF/63/bQzxcs2ua6rieJFPVXanWgmO0wimBPrqAMYw5fU6l0iclyjSosUh5egj8ruUEi/uWAlOMZgF/eGkRIuR09QWz24OWp7sBOZrwU9M5N9mbQgqyCsOI9EgtsITsEY+6rLtiffEeH2xEkMWh1aIEVIuRnanyHgoUJMdO6NerBW0ZAMSBa3ZzO0zTxeE4S533ddWFNonKiQI7HiieFt5nYq36fFw50N2L721ScJ3Gxwn3ejOLObUzcG5A7KlCAR+6LXYbXjV9A23aSxKnSJDu1BJg+Or+lR+ZY7NcZ5vT23wZe7dmzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=es2B3ZTE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=es2B3ZTE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKsJd5B0Rz3cZy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 13:05:21 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Bfex4019188;
	Mon, 8 Sep 2025 03:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VE9HVbgZq1v9+FyV1
	FeLD+eYu2v5+3S41m6erZXNs7o=; b=es2B3ZTEBsQd8paTnGYFt2/7uTAWpujHr
	VwnEBKcfChf9X7GcYrE55sTUAOgCiwppgnGdO7HbHk5sYV6BYZnaqsrOrnc6+N+v
	9eogmUz6n73Qy0bs4KoMiSI4im+Iw9JRfrodVYAoxQRa3BAI2wbJ+WzslqaA5KOm
	WpY4+VWmyqXu8WOWqxEzydQ+YuZkTPDYXjaNQjBnpz1SLLS9oECfTnp6/XdWLJ56
	a+ht80v/X6WbKW4hul+XkNRkHbmoM6rxoklmxZxLwSaVCQfHvJKFzJu9FG82Lh7M
	41NAZAKn/QoMBNmWi5fHUSGh6IVB736Fse/Xp7IXrf2KCs/rV+cJg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcseu1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58835DZo023154;
	Mon, 8 Sep 2025 03:05:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcseu1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58806jlb007895;
	Mon, 8 Sep 2025 03:05:13 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109pc288-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:13 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58835A4Z60031412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 03:05:10 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A5A158055;
	Mon,  8 Sep 2025 03:05:10 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3ABA5805B;
	Mon,  8 Sep 2025 03:05:08 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 03:05:08 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v6 4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
Date: Sun,  7 Sep 2025 20:04:52 -0700
Message-ID: <20250908030458.1139163-5-haren@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX4DdX+oqCWkxG
 Ebhj/ZwKMpS9F+WLeb9X7eJ+9sQ7DucmgwZs8a7IAlkW1sJ+NSTwRu3oqT0P61vWH45jat7GUh2
 12R2+PdtLFmWKPMhUDEnS40EynXudcOqXEq398ACNaF3PgUCR9oPTPxVRTdXQKhGseo8h2lNtwV
 hXi0KAZygFGbiZsHhRexeFjumcKBfTaYS9RG4Q2Uye1vloNEqxxP0bxRPwZHSlaf9/U+55267O7
 ++jzWmb3LnN7Apqfm99Xruzq5gYqUjZ66bMRpcq0igohHtGSfO8n1Hj43OK94CczMeulbx0PRSB
 B1j8UoPsZydsa4ASx9LdpmMRl+x5ZzZYVjJEwdI5PFUxCan0e5mi+9W82udYRO+zuGb1sJOSeuS
 XpGgnijK
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68be47ea cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=lTP4BkPL7ZkNV5ngu4UA:9
X-Proofpoint-GUID: IBwEMKqXOkAryN-58vNZcRHqQqYsMp5V
X-Proofpoint-ORIG-GUID: 8RXTU1rSF0sWsGKiLWoQRWf5iafuhVJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ibm,send-hvpipe-msg RTAS call is used to send data to the source
(Ex: Hardware Management Console) over the hypervisor pipe. The
maximum data length of 4048 bytes is supported with this RTAS call
right now. The user space uses write() to send this payload which
invokes this RTAS. Then the write returns the buffer length
(including papr_hvpipe_hdr length) to the user space for success
or RTAS failure error.

ibm,send-hvpipe-msg call takes source ID as target and the buffer
in the form of buffer list. The buffer list format consists of
work area of size 4K to hold buffer list and number of 4K work
areas depends on buffers is as follows:

Length of Buffer List in bytes
Address of 4K buffer 1
Length of 4K buffer 1 used
...
Address of 4K buffer n
Length of 4K buffer n used

Only one buffer is used right now because of max payload size is
4048 bytes. writev() can be used in future when supported more
than one buffer.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 118 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |   7 ++
 2 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 5bb56fe9bac3..15e81c6bc599 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <asm/machdep.h>
 #include <asm/rtas.h>
+#include <asm/rtas-work-area.h>
 #include <uapi/asm/papr-hvpipe.h>
 #include "pseries.h"
 #include "papr-hvpipe.h"
@@ -59,6 +60,51 @@ static LIST_HEAD(hvpipe_src_list);
  *   return code for failure.
  */
 
+/*
+ * ibm,send-hvpipe-msg RTAS call
+ * @area: Caller-provided work area buffer to send.
+ * @srcID: Target source for the send pipe message.
+ */
+static int rtas_ibm_send_hvpipe_msg(struct rtas_work_area *area, u32 srcID)
+{
+	const s32 token = rtas_function_token(RTAS_FN_IBM_SEND_HVPIPE_MSG);
+	s32 fwrc;
+	int ret;
+
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	do {
+		fwrc = rtas_call(token, 2, 1, NULL, srcID,
+				rtas_work_area_phys(area));
+
+	} while (rtas_busy_delay(fwrc));
+
+	switch (fwrc) {
+	case RTAS_SUCCESS:
+		ret = 0;
+		break;
+	case RTAS_HARDWARE_ERROR:
+		ret = -EIO;
+		break;
+	case RTAS_INVALID_PARAMETER:
+		ret = -EINVAL;
+		break;
+	case RTAS_HVPIPE_CLOSED:
+		ret = -EPIPE;
+		break;
+	case RTAS_FUNC_NOT_SUPPORTED:
+		ret = -EOPNOTSUPP;
+		break;
+	default:
+		ret = -EIO;
+		pr_err_ratelimited("unexpected ibm,receive-hvpipe-msg status %d\n", fwrc);
+		break;
+	}
+
+	return ret;
+}
+
 static struct hvpipe_source_info *hvpipe_find_source(u32 srcID)
 {
 	struct hvpipe_source_info *src_info;
@@ -78,11 +124,81 @@ static ssize_t papr_hvpipe_handle_write(struct file *file,
 	const char __user *buf, size_t size, loff_t *off)
 {
 	struct hvpipe_source_info *src_info = file->private_data;
+	struct rtas_work_area *work_area, *work_buf;
+	unsigned long ret, len;
+	__be64 *area_be;
 
 	if (!src_info)
 		return -EIO;
 
-	return 0;
+	/*
+	 * Send HVPIPE RTAS is used to send payload to the specific
+	 * source with the input parameters source ID and the payload
+	 * as buffer list. Each entry in the buffer list contains
+	 * address/length pair of the buffer.
+	 *
+	 * The buffer list format is as follows:
+	 *
+	 * Header (length of address/length pairs and the header length)
+	 * Address of 4K buffer 1
+	 * Length of 4K buffer 1 used
+	 * ...
+	 * Address of 4K buffer n
+	 * Length of 4K buffer n used
+	 *
+	 * See PAPR 7.3.32.2 ibm,send-hvpipe-msg
+	 *
+	 * Even though can support max 1MB payload, the hypervisor
+	 * supports only 4048 bytes payload at present and also
+	 * just one address/length entry.
+	 *
+	 * writev() interface can be added in future when the
+	 * hypervisor supports multiple buffer list entries.
+	 */
+	/* HVPIPE_MAX_WRITE_BUFFER_SIZE = 4048 bytes */
+	if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
+		(size <= HVPIPE_HDR_LEN))
+		return -EINVAL;
+
+	/*
+	 * The length of (address + length) pair + the length of header
+	 */
+	len = (2 * sizeof(u64)) + sizeof(u64);
+	size -= HVPIPE_HDR_LEN;
+	buf += HVPIPE_HDR_LEN;
+	mutex_lock(&rtas_ibm_send_hvpipe_msg_lock);
+	work_area = rtas_work_area_alloc(SZ_4K);
+	if (!work_area) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	area_be = (__be64 *)rtas_work_area_raw_buf(work_area);
+	/* header */
+	area_be[0] = cpu_to_be64(len);
+
+	work_buf = rtas_work_area_alloc(SZ_4K);
+	if (!work_buf) {
+		ret = -ENOMEM;
+		goto out_work;
+	}
+	/* First buffer address */
+	area_be[1] = cpu_to_be64(rtas_work_area_phys(work_buf));
+	/* First buffer address length */
+	area_be[2] = cpu_to_be64(size);
+
+	if (!copy_from_user(rtas_work_area_raw_buf(work_buf), buf, size)) {
+		ret = rtas_ibm_send_hvpipe_msg(work_area, src_info->srcID);
+		if (!ret)
+			ret = size + HVPIPE_HDR_LEN;
+	} else
+		ret = -EPERM;
+
+	rtas_work_area_free(work_buf);
+out_work:
+	rtas_work_area_free(work_area);
+out:
+	mutex_unlock(&rtas_ibm_send_hvpipe_msg_lock);
+	return ret;
 }
 
 /*
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
index 3b6f9e737913..6f98da4ec45f 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
@@ -3,6 +3,13 @@
 #define _PAPR_HVPIPE_H
 
 #define	HVPIPE_HMC_ID_MASK	0x02000000 /*02-HMC,00-reserved and HMC ID */
+#define	HVPIPE_MAX_WRITE_BUFFER_SIZE	4048
+/*
+ * hvpipe specific RTAS return values
+ */
+#define	RTAS_HVPIPE_CLOSED		-4
+
+#define	HVPIPE_HDR_LEN	sizeof(struct papr_hvpipe_hdr)
 
 struct hvpipe_source_info {
 	struct list_head list;	/* list of sources */
-- 
2.50.1


