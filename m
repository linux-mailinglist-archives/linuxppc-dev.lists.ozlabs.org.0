Return-Path: <linuxppc-dev+bounces-11529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1AB3C86C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 08:04:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDPj76jp6z305D;
	Sat, 30 Aug 2025 16:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756533851;
	cv=none; b=LU8IuBMxh3nMhB8N7OsV14NwOJQS27b/Nz9w3t5sJiMXTFuGzl+B3v/CY+VV8YwgQNXStwQGHW7WP+UEncyYHg64DcSmej1w4EZwnkUDXmVP5NiiWcbd4tFh8iQ5MMYJVKJCcSTENf5AUjvLUiHLSqQMFYoYM9MF1+dbugB45MNo4Mb2lax28nrl02IcHFqRp6PmNcAwd0YYqEtjV6NfFtXCUl5VPYtgyA49G70Jg2iIh0vmpuWhbOj4588+GkTPUUd2V9/m+1/rUGAbIFgk2Xm0HQuvHTNZ24EV6icnA+qjNbwyokRr4vSxOv3+Wswt/W9cUQx+4bu50yd606Q15A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756533851; c=relaxed/relaxed;
	bh=aR3XH9LgbFsg3ZD+X6omWjcM1ZZHCwM37PF4mWHPuXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EotVZnhksrmHR9iEW9gBc0w6Kv+E+gDpNgrDla9UFcXmPBh86tfu/u1qq0cWqXsxPG3sn37CLODbA6WoVyxtCScfg6cBHoD4TVB4QmxFZDXaq9QP5FRXCkJaP3GR3PH5IraSb8SQCU4IewzM0hFbf+IZPwMDw+oebejyVWtw6qPEUN/BkNSu2ojnjxb4k/ffPVT0qvnmsUbJpmFzjFYwzDise/wJ1Wo6awyqFaDmHM3IzOvQUgb9dls57DbL0ga2EcmHaICvy6he61N3g7jsH4yLbEE/PvjAzKjnrrwJYfCAPue4qW7e1Zs4CnNCxfpkEKTWIFS+HyxLzxs++nDgbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcSQhi2X; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcSQhi2X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDPj72nHZz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 16:04:11 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U41RVT019584;
	Sat, 30 Aug 2025 06:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aR3XH9LgbFsg3ZD+X
	6omWjcM1ZZHCwM37PF4mWHPuXg=; b=gcSQhi2XevyxKvoFjEtoF4tmtmF6HRKV0
	wBmgAyyG1AfXfxpui4S/xV2jFgY6Gb8rrLBRtbZ7wPdnUUxo3C4OwvOCPF66f6DA
	F3ki39ooF1wcGOlCH4ByaAfGw3rJqp4wqP70jDM+Gxx2uU45lpf/4gc4QP7aTZMl
	cMOb2qiwhT4YJs7lprzo4Krl1K3lRl8pUozbyoNL3HTKjSuASA1eCn/D7p7x/1CE
	K5EkJS0y5hLE6Et4JOj/H2DlKQyNPJga+KmXqg6zMtQpAjlmKgnki9TPzhIcY0lv
	XCEfdBR47QiteCu3WL2OA5QKx4kWRj/1qxi8awaqz55utRuHyFOxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48uswcr9uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57U644fR011575;
	Sat, 30 Aug 2025 06:04:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48uswcr9u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3YDMD030335;
	Sat, 30 Aug 2025 06:04:03 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mvwfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Aug 2025 06:04:03 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57U63oAt21693048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 06:03:50 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FABE5805B;
	Sat, 30 Aug 2025 06:03:59 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5735A58059;
	Sat, 30 Aug 2025 06:03:58 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 30 Aug 2025 06:03:58 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v4 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Fri, 29 Aug 2025 23:03:39 -0700
Message-ID: <20250830060343.2656729-7-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=PeP/hjhd c=1 sm=1 tr=0 ts=68b29454 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX6SiUFIbZ4N1L
 Hs3hDPBBxkYYk08B+rBFWC7TrNFyz34LugQ4CvIcHb/+4Wp5TQwX34W6fYcVjqRW7yysPrP6ZaI
 y7OV6CIx4XsW1ZQguohrakOg5bhueYDBV05pfbB5gLbGDV57mh3/6+L80iPcPOIITx9n6XFuNYL
 cUgpGofBdH9Y5BS//P8ffWbYXL+ySozc98a7RtvbOr4p56LIU4n9pv/RtlvckkxWoXL6Jh3GeaA
 LCi62k/2ZdXV3zOP9523uVppIP+riD3UvU/IefU8XGA0DAvvHCh6kXehhw0vyBpHsDmV59hz/08
 mnx5IMEVuoRYr7mweZjdOZfTIot8tR2N9nOrrcLY8QXPq1mqxBUYx/dAd6QVr1l717rbZVuf8Lq
 30h7NZjW
X-Proofpoint-GUID: 38-TomGadK_8SKltJ4KM4Ce3t5A_51tY
X-Proofpoint-ORIG-GUID: UWVbV_dCKCk-8wdISWixX4_qatTvyn9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
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


