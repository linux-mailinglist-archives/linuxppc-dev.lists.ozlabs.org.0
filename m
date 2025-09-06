Return-Path: <linuxppc-dev+bounces-11819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C5B46ACA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 12:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJpzF6RCTz3000;
	Sat,  6 Sep 2025 20:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757153801;
	cv=none; b=fphd8BA21p109u//YN/qOIgD+lOyAOjMDDA1V6wrAdiW5pMsYM4YCKJExU3S2jkGGb22Qtg+F8sNRlOebkjAFN9BB53kL3mUu/SJqS8VGAnuIvkvjTs5lbedyFpDQQjaHBTkhRdlDIoIf7cx3emxqyz4QugdktOASKcnnybFearSRdPvATMTjGM5K0MIr0QCnB55h0Md6zDNNUOJJ6sm9MUdCOF3Q9NK/SLt5NHjCfAK7t5KfAG4lcWTm/sKJtmu1L/cnGGiorQ7ZC9E8fk1NB/ZNqK5QOTHGWr+Y9KJxskk8Q8qDhr68THCDP9r+fwg7WQK+99vbLRGI53rhzF8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757153801; c=relaxed/relaxed;
	bh=RKLWDG+x8riVZY9f5OAkModmhocsPVa8mv/97WHvUJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWXxE64CULKp5LKrKVvvQ/HclFXMYoqU71Zxsk12lzyQjqlSwHLdU9vIqI2j6bvTrEM9vLLcWA6tebK6e0GkxK9pl/qogtyI9Ru66vwHQV2zDjpak6bHHDnDFUUXusX3pUSx6Hj1QCd7Fn+U4I9pgRyFmhkTM4eAwEN1ch2I2AXV+IZG5cLIskoxB1P23nMX7iVNoBxY3l/1IVZXzCDBjgJ6lB8cewbnCFZSs/Fx1w70bftTvO2jTz2gzwUn1n0yUtR6N6rxacWyQuL3P4PLkoaKGdjkGcXtxpQZk5jjqpYYw8VSPabUFd1WfU5XukkRO1qNzHIl1XbTJFVQG+IjRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HS++y1j2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HS++y1j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJpzD5Lg3z2xMV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 20:16:40 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5866fcVF003486;
	Sat, 6 Sep 2025 10:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RKLWDG
	+x8riVZY9f5OAkModmhocsPVa8mv/97WHvUJA=; b=HS++y1j2+BTDrQEoxjgZC3
	JaQ70WiaiGALv1QA/+fpa+3DPExZ/M6Ga1rWchseZDkyP+2AWXcA1CwlMMqOJKni
	AL3G2TbqKKKEoBfp7+Rtg8cvp1E6TqlnL4volLJqg8x1Iec4lYKarLhcfNuATzcM
	Cg4st3OJDl6pM9iOlV1LoBsNdIMCnXXwyAPmURPdZLUHSHmtPfpIH3mJ/QXl9aN6
	2ODaRRMpgi/jG3FIPulgDLTebYbG3H3zfe5HaOLX7qck0DaK7isLTWDGODqD/+z4
	SnWZxzKes8vEP4P183lDvcEbGu09r4dnLqJ2q5VPk2I5UiiyeWUTVyj3UnIfnE1w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqhdtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:16:31 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586AGVIr020495;
	Sat, 6 Sep 2025 10:16:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqhdts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:16:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58697PBQ009000;
	Sat, 6 Sep 2025 10:16:30 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vdumw8ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:16:30 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586AGSLg27329164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 10:16:28 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 086B858059;
	Sat,  6 Sep 2025 10:16:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F4FE58058;
	Sat,  6 Sep 2025 10:16:24 +0000 (GMT)
Received: from [9.43.107.45] (unknown [9.43.107.45])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 10:16:23 +0000 (GMT)
Message-ID: <4b4a2e75-7419-4bdf-99e8-97661748314b@linux.ibm.com>
Date: Sat, 6 Sep 2025 15:46:22 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250830060343.2656729-1-haren@linux.ibm.com>
 <20250830060343.2656729-8-haren@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250830060343.2656729-8-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xAZj1EfnxvPvMPfK6Yw3hK6cOcIMYS0r
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68bc09ff cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=kLfI43b9UdWR_dnTQJYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nS8m5KWSEgzsOS_dTZHAnoURnCWnXX0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX9jS2EReTcOX7
 oakZPVjL2eD68ZKZZvfh1vglZ7e3xR3k7uptkS0hHUTjllyx9NtkwD+VAPJj83XAGcozIX/f3Vw
 e0DV0wv/bdRE3sQqSxEv1uHzC1BGM5HYB0oWpJ+H/8V5xEaf2Nwr3fiYJe7e7CrX0vurgO0X5Or
 wzvkn+qfCr2+HP0E0ZMZ4LLDEBAy4bfwGEM1g86DlbnGwZi5YJRkL0P7L1eDG/Wvi6ENP0mBECP
 t7qNFbOVFMeZDTofuLDfvgIv2zbBCbUlX2UZ80sd1KcvEMkOqShgCmd8UuKRA8mkoHm+vPJ39CX
 AIX0LMgax/giNQ+3s1dwelH2gL2Yhe2E3YyZcQRIidF8bS/JMWYDbdQgc/Lsu1FK/kLq3cYokdl
 CKCKTsfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/30/25 11:33 AM, Haren Myneni wrote:
> The hypervisor signals the OS via a Hypervisor Pipe Event external
> interrupt when data is available to be received from the pipe.
> Then the OS  should call RTAS check-exception and provide the input
> Event Mask as defined for the ‘ibm,hvpipe-msg-events’. In response,
> check-exception will return an event log containing an Pipe Events
> message. This message contains the source ID for which this
> message is intended to and the pipe status such as whether the
> payload is pending in the hypervisor or pipe to source is closed.
> 
> If there is any user space process waiting in the wait_queue for
> the payload from this source ID, wake up that process which can
> issue read() to obtain payload with ibm,receive-hvpipe-msg RTAS
> or close FD if the pipe to source is closed.
> 
> The hypervisor has one pipe per partition for all sources and it
> will not deliver another hvpipe event message until the partition
> reads the payload for the previous hvpipe event. So if the source
> ID is not found in the source list, issue the dummy
> ibm,receive-hvpipe-msg RTAS so that pipe will not blocked.
> 
> Register hvpipe event source interrupt based on entries from
> /proc/device-tree//event-sources/ibm,hvpipe-msg-events property.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr-hvpipe.c | 146 ++++++++++++++++++-
>  arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 ++
>  2 files changed, 155 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> index 1e7636c0b275..0969efb39d95 100644
> --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> @@ -22,6 +22,11 @@
>  static DEFINE_SPINLOCK(hvpipe_src_list_lock);
>  static LIST_HEAD(hvpipe_src_list);
>  
> +static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
> +static struct workqueue_struct *papr_hvpipe_wq;
> +static struct work_struct *papr_hvpipe_work = NULL;
> +static int hvpipe_check_exception_token;
> +

checkpatch.pl is not happy, reporting these errors 


ERROR: do not initialise statics to NULL
#53: FILE: arch/powerpc/platforms/pseries/papr-hvpipe.c:27:
+static struct work_struct *papr_hvpipe_work = NULL;

WARNING: else is not generally useful after a break or return
#205: FILE: arch/powerpc/platforms/pseries/papr-hvpipe.c:716:
+		return 0;
+	} else

total: 1 errors, 1 warnings, 183 lines checked




>  /*
>   * New PowerPC FW provides support for partitions and various
>   * sources (Ex: remote hardware management console (HMC)) to
> @@ -556,6 +561,117 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
>  	return ret;
>  }
>  
> +/*
> + * papr_hvpipe_work_fn - called to issue recv HVPIPE RTAS for
> + * sources that are not monitored by user space so that pipe
> + * will not be blocked.
> + */
> +static void papr_hvpipe_work_fn(struct work_struct *work)
> +{
> +	hvpipe_rtas_recv_msg(NULL, 0);
> +}
> +
> +/*
> + * HVPIPE event message IRQ handler.
> + * The hypervisor sends event IRQ if the partition has payload
> + * and generates another event only after payload is read with
> + * recv HVPIPE RTAS.
> + */
> +static irqreturn_t hvpipe_event_interrupt(int irq, void *dev_id)
> +{
> +	struct hvpipe_event_buf *hvpipe_event;
> +	struct pseries_errorlog *pseries_log;
> +	struct hvpipe_source_info *src_info;
> +	struct rtas_error_log *elog;
> +	int rc;
> +
> +	rc = rtas_call(hvpipe_check_exception_token, 6, 1, NULL,
> +		RTAS_VECTOR_EXTERNAL_INTERRUPT, virq_to_hw(irq),
> +		RTAS_HVPIPE_MSG_EVENTS, 1, __pa(&hvpipe_ras_buf),
> +		rtas_get_error_log_max());
> +
> +	if (rc != 0) {
> +		pr_err_ratelimited("unexpected hvpipe-event-notification failed %d\n", rc);
> +		return IRQ_HANDLED;
> +	}
> +
> +	elog = (struct rtas_error_log *)hvpipe_ras_buf;
> +	if (unlikely(rtas_error_type(elog) != RTAS_TYPE_HVPIPE)) {
> +		pr_warn_ratelimited("Unexpected event type %d\n",
> +				rtas_error_type(elog));
> +		return IRQ_HANDLED;
> +	}
> +
> +	pseries_log = get_pseries_errorlog(elog,
> +				PSERIES_ELOG_SECT_ID_HVPIPE_EVENT);
> +	hvpipe_event = (struct hvpipe_event_buf *)pseries_log->data;
> +
> +	/*
> +	 * The hypervisor notifies partition when the payload is
> +	 * available to read with recv HVPIPE RTAS and it will not
> +	 * notify another event for any source until the previous
> +	 * payload is read. Means the pipe is blocked in the
> +	 * hypervisor until the payload is read.
> +	 *
> +	 * If the source is ready to accept payload and wakeup the
> +	 * corresponding FD. Hold lock and update hvpipe_status
> +	 * and this lock is needed in case the user space process
> +	 * is in release FD instead of poll() so that release()
> +	 * reads the payload to unblock pipe before closing FD.
> +	 *
> +	 * otherwise (means no other user process waiting for the
> +	 * payload, issue recv HVPIPE RTAS (papr_hvpipe_work_fn())
> +	 * to unblock pipe.
> +	 */
> +	spin_lock(&hvpipe_src_list_lock);
> +	src_info = hvpipe_find_source(be32_to_cpu(hvpipe_event->srcID));
> +	if (src_info) {
> +		u32 flags = 0;
> +
> +		if (hvpipe_event->event_type & HVPIPE_LOST_CONNECTION)
> +			flags = HVPIPE_LOST_CONNECTION;
> +		else if (hvpipe_event->event_type & HVPIPE_MSG_AVAILABLE)
> +			flags = HVPIPE_MSG_AVAILABLE;
> +
> +		src_info->hvpipe_status |= flags;
> +		wake_up(&src_info->recv_wqh);
> +		spin_unlock(&hvpipe_src_list_lock);
> +	} else {
> +		spin_unlock(&hvpipe_src_list_lock);
> +		/*
> +		 * user space is not waiting on this source. So
> +		 * execute receive pipe RTAS so that pipe will not
> +		 * be blocked.
> +		 */
> +		if (hvpipe_event->event_type & HVPIPE_MSG_AVAILABLE)
> +			queue_work(papr_hvpipe_wq, papr_hvpipe_work);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init enable_hvpipe_IRQ(void)
> +{
> +	struct device_node *np;
> +
> +	hvpipe_check_exception_token = rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
> +	if (hvpipe_check_exception_token  == RTAS_UNKNOWN_SERVICE)
> +		return -ENODEV;
> +
> +	/* hvpipe events */
> +	np = of_find_node_by_path("/event-sources/ibm,hvpipe-msg-events");
> +	if (np != NULL) {
> +		request_event_sources_irqs(np, hvpipe_event_interrupt,
> +					"HPIPE_EVENT");
> +		of_node_put(np);
> +	} else {
> +		pr_err("Can not enable hvpipe event IRQ\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct file_operations papr_hvpipe_ops = {
>  	.unlocked_ioctl	=	papr_hvpipe_dev_ioctl,
>  };
> @@ -578,12 +694,32 @@ static int __init papr_hvpipe_init(void)
>  		!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
>  		return -ENODEV;
>  
> -	ret = misc_register(&papr_hvpipe_dev);
> -	if (ret) {
> -		pr_err("misc-dev registration failed %d\n", ret);
> -		return ret;
> +	papr_hvpipe_work = kzalloc(sizeof(struct work_struct), GFP_ATOMIC);
> +	if (!papr_hvpipe_work)
> +		return -ENOMEM;
> +
> +	INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
> +
> +	papr_hvpipe_wq = alloc_ordered_workqueue("papr hvpipe workqueue", 0);
> +	if (!papr_hvpipe_wq) {
> +		ret = -ENOMEM;
> +		goto out;
>  	}
>  
> -	return 0;
> +	ret = enable_hvpipe_IRQ();
> +	if (!ret)
> +		ret = misc_register(&papr_hvpipe_dev);
> +
> +	if (!ret) {
> +		pr_info("hvpipe feature is enabled\n");
> +		return 0;
> +	} else
> +		pr_err("hvpipe feature is not enabled %d\n", ret);
> +
> +	destroy_workqueue(papr_hvpipe_wq);
> +out:
> +	kfree(papr_hvpipe_work);
> +	papr_hvpipe_work = NULL;
> +	return ret;
>  }
>  machine_device_initcall(pseries, papr_hvpipe_init);
> diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> index 125658e6b596..aab7f77e087d 100644
> --- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
> +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> @@ -19,4 +19,18 @@ struct hvpipe_source_info {
>  	struct task_struct *tsk;
>  };
>  
> +/*
> + * Source ID Format 0xCCRRQQQQ
> + * CC = indicating value is source type (ex: 0x02 for HMC)
> + * RR = 0x00 (reserved)
> + * QQQQ = 0x0000 – 0xFFFF indicating the source index indetifier
> + */
> +struct hvpipe_event_buf {
> +	__be32	srcID;		/* Source ID */
> +	u8	event_type;	/* 0x01 for hvpipe message available */
> +				/* from specified src ID */
> +				/* 0x02 for loss of pipe connection */
> +				/* with specified src ID */
> +};
> +
>  #endif /* _PAPR_HVPIPE_H */


