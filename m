Return-Path: <linuxppc-dev+bounces-11709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA5B4368E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 11:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHYSD2t2bz2yrZ;
	Thu,  4 Sep 2025 19:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756976636;
	cv=none; b=di8VyMWahV5BsdgBMhQEWyPGHBTTjT4Z4uVPJ/V1IwwDHPiKFXgRjcucjx2Amw78bsSu4bgyYtuy1N49eTaFWmrwaBpR+DeYCjpy8Q+irJcQIpllxmV+dVtQyvvwm1o4XFKLX56ROtSmpyMCzBegppCdezbImitMGsObcvm/06zJprXjkVXG7xqbGN2M8DTbsV7nu6dszWUrOrDdKyWvYF3j7VsQ0LHGkley2WIqEp69Kilb9LrQlHmVyn8KHvJBPrETEQ6kXoqTIpkEhhWTfMMXUv/FZSWcsvQ007lwR6/Ez8OQ9ABUpqzyoX+/PY0Gvhywv3E+eFsAmWtzgGxJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756976636; c=relaxed/relaxed;
	bh=RbHSrrLxoAfw/2Ap5rakjMkL1KdORPYbC8McZqBYCQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAR+NFCevIVgQ32qP9xZwTbLu51jB0GZNy9pQ86baUF9xPkc8ptS/ZcTOFf5dTwSuPZhIT3BKea5TmB36fFDwItQEJ4JpPRtM1e5WlJQD1L+GKgpyIyHeozhuldlCKsGG03+aU+J7KOt4ohfK7S9+u4Yex1L/6J2p2a0W6bQlDqLJ2rFyO6dypT56V6XQoReo/axwvkiR9oEM43n4rfL9bT7Jz4HGk5nJjvXHRIYOogm3v2j31GeMgPF0h8EDCr3HY7SfY52wFgSZCN4yQa7Xn72EbteLuEKIAtPVS25BiyY1pRmppkCCjCFEjrPNxPaCLDFDS31hxz2GSM/b/OCcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fZWbDECB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fZWbDECB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHYSC2fGDz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 19:03:54 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58443CTD005481;
	Thu, 4 Sep 2025 09:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RbHSrr
	LxoAfw/2Ap5rakjMkL1KdORPYbC8McZqBYCQk=; b=fZWbDECBEh87kskISlFw9M
	lL5gW4TvTbE2ap6EB5+yi/0bPqGSo+D7Pm8Z8foUxfsyEe9FbZCP1aGyw5NIg5Ii
	CtAoKt70S6g3gat4JqCFWx/A7Qt7M2XBSBtzcC0ZBYWsK5KKz9w2ewSchRkEaq+/
	UMI2/p9HCEQr1k8ipQbZ7/VPD9kemJdj7oS9OfP96jlI7XaNOi1krY2QPN8XCz17
	bsJ7jaSl7CnwK4Nm7QYtbZULNxXEdDzyBF2GJy+rG67AHBTCtVZJ/cz9guj6/MtD
	sIpTCyDGy4zMzvffR6DPnPL3yr1qX4I/1RNXX3+ujrSev6gVcQ3TpmuHG4P6FQbQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usvg0th1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 09:03:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5847L6lM017206;
	Thu, 4 Sep 2025 09:03:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vc10uupx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 09:03:49 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58493dik20775440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Sep 2025 09:03:40 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04D825806C;
	Thu,  4 Sep 2025 09:03:49 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7399358068;
	Thu,  4 Sep 2025 09:03:47 +0000 (GMT)
Received: from [9.98.111.108] (unknown [9.98.111.108])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Sep 2025 09:03:47 +0000 (GMT)
Message-ID: <21ad3bf6-4654-43a5-9dc3-ebcdc676d542@linux.ibm.com>
Date: Thu, 4 Sep 2025 14:33:45 +0530
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
Subject: Re: Kernel v6.17-rc4 with STATIC_CALL_SELFTEST=y enabled fails to
 boot at early stage (PowerMac G4 DP)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Erhard Furtner <erhard_f@mailbox.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
 <98dbafee-aad3-439b-9efb-76f80c6668fd@csgroup.eu>
 <ca440403-0108-4703-bf07-bc3ac7e3d108@linux.ibm.com>
 <e042d4ca-c66b-49ec-8572-442ab697c430@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <e042d4ca-c66b-49ec-8572-442ab697c430@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=behrUPPB c=1 sm=1 tr=0 ts=68b955f6 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=WvaVCvqVqn7VJI_gSDEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6IUhB15uWMMoI4HMoS4jhbyMDXGi-JiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX688GjrGfAyiu
 Vo/g3oOViUoqt2iUudO433JHYb8kZ1zWUE9CAOvjxXzBQBEBZr/xGSGFEcFP39oHxDVDrAglJcF
 +8QKUJEQsur/6b+97Dds5IEXcpDY7N+YxUV+Ozsh9PuJ1NxJ3Efu+hvyWe17MPZiB5ONKZ2Q6lR
 oR6I0RgGUJFGIlERksVLZ1RI1Uoxg7rjl70LAJ0fJh0dDMXafsLPj6N2AsWZG2DkP5ecLEI12wY
 LQ8Fqe7i6zrSb9SC9UgXRZOc484PPoXf60P2R8RfwGhxnGtziqb6xT5pGmngH8/M3b0GpHbVf0D
 xIxp/eo+ZKpMS0OfI0nKeOOPJ6PyFzw8+OSm3A3BF+2j6o386XssblitIFM0bKoJIKbBKl8sJtz
 yXYKtFQw
X-Proofpoint-GUID: 6IUhB15uWMMoI4HMoS4jhbyMDXGi-JiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/4/25 2:15 PM, Christophe Leroy wrote:
> 
> 
> Le 04/09/2025 à 10:40, Madhavan Srinivasan a écrit :
>>
>>
>> On 9/4/25 1:01 PM, Christophe Leroy wrote:
>>> Hi Erhard,
>>>
>>> Le 04/09/2025 à 00:44, Erhard Furtner a écrit :
>>>> Greetings!
>>>>
>>>> In a conversation with Andrew about his page table check code for PowerPC he found out there seems to be a general problem of the code patching code on ppc:
>>>>
>>>>   > I note that STATIC_CALL_SELFTEST seems to fail, which could be but isn't
>>>>   > necessarily related.
>>>>
>>>>   > Specifically, it looks like code patching fails if the instruction being patched
>>>>   > is in an __init function, and in this case, that occurs due to
>>>>   > page_table_check_pte_clear() being inlined into ptep_clear(), which is in turn
>>>>   > inlined into pte_clear_tests() in debug_vm_pgtable.c which is marked __init.
>>>>   > Very curious!
>>>>
>>>> Indeed, when I enable STATIC_CALL_SELFTEST=y on my G4 the kernel fails to boot at an early stage, the OpenFirmware console showing only:
>>>>
>>>> done
>>>> found display   : /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1, opening...
>>>>
>>>> Without STATIC_CALL_SELFTEST the kernel boots just fine.
>>>>
>>>> Kernel .config attached.
>>>
>>> With your .config, on QEMU I get the following. I will investigate.
>>>
>>> [    0.000000] Kernel panic - not syncing: arch_static_call_transform: patching failed func_a+0x0/0x10 at 0x0
>>> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17.0-rc4-PMacG4+ #1628 PREEMPTLAZY
>>> [    0.000000] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
>>> [    0.000000] Call Trace:
>>
>> I am using qemu with -M mac99 and it boots
>>
>> Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
>> printk: legacy bootconsole [udbg0] enabled
>> -----------------------------------------------------
>> phys_mem_size     = 0x8000000
>> dcache_bsize      = 0x20
>>
>> I am missing something here. Digging some more
> 
> 
> Did you use the .config provided by Erhard ?
> 

Oops. sorry for the noise

Maddy

> Christophe
> 


