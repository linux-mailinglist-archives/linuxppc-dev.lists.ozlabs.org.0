Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961604F97DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 16:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZgP03H0xz3bdj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 00:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ry106G2e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZgN970t3z2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 00:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ry106G2e; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KZgN52FM8z4xYM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 00:18:45 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KZgN527kzz4xYN; Sat,  9 Apr 2022 00:18:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ry106G2e; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KZgN45DY3z4xYM
 for <linuxppc-dev@ozlabs.org>; Sat,  9 Apr 2022 00:18:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238DL7ov009648
 for <linuxppc-dev@ozlabs.org>; Fri, 8 Apr 2022 14:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=t1AWSFMDfvCZVus+QZXMcTFrbToRwZE/+ZgZ8Kkl/qQ=;
 b=Ry106G2ebMdIKoHKOvQ+v9z+oP39oSkcv6in1D7vNeHT5idjRit3LPCKmP6TFD6yI06R
 rksnaNm165tRGe/xmU42+CmzKzCKTicJC401+paMWvI5oP0Lx5m29Uizbf9n3xjLTixB
 lJG0Oi2cEHdeiJPAMkNRiMjAh2ekj4t4CsHw/3RR1WyF2z/AFoIoWxJV7MRFcxy7iWvS
 ksLXJ83Isj1VNDvEW1goXU6VgBrNNTYU0iSZyG3Sw/LqQsfwlJY9aOuEbV62qdXxQNBQ
 00SJHSOgx4/VKssTGE7KEPL2elYJmEq1w+XD0vManI/77KMysHYsOsygSs95HiaMvx18 SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa8mwfxhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 08 Apr 2022 14:18:41 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238DiBSY019208
 for <linuxppc-dev@ozlabs.org>; Fri, 8 Apr 2022 14:18:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa8mwfxgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 14:18:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238ED2Xf009278;
 Fri, 8 Apr 2022 14:18:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3f6e493xrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 14:18:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 238EIYpx26608066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 14:18:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC5474C040;
 Fri,  8 Apr 2022 14:18:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A08744C050;
 Fri,  8 Apr 2022 14:18:33 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.1.46])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Apr 2022 14:18:33 +0000 (GMT)
Date: Fri, 8 Apr 2022 19:48:30 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
Message-ID: <20220408141830.4slpxp63blktfzhv@in.ibm.com>
References: <164684593617.368427.2230609269419942906.stgit@jupiter>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164684593617.368427.2230609269419942906.stgit@jupiter>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2458NpxdnogkI0RfZWYP5G-It-Kk-aDL
X-Proofpoint-GUID: -LD_1TMGECNCoB2WvyHoY0ErABbSkWZp
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_05,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080070
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-03-09 22:42:16 Wed, Mahesh Salgaonkar wrote:
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
> stop any active operations. Hence with running I/O traffic, during this 6
> seconds, the network driver continues its operation and hits a timeout
> (netdev watchdog). On timeouts, network driver go into ffdc capture mode
> and reset path assuming the PCI device is in fatal condition. This
> sometimes causes EEH recovery to fail. This impacts the ssh connection and
> leads to the system being inaccessible.
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
> To avoid this issue, fix the pci hotplug driver (rpaphp) to return an error
> if the slot presence state can not be detected immediately while pe is in
> EEH recovery state. Current implementation uses rtas_get_sensor() API which
> blocks the slot check state until rtas call returns success. Change
> rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state) directly
> only if the respective pe is in EEH recovery state, and take actions based
> on rtas return status.
> 
> In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
> invoke rtas_get_sensor() as it was earlier with no change in existing
> behavior.
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> Change in v5:
> - Fixup #define macros with parentheses around the values.
> 
> Change in V4:
> - Error out on sensor busy only if pe is going through EEH recovery instead
>   of always error out.
> 
> Change in V3:
> - Invoke rtas_call(get-sensor-state) directly from
>   rpaphp_get_sensor_state() directly and do special handling.
> - See v2 at
>   https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237336.html
> 
> Change in V2:
> - Alternate approach to fix the EEH issue instead of delaying slot presence
>   check proposed at
>   https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236956.html
> 
> Also refer:
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237027.html
> ---
>  drivers/pci/hotplug/rpaphp_pci.c |  100 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 3 deletions(-)

Any comments on this patch?

Thanks,
-Mahesh.

> 
> diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
> index c380bdacd1466..e463e915a052a 100644
> --- a/drivers/pci/hotplug/rpaphp_pci.c
> +++ b/drivers/pci/hotplug/rpaphp_pci.c
> @@ -18,12 +18,107 @@
>  #include "../pci.h"		/* for pci_add_new_bus */
>  #include "rpaphp.h"
>  
> +/*
> + * RTAS call get-sensor-state(DR_ENTITY_SENSE) return values as per PAPR:
> + *    -1: Hardware Error
> + *    -2: RTAS_BUSY
> + *    -3: Invalid sensor. RTAS Parameter Error.
> + * -9000: Need DR entity to be powered up and unisolated before RTAS call
> + * -9001: Need DR entity to be powered up, but not unisolated, before RTAS call
> + * -9002: DR entity unusable
> + *  990x: Extended delay - where x is a number in the range of 0-5
> + */
> +#define RTAS_HARDWARE_ERROR	(-1)
> +#define RTAS_INVALID_SENSOR	(-3)
> +#define SLOT_UNISOLATED		(-9000)
> +#define SLOT_NOT_UNISOLATED	(-9001)
> +#define SLOT_NOT_USABLE		(-9002)
> +
> +static int rtas_to_errno(int rtas_rc)
> +{
> +	int rc;
> +
> +	switch (rtas_rc) {
> +	case RTAS_HARDWARE_ERROR:
> +		rc = -EIO;
> +		break;
> +	case RTAS_INVALID_SENSOR:
> +		rc = -EINVAL;
> +		break;
> +	case SLOT_UNISOLATED:
> +	case SLOT_NOT_UNISOLATED:
> +		rc = -EFAULT;
> +		break;
> +	case SLOT_NOT_USABLE:
> +		rc = -ENODEV;
> +		break;
> +	case RTAS_BUSY:
> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> +		rc = -EBUSY;
> +		break;
> +	default:
> +		err("%s: unexpected RTAS error %d\n", __func__, rtas_rc);
> +		rc = -ERANGE;
> +		break;
> +	}
> +	return rc;
> +}
> +
> +/*
> + * get_adapter_status() can be called by the EEH handler during EEH recovery.
> + * On certain PHB failures, the rtas call get-sensor-state() returns extended
> + * busy error (9902) until PHB is recovered by phyp. The rtas call interface
> + * rtas_get_sensor() loops over the rtas call on extended delay return code
> + * (9902) until the return value is either success (0) or error (-1). This
> + * causes the EEH handler to get stuck for ~6 seconds before it could notify
> + * that the pci error has been detected and stop any active operations. This
> + * sometimes causes EEH recovery to fail. To avoid this issue, invoke
> + * rtas_call(get-sensor-state) directly if the respective pe is in EEH recovery
> + * state and return -EBUSY error based on rtas return status. This will help
> + * the EEH handler to notify the driver about the pci error immediately and
> + * successfully proceed with EEH recovery steps.
> + */
> +static int __rpaphp_get_sensor_state(struct slot *slot, int *state)
> +{
> +	int rc;
> +#ifdef CONFIG_EEH
> +	int token = rtas_token("get-sensor-state");
> +	struct pci_dn *pdn;
> +	struct eeh_pe *pe;
> +	struct pci_controller *phb = PCI_DN(slot->dn)->phb;
> +
> +	if (token == RTAS_UNKNOWN_SERVICE)
> +		return -ENOENT;
> +
> +	/*
> +	 * Fallback to existing method for empty slot or pe isn't in EEH
> +	 * recovery.
> +	 */
> +	if (list_empty(&PCI_DN(phb->dn)->child_list))
> +		goto fallback;
> +
> +	pdn = list_first_entry(&PCI_DN(phb->dn)->child_list,
> +			       struct pci_dn, list);
> +	pe = eeh_dev_to_pe(pdn->edev);
> +	if (pe && (pe->state & EEH_PE_RECOVERING)) {
> +		rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE,
> +			       slot->index);
> +		if (rc)
> +			rc = rtas_to_errno(rc);
> +		return rc;
> +	}
> +fallback:
> +#endif
> +	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
> +	return rc;
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
> @@ -39,8 +134,7 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
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

-- 
Mahesh J Salgaonkar
