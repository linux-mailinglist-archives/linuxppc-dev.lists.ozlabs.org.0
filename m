Return-Path: <linuxppc-dev+bounces-10528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D2B18A7D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 04:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bv6Xm5Lzkz30Wg;
	Sat,  2 Aug 2025 12:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754102520;
	cv=none; b=L4yTfNLYcGD/QEWzSybvNiZ47H1jSt7gBzZhHaA7f4UFtnvzWVLYCiPNsDwptAju1/neq1OWEgTKq1f4TijcLt1EBQUjCqJ1R9p8euLyqddhU2j2kGaTVatJY93dKuMAbDf1w1754Ag5A/kBCi3MkOgbFP3372bgH4PJWkwedmeRfuK6G122annC5ySQCYAvWHWhXDzA2DQXPcVjO5Qym6y1FXuhhl+Wj6dbZcSd38v5DAloIi3IRxZzoawuUgoMYHKcbN/X8YvExd09Bs3tIL1JtRYdKbauTtgSayZ2E2/uG1BUbVd+sgELJPlAcocuAwH12w37s4uh4Fv74epnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754102520; c=relaxed/relaxed;
	bh=JoqkHIaBWqdnpKB00x7QHt7zSKrxfTNnUtk4PLGAf0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CD4Ng4o+ERqPJFMxUV3iJ8Ks9/7KyDR2Ap9jI4BbVx+6qO5QXpVLuue3Mfe2UtqCvt7R75g+F/Z1f1rq7XDapgJLphC5eaUfT0gh5SXfbseSvJt3BcQE8r40arEsQlhVLnAVdeYJIIEog2oT6eGpK2xP1OsJJlhpdIrI3HjoNwWaHx3yIMy+SYDRZgdvmNwfGvnb5lBUK+FvJRqcyXmbjV4mkDBXx0DemoC7NRM/s4QUBrtFw28twXqy2UawgvH3sXvBoQ3W2aRUdLg0FV7ttrmf0eaxYLgSlynivW19ni4ZlMzC9FeeKTc9k2/QzrHpj7z8dZ9A9desu1JbBGczSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iD/+xiLj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iD/+xiLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bv6Xm0P3tz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 12:41:59 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5721Wiom026219;
	Sat, 2 Aug 2025 02:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JoqkHI
	aBWqdnpKB00x7QHt7zSKrxfTNnUtk4PLGAf0U=; b=iD/+xiLjh+kt/LcHHL9alI
	58HM7NU1z0DyGTzNuNereA9BlhKtwD23O59OttSLyW6pU1WmvH9H3IcfsjlyK7jr
	EX6TpUB0GPJPaNxXTM9Fe62DlVAqSkuyQblk86oiLXmPwkUj4ElspbQwbK1mV7dS
	MEjwQuFqxp/neKDdG25XvLD0A/g2NMGGYa3bl6Qad7ALRcWCGsRH4HJLLcW2x1wY
	fJe1GRzxNrkvF/qlyq8JyXRow1EBcfJiuq98CSNEON2KKEbdvKV/C58aUfYOcLaQ
	aeuN/P2GjphjX4QK8PkYogKxN9iVQiw6lWwH9ekKthawKWnn7pt9W7w2YPXkON8A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48993p04dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571LlJUA017959;
	Sat, 2 Aug 2025 02:41:50 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4859bu47mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:50 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5722feUS30409322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Aug 2025 02:41:40 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 475C858055;
	Sat,  2 Aug 2025 02:41:47 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5500A58059;
	Sat,  2 Aug 2025 02:41:46 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.171.135])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Aug 2025 02:41:46 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        haren@linux.ibm.com
Subject: [PATCH 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
Date: Fri,  1 Aug 2025 19:41:17 -0700
Message-ID: <20250802024121.955274-8-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5ZjNw1oeEUqpyu_rP6jksT8KfgbUASmI
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=688d7aef cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=mpe9e9lYSJgyPEw17A0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5ZjNw1oeEUqpyu_rP6jksT8KfgbUASmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDAxOCBTYWx0ZWRfX2imhcjTfV/2T
 ZjBtGnc6aQrD848sRxxSyjphyep2MeDqBvKWMdX08e+gc1vMPhyyWfJdWGmEiqjZFcoNm1GPk0s
 8YS5Rp9zZuraJk06c7lMUrwFycnL8ukDWhy8nrjzLBkb8BXOFyMi+PsVC0Pype5MF/ezuQ+9XKH
 wuyUjTsOvbzK1ZR0/4OpsNe7cLmOUgu8BUgxv21JR7a0a3U9vBXKLKvdUs75LaDEt425syRmekt
 kSp9/693/yAb6r22nPH7AjBVEaZOoXsy+w8ab6uTRV07jT7L8gMwFzb7c5IA+tPmerp4WofYahR
 ujX+kgvkTAPI3Ne0huiaWiTquqK/0IXbGCy6PLT9VLeGPCYgebGjp/t4rFOLR+aJcvnFgW3G4zs
 ZbBEsu61Dh8cqTzRTA9K1Qt1dUnfVA8w7ZGlZ2HXAht/fb6hl0+UMRIOIVu115HbuEzMERpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=657 mlxscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020018
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
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 144 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 ++
 2 files changed, 153 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index b283837dcefc..ebccd6a70ab6 100644
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
@@ -545,6 +550,117 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
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
@@ -567,12 +683,30 @@ static int __init papr_hvpipe_init(void)
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
+	if (!enable_hvpipe_IRQ()) {
+		ret = misc_register(&papr_hvpipe_dev);
+		if (!ret) {
+			pr_info("hvpipe feature is enabled\n");
+			return 0;
+		} else
+			pr_err("misc-dev registration failed %d\n", ret);
+	}
+
+	destroy_workqueue(papr_hvpipe_wq);
+out:
+	kfree(papr_hvpipe_work);
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
2.43.5


