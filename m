Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117376BF60
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 23:39:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0n/52uU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFpQY5nPkz3bZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 07:39:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0n/52uU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFpPj4yCWz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 07:38:17 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RFpPd2zGcz4xxh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 07:38:13 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RFpPd2mQQz4xxj; Wed,  2 Aug 2023 07:38:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0n/52uU;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RFpPd0592z4xxh
	for <linuxppc-dev@ozlabs.org>; Wed,  2 Aug 2023 07:38:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 074796170B;
	Tue,  1 Aug 2023 21:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41263C433C8;
	Tue,  1 Aug 2023 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690925890;
	bh=L9yzo4o83vj4Z4G5LjXyDNNMIl4uZDRWjd0/MKTecbs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=s0n/52uUJK5yMxrM2nLvnjq1pew8zyNXY/3DO3orcI1nzkY2cZiWv7fWmU+SlUVQz
	 +iQgZ2r5v6TcBdeKakhrDg4XxoIJpLWSapA4Y4WwtvDalUvIPL0QShVFydpFKAcck2
	 GDLwQpRsqZk3zWdRGPhPs5YfukMHBguteBCSPmVjPhtlufLIEvz8GtLQo5z3ruvo2w
	 tTQB4qcFut6TkcMZKOaTOwHXiZb7hIbBQxiRP0pa+v5PQO6XE2fOKzTvNqbcPod/hk
	 /GmGNT8AxvpH6eKbTlCpiUVhcO6f5lKluwzo+Tj02g7Nn2qTxsBbcITTa9Cho44V29
	 MRxXEUSF0B+7A==
Date: Tue, 1 Aug 2023 16:38:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v7 2/2] PCI: rpaphp: Error out on busy status from
 get-sensor-state
Message-ID: <20230801213808.GA51837@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169018891453.2762525.13358294392014600391.stgit@jupiter>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 24, 2023 at 02:25:19PM +0530, Mahesh Salgaonkar wrote:
> When certain PHB HW failure causes pHyp to recover PHB, it marks the PE
> state as temporarily unavailable until recovery is complete. This also
> triggers an EEH handler in Linux which needs to notify drivers, and perform
> recovery. But before notifying the driver about the PCI error it uses
> get_adapter_state()->get-sensor-state() operation of the hotplug_slot to
> determine if the slot contains a device or not. if the slot is empty, the
> recovery is skipped entirely.

It's helpful to use the exact function name so it's greppable; I think
get_adapter_status() or rpaphp_get_sensor_state()?

s/if the slot is empty,/If the slot is empty,/

> However on certain PHB failures, the RTAS call get-sensor-state() returns
> extended busy error (9902) until PHB is recovered by pHyp. Once PHB is
> recovered, the get-sensor-state() returns success with correct presence
> status. The RTAS call interface rtas_get_sensor() loops over the RTAS call
> on extended delay return code (9902) until the return value is either
> success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> seconds before it could notify that the PCI error has been detected and
> stop any active operations. Hence with running I/O traffic, during this 6
> seconds, the network driver continues its operation and hits a timeout
> (netdev watchdog).
> 
> ------------
> [52732.244731] DEBUG: ibm_read_slot_reset_state2()
> [52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=>
> [52732.244798] DEBUG: in eeh_slot_presence_check
> [52732.244804] DEBUG: error state check
> [52732.244807] DEBUG: Is slot hotpluggable
> [52732.244810] DEBUG: hotpluggable ops ?
> [52732.244953] DEBUG: Calling ops->get_adapter_status
> [52732.244958] DEBUG: calling rpaphp_get_sensor_state
> [52736.564262] ------------[ cut here ]------------
> [52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed o>
> [52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev>
> [...]
> [52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
> [52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
> ------------
> 
> On timeouts, network driver starts dumping debug information to console
> (e.g bnx2 driver calls bnx2x_panic_dump()), and go into recovery path while
> pHyp is still recovering the PHB. As part of recovery, the driver tries to
> reset the device and it keeps failing since every PCI read/write returns
> ff's. And when EEH recovery kicks-in, the driver is unable to recover the
> device. This impacts the ssh connection and leads to the system being
> inaccessible. To get the NIC working again it needs a reboot or re-assign
> the I/O adapter from HMC.
> 
> [ 9531.168587] EEH: Beginning: 'slot_reset'
> [ 9531.168601] PCI 0013:01:00.0#10000: EEH: Invoking bnx2x->slot_reset()
> [...]
> [ 9614.110094] bnx2x: [bnx2x_func_stop:9129(enP19p1s0f0)]FUNC_STOP ramrod failed. Running a dry transaction
> [ 9614.110300] bnx2x: [bnx2x_igu_int_disable:902(enP19p1s0f0)]BUG! Proper val not read from IGU!
> [ 9629.178067] bnx2x: [bnx2x_fw_command:3055(enP19p1s0f0)]FW failed to respond!
> [ 9629.178085] bnx2x 0013:01:00.0 enP19p1s0f0: bc 7.10.4
> [ 9629.178091] bnx2x: [bnx2x_fw_dump_lvl:789(enP19p1s0f0)]Cannot dump MCP info while in PCI error
> [ 9644.241813] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f0)]IO slot reset --> driver unload
> [...]
> [ 9644.241819] PCI 0013:01:00.0#10000: EEH: bnx2x driver reports: 'disconnect'
> [ 9644.241823] PCI 0013:01:00.1#10000: EEH: Invoking bnx2x->slot_reset()
> [ 9644.241827] bnx2x: [bnx2x_io_slot_reset:14229(enP19p1s0f1)]IO slot reset initializing...
> [ 9644.241916] bnx2x 0013:01:00.1: enabling device (0140 -> 0142)
> [ 9644.258604] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f1)]IO slot reset --> driver unload
> [ 9644.258612] PCI 0013:01:00.1#10000: EEH: bnx2x driver reports: 'disconnect'
> [ 9644.258615] EEH: Finished:'slot_reset' with aggregate recovery state:'disconnect'
> [ 9644.258620] EEH: Unable to recover from failure from PHB#13-PE#10000.
> [ 9644.261811] EEH: Beginning: 'error_detected(permanent failure)'
> [...]
> [ 9644.261823] EEH: Finished:'error_detected(permanent failure)'
> 
> Hence, it becomes important to inform driver about the PCI error detection
> as early as possible, so that driver is aware of PCI error and waits for
> EEH handler's next action for successful recovery.

I don't really understand the connection between EEH and
get_adapter_status(), but I guess this probably refers to
arch/powerpc/kernel/eeh_driver.c, not the PCI core aer.c and err.c?

> Current implementation uses rtas_get_sensor() API which blocks the slot
> check state until RTAS call returns success. To avoid this, fix the PCI
> hotplug driver (rpaphp) to return an error (-EBUSY) if the slot presence
> state can not be detected immediately while PE is in EEH recovery state.
> Change rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state)
> directly only if the respective PE is in EEH recovery state, and take
> actions based on RTAS return status. This way EEH handler will not be
> blocked on rpaphp_get_sensor_state() and can immediately notify driver
> about the PCI error and stop any active operations.
> 
> In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
> invoke rtas_get_sensor() as it was earlier with no change in existing
> behavior.
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

Seems like maybe both patches could go via a ppc tree since they seem
very ppc-specific?  A couple minor comments below.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> + * get_adapter_status() can be called by the EEH handler during EEH recovery.
> + * On certain PHB failures, the RTAS call get-seHsor-state() returns extended

Looks like a typo in "get-seHsor-state"?

> +static int __rpaphp_get_sensor_state(struct slot *slot, int *state)
> +{
> +#ifdef CONFIG_EEH

Is this #ifdef redundant?  It looks like this file is only compiled
if CONFIG_EEH is set:

  config HOTPLUG_PCI_RPA
          tristate "RPA PCI Hotplug driver"
          depends on PPC_PSERIES && EEH

  obj-$(CONFIG_HOTPLUG_PCI_RPA)           += rpaphp.o

  rpaphp-objs             :=      rpaphp_core.o   \
                                  rpaphp_pci.o    \
                                  rpaphp_slot.o

> +	int rc;
> +	int token = rtas_token("get-sensor-state");
> +	struct pci_dn *pdn;
> +	struct eeh_pe *pe;
> +	struct pci_controller *phb = PCI_DN(slot->dn)->phb;
> +
> +	if (token == RTAS_UNKNOWN_SERVICE)
> +		return -ENOENT;
> +
> +	/*
> +	 * Fallback to existing method for empty slot or PE isn't in EEH
> +	 * recovery.
> +	 */
> +	pdn = list_first_entry_or_null(&PCI_DN(phb->dn)->child_list,
> +					struct pci_dn, list);
> +	if (!pdn)
> +		goto fallback;
> +
> +	pe = eeh_dev_to_pe(pdn->edev);
> +	if (pe && (pe->state & EEH_PE_RECOVERING)) {
> +		rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE,
> +			       slot->index);
> +		return rtas_get_sensor_errno(rc);
> +	}
> +fallback:
> +#endif
> +	return rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
> +}
> +
>  int rpaphp_get_sensor_state(struct slot *slot, int *state)
>  {
>  	int rc;
>  	int setlevel;
>  
> -	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
> +	rc = __rpaphp_get_sensor_state(slot, state);
>  
>  	if (rc < 0) {
>  		if (rc == -EFAULT || rc == -EEXIST) {
> @@ -40,8 +117,7 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
>  				dbg("%s: power on slot[%s] failed rc=%d.\n",
>  				    __func__, slot->name, rc);
>  			} else {
> -				rc = rtas_get_sensor(DR_ENTITY_SENSE,
> -						     slot->index, state);
> +				rc = __rpaphp_get_sensor_state(slot, state);
>  			}
>  		} else if (rc == -ENODEV)
>  			info("%s: slot is unusable\n", __func__);
> 
> 
