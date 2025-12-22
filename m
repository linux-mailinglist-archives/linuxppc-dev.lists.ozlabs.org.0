Return-Path: <linuxppc-dev+bounces-14933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF7CD4B9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 06:35:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZRgv3hqdz2xpt;
	Mon, 22 Dec 2025 16:35:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766381755;
	cv=none; b=WAj0BKKrUrYZ8mFkWmmxvs2o3QIUvgXtnxmTNsqbSbgBHPrA07c0hDdL2dpcA9oQf5QX8zEGZWYJfo8t5x/RkjLyLssZylc3U2YevMRclQQJAdbHWBsU5LkxvWd7HC9hSjHMbld8/GRt4dUW3zjXp5EHugyhi91gXdNrGh0CSgrya6vdDak2gLPy+lqjcagH4c4UIlBei13m+fa9zkw2HnUWC+O3Nm7oCXuy4gRDqPPwozsqIZM/+yLFc6b64D5uergu0y1SmjLPbssnZ8rB3l4tBbkXHGvcTgrCsadYOHzE+N1+Deu4IL4lyV80IxRpbyNn6Pw/SXCWm0nsQCdLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766381755; c=relaxed/relaxed;
	bh=cBho8nj0EBBhQZZ51Wy31/RvrMpQ1gDfqzobPNxVe+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTgIJI0Z5Bvp9OGAjZZUpqXEOVfBbAJv1/XE1jKraTBs8eZkJV+dqfrDN4FxbTSIMKEM2XTtGS7eUBeHdrc5vGlzEuair/qBrEs1mcYAUrqd5WimHKxGnlMeuhgtQghSD0u59vUUxy++5Ef5M1t7fOp7a+RJr60oOG9h+B8Iha9Lxe1NnDvFfAg+zwD4+XrF1yQj7ks+a+TA1ssWOF1eCtoBVk2KRl3f5icltRfk0HAJm/TO3ykvQ1AoAxB8ykF+OqBdyC2iaEQ3F6ufuBcc6nVOvAJVdrk8OyyX04LOEiNAFrpNuU0l+i6iDd+gGhmB73q6cb2MBDyaB+gT50CPog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oFxFySNg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oFxFySNg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZRgt0GP7z2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 16:35:53 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BLDkVwx026873;
	Mon, 22 Dec 2025 05:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cBho8n
	j0EBBhQZZ51Wy31/RvrMpQ1gDfqzobPNxVe+I=; b=oFxFySNgoUtKuhVQ61hU00
	sHd/5gTBZPznXeeS5STB6FLs/icwSgll5uGQH5WX4xd+Dch/Z+HrkMkY5iZ4ytai
	xO8bztMmmLWPsiupe7YX8QM8VjToQ2s/XCoE2/5x6zqvmE6O7gFY9WfVIw8n3bPD
	kwcETX8v3D+eaHf8SNHUZpsTxM4gnFKk3JCdRIH764PDF9/snImAiJhZONbCYCj6
	BpstfJVvxue0/9ZOa9t3HaV/8Rcpkm6G+1wFTvgjALIib1yt8IbTUsm9/hw4++jL
	Qd/8OrbCey35GIn8jzVRHAuNSqr2MB2jTQs2ixoozpG154Wi5uemVUNyEh4Rv+Zw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5ketp44c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:35:41 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BM5VvGt008790;
	Mon, 22 Dec 2025 05:35:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5ketp446-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:35:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BM4XOgS001126;
	Mon, 22 Dec 2025 05:35:39 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b664s4kjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:35:39 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BM5ZbAN62390706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Dec 2025 05:35:37 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E3365805A;
	Mon, 22 Dec 2025 05:35:37 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9A8E58062;
	Mon, 22 Dec 2025 05:35:30 +0000 (GMT)
Received: from [9.111.68.45] (unknown [9.111.68.45])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Dec 2025 05:35:30 +0000 (GMT)
Message-ID: <e0b17d64-fc23-4a29-b66b-b54c4628cb26@linux.ibm.com>
Date: Mon, 22 Dec 2025 11:05:28 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove
 locking in EEH event handling
To: Narayana Murty N <nnmlinux@linux.ibm.com>,
        Timothy Pearson <tpearson@raptorengineering.com>
Cc: mahesh <mahesh@linux.ibm.com>, Oliver <oohall@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
        christophe leroy <christophe.leroy@csgroup.eu>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        vaibhav
 <vaibhav@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>, ganeshgr@linux.ibm.com
References: <20251210142559.8874-1-nnmlinux@linux.ibm.com>
 <1869613445.153778.1765467944808.JavaMail.zimbra@raptorengineeringinc.com>
 <1ea29e17-654a-41fd-b80c-0fc2a50ca49f@linux.ibm.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <1ea29e17-654a-41fd-b80c-0fc2a50ca49f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rP4jUDTpWSkRZWsK-Zz2YD4eYUPXQV2V
X-Authority-Analysis: v=2.4 cv=Qdxrf8bv c=1 sm=1 tr=0 ts=6948d8ad cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=1XWaLZrsAAAA:8
 a=_AprYWD3AAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=As8EeNG6lE4Wsrx9IP4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=fKH2wJO7VO9AkD4yHysb:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: aAkYZub6s5iMKRDV07ERafNyjXSZvjJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA0NSBTYWx0ZWRfX0R2L26D7TWwx
 GDlyFB3h7dOpg8g/KOF72FCj0eoQcRiHO3uO74FpsjYmRlcT6MTtnYavjV0s7vKMOcuSuwe+EBB
 jgd2oVpAa5OKpWhu4KhKnyQ95kiNuhuOm+FevLnRjtQoAqOJ7OeYW8hrbhIwPVe0zWyXp74nHgz
 TWlE+ntZ4M1PqaRmVqKN6AxhgfF7dj2aUgdpHzI0dUehX5eQkTJuUYoA+ggeVTwE74w7rutnC/z
 aN67fDIG+Ydjzo4B7hTVHyilJjKd7rduYnd16le8ju+C+bA3h7FGqyGeyLaKJlKaStiKCTGTTTO
 0v7XaUzR/vLupLf+C4D4JyQ6lAy3rzxK1dA7S7xrmuwVL51JLgRYsM3hDE2zjyilmf4jq6Hf891
 JaGgpMvsm35k5AJejL7sydhTlgVta1rM06gWZ01IU/UYNmrog7QbN6EPOL0fO76PQ9HEPpu9nx+
 xG4xwBgHACi6KvUmFug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512220045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/17/25 10:31 AM, Narayana Murty N wrote:
> 
> On 11/12/25 9:15 PM, Timothy Pearson wrote:
>>
>> ----- Original Message -----
>>> From: "Narayana Murty N" <nnmlinux@linux.ibm.com>
>>> To: "mahesh" <mahesh@linux.ibm.com>, "Oliver" <oohall@gmail.com>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
>>> Ellerman" <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>, "christophe leroy" <christophe.leroy@csgroup.eu>
>>> Cc: "Bjorn Helgaas" <bhelgaas@google.com>, "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev"
>>> <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "vaibhav" <vaibhav@linux.ibm.com>,
>>> "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, ganeshgr@linux.ibm.com
>>> Sent: Wednesday, December 10, 2025 8:25:59 AM
>>> Subject: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
>>> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
>>> hotplug safe") restructured the EEH driver to improve synchronization
>>> with the PCI hotplug layer.
>>>
>>> However, it inadvertently moved pci_lock_rescan_remove() outside its
>>> intended scope in eeh_handle_normal_event(), leading to broken PCI
>>> error reporting and improper EEH event triggering. Specifically,
>>> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
>>> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
>>> acquire the same lock internally, causing nested locking and disrupting
>>> normal EEH event handling paths.
>>>
>>> This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
>>> with two public wrappers:
>>>     eeh_pe_bus_get() with locking enabled.
>>>     eeh_pe_bus_get_nolock() that skips locking.
>>>
>>> Callers that already hold pci_lock_rescan_remove() now use
>>> eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.
>>>
>>> Additionally, pci_lock_rescan_remove() calls are restored to the correct
>>> position—after eeh_pe_bus_get() and immediately before iterating affected
>>> PEs and devices. This ensures EEH-triggered PCI removes occur under proper
>>> bus rescan locking without recursive lock contention.
>>>
>>> The eeh_pe_loc_get() function has been split into two functions:
>>>     eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
>>>     eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>>>     code for given bus.
>> Conceptually the patch sounds OK, but given the complexity of these subsystems it's difficult to forsee all interactions.  Was the patch verified not to break NVMe hotplug on PowerNV systems using actual hardware?  If not, I will need to do so before sending an ack.  Thanks!
> It has not been specifically tested for NVMe hotplug on PowerNV hardware.
> 
> However, this change does not remove or relax any of the existing locking
> 
> around EEH handling, so the NVMe hotplug paths should continue to see
> 
> the same serialization as before.
> 
> If you have a convenient setup for NVMe hotplug on PowerNV, additional testing
> 
> there would definitely be helpful before merging.

Yes, I'd also suggest testing this patch against NVMe pcie error recovery 
code path. Please note that NVMe driver hooks into the EEH (pcie recovery)
subsystem, and so, IMO, it'd be necessary to test it using NVMe.

Thanks,
--Nilay



