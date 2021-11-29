Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F14626DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:55:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J30zr5jbNz3cBl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 09:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ek86atD7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J30z71XQVz2xsp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 09:54:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ek86atD7; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J30z71G9Zz4xZ4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 09:54:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J30z71CGcz4xbC; Tue, 30 Nov 2021 09:54:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ek86atD7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J30z64MdSz4xZ4
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 09:54:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATMlXpM026792
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 22:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Gymc0HV9KIi2kjN+ltOey6CQM1gwam7kC4ZaXT9B8ho=;
 b=ek86atD7klWJMLeu1Q2k21xJAXxTZo6az/iCFs/RmxnTzYX7uTqM+kTzPoLtYB1XXocD
 8KWYXTBNZgnm4wsZNDJFvsn+HzuwgXc5GatAbWSHZyABPtxghmAiu6sgxXvxOJOkRuEA
 W9bzaAF/G7aujicddiSv4SX/Wh7wB1r4rOmut5Nm35NYmhITTvTQaKv/auNUTakOBGci
 zsth3nwrNvtTGBopmVs3eByYPv3fy2kawNzktrZKWC7fkiVh/ZjhKYs7SspEDzIQKWtc
 WeyY5QYsZRhZDUKdf8YyIyJaUG7kHfe92xArkEBjEnmTXYzha4dmlfpeuMWZ96Qy2sXo Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn7ygr2sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 22:54:22 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATMsMlA005240
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 22:54:22 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn7ygr2rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 22:54:22 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATMqKrB020972;
 Mon, 29 Nov 2021 22:54:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3cn5exc1fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 22:54:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATMsJj731064424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 22:54:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BC0778064;
 Mon, 29 Nov 2021 22:54:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4981A7805C;
 Mon, 29 Nov 2021 22:54:18 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.210.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 22:54:18 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking() for
 pci hotplug driver.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <2083eff5-a00e-5a2b-4e83-20deb302a756@linux.ibm.com>
Date: Mon, 29 Nov 2021 14:54:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <163817631601.2016996.16085383012429651821.stgit@jupiter>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: arLgqcTyoUZUmQoEABdjXGbjDNWoWxEq
X-Proofpoint-ORIG-GUID: UxTj8CmGYrxhyqkXcQhwRg4vfXajxDmY
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290106
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
Cc: lxie@us.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/21 12:58 AM, Mahesh Salgaonkar wrote:
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
> Fix this issue by introducing a new rtas_get_sensor_nonblocking() that does
> not get blocked on BUSY condition and returns immediately with error. Use
> this function in pseries pci hotplug driver which can return an error if
> slot presence state can not be detected immediately. Please note that only
> in certain PHB failures, the slot presence check returns BUSY condition. In
> normal cases it returns immediately with a correct presence state value.
> Hence this change has no impact on normal pci dlpar operations.
> 
> We could use rtas_get_sensor_fast() variant, but it thorws WARN_ON on BUSY
> condition. The rtas_get_sensor_nonblocking() suppresses WARN_ON.
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> 
> This is an alternate approach to fix the EEH issue instead of delaying slot
> presence check proposed at
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236956.html
> 
> Also refer:
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237027.html
> ---
>  arch/powerpc/include/asm/rtas.h  |    1 +
>  arch/powerpc/kernel/rtas.c       |   19 ++++++++++++++++---
>  drivers/pci/hotplug/rpaphp_pci.c |    8 ++++----
>  3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 9dc97d2f9d27e..d8e8befb1c193 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -250,6 +250,7 @@ extern void rtas_os_term(char *str);
>  void rtas_activate_firmware(void);
>  extern int rtas_get_sensor(int sensor, int index, int *state);
>  extern int rtas_get_sensor_fast(int sensor, int index, int *state);
> +int rtas_get_sensor_nonblocking(int sensor, int index, int *state);
>  extern int rtas_get_power_level(int powerdomain, int *level);
>  extern int rtas_set_power_level(int powerdomain, int level, int *setlevel);
>  extern bool rtas_indicator_present(int token, int *maxindex);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index ac61e226c9af6..fd5aa3bbd46c5 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -609,7 +609,8 @@ int rtas_get_sensor(int sensor, int index, int *state)
>  }
>  EXPORT_SYMBOL(rtas_get_sensor);
> 
> -int rtas_get_sensor_fast(int sensor, int index, int *state)
> +static int
> +__rtas_get_sensor(int sensor, int index, int *state, bool warn_on)
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

The whole point of rtas_get_sensor_fast() is that on busy we will just let it
error out because we don't want to wait. I'm not sure I see the point of the
spurious WARN_ONs anytime we hit a BUSY or DELAY return code. Maybe converting
that to a pr_debug() might be better and save expanding the API with a _fast and
_nonblocking variant that do the same thing minus one surpressing a WARN_ON splat.

-Tyrel

> 
>  	if (rc < 0)
>  		return rtas_error_rc(rc);
>  	return rc;
>  }
> 
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
> 
> 

