Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5602B462FC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 10:34:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3H9S1drQz3cZY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 20:34:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AgNEnk6r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3H8h4zLQz3bXJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 20:33:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AgNEnk6r; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J3H8h04zVz4xR5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 20:33:40 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J3H8g74gbz4xYy; Tue, 30 Nov 2021 20:33:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AgNEnk6r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J3H8g36Jlz4xR5
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 20:33:38 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU9HRp4000394
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 09:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=aFquFBW7FGtUi9gh0dvyJ70ZryLza7RBondrpBHASDQ=;
 b=AgNEnk6rl/1UqbmLk5xpDIUgvNLBHGMQhsmI6ZX9co7StWDrowTadtbLg6O2bo7i4DlE
 BkAZiQCV3Z1tIxExkdt/oicpg4J4Z+Yay4fwOnJ7GD0PDBJ5PdNl/nvwXo7DUxHK82zC
 vDuh00xT9Pu0yBml1/NVLaBpoAkugsxTX4ThDVLjrGzePr5A/yvx0Bc0r0AlH+hyk88v
 8rfml4nUJhj5wsLtJg6Z4Yjil9CmAULqW++aqTNq8r+dTWf/AqLv388P8o6vSERqagiL
 ExnqoKRPSxCISJaYkFhWmm+8xZvG0tijohnTjD1T2tSApC+FjfZOuLlHo2TnCBGNJHcW QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnh6pg97s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 09:33:36 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AU9UnHN016851
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 09:33:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnh6pg8w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 09:33:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AU9D39Z027364;
 Tue, 30 Nov 2021 09:31:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3ckcaccscy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 09:31:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AU9VmPS30277956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 09:31:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C5A111C066;
 Tue, 30 Nov 2021 09:31:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFD7311C06C;
 Tue, 30 Nov 2021 09:31:46 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.54.94])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Nov 2021 09:31:46 +0000 (GMT)
Date: Tue, 30 Nov 2021 15:01:44 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking()
 for pci hotplug driver.
Message-ID: <20211130093144.zpjcxnbkz3jsxfql@in.ibm.com>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
 <87o862nt0q.fsf@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o862nt0q.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hg4tlSh6MaHnuQkB3ZFw3ahK5HvAqHPF
X-Proofpoint-GUID: DsW-w7G_JPw28LH9zEF5KrAHsSAsOtn9
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300054
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-11-29 22:53:41 Mon, Nathan Lynch wrote:
> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> > When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> > state as temporarily unavailable until recovery is complete. This also
> > triggers an EEH handler in Linux which needs to notify drivers, and perform
> > recovery. But before notifying the driver about the pci error it uses
> > get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
> > determine if the slot contains a device or not. if the slot is empty, the
> > recovery is skipped entirely.
> >
> > However on certain PHB failures, the rtas call get-sesnor-state() returns
> > extended busy error (9902) until PHB is recovered by phyp. Once PHB is
> > recovered, the get-sensor-state() returns success with correct presence
> > status. The rtas call interface rtas_get_sensor() loops over the rtas call
> > on extended delay return code (9902) until the return value is either
> > success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> > seconds before it could notify that the pci error has been detected and
> > stop any active operations.
> 
> I am curious whether you see any difference with "powerpc/rtas:
> rtas_busy_delay() improvements" which was recently applied. It will
> cause the the calling task to sleep in response to a 990x status instead
> of immediately retrying:

If it is still sleeping it may not help, however I will give a try.

> 
> https://git.kernel.org/powerpc/c/38f7b7067dae0c101be573106018e8af22a90fdf
> 
> If that commit helps then maybe this change isn't needed.
> 
> Otherwise, see my comments below.
> 
> 
> > -int rtas_get_sensor_fast(int sensor, int index, int *state)
> > +static int
> > +__rtas_get_sensor(int sensor, int index, int *state, bool warn_on)
> 
> Boolean flag parameters in this style are undesirable. As a reader you
> can't infer the significance of a 'true' or 'false' in the argument list
> at the call site.
> 
> >  {
> >  	int token = rtas_token("get-sensor-state");
> >  	int rc;
> > @@ -618,14 +619,26 @@ int rtas_get_sensor_fast(int sensor, int index, int *state)
> >  		return -ENOENT;
> >  
> >  	rc = rtas_call(token, 2, 2, state, sensor, index);
> > -	WARN_ON(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
> > -				    rc <= RTAS_EXTENDED_DELAY_MAX));
> > +	WARN_ON(warn_on &&
> > +		(rc == RTAS_BUSY || (rc >= RTAS_EXTENDED_DELAY_MIN &&
> > +				    rc <= RTAS_EXTENDED_DELAY_MAX)));
> >  
> >  	if (rc < 0)
> >  		return rtas_error_rc(rc);
> >  	return rc;
> >  }
> 
> Issues I see with this, in terms of correctness and convention:
> 
> * On non-negative status from rtas_call(), including 990x,
>   __rtas_get_sensor() returns the RTAS status unchanged. On a negative
>   status, it returns a Linux errno value. On a -2 (busy) status
>   rtas_error_rc() prints an error message and returns -ERANGE. Seems
>   difficult for a caller to handle. Generally we want rtas_* APIs to
>   adhere to a Linux 0/-errno convention or to return the RTAS
>   status unchanged, but not a mixture.
> 
> * __rtas_get_sensor() is called by rtas_get_sensor_fast() and
>   rtas_get_sensor_nonblocking(), but is not called by rtas_get_sensor(),
>   despite common practice with __-prefixed functions.
> 
> > +int rtas_get_sensor_fast(int sensor, int index, int *state)
> > +{
> > +	return __rtas_get_sensor(sensor, index, state, true);
> > +}
> > +
> > +int rtas_get_sensor_nonblocking(int sensor, int index, int *state)
> > +{
> > +	return __rtas_get_sensor(sensor, index, state, false);
> > +}
> > +EXPORT_SYMBOL(rtas_get_sensor_nonblocking);
> > +
> >  bool rtas_indicator_present(int token, int *maxindex)
> >  {
> >  	int proplen, count, i;
> > diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
> > index c380bdacd1466..8a7d681254ce9 100644
> > --- a/drivers/pci/hotplug/rpaphp_pci.c
> > +++ b/drivers/pci/hotplug/rpaphp_pci.c
> > @@ -23,7 +23,7 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
> >  	int rc;
> >  	int setlevel;
> >  
> > -	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
> > +	rc = rtas_get_sensor_nonblocking(DR_ENTITY_SENSE, slot->index, state);
> >  
> >  	if (rc < 0) {
> >  		if (rc == -EFAULT || rc == -EEXIST) {
> > @@ -38,10 +38,10 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
> >  			if (rc < 0) {
> >  				dbg("%s: power on slot[%s] failed rc=%d.\n",
> >  				    __func__, slot->name, rc);
> > -			} else {
> > -				rc = rtas_get_sensor(DR_ENTITY_SENSE,
> > -						     slot->index, state);
> > +				return rc;
> >  			}
> > +			rc = rtas_get_sensor_nonblocking(DR_ENTITY_SENSE,
> > +							 slot->index, state);
> >  		} else if (rc == -ENODEV)
> >  			info("%s: slot is unusable\n", __func__);
> >  		else
> 
> If I'm reading it right rpaphp_get_sensor_state() now returns 9902 in
> the situation this change is trying to address. I checked a couple of
> its call sites and it seems like this is going to propagate back into
> the PCI hotplug core which of course doesn't understand RTAS call
> statuses. So this doesn't seem right.

Thanks for pointing it out. I should convert that into an error before
returning. I overlooked this when I moved away from get_sensor_state().

> 
> Maybe it would be better to have rpaphp_get_sensor_state() invoke
> rtas_call("get-sensor-state", ...) directly and code whatever special
> behavior is needed there, instead of introducing a new exported API. The
> driver seems to want to deal with the RTAS return values anyway - it's
> implicitly mapping ENODEV, EFAULT, EEXIST from rtas_get_sensor() back to
> -9002, -9000, -9001 respectively.

Sure I will try this.

Thanks,
-Mahesh.

-- 
Mahesh J Salgaonkar
