Return-Path: <linuxppc-dev+bounces-11821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63FB47205
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJxpg1Zltz3bqP;
	Sun,  7 Sep 2025 01:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757172283;
	cv=none; b=ZxwLmy/tamOJlNiC0SUiqgqwivY9hI/TV4lSnA6FOr84NcMPMuq/Tjv+T430KTnjaS9jqlAnRfA4vipk5kUW3jMOuh7DjiJhpU9TMV/2/hSQ41viaHuo1bZfvX35LrBseP4F7wSvkuhjU5A1omvlzJ8NdkruTuMqbejPJVYuF6uwW1JpXBv+LBKqYkqEKUXD4SKCAb0vfo2iV8DMz+/R3wgpYl/2vyY3ofGajo9SBg94T9Kr1Nd1rBucSWGXNeBQJMUARPNIYeylGa9Od8sXQx5I7/2W3U2ibkNTHJm8R8ZrNB6Kgv7htK8Wcp+7BkNm7gikEk/PsNx08kJu3ZFGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757172283; c=relaxed/relaxed;
	bh=XoFsMPgn8EkMHU9tL0tYLpLHS9NMvFQzwCYqPbHjloU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W1vl7xQp5lmB16gA51vzBsLtIM/nhHrYUD7bAMolEnMh+P4w3c5n8cEc3ZtK/z0wGeRkVWPpbf9UxIUyHP2djMHhAhcXwLi5DJaH+Caypvmsr9AcJrT80cm5mT+Wdsb5mWbt5ccjuB4MLrV7Csbg+AwE5dnT8PO5zHBrnNpfIrf3olOFgXuhr+0OG+F4Kye2uL2+enfGq0Zoav860pTFxaqFWvc7pi7ORGFZjYQAwrdhLfUqE9oMcZ7/WmA7U/yXgdm/9u4rKETxMhUItu4q1WorpIqjNwWkGYy9joHS+rXz2CC9qZzHmQsln2onM/1KQ2w0WIRzNXk2eYaVVuiW9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V10VpDIP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V10VpDIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJxpd3p2Qz2yqv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:24:40 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586C04i6029504;
	Sat, 6 Sep 2025 15:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XoFsMP
	gn8EkMHU9tL0tYLpLHS9NMvFQzwCYqPbHjloU=; b=V10VpDIPM37T4/tO0ARekP
	QA+otBlUH5SpHtqddKcGGHNvudxP3iVAraN0hUrqaCe59+ezUGlTnqEBEB8njJLz
	/solNiH+xApsveAuSA+jfHkDaASSXmx0OyYvVumAD+Q9YgdFFFtpMcocTjVxY4AS
	CSt752KmbLhnED0vcOpGvSnVkr0sDaFtgg5YLI+h/Kcl0d6H3EXGEDJYGKS4hZUT
	PqYxFXCy8thoUFCdXCJ7+HmJgN3Kl0T72jW5IpkjlW7u7cYuWCMhI1A0iH4Cw8Zv
	s4kdQPJMTa1+rFkOuy0hrkNzVG2BwfJt/7na0kwMzvyIX3FF33Rj56d9GKgnJMgg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490fgd9bch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:24:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586FLYkb001993;
	Sat, 6 Sep 2025 15:24:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490fgd9bcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:24:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586E1A8a021150;
	Sat, 6 Sep 2025 15:24:30 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmq67eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:24:30 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FORO333030508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:24:27 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A92358055;
	Sat,  6 Sep 2025 15:24:27 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4814B5804B;
	Sat,  6 Sep 2025 15:24:26 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:24:26 +0000 (GMT)
Message-ID: <70f6a171b1e365fcce85607c7b96a03a904246ee.camel@linux.ibm.com>
Subject: Re: [PATCH v4 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
From: Haren Myneni <haren@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Date: Sat, 06 Sep 2025 08:24:25 -0700
In-Reply-To: <4b4a2e75-7419-4bdf-99e8-97661748314b@linux.ibm.com>
References: <20250830060343.2656729-1-haren@linux.ibm.com>
	 <20250830060343.2656729-8-haren@linux.ibm.com>
	 <4b4a2e75-7419-4bdf-99e8-97661748314b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G18ygnwwPVfp_R5Mh8HTsbWxrMMNFxNh
X-Proofpoint-ORIG-GUID: zg5RgVpYhoRPTZcbEyFWHKvh7pVGGESs
X-Authority-Analysis: v=2.4 cv=b+2y4sGx c=1 sm=1 tr=0 ts=68bc5230 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=Z2dOY3r18TDtTMueBHEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDA1MCBTYWx0ZWRfX6UB5B0PmY8ci
 LijDrjvGh0QShZ9u8qjCwXDlNI9hPWWA2h5fDzKobjRZv7bDgrEoi4/dT056bKEy8eTlDMaBnYb
 qFc+GycjBxE54DxqoLUdwXIaWSOEyIzyGNq/2yL8rpfvzctftf93pIlZB1OvbS5Oi2onEqGuJ19
 qWKIr7FtPNhkPOOyEE6NeJrDjbALplVONInqNC9s64yEPnfnyPlrFmVWusvWFg7RRjQ+9pgRxQK
 bxlc5SQI7ZirqYWCp6kp0qSvruKPzhn6n4JBfoibdE0fB2BibGOIxme4XLFftAvi4P7vQRg8ot/
 PdlXYrFCyZXiAxmtCg431GR+OSIkbpFNtNniWyQfk7xJ/x46OCJ5b8vATIlMUp2C9HwJ98bcnPk
 VSNoBfqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060050
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 2025-09-06 at 15:46 +0530, Madhavan Srinivasan wrote:
>=20
>=20
> On 8/30/25 11:33 AM, Haren Myneni wrote:
> > The hypervisor signals the OS via a Hypervisor Pipe Event external
> > interrupt when data is available to be received from the pipe.
> > Then the OS=C2=A0 should call RTAS check-exception and provide the inpu=
t
> > Event Mask as defined for the =E2=80=98ibm,hvpipe-msg-events=E2=80=99. =
In response,
> > check-exception will return an event log containing an Pipe Events
> > message. This message contains the source ID for which this
> > message is intended to and the pipe status such as whether the
> > payload is pending in the hypervisor or pipe to source is closed.
> >=20
> > If there is any user space process waiting in the wait_queue for
> > the payload from this source ID, wake up that process which can
> > issue read() to obtain payload with ibm,receive-hvpipe-msg RTAS
> > or close FD if the pipe to source is closed.
> >=20
> > The hypervisor has one pipe per partition for all sources and it
> > will not deliver another hvpipe event message until the partition
> > reads the payload for the previous hvpipe event. So if the source
> > ID is not found in the source list, issue the dummy
> > ibm,receive-hvpipe-msg RTAS so that pipe will not blocked.
> >=20
> > Register hvpipe event source interrupt based on entries from
> > /proc/device-tree//event-sources/ibm,hvpipe-msg-events property.
> >=20
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> > Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> > ---
> > =C2=A0arch/powerpc/platforms/pseries/papr-hvpipe.c | 146
> > ++++++++++++++++++-
> > =C2=A0arch/powerpc/platforms/pseries/papr-hvpipe.h |=C2=A0 14 ++
> > =C2=A02 files changed, 155 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > index 1e7636c0b275..0969efb39d95 100644
> > --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> > @@ -22,6 +22,11 @@
> > =C2=A0static DEFINE_SPINLOCK(hvpipe_src_list_lock);
> > =C2=A0static LIST_HEAD(hvpipe_src_list);
> > =C2=A0
> > +static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
> > +static struct workqueue_struct *papr_hvpipe_wq;
> > +static struct work_struct *papr_hvpipe_work =3D NULL;
> > +static int hvpipe_check_exception_token;
> > +
>=20
> checkpatch.pl is not happy, reporting these errors=20
>=20
>=20
> ERROR: do not initialise statics to NULL
> #53: FILE: arch/powerpc/platforms/pseries/papr-hvpipe.c:27:
> +static struct work_struct *papr_hvpipe_work =3D NULL;
>=20
> WARNING: else is not generally useful after a break or return
> #205: FILE: arch/powerpc/platforms/pseries/papr-hvpipe.c:716:
> +		return 0;
> +	} else
>=20
> total: 1 errors, 1 warnings, 183 lines checked

Sorry, my mistake. Checked with checkpatch.pl initially, but later
changed. Will post V5 series.

Thanks
Haren
 =20
>=20
>=20
>=20
>=20
> > =C2=A0/*
> > =C2=A0 * New PowerPC FW provides support for partitions and various
> > =C2=A0 * sources (Ex: remote hardware management console (HMC)) to
> > @@ -556,6 +561,117 @@ static long papr_hvpipe_dev_ioctl(struct file
> > *filp, unsigned int ioctl,
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * papr_hvpipe_work_fn - called to issue recv HVPIPE RTAS for
> > + * sources that are not monitored by user space so that pipe
> > + * will not be blocked.
> > + */
> > +static void papr_hvpipe_work_fn(struct work_struct *work)
> > +{
> > +	hvpipe_rtas_recv_msg(NULL, 0);
> > +}
> > +
> > +/*
> > + * HVPIPE event message IRQ handler.
> > + * The hypervisor sends event IRQ if the partition has payload
> > + * and generates another event only after payload is read with
> > + * recv HVPIPE RTAS.
> > + */
> > +static irqreturn_t hvpipe_event_interrupt(int irq, void *dev_id)
> > +{
> > +	struct hvpipe_event_buf *hvpipe_event;
> > +	struct pseries_errorlog *pseries_log;
> > +	struct hvpipe_source_info *src_info;
> > +	struct rtas_error_log *elog;
> > +	int rc;
> > +
> > +	rc =3D rtas_call(hvpipe_check_exception_token, 6, 1, NULL,
> > +		RTAS_VECTOR_EXTERNAL_INTERRUPT, virq_to_hw(irq),
> > +		RTAS_HVPIPE_MSG_EVENTS, 1, __pa(&hvpipe_ras_buf),
> > +		rtas_get_error_log_max());
> > +
> > +	if (rc !=3D 0) {
> > +		pr_err_ratelimited("unexpected hvpipe-event-
> > notification failed %d\n", rc);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	elog =3D (struct rtas_error_log *)hvpipe_ras_buf;
> > +	if (unlikely(rtas_error_type(elog) !=3D RTAS_TYPE_HVPIPE)) {
> > +		pr_warn_ratelimited("Unexpected event type %d\n",
> > +				rtas_error_type(elog));
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	pseries_log =3D get_pseries_errorlog(elog,
> > +				PSERIES_ELOG_SECT_ID_HVPIPE_EVENT)
> > ;
> > +	hvpipe_event =3D (struct hvpipe_event_buf *)pseries_log-
> > >data;
> > +
> > +	/*
> > +	 * The hypervisor notifies partition when the payload is
> > +	 * available to read with recv HVPIPE RTAS and it will not
> > +	 * notify another event for any source until the previous
> > +	 * payload is read. Means the pipe is blocked in the
> > +	 * hypervisor until the payload is read.
> > +	 *
> > +	 * If the source is ready to accept payload and wakeup the
> > +	 * corresponding FD. Hold lock and update hvpipe_status
> > +	 * and this lock is needed in case the user space process
> > +	 * is in release FD instead of poll() so that release()
> > +	 * reads the payload to unblock pipe before closing FD.
> > +	 *
> > +	 * otherwise (means no other user process waiting for the
> > +	 * payload, issue recv HVPIPE RTAS (papr_hvpipe_work_fn())
> > +	 * to unblock pipe.
> > +	 */
> > +	spin_lock(&hvpipe_src_list_lock);
> > +	src_info =3D hvpipe_find_source(be32_to_cpu(hvpipe_event-
> > >srcID));
> > +	if (src_info) {
> > +		u32 flags =3D 0;
> > +
> > +		if (hvpipe_event->event_type &
> > HVPIPE_LOST_CONNECTION)
> > +			flags =3D HVPIPE_LOST_CONNECTION;
> > +		else if (hvpipe_event->event_type &
> > HVPIPE_MSG_AVAILABLE)
> > +			flags =3D HVPIPE_MSG_AVAILABLE;
> > +
> > +		src_info->hvpipe_status |=3D flags;
> > +		wake_up(&src_info->recv_wqh);
> > +		spin_unlock(&hvpipe_src_list_lock);
> > +	} else {
> > +		spin_unlock(&hvpipe_src_list_lock);
> > +		/*
> > +		 * user space is not waiting on this source. So
> > +		 * execute receive pipe RTAS so that pipe will not
> > +		 * be blocked.
> > +		 */
> > +		if (hvpipe_event->event_type &
> > HVPIPE_MSG_AVAILABLE)
> > +			queue_work(papr_hvpipe_wq,
> > papr_hvpipe_work);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int __init enable_hvpipe_IRQ(void)
> > +{
> > +	struct device_node *np;
> > +
> > +	hvpipe_check_exception_token =3D
> > rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
> > +	if (hvpipe_check_exception_token=C2=A0 =3D=3D RTAS_UNKNOWN_SERVICE)
> > +		return -ENODEV;
> > +
> > +	/* hvpipe events */
> > +	np =3D of_find_node_by_path("/event-sources/ibm,hvpipe-msg-
> > events");
> > +	if (np !=3D NULL) {
> > +		request_event_sources_irqs(np,
> > hvpipe_event_interrupt,
> > +					"HPIPE_EVENT");
> > +		of_node_put(np);
> > +	} else {
> > +		pr_err("Can not enable hvpipe event IRQ\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > =C2=A0static const struct file_operations papr_hvpipe_ops =3D {
> > =C2=A0	.unlocked_ioctl	=3D	papr_hvpipe_dev_ioctl,
> > =C2=A0};
> > @@ -578,12 +694,32 @@ static int __init papr_hvpipe_init(void)
> > =C2=A0		!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVP
> > IPE_MSG))
> > =C2=A0		return -ENODEV;
> > =C2=A0
> > -	ret =3D misc_register(&papr_hvpipe_dev);
> > -	if (ret) {
> > -		pr_err("misc-dev registration failed %d\n", ret);
> > -		return ret;
> > +	papr_hvpipe_work =3D kzalloc(sizeof(struct work_struct),
> > GFP_ATOMIC);
> > +	if (!papr_hvpipe_work)
> > +		return -ENOMEM;
> > +
> > +	INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
> > +
> > +	papr_hvpipe_wq =3D alloc_ordered_workqueue("papr hvpipe
> > workqueue", 0);
> > +	if (!papr_hvpipe_wq) {
> > +		ret =3D -ENOMEM;
> > +		goto out;
> > =C2=A0	}
> > =C2=A0
> > -	return 0;
> > +	ret =3D enable_hvpipe_IRQ();
> > +	if (!ret)
> > +		ret =3D misc_register(&papr_hvpipe_dev);
> > +
> > +	if (!ret) {
> > +		pr_info("hvpipe feature is enabled\n");
> > +		return 0;
> > +	} else
> > +		pr_err("hvpipe feature is not enabled %d\n", ret);
> > +
> > +	destroy_workqueue(papr_hvpipe_wq);
> > +out:
> > +	kfree(papr_hvpipe_work);
> > +	papr_hvpipe_work =3D NULL;
> > +	return ret;
> > =C2=A0}
> > =C2=A0machine_device_initcall(pseries, papr_hvpipe_init);
> > diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > index 125658e6b596..aab7f77e087d 100644
> > --- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> > @@ -19,4 +19,18 @@ struct hvpipe_source_info {
> > =C2=A0	struct task_struct *tsk;
> > =C2=A0};
> > =C2=A0
> > +/*
> > + * Source ID Format 0xCCRRQQQQ
> > + * CC =3D indicating value is source type (ex: 0x02 for HMC)
> > + * RR =3D 0x00 (reserved)
> > + * QQQQ =3D 0x0000 =E2=80=93 0xFFFF indicating the source index indeti=
fier
> > + */
> > +struct hvpipe_event_buf {
> > +	__be32	srcID;		/* Source ID */
> > +	u8	event_type;	/* 0x01 for hvpipe message
> > available */
> > +				/* from specified src ID */
> > +				/* 0x02 for loss of pipe
> > connection */
> > +				/* with specified src ID */
> > +};
> > +
> > =C2=A0#endif /* _PAPR_HVPIPE_H */

