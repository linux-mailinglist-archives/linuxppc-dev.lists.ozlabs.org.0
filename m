Return-Path: <linuxppc-dev+bounces-14757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA07CBCA5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 07:36:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV9Ld4M5Xz2xqL;
	Mon, 15 Dec 2025 17:36:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765780569;
	cv=none; b=XTUEJaiF5Um+RQ2Uyu6o0MujMUxoXHk2VJMDs6OxPJpBAAaoUsYWGdNUv+h6NeDOzAahFaPGbgGt9XmQMJwnxYYXEYIk/xiPCDKQ5QO42H7Bf0eIixHyES3Mc/vWXRgdbfApRwW6H/paGGH/zQOWCWtW4noLYJfxxmrJxHnUKgSKgxdGlYkW3sIgkoiO/f0xFEuGGBTWOxm3lqXS3arn5qiLRvydkRWo4c2XODyOaDsqU2g6TxUgihuAGtrpoqEssnRGBNccBROlkMG7bFCvwhYqmvDGictXk34po//mbuQ/T8Y8UYvdatyiAWb/n2a/VFZn/SiQxp+91Wdogqlh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765780569; c=relaxed/relaxed;
	bh=FLD+Oc2X/O2ijSuIFlZ9w/hoV2rTFquiSv6VLNVnNWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYV+c4yGf5AnVFiwiaiu9Wj+A9KM8y82zk+uOzJ5KESiZKNKoJJEvSsOJJ3haXeOp36Pq2cnXr6Di4v+Eam8/neMwtQCDVcLmnzXJCmchG6lYkTcjjt3KAwDTHHXU6MgArqscl7eXLWPRL9otvze1Z9OhDeT+USmrQlU1j4k4sKV+5UlqAJkoeWj8y1OAVM6RNFOTgquhILQqU+9XSs4YZGbzfCPghl1pYZATLRHhr9Z54dqk5avVBfqQBkMWj+8q6GSuYmWjkIg7V/VK1utZPZFjsn7cQv/iWgFw9Di9c2eH1crGdcFtrTN1H2NOtI8T9Q5vUTkp3I321FVH90ufg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMOa0l+n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMOa0l+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dV9LZ606fz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 17:36:06 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEKkt3o027280;
	Mon, 15 Dec 2025 06:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FLD+Oc
	2X/O2ijSuIFlZ9w/hoV2rTFquiSv6VLNVnNWs=; b=YMOa0l+nWbKYPURx38RXl/
	7jIKxFihz/yTMWPuKWo3bElVrhOcmibGXYpqKzbWl5fDXDqvQHk0t4nOZcZOdgt+
	8yA9GXAGYkHQlKCN4vbpvxVT2hXbpemiLjy6Nslac1rvaL5wUUbOO7hvrSv5xZyj
	9rd2KiLR5rPqWe8a7wrR94T3yWKgNgOwD9p/CKKIizzwVxNw7fvdmHBqKReiBzYl
	cpW9KuAdeVglnvgYX3RtMvCJftkXEsm+fVq1IeSpyJ6SwZQWqagXz4yNOsWLQNIh
	ESmE5tOtvvfcpH2qZtEhiAL4oxtLyPpoigf59TQzMQz5gm5NYFr11lxVe+gHGahQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn88aje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 06:35:53 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BF6RO46003857;
	Mon, 15 Dec 2025 06:35:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn88aj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 06:35:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BF4VqHJ002948;
	Mon, 15 Dec 2025 06:35:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kykcrnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 06:35:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BF6ZlQh37749080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 06:35:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C920620043;
	Mon, 15 Dec 2025 06:35:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BE2520040;
	Mon, 15 Dec 2025 06:35:36 +0000 (GMT)
Received: from [9.61.253.186] (unknown [9.61.253.186])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Dec 2025 06:35:35 +0000 (GMT)
Message-ID: <8c8fd7b5-4f21-44fd-a2e9-2c7724a3e321@linux.ibm.com>
Date: Mon, 15 Dec 2025 12:05:33 +0530
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
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: mahesh@linux.ibm.com, oohall@gmail.com, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        bhelgaas@google.com, tpearson@raptorengineering.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
References: <20251210214640.GA3541600@bhelgaas>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <20251210214640.GA3541600@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfX/S8UbA7DMuiD
 MzYGg8wNY+izfqLF2qGaUC2EU+5IePMIrl8KqSVA/XYJxZoyCdwyZ386Paz2X7acsXUZwmts4FN
 4g/i0xZ2UAVSjI3IDuONy0Rbj3c3Z/X7cOTw/zX1+aYYyg93MwigWaZ+PxJF9UMt+GgoU/r5/E0
 vIe9uOCH6wwebSot7xgwWyOfhLUVZFueW5HOXFnc4OS/ClghuE7Lro2nf99FZR58tZPR7yx1ZxL
 2q7Y8FDAEifjw3yC0gwQMz+zlY0xtu9dn9STnkDIn2UMJ9z3Rh5F5iWcsOfLoQ8CbcKJl0Npyp5
 7+b/Xh/gcVYm8GPjzC21jWCJ7ZcP0FqjBZX5cQ/soi5ZqZlbYEXKVUj2R2JbmF+u3opJjIs0XSP
 toxHnj6f/Vq3VFCvGRgQFcR2wI9taA==
X-Proofpoint-GUID: Rx_7BnE1BEsjXIE7ypzPjLMHYm0r7Iq-
X-Proofpoint-ORIG-GUID: mf69Ewtsf3mBgpUIxrFqZw5qwE_ymshO
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=693fac4a cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ZSsj7H5o-SEHFgodBCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_07,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/12/25 3:16 AM, Bjorn Helgaas wrote:
> On Wed, Dec 10, 2025 at 08:25:59AM -0600, Narayana Murty N wrote:
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
>>      eeh_pe_bus_get() with locking enabled.
>>      eeh_pe_bus_get_nolock() that skips locking.
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
>>      eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
>>      eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>>      code for given bus.
>>
>> This resolves lockdep warnings such as:
>> <snip>
>> [   84.964298] [    T928] ============================================
>> [   84.964304] [    T928] WARNING: possible recursive locking detected
>> [   84.964311] [    T928] 6.18.0-rc3 #51 Not tainted
>> [   84.964315] [    T928] --------------------------------------------
>> [   84.964320] [    T928] eehd/928 is trying to acquire lock:
>> [   84.964324] [    T928] c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
>> [   84.964342] [    T928]
>>                         but task is already holding lock:
>> [   84.964347] [    T928] c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
>> [   84.964357] [    T928]
>>                         other info that might help us debug this:
>> [   84.964363] [    T928]  Possible unsafe locking scenario:
>>
>> [   84.964367] [    T928]        CPU0
>> [   84.964370] [    T928]        ----
>> [   84.964373] [    T928]   lock(pci_rescan_remove_lock);
>> [   84.964378] [    T928]   lock(pci_rescan_remove_lock);
>> [   84.964383] [    T928]
>>                         *** DEADLOCK ***
>>
>> [   84.964388] [    T928]  May be due to missing lock nesting notation
>>
>> [   84.964393] [    T928] 1 lock held by eehd/928:
>> [   84.964397] [    T928]  #0: c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
>> [   84.964408] [    T928]
>>                         stack backtrace:
>> [   84.964414] [    T928] CPU: 2 UID: 0 PID: 928 Comm: eehd Not tainted 6.18.0-rc3 #51 VOLUNTARY
>> [   84.964417] [    T928] Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_022) hv:phyp pSeries
>> [   84.964419] [    T928] Call Trace:
>> [   84.964420] [    T928] [c0000011a7157990] [c000000001705de4] dump_stack_lvl+0xc8/0x130 (unreliable)
>> [   84.964424] [    T928] [c0000011a71579d0] [c0000000002f66e0] print_deadlock_bug+0x430/0x440
>> [   84.964428] [    T928] [c0000011a7157a70] [c0000000002fd0c0] __lock_acquire+0x1530/0x2d80
>> [   84.964431] [    T928] [c0000011a7157ba0] [c0000000002fea54] lock_acquire+0x144/0x410
>> [   84.964433] [    T928] [c0000011a7157cb0] [c0000011a7157cb0] __mutex_lock+0xf4/0x1050
>> [   84.964436] [    T928] [c0000011a7157e00] [c000000000de21d8] pci_lock_rescan_remove+0x28/0x40
>> [   84.964439] [    T928] [c0000011a7157e20] [c00000000004ed98] eeh_pe_bus_get+0x48/0xc0
>> [   84.964442] [    T928] [c0000011a7157e50] [c000000000050434] eeh_handle_normal_event+0x64/0xa60
>> [   84.964446] [    T928] [c0000011a7157f30] [c000000000051de8] eeh_event_handler+0xf8/0x190
>> [   84.964450] [    T928] [c0000011a7157f90] [c0000000002747ac] kthread+0x16c/0x180
>> [   84.964453] [    T928] [c0000011a7157fe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
> I have no comment on the patch itself, but the timestamps above aren't
> relevant and could be removed.  Maybe also the "T928" part.
>
> Bjorn

Thank you for your suggestion, I will cleanup the commit message

Narayana Murty


