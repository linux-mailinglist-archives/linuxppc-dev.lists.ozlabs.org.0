Return-Path: <linuxppc-dev+bounces-10057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB34AF64E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2j6sWZz30W9;
	Thu,  3 Jul 2025 08:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494509;
	cv=none; b=ksGNuocXVojCVtgbBCyq1XwEcG/VPrHA7Rwunk943ZK+CWPbQyZQybGPJXbZ7ULU9uKbaT14OKIRxN08N5TPq8u/eaq57exkf8ucZ4pRF4Vv4UMeFy+Sy6vZJAZwcicOFaQ/ayw2x/sGvup7OuREKGHiL1d+kpyDKHGvjk1Ak+wDZEAh6rpJmSy4f9I8QfQsJtgtiai0DvLWYr5AQnlx9k/5E8jedmUN/p+xtp0dtk8KiT3AwLf4xj97bEn0CpxKOzo6K+2AVC95ekGOJvzgTu/S93JBKwZUX1hWPKRvcEqrYvJR86ZYhT6HIveU7F48eQ6eTXmEjU7YOiQy0XAQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494509; c=relaxed/relaxed;
	bh=cMaRS1Zu1UfBpM9x0i4DnAL+qPdnxe3j0eDhSi70AyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQwHNqw/BqWIzCaejgFXkIFmwVbx86hRd55zFnp3IMSkzrDaitDMN6Z0D9uV6qbINRMxXLJICydT6XINZORq6jJoIT1tQSx0udwKoFnTXVI8MxtvYBZGbb+wKtu8+cD2yOGy8cUftKNEuO0jZBgK04Pfg2o2r3hwUi66FiOIDgywk3hMxcZ7o1PkhSX9N4WNBRJFp5p39D8Xw32/7zgcW/GxzvCGbMdfIoHV1fVXN0YgZfPGWT1tbTEWPCHUqt4q5l0FWSKY3rr+UnYyWgJw+SBV9Qo7wnlRk+oSuZPHgsTsa6tnqe0l7W71JgdsiXf9xH/qRjUl0JjQ7ESAGk6IQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvRdXZZi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvRdXZZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2g1PqKz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:06 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Hr7tv017476;
	Wed, 2 Jul 2025 22:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cMaRS1Zu1UfBpM9x0
	i4DnAL+qPdnxe3j0eDhSi70AyE=; b=mvRdXZZi7HmB+1gsUPe2aPEVaylmoJDo5
	FJM3fOwmJ+x2BWgEUgODrVbPkNR7vMCWdZBX3qDK54lBPs9o1gMuNymOkg5jHUeP
	fbxt1J+0T7nyONGDhzBaGQI99Dt2WRh1OAB3t9O0ZcwsM5ImKiayeMhvSNJS3PdQ
	Ti8oY1nduWGmCzNpfhwWdrROSjF+rnaXjlv6h+tYA2MPaZWuVJLPpoYPBx+uDSHG
	9/Ypffi4b0uxfSEz1v+zS7PE5P9x6iD0GzROJ8W+4O4AogFPiufiZ4H/88wRuOdX
	LW5DQUpbCCQ7FaJDF6bH21gH1uBhazyYwBLhtmvHIEm8j9ebqSFMQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttg71d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562MDone002930;
	Wed, 2 Jul 2025 22:14:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttg71b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562KhqUQ032320;
	Wed, 2 Jul 2025 22:14:57 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40sx9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:57 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEtYa30343786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:55 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6102E58056;
	Wed,  2 Jul 2025 22:14:55 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1C615803F;
	Wed,  2 Jul 2025 22:14:54 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:54 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 5/9] powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
Date: Wed,  2 Jul 2025 15:14:39 -0700
Message-ID: <20250702221444.879256-6-haren@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hGO-korxo5C6VqnF19at7LsCx9I-Iue5
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=6865af63 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=EkQxdJDstSX3VflVD7oA:9
X-Proofpoint-ORIG-GUID: _aJv4nnMp97nj4CrlQDpFCKWCvYXO_2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfX+cO2HB1laQQf ml4NMUeakKflv+b6Uk8z9xPtsLrj/4Rt5aFV/0p7ZeU22USxYnLp8wLql8Fik1AzDhPg/DdxaT1 aOvH9Nd4PLqLWEGv0pXenTBgAR9ACWrzbQ/fbhNaGeVvQZhdAjgQ6RLThELFwG5xsqeevUL5zgI
 C7szyjwpesRXGwy4upiTZ6QRt01Wcre53YwWSxGtk+48upsT9lybb+7GUFvTnBmkBatmg9mHCWB oF5H4Q3jtAKSVEZCJMCQoj+GLDMajcTZSOJFceXpFI9ewTGwRDrlaMCb3wNmnW4BqBsAwDM6hr9 TWVVv6dVCoO2VPhIRbAS4qFlBbeiuwOyPuDbHl2OSf79UcG1L8ltBTBmMGf0QJjwCj50ORCfcgq
 2BqrtyFjVcZ/FwXMKXFm4pepdHv6oJ+5NUM+RbMEAfW2PIzVABvUNFFypXMpDXrpt9EZeaPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ibm,receive-hvpipe-msg RTAS call is used to receive data from the
source (Ex: Hardware Management Console) over the hypervisor
pipe. The hypervisor will signal the OS via a Hypervisor Pipe
Event external interrupt when data is available to be received
from the pipe and the event message has the source ID and the
message type such as payload or closed pipe to the specific
source. The hypervisor will not generate another interrupt for
the next payload until the partition reads the previous payload.
It means the hvpipe is blocked and will not deliver other events
for any source. The maximum data length of 4048 bytes is
supported with this RTAS call right now.

The user space uses read() to receive data from HMC which issues
ibm,receive-hvpipe-msg RTAS and the kernel returns the buffer
length (including papr_hvpipe_hdr length) to the user space for
success or RTAS failure error. If the message is regarding the
pipe closed, kernel just returns the  papr_hvpipe_hdr with
flags = HVPIPE_LOST_CONNECTION and expects the user space to
close FD for the corresponding source.

bm,receive-hvpipe-msg RTAS call passes the buffer and returns
the source ID from where this payload is received and the
payload length.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 164 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |   1 +
 2 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index c30f4d75e645..21483ea09489 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -60,6 +60,54 @@ static LIST_HEAD(hvpipe_src_list);
  *   return code for failure.
  */
 
+/*
+ * ibm,receive-hvpipe-msg RTAS call.
+ * @area: Caller-provided work area buffer for results.
+ * @srcID: Source ID returned by the RTAS call.
+ * @bytesw: Bytes written by RTAS call to @area.
+ */
+static int rtas_ibm_receive_hvpipe_msg(struct rtas_work_area *area,
+					u32 *srcID, u32 *bytesw)
+{
+	const s32 token = rtas_function_token(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG);
+	u32 rets[2];
+	s32 fwrc;
+	int ret;
+
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	do {
+		fwrc = rtas_call(token, 2, 3, rets,
+				rtas_work_area_phys(area),
+				rtas_work_area_size(area));
+
+	} while (rtas_busy_delay(fwrc));
+
+	switch (fwrc) {
+	case RTAS_SUCCESS:
+		*srcID = rets[0];
+		*bytesw = rets[1];
+		ret = 0;
+		break;
+	case RTAS_HARDWARE_ERROR:
+		ret = -EIO;
+		break;
+	case RTAS_INVALID_PARAMETER:
+		ret = -EINVAL;
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
 /*
  * ibm,send-hvpipe-msg RTAS call
  * @area: Caller-provided work area buffer to send.
@@ -116,9 +164,60 @@ static struct hvpipe_source_info *hvpipe_find_source(u32 srcID)
 	return NULL;
 }
 
+/*
+ * This work function collects receive buffer with recv HVPIPE
+ * RTAS call. Called from read()
+ * @buf: User specified buffer to copy the payload that returned
+ *       from recv HVPIPE RTAS.
+ * @size: Size of buffer user passed.
+ */
+static int hvpipe_rtas_recv_msg(char __user *buf, int size)
+{
+	struct rtas_work_area *work_area;
+	u32 srcID, bytes_written;
+	int ret;
+
+	work_area = rtas_work_area_alloc(SZ_4K);
+	if (!work_area) {
+		pr_err("Could not allocate RTAS buffer for recv pipe\n");
+		return -ENOMEM;
+	}
+
+	ret = rtas_ibm_receive_hvpipe_msg(work_area, &srcID,
+					&bytes_written);
+	if (!ret) {
+		/*
+		 * Recv HVPIPE RTAS is successful.
+		 * When releasing FD or no one is waiting on the
+		 * specific source, issue recv HVPIPE RTAS call
+		 * so that pipe is not blocked - this func is called
+		 * with NULL buf.
+		 */
+		if (buf) {
+			if (size < bytes_written) {
+				pr_err("Received the payload size = %d, but the buffer size = %d\n",
+					bytes_written, size);
+				bytes_written = size;
+			}
+			ret = copy_to_user(buf,
+					rtas_work_area_raw_buf(work_area),
+					bytes_written);
+			if (!ret)
+				ret = bytes_written;
+		}
+	} else {
+		pr_err("ibm,receive-hvpipe-msg failed with %d\n",
+				ret);
+	}
+
+	rtas_work_area_free(work_area);
+	return ret;
+}
+
 /*
  * papr_hvpipe_handle_write -  Issue send HVPIPE RTAS and return
- * the RTAS status to the user space
+ * the size (payload + HVPIPE_HDR_LEN) for RTAS success.
+ * Otherwise returns the status of RTAS to the user space
  */
 static ssize_t papr_hvpipe_handle_write(struct file *file,
 	const char __user *buf, size_t size, loff_t *off)
@@ -217,11 +316,72 @@ static ssize_t papr_hvpipe_handle_read(struct file *file,
 {
 
 	struct hvpipe_source_info *src_info = file->private_data;
+	struct papr_hvpipe_hdr hdr;
+	long ret;
 
 	if (!src_info)
 		return -EIO;
 
-	return 0;
+	/*
+	 * Max payload is 4048 (HVPIPE_MAX_WRITE_BUFFER_SIZE)
+	 */
+	if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
+		(size < HVPIPE_HDR_LEN))
+		return -EINVAL;
+
+	/*
+	 * Payload is not available to receive or source pipe
+	 * is not closed.
+	 */
+	if (!src_info->hvpipe_status)
+		return 0;
+
+	hdr.version = 0;
+	hdr.flags = 0;
+
+	/*
+	 * In case if the hvpipe has payload and also the
+	 * hypervisor closed the pipe to the source, retrieve
+	 * the payload and return to the user space first and
+	 * then notify the userspace about the hvpipe close in
+	 * next read().
+	 */
+	if (src_info->hvpipe_status & HVPIPE_MSG_AVAILABLE)
+		hdr.flags = HVPIPE_MSG_AVAILABLE;
+	else if (src_info->hvpipe_status & HVPIPE_LOST_CONNECTION)
+		hdr.flags = HVPIPE_LOST_CONNECTION;
+	else
+		/*
+		 * Should not be here without one of the above
+		 * flags set
+		 */
+		return -EIO;
+
+	ret = copy_to_user(buf, &hdr, HVPIPE_HDR_LEN);
+	if (ret)
+		return ret;
+
+	/*
+	 * Message event has payload, so get the payload with
+	 * recv HVPIPE RTAS.
+	 */
+	if (hdr.flags & HVPIPE_MSG_AVAILABLE) {
+		ret = hvpipe_rtas_recv_msg(buf + HVPIPE_HDR_LEN,
+				size - HVPIPE_HDR_LEN);
+		if (ret > 0) {
+			src_info->hvpipe_status &= ~HVPIPE_MSG_AVAILABLE;
+			ret += HVPIPE_HDR_LEN;
+		}
+	} else if (hdr.flags & HVPIPE_LOST_CONNECTION) {
+		/*
+		 * Hypervisor is closing the pipe for the specific
+		 * source. So notify user space.
+		 */
+		src_info->hvpipe_status &= ~HVPIPE_LOST_CONNECTION;
+		ret = HVPIPE_HDR_LEN;
+	}
+
+	return ret;
 }
 
 /*
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
index 6f98da4ec45f..125658e6b596 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
@@ -14,6 +14,7 @@
 struct hvpipe_source_info {
 	struct list_head list;	/* list of sources */
 	u32 srcID;
+	u32 hvpipe_status;
 	wait_queue_head_t recv_wqh;	 /* wake up poll() waitq */
 	struct task_struct *tsk;
 };
-- 
2.43.5


