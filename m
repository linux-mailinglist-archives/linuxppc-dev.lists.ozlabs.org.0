Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE9547B1C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 19:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LLgyk5xv1z3cFN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 03:03:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XE82b6HJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LLgxw6vRVz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 03:03:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XE82b6HJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LLgxr3DKrz4xZK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 03:03:12 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LLgxr2xjJz4xZc; Mon, 13 Jun 2022 03:03:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XE82b6HJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LLgxq4fz3z4xZK
	for <linuxppc-dev@ozlabs.org>; Mon, 13 Jun 2022 03:03:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25CFjexx009764;
	Sun, 12 Jun 2022 17:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=TJtJylOP7ogjKCrysXoMjriFf1a5dRJ/YnNa7fGEQzI=;
 b=XE82b6HJkQHkmzqb56N3lcNC+ZVNtzYy4Sr27Ec3PSxT+HXs8gFN3sQZ07EDdEaug0Fs
 zroWopWuvpxmcMRVNoFF8Gj/kp5EgZ85WNqjk72KsOC5sTdgwimxP4qaCGAn9Q0oG2eO
 hLgIXIrFY5eEswABhxf1+gWifgazE5qSc2GO1Edx3h9PPsUz6BIZcbKCgywEcAUzKAZ1
 txn00KuEWJVmYd1loSTZ8up7s67Df5EjMkblFEmdH0jN4lA3TIGP1fqOXM8xA9D0lSAo
 o5DtDl5Ve48KpdXNpuXClBBoMGzF5Clw3aVC1yvCB6rFktz26TwKC8KepqUwUwAIkp8y FA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn4p4h6qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jun 2022 17:02:59 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25CGmdWW021429;
	Sun, 12 Jun 2022 17:02:59 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn4p4h6qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jun 2022 17:02:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25CGom8L018675;
	Sun, 12 Jun 2022 17:02:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3gmjp99n8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jun 2022 17:02:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25CH2roN18284908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Jun 2022 17:02:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0B3AA4051;
	Sun, 12 Jun 2022 17:02:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0DDFA4040;
	Sun, 12 Jun 2022 17:02:51 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.31.82])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Sun, 12 Jun 2022 17:02:51 +0000 (GMT)
Date: Sun, 12 Jun 2022 22:32:48 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
Message-ID: <20220612170248.l6ftaneqjfof2jrc@in.ibm.com>
References: <165099464934.1658371.1526973220374528897.stgit@jupiter>
 <20220428204740.GA42242@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428204740.GA42242@bhelgaas>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qeq_uA94OiD7W3Co2q7WRTwHeo6m-oVC
X-Proofpoint-ORIG-GUID: qVO4gMlyd9cg7qO6huB_tlqlL05oakLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_07,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206120084
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

On 2022-04-28 15:47:40 Thu, Bjorn Helgaas wrote:
> On Tue, Apr 26, 2022 at 11:07:39PM +0530, Mahesh Salgaonkar wrote:
> > When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> > state as temporarily unavailable until recovery is complete. This also
> > triggers an EEH handler in Linux which needs to notify drivers, and perform
> > recovery. But before notifying the driver about the PCI error it uses
> > get_adapter_state()->get-sensor-state() operation of the hotplug_slot to
> > determine if the slot contains a device or not. if the slot is empty, the
>                                                   If
> > recovery is skipped entirely.
> > 
> > However on certain PHB failures, the rtas call get-sensor-state() returns
> > extended busy error (9902) until PHB is recovered by phyp. Once PHB is
> > recovered, the get-sensor-state() returns success with correct presence
> > status. The RTAS call interface rtas_get_sensor() loops over the rtas call
> > on extended delay return code (9902) until the return value is either
> > success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> > seconds before it could notify that the pci error has been detected and
> > stop any active operations. Hence with running I/O traffic, during this 6
> > seconds, the network driver continues its operation and hits a timeout
> > (netdev watchdog). On timeouts, network driver go into ffdc capture mode
> 
> I assume ffdc == First Failure Data Capture (please expand and remove
> the redundant "capture")  Is this a powerpc thing?  "ffdc" doesn't
> occur in drivers/net, so I don't know what network driver this refers
> to.

Sorry for delay in response.

What I meant by ffdc here is that bnx2 driver calls bnx2x_panic_dump()
soon after netdev watchdog timeout, and starts dumping additional debug
information to console.

======
[ 9416.991596] bnx2x: [bnx2x_panic_dump:930(enP19p1s0f1)]begin crash dump -----------------
[ 9416.991599] bnx2x: [bnx2x_panic_dump:940(enP19p1s0f1)]def_idx(0x438)  def_att_idx(0x4)  attn_state(0x0)  spq_prod_idx(0x42) next_stats_cnt(0x413)
[ 9416.991604] bnx2x: [bnx2x_panic_dump:945(enP19p1s0f1)]DSB: attn bits(0x0)  ack(0x100)  id(0x0)  idx(0x4)
[ 9416.991608] bnx2x: [bnx2x_panic_dump:946(enP19p1s0f1)]     def (0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x43c 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0)  igu_sb_id(0xff)  igu_seg_id(0xff) pf_id(0xff)  vnic_id(0xff)  vf_id(0xff)  vf_valid (0xff) state(0xff)
[...]
[...]
[ 9417.778071] bnx2x: [bnx2x_mc_assert:751(enP19p1s0f1)]USTORM_ASSERT_INDEX 0x2f = 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[ 9417.778077] bnx2x: [bnx2x_mc_assert:751(enP19p1s0f1)]USTORM_ASSERT_INDEX 0x30 = 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[ 9417.778083] bnx2x: [bnx2x_mc_assert:751(enP19p1s0f1)]USTORM_ASSERT_INDEX 0x31 = 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[ 9417.778086] bnx2x: [bnx2x_mc_assert:763(enP19p1s0f1)]Chip Revision: everest3, FW Version: 7_13_15
[ 9417.778091] bnx2x: [bnx2x_panic_dump:1202(enP19p1s0f1)]end crash dump -----------------
======

> 
> > and reset path assuming the PCI device is in fatal condition. This
> > sometimes causes EEH recovery to fail. This impacts the ssh connection and
> > leads to the system being inaccessible.
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
> > To avoid this issue, fix the pci hotplug driver (rpaphp) to return an error
> > if the slot presence state can not be detected immediately while PE is in
> > EEH recovery state. Current implementation uses rtas_get_sensor() API which
> > blocks the slot check state until rtas call returns success. Change
> > rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state) directly
> > only if the respective pe is in EEH recovery state, and take actions based
> > on rtas return status.
> 
> I'm not too clear on what the problem is.  I guess you don't want the
> netdev watchdog timeout.  Is the NIC still operating?  It's just the
> PHB leading to the NIC that has an issue?

Yes, NIC stops functioning. Since EEH handler delays the reporting of
PCI error to driver, it starts its own recovery while pHyp is still
recovering the PHB.  As part of recovery, driver tries to reset the
device and it keeps failing since every PCI read/write returns ff's. And
when EEH recovery kicks-in, the driver is unable to recover the device.
To get the NIC working again it needs a reboot or re-assign the I/O
adapter from HMC. Hence, it becomes important to inform driver about the
PCI error detection as early as possible. This way driver is aware of PCI
error and waits for EEH handler's next action for successful recovery.
This way driver does not try its own recovery to mess things up while
pHyp is still recovering the PHB.

[ 9531.168587] EEH: Beginning: 'slot_reset'
[ 9531.168601] PCI 0013:01:00.0#10000: EEH: Invoking bnx2x->slot_reset()
[...]
[ 9614.110094] bnx2x: [bnx2x_func_stop:9129(enP19p1s0f0)]FUNC_STOP ramrod failed. Running a dry transaction
[ 9614.110300] bnx2x: [bnx2x_igu_int_disable:902(enP19p1s0f0)]BUG! Proper val not read from IGU!
[ 9629.178067] bnx2x: [bnx2x_fw_command:3055(enP19p1s0f0)]FW failed to respond!
[ 9629.178085] bnx2x 0013:01:00.0 enP19p1s0f0: bc 7.10.4
[ 9629.178091] bnx2x: [bnx2x_fw_dump_lvl:789(enP19p1s0f0)]Cannot dump MCP info while in PCI error
[ 9644.241813] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f0)]IO slot reset --> driver unload
[...]
[ 9644.241819] PCI 0013:01:00.0#10000: EEH: bnx2x driver reports: 'disconnect'
[ 9644.241823] PCI 0013:01:00.1#10000: EEH: Invoking bnx2x->slot_reset()
[ 9644.241827] bnx2x: [bnx2x_io_slot_reset:14229(enP19p1s0f1)]IO slot reset initializing...
[ 9644.241916] bnx2x 0013:01:00.1: enabling device (0140 -> 0142)
[ 9644.258604] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f1)]IO slot reset --> driver unload
[ 9644.258612] PCI 0013:01:00.1#10000: EEH: bnx2x driver reports: 'disconnect'
[ 9644.258615] EEH: Finished:'slot_reset' with aggregate recovery state:'disconnect'
[ 9644.258620] EEH: Unable to recover from failure from PHB#13-PE#10000.
[ 9644.261811] EEH: Beginning: 'error_detected(permanent failure)'
[...]
[ 9644.261823] EEH: Finished:'error_detected(permanent failure)'

> 
> Apparently the remedy is to return -ENODEV (from SLOT_NOT_USABLE ==
> -9002) from rpaphp_get_sensor_state() instead of doing the retries.
> It would be good to explain why *that* is safe.

This remedy is only for PE which is in EEH recovery mode. In all other
cases there is no functionality change. This way EEH handler will not be
blocked on rpaphp_get_sensor_state() and can immediately notify driver
about the PCI error and stop any active operations.

> 
> > In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
> > invoke rtas_get_sensor() as it was earlier with no change in existing
> > behavior.
> 
> Nits:
> Follow historical convention in subject line.
> s/phyp/pHyp/   (or whatever the normal styling is)
> s/pe/PE/       (used inconsistently above and in comment)
> s/rtas/RTAS/   (Michael mentioned this already, but I guess you missed some)
> s/pci/PCI/
> s/ffdc/First Failure Data Capture/   (or the correct expansion)
> Make similar changes in the comment below.
> 

Sure, will do.

[...]
> > +}
> > +
> > +/*
> > + * get_adapter_status() can be called by the EEH handler during EEH recovery.
> > + * On certain PHB failures, the rtas call get-sensor-state() returns extended
> > + * busy error (9902) until PHB is recovered by phyp. The rtas call interface
> > + * rtas_get_sensor() loops over the rtas call on extended delay return code
> > + * (9902) until the return value is either success (0) or error (-1). This
> > + * causes the EEH handler to get stuck for ~6 seconds before it could notify
> > + * that the pci error has been detected and stop any active operations. This
> > + * sometimes causes EEH recovery to fail. To avoid this issue, invoke
> > + * rtas_call(get-sensor-state) directly if the respective pe is in EEH recovery
> > + * state and return -EBUSY error based on rtas return status. This will help
> > + * the EEH handler to notify the driver about the pci error immediately and
> > + * successfully proceed with EEH recovery steps.
> > + */
> > +static int __rpaphp_get_sensor_state(struct slot *slot, int *state)
> > +{
> > +	int rc;
> > +#ifdef CONFIG_EEH
> > +	int token = rtas_token("get-sensor-state");
> > +	struct pci_dn *pdn;
> > +	struct eeh_pe *pe;
> > +	struct pci_controller *phb = PCI_DN(slot->dn)->phb;
> > +
> > +	if (token == RTAS_UNKNOWN_SERVICE)
> > +		return -ENOENT;
> > +
> > +	/*
> > +	 * Fallback to existing method for empty slot or pe isn't in EEH
> > +	 * recovery.
> > +	 */
> > +	if (list_empty(&PCI_DN(phb->dn)->child_list))
> > +		goto fallback;
> > +
> > +	pdn = list_first_entry(&PCI_DN(phb->dn)->child_list,
> > +			       struct pci_dn, list);
> 
> I guess you don't need locking to ensure that child_list doesn't
> become empty between the list_empty() and the list_first_entry()?

Maybe I can switch to use of list_first_entry_or_null() ?

> I didn't see locking at other places that traverse it, but it's not
> obvious to me what protects it.
> 
> > +	pe = eeh_dev_to_pe(pdn->edev);
> > +	if (pe && (pe->state & EEH_PE_RECOVERING)) {
> > +		rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE,
> > +			       slot->index);
> > +		if (rc)
> > +			rc = rtas_to_errno(rc);
> > +		return rc;
> 
> I'd probably make rtas_to_errno(0) return 0, then do:
> 
>   return rtas_to_errno(rc);
> 

Agree.

Thanks,
-Mahesh.
