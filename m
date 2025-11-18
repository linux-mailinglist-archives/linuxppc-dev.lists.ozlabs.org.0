Return-Path: <linuxppc-dev+bounces-14289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5EC685BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 09:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9dlH24kJz2yG5;
	Tue, 18 Nov 2025 19:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763456203;
	cv=none; b=ODFToYghOpeEk6RywhWTPzq0KYlHjC7UGUlG47/VgWBxSYALQ5dbyu7ZJJkP7NaKX0uiaeopuvNCeGkhTPQYo/cp0dOr7ghB+lwzaG8UPorumQ8nzmbhMLtlxKaLUICPk/6YYfia7+Od9xNOcO9TNU8ENa8TbdhHYiRSvNjUG4dBsmm6EmSrq4xrMJ8iEqGogUxK7kNVMpP4RoWB3pavN6dEIBwDf91N6kF19OLL0dK36tzoqKeaR0QBladGeWSjGyfHjQhV+XJEk2NbKj8wn9So3EgWrqpLs9sgJm0nCpLWj2V6l4IAjLxO+syeonzG66NHJ3APDve5dGxqvhig/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763456203; c=relaxed/relaxed;
	bh=kp6SgNvdE83n8R2vocx00QrPacgfddBmxKQaEaYm+5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvUGGgJ3dKztQhobyYVz16zSIzyUcuPJLgy3XlNlfhf89ukQjO/YTRSt63XRyiY4ty0SpbFxtcz9gnkko6ph6bHLdtBOZGjkTdXu32fjThkYKbcPv9w+95mzhkiLoU2WpiJugdhRn5/6AQuX8PsBtmfAAq0pvubY9/VhK4GLIfJDWu0SKtd2Ew1mrThrdYIQJyhuY0vXrnTOVM8QzQOm1j2C6jUMjmmSyv1bQasRrqw9dm9Nx0TclkFwBJ6okVkP2f5XUnaBbQoqbFLuGkrSxdqAKK1PXrB39BeX5LLik4y1Z5io9mvNBUKWd44Lw6Q3XCG3+cD/VC4rmp9sDSI63g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H74U6hms; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H74U6hms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9dlG0rsSz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 19:56:41 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI5mwSK026915;
	Tue, 18 Nov 2025 08:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=kp6SgNvdE83n8R2vocx00QrPacgfddBmxKQaEaYm+5E=; b=H74U6hms81+j
	wxTa5PjWY0dtsD8xJqj+pmFQCyfc5InOueHvY4pf7tF3znuZ/lgEoTIP2CzyJHQY
	HpYI4nS7GHPjcrK3/8c9FzUlnBN4k1Sro+jzfTJA40g7t13EZ32p/HoHIspBuD98
	lYRUgerPlEYrGTYIJDkllVBhMWCvHJXWBjOtlwDiBg619yNUD9XZITnHabjU2/Lr
	7kQl+kMRCZcdse26X4RKn1CTUel/cf2AVpTi2yFDQd3/uJYJgCZFiJNlzfYUpwE5
	c7MbmancdBIj90bw0ee4HHPhVIS6ha10icR9G5lLhCmnrh4mhTM5OqBG0TG4sUxq
	CB1RKKTMQw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw1wmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 08:56:29 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AI8ptlp024786;
	Tue, 18 Nov 2025 08:56:29 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw1wm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 08:56:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI7xdIa022347;
	Tue, 18 Nov 2025 08:56:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umt73v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 08:56:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AI8uNti26018404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 08:56:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8E172004B;
	Tue, 18 Nov 2025 08:56:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F24E320040;
	Tue, 18 Nov 2025 08:56:20 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.249.234])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Nov 2025 08:56:20 +0000 (GMT)
Date: Tue, 18 Nov 2025 14:26:18 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: oohall@gmail.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, bhelgaas@google.com,
        tpearson@raptorengineering.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
        sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: Re: [PATCH 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove
 locking in EEH event handling
Message-ID: <nc4udvo6zlszyo7n5roavkjnfpwa2owqpwkov5bl5frmkvclrd@plttt3brumjp>
Reply-To: mahesh@linux.ibm.com
References: <20251105064052.8122-1-nnmlinux@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105064052.8122-1-nnmlinux@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691c34bd cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=r5R9aoGpFNAZDtxg3OcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX8ghxT6wpMIdB
 p0sfStN6X5rQgTDpY2aJukgy8piKFU6M0moGIkYfNaiPSqO0nHj4wnol6DAAcxEF2o8oCajmed5
 rc6fZi/FFpSvmquRQKEe87foAL/Y2qagZi5zYbOXcUwXYw88wMNzSGCb1aY0UPkEnt7RFZBooLM
 lcjVt1nc7wqQdqbsE3asJL4Qe+YJ+fQuoznfFW+03oRSonRIXRdN43DkvCdctwyHF3fKaIxmK/N
 rcUwA2Y29GB6LlXU3lCwVbkOcMYEo87LXQFj4I/8GHTkz/Kv9gPokBbbKoHtZQ0UcYOk98s3IVG
 PaUDR33Zii7aO8c7xM9Jwt0dENM4Id14OVTLj4aEwzrp5jt5DlXgmzuOugsPN4TAjkE+hlQPxT1
 ekq/bzavR/6ENi+yYxziQfDnRBLLBw==
X-Proofpoint-GUID: wZuqeoEsN97Qu5wq8UC4wDfp6yxNs3cn
X-Proofpoint-ORIG-GUID: Xoz0qEZCLyCdpzn7N2pH1nDgJy91E5C7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-11-05 00:40:52 Wed, Narayana Murty N wrote:
> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
> hotplug safe") restructured the EEH driver to improve synchronization
> with the PCI hotplug layer.
> 
> However, it inadvertently moved pci_lock_rescan_remove() outside its
> intended scope in eeh_handle_normal_event(), leading to broken PCI
> error reporting and improper EEH event triggering. Specifically,
> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
> acquire the same lock internally, causing nested locking and disrupting
> normal EEH event handling paths.
> 
> This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
> with two public wrappers:
>     eeh_pe_bus_get() with locking enabled.
>     eeh_pe_bus_get_nolock() that skips locking.
> 
> Callers that already hold pci_lock_rescan_remove() now use
> eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.
> 
> Additionally, pci_lock_rescan_remove() calls are restored to the correct
> position—after eeh_pe_bus_get() and immediately before iterating affected
> PEs and devices. This ensures EEH-triggered PCI removes occur under proper
> bus rescan locking without recursive lock contention.
> 
[...]
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index ef78ff77cf8f..492fae5e3823 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -812,6 +812,35 @@ static void eeh_clear_slot_attention(struct pci_dev *pdev)
>  	ops->set_attention_status(slot->hotplug, 0);
>  }
>  
> +static const char *eeh_pe_get_loc(struct eeh_pe *pe)
> +{

So it is duplicate of eeh_pe_loc_get() with nolock variant. Instead, can
we split original function eeh_pe_loc_get() ? Move the while (bus) loop
into another function with name eeh_bus_loc_get(bus) which will be
nolock variant and use that here ?

> +	struct pci_bus *bus = eeh_pe_bus_get_nolock(pe);
> +	struct device_node *dn;
> +	const char *location = NULL;
> +
> +	while (bus) {
> +		dn = pci_bus_to_OF_node(bus);
> +		if (!dn) {
> +			bus = bus->parent;
> +			continue;
> +		}
> +
> +		if (pci_is_root_bus(bus))
> +			location = of_get_property(dn, "ibm,io-base-loc-code",
> +						   NULL);
> +		else
> +			location = of_get_property(dn, "ibm,slot-location-code",
> +						   NULL);
> +
> +		if (location)
> +			return location;
> +
> +		bus = bus->parent;
> +	}
> +
> +	return "N/A";
> +}
> +
>  /**
>   * eeh_handle_normal_event - Handle EEH events on a specific PE
>   * @pe: EEH PE - which should not be used after we return, as it may
> @@ -846,7 +875,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  
>  	pci_lock_rescan_remove();
>  
> -	bus = eeh_pe_bus_get(pe);
> +	bus = eeh_pe_bus_get_nolock(pe);
>  	if (!bus) {
>  		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
>  			__func__, pe->phb->global_number, pe->addr);
> @@ -886,14 +915,14 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  	/* Log the event */
>  	if (pe->type & EEH_PE_PHB) {
>  		pr_err("EEH: Recovering PHB#%x, location: %s\n",
> -			pe->phb->global_number, eeh_pe_loc_get(pe));
> +			pe->phb->global_number, eeh_pe_get_loc(pe));
>  	} else {
>  		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
>  
>  		pr_err("EEH: Recovering PHB#%x-PE#%x\n",
>  		       pe->phb->global_number, pe->addr);
>  		pr_err("EEH: PE location: %s, PHB location: %s\n",
> -		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
> +		       eeh_pe_get_loc(pe), eeh_pe_get_loc(phb_pe));
>  	}
>  
Thanks,
-Mahesh.

