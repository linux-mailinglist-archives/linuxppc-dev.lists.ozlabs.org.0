Return-Path: <linuxppc-dev+bounces-11830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C919B47301
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:54:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyS10DvYz3ckl;
	Sun,  7 Sep 2025 01:53:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174016;
	cv=none; b=Pz8lzNXgux8KYwEakkoKeBOwVRH9xKjbBy796JawRYlnf4dFooVxigLIMNtFNJ6lklOHX1+z6UA7JxmlrosoQ3a1AuHIPchxMImtZ7Oi/Fo6fvfk8rcDh3gmmu+bI+xoMQXqMYssHTYWhtxQdJSjYuZ9KwdImG8RoyCUbB3rM+YkVEemae3nQBPTo4b9zhgc3pCg2JZ5Nzc8jc8qtCswds+ux3Wp3MjKDO/7msxHQJwqvGT2Y5/k0eqIMSIuyV15D5/E6+FGXmkFRF1tEr6xXTfZDUnc3LwQGRzcUKJKUKZK+o2oCRZRDWSDAi8mZTscuy42EH+oIX6CF7mQH3NODg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174016; c=relaxed/relaxed;
	bh=oXU4rKfY7WgmFsq6nDvjAzK6oJ+QDD/E5mgl93KU4OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dKhSq+YUDwephSHcc8s0LMjIbsYtictHzF1n9fMbSLNHMeQuYa3jglLaBjK9dOf0IgrvAkjpCDFntbhcJgNZG9+rO6ZRw8JVYqWVa9Qaq/4atc9TwQQJp7HeOKDoZ2IAOnT+hkkbwZ6v/80Fixx3qzR4PGPDPWHTXeTgdvvIenovJOADZQxz0io7oSR24hSK9SHnjiwc99nfS7zAx56Z+EzwJKWmOtiKs+r1DMPHpGqRmVI7V0/HJiKRKz8PYBoTCppOcuAMfbgO6TjKeT5BQWk2JVF0fixb4QReym8YbMYjBI7Q2V/dPRJOVLM139hmC2RN/H0v8rAs3op1ah8BgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a5l23+Kc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a5l23+Kc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyS02yPQz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:36 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586EMi8b015918;
	Sat, 6 Sep 2025 15:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oXU4rK
	fY7WgmFsq6nDvjAzK6oJ+QDD/E5mgl93KU4OM=; b=a5l23+KcbkXk2P/JD9PqdC
	FC4iHE61Lvd9Qy1G08u1ItIlA7mkoixYk/pvyhRfCN0jP7UXglA0BLv+mCTvFS69
	1pLl9J7Tl7PCYD85WSiDhF/AsxP7eW086rUdE0vLePOeP9qQJ6N5ihbFS6Pxc6vE
	+dAeaUwEB3MdvRP3WdD6oV4FnzUYg2RVFRVk3pTToNxwapQDOPUC3p7CyGebzSvE
	LfCOZThvhFpMxWZ4OZ9o7VQ3yzQNyIFS5g0cmSJ3ytswrwMoJYd1d/5UQxeW3fs6
	MIZW/2XHAZ6K0zrZC96IgbTEr1/VUkRtatj91P7pSzyrWG1sS4hf/dPTjrZU/Yyw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586FrRWG010857;
	Sat, 6 Sep 2025 15:53:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9w8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586DFXgR021202;
	Sat, 6 Sep 2025 15:53:26 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmq69jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:26 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrMO421889672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:22 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43AA25803F;
	Sat,  6 Sep 2025 15:53:22 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67ED75805A;
	Sat,  6 Sep 2025 15:53:21 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:21 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
Date: Sat,  6 Sep 2025 08:53:05 -0700
Message-ID: <20250906155308.705926-8-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t8JbWyLXKTsNKxpxd2j4Pu1b3RCVbf3p
X-Proofpoint-ORIG-GUID: VszcCXHiu4geriadb4G-C2QBS15pMdZM
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68bc58f8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=mpe9e9lYSJgyPEw17A0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX1xTHosz8eUDp
 90/y3RvnhHRIPUoLYUJxJk+lgrDetLwtOoDOAxc6JY0ewGCdofAZxsWMlLAQ9beolof40za0rsR
 lkZxLFbOOU3jPffSh3TQzFSv5bMpCuI00I2hddYalEFU8VVzzKiWm9oD+8vW/8D0AwLIz/EtZJN
 Eg4TeAb03tVk6wmwZrJhnG7ZVbP/DBzjICIQeGS4yBoehuOkpnUGzjSKs+azDcLzxbk5zLE4RY7
 i2u9RY2Jyfh7RV5uikj0jeSUOzeJqDO63Z3+iSW7dciNyEnbDvlJ/5Jq0Cy6/1lD3ET1uIZ/wmv
 AN+N2JRRzE6NgBcJLziBysNXalguZwYiTKRUP1uwwUP4JPBgFMYkthQLOu1tbqx8cN7odzSw0pY
 3/ZgoFqi
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
index 1e7636c0b275..fb4234c0335b 100644
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


