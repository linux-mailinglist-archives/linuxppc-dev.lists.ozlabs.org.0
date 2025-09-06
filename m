Return-Path: <linuxppc-dev+bounces-11828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD5B472F9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyRy0zsvz3chn;
	Sun,  7 Sep 2025 01:53:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174014;
	cv=none; b=WO8aIXeZ2ycAHFx0v1L6VEQfJSXF+OUci/mhA90+lNbGmMH5DXcZ7gJmkSh/x5CN1m3Ag7fmDFA3giPHgX9yYGW4zSeWCtO/rFIdEeiqEObT1h9fWcHANYlVCFqbLSrKhsWe/oYKJE+Lih+dWIjkAM3gc2fQBqBVgLvsn7BsW0eemjoYfNlmO0wsAYh/yZt+FfzEorztwH1hT0/+SQXtpbu7LetmzYSy4ne5tuIY2s9vZuSQKA6rJrP0E+oQLt5MluGbEYeW4QNFPG3k43wR/1PLoiMOaQI3J3XZxMKBHpN719PyAISARMxD+5RDhxTSuoxMP2wEMAFfoYYUG/j1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174014; c=relaxed/relaxed;
	bh=aR3XH9LgbFsg3ZD+X6omWjcM1ZZHCwM37PF4mWHPuXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEFPJIsHl9op/EmOahfZZ4YImhBSowvWyfikRrqF5bZu/Lwp29PsKQa1jOOUQoIKDrl8tDUYqaTRm8xEe3i0u8yAtIuUvKkzU/J3FveGKdHWdD6xvoVt+pZJlmv52G3imcXWhRVJtE31aqmFeLQoEdAsNeEaOgnWDgkOPd2Yy9b5qrqaSNMBtuICxR/f7Y6fhcsxGF3P0iEc2h0LbRCblCddgs0FzbYC91+QoprpL2X1U4HOkR1wAEk1OHO9sxrzhrZG7qyXgdWLRtd28Bf1ngVK8vWWk1pc0koBqIwcxvAkUrF7+mDuuL6m+Jav/rcv66wPLbEJQZkxg8nkJDB55g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hAFDzoQ3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hAFDzoQ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyRx2Z7Cz3chc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:33 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586CTJam005886;
	Sat, 6 Sep 2025 15:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aR3XH9LgbFsg3ZD+X
	6omWjcM1ZZHCwM37PF4mWHPuXg=; b=hAFDzoQ3ieuMhrRL1IiGZErJzaCw2bSPh
	OYNRuurnYqAkdeZrkFkMmIpa8SJ7DHgm39C1bQcZxgcdGvRSbk5FLcbxXQ8T6p+y
	UgRuOMNqoNx57ksW+McwRpuX80drQUMbbqlt8ToqFU+KVrdK2n9waf84wgAdoyKo
	1XCn8oGEva/H/6nlC97u9yldSdcqaY1K2h2fy8cDr2FiLfxSmqGwCWy6GbZ0TE8a
	7h++uAxt4vwsTLmuGigDMIQSUrGtHaooBmyA3kmFDVnktXRDUtTKtPAD6ezUf+1s
	QElaY8e+uDUpHHMZ+eda9GM3w3NEV9E5+wVQYSq94SyayhmDCLb0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:24 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586Fo3QT005025;
	Sat, 6 Sep 2025 15:53:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:23 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586ERhBS009248;
	Sat, 6 Sep 2025 15:53:23 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vdumx3an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:23 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrKJk10683176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:20 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2FA058060;
	Sat,  6 Sep 2025 15:53:20 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4BFF5803F;
	Sat,  6 Sep 2025 15:53:19 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:19 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Sat,  6 Sep 2025 08:53:04 -0700
Message-ID: <20250906155308.705926-7-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906155308.705926-1-haren@linux.ibm.com>
References: <20250906155308.705926-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: 9wg_xN7sPoFxXic9oC_mKkGzE4A8kFzY
X-Proofpoint-ORIG-GUID: 0pud7HziFtNrMq9MB-DHnSnIqbQpCBu2
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68bc58f4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX+WX21jYv0gjf
 T+GfvuUnSXo7coaOGWHH8Z76aNYRsX5Rkcg+pWxy5E+MdA/w/MFFlyc0iHeHjFcvnGFWPI42GuF
 pz91AcOaaWsAxBsQ3lhtFppXwusQO34VWdxJ+snk+hHUxmRqE/SwgbDOshaAzTrk/OQ+eHiJ6uV
 EPPmCzLISrA9IW2XjfzDynF3wBWglehtbZOIMU4yS5x1kkIJWpwRR3fSEvDvE7J7013rDzFTz3X
 1MK0eDk8ZBBmtyE/zHot4Heshayn/pIJdUWgaqCbcwDhbSshDumAPtM050JrwpcYHYi2MJmVwWG
 pV5d43PU2spikpbFneSbWDW+EhC6dBoxENY9JI1ieyKRJ0oNzv2xaEWpPTvlsMqWmIt5pnCXw2d
 dDOfLS/G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
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
index eb1b5f1f976e..1e7636c0b275 100644
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
2.50.1


