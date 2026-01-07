Return-Path: <linuxppc-dev+bounces-15352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF0CFC2E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 07:23:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmHzL5wWLz2yFh;
	Wed, 07 Jan 2026 17:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767767006;
	cv=none; b=jU6KJWfk/o0ZIl9zao2+2CsyRonUU4DGYqNN3pflMgBb0CfjkMPk/1fzyEgks6Mqu6yTMCS9yWoGz/3//7PvBvI4G4GFs7SFffc2z/+QDR4N8KibrU9PNz59VPxbWExKObI3V5TVygN4tcDjBN/1824r6WnfvPcjOBt9cz6j6KbPd7y2DLc9dDmus7IQSwT3p/1htZYj7j3W4IJVt+OKNk7xqzwvN1G6PPtm7On8nF2QSICSyfcLRIu6/LwHBMddZ3DG1SGPxCBEZwDKw5V7CtX5pApaLURd6LjT5YKiTcUp36Rja5cTqQdIGzf49+rGWYzIojt0hSDbgKhZqdkVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767767006; c=relaxed/relaxed;
	bh=VQ3mf7qh2pz9zHzFbiA/etrutkNFJAeEtTplDRb6XLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6CGa3a67LTiaLapnEQrqig1WS9D8tn8dTXol8KTpWlfkf+BQo5W5gZQq82GyfJelzGQgbNW9cmkIel9Hn9fmExhqEOcHj0fTN8P6XPEjlchiYZAlCVxkTwSVcgyXlLJIx2waCiD8AaakOjuSjkYWUvgmI3GNthubCDPVkRrchyWoGb4VzeFtJC7gJiYsoxaIUigrywa90OCk229drV7Fj1BK/dH0KHxws3YVKf2dqLfpqWOqXJY3Y6nVuxNxo0A0kp7g3tQi8kjP+tORk4/op2S7ItpfCYU01Om2CuYgSILIJ4M2lCCDhPcxZOPW+HI4isZFfLGpFiDhQs4EFCMkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rUqol1yn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rUqol1yn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmHzK0Xz2z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 17:23:24 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606H6sBo029308;
	Wed, 7 Jan 2026 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VQ3mf7
	qh2pz9zHzFbiA/etrutkNFJAeEtTplDRb6XLo=; b=rUqol1ynG6lYdz7aJ+Jz6J
	56IBsvskmbEP+qHfwAOKoCVHaJfdo+7pf8bfYkHDxlJviT3qx4MkSRZ658+/NAXo
	SRq7wne8uentM4cCtrot6/6OKGNm0oPapDGAIL9ZsMrbTaIJjAuATSj/bMFEavmv
	xKcVVu8MoqkYuKWvCk1rfeEy0rGD6qDY7DydWMYXy75RYNKvH6J+vfqQtI7uDZFI
	CKkGgKdRTjEuPxV0jjgiobEks2xAVCl9sYUmwxM/IMdYvBqz/IULNKYeqRrmCIG9
	vhl56ILQcyX7qRnJ5210QwD+jzWb+PXj6TCslRncPX4HuFVGjpHV1yXsa6TIJnNA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk6kts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 06:23:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6076NC3C013991;
	Wed, 7 Jan 2026 06:23:12 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk6ktp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 06:23:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6072J826023501;
	Wed, 7 Jan 2026 06:23:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bg3rmc5ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 06:23:11 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6076N7JN13173112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 06:23:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54A8820043;
	Wed,  7 Jan 2026 06:23:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93B9E20040;
	Wed,  7 Jan 2026 06:23:01 +0000 (GMT)
Received: from [9.61.251.134] (unknown [9.61.251.134])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 06:23:01 +0000 (GMT)
Message-ID: <5cfffd00-b62e-4004-a5a6-58134a9a1c80@linux.ibm.com>
Date: Wed, 7 Jan 2026 11:52:59 +0530
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
To: Timothy Pearson <tpearson@raptorengineering.com>
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
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <1869613445.153778.1765467944808.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=695dfbd0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=1XWaLZrsAAAA:8
 a=_AprYWD3AAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=As8EeNG6lE4Wsrx9IP4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=fKH2wJO7VO9AkD4yHysb:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: iOqUqI1f0SJuLuix1uHXo9qFjqERduVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0OSBTYWx0ZWRfX5SIz7shLj0Dz
 T7ObVVXqHupycj4z8db4WXx5mJpEDTQzA7tXKzieimJqTvYr2SjkBrVstOBWHdl/ibsPp8L/GQU
 QAkokFraWnq6uR/ix5wxW10C0ZCrSHD5euPeBVXwfgfIgGGJ3NpFx78cSPW/UdAvEX4KHeBHbDE
 HsE6xAIj9kB0XIBqFGWyzYc2MjtKzvBqVPN1q4WUfgIxRNi9pTqx7ztZ4ueCNBSiLTnke0mBaj1
 hvGQ3/rQdkIv77aXIYzXjm/HC1w2NjuJq7iSsXOG1ZdaTtkxWwuNRl0oPjVTESa6iey4V3jHPJU
 9DIR5AV9tSA6RXvkY6JCnMfGDy0aIQLo4S0EfsVkvHuorsEdEYwT/a1CpSvO60VzbkvbBS1mZ/4
 1fRIymwk2EY/qWZtCI7ZW0OPiJcAaMDlVSuCyV0YDbXFOPgajYl0LoHrWRW298IawD+AIED3n7B
 daeIeDWoCKRFDBh5gVg==
X-Proofpoint-GUID: O1K8mOhKKGdHqjMHMOGXA5JkhQdNokje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070049
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/12/25 9:15 PM, Timothy Pearson wrote:
>
> ----- Original Message -----
>> From: "Narayana Murty N" <nnmlinux@linux.ibm.com>
>> To: "mahesh" <mahesh@linux.ibm.com>, "Oliver" <oohall@gmail.com>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
>> Ellerman" <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>, "christophe leroy" <christophe.leroy@csgroup.eu>
>> Cc: "Bjorn Helgaas" <bhelgaas@google.com>, "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev"
>> <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "vaibhav" <vaibhav@linux.ibm.com>,
>> "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, ganeshgr@linux.ibm.com
>> Sent: Wednesday, December 10, 2025 8:25:59 AM
>> Subject: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
>> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
>> hotplug safe") restructured the EEH driver to improve synchronization
>> with the PCI hotplug layer.
>>
>> However, it inadvertently moved pci_lock_rescan_remove() outside its
>> intended scope in eeh_handle_normal_event(), leading to broken PCI
>> error reporting and improper EEH event triggering. Specifically,
>> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
>> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
>> acquire the same lock internally, causing nested locking and disrupting
>> normal EEH event handling paths.
>>
>> This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
>> with two public wrappers:
>>     eeh_pe_bus_get() with locking enabled.
>>     eeh_pe_bus_get_nolock() that skips locking.
>>
>> Callers that already hold pci_lock_rescan_remove() now use
>> eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.
>>
>> Additionally, pci_lock_rescan_remove() calls are restored to the correct
>> position—after eeh_pe_bus_get() and immediately before iterating affected
>> PEs and devices. This ensures EEH-triggered PCI removes occur under proper
>> bus rescan locking without recursive lock contention.
>>
>> The eeh_pe_loc_get() function has been split into two functions:
>>     eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
>>     eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>>     code for given bus.
> Conceptually the patch sounds OK, but given the complexity of these subsystems it's difficult to forsee all interactions.  Was the patch verified not to break NVMe hotplug on PowerNV systems using actual hardware?  If not, I will need to do so before sending an ack.  Thanks!
Hi Timothy,

Thanks for your suggestion,I have now verified the change on a PowerNV 
system with NVMe hotplug.

Test setup:
Platform: PowerNV (“Hardware name: 9105-22A POWER10 (raw) 0x800200 
opal:v7.1-126-g9f16f2d9e PowerNV”).
Kernel: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
this patch on top of commit  d358e5254674
Devices: two PCIe NVMe drives in hotpluggable slots.

Tests performed:
Basic hotplug:
Repeated NVMe add/remove cycles using the platform’s hotplug controls 
(slot power off/on or PCIe attention button, as applicable).
Confirmed that each add/remove cycle correctly created and removed 
/dev/nvme* nodes, and that nvme list/I/O (e.g. fio or dd) worked before 
removal and failed cleanly after removal.
Confirmed there were no lockdep splats, warnings, or stack traces 
related to pci_lock_rescan_remove() or EEH during these tests.

Regression checks:
With these tests, NVMe hotplug and EEH behaviour on PowerNV appears 
unchanged except for the intended fix (no recursive 
pci_lock_rescan_remove() acquisition and normal EEH event handling).

Thanks,

Narayana


