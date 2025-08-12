Return-Path: <linuxppc-dev+bounces-10898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69718B23C1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 00:58:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1n2w61RQz2xHY;
	Wed, 13 Aug 2025 08:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755039464;
	cv=none; b=AQjlvZA1jlpo7iubsl6os0zfYc0KkGgamWJL5KXiAcXPfddytCT2Qxjrxilb7qclSSAy4HB/ObrZV1VZwxwVWVjwacmV92K6B7UB44pmwyU/ibTqacSYqtePKywrDoS3nhxhcO2y15s7JcK2ecn1Li88oOBSOsoRFGFIGr5x0j22Obc0SBW4QJr69HdBKzDq4RbHFaDz5M3rNpfhja1XU84CRvxgsr3WRl4A7t6JqVWef30+0OvaD+eGsSkvfqEDiyUAx2RESLw6he/PsI9U2pHS4CiYT4/WuViRJa1e9Vsg/nc19OrtCHdW+k6NSRrAe2EhwE9w0e0FHQ6YUqVoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755039464; c=relaxed/relaxed;
	bh=eNTCZqo+M90bOZyKLyiC6JWSK0j7fm+yGroGg31tFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1/EJdzSKWb0j0KnygTMFKvv1a8AH1hX6lyBy+q1IiQky4KF/8ONUVPNQkg40d9s3c0zP6PvMvzRCx8YMJeS/UGTGsTH0oGVBc/m1/tawIL0PMNDHUwmDyk1t03oJQodLLiYHJ64KzX7GZ4SMrTbO0nWH9gaR5wCnPLe85WqeGmKVv/pI3qTe5GeLQ/6sNW9aXwoBuIHQ7xKXBTC+zSGpkbIcWBlSqnC154ylkr0AMKHvNuAMZhIZzskPoDtexS4YHKrt1gqnw9wkb7L29/W6Mb1YEWZFXz8/hN9TjOkrI30QhkoUx00DH44w7+QG9dNLB0zIlZraz6Cyhb/UHbCng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n3XCciMN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n3XCciMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1n2w1KVMz3054
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 08:57:43 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CHeQPh019391;
	Tue, 12 Aug 2025 22:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eNTCZqo+M90bOZyKL
	yiC6JWSK0j7fm+yGroGg31tFGA=; b=n3XCciMNvsls3UKq0rPBV6qwllV1krq5D
	nBcPd3SBZMd8FtIYccy1GktgOYzs1g2ZQYvLEeNyUiYclwnfKti/4ICaeRO6uDDY
	lMtloT/e1WyRqS35B79Yje0n+V4PHVE7fIuolPE+Uf5+Cc35GTlD6Id9canPmkLQ
	CbatMsanYaz7tSogAeYxYK8EDozeYig664WuraNpcqJf1srguL1YyCghEV+r4NYE
	9FwHBvorPExn31PX1M/ms36QUOEVTWHHndAQSQjErNKg5FWNShRuN6lRMGJ+9oat
	fQuwYXh91mjjvLQIj+/PW5B9vPqcowU1NpzcrT7PNZ4LugeywD0/w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48ehaa5kyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:35 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57CMvDsN003675;
	Tue, 12 Aug 2025 22:57:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48ehaa5kyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKdGL3026345;
	Tue, 12 Aug 2025 22:57:34 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh214t5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:34 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CMvWOb53608730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 22:57:32 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED3125805E;
	Tue, 12 Aug 2025 22:57:31 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0FC65805C;
	Tue, 12 Aug 2025 22:57:30 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.44.118])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 22:57:30 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Tue, 12 Aug 2025 15:57:10 -0700
Message-ID: <20250812225715.339225-7-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=KPRaDEFo c=1 sm=1 tr=0 ts=689bc6df cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-ORIG-GUID: A-VSqtijzpB7PfK_25phzOhouJ6JDzJA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX44zwr2YxkvEt
 EqoQxDLmX4YTf5AdLCH5JrkWrOcegalmL1ZIW7f/eUgxiF1/LeswcFVXLs0hazh5SOzpjgd1LUq
 C/PqgpW8RWPQyARVWYUPvzi1fbmi6CnOHAPUaadP6fJ1taAznUmvLkyJ74FnDG+xxf82cPFXjfQ
 nk6zbb2+hW9MkkVbWpJq97HPVIa7MwaYw7rLjvQ6bwHJ/gVDukUFPCRm5vJD40u96Io6Ym7a+8d
 Joc/GlnFoQjIEZMLCFAG1/UYIZpZgU0oQWFIiUJXixDsdXfuoeIQQYHVM8W2zeOP+5dvI8y+1o+
 PKg10TdpgPjKR/I+JPG9hREDqV24J/ZpYxSuyh8XHUZNq47SnnW5wyACpGF/ikQLfYiD7piZ80B
 a2TRomiIoynvwKwHV/GZFnCEOWesOOi8Turcv9tqdz8NYGG13+hchKkV6gP7SQXg5ZBL+sAf
X-Proofpoint-GUID: Vu-tBB6xUJ4-2opKwc7HsLLG43JsGabv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=313 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120219
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The user space polls on the wait_queue for the payload from the
specific source. The hypervisor interrupts the OS when the pipe
status for the specific source is changed such as payload is
available for the partition or pipe to the source is closed. The
OS retrieves the HVPIPE event message with check-exception RTAS
and event message contains the source ID and the pipe status.
Then wakes up all FDs waiting on the wait_queue so that the user
space can read the payload or close the FD if the pipe to source
in the hypervisor is closed.

The hypervisor assigns one pipe per partition for all sources.
Hence issue  ibm,receive-hvpipe-msg() to read the pending
payload during release() before closing FD so that pipe to the
partition will not be blocked.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 28 +++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 21483ea09489..b283837dcefc 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -398,6 +398,21 @@ static unsigned int papr_hvpipe_handle_poll(struct file *filp,
 	if (!src_info)
 		return -EIO;
 
+	/*
+	 * If hvpipe already has pending payload, return so that
+	 * the user space can issue read().
+	 */
+	if (src_info->hvpipe_status)
+		return POLLIN | POLLRDNORM;
+
+	/*
+	 * Wait for the message event
+	 * hvpipe_event_interrupt() wakes up this wait_queue
+	 */
+	poll_wait(filp, &src_info->recv_wqh, wait);
+	if (src_info->hvpipe_status)
+		return POLLIN | POLLRDNORM;
+
 	return 0;
 }
 
@@ -415,7 +430,18 @@ static int papr_hvpipe_handle_release(struct inode *inode,
 	src_info = file->private_data;
 	list_del(&src_info->list);
 	file->private_data = NULL;
-	spin_unlock(&hvpipe_src_list_lock);
+	/*
+	 * If the pipe for this specific source has any pending
+	 * payload, issue recv HVPIPE RTAS so that pipe will not
+	 * be blocked.
+	 */
+	if (src_info->hvpipe_status & HVPIPE_MSG_AVAILABLE) {
+		src_info->hvpipe_status = 0;
+		spin_unlock(&hvpipe_src_list_lock);
+		hvpipe_rtas_recv_msg(NULL, 0);
+	} else
+		spin_unlock(&hvpipe_src_list_lock);
+
 	kfree(src_info);
 	return 0;
 }
-- 
2.43.5


