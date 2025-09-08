Return-Path: <linuxppc-dev+bounces-11858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D79B482C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 05:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKsJl26mDz3cgQ;
	Mon,  8 Sep 2025 13:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757300727;
	cv=none; b=bGRiOz6VdE6da/PTPAaTDahA8hw0BXL8xLlztbOfpWFHp/7je080lafZck1dVxIHlId+ABHXP3771v9KkaC+vSWVXFnc5RSGvnO9QnNkbYlqhxlqdgpMozRdhtL19DGNqyaaGY3JlkAQnvgsjXIZZh7oAoKuKq2siKexdi7KVicAwugIqCKJDuFizDG1jZ4QjAGs8UHlq08de1KviiJbrWa1GDPrhLEafNIK80ZBnZi6mlHzbN0/myqMElkvgcMxJ0XuNWRiFGnYteXa0Y4mdFBhesdIE2HsfwKYuD2dmf8b/rxYvmB8Wn1GkzI18XPFlW+TBREBZ/fhdBaPHpnsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757300727; c=relaxed/relaxed;
	bh=fY2cyM79wd2qEoj1++9jHZeCgzEFXORdr5kAOVIWol4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWKcosB2dRssmrUTehD0VgL9eTOnAmeZxTvOv7MF1sHvj/mk1xX26xw1Cp8MYffafa0u7A7EoHRS8fgn2CZ44WOmWWHZJD3fN1dqbedSoqUKc8NEgaDssWc0vR67SpcPJV1MY502fUtScz44o7q0Z5Jj7luQh1fWJwGbQgLvZd3GYtTgrbRhwmyVH+kfgjM3/jxADDs/kSiBib+DbQpTHSry5DYe8ZeG9f0n2bP/ik6HVztsq/huRvRqC+d6/oo6dsTX8Wf28Cw/P1b1WrKnFCzYNdmarf1Ag9I0+zuOliuKn+vzZ0fxm9fA/HLAI8+ilxTH/itxIRByZSLsElwaNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RtRihi+n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RtRihi+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKsJk49xzz305D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 13:05:26 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lm7rF014323;
	Mon, 8 Sep 2025 03:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fY2cyM79wd2qEoj1+
	+9jHZeCgzEFXORdr5kAOVIWol4=; b=RtRihi+n8bYfuNPEYA2qWL87eMdb/5J8r
	00VqzaRjjL1Cv9AuevNk9CPv8GMn2L3bS7/PVz4ETm2pe4VmeR1fywgPzIwd8cle
	XQQEgBxZRd1Qvny9RKBv7Da45fFLEDKkRm+brFNWvcee6CPi8RLEFzL7fHAoA1zM
	H3LAYqsEVe3TnLPkesdSuGsRgdNyAmkvKbXg4P2YBSlABoXHwKZaroIKvMPqs+Nc
	eWa3GlgD46xtqHHGyXPVMQzRI8CQqox2chpzhny8X33UptUZx0litRY3bcKbClnX
	76AXjYoS7GLN/mMYdn5XGhL2ccGMC0GtDKMB+cRHQzxhOnVRsye9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycktu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:20 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58830L7v031136;
	Mon, 8 Sep 2025 03:05:19 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycktu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:19 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 587MfYQW011435;
	Mon, 8 Sep 2025 03:05:18 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9u48n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 03:05:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58835FYW33423872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 03:05:15 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 153D65805B;
	Mon,  8 Sep 2025 03:05:15 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E96E15804B;
	Mon,  8 Sep 2025 03:05:13 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 03:05:13 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v6 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Sun,  7 Sep 2025 20:04:54 -0700
Message-ID: <20250908030458.1139163-7-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908030458.1139163-1-haren@linux.ibm.com>
References: <20250908030458.1139163-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: rDlW3rVmzE-igQds1VIqOLFWEsXrYGkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfXx25vvnFgu4+4
 V/TQ5ZKEP5ekYGFqRK7uqkwCJn2CIMMmAPhQyfGR0DStlnl8gp7w1HSgrECchmcF9URyEv90Fl2
 46EVwHqeuuCPBJ/B0HK3a5FMr+Jo8doTvm66uAj8KAUkmeC4bbxt61VaGdaKtFF5ct9HgN7ql8h
 VeJ77pzVz8Y1uBB6aChYbuRLL1ksGeUwhAK4jrRPifUi0RL0ObYnDItAIcM9VaTGW2+2DFERziK
 /Su4FoSWfQBMkzhYi/hvwk503Ktq2Bq20GLJZ/p+XlGI0EO53C0DV7AwVv7ufjYgXNvS8pwTY0C
 +WgsaoAXAXe4JVhKdfs/IiZTf1HD4NZknM7vqmxCzLURA9a/FlAfkzzlmw4GiPhPTl3ov+NEE2w
 PGJdnWkR
X-Proofpoint-GUID: Hr8Wh9PR5UtTZPXaVkB9OmyfDtqhyNx_
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68be47f0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
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
index bd134874b7f7..c8d18f154568 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -396,6 +396,21 @@ static __poll_t papr_hvpipe_handle_poll(struct file *filp,
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


