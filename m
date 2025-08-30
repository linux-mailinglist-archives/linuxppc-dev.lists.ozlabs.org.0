Return-Path: <linuxppc-dev+bounces-11527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9FBB3C86A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 08:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDPj34NkLz303B;
	Sat, 30 Aug 2025 16:04:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756533847;
	cv=none; b=lQdN9Lm1U3WF6lMTGVzA9Qa3hCRXK8dVeax72pBrstPOqsnHSsT5gyJfXig10qLd7AZ4vIKxMA6sA3zF8Ybr7RHwikqR38SA8y1pbVaM1+Khj6yVjZ8URrnX9XWk8dV7h9bOhI9diZBROp388kA5xuf8DwepxORpVK7g9ByhxHLeRXzMkqaM3JtbTW0qzla0O6hNcybjKb9l/7aweX1Gb9fMM7yAaunZ1z/Ps+v5ADe3ZyP/jxszJzbdCxt3CUmZKP1RS0GfkemsZHkuEhM62lClFKTCTwj855/mneQijttq6SbMRXJuGDM2St+jeVZuRM9RjrsSYN/8CzqeMf7MzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756533847; c=relaxed/relaxed;
	bh=vbanGSJdAu29BkF13t3pfn+XalfH+YxL/bQofbACh+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rw42OzsSfn99cX5fyvT22hAbun751TBPNxP1immn7p16HE61Fy4/BFPJtjlmU+NXnILb+i1PsW//vnCX7VBpkZ86JFteCVPVTWU6H4jkrC64peFAsZEVTZcw+9OvuzWWrZh/1s/d7Z7ilT6k1gcXd3ZzuTVUBvEiTHZZrh/cjFWNRRPo6cGoUP33rwMeyG2qRReE4iOlyxJWkAIeFkCEXPbRbb1CrZVOXyuJYc37EcwAMwH5U89NozDlQ9TuTQ9G3Gf7GBoSymjbJJaxFtsAde3GLaNHF7zk/XfIeaHrmC3csI5RX31EvRfjUnpTY7e1RnSteJYC9ZbDg5Pkzo3tEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iDbmKesC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iDbmKesC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDPj30d8bz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 16:04:06 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3wjHh009700;
	Sat, 30 Aug 2025 06:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vbanGSJdAu29BkF13
	t3pfn+XalfH+YxL/bQofbACh+s=; b=iDbmKesCVfR5jkBVrD35vgt9hputsOaKB
	1cRpw/kzBBQbuQuzhMYLRsECt+7mxilGrAudvdJAjeB4pTMr2lfPwDE6L/T7x2Ud
	oo0EZEBIXvZmwm2P893rt5oYdNgHWAC3Eq+LtG163YzhlD8YvhXOrBEunj/7PoWF
	PM2+ettBa7SPe5a2mgZcC78KmSEAh6BKC1/fYvnNHbiilFE2GW5x8xCp+ysjWDBi
	g2DwH8Cd1s9MRTeHIro1XXyuEzoimzPfav8N5wSbxRxLSVmDSnbR9Vuy3W/bLE5P
	AEyvv3MMgZxXqHJPsH/avst20U7Ox9QysL5QtJDxK54qHEZMhWAmQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usv2ga02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:00 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57U63xEh006705;
	Sat, 30 Aug 2025 06:03:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usv2g9yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:03:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3YHsM018047;
	Sat, 30 Aug 2025 06:03:58 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfn50q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:03:58 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57U63tc219071738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 06:03:56 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3CC558059;
	Sat, 30 Aug 2025 06:03:55 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B6A75805B;
	Sat, 30 Aug 2025 06:03:54 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 30 Aug 2025 06:03:53 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v4 4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
Date: Fri, 29 Aug 2025 23:03:37 -0700
Message-ID: <20250830060343.2656729-5-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250830060343.2656729-1-haren@linux.ibm.com>
References: <20250830060343.2656729-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: LgWO-d-zXtZP9dLlI9e9xDmFCqkWyyRT
X-Authority-Analysis: v=2.4 cv=FPMbx/os c=1 sm=1 tr=0 ts=68b29450 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=lTP4BkPL7ZkNV5ngu4UA:9
X-Proofpoint-GUID: e-qjS-88fEJme5JRY7XFccDV50DhXhNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX/TFVwasGG1QU
 bY9LCtAzcj1bN39SJ2Z7FoC3/SoDo4cilk0hswsRt+E1YqN65xA2zd+WMLUSlAWhZD3gEyyOU28
 +Q4OhHoSteU3liNfhJ9XC2v/7SmYSzx9RlGQOxHDDQjZidlCgaIhFuDyBXRSoCdzp9STmTQUCIV
 Xjx9ZeJCJJbIVSiOnksVs3rNyeM1UtV2k2YiFTLKmDBDKAMGOzK46r3B9RScReHY7lI+58o5V9n
 ME40Ao1iZewOWBv10rl2oa6pph95EWyrlAbIeUL7gknupvYJIDxwPOGmM2BWCmVp5GZVjudsi2B
 CWJ3kjsHKqbf1IXRG1vqjc34b4m0eO+uGZNxBpZLJby4XaIEczBKrXF72IymiT/wo66Lvi2LtCx
 ADLscN10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300034
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
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 120 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |   7 ++
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 0ce0e531e49b..a7f0c49c7bdd 100644
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
@@ -78,11 +124,83 @@ static ssize_t papr_hvpipe_handle_write(struct file *file,
 	const char __user *buf, size_t size, loff_t *off)
 {
 	struct hvpipe_source_info *src_info = file->private_data;
+	struct rtas_work_area *work_area, *work_buf;
+	unsigned long ret, len;
+	char *area_buf;
 
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
+	area_buf = rtas_work_area_raw_buf(work_area);
+	/* header */
+	*(u64 *)area_buf = cpu_to_be64(len);
+	area_buf += sizeof(u64);
+
+	work_buf = rtas_work_area_alloc(SZ_4K);
+	if (!area_buf) {
+		ret = -ENOMEM;
+		goto out_work;
+	}
+	/* First buffer address */
+	*(u64 *)area_buf = cpu_to_be64(rtas_work_area_phys(work_buf));
+	area_buf += sizeof(u64);
+	/* First buffer address length */
+	*(u64 *)area_buf = cpu_to_be64(size);
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


