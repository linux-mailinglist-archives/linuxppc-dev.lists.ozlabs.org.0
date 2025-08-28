Return-Path: <linuxppc-dev+bounces-11451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFBB3AE1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXk2t2wz2yrR;
	Fri, 29 Aug 2025 09:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422550;
	cv=none; b=bDnL8AGFpofNPKaG3oLLU1K/Ou2nR6Uys0V4lMgF9Zeztpvi4cYZ+2pP0OhLTS5YBrr2gXJ1Of17F5MWcbKc6osiL+U56QMfQVZoGrPXO/GB7KJV2LVPG8h1//tzGwB/zJo8Ai4R2FicfFDCcmQYJcHIQUzaTCNHdWs+4pEGlGct84pkXJTAU+EonPfYlGt/7anYwX8FpJBs1Q6GC4Q7xvcgwHH/DLPgqyCgzm287c9eRMpi52A7voNCDP2Muu1zvcyWemWgTeN5zUrlXMrJBCLq7Cg4wSCjpcml40zPs76VShzIpH0jdQzslZ9UhTUNSymoVoF9jJFh6+Ik8C5O/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422550; c=relaxed/relaxed;
	bh=fK6QsOVS/v/A+AaDWdSi2wsP6pvNrEQx30LNsp78I40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pma5hcy1r0wfAqyrpifMJbHEPyhdL5gPgmdQYLtYjf/bKq1noEjMlTOFrgihPfTRRx5bRXev43S9FDV8gwiCndiihBKZgUXCsWuXxS9wSHCRPdPZ/iBQHH1kdfPh7fsWehPMfi6w6SxWlUvWNqVgWfYoFcrdpi77SW22aPAq0Fk5c6pgH0q3quO3fgUffF745RpEj1DNjmPI7np7JqRsp6g8YatoCinhI+UAsM5xrmOL7WtLmqEJMCLNBuR5gDDC3zWwk+74e8jicCel2iosPqFcIoVV56VQtAQXIF6VTb/tm2E6sqcD9U6wFq9sTwthJgMx7rWD1fyQTvrIFz6VTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFXOtdoK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFXOtdoK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXj4JB9z2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:09 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SMcwvk025123;
	Thu, 28 Aug 2025 23:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fK6QsOVS/v/A+AaDW
	dSi2wsP6pvNrEQx30LNsp78I40=; b=VFXOtdoKt9KdVnoY0XBRAqGRduVGH8yUm
	GeyMxEmKaBLxCP0WO1Si1mFJFHfzp4EuyBRwLbNzcExxDfqb8hRFjiVisnBX4SH4
	NBGG7HfJDCDpNalVh8WNOC4yj4HbyQJRNwglZzeNlIXVbGhsXwtQ0IznZXatXEXX
	W4W42YbFm58Ro6i5U93tLzYfgVVqOT4xcd4tQoXWa6Qbov9rc5USHiaVszoi9N8P
	6EvSCUbmK4pllXtIhNko/WGQNmsGmBHgqmVobHYhRXgSufRwgmu73Zo82Nz/8rtR
	nzVsAnZBVh8b8Qk7ovULLTCMTwrb1ZpgRypS/YoBcG66WTzcMenhw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqcddp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:01 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN4gPf004254;
	Thu, 28 Aug 2025 23:09:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqcddk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SJsKT7007514;
	Thu, 28 Aug 2025 23:08:59 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyuqfbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:08:59 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN8uMa32047762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:08:56 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A9AD58068;
	Thu, 28 Aug 2025 23:08:56 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A16258061;
	Thu, 28 Aug 2025 23:08:55 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:08:55 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 5/9] powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
Date: Thu, 28 Aug 2025 16:08:39 -0700
Message-ID: <20250828230845.2291249-6-haren@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX25LaCvgksDOk
 WHN8YBWzQNvwmuXULfDPgWDEMj8fTjQR3GSwmma6cEb9aRojTuYFYGLVQvM7fYnnnu++VjuRpwZ
 twsET5i8GBdZI0yhRB14KQt0Nutb09JoLZnh7OnpOPJmBcSwwFLgrCS1VDGrB7eVJBiF9SmV9bY
 H0suTEhFPLwdz5ZOFnwP04CEMK0oesbqVfMJaZNEJA5eApbIn5mHqj7Qu4p7+Wn4hu15X47J/O+
 dOKicNdRIFDNi1r/rbqgQllsjF8ifezf6gcWZ7X1Mqs8FQKsitUjrpwRo7FxpeA+KVqsUVskBMC
 GNoxtjGTaT9uEKQBWyF0e4yze4Tp1j/zh3A8rgK6DfLqk51jWhPDXBLx13Dz2NHJFvf2fpqgzoO
 YqBA9vvz
X-Proofpoint-ORIG-GUID: yXIllhME5peRa7yeJrc4R8MFibUFlDZ7
X-Proofpoint-GUID: GQMw_fGZ-_mmsUtJ9DgP2404nY8E9aDb
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b0e18d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=Fb0vpKKBCbXNAd5_CAcA:9
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
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 164 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |   1 +
 2 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index a7f0c49c7bdd..eb1b5f1f976e 100644
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
2.50.1


