Return-Path: <linuxppc-dev+bounces-11910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9997B4A5BE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:44:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnN2frKz3cfH;
	Tue,  9 Sep 2025 18:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407464;
	cv=none; b=i705+fLzaralSwLyVEzwipk5y2neHP3DMyGpWOAIY8XZ6nUfihQ85MaijcQLZib/nJFje5U+BPHnc07W+92FvRNeha7HxPHKomnQRy5kBDhg8vbUXDnBJPiAQHzYdl1X+S/dwazuIXuHQNIaG/sOOs57rVYgvjd+kWi91C5vpFTq/WxTYG7aeHyvrSDwPeTmAE6asj/8C+/qpQO5U4eJg1LGjZc/fjb7X2ppe5hBKNfzPac+ap5xplTImjjI5Og3LiJZG4Gs77wnKt+DqJiqzgey01ofzF/U2v2Xx5a2pOYQqgbC/tZjA7u1nxafhQpPiYcQbu857GaQPMc0cVMVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407464; c=relaxed/relaxed;
	bh=ZOvuOcRbYO1iS1WOI6hTXDyegUlm+RE9zSEffyMlkEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXYfxZyesF5baCB0Do1W6tqkprgxVYqAP0AZQm2DQ5vWk2bfO8oVjgPzfWmIJPDSRVmOkmG7zmHFcHmRpG/udiEP4l9BAdsvnU9nAAHI9CTSovw5QpLkuPlCCVxOBsmmtw1MvEiB2fwyixYQNLjBIkgTkEvi/uRP7mVnykatLSjZQr1G10AxgxgbVBy3RrAw2UDJS6wer0/8jNSSl2v/hT4QepkljgsJ43Vw/s5MpdBovltyCL2ECvp0i616g6hDpHPppek1/vA9iZGLbeK+wFZ+QTU9NAtqmhuAxyGBaNP0bzvptdUx2Jo2L7WUggUfzWYQa+f4RaBPtjjhh5KMPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PS3q7x5p; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PS3q7x5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnL4bgbz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:22 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5897t5HQ030930;
	Tue, 9 Sep 2025 08:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ZOvuOcRbYO1iS1WOI
	6hTXDyegUlm+RE9zSEffyMlkEA=; b=PS3q7x5p8dMZrSOYgunFkAs3lAZtH1sjH
	/581gmshwESN8kBfxR9zAfGoh79iYDLbMHL9mROWyHSvjcZhV+577NxMsa9Blxp8
	e5h3my0A8MEfeo4CiUjDY8vajhUn/9t6iyCwmUpT78POtxN7vWhLaJmueUw911Sw
	GV1PzD8jEWuNaAdMpLdmyS2Q6GgM1gTnHvtOmj4/4tTKcxsZCi1RgwJEcF7khzQc
	RajkEGonxR4BeIQDoP6cMSrW6Xx0w4ScfrOp5wM1bK2dSfAOHGIOlOVINCaCeDeT
	b3PniprZ9OsD5GJM5pzbL7EZqwda+9Ji9k3o56r753tDftcDy6s5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898apo2002247;
	Tue, 9 Sep 2025 08:44:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5897C16w017188;
	Tue, 9 Sep 2025 08:44:14 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gma0y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:14 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898iC9432506602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:12 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34FE058059;
	Tue,  9 Sep 2025 08:44:12 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6303358057;
	Tue,  9 Sep 2025 08:44:11 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:11 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
Date: Tue,  9 Sep 2025 01:43:56 -0700
Message-ID: <20250909084402.1488456-5-haren@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y3NbeYj_kC07OutqWoX_tAXgF0G0qzlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX2Od+AoKtKlfi
 3apOwfyH1DwloqQkO4YXnWzCkwyrCk3VhcL6HBsUaXrljR/tta4LzEBoUAyNqPa2rzg+gsFdojf
 blm90nVkmANXde4NzeU4M1rR04Ur6bN7m3e8OAv8jxoGYZbbz6HrOKLyaJLwqLlVodX4eJABydB
 5wnB5+QubizuQDlQcPjBNLDG3B3C4A0SgUjbe7VMtNmu3ST/SMqA3N5n6OGUEjZ5JA7N9835k5y
 hQS5XDxPywUrGRYPjRXNN1i5qYEthostcdyG0dPgfqLgveec+vbZ58WZDwhd8mCL1GsvtxURi2u
 kag8zXEt80uwY2mGxhjABbPWZVwaEJbmSw5ImAz3bOI0gbBAWEwYIiRSCa3QU7F8bbJvqSzdNsW
 CzwWyOZe
X-Proofpoint-GUID: jrh6BcxlOSvY4INaYbbDpzkXnh76QU6Z
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bfe8df cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=lTP4BkPL7ZkNV5ngu4UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
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
index aca905189cf2..9f2bac71bab1 100644
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


