Return-Path: <linuxppc-dev+bounces-15244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B6CF2D2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 10:47:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl8c43WCVz2yCL;
	Mon, 05 Jan 2026 20:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767606468;
	cv=none; b=o2SrgwTIkwptel/jpwWKN/4IOHuO84/XWtrvXbbHyIpsMH2Iq1NXoO6cOAg3XoWeNpV+hWs5gq1T5c57w3LPkzEhgA0v4UeYe97z5BvBMAX7OZhyi6mSqPQZEHOavRWNRAcHPB5c3DvD9AbwjkEl1IuYwkDzrW5Hm9uskqowtCGPoOFIBaxCIumFet6b7b6tDd5Q5SBr+GPuSgLJhq00Wsb1dBeqTxkNVKrHsNIS3eMxAh/por0DvBLekj3Oq69KSoiGoGKFACrQjo8sOB87KU9cmoqwaVKmhPn0oIkwiMPrigZGBGFbD0R4dWIfzAPD3ZIkkPMBgylhSSVfvDsqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767606468; c=relaxed/relaxed;
	bh=ZLL8+VSEiZ5i0868R+Di6x3lS/FDBFVbazhnrY+wVzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7tHyBjIC2BrxYCnIQFPKfrXsV0Y3ZvrDH3g0/6LrtSXy51b3ht8pZm9ouQhhjbd/4NyZp2Ejp8YbqcCUOgUf/HYE7GwNZ03N9sS8WcpmZiUqwZBrctbcZyhStenFBi5HN92w+idsr8ghL14++YwbVaicYYlZPGRpWN6V/Adrm1S2FmFXLgTqgUJnsSlWdwDgL3a2ab+W/pq9XbQJjw9MexgYTiJUxyKhpBiis25AbbnofGSwjpzlNUjFQKFiqI1sZ3nK6pFoGY2v/MNNqbiqtKwD8WHLoRidc+ajoCWk0a0860agd/ZeHtoHWtN0I155KqqO682klAhbSudj7oUSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXzKEvJq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXzKEvJq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl8c31FJcz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 20:47:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 604LkF21012347;
	Mon, 5 Jan 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZLL8+V
	SEiZ5i0868R+Di6x3lS/FDBFVbazhnrY+wVzk=; b=eXzKEvJqQOyXfaWOKsN/WE
	INFvh29pULrpBuXY67F7Q9lE2A0kRpWWGIVam261r8M18LxxgwrB2V1xYLrvzcRS
	9F/sZXdNnV1gsUCgxOE+rUoXeK4cb8P2rPo4Owh3LVTn8Ss1VnvsU7b/aH6EwG6c
	kbsIsZyahnko6BFJ0iDgYAgAe0seVed7gPmNzXHq1kIu0ZO1290F1hhpsNg1a8JW
	FATaoX0/6QTtHQtbG5kCOPXimGts8yQeavtfri7X+uaqQASyP/HJvq+LBQ+Wua0M
	bbCrxMKGTz2UN+gUxezoIGn9Io6STzYLNuycHWAaQEJEhM0VDgas3eYCi8vGjPxg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betspxje5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 09:47:34 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6059lY0u007569;
	Mon, 5 Jan 2026 09:47:34 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betspxjdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 09:47:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6056Aha8015239;
	Mon, 5 Jan 2026 09:47:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfdes55w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 09:47:33 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6059lTcU28180902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jan 2026 09:47:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A09AA20043;
	Mon,  5 Jan 2026 09:47:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49E9B20040;
	Mon,  5 Jan 2026 09:47:27 +0000 (GMT)
Received: from [9.98.110.143] (unknown [9.98.110.143])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jan 2026 09:47:27 +0000 (GMT)
Message-ID: <8e683792-5c85-40d9-b029-2daeda9b10b9@linux.ibm.com>
Date: Mon, 5 Jan 2026 15:17:26 +0530
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
To: Nilay Shroff <nilay@linux.ibm.com>,
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
 <e0b17d64-fc23-4a29-b66b-b54c4628cb26@linux.ibm.com>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <e0b17d64-fc23-4a29-b66b-b54c4628cb26@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J4kGk8uTNGT0dAn9UMa5ZggaMh_FSMYf
X-Authority-Analysis: v=2.4 cv=Jvf8bc4C c=1 sm=1 tr=0 ts=695b88b6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=1XWaLZrsAAAA:8
 a=_AprYWD3AAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=As8EeNG6lE4Wsrx9IP4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=fKH2wJO7VO9AkD4yHysb:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: 1ZCa6nv3DZrKiVtX_YG-eveUCNhW2gph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA4NiBTYWx0ZWRfX3tsWRFW6GEnH
 ftutkdWSNdMbo1zmi3L1jq1md4+sJ1qxB9XfdjCOWEqNVW0x+pWKQ1zoPTbpEtC3OwXsUNYej3a
 7ACcmTlqUpZjDgzqdxghlJyQI/BLulEIYllXQbnVVq/JoOEvfjclEFbUbzt+Y+AAtNJFcL1zqir
 WhLRz50nmtFj++7Y1lUEey//y6uC7L4ODR0jPGBhZnhZhM9w+YWQUZOjWQG4AHrdtfgINih0+LT
 g6qyHjK4Dq8xDGNqlYI5j/UZvNS4KrIil6n2jAeccsbX5egCQyiRYkvmvSvCMX68cxMpIMMuZFq
 lvq7ps8Du28sjpD4ZZTl7Ad8BTj8BYEWKnmF5RiXeCvdJQQqlHV4SlfnT8XUGW04BK9eY8pWJBc
 FGhvmdk9OkH41G9p9vYD15AZfJuAN10L90SHdykE7qkr9kVv3db8kqRGnpH8mFDVA3Zk8PSYvdU
 BvFM0oakH6JLBgjNbNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601050086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 22/12/25 11:05 AM, Nilay Shroff wrote:
>
> On 12/17/25 10:31 AM, Narayana Murty N wrote:
>> On 11/12/25 9:15 PM, Timothy Pearson wrote:
>>> ----- Original Message -----
>>>> From: "Narayana Murty N" <nnmlinux@linux.ibm.com>
>>>> To: "mahesh" <mahesh@linux.ibm.com>, "Oliver" <oohall@gmail.com>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
>>>> Ellerman" <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>, "christophe leroy" <christophe.leroy@csgroup.eu>
>>>> Cc: "Bjorn Helgaas" <bhelgaas@google.com>, "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev"
>>>> <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "vaibhav" <vaibhav@linux.ibm.com>,
>>>> "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, ganeshgr@linux.ibm.com
>>>> Sent: Wednesday, December 10, 2025 8:25:59 AM
>>>> Subject: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
>>>> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
>>>> hotplug safe") restructured the EEH driver to improve synchronization
>>>> with the PCI hotplug layer.
>>>>
>>>> However, it inadvertently moved pci_lock_rescan_remove() outside its
>>>> intended scope in eeh_handle_normal_event(), leading to broken PCI
>>>> error reporting and improper EEH event triggering. Specifically,
>>>> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
>>>> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
>>>> acquire the same lock internally, causing nested locking and disrupting
>>>> normal EEH event handling paths.
>>>>
>>>> This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
>>>> with two public wrappers:
>>>>      eeh_pe_bus_get() with locking enabled.
>>>>      eeh_pe_bus_get_nolock() that skips locking.
>>>>
>>>> Callers that already hold pci_lock_rescan_remove() now use
>>>> eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.
>>>>
>>>> Additionally, pci_lock_rescan_remove() calls are restored to the correct
>>>> position—after eeh_pe_bus_get() and immediately before iterating affected
>>>> PEs and devices. This ensures EEH-triggered PCI removes occur under proper
>>>> bus rescan locking without recursive lock contention.
>>>>
>>>> The eeh_pe_loc_get() function has been split into two functions:
>>>>      eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
>>>>      eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>>>>      code for given bus.
>>> Conceptually the patch sounds OK, but given the complexity of these subsystems it's difficult to forsee all interactions.  Was the patch verified not to break NVMe hotplug on PowerNV systems using actual hardware?  If not, I will need to do so before sending an ack.  Thanks!
>> It has not been specifically tested for NVMe hotplug on PowerNV hardware.
>>
>> However, this change does not remove or relax any of the existing locking
>>
>> around EEH handling, so the NVMe hotplug paths should continue to see
>>
>> the same serialization as before.
>>
>> If you have a convenient setup for NVMe hotplug on PowerNV, additional testing
>>
>> there would definitely be helpful before merging.
> Yes, I'd also suggest testing this patch against NVMe pcie error recovery
> code path. Please note that NVMe driver hooks into the EEH (pcie recovery)
> subsystem, and so, IMO, it'd be necessary to test it using NVMe.
>
> Thanks,
> --Nilay

Yes Nilay, this patches tested it on pseries nvme, error injecton and 
recovery

are working as expected.

Regards,

Narayana.

>
>
>

