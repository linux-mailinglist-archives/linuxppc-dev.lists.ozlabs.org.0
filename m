Return-Path: <linuxppc-dev+bounces-11452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FFBB3AE21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXm14mFz2ytV;
	Fri, 29 Aug 2025 09:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422552;
	cv=none; b=NlmV9GvwfXiz7xyQWws/cE1zZzbWJcaS9SZrHUDI/0rIUUK5NgJvQ5luqfGwGjmUXcVOi/XqM5ZaGMxKnOO+ugrZyLuVOstDDBaMJ2WECm0QILUN7NFHoG8qCMJ4oGDUFfP1u/+mlhlHmVYMtfn6lWDqgxnnO+2yLyPNcwXy/h7N243uAKyvEXdu+y4DnxwEzvjHQapH+Zvq1Ll27bemBj5f/dAHTxUGvd76zaXVF0L80+pp4jtXhJqXiIHzBJdm0Bj3AELj1k7pF+se3zCbfPqVKxHyYqrjAMc+HlAsW3TRLL6OJySCQDigu+fhuyRYz2KT8W2S/2x2OOQ4A4Qtww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422552; c=relaxed/relaxed;
	bh=T4xRVLGUUTDpaoC8uGdT1PnR2qdtuA39VepBY44SrF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmWyPGTs/rpLUBREdImLQPwWdbRUgPYsHx3g20DoHz0frLuX6/foscMP+KeYAXXIgiMG50xN+unvpUbx8KohgLk1QJHtO0eXry8n7kpDLXGhhR/Rh4wPXLXM3tfvx15Kl2ykP7zOm9w0WpzUwhvG182WdwGL/r4o/1xOn4Am1N34fu1M2B6hGfo2pwSe+CxSEfafqImyDwD85XqVYe7TRzyEPe8rZ/ZF64r43r71eZ1Wbk56PswZb93BH1emGPmuxoeILiHbg+t4rrPA+ct78S2bDgnC1l9DjapeB2WbHYXGDWex84HuzZpkg3IqRwtu+tkHUd4ed76HFhTHIZGIcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q3OPINaQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q3OPINaQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXl2nX0z2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:11 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHK2Up002846;
	Thu, 28 Aug 2025 23:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=T4xRVL
	GUUTDpaoC8uGdT1PnR2qdtuA39VepBY44SrF8=; b=q3OPINaQZv3o/rOTfVVZRC
	d27miLkusnPGXf45m7d9l+9OUAG2WnrB1hu1H2eq/n+fGe0zzIxM1etjizmE+Rkz
	RT62FNbi7J4SVePhODIddECkS2TMZik4N0mznrrcDKvz1IF6UYmbExvQBVM5Gu9v
	IIq0/miTHlqNBeAUtekWLzFfX4pVcI2lYTvIhX4cp8nYJMeQRQrJlCVOwG2ySlgE
	0uVGWjc9/s1/2sruIvQp0Q4YJrzXGxGifWKLiupMadfRrHTyJCe1ZGTD3Bgd6jVt
	VcPNgTvDRaImap4bknifWCIwu+D5vnBYrWeoTNxdpr/HB1YuiNvQ2lv2uCqo2Y1A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqcddv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:03 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN93wS012682;
	Thu, 28 Aug 2025 23:09:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqcddt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLW72k029871;
	Thu, 28 Aug 2025 23:09:02 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmy68w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:02 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN8xFh8127420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:08:59 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C830C58068;
	Thu, 28 Aug 2025 23:08:59 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F14B458061;
	Thu, 28 Aug 2025 23:08:58 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:08:58 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
Date: Thu, 28 Aug 2025 16:08:41 -0700
Message-ID: <20250828230845.2291249-8-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXz8QhhHJcls7w
 HleUWNHfxeJ1qpAJkEj3gP6PXCjuZF8jWT1D/HB836cBjw2h4Qj5wZi4op6cIQ/h1vNqWKVtIDV
 TzyYWsbNtQmATG9Djlyg9UYuhgQkvA23BTi69Qmipr8Jk7XV8OOCJmLZ6Y116dzOz8CjGfjcZ2X
 2oCEEEzNN+f5lDOxzwxpFyD2IFnSFgaTHUTt6zdfq8zdVMRriMtyiSNHxjVp/MIG9LGyzZOQw4b
 sLFYgyt2TVzRsh3Tw7mQH057syBFIcQ8MlA1RgIOAnPuKa8uzU24SPWNpEvaj2brvdAxjHsfGF2
 qf/s4nicEpKa2UTqfxKiPjw0xdBIwgm1+nfJCB+Nl/g487BpL65SKIDg1T6iDLgg5wviSOG6ccL
 9Em5VWc0
X-Proofpoint-ORIG-GUID: 4JXP5x67bBeI2a-ppOGZNEGfSKXdR_6Q
X-Proofpoint-GUID: s8oK4upEA-DDCLN99MQv94KetHAmQfB5
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b0e18f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=mpe9e9lYSJgyPEw17A0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
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
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 146 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 ++
 2 files changed, 155 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 1e7636c0b275..0969efb39d95 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -22,6 +22,11 @@
 static DEFINE_SPINLOCK(hvpipe_src_list_lock);
 static LIST_HEAD(hvpipe_src_list);
 
+static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
+static struct workqueue_struct *papr_hvpipe_wq;
+static struct work_struct *papr_hvpipe_work = NULL;
+static int hvpipe_check_exception_token;
+
 /*
  * New PowerPC FW provides support for partitions and various
  * sources (Ex: remote hardware management console (HMC)) to
@@ -556,6 +561,117 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
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
@@ -578,12 +694,32 @@ static int __init papr_hvpipe_init(void)
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
+	} else
+		pr_err("hvpipe feature is not enabled %d\n", ret);
+
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


