Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51743250D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY3l906CNz3c7j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 04:29:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iP8bfcia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY3kL4wLlz2yM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 04:28:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iP8bfcia; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HY3kK4VQ4z4xbP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 04:28:25 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HY3kK4SKwz4xbb; Tue, 19 Oct 2021 04:28:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iP8bfcia; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HY3kK00Byz4xbP
 for <linuxppc-dev@ozlabs.org>; Tue, 19 Oct 2021 04:28:24 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IGLXfo008876
 for <linuxppc-dev@ozlabs.org>; Mon, 18 Oct 2021 13:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=biYqL4hY+ZjO02c2zyxu5XOFCJ2LOPN9IKYNBcefq6E=;
 b=iP8bfciarK8aV24QNw3IhnyrVWkJ8vdk8/Cpw1GzwsgzPStx/sMqWEzOiXbJNFxQfI7Y
 zyBvmUuzxfs1VxKuivjuYQKvNnW7M60+Qmp9jtVBnbtZUii3PLkQ6LsNaY/MBdFBtgSc
 CsiSkV17wdXooqBDpvJ7mPeHjeqexoCL29GNGsgdyoPneURBo1VsSGdHtfDxcd7sx1Xk
 UbgspNBO8w/NJv31V8Nah2MgP9awX/vC4Sye1hx+UbiqoZtl32pC63o50/2XhwZk/iy/
 o3wpCS/ETlTnbftOxY/OQEIbfbqcF/Kqwfc98wofKqalddrCIYmUs9bDoNtfmquk5uVR lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsccjshu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 18 Oct 2021 13:28:21 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19IH2QN7002512
 for <linuxppc-dev@ozlabs.org>; Mon, 18 Oct 2021 13:28:21 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsccjshth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 13:28:21 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IHHJlR031671;
 Mon, 18 Oct 2021 17:28:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3bqpc9fuph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 17:28:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IHSHbA57999838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 17:28:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 518DF5204E;
 Mon, 18 Oct 2021 17:28:17 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.53.150])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 54EE152057;
 Mon, 18 Oct 2021 17:28:16 +0000 (GMT)
Date: Mon, 18 Oct 2021 22:58:08 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/eeh: skip slot presence check when PE is
 temporarily unavailable.
Message-ID: <20211018172808.efx5bxniscy2lcj4@in.ibm.com>
References: <162032297784.225551.1220900342102038880.stgit@jupiter>
 <CAOSf1CG4H2GrxV5C=55vcNue4taSAkgFOUg32yVspgw9+meDAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CG4H2GrxV5C=55vcNue4taSAkgFOUg32yVspgw9+meDAg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QosNA7XYLzOBV97PvECM3gfmG4uqpC-N
X-Proofpoint-GUID: NTN_P2pfgIV6-nZJ2lMiIvIlHMTsq7RE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110180097
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-05-07 10:41:46 Fri, Oliver O'Halloran wrote:
> On Fri, May 7, 2021 at 3:43 AM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> >
> > When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> > state as temporarily unavailable. In this case, per PAPR, rtas call
> > ibm,read-slot-reset-state2 returns a PE state as temporarily unavailable(5)
> > and OS has to wait until that recovery is complete. During this state the
> > slot presence check 'get-sensor-state(dr-entity-sense)' returns as DR
> > connector empty which leads to assumption that the device has been
> > hot-removed. This results into no EEH recovery on this device and it stays
> > in failed state forever.
> >
> > This patch fixes this issue by skipping slot presence check only if device
> > PE state is temporarily unavailable(5).
> >
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > ---
> > * snip*
> >
> >         /*
> >          * It should be corner case that the parent PE has been
> > diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> > index 3eff6a4888e79..a0913768f33de 100644
> > --- a/arch/powerpc/kernel/eeh_driver.c
> > +++ b/arch/powerpc/kernel/eeh_driver.c
> > @@ -851,6 +851,17 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
> >                 return;
> >         }
> >
> > +       /*
> > +        * When PE's state is temporarily unavailable, the slot
> > +        * presence check returns as DR connector empty.
> 
> That sounds like a bug in either RTAS or the hotplug slot driver (or
> both). The presence check is there largely to filter out events that
> we can guarantee are not recoverable (i.e. surprise hot-unplug). In
> every other case (especially if we can't determine the state) we
> should be going down the recovery path. If the hotplug slot driver is
> incorrectly reporting the card has been removed then you should be
> fixing the slot driver.

Thanks Oliver for the comment.

So phyp fixed the issue where it was incorrectly reporting the card has
been removed. After the phyp fix, the slot presence check
'get-sensor-state(dr-entity-sense)' returns extended busy error (9902)
until PHB is recovered by phyp. And once PHB is recovered, the
get-sensor-state() returns success with correct presence status.

But now we have different problem. The Linux rtas call interface
rtas_get_sensor() loops over the rtas call on extended delay return code
(9902) until the return value is either success (0) or error (-1).  This
causes EEH handler to get stuck at presence check 'rtas_get_sensor()'
for ~6 seconds before it could indicate network driver that error has
been detected and stop any active operations. With no I/O traffic this
doesn't cause any issue and EEH recovery works fine.  However with
running I/O traffic, during this 6 seconds, network driver continues its
operation and hits timeout (netdev watchdog). On timeouts, network
driver go into ffdc capture mode and reset path assuming PCI device is
in fatal condition. This causes EEH recovery to fail and sometimes it
leads to system hang or crash.

------------
[52732.244731] DEBUG: ibm_read_slot_reset_state2()
[52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=0x0
[52732.244798] DEBUG: in eeh_slot_presence_check
[52732.244804] DEBUG: error state check
[52732.244807] DEBUG: Is slot hotpluggable
[52732.244810] DEBUG: hotpluggable ops ?
[52732.244953] DEBUG: Calling ops->get_adapter_status
[52732.244958] DEBUG: calling rpaphp_get_sensor_state
[52736.564262] ------------[ cut here ]------------
[52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed out
[52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev_watchdog+0x438/0x440
[...]
[52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
[52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
------------

I am working on ways to fix this and looking at below two options. More
ideas are welcome.

1. There is an alternate call rtas_get_sensor_fast() available that does
not use rtas_busy_delay() and returns immediately with error code. Using
rtas_get_sensor_fast() for slot presence check fixes the above issue and
EEH recovery works fine. However there is no provision in
hotplug_slot_ops struct to do a quick check of adapter status that can
be used to call rtas_get_sensor_fast().

2. Another option is to move the slot presence check after reporting
network driver that error has been detected. This also fixes the issue.
However need to verify the hotplug case where if slot is empty, inform
driver to resume while skiping the recovery.

Let me know what do you think about above options and if there is any
other better way to fix this.

Thanks,
-Mahesh.
