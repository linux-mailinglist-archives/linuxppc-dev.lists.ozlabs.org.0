Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCD45B6E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 09:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzZPG24qYz3bfl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 19:46:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=inPfuv0b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzZNQ6WKGz2yHS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 19:45:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=inPfuv0b; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HzZNP4667z4xcM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 19:45:57 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HzZNP43jhz4xbw; Wed, 24 Nov 2021 19:45:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=inPfuv0b; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HzZNN5yvFz4xZ0;
 Wed, 24 Nov 2021 19:45:56 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AO8MGFT021106; 
 Wed, 24 Nov 2021 08:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=4t+ZicHCvvWJmmmaoIk99AywYljejqW1EBK1a4P2JT4=;
 b=inPfuv0bexB0AYSABAvtFUX5gjWFmGSG8SYse51BwFPTqlzggzk45emRsJ7a3NLQIG9k
 rUlHSFrnfkipKn9hoqETqBn3KW53QVgSd5xfqMLp1+8EKt7YidbmWq1SArnxgMMwxwnY
 EJRhWK4nAtn5FTQ8zGVlWP44TtTz07ZbDgs6ZvsZy9gagwTdonLVXZ6kL8AiLR2nWjvm
 KAyc61lzTJSAh/lboc0GP/f7m9fbH+gLR43NlA9NvlGEUJBqWdsSY8wdgy9FrDfFCk/H
 p9K639LJ7jma/Wm0IEuq4PoGjB0JKKCBldQ9E4tgw9GZT1ZcSSXwGSzlRhFX8tjYqSVF ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3chhtwgcdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 08:45:53 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AO8UIPd011015;
 Wed, 24 Nov 2021 08:45:53 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3chhtwgcd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 08:45:52 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AO8d00B022034;
 Wed, 24 Nov 2021 08:45:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3cernbdvc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 08:45:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AO8jmPG24314158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 08:45:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 773BC11C050;
 Wed, 24 Nov 2021 08:45:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7879811C058;
 Wed, 24 Nov 2021 08:45:47 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.112.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Nov 2021 08:45:47 +0000 (GMT)
Date: Wed, 24 Nov 2021 14:15:39 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
Message-ID: <20211124084539.issrrg2lxq3mp6mj@in.ibm.com>
References: <163767273634.1368569.7327743414665595326.stgit@jupiter>
 <875ysiqxbd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875ysiqxbd.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nyt590uOlHKTRqWLyx822vLieApPkN4u
X-Proofpoint-GUID: 0r5vxoac9JzmlixxFTwf3xfMD54BBO7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_03,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240047
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

On 2021-11-24 10:14:30 Wed, Michael Ellerman wrote:
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
> > stop any active operations. Hence with running I/O traffic, during this 6
> > seconds, the network driver continues its operation and hits a timeout
> > (netdev watchdog). On timeouts, network driver go into ffdc capture mode
> > and reset path assuming the PCI device is in fatal condition. This causes
> > EEH recovery to fail and sometimes it leads to system hang or crash.
> >
> > ------------
> > [52732.244731] DEBUG: ibm_read_slot_reset_state2()
> > [52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=0x0
> > [52732.244798] DEBUG: in eeh_slot_presence_check
> > [52732.244804] DEBUG: error state check
> > [52732.244807] DEBUG: Is slot hotpluggable
> > [52732.244810] DEBUG: hotpluggable ops ?
> > [52732.244953] DEBUG: Calling ops->get_adapter_status
> > [52732.244958] DEBUG: calling rpaphp_get_sensor_state
> > [52736.564262] ------------[ cut here ]------------
> > [52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed out
> > [52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev_watchdog+0x438/0x440
> > [...]
> > [52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
> > [52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
> > ------------
> >
> > To fix this issue, delay the slot presence check after notifying the driver
> > about the pci error.
> 
> How does this interact with the commit that put the slot presence check
> there in the first place:
> 
>   b104af5a7687 ("powerpc/eeh: Check slot presence state in eeh_handle_normal_event()")
> 
> 
> It seems like delaying the slot presence check will effectively revert
> that commit?

No it doesn't. We will still do a presence check before the recovery
process starts. This patch moves the check after notifying the driver to
stop active I/O operations. If a presence check finds the device isn't
present, we will skip the EEH recovery. However, on a surprise hotplug,
the user will see the EEH messages on the console before it finds there
is nothing to recover.

Current EEH behaviour:

EEH event -> eeh_handle_normal_event
		/* Check for adapter status */
		eeh_slot_presence_check()
			if (!present)
				bail out early

		/* Report the error */
		eeh_report_error() <- notify driver about error
			driver->err_handler->error_detected()
			/* Any active I/O will be stopped now */

		/* Start the recovery process */
		eeh_reset_device()
		eeh_report_resume()
		/* Recovery done */

With this patch:

EEH event -> eeh_handle_normal_event
		/* Report the error */
		eeh_report_error() <- notify driver about error
			driver->err_handler->error_detected()
			/* Any active I/O will be stopped now */

		/* Check for adapter status */
		eeh_slot_presence_check()
			if (!present)
				bail out early

		/* Start the recovery process */
		eeh_reset_device()
		eeh_report_resume()
		/* Recovery done */

Thanks,
-Mahesh.

