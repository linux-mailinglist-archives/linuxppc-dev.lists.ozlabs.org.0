Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF650EC39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 00:40:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnKj54F4vz2yY7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 08:40:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IEDBfIXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnKhM6dStz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 08:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IEDBfIXq; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KnKhM3hmWz4xL5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 08:39:47 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KnKhM3dtWz4xTX; Tue, 26 Apr 2022 08:39:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IEDBfIXq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KnKhL4z8fz4xL5
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Apr 2022 08:39:45 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PLpuFf037761
 for <linuxppc-dev@ozlabs.org>; Mon, 25 Apr 2022 22:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=shH/meKKsI8taf5k9Tk9OLKzXZzvi8VwnyFDfWgWcuc=;
 b=IEDBfIXq5eIsfK7E6BmnRXwRp+l3MEFNfyjUEaxWNv1mYFUz4Jbsu5NLkAe8ht7NbnQh
 2kmS+rWSvoCeOEenQQ2Pyhk4SGuxQ8rMTD1zN9h/Pde0l0k2vxif/lEMzCGPJ2P3ft5R
 gCuvq0fLM7ua9hz+V10sIiWJ4qitpbWP6n5bTWBLRnwnUPUZ+SVFPBF9BRX535zmseXN
 9+l//u62pAB+nvHS9KjBjBGB/LcxKCZUX8ARcfI5wF/lEi1dYMPpSl60r/ah+Rfq+pi+
 61ehWt92mNCv9dPiH6SbR5F7+ZlMTvyCOJKfMynJzdSKVDRjgnX7STlSralkc7ixQU5Q 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp3xdrrxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 25 Apr 2022 22:39:43 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23PMYjot030062
 for <linuxppc-dev@ozlabs.org>; Mon, 25 Apr 2022 22:39:42 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp3xdrrxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 22:39:42 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23PMcKcg028381;
 Mon, 25 Apr 2022 22:39:42 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3fm939vp87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 22:39:42 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23PMdfog33358164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 22:39:41 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2ABF628066;
 Mon, 25 Apr 2022 22:39:41 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E614B2805E;
 Mon, 25 Apr 2022 22:39:40 +0000 (GMT)
Received: from localhost (unknown [9.163.16.230])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 25 Apr 2022 22:39:40 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v5] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
In-Reply-To: <164684593617.368427.2230609269419942906.stgit@jupiter>
References: <164684593617.368427.2230609269419942906.stgit@jupiter>
Date: Mon, 25 Apr 2022 17:39:40 -0500
Message-ID: <877d7crdn7.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mInmEAJLicjZJLL4tpqXWrHUL5vQ646r
X-Proofpoint-GUID: J3xhIlehe-drvyEU14Mvjj-0BZDgXkLw
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250101
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
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
>
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

Sorry for the long delay. I think it looks OK now. Does this need to go
to the PCI list/maintainer?

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
