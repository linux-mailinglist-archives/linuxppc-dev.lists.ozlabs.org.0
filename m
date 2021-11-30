Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44C462BDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 05:54:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J38yb2ts2z3bZj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 15:54:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SRncarii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J38xn4PS5z306m
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 15:53:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SRncarii; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J38xn2K8Rz4xPv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 15:53:49 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J38xn2G98z4xRC; Tue, 30 Nov 2021 15:53:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SRncarii; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J38xm4h3Kz4xPv
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 15:53:48 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU4ftSh031348
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 04:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=ezgNW0k8z8frjlN10Ut7K0hm70ywDIqw85HvDGUFi5k=;
 b=SRncariikjD78SX/qW40sQAla5VIYdSXAquEVRPWfnskBgURYwFTpU6MhEPadwxW9h/v
 OMcyd1e74pkGncw7WzNbPwIw4LBTqUAJFSLJBTrcKVdQVdYlCeFCtFiBwCAfkPb+gHfF
 PS7kG497FIj8bUhpq6PHkBLIJIJnQNDlYyu2EovLkg/yPJb29bU+oI+h7t1QdaRjBzPp
 5Uhm1Wl+col9nUJPGm6XpPV9g2tvEz4xvY8N9Gv7v8XEUYXOkxvh/LBaB4+JtmOG6732
 8m58at5EgRnbnarhXI9s46PnqgHOHnwadOXp7jjBqaR263sqs8Aen3rdPcxFj4wcvIz/ Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnd5b8640-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 04:53:45 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AU4kDvu010961
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 04:53:45 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnd5b863v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 04:53:45 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AU4rZkk013412;
 Tue, 30 Nov 2021 04:53:44 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3ckcab8acb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 04:53:44 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AU4rgEg40960398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 04:53:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6816B2067;
 Tue, 30 Nov 2021 04:53:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85115B2064;
 Tue, 30 Nov 2021 04:53:42 +0000 (GMT)
Received: from localhost (unknown [9.163.19.234])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 04:53:42 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking()
 for pci hotplug driver.
In-Reply-To: <163817631601.2016996.16085383012429651821.stgit@jupiter>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
Date: Mon, 29 Nov 2021 22:53:41 -0600
Message-ID: <87o862nt0q.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VLWYpgpYKn03UDzYSAIj03EpQf_TH4lu
X-Proofpoint-ORIG-GUID: JRYvoBrbQeMPUKmFNXcaqyGsHpV8ogJR
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_04,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111300026
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> state as temporarily unavailable until recovery is complete. This also
> triggers an EEH handler in Linux which needs to notify drivers, and perform
> recovery. But before notifying the driver about the pci error it uses
> get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
> determine if the slot contains a device or not. if the slot is empty, the
> recovery is skipped entirely.
>
> However on certain PHB failures, the rtas call get-sesnor-state() returns
> extended busy error (9902) until PHB is recovered by phyp. Once PHB is
> recovered, the get-sensor-state() returns success with correct presence
> status. The rtas call interface rtas_get_sensor() loops over the rtas call
> on extended delay return code (9902) until the return value is either
> success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> seconds before it could notify that the pci error has been detected and
> stop any active operations.

I am curious whether you see any difference with "powerpc/rtas:
rtas_busy_delay() improvements" which was recently applied. It will
cause the the calling task to sleep in response to a 990x status instead
of immediately retrying:

https://git.kernel.org/powerpc/c/38f7b7067dae0c101be573106018e8af22a90fdf

If that commit helps then maybe this change isn't needed.

Otherwise, see my comments below.


> -int rtas_get_sensor_fast(int sensor, int index, int *state)
> +static int
> +__rtas_get_sensor(int sensor, int index, int *state, bool warn_on)

Boolean flag parameters in this style are undesirable. As a reader you
can't infer the significance of a 'true' or 'false' in the argument list
at the call site.

>  {
>  	int token = rtas_token("get-sensor-state");
>  	int rc;
> @@ -618,14 +619,26 @@ int rtas_get_sensor_fast(int sensor, int index, int *state)
>  		return -ENOENT;
>  
>  	rc = rtas_call(token, 2, 2, state, sensor, index);
> -	WARN_ON(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
> -				    rc <= RTAS_EXTENDED_DELAY_MAX));
> +	WARN_ON(warn_on &&
> +		(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
> +				    rc <= RTAS_EXTENDED_DELAY_MAX)));
>  
>  	if (rc < 0)
>  		return rtas_error_rc(rc);
>  	return rc;
>  }

Issues I see with this, in terms of correctness and convention:

* On non-negative status from rtas_call(), including 990x,
  __rtas_get_sensor() returns the RTAS status unchanged. On a negative
  status, it returns a Linux errno value. On a -2 (busy) status
  rtas_error_rc() prints an error message and returns -ERANGE. Seems
  difficult for a caller to handle. Generally we want rtas_* APIs to
  adhere to a Linux 0/-errno convention or to return the RTAS
  status unchanged, but not a mixture.

* __rtas_get_sensor() is called by rtas_get_sensor_fast() and
  rtas_get_sensor_nonblocking(), but is not called by rtas_get_sensor(),
  despite common practice with __-prefixed functions.

> +int rtas_get_sensor_fast(int sensor, int index, int *state)
> +{
> +	return __rtas_get_sensor(sensor, index, state, true);
> +}
> +
> +int rtas_get_sensor_nonblocking(int sensor, int index, int *state)
> +{
> +	return __rtas_get_sensor(sensor, index, state, false);
> +}
> +EXPORT_SYMBOL(rtas_get_sensor_nonblocking);
> +
>  bool rtas_indicator_present(int token, int *maxindex)
>  {
>  	int proplen, count, i;
> diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
> index c380bdacd1466..8a7d681254ce9 100644
> --- a/drivers/pci/hotplug/rpaphp_pci.c
> +++ b/drivers/pci/hotplug/rpaphp_pci.c
> @@ -23,7 +23,7 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
>  	int rc;
>  	int setlevel;
>  
> -	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
> +	rc = rtas_get_sensor_nonblocking(DR_ENTITY_SENSE, slot->index, state);
>  
>  	if (rc < 0) {
>  		if (rc == -EFAULT || rc == -EEXIST) {
> @@ -38,10 +38,10 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
>  			if (rc < 0) {
>  				dbg("%s: power on slot[%s] failed rc=%d.\n",
>  				    __func__, slot->name, rc);
> -			} else {
> -				rc = rtas_get_sensor(DR_ENTITY_SENSE,
> -						     slot->index, state);
> +				return rc;
>  			}
> +			rc = rtas_get_sensor_nonblocking(DR_ENTITY_SENSE,
> +							 slot->index, state);
>  		} else if (rc == -ENODEV)
>  			info("%s: slot is unusable\n", __func__);
>  		else

If I'm reading it right rpaphp_get_sensor_state() now returns 9902 in
the situation this change is trying to address. I checked a couple of
its call sites and it seems like this is going to propagate back into
the PCI hotplug core which of course doesn't understand RTAS call
statuses. So this doesn't seem right.

Maybe it would be better to have rpaphp_get_sensor_state() invoke
rtas_call("get-sensor-state", ...) directly and code whatever special
behavior is needed there, instead of introducing a new exported API. The
driver seems to want to deal with the RTAS return values anyway - it's
implicitly mapping ENODEV, EFAULT, EEXIST from rtas_get_sensor() back to
-9002, -9000, -9001 respectively.
