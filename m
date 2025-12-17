Return-Path: <linuxppc-dev+bounces-14828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B046CC5FE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 06:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWM9005J3z2yVL;
	Wed, 17 Dec 2025 16:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765947715;
	cv=none; b=dOQc/nsunRSfmq0TdP44XIv8yqApfPw8l1SpkuMs0EYeYJJ87HLf0opwjx/dVLIdGeu3puuQj+/Ss7OynKaZ0EyDgid+iisCBJxviYetgdpNck7y+uWwsziELzq5TCBAdkfB6dwc7iAZCsRFetA6xBqRe0FW4h36KOohDfP4sRFR15I2a9gEkGdR91j0bZ5/KQbhmVDAR83jow8ZZS1+uGw04pzp4QhfyWPyujOzVpyb23Y+4CD5CdY/7uHXdTzPgQwN/DZjNzPIJLUfuvJ19E6I49aFd87/LytOok7HMIu9me1dntcGuOII2rme+xBNR2g8M33g7CLOns8wuiI46w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765947715; c=relaxed/relaxed;
	bh=z0o3JEXoaXAGj787hSOs5+uXJPXiMmvn7D+z1iaLckM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kus9YXGjRi9e7dpiCRpKd9/YJ4xhbmE/pvRUIg53bksQ3LRrG6EnwRhMEujUE89KDEGp3bEo0lnH9tdnWowOYsOoEvjtqf/zyxcRZkIU3tbzG98xOP56KId20YkxyEmVDwBK2zPQz0W0iKHqOw9smP8Rw29Lxj7lJrV/LBv3wAHQsJ5JYvga7MSnNvaL7eV8rDv/yO8XuK4imZcGQQvpy1UTwUdLjNxEYpoEX0RlB3PRlcA8PFmsh9hLQU4McztLJVdcaVpJWyysBGVpFC3EmZIBycyWWnB6+QI+u3zTydwbPrIjSGG9nNL9EJubCqBWDzOZjMaFJSvcP1gou5AAaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QLAzMhzM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QLAzMhzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWM8y6cy3z2ySB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 16:01:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGKjbGm009495;
	Wed, 17 Dec 2025 05:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=z0o3JE
	XoaXAGj787hSOs5+uXJPXiMmvn7D+z1iaLckM=; b=QLAzMhzMlz6hO0M+haC0lC
	JipyfuqjkkMM5JQPMnI5dE4ZMvi+4Ye5G1qTemWttOzbJFesxFy71r7Zx2obUObV
	i7Wa7A+0TCQAix5l184HTHFJwP5E88TQSavyrAtw1rBCKiBEWH+2J59CbU/gU8+V
	5VAirPWcmTzhZYWO4Jwtym1b6JNT/bryA8dex+Gd9gL2BnTaMqmGdGKRB9L0P4o6
	h2M6HPIFBFobUkm/qVNrodmebgcdE42HCvget2wgvlHZ49Bg9bqRRC/569HVRue9
	k2CVcEHi4qiDAJ2jpt/viLWHeqFPXoDbXovRo3c+AmcTSHqjlZe6O3n+irhcXbEw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1j5gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:01:44 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BH4uhJU013706;
	Wed, 17 Dec 2025 05:01:43 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1j5gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:01:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH15saf012810;
	Wed, 17 Dec 2025 05:01:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1juy8kh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:01:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BH51ch637224830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 05:01:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD4842004B;
	Wed, 17 Dec 2025 05:01:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33EC420043;
	Wed, 17 Dec 2025 05:01:32 +0000 (GMT)
Received: from [9.61.244.51] (unknown [9.61.244.51])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 05:01:31 +0000 (GMT)
Message-ID: <1ea29e17-654a-41fd-b80c-0fc2a50ca49f@linux.ibm.com>
Date: Wed, 17 Dec 2025 10:31:29 +0530
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
X-Proofpoint-GUID: dA1wSUvMfOb1pD0OAAarOBRsSEnlletH
X-Proofpoint-ORIG-GUID: W_LSskXAYj4D-pO-g4QKAqoT97rnc1Fo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXzdkpF1AWAu0q
 cA6DYpZfZ4ez+jDNldiB3HbUk5GA2W7U7Vl5GhSYFpqBLZM3844KygDQoB1wE5xrKpP48RqQf8u
 SBlG8DWm4VUfMzMlEiJ1ELm9zJxsjxcE05tCqRYxplm2DOhYoQ6sxjCU+Ech82msnt/MojGU5dc
 gmZysToyHvrIjv3XsrZUnXx86ILiCNJL89rw8FANH2p5HMGxvFtl1VG2zZtc02F+hzp4DCLlHwr
 MX1PoxddFku1u9gAy8OtdbCqfr7OacenwHyfnV/q2ZEibg5C0bu08vLui8K7xt5Vg+8ZdfEMnEh
 qB2RO3XdHTVyiMl5zJ42XznsmYvjapBrQYvVlMPM0VNqUMOVCUyGjf/cI3vwfxK+nDElvEmPGPN
 QSgKJt0CJ6UaqPpXruWtJjiBUJieIg==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=69423938 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=1XWaLZrsAAAA:8
 a=_AprYWD3AAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=As8EeNG6lE4Wsrx9IP4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=fKH2wJO7VO9AkD4yHysb:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
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
It has not been specifically tested for NVMe hotplug on PowerNV hardware.

However, this change does not remove or relax any of the existing locking

around EEH handling, so the NVMe hotplug paths should continue to see

the same serialization as before.

If you have a convenient setup for NVMe hotplug on PowerNV, additional 
testing

there would definitely be helpful before merging.

Thanks,
Narayana Murty


