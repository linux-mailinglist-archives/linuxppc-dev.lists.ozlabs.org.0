Return-Path: <linuxppc-dev+bounces-11708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8311B43619
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 10:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHXxy3BHmz2yrZ;
	Thu,  4 Sep 2025 18:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756975270;
	cv=none; b=AR5MYFefv6qbK/LgQGNn/q0BTP9WSlewOdvY/vhZ9JEmnaQaiWi3IG6hwOBkASIFzQ4obHNzRE+hQih3mSIN9VYCbR9vjALR2wttMwvh2YN0H4bb/xwGR5llUNuk7l4RXCnDSz7a3iIiphhgyHwiudyQIEaugC12+lD+ioj8CVQyJGQqvcQvGC7ZC3zuLg4S+u61Eeef5/Dt3Ls9IIzd658YPaCrtMXyC1y+wvoKRrhOPxMFKuF0e/2qOvaPELR6TnGM0fEs5YTWvdJVFqfTmb7u+iCcP9v9m4Kgc+i5hx0+vyTcoGhJ5BoRYvQ4ZPWZkDr2SafNSF4k6LRUO8Dgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756975270; c=relaxed/relaxed;
	bh=Yw8WvSIMitmPA6vQZw4u9WE2g0L4G1YDk3LTxW3/P6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzIl/rvgnJYBOHGjuQawl8QejCi1QvVct+wiuKD7Q/ZQqiypes+ptswWuTkGeX74yLt34I430oycgD6p2luyEfh0EYafob7p1IYYB5rgB+KoXqDqmjdjuwAwJBzQrguYRhd+qtE8jH26hTvxnphCHFsfUbzwfnzy6oaSg85Ws6+SY27ibjPuNS9zOmjjRO/wXe+TxbmApU/byk25HHwJK+5X48h7zt2t7rAWBGANLPbuu6ScT9RzfEWFsPXYmVJPZLCTnQL+/DD2m4e2JgX//n4fqPEczaLXLDu9cMNSGEOrQEyHX2RdKMxNgXXwEB1jz6VKeisu5AxDHV/QOKrR5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rg4Sxyif; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rg4Sxyif;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHXxt5sx2z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 18:41:06 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583LgGeq032215;
	Thu, 4 Sep 2025 08:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Yw8WvS
	IMitmPA6vQZw4u9WE2g0L4G1YDk3LTxW3/P6Y=; b=Rg4SxyifEoAPdQy8idI3i7
	o5gzfdws7p/VLSGni/e1OSEW4So4XLphir8+Wax2oB3XPSxKwosbdFQusYlU9wTj
	NXbSBwzm1CAkHHyXhijA0KIgR7kHTu3X5TYGv76XuihVt0UCN+W4eSgJXUlBxy3d
	CHm2X40Q+W3hQCBDuMmwGoE7qo8vvM8DjI2xZZRhRPgY59MqrcAiWaif7n8kZNGh
	J0sc52QmaGfB/h973g9wuiAJ/zr/nQaFvpC6Bg4N21sJbPn5G30bxqnilEa+HUrC
	xy/Uac0q1yhTNf8looC+sSHlOXN5vQyNikWFLn9vaPW/1P4GziJxKfzxEqvu4cYA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshf4t6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:41:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58482KM5019316;
	Thu, 4 Sep 2025 08:41:01 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vd4n3hk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:41:01 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5848f0Lo30868044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Sep 2025 08:41:00 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8345C58056;
	Thu,  4 Sep 2025 08:41:00 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1719258052;
	Thu,  4 Sep 2025 08:40:59 +0000 (GMT)
Received: from [9.98.111.108] (unknown [9.98.111.108])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Sep 2025 08:40:58 +0000 (GMT)
Message-ID: <ca440403-0108-4703-bf07-bc3ac7e3d108@linux.ibm.com>
Date: Thu, 4 Sep 2025 14:10:57 +0530
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
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <98dbafee-aad3-439b-9efb-76f80c6668fd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MFI7InF78xLoMgcW2zFHKinNamAmEK_K
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68b9509d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=mk9LjasWFAK-6koTwL8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MFI7InF78xLoMgcW2zFHKinNamAmEK_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX6qhwbxTKyr1l
 5wdDA9CBAol1ZFdL2puJYeH2wLlJ7tJiNhbUwm73I4CQW3nKk3Gxrjxdxy9ITilA4EiZPKNKqBa
 rTXWjx0q5X9n6D+hQoIKUeYzncSPKZ+RTL7rVLrRbCrfLoudUCYUqS3N+wUN13P/fXYIPP8Kwuf
 2O7lLlTHmRr4Afp2KD+WnswlXOrutfMwf4zU9tXDIF6/nwDQXO/w615p/oHM0/ya5Wym2r2wvOe
 /eAT68+PZ0xOqmh9soucqero9Tus0vYKPUk8KettUxSforT/I/0U46zeQaOpUAfVGIeJrM97w0b
 GnvBTTqDVUzXWBdhvyM26Gst+y3eOg0hvcrsDoDVuZ+omm41WmcVZrscTNgRDBZLpZ0F2MUD11/
 MJBfbzuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/4/25 1:01 PM, Christophe Leroy wrote:
> Hi Erhard,
> 
> Le 04/09/2025 à 00:44, Erhard Furtner a écrit :
>> Greetings!
>>
>> In a conversation with Andrew about his page table check code for PowerPC he found out there seems to be a general problem of the code patching code on ppc:
>>
>>  > I note that STATIC_CALL_SELFTEST seems to fail, which could be but isn't
>>  > necessarily related.
>>
>>  > Specifically, it looks like code patching fails if the instruction being patched
>>  > is in an __init function, and in this case, that occurs due to
>>  > page_table_check_pte_clear() being inlined into ptep_clear(), which is in turn
>>  > inlined into pte_clear_tests() in debug_vm_pgtable.c which is marked __init.
>>  > Very curious!
>>
>> Indeed, when I enable STATIC_CALL_SELFTEST=y on my G4 the kernel fails to boot at an early stage, the OpenFirmware console showing only:
>>
>> done
>> found display   : /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1, opening...
>>
>> Without STATIC_CALL_SELFTEST the kernel boots just fine.
>>
>> Kernel .config attached.
> 
> With your .config, on QEMU I get the following. I will investigate.
> 
> [    0.000000] Kernel panic - not syncing: arch_static_call_transform: patching failed func_a+0x0/0x10 at 0x0
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17.0-rc4-PMacG4+ #1628 PREEMPTLAZY
> [    0.000000] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> [    0.000000] Call Trace:

I am using qemu with -M mac99 and it boots 

Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
printk: legacy bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20

I am missing something here. Digging some more

Maddy


> [    0.000000] [c0dd7e60] [c0810e54] dump_stack_lvl+0x70/0x8c (unreliable)
> [    0.000000] [c0dd7e80] [c004b220] vpanic+0x114/0x2e4
> [    0.000000] [c0dd7eb0] [c004b45c] arch_set_bit+0x0/0x38
> [    0.000000] [c0dd7f00] [c00155fc] arch_static_call_transform+0xec/0x1e8
> [    0.000000] [c0dd7f30] [c0176944] __static_call_init+0x110/0x288
> [    0.000000] [c0dd7f80] [c0c19ab0] static_call_init+0x4c/0x9c
> [    0.000000] [c0dd7fa0] [c0c02e00] start_kernel+0x7c/0x664
> [    0.000000] [c0dd7ff0] [000035d0] 0x35d0
> [    0.000000] Rebooting in 40 seconds..
> 
> Christophe
> 


