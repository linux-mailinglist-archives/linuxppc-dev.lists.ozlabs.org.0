Return-Path: <linuxppc-dev+bounces-10526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CFB18A7B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 04:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bv6Xj25Rjz3bnJ;
	Sat,  2 Aug 2025 12:41:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754102517;
	cv=none; b=IESddgYhn2UrbHANvC08zrn/farI11tZOeVgt7R7pn5h0WRw4YWbLTljg0NSoKhVZyIWbMYFtprZ+cE+DLN/UN/12D0gBcG1xwtTdDSYn1tnC7xYFBO4iSZsQDzhpvkdz2XhYY2fg3tZM4ALObhRMywcGqw1NY/Rb0iQaO+zqUksBMqNJnQvdreMkojfytHJ4o1GNO6n/37oqO5NuqjILclQHUZHahNVwUMnOYP8HRCYpnQHJfrXqqL7hdZE5BSKRidQCmBT9Vy/p47TZn5o3ZFDCqebccNNME0qceKaqBW69ThXKWh3EWHivwVnVAo/12AA2EuV0XVRjmIDlVvqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754102517; c=relaxed/relaxed;
	bh=eNTCZqo+M90bOZyKLyiC6JWSK0j7fm+yGroGg31tFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/8JYciSutNwH/VbFgU49+hbJL7HydsczF+CM7e8wUGVixrjbQqp4qGu61xSloXKFzmzzQoDnF7BSw0Mu2yFYb4FdRGbOzeV5wkQo1oC/5pii7jdI0NENxIcermaKtwd87JwY4o9+XXEXtWn0aVc62mLLVfjAuKqkjcV2ZuDLgejBI7c1vw5xLTn5P5oVmxgly4oF7Xh5RI/j8Kb6HEfIhyuHYduVgM5l87P6EGlfyvugvV2rlcw5Lpse/6osr/8exxmAolQ9OTdGbDfGWYR7OgzOTQ4ch9CEbkRGSjWi7sfcUAPdrvY52R9Exe0Z6NZJWcvjJ3Vbnhmz38nBKl/EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XZ1tU7tx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XZ1tU7tx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bv6Xh3YD4z30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 12:41:56 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5721uRd4025872;
	Sat, 2 Aug 2025 02:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eNTCZqo+M90bOZyKL
	yiC6JWSK0j7fm+yGroGg31tFGA=; b=XZ1tU7tx3wxqeNxfjdsnBQuNdOoCJUimR
	H3ZQsxMoLXFMO8c2RM8MsZ9dPA05Oc2AiI08+c2imnp6hJVLdfQX6+B02ulpUxkN
	2jNR8j+Zi/F3QxAnW0toaqRt1fKIqhGjAqzvcRwrY+S36yLUc78PcJESOUXg+88I
	zLeplSe1+ZBSNJ/EHiSMsg+x8pN9rlccSnd5Gb5gEpyC20eog4Bk+tCzUGp58sKZ
	m3cU6KWoqLEaVnPr47Ek1G+p+ILmBQdpliBMjqraDbf1C+rqJ72C0fzJBRd+3MJ3
	09m66Mz3ablXRFrsiILEP2hwK4MF71HIEG56TM3I5LEOYfnUICoFg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48983sran6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5722Xovl017464;
	Sat, 2 Aug 2025 02:41:47 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4859r0m78a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:47 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5722fj3U28639564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Aug 2025 02:41:45 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A5B75805B;
	Sat,  2 Aug 2025 02:41:45 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1C8658055;
	Sat,  2 Aug 2025 02:41:44 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.171.135])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Aug 2025 02:41:44 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        haren@linux.ibm.com
Subject: [PATCH 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Fri,  1 Aug 2025 19:41:16 -0700
Message-ID: <20250802024121.955274-7-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250802024121.955274-1-haren@linux.ibm.com>
References: <20250802024121.955274-1-haren@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDAxOCBTYWx0ZWRfX05Z9GefLPuMY
 w+yPjzSkkYH2G1FweWQTZ80z/nXRh47YhBTbqR5a3T0t8ZgEccjGcrw9WofoXJ3imM6036udWro
 5jDLY15+ryZ7S7H+qlm+Hhm6ZFKLrykqnAPsHjpB4pBW0isvL3HE4m8h/ObClIzqHkTOpRtBOlB
 YGrklp13x+K2VAuiOhDioLnHMEnXiZi1VgZPqSqjvvQB1LNw0o0rv2VqKr6mHaBuFMg9qt5+9OQ
 TTp0k02aOEFzBQoYOSS5rXbMh1SFm2cOgBCFU5qFnZILgFFg4XSpNZ1MhBMvfSXFMw8z0SMnzdX
 ncxbJ/J+KUPDcfg52n4VfvU43N97clWO6rC1SSgdHhBcN5N6sN3Ic/UWmj0o7nJ9toUk7ykGhF2
 pG1/qe395KBK8QioCR7ceez8+4Ci4eunfABds2gAhCrGruRC3GHdEUIkIqocb3UjMcQH8iLk
X-Proofpoint-GUID: 1HJSFHjZMZqowAeDch87DyiNRSqJCUQu
X-Proofpoint-ORIG-GUID: 1HJSFHjZMZqowAeDch87DyiNRSqJCUQu
X-Authority-Analysis: v=2.4 cv=AZSxH2XG c=1 sm=1 tr=0 ts=688d7aec cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=237 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020018
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


