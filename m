Return-Path: <linuxppc-dev+bounces-9731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C7DAE8052
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 12:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRzHl4Vprz307K;
	Wed, 25 Jun 2025 20:55:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750848931;
	cv=none; b=LJ3cs2o4/Xoq+YhCp2c28oAJAK4MoY+lgbwwDMIMqGcYfIaMq7RLKkyOLbGIaPnGPld5ZzofwxiXtDaHxdGOYTQoQLS7PAmMUkD5gU3Q4qHVOPXcVidLUXN9yGbbUMtjdoTABxQXRHcIUDVLB6Val8IgdDOJ/GYhO5g6sFEvOi9SqIDkUboE1e7Pi0kNkeTcp14yCJLNLB+DNBd7QEnzWzRuzvz1GdJxiXShg/Aahg8ZXGIecpgDVj+YCLFBvpzhPG9BD2cAp0fAj9EywqbbmgOcI641TvdE/vo/plfVjA/SQeXhqkuAWNhm12hU8eqj6GZ6q8NRhy3TmBxSvKBIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750848931; c=relaxed/relaxed;
	bh=5pvIgaAdo15YeKemezHuojdrBVvkoL3iZSzPinkaKec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cY0teWGFFC+QERFMXE8JTf7Nw+rtKMf90BF1pLpEZH/vjWFTyTbaLY96w4bhv+rugkC6wq5OH3IhfObptdIv+6IOxugLxJ6ZnsQAon5GMEwXpZ/GPUjZtzwueDSpIZqE2sPmVbW4JTR86Gi8guUw1tcgT/PDEta6HUDSgWbRTJC3nXIv8+45AiEjRRAW4zCuLro4iX9LGiSWSJHHG/VFg+f0xApA/y92OaD76+EmN/MQVFMTFeWXtUpZzzKxPaz7fk02lf7n8pBMAIbN4ovAbaYSlrGi98oSrE/FnB/HuoDNO5swCI4Wm8RaeRVWq8RD3yghfCi3pIcRkFqoDw1Z3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JtmZcM8g; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JtmZcM8g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRzHk2wKkz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 20:55:29 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9YYEC012677;
	Wed, 25 Jun 2025 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5pvIga
	Ado15YeKemezHuojdrBVvkoL3iZSzPinkaKec=; b=JtmZcM8g55nPhs59guFTQV
	rsi4pWs4FXqTw6EVqkXfM2OAFBMmxKILKw34k20z4MZbw6mDV+pe2vme01BStHye
	bcw33gaTqDOgAFDoRTOysXwV/lI3d1H4ZwhfCgwYEMi3gkbpNr63JuP+T+C6KAWs
	4EQsw/eO+iR+xsZnEVxRzNK5jOVO08ZDbRnkB0kpUwz1RmYPZAlvf/i0RQCnCiCR
	NgPhXovva6KVgrMI1yXcZ3mLX2wbR5W/r6b164nmucj1QCZfY0SaFJaq5J0ekJlM
	y7e1wrnHflQCOpYJZ+YaY/T6chiArg8YWxlyeigB2se6N2UzDWI9ItfZfnx509ZA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5txt34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:55:13 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PAqHIO011226;
	Wed, 25 Jun 2025 10:55:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5txt2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:55:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PArp5r002908;
	Wed, 25 Jun 2025 10:55:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jm8st8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:55:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PAtAg029556996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:55:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CAE12004D;
	Wed, 25 Jun 2025 10:55:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB73E20043;
	Wed, 25 Jun 2025 10:55:07 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 10:55:07 +0000 (GMT)
Message-ID: <078c1b43-4574-4b11-b474-f37a139af62d@linux.ibm.com>
Date: Wed, 25 Jun 2025 16:25:06 +0530
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
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
To: Lukas Wunner <lukas@wunner.de>
Cc: linuxppc-dev@lists.ozlabs.org,
        Timothy Pearson <tpearson@raptorengineering.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "\"linux-pci\"," <linux-pci@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        christophe leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        "\"Bjorn Helgaas\"," <bhelgaas@google.com>
References: <20250618190146.GA1213349@bhelgaas>
 <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
 <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
 <aFaCfYre9N52ARWH@wunner.de>
 <f13a2d2b-af52-4934-b4fa-66bc1e5ece32@linux.ibm.com>
 <aFuuYq0m0hDAdPRF@wunner.de>
Content-Language: en-US
From: Krishna Kumar <krishnak@linux.ibm.com>
In-Reply-To: <aFuuYq0m0hDAdPRF@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UVMRLJIp6nSttSK4sEd_QX8wv_4g4aZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MSBTYWx0ZWRfX93uHIVC08qIZ zDSS78SGvIrATgrTrST909ZZiczGHqfZya585/kQLhm61ZiZsV6c9gJHmspkQjAOOZ79f2CBx6x e5tL+4QHcqFLyIMg/RXsVwXFzNjjVOpBG3y/F2Wzd2dmmmWTluDDcmRW9w12VEBHbP3EmpVNAZk
 hoZH1fknP9AhFjHTL0s1w3unJbCdxNY8G0UXLofmk6RUaRxQawd9Oz950Bepo1xxFWQR7XKmvUp pxTUozMTqwljPfSz7BCNOPANc88exVf1xFp90C4WuKqhUKfHcPkT2wh5SG8APpDARFH4/hnSowx fR45VlOavuNAc8RgukU0AIPz258JYrIwjJ46t5rtELsSEbmYY/yYgo+CCk9WtBs5yVMZ/OESGa9
 /eS/Knm2jWLWexJs5KRCMXetMwnWDj1KMu3/0Ek0RunxGz9rIrNvYA6nkHV2hCBntf0vkoYg
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685bd591 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-dPevh-D5Ufp4ETwuQAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WqtxR-q0R8Z9YnxnNh7wpkSOl1In-mR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=933 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/25/25 1:38 PM, Lukas Wunner wrote:
> On Wed, Jun 25, 2025 at 09:38:19AM +0530, Krishna Kumar wrote:
>> On 6/21/25 3:29 PM, Lukas Wunner wrote:
>>> On Fri, Jun 20, 2025 at 02:56:51PM +0530, Krishna Kumar wrote:
>>>> 5. If point 3 and 4 does not solve the problem, then only we should
>>>> move to pciehp.c. But AFAIK, PPC/Powernv is DT based while pciehp.c
>>>> may be only supporting acpi (I have to check it on this). We need to
>>>> provide PHB related information via DTB and maintain the related
>>>> topology information via dtb and then it can be doable.
>>> pciehp is not ACPI-specific.  The PCIe port service driver in
>>> drivers/pci/pcie/portdrv.c binds to any PCIe port, examines the
>>> port's capabilities (e.g. hotplug, AER, DPC, ...) and instantiates
>>> sub-devices to which pciehp and the other drivers such as aer bind.
>> 1. If we get PHB info from mmcfg via acpi table in x86 and create a
>>    root port from there with some address/entity and if this Acpi and
>>    associated entity is not present for PPC, then it can be a problem.
>>
>> 2. PPC is normally based on DTB entity and it identifies PHB and pcie
>>    devices from there. If this all the information is correctly map
>>    via portdrv.c then there is no problem and whatever you are telling
>>    is correct and it will work.
>>
>> 3. But if point 2 is not handled correctly we need to just aligned with
>>    port related data structure to make it work.
> PCI devices do not have to be enumerated in the devicetree (or in ACPI
> DSDT) because PCI is an enumerable bus (like USB).  Only the host bridge
> has to be enumerated in the devicetree or DSDT.  The kernel can find the
> PCI devices below the host bridge itself.
Yes in DFS manner (once it gets to know the PHB address via -acpi in X86 and via DTB in PPC)
>   Hot-plugged devices are
> usually not described in the devicetree or DSDT because one doesn't
> know their properties in advance.
>
> pnv_php.c seems to search the devicetree for hotplug slots and
> instantiates them.  My expectation would be that any hotplug-capable
> PCIe Root Port or Downstream Port, which is *not* described in the
> devicetree such that pnv_php.c creates a slot for it, is handled by
> pciehp.
Your are correct, pnv_php.c heavily depends on slot id and DTB nodes. Thats how its designed. Can we decouple it via DTB nodes, I will come back on this.
>
> Timothy was talking about a Microsemi PCIe switch below the Root Port.
> My understanding is that the Downstream Ports of that switch are
> hotplug-capable. 
I understand it.
>  So unless you've disabled CONFIG_HOTPLUG_PCI_PCIE,
> I'd expect those ports to be handled by pciehp. 
I need to check it and test it, but yeah- it may or maynot work and I will confirm it only after some study and testing (maybe in 1-2 week)
>  Assuming they're not
> described as a "ibm,ioda2-phb" compatible device in the devicetree,
> but why would they?
HW topology and DTB is based on IODA and it will keep changing, not frequently but eventually.
>
> Thanks,
>
> Lukas


Best Regards,

Krishna


