Return-Path: <linuxppc-dev+bounces-11820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A7B46BC4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 13:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJs2C5wwwz307q;
	Sat,  6 Sep 2025 21:49:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757159363;
	cv=none; b=IiLR13RBDTxxqIQ+gWKU60si6wEO7vUN7QlTswqo+HH6/jrVZqF/JtmCMh/G1oDg1RsoBPAvUzPBxcaRU76FZa4kxvsGNdyS55Z1kbwBT1paVwndXyDyJaTMnvMj7MOOJTTGqkJrAgMtgFvCljng/RCfXCO2S0FX9Idx1v3HW7rtRrPLVQVup6qBsGxjt09WIypct9XB7CmrZK5wYVNfNLd2G6TFaNVLMQOPezPt9gMNRUhVif0zDdVNVTUSImVm7iWMLq28XMA3npaeGLSOvnGRRxIY0vT6WdYcIOZvEVxOGkDM1EnOCjhubZc01beFjI2qItxnUyq6sw77WMLvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757159363; c=relaxed/relaxed;
	bh=qnCB6u5WYwPEw8570CRxNJhBEkv9PSGyryoGC6PXRsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ip2ZyUvOo07SXmdEM327w8grQzDMP+Nv0M8fDTuY11p/d8mdZWSdvCuE+p9BwobY/ussJmd5ckpEC7MIJfUyIqXyo6sdYUzIyexFr1L0rSmZSzJQ3+19WkvFpfRaot8v+0lonQWAjWX9p50SXzZSNgKyRN3m25GJGGzpyhyZ1RCjc+f50Ob5kgNvk6cAF8sdVYyQxepX5FZCEKbLYpRUhxJ6q/i08fK7GvOM4HdcKP/TdkKJGTY35icPZevMr8alYIBxXwqdvUlGTJ8HAPeyea0NL+cVeFQMODywd3pgjDX6BZ0Rdju9asYi3GXaTzTNogzHM8Et0BLHKVFcFyVamw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tuw0RFoO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tuw0RFoO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJs2B0dXnz2yqv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 21:49:21 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5865w0jn008429;
	Sat, 6 Sep 2025 11:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qnCB6u
	5WYwPEw8570CRxNJhBEkv9PSGyryoGC6PXRsU=; b=Tuw0RFoOpLr0heCt11tUn9
	39XzO2y8p5kHRUyS3Mvh8SjVEcALoY5EPqsNrcO0TNbqJIma8K7EAWaxKJ9HE4FB
	o+4DtF200l6JuyyjiHfQBtXacEzRKhBVIbTxJ7egE8Ov700PxEn/R0BkKfHXCyER
	sPCo5PVQl+QAHd/HdDO4U9dlaPVLeKRv8lOWinXw+kgyjgvRkQAsy8RiN3TtUEge
	7msgWZJYpLdBeFnYEPQOYNQqIjGZge5BB8nJvPuBMaIVzliehn1jC2SbrkxlzGWc
	8E9nqg7uYcdQ9dA+FpCp5WMBw4SQkj08TAwVVHPJBJA99W+bapXGvk1X96dTOUFg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9bjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 11:49:05 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586Bn4PF022920;
	Sat, 6 Sep 2025 11:49:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmw9bjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 11:49:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5867euXp021191;
	Sat, 6 Sep 2025 11:49:03 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmq5p8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 11:49:03 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586Bn3RN20120306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 11:49:03 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5008458055;
	Sat,  6 Sep 2025 11:49:03 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA6A25804E;
	Sat,  6 Sep 2025 11:48:59 +0000 (GMT)
Received: from [9.43.107.45] (unknown [9.43.107.45])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 11:48:59 +0000 (GMT)
Message-ID: <88359a18-7b82-41b5-b000-d4df837efd23@linux.ibm.com>
Date: Sat, 6 Sep 2025 17:18:57 +0530
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
Subject: Re: [PATCH v2 0/3] powerpc: Cleanup and convert to MSI parent domain
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Marc Zyngier
 <maz@kernel.org>, Gautam Menghani <gautam@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <cover.1754903590.git.namcao@linutronix.de> <87y0qvy6hb.ffs@tglx>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87y0qvy6hb.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4Kh3TUHBmB-yM0LSrAVxQtD1dCxCpaJj
X-Proofpoint-ORIG-GUID: B4TI_8vZxenGmBxhhLh2rVLrsgQUjp9i
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68bc1fb1 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=8RBs8q9EwLlXG4qsgXIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX4WYIcpfPAHl6
 LFImDKnYLisqUBc4ugz0KFRtevC/jhdaUPLDIcqlJ8i4k/DXrqhpqah5XTMkZIplHi/oAJGtsv4
 RWml+Igi1wmuC2DDr3GlPMsonIPdXleUQpED5mNOJK93BLbbJu9quMitoe7OOQt0e/TN4k/fOGk
 L7llbBAMSggAbAjn13e8UnXxQc8tsewrgb+bAHMenkaRpCivObWpo7B+9kIj3oYfr1kZJrHM3fF
 h9ygRw/+l3YfMrB3HNN/6W2wro4pkm6DL9KkXuOF3kyZZKR5nYf7Nrf70vTXZQF2R/n07xlJdiT
 Ti/m42HNGdDDnbJhvMvYhb9aylL6EkMsKlRSiI98XhRZ0ldytEx1766kDtawnRXJbs424k6uqbe
 0ybctWtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/3/25 7:37 PM, Thomas Gleixner wrote:
> On Mon, Aug 11 2025 at 11:28, Nam Cao wrote:
> 
>> The initial implementation of PCI/MSI interrupt domains in the hierarchical
>> interrupt domain model used a shortcut by providing a global PCI/MSI
>> domain.
>>
>> This works because the PCI/MSI[X] hardware is standardized and uniform, but
>> it violates the basic design principle of hierarchical interrupt domains:
>> Each hardware block involved in the interrupt delivery chain should have a
>> separate interrupt domain.
>>
>> For PCI/MSI[X], the interrupt controller is per PCI device and not a global
>> made-up entity.
>>
>> Unsurprisingly, the shortcut turned out to have downsides as it does not
>> allow dynamic allocation of interrupt vectors after initialization and it
>> prevents supporting IMS on PCI. For further details, see:
>>
>> https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/
>>
>> The solution is implementing per device MSI domains, this means the
>> entities which provide global PCI/MSI domain so far have to implement MSI
>> parent domain functionality instead.
>>
>> This series:
>>
>>    - Untangle XIVE driver from Powernv and Pseries drivers
>>
>>    - Convert the Powernv and Pseries drivers to implement MSI parent domain
>>      functionality
> 
> Polite reminder to the PPC folks. Can we please get this moving so we
> can finally cleanup the pci_msi_create_irq_domain() leftovers?

Yes, sorry for the delay,
Will add this to my next after the test

Maddy

> 
> Thanks,
> 
>         tglx


