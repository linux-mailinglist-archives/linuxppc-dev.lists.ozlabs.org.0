Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B576D4F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 19:19:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nlgv+uvB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGJcS00v3z3cHB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 03:19:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nlgv+uvB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGJbT0p4cz30hs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 03:18:29 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RGJbQ72x1z4wZs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 03:18:26 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RGJbQ6yfCz4wZx; Thu,  3 Aug 2023 03:18:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nlgv+uvB;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RGJbQ0tyxz4wZs
	for <linuxppc-dev@ozlabs.org>; Thu,  3 Aug 2023 03:18:25 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372HCodA031066;
	Wed, 2 Aug 2023 17:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Hld1H5Ct29P3BgDvtbzZet1F2/x8docmE26kgCV2OFI=;
 b=nlgv+uvBvsmq7pbHJQN7y4TsV//pEArTmMY6vVDaYnpQh9Q7JQDjbrmWwEAan9AxcF7Z
 Vb9Q0+geoSaUM+FLBnZmfFuORBTlxwglvXB0Lop3L7YWZzAOiV91npIKDz98E/yG81ot
 mSh7zQYBdo8BtkZPgwu/zTIcXj80PvUXkY8VOf4bQztydDI3AxWd840Eu8GcHR51jv8Y
 y0GhcvKQfYAhHb/PfrREEJI0veh14HXeIsjQ3hHCFSxykg+9MYilX60WpyyOwykOqKDI
 2Sc9LZXMfCNitqeJuKpuzt3zvdG1N+kaa+lAFUcAsm9M1Mj3HnSs6VrqwcfMHNq2AXri kA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7ubgg748-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 17:18:14 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 372HCsi3031240;
	Wed, 2 Aug 2023 17:18:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7ubgg73j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 17:18:14 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 372G0aoc015471;
	Wed, 2 Aug 2023 17:18:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5e3n6cjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 17:18:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 372HI9kf22807098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Aug 2023 17:18:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC45B2004B;
	Wed,  2 Aug 2023 17:18:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0330720049;
	Wed,  2 Aug 2023 17:18:08 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.36.141])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Aug 2023 17:18:07 +0000 (GMT)
Date: Wed, 2 Aug 2023 22:48:05 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v7 2/2] PCI: rpaphp: Error out on busy status from
 get-sensor-state
Message-ID: <d2iekrpa4ntky6ljqyo5rwqlq2c7e3m32etrgrkq223j736as6@gozot3d5llb3>
References: <169018891453.2762525.13358294392014600391.stgit@jupiter>
 <20230801213808.GA51837@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801213808.GA51837@bhelgaas>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oi1ZHy5CHZHfGTBp25QvCbdES6RcWKeG
X-Proofpoint-ORIG-GUID: iSFkRKGGPq8spl_157sD-xFY3icVYu7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_13,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308020151
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-08-01 16:38:08 Tue, Bjorn Helgaas wrote:
> On Mon, Jul 24, 2023 at 02:25:19PM +0530, Mahesh Salgaonkar wrote:
> > When certain PHB HW failure causes pHyp to recover PHB, it marks the PE
> > state as temporarily unavailable until recovery is complete. This also
> > triggers an EEH handler in Linux which needs to notify drivers, and perform
> > recovery. But before notifying the driver about the PCI error it uses
> > get_adapter_state()->get-sensor-state() operation of the hotplug_slot to
> > determine if the slot contains a device or not. if the slot is empty, the
> > recovery is skipped entirely.
> 
> It's helpful to use the exact function name so it's greppable; I think
> get_adapter_status() or rpaphp_get_sensor_state()?
> 
> s/if the slot is empty,/If the slot is empty,/

Sure, will correct it in next revision.

> 
> > However on certain PHB failures, the RTAS call get-sensor-state() returns
> > extended busy error (9902) until PHB is recovered by pHyp. Once PHB is
> > recovered, the get-sensor-state() returns success with correct presence
> > status. The RTAS call interface rtas_get_sensor() loops over the RTAS call
> > on extended delay return code (9902) until the return value is either
> > success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> > seconds before it could notify that the PCI error has been detected and
> > stop any active operations. Hence with running I/O traffic, during this 6
> > seconds, the network driver continues its operation and hits a timeout
> > (netdev watchdog).
> > 
> > ------------
> > [52732.244731] DEBUG: ibm_read_slot_reset_state2()
> > [52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=>
> > [52732.244798] DEBUG: in eeh_slot_presence_check
> > [52732.244804] DEBUG: error state check
> > [52732.244807] DEBUG: Is slot hotpluggable
> > [52732.244810] DEBUG: hotpluggable ops ?
> > [52732.244953] DEBUG: Calling ops->get_adapter_status
> > [52732.244958] DEBUG: calling rpaphp_get_sensor_state
> > [52736.564262] ------------[ cut here ]------------
> > [52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed o>
> > [52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev>
> > [...]
> > [52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
> > [52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
> > ------------
> > 
> > On timeouts, network driver starts dumping debug information to console
> > (e.g bnx2 driver calls bnx2x_panic_dump()), and go into recovery path while
> > pHyp is still recovering the PHB. As part of recovery, the driver tries to
> > reset the device and it keeps failing since every PCI read/write returns
> > ff's. And when EEH recovery kicks-in, the driver is unable to recover the
> > device. This impacts the ssh connection and leads to the system being
> > inaccessible. To get the NIC working again it needs a reboot or re-assign
> > the I/O adapter from HMC.
> > 
> > [ 9531.168587] EEH: Beginning: 'slot_reset'
> > [ 9531.168601] PCI 0013:01:00.0#10000: EEH: Invoking bnx2x->slot_reset()
> > [...]
> > [ 9614.110094] bnx2x: [bnx2x_func_stop:9129(enP19p1s0f0)]FUNC_STOP ramrod failed. Running a dry transaction
> > [ 9614.110300] bnx2x: [bnx2x_igu_int_disable:902(enP19p1s0f0)]BUG! Proper val not read from IGU!
> > [ 9629.178067] bnx2x: [bnx2x_fw_command:3055(enP19p1s0f0)]FW failed to respond!
> > [ 9629.178085] bnx2x 0013:01:00.0 enP19p1s0f0: bc 7.10.4
> > [ 9629.178091] bnx2x: [bnx2x_fw_dump_lvl:789(enP19p1s0f0)]Cannot dump MCP info while in PCI error
> > [ 9644.241813] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f0)]IO slot reset --> driver unload
> > [...]
> > [ 9644.241819] PCI 0013:01:00.0#10000: EEH: bnx2x driver reports: 'disconnect'
> > [ 9644.241823] PCI 0013:01:00.1#10000: EEH: Invoking bnx2x->slot_reset()
> > [ 9644.241827] bnx2x: [bnx2x_io_slot_reset:14229(enP19p1s0f1)]IO slot reset initializing...
> > [ 9644.241916] bnx2x 0013:01:00.1: enabling device (0140 -> 0142)
> > [ 9644.258604] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f1)]IO slot reset --> driver unload
> > [ 9644.258612] PCI 0013:01:00.1#10000: EEH: bnx2x driver reports: 'disconnect'
> > [ 9644.258615] EEH: Finished:'slot_reset' with aggregate recovery state:'disconnect'
> > [ 9644.258620] EEH: Unable to recover from failure from PHB#13-PE#10000.
> > [ 9644.261811] EEH: Beginning: 'error_detected(permanent failure)'
> > [...]
> > [ 9644.261823] EEH: Finished:'error_detected(permanent failure)'
> > 
> > Hence, it becomes important to inform driver about the PCI error detection
> > as early as possible, so that driver is aware of PCI error and waits for
> > EEH handler's next action for successful recovery.
> 
> I don't really understand the connection between EEH and
> get_adapter_status(), but I guess this probably refers to
> arch/powerpc/kernel/eeh_driver.c, not the PCI core aer.c and err.c?

Yup, EEH is an I/O error recovery mechanism on powerpc. On error during
during I/O operations on the PCI bus, EEH handler makes sure that the
error is not due to hotplug remove, before proceeding with recovery.
Depending on whether device is present or hot removed,
get_adapter_status() returns state as true or false respectively. Only
in certain failure cases it returns BUSY error.

eeh_event_handler()
  ->eeh_handle_normal_event()
    ->eeh_slot_presence_check()
      ->get_adapter_status(&state)
         skip recovery if state == false

> 
> > Current implementation uses rtas_get_sensor() API which blocks the slot
> > check state until RTAS call returns success. To avoid this, fix the PCI
> > hotplug driver (rpaphp) to return an error (-EBUSY) if the slot presence
> > state can not be detected immediately while PE is in EEH recovery state.
> > Change rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state)
> > directly only if the respective PE is in EEH recovery state, and take
> > actions based on RTAS return status. This way EEH handler will not be
> > blocked on rpaphp_get_sensor_state() and can immediately notify driver
> > about the PCI error and stop any active operations.
> > 
> > In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
> > invoke rtas_get_sensor() as it was earlier with no change in existing
> > behavior.
> > 
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
> 
> Seems like maybe both patches could go via a ppc tree since they seem
> very ppc-specific?  A couple minor comments below.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> > + * get_adapter_status() can be called by the EEH handler during EEH recovery.
> > + * On certain PHB failures, the RTAS call get-seHsor-state() returns extended
> 
> Looks like a typo in "get-seHsor-state"?

ouch. Will fix it.

> 
> > +static int __rpaphp_get_sensor_state(struct slot *slot, int *state)
> > +{
> > +#ifdef CONFIG_EEH
> 
> Is this #ifdef redundant?  It looks like this file is only compiled
> if CONFIG_EEH is set:

Thansk for pointing this out. I missed this, yes it is redundant. Will
remove it.

> 
>   config HOTPLUG_PCI_RPA
>           tristate "RPA PCI Hotplug driver"
>           depends on PPC_PSERIES && EEH
> 
>   obj-$(CONFIG_HOTPLUG_PCI_RPA)           += rpaphp.o
> 
>   rpaphp-objs             :=      rpaphp_core.o   \
>                                   rpaphp_pci.o    \
>                                   rpaphp_slot.o

Thanks for your review.
-Mahesh
