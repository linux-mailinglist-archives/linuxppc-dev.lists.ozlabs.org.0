Return-Path: <linuxppc-dev+bounces-11911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A36B4A5C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:45:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnR2mQDz3cgg;
	Tue,  9 Sep 2025 18:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407467;
	cv=none; b=ncgg82IQfTYwwUUrdxFsZZribIWDcCQmqNg0r02J2/wwbCXzOhwP6ajiKmjA6YSI/qAkrGsTlma7Ir2sHCW0goKpM/9MjFnM17dhbTCF1Z5KSVe9vJFBCLa1y9uF6AN3jtELbfsp5oimoxpK3r3OVJzmNn+ozEyd077KV1hSLJCwT/ik1kxfqQUapK0hCJWEV+Kad1YWtIqLONvWzMUCTwSbcQ94IA43MREZPSar27RrEYKbCJp5/azkcPUXgxhSS67wLWISwkLnkBkQBNu6Re6j5Umh9hDiF2v4I41KpRFRzRoZXldVoKsJKa3BZMBMvFkiWpgmVGr+kb4+7UjjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407467; c=relaxed/relaxed;
	bh=y6ejm2fNjFI6BLkr88lEhkL/W9w8mG63kqQjanaRkoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrKJo6Wl4FYE3Ifnvbnmb6/Lon6/vHbkD97fBpW1O8CQjGX91ePz8PkN9zSOeeOMqAvP0txX32563NFs1CXjpjvskKLnvHnx1fAMBVZfOkej64vWknnptBQBDKRUejXlNo/CB1AvY0e8BZNbg7hdqWgH5k6KDTg6K/h0HaPynwcnr5Xz7IP/BGENmMcJ3h22sBuvTgKr9KjdK4HG5mqZofxgJ8cb2YKkT09WRaLnoKPNhyOo8wWVEu8xq6wptwZxp4qn+mS6kqqoAr+ah42ehx3Ay6qGZz/L5t/DMI2OwBqAcr+8kE6KOcIVRJwMzZoKky0oYbStL0k//XgcOjKxEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JtY9t74A; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JtY9t74A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnQ4rWSz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:26 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896IvMX012534;
	Tue, 9 Sep 2025 08:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=y6ejm2fNjFI6BLkr8
	8lEhkL/W9w8mG63kqQjanaRkoA=; b=JtY9t74AFBNnbDuIU6Zm42SvCOafMJYoa
	t3PYSLg9q33j/TobwHj2WGNyRz+mu5OqiCWidDOB/iqSNh+1JRKKSBCQqdBzNi6l
	iZLVa61faDXFpo2I0gHaNUrGBn1T3gm651WwBywxGJGP2nymGQEhOO89NX1oCOJD
	Yoye6BmWRqvStPoJEc5PUNA6wGtVUXTXKwPApqpgZks71DayqmT7tL/YZa8mWi5A
	8aeAubL7C60pDnUORVlnTsvDVGm4f33bSUQO36AApz3XE/7LdTj7fS8zfbPn5QMV
	gEdJtUFW6Q4FyixFJNwLMH8zuw+0QR8CVQALXtry4XdyJYQbJg7pw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff6m2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898Rm38009504;
	Tue, 9 Sep 2025 08:44:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff6m29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5897DfTl017163;
	Tue, 9 Sep 2025 08:44:18 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gma0ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:18 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898iFn828639764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:15 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21F8358057;
	Tue,  9 Sep 2025 08:44:15 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D74258061;
	Tue,  9 Sep 2025 08:44:14 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:14 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Tue,  9 Sep 2025 01:43:58 -0700
Message-ID: <20250909084402.1488456-7-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ui3q1Ws54LcWJmifCqN_PEAPCvPs7lnU
X-Proofpoint-GUID: MoGrq0z0_1-3uJf9y_y5k_uX6hVqtSuj
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bfe8e3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX4HADiucaN3he
 33IEtjUrmqIKfzdgeg2ykUbNEyF6z5JAO7CCsoEyaOkv6zGNsU/7+vW6lfQFcPTRcllKg/HVgVj
 baBnIJqzbY0n0Wo4CZZrcCoiGzNym3gXz/FBZvokQyuuvSxyZUlnk8QCh82BCdSeHcZmy54GKuC
 mcdhhgLq2ubg8FXBmXmYyFAY+msxRyNmqJz28KNFL34TnTVVwNt3iyQM8jgiq4ymn1UIJncmytw
 DclO8byLmMG0i9v9ftYqQGBrnOa5wPU1zXRDdUniDLXJkyJsSykhhEHWodQOGZEietm4/uYxakz
 8564/Zmi4AFpQzlQV5X8i4oyi5VbxwGwBJYuGdHUUDKl69co1Lzpe1L2W+2X1wRlwvme/uSe262
 3Q/+2oQ9
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
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 28 +++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 87deb429b331..4a1444a0d331 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -396,6 +396,21 @@ static __poll_t papr_hvpipe_handle_poll(struct file *filp,
 	if (!src_info)
 		return POLLNVAL;
 
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
 
@@ -413,7 +428,18 @@ static int papr_hvpipe_handle_release(struct inode *inode,
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
2.50.1


