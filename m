Return-Path: <linuxppc-dev+bounces-11449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E844B3AE17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXg6xpzz2yqf;
	Fri, 29 Aug 2025 09:09:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422547;
	cv=none; b=YKMKjB8mcwq5nLxniWmXNuN7bb07gm1LGSc6wft2elf7M0kIDVfn1bPZUGonymB4m0paPL4hgBDgGH60hYaPKrDechIGaOn20OZ0KYXLpVkgIN+8h22vlPEXsPI9UUJ/7at4nJQwPuis2k8KAW2DOUQEN/VjmBjn0XIYinVweVUXpUBUrxpU8NZ9QGWjVeQw+oSyzmOAOghkQ+omnblp5Nse1ZHeFFMjsZJYeToFNYhNencQd2B5zVLUQc8vVYKpVKyEQwM4p4Fy7/UQ5nS8m+ykgV0GFXwYCfLcJq6JZaz9Q1I9Pgz/SypA0Ik24tZxT0NHeAAr3AK+4MxdoFRqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422547; c=relaxed/relaxed;
	bh=UkESyD6baDoAu0ho6HxuOU3zL0+rVdQv3cG+ogSNAn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZ1fAIFJpFjt2hilv+pTK2cUrEjrG6RUlKmJSfdN4mJoQG/wL9sdgl2dxkcWoIb+UCDZcY012J0J19W2YyOrzkTDAsprKkc8puU+HgFOsEMjJJaADSg5ZJfFfAo8sxk2ym0+SHdSd+jFMqhUVgx3HyLl/OD9KACLqd4hTwenIM6aGIMkwW8MMex5Qh7Te54+mDlKYzjzU5DbIcjRBFoI/Gq82n27Vxo3yloAeUfhN6VIdbsaI4CzNpfMXt4yZldFSfw69Fb3KtDmJdA8KO87qnM4HVNwrBki2yGq03qCTz3Hyxukvf75C8xLsyBoKePQOk56UmYOEoeDY/O/cd0JDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWL4ylOC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWL4ylOC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXg1S23z2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:06 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SFY3Oi013101;
	Thu, 28 Aug 2025 23:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UkESyD6baDoAu0ho6
	HxuOU3zL0+rVdQv3cG+ogSNAn0=; b=XWL4ylOCHcrfGNvBQJV8u7R8KQuNmWNWD
	Pn1v+Y0UtPHX9FFWmnxSxDbYrJgXbTvwLrU+IBwKMHwkwQQBgoTxm2jB8S3uVGD5
	JbLw5v4xfW8KFN6NYg9B7UAOvTAQRuX9CdqhCfpQHvfQW6jaJWdakrLdgOt0+WJT
	CtjxKSDVrD/xEh0INT7uPb/ByHTIzUKAQ63Ffd5zUmXYWlmVzL6/mxorjVl7ioAd
	MIwSQmCB/TC3bLEZyV4BcaCE9lu1ImmtsKdn8ydxHlKO14knYyznGw2uA591VUAA
	95OvsYL2tZcQ6N+/zxGGNt3MRjIHioaDXP6LenNOZvOKEjRPPoUNw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv99w9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:59 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN4Yb4012049;
	Thu, 28 Aug 2025 23:08:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv99w9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SMcqBU002524;
	Thu, 28 Aug 2025 23:08:58 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mq2s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:58 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN8kK224511050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:08:46 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D268558068;
	Thu, 28 Aug 2025 23:08:54 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0088C58061;
	Thu, 28 Aug 2025 23:08:54 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:08:53 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
Date: Thu, 28 Aug 2025 16:08:38 -0700
Message-ID: <20250828230845.2291249-5-haren@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=GqtC+l1C c=1 sm=1 tr=0 ts=68b0e18b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=lTP4BkPL7ZkNV5ngu4UA:9
X-Proofpoint-GUID: Pl9u4lN9_RvXPDFhZrFQRTCsuQ2WAT0Y
X-Proofpoint-ORIG-GUID: pB0C0s5_gZVA84pkGKE7dwq9VZ884VkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDEyNyBTYWx0ZWRfXzwWyncNcCchV
 5Z+dd9sCBkov1TuSjQ+gNDY54N1R9FwjHSoKFTMVS8EescSoggXn+ebhSk/K/CuQD/sV3NoVJpK
 tVwNXokUcXcIBh0fcvxKn9g+leshp06vQ8Yfiw1yhHqnZn6faFC6NYKptzgs0ORi6YVUQeV6eZH
 4C9RRYdiphbVNvMpTDO7e2ptasjVqr+qCjYlw4ptvvaxJoRKXPyE8BxJOEv1HOhW0l0yqsBsr7Z
 mKXLWHPuWEvKicFx8SiW+3y8dQFSCbXhoHtCWjcR/V+ezmj+pKjHNh0ctWwrCSh8VDzJJMFGX+S
 C5NBqgx1zm8lA2t3XXqnnFWY4M9r5pOc2nuQzSRbzh4SDAXsaRr1BixRzfXvCdCWHtw7oreZ0my
 sAs7moOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280127
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


