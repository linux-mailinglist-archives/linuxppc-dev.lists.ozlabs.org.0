Return-Path: <linuxppc-dev+bounces-11913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52404B4A5C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:45:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnS5D1sz3cgW;
	Tue,  9 Sep 2025 18:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407468;
	cv=none; b=hr7OBg9WNeOLWUTQtU62xW3GA4w5lq+FHl2OlyVACQXFfdNNywJ1WNOfwpjds06dtREAHdVDtPo+viDZLUA72cKp39viCdrHELwGpOy/KRAUgb1gIbxcxa7nINcmmUkasAeGO67d6IJ4XFTkEu3noiGndkj2XHGjtnujzzPNSTSZqqk+wrII3IUy5kOxCwe8gnapAwceBC6bkesRlvFd6e74q1QOKbnuuv0NBsi0+Zhi4HhYi2h0wl6PS1rkyV9cRuekpxQisKWeSYjXUN3TJAOWrqiVd8aC7WqRUICi571Lg7iIisPJsVOrc0pNQG603vo+IG16K9Kk7XVKOl3TJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407468; c=relaxed/relaxed;
	bh=dpP/zHtgLrIX23ZrNL0LS35y+oA1q2WRTbprlWjc9sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+wXyaNZ3ZKqpbAL31MPadYuY/9NF3YzoJKkSToxDs1lL7hf4aCOZJRq/lhlEPMp9OaTPOGCnUHjJdKFbkv2vX/vQbkYnlQFhNFiUJRNzp0NkgGM8vOD3OYj+qWc8qX9Zn8pao7ESbA7M8k2pQAsfWk4gsoNNQiBUcByHhymTafCE+I6OAujbJ/Vr8O7/1hg/Aoy6hq0EHaABFOLcwg1BgosD4kuPeja4DUmRwrksCFISQrPc24JGNtizRgBF4jsv3rPz5PnoSnnGm2GKgiCf+lOBKJzsLEmdkvHMUH+kKlDPXhjKHuj9ZpbqqATZ8TA1otzgvMO6+rDz1Z/CnLyaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C2p0JPKT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C2p0JPKT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnR5NZ3z3chS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5891n9UG029387;
	Tue, 9 Sep 2025 08:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dpP/zH
	tgLrIX23ZrNL0LS35y+oA1q2WRTbprlWjc9sY=; b=C2p0JPKTfJnfMkik/CsfIr
	89PDEeVWDKi/B3AotJ02ABh+Q2zP6TdLNGath7NQbqh3WZuxogv6gxJHzeP1uZ98
	D7B3Lfn2R0cCabxXXHcEBIq5aMshz+IAS9BwoTgZFqVxcjDlLipEUFO+3GLc/6ey
	kB9NptaM7kQc1kOXneJfYEJ01hqY87J/9+CjQM370cezc0RmELoIn40doYHPdvLk
	8m9t0mHDjm9Jmx59yAhMmvoLVTEnsfCd0V+hKJaZM7eiy2LOg2gH+fId+MsgOlux
	EUkwgk0ljjGAPlcHHPh+in6uXfLJRvLSSDC4/uKUmCm43Qi0qnFqiFnIZGdxn0rw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff6m2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:21 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898LG8U028126;
	Tue, 9 Sep 2025 08:44:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff6m2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5897F7DL017218;
	Tue, 9 Sep 2025 08:44:19 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gma0ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:19 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898iG7F27984442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:17 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 904A258064;
	Tue,  9 Sep 2025 08:44:16 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA36658057;
	Tue,  9 Sep 2025 08:44:15 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:15 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
Date: Tue,  9 Sep 2025 01:43:59 -0700
Message-ID: <20250909084402.1488456-8-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PkESaoz-E2p2MhWM9qOVaLpePKEPyF0q
X-Proofpoint-GUID: s8TfpuqcGpRrhqb8_SlImluWG2wzqr6P
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bfe8e5 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=mpe9e9lYSJgyPEw17A0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfXxpuOGWSv8Gb8
 VpM9Are73IV6MeXQnKsr2xrMECFpYDqYCn2EO0X82IrxHXp5ykXRr+6N5Hlk+V6wQr0TV65hbfH
 BncWUu/rLKNxbuaIEH+eAffQtVn6RaQkWrOyi8rDShet1sYHn1Qox+ySoxTXCBgibmdlbf7DcYw
 h2bxfUdDtlw/IEg60qlT9XaMU3+WkcjzRGnE1XPQIwGK1t6ME9B5ULWJlCzJe3dGWpx7z9kN0wS
 ej9Hmkg2VVeYKdkmcsfUXBMR4pg6EavvlmQzBm6ECIVYm3xIUxNyt+TtJA4pOG/t02GVigWeWER
 voxoF4FtA8yjuiXqwof+7CjEbC/Ky6UqDKZhKKFmCWqvhgDSnf2dGmU+DwaXHp6BdRuMgc0S3xd
 V3x3rEPu
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

The hypervisor signals the OS via a Hypervisor Pipe Event external
interrupt when data is available to be received from the pipe.
Then the OS  should call RTAS check-exception and provide the input
Event Mask as defined for the ‘ibm,hvpipe-msg-events’. In response,
check-exception will return an event log containing an Pipe Events
message. This message contains the source ID for which this
message is intended to and the pipe status such as whether the
payload is pending in the hypervisor or pipe to source is closed.

If there is any user space process waiting in the wait_queue for
the payload from this source ID, wake up that process which can
issue read() to obtain payload with ibm,receive-hvpipe-msg RTAS
or close FD if the pipe to source is closed.

The hypervisor has one pipe per partition for all sources and it
will not deliver another hvpipe event message until the partition
reads the payload for the previous hvpipe event. So if the source
ID is not found in the source list, issue the dummy
ibm,receive-hvpipe-msg RTAS so that pipe will not blocked.

Register hvpipe event source interrupt based on entries from
/proc/device-tree//event-sources/ibm,hvpipe-msg-events property.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 146 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 ++
 2 files changed, 155 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 4a1444a0d331..eb312594b1f0 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -22,6 +22,11 @@
 static DEFINE_SPINLOCK(hvpipe_src_list_lock);
 static LIST_HEAD(hvpipe_src_list);
 
+static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
+static struct workqueue_struct *papr_hvpipe_wq;
+static struct work_struct *papr_hvpipe_work;
+static int hvpipe_check_exception_token;
+
 /*
  * New PowerPC FW provides support for partitions and various
  * sources (Ex: remote hardware management console (HMC)) to
@@ -554,6 +559,117 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
 	return ret;
 }
 
+/*
+ * papr_hvpipe_work_fn - called to issue recv HVPIPE RTAS for
+ * sources that are not monitored by user space so that pipe
+ * will not be blocked.
+ */
+static void papr_hvpipe_work_fn(struct work_struct *work)
+{
+	hvpipe_rtas_recv_msg(NULL, 0);
+}
+
+/*
+ * HVPIPE event message IRQ handler.
+ * The hypervisor sends event IRQ if the partition has payload
+ * and generates another event only after payload is read with
+ * recv HVPIPE RTAS.
+ */
+static irqreturn_t hvpipe_event_interrupt(int irq, void *dev_id)
+{
+	struct hvpipe_event_buf *hvpipe_event;
+	struct pseries_errorlog *pseries_log;
+	struct hvpipe_source_info *src_info;
+	struct rtas_error_log *elog;
+	int rc;
+
+	rc = rtas_call(hvpipe_check_exception_token, 6, 1, NULL,
+		RTAS_VECTOR_EXTERNAL_INTERRUPT, virq_to_hw(irq),
+		RTAS_HVPIPE_MSG_EVENTS, 1, __pa(&hvpipe_ras_buf),
+		rtas_get_error_log_max());
+
+	if (rc != 0) {
+		pr_err_ratelimited("unexpected hvpipe-event-notification failed %d\n", rc);
+		return IRQ_HANDLED;
+	}
+
+	elog = (struct rtas_error_log *)hvpipe_ras_buf;
+	if (unlikely(rtas_error_type(elog) != RTAS_TYPE_HVPIPE)) {
+		pr_warn_ratelimited("Unexpected event type %d\n",
+				rtas_error_type(elog));
+		return IRQ_HANDLED;
+	}
+
+	pseries_log = get_pseries_errorlog(elog,
+				PSERIES_ELOG_SECT_ID_HVPIPE_EVENT);
+	hvpipe_event = (struct hvpipe_event_buf *)pseries_log->data;
+
+	/*
+	 * The hypervisor notifies partition when the payload is
+	 * available to read with recv HVPIPE RTAS and it will not
+	 * notify another event for any source until the previous
+	 * payload is read. Means the pipe is blocked in the
+	 * hypervisor until the payload is read.
+	 *
+	 * If the source is ready to accept payload and wakeup the
+	 * corresponding FD. Hold lock and update hvpipe_status
+	 * and this lock is needed in case the user space process
+	 * is in release FD instead of poll() so that release()
+	 * reads the payload to unblock pipe before closing FD.
+	 *
+	 * otherwise (means no other user process waiting for the
+	 * payload, issue recv HVPIPE RTAS (papr_hvpipe_work_fn())
+	 * to unblock pipe.
+	 */
+	spin_lock(&hvpipe_src_list_lock);
+	src_info = hvpipe_find_source(be32_to_cpu(hvpipe_event->srcID));
+	if (src_info) {
+		u32 flags = 0;
+
+		if (hvpipe_event->event_type & HVPIPE_LOST_CONNECTION)
+			flags = HVPIPE_LOST_CONNECTION;
+		else if (hvpipe_event->event_type & HVPIPE_MSG_AVAILABLE)
+			flags = HVPIPE_MSG_AVAILABLE;
+
+		src_info->hvpipe_status |= flags;
+		wake_up(&src_info->recv_wqh);
+		spin_unlock(&hvpipe_src_list_lock);
+	} else {
+		spin_unlock(&hvpipe_src_list_lock);
+		/*
+		 * user space is not waiting on this source. So
+		 * execute receive pipe RTAS so that pipe will not
+		 * be blocked.
+		 */
+		if (hvpipe_event->event_type & HVPIPE_MSG_AVAILABLE)
+			queue_work(papr_hvpipe_wq, papr_hvpipe_work);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int __init enable_hvpipe_IRQ(void)
+{
+	struct device_node *np;
+
+	hvpipe_check_exception_token = rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
+	if (hvpipe_check_exception_token  == RTAS_UNKNOWN_SERVICE)
+		return -ENODEV;
+
+	/* hvpipe events */
+	np = of_find_node_by_path("/event-sources/ibm,hvpipe-msg-events");
+	if (np != NULL) {
+		request_event_sources_irqs(np, hvpipe_event_interrupt,
+					"HPIPE_EVENT");
+		of_node_put(np);
+	} else {
+		pr_err("Can not enable hvpipe event IRQ\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static const struct file_operations papr_hvpipe_ops = {
 	.unlocked_ioctl	=	papr_hvpipe_dev_ioctl,
 };
@@ -576,12 +692,32 @@ static int __init papr_hvpipe_init(void)
 		!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
 		return -ENODEV;
 
-	ret = misc_register(&papr_hvpipe_dev);
-	if (ret) {
-		pr_err("misc-dev registration failed %d\n", ret);
-		return ret;
+	papr_hvpipe_work = kzalloc(sizeof(struct work_struct), GFP_ATOMIC);
+	if (!papr_hvpipe_work)
+		return -ENOMEM;
+
+	INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
+
+	papr_hvpipe_wq = alloc_ordered_workqueue("papr hvpipe workqueue", 0);
+	if (!papr_hvpipe_wq) {
+		ret = -ENOMEM;
+		goto out;
 	}
 
-	return 0;
+	ret = enable_hvpipe_IRQ();
+	if (!ret)
+		ret = misc_register(&papr_hvpipe_dev);
+
+	if (!ret) {
+		pr_info("hvpipe feature is enabled\n");
+		return 0;
+	}
+
+	pr_err("hvpipe feature is not enabled %d\n", ret);
+	destroy_workqueue(papr_hvpipe_wq);
+out:
+	kfree(papr_hvpipe_work);
+	papr_hvpipe_work = NULL;
+	return ret;
 }
 machine_device_initcall(pseries, papr_hvpipe_init);
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
index 125658e6b596..aab7f77e087d 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
@@ -19,4 +19,18 @@ struct hvpipe_source_info {
 	struct task_struct *tsk;
 };
 
+/*
+ * Source ID Format 0xCCRRQQQQ
+ * CC = indicating value is source type (ex: 0x02 for HMC)
+ * RR = 0x00 (reserved)
+ * QQQQ = 0x0000 – 0xFFFF indicating the source index indetifier
+ */
+struct hvpipe_event_buf {
+	__be32	srcID;		/* Source ID */
+	u8	event_type;	/* 0x01 for hvpipe message available */
+				/* from specified src ID */
+				/* 0x02 for loss of pipe connection */
+				/* with specified src ID */
+};
+
 #endif /* _PAPR_HVPIPE_H */
-- 
2.50.1


