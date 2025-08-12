Return-Path: <linuxppc-dev+bounces-10896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669C6B23C1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 00:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1n2s5nsPz2ydj;
	Wed, 13 Aug 2025 08:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755039461;
	cv=none; b=eJWLJ1INU93VJrfjPzZa0e1p50LGBWxd+bLbId2eigTew5QlLg9tioYlIDs3YWOHYbFQFO6AN06b1NseEgFX3AhIDS6hs2OPRzTHGDliDbN5LYKYsocE7rhEWCMVITgx1uYCo3JVwqnC4ty224USY/0w++9iyCXJXfZl2/fWlziq5w8A59BTKG0N2hIq26b587G1vMPyeG9qtRSORItCqDjsF6myah27HUODCVdI7dLNK5j5okhZBjJ0DZEA4tb4ScE/lD2SInvktgTbmX0JQaSe872g0Zsg6nkgVMvO7HAnz8IxsnQVkrvPqVVoBtoZF3nwOSev08uNMJCPf6QJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755039461; c=relaxed/relaxed;
	bh=beX79eOXlR3+dj6shhNCAtbb5Ayn99yavqV3vjZArhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAU2ZolEuDwXmQ4yi1TDwi3YRSQNX/OUGE0xBFxEe5A7ain9HlQdrm96Q/l5/QAo5t7L/sa2xxasr6Alj27HM57R9ISdZC3c2zPa64P+K/HrkuNIQgr7SSgvo18/fnors1LxqLDpgDBqKkestwqXQIKMSRzoiH9l6Plv1+leakQTToXBWBjHH1+AIRppZP6bSyOz6Earx5DmK69OAj05NZl4jMapLNHWJqq9LdsGMVmFr6JJ2bZDeImhqfYaMPQrvGIzf8yd1w0jA2vSCvHubmShTwNPAtj5T/VfEYOas0yAssNuKUL/sw6LEjZm/8UmWAwuLQlnOJva4zfLC06Tbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I2xyeQpi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I2xyeQpi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1n2s0z7Xz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 08:57:40 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CHq7vV001330;
	Tue, 12 Aug 2025 22:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=beX79eOXlR3+dj6sh
	hNCAtbb5Ayn99yavqV3vjZArhE=; b=I2xyeQpi+SSe4UijUnTOv2la4HEv6xwwT
	Hl5V8ai1lmuuHgPeYE9uV2uEAuavVslgjJfXReAMgRudSctHbSSi0amZAZLsgd35
	gyK2XfPeuyDlA0YP66po8arcNRvWAVNVWx1XkcUeTsAlYUNqFLyGQa12S29OeQgl
	LtZYiQsHRWFEQvNXmyxZWVPj02HnU4yDmKOPPOjRY0pjWuS1K5WFjtJ6//Qo1ExU
	1lpHGp7VdNErlAW2v31jtiw8f+C/vrDg/Xj+w7Q7QDU2aNraAQGHLYutxQr+qFcG
	sozeqybv1XeXG51GqNTsBr7DnT111cwyd6ui7uyB6l15D/0sLWbzA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwud9dgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:32 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57CMtTZu004517;
	Tue, 12 Aug 2025 22:57:32 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwud9dgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKCbEw010621;
	Tue, 12 Aug 2025 22:57:31 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48egnumveh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:31 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CMvKUB20775658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 22:57:20 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E4D658059;
	Tue, 12 Aug 2025 22:57:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D676B58058;
	Tue, 12 Aug 2025 22:57:26 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.44.118])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 22:57:26 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
Date: Tue, 12 Aug 2025 15:57:08 -0700
Message-ID: <20250812225715.339225-5-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250812225715.339225-1-haren@linux.ibm.com>
References: <20250812225715.339225-1-haren@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX+HvTsAvEaEqL
 cWFQazHRUncHM+YQ+R1tXKV1qnxYbzYEwlBaNcA1L8l3oQaB5eUwT3isp2VN0E8whEHCvWMROtz
 3TJu4sd8ZpY7X2LXjjSE+jDwmWEBACNy3bOXFL6HotYjQs/NxgvdjZURj3nT7rhDNMzMto+WlOg
 nao/L/A0SaAwfvPseiaHWu8Yz7GKizZoQoAvF/uLexIKT6QkYyzcekVXQa7dzNVWWqkotOvrEYw
 aJzBpyBC2W3Mf3kl3hvnsPRPNuJ2SqaBbIdLBBWbkUbupoqeLdbb9cOy5CP9RUzWoBDzbj+pfp4
 efw9wIl4FwR4QHI0HsSrHX+dQ0I22PzeiWrvJhwYV5Lzlh4d92CdNVIg1dOg3Of7iMWRLBLsHzF
 f1co8J1pPwsHWnPvn5Hbp+eqT74VyEd6BGYTP+/DLO2Y6EOJ8RtfnkZbxyLzGkUGthVddof1
X-Authority-Analysis: v=2.4 cv=d/31yQjE c=1 sm=1 tr=0 ts=689bc6dc cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=lTP4BkPL7ZkNV5ngu4UA:9
X-Proofpoint-GUID: C8B4WIlNZ-T4eV_TvJ9BGwq7p1pTLpr4
X-Proofpoint-ORIG-GUID: 0v_yTfD_DO91nJRiSZ3wOBST2qV3fYzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508120219
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
4088 bytes. writev() can be used in future when supported more
than one buffer.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 120 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |   7 ++
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 5768d072859d..c30f4d75e645 100644
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
+		ret = -EACCES;
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
2.43.5


