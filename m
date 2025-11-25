Return-Path: <linuxppc-dev+bounces-14474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955DC8359B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 05:46:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFqsN20Gvz2yrT;
	Tue, 25 Nov 2025 15:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764045992;
	cv=none; b=W8nS2Qeu6s38BeCJoUiwGXcqv/6MLhQFc6BB0jeDLWLmpHGJtfDPfq5O/zq0qG8SyjXbbxq21V8COmRQ/BtcN2uyY0k1PouW1PWmhhMLykLUJDKt0BQnRnjX1MHbp0QygUI9n8cEo0lIldTAiehq3jMsFqnKZhbI6nABQOC2miK70FChw1CTwr8OpJAa6Bt1obCUai78EdKfPX4oXWZKuCMJuEJNczE+8tQC0Kh7fjZC0mnAVdV9Sw5fXz6NTfaKGsB8T/P4QxI9ZUHDRIt/tYfKFR48GO07/4u7N8yEr2m/Nv0JFokxgn6IKXHobZdEBWPQ5BOfSGDBqAzrvzpHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764045992; c=relaxed/relaxed;
	bh=QgylxcOBcYumc+C2HTw8AVKa1wnhmMLyqwfSNfinsd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wnkgi8Ch6TcFgG5/LKQR4FSLn53fB8yo6OaCmIBmBaqHQ4hyapCzihIYFFGlGPSXYG01AVfmcJyViSk6LmdMmMYcPz/1mArUGuymNb5L2JzzfnRobBSqqmGXk/cq/Q6N/lTW5Yp0QDRjjPZMOvO69W9XIpMVMnGITR1Rmomihj6qe56W4kEbb8hr/ARWCuIRM74iyD5UWkpF4BS8iRp1rRx9OXhR6MNDMID7B6PfV3WsXR9r3g+V7kQ5cFJ2Meg3TrtuuOM4chitWstk4U8uvaTdC7gnSKBqt4HAoKaBtJFKK31ZynSdmiJvoVijmGYZ7yv006iscjLery68/xBnFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ncc8cOzX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ncc8cOzX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFqsL6kbFz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 15:46:30 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP4XU9i003102;
	Tue, 25 Nov 2025 04:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=QgylxcOBcYumc+C2HTw8AVKa1wnhmMLyqwfSNfinsd4=; b=ncc8cOzXTYqT
	39x1ZJZo5WOYS7bGj2Du9ZphXVJxBXgZu+Jsr4dfy+mqQ77ITiFdVFUiyMV4kplY
	t9/RXkEuLlPqWUB6q3LiSsGJaPHde9jwB9YWs3BVQgIEUzaESiRG7ypg6Metf/Bi
	xfjKiKfWUDhk3pMW7ffdFvx0GQa/J8ayI1pwpb/fyRTeKZK4jEYq/ap60BgrSRkN
	iN3MllpztkaNPenePspJSHCyAqZ68st3TN2XUgmZWqAgtxSh3Uk0jUrOo4oRo2kB
	sK474Y0ksmtTxcgOHw39mbUJwch5vwyuZTWB7uMDQf+Ot/KtH3HmhzkDl+8Wah5R
	VC0EMJHSEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjtxq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 04:46:13 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AP4kCIG015748;
	Tue, 25 Nov 2025 04:46:12 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjtxpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 04:46:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP3Zrxf025139;
	Tue, 25 Nov 2025 04:46:11 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4akt719965-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 04:46:11 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AP4k7j741484642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Nov 2025 04:46:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1D3420049;
	Tue, 25 Nov 2025 04:46:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16AE620040;
	Tue, 25 Nov 2025 04:46:05 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.19.222])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Nov 2025 04:46:04 +0000 (GMT)
Date: Tue, 25 Nov 2025 10:16:01 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: oohall@gmail.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, bhelgaas@google.com,
        tpearson@raptorengineering.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
        sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: Re: [PATCH v1 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove
 locking in EEH event handling
Message-ID: <dqoufbaj47rd2cn5x6fnwho4hwyq557g2pzak35pf5ipi77lfz@fh2xbozyr3rn>
Reply-To: mahesh@linux.ibm.com
References: <20251120054418.3363-1-nnmlinux@linux.ibm.com>
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
In-Reply-To: <20251120054418.3363-1-nnmlinux@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j3H2LAjz2hOAMAxmepqIXmZ5yPFL2gBr
X-Authority-Analysis: v=2.4 cv=frbRpV4f c=1 sm=1 tr=0 ts=69253495 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=0k1pAd4OPxnk7iD5JEYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zCsWco0swqwzp-9pQ4L-iKDpnJ92KMsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAwOCBTYWx0ZWRfX6oH//tbgcvvF
 l/0zX2Tb5IpP9YBrTp3hTQ7q/SfjavDuIOyJB3K6/pj25J156Yx4SwDpYJo5okWXsi4OIOTMgDa
 AFHX2wAwDfjYISxTaaAd7Tfv6yQpGI4nMhjhrY2WfnnVttX1X1QrRQbq78FRkZzUmo3vEKuo5fK
 Cxdb0gtRn9QbkTQJfAfQfINHpUbO5i2MZq5PFG9vZEkKHxXD0ggSyDxITWSlfEyCDcdw/FAZA0Y
 TUkujt4jqwuC2tpxgaPvyHOp+IenE+VL1665ICadIJrsmhAxZL2LSYevd5drlvLD8FEeuXQAVEm
 /wBjeoxYaezlSbsZ+s6UX+G9h57cgz11E5zjeK9AR48RzMcUBmVRFiBnbDzbnOFIO35GNA2sqHK
 87fCT4VRhG0vWJ3iXAwZRFMkNkhKEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-11-19 23:44:18 Wed, Narayana Murty N wrote:
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
> The eeh_pe_loc_get() function has been split into two functions:
>     eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
>     eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>     code for given bus.
> 
> 
[...]
> Changelog:
> V1:
>   * Split eeh_pe_loc_get() into two functions — eeh_pe_loc_get() and
>   * eeh_pe_loc_get_bus() to separate PE-to-bus lookup from PCI bus location
>   * code retrieval, per code review suggestions.
> ---
>  arch/powerpc/include/asm/eeh.h   |  2 +
>  arch/powerpc/kernel/eeh_driver.c | 11 ++---
>  arch/powerpc/kernel/eeh_pe.c     | 74 ++++++++++++++++++++++++++++++--
>  3 files changed, 78 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 5e34611de9ef..b7ebb4ac2c71 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -289,6 +289,8 @@ void eeh_pe_dev_traverse(struct eeh_pe *root,
>  void eeh_pe_restore_bars(struct eeh_pe *pe);
>  const char *eeh_pe_loc_get(struct eeh_pe *pe);
>  struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
> +const char *eeh_pe_loc_get_bus(struct pci_bus *bus);
> +struct pci_bus *eeh_pe_bus_get_nolock(struct eeh_pe *pe);
>  
>  void eeh_show_enabled(void);
>  int __init eeh_init(struct eeh_ops *ops);
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index ef78ff77cf8f..028f69158532 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -846,7 +846,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  
>  	pci_lock_rescan_remove();
>  
> -	bus = eeh_pe_bus_get(pe);
> +	bus = eeh_pe_bus_get_nolock(pe);
>  	if (!bus) {
>  		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
>  			__func__, pe->phb->global_number, pe->addr);
> @@ -886,14 +886,15 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  	/* Log the event */
>  	if (pe->type & EEH_PE_PHB) {
>  		pr_err("EEH: Recovering PHB#%x, location: %s\n",
> -			pe->phb->global_number, eeh_pe_loc_get(pe));
> +			pe->phb->global_number, eeh_pe_loc_get_bus(bus));
>  	} else {
>  		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
>  
>  		pr_err("EEH: Recovering PHB#%x-PE#%x\n",
>  		       pe->phb->global_number, pe->addr);
>  		pr_err("EEH: PE location: %s, PHB location: %s\n",
> -		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
> +		       eeh_pe_loc_get_bus(bus),
> +		       eeh_pe_loc_get_bus(eeh_pe_bus_get_nolock(phb_pe)));
>  	}
>  
>  #ifdef CONFIG_STACKTRACE
> @@ -1098,7 +1099,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  		eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
>  		eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
>  
> -		bus = eeh_pe_bus_get(pe);
> +		bus = eeh_pe_bus_get_nolock(pe);
>  		if (bus)
>  			pci_hp_remove_devices(bus);
>  		else
> @@ -1222,7 +1223,7 @@ void eeh_handle_special_event(void)
>  				    (phb_pe->state & EEH_PE_RECOVERING))
>  					continue;
>  
> -				bus = eeh_pe_bus_get(phb_pe);
> +				bus = eeh_pe_bus_get_nolock(phb_pe);
>  				if (!bus) {
>  					pr_err("%s: Cannot find PCI bus for "
>  					       "PHB#%x-PE#%x\n",
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index e740101fadf3..040e8f69a4aa 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -812,6 +812,24 @@ void eeh_pe_restore_bars(struct eeh_pe *pe)
>  const char *eeh_pe_loc_get(struct eeh_pe *pe)
>  {
>  	struct pci_bus *bus = eeh_pe_bus_get(pe);
> +	return eeh_pe_loc_get_bus(bus);
> +}
> +
> +/**
> + * eeh_pe_loc_get_bus - Retrieve location code binding to the given PCI bus
> + * @bus: PCI bus
> + *
> + * Retrieve the location code associated with the given PCI bus. If the bus
> + * is a root bus, the location code is fetched from the PHB device tree node
> + * or root port. Otherwise, the location code is obtained from the device
> + * tree node of the upstream bridge of the bus. The function walks up the
> + * bus hierarchy if necessary, checking each node for the appropriate
> + * location code property ("ibm,io-base-loc-code" for root buses,
> + * "ibm,slot-location-code" for others). If no location code is found,
> + * returns "N/A".
> + */
> +const char *eeh_pe_loc_get_bus(struct pci_bus *bus)
> +{
>  	struct device_node *dn;
>  	const char *loc = NULL;
>  

This looks more cleaner.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

