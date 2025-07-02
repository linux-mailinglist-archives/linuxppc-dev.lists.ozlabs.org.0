Return-Path: <linuxppc-dev+bounces-10058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0EAF64E9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:16:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2n2F01z30WX;
	Thu,  3 Jul 2025 08:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494511;
	cv=none; b=V+0DyVz/P6MsgoKa+K1h4zaWRvaptifsjY6K81uBtU0diSA2JWIOZ2jT5pHMVkOFpOBqx9zpolgQunzdoVD+riwLR/AZDat6R/EE4yWg9Gf1/kTzPSdUsyZtkEzd1CLyPuis1O0aDtN6TfsgyCul9b2phlLJUlhCninFtdGVHuYxwPpkFLIpNUOlNDOXsPsUfp+jpQm7uWln2fobNndKOWoRA/Ix9K43t974cr2qFlh3CJ6XMFUI7qxOi7ajuc6subUUb76x1XXSG9DdlV8h3gtmvJ7v4dtMhPC6eJ43LOL7a7XbB64g+JoB495be0hWKbM5mgqMNj8m0JDkmXDuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494511; c=relaxed/relaxed;
	bh=JoqkHIaBWqdnpKB00x7QHt7zSKrxfTNnUtk4PLGAf0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkmtFD7TEktGYuUzA3O7mIJHEADUesc4UJpK0oQ0ACiQbvThBS5KtSD4CBtiNPXQmuWnpnOkeKqX64ZGCLUHTDb/D1c1wFNu/YVIb2UnU2vQpbJPL6eFIZnENtJQ6IdfkwAmr6pVUqCKHcQ8SGuH6Nao9EL+oZ8GxnocsMi2dmEs7EAz+japSWfXbpmjQ61e6h3WB9N45HRKhkWCXP+wumk2zhPkmWAktRFB5C+uolZ0FDOKWWgS2am9zzoCGGCpzzXUwz7y3IXkHx608CsC7e5KxS69IaDFnNweSKpsGTfcKtVRy8xMoiqMKQl3hf819kPFXmQvuajsJgzsXIy6yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P5BRU18P; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P5BRU18P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2j6f3bz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:08 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562GVC9l028490;
	Wed, 2 Jul 2025 22:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JoqkHI
	aBWqdnpKB00x7QHt7zSKrxfTNnUtk4PLGAf0U=; b=P5BRU18P3mMXvrLCuNOJZW
	BKpYCPsiWO/7Di/hX6Q4wiK1WrsR8S62NsGkmXCvNGxnFV6lFg8ivIEmXp9LMZIY
	fPKf4CjMEjScjw9LNU5jjdIZh+c8KDSoXETUWK/oyxYlfWvVtXZRjcQxrZ1tRJQk
	YPxEf4CiHUt18CdyPZc56QIGeWEUJDSTnnI7FPdZ3/bkWQU77xx9SmbNGQYhhmE1
	Vz0tW+nDaij7tSOHpfSQt7vAqSIgPqoyGrEeI0HOTZ4u3NFz5IqZALgLivKCUYyw
	e1kTBFGT5OdyVTgrRiznmB576iilJwmC66Sa5xPGlxeqYWOnJIhkBp0hQhJbmYpg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j83107eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:02 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562MF1vU026636;
	Wed, 2 Jul 2025 22:15:01 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j83107eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562IVFJQ012027;
	Wed, 2 Jul 2025 22:15:00 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47jv7n1pyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:00 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEwYB31720136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:58 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 133DC5805A;
	Wed,  2 Jul 2025 22:14:58 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A3E85803F;
	Wed,  2 Jul 2025 22:14:57 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:57 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
Date: Wed,  2 Jul 2025 15:14:41 -0700
Message-ID: <20250702221444.879256-8-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250702221444.879256-1-haren@linux.ibm.com>
References: <20250702221444.879256-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: aIlGS0LsxzNQDgCQtBLiJlP50LGV5G4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfX+NV4Q4RAeSWR 6iCXbqs7+rKN4KVsXUBDPvsgSPZkTiARFkuD2XHaBbAT/jWYPESkmxZOIMRj7XTO+dRW+LWU5mW cALyMuO83FQTEALznd47J3wiGq/bQDKARb58pndb5BMIOZy6gpvI5OpETGW5Nu/Y+N29/C0J8xF
 8aurR+b4JbetPmIfE97isAAU2bFZxWIl0vvy+y72skukggeploPzTv2cfKzb0aWM8vMzlkh8kGQ Q/4Kv1Jx0mRm6d7rH7F6zbyA172ovImyf1DB4sHSFFeReOTXm6dVtt6swDoD8kkSFUghCfhz2om KSXRGqqm8a88WDu6FOqR3qmbXznj5zpIr1HdBQZfTJDjWQgrqRNcqfHSbMo+S0syECs1KsRuhs3
 HYmiBTXwmq8jwtWGHxgO6RTrKohnLpNu00AU6H+6LqhKAAIQFeafoHKkxBC1JLbv9hM5vj7w
X-Authority-Analysis: v=2.4 cv=MOlgmNZl c=1 sm=1 tr=0 ts=6865af66 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=mpe9e9lYSJgyPEw17A0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3VdYUPrI0NmnpyZbzLDoHS5L3yLC1u9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=665 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
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


