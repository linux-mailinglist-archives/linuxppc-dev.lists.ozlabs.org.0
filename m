Return-Path: <linuxppc-dev+bounces-14375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C88C734C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 10:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBtpx6HLYz2ypW;
	Thu, 20 Nov 2025 20:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763632153;
	cv=none; b=TdMhILTR10KXNtUZb3pL97Kq0i0ZnVHAVd1XuApSLFwmZEAoNwA4w8AyDY3S+i5VXRUXtwOX0hwQjnEXDnhLngepPhVsMyHc+u0RxPo7wnUW2WmXNlV8CYewhWBSU/e/cGfYo/rLzJyTDOGMTK8XKG2G3l3Nu87AYlMfp5y+JXCadJlyCem0+5RxPAMPHRd6LQwbIT4CqRN77Im+R6YJa+13SVvaedLo8GiZviotMCuLexKBx7gzFSM2+nyP3FQNeTtHvG6NIcqfHXUBazRnGbyos8xZSxml9bYqvqJlC1JUTruWwX6lDnj1qLyA7YfRS+CBKyKuPI4PzPXXR4Aiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763632153; c=relaxed/relaxed;
	bh=S3Kpsyy1RwM1kNTiqYZBJB/YDZA4LNzbECX5ytCiLvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZ7xfQFtu/bepEC+jifb/Gxw5pk2NxL3S0ZDpxNMUG0sdVWSkxqj+4yoITEX5ZKxFechP7gvYRXX9tkf77kMjDF3sTziVIE5OpOmQH7USGpo75Xxg73hwt8MJC+OmvCxP6i0hRVqOok4DF8ZTTMnRiOaQeCPxV9LCCv/oZMYsmmpObdO0Y+CMYXd1RM0pEskcnDpkM4WuGqdRCdK75LmizZVBYhYg3OorommcScM2rWgujQjEZh0gsnHzqWHKOPGVzcEizhWwXgM107eeBLlc/5bjw2e9nrfXFt1adgMAnEKGGIViddXYTNaPuZL2R6AXS7YaVcw4X9gCp0LiYv53w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h66ZXM8J; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h66ZXM8J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBtpx0HfSz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 20:49:12 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJLkuM3012474;
	Thu, 20 Nov 2025 09:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=S3Kpsy
	y1RwM1kNTiqYZBJB/YDZA4LNzbECX5ytCiLvM=; b=h66ZXM8Ji3LkcGUAaZ2d3f
	nDMcSws4AkIXbUTypidBWA57jDjChSsZISObNUirZVCV+9gseHBOyarb/jQvrx49
	qU/mbVdSrBE+vlt0z81YDn+RSh2HB8Z4sxSX4Q1oZaN8RByob9syP0FyEpW1A8wr
	LJLi2S0cOSAoSxj/xcuBlaqdwubEkBc3DaiJgmPDvZcKyNae629VQ8JBR8tOiAtw
	Mybwx6hkRDRX2z1ef3WF97LU+ljJ+GOwaVk7sc+/pk0wPJk1+IDSJNbP4uDkN8ad
	zulvu/PaOvkp7VzOiMFUF8AEcs7tRng4IYNmp518QKhm7TvfO84Ry5OL1okzbyEg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx4a5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:49:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AK9mv0w027019;
	Thu, 20 Nov 2025 09:49:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx4a5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:49:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AK70qg6017404;
	Thu, 20 Nov 2025 09:49:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1we6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:49:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AK9mvgS31588712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 09:48:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 154C320040;
	Thu, 20 Nov 2025 09:48:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD1832004B;
	Thu, 20 Nov 2025 09:48:51 +0000 (GMT)
Received: from [9.61.251.198] (unknown [9.61.251.198])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Nov 2025 09:48:51 +0000 (GMT)
Message-ID: <b3a65424-e5f6-4407-8b11-cf56047ab071@linux.ibm.com>
Date: Thu, 20 Nov 2025 15:18:49 +0530
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
Subject: Re: [PATCH 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove
 locking in EEH event handling
To: mahesh@linux.ibm.com
Cc: oohall@gmail.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, bhelgaas@google.com,
        tpearson@raptorengineering.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
        sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
References: <20251105064052.8122-1-nnmlinux@linux.ibm.com>
 <nc4udvo6zlszyo7n5roavkjnfpwa2owqpwkov5bl5frmkvclrd@plttt3brumjp>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <nc4udvo6zlszyo7n5roavkjnfpwa2owqpwkov5bl5frmkvclrd@plttt3brumjp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I2jiAlpaHqglestqxQYIWy9kMMeejxiP
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691ee40e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=UeZeE82GjdwUEw3JghYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xXoK1r7oqQixnbPyC39i_CwjhnIUmyiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX3R1zJBZig2OK
 eRJZ/80ZcqvWEBK8NPN6uajPSmsrArFgMylAORnR5qHjXCCEZzrEa0zOhwRmGkV01k1fIifhEP7
 VaFxEqcTNtXndSKpgjRz2Q7Yuyw0BX58EkmnfSUeILwkmK0vxU8pAtIi9nCoRQPs4TlmvWxFOsK
 +1bKOlRAPKKvqZ+z0WJTAaqIPojRU0W0pWwbyHdVLLxxIPMFS8fs3t52wQhDrMRu70y43Kf2OkV
 9oLNb+ovH8MR664P2RU+8ChD59HgTqeX4XUhqVEacFlh+9Cnl79OcjuXW7u1yNno9D4Z1uW6Oao
 rQxcGkphwqits7kudGc+6T0czzqArnZ0EFpq5N3IBxzSMCpP1GOQEIxFfHKv1nFMpZcusuqelyO
 YdCp6cksnruZMZggcpLWrmyrG7/+Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 18/11/25 2:26 PM, Mahesh J Salgaonkar wrote:
> On 2025-11-05 00:40:52 Wed, Narayana Murty N wrote:
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
> [...]
>> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
>> index ef78ff77cf8f..492fae5e3823 100644
>> --- a/arch/powerpc/kernel/eeh_driver.c
>> +++ b/arch/powerpc/kernel/eeh_driver.c
>> @@ -812,6 +812,35 @@ static void eeh_clear_slot_attention(struct pci_dev *pdev)
>>   	ops->set_attention_status(slot->hotplug, 0);
>>   }
>>   
>> +static const char *eeh_pe_get_loc(struct eeh_pe *pe)
>> +{
> So it is duplicate of eeh_pe_loc_get() with nolock variant. Instead, can
> we split original function eeh_pe_loc_get() ? Move the while (bus) loop
> into another function with name eeh_bus_loc_get(bus) which will be
> nolock variant and use that here ?

Thanks Mahesh, your suggestion will be taken care in the next version of 
patch.
https://lore.kernel.org/all/20251120054418.3363-1-nnmlinux@linux.ibm.com/

>> +	struct pci_bus *bus = eeh_pe_bus_get_nolock(pe);
>> +	struct device_node *dn;
>> +	const char *location = NULL;
>> +
>> +	while (bus) {
>> +		dn = pci_bus_to_OF_node(bus);
>> +		if (!dn) {
>> +			bus = bus->parent;
>> +			continue;
>> +		}
>> +
>> +		if (pci_is_root_bus(bus))
>> +			location = of_get_property(dn, "ibm,io-base-loc-code",
>> +						   NULL);
>> +		else
>> +			location = of_get_property(dn, "ibm,slot-location-code",
>> +						   NULL);
>> +
>> +		if (location)
>> +			return location;
>> +
>> +		bus = bus->parent;
>> +	}
>> +
>> +	return "N/A";
>> +}
>> +
>>   /**
>>    * eeh_handle_normal_event - Handle EEH events on a specific PE
>>    * @pe: EEH PE - which should not be used after we return, as it may
>> @@ -846,7 +875,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>>   
>>   	pci_lock_rescan_remove();
>>   
>> -	bus = eeh_pe_bus_get(pe);
>> +	bus = eeh_pe_bus_get_nolock(pe);
>>   	if (!bus) {
>>   		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
>>   			__func__, pe->phb->global_number, pe->addr);
>> @@ -886,14 +915,14 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>>   	/* Log the event */
>>   	if (pe->type & EEH_PE_PHB) {
>>   		pr_err("EEH: Recovering PHB#%x, location: %s\n",
>> -			pe->phb->global_number, eeh_pe_loc_get(pe));
>> +			pe->phb->global_number, eeh_pe_get_loc(pe));
>>   	} else {
>>   		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
>>   
>>   		pr_err("EEH: Recovering PHB#%x-PE#%x\n",
>>   		       pe->phb->global_number, pe->addr);
>>   		pr_err("EEH: PE location: %s, PHB location: %s\n",
>> -		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
>> +		       eeh_pe_get_loc(pe), eeh_pe_get_loc(phb_pe));
>>   	}
>>   
> Thanks,
> -Mahesh.

Regards,

-Narayana Murty.


