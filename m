Return-Path: <linuxppc-dev+bounces-5795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC1A26C1B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 07:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnD275gClz2ygY;
	Tue,  4 Feb 2025 17:27:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738650479;
	cv=none; b=dTE5Q1iNFvExWiFswU8xpSZS7NAIhjdKpRCPO6rRfRbi+KltKdH0AU7447uyUueBhsl1G1L3uJgwTD6cabV8VmA/ScIUfB+byaz1bJOd9OyGkmJ48iPvlgcENmubn5tZ2Ep1NtROv81P+VwKshPsniacAZolwYjI3uoBpvizK4dPnFmrfeZlurai1l/feYlYYajLNYu3bZeh1FbeBffA+SDaOWohJW+egw7PF1gurOf3jYRciJsi+S/8ZxlEPRAA3VPSII9zW8o5IkFwEteLjS7BV3MaXEJ4qDI087G93K82MIIe8mGQtWIGlMEksOfRfLHQWbE3S5Tf+89zZyFsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738650479; c=relaxed/relaxed;
	bh=aiLxudnRK1rMdHEVr3d3nVv4KIcdCuRqjEa5BWv6eVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Une/MLYDAmgQ2iH4Yfg2Tgk/GNkJvZWTRVCMlvzM4P/xcfz8uG3hnT1ypVEzWtok4CvOf1/RXAFCWBqZybuXb01O7tt039yuMrdIBkW98dl+CExhS3dc3ya29IPNFUOMfr14kV1ghxnfX5w9NEZsVapqiPYhpTXiqjKP8dfRWBu6ck0DBRSBDgCdTDnNyk9KeYzLJp9KS4BPZv8bhRhV0zb7AbmANo1V6m80iTFVu7fi8dU6KwOQuG+NbmvB8VF9+5m1L0jB71IWWGs4H/H9oc03ehBGQ22n81jEGplWRz2Rsrp2yz6aPKyXY3N035OjW2UA/pVEMFm1DDbd0W6urQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AeNlbsWl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AeNlbsWl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnD266lMWz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 17:27:58 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51420iO7007812;
	Tue, 4 Feb 2025 06:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aiLxud
	nRK1rMdHEVr3d3nVv4KIcdCuRqjEa5BWv6eVI=; b=AeNlbsWltsnSa+XA6Iq78a
	wXMecbykOCcrRSh7bHPrOVEkBNeV8nFatv/gGSH87haa4OYIj25PrlBTUuVKACqt
	romtVsken3Crmd4K2vRLV5bmNREPxqZqmUAPDVnIEX6pvCut14pwaOFj+aI9Sxji
	jcBp1sDdtz4qnrPnnRaIUOJwcmuiodhcndKzjng5yycN2KdZi3fMlBOxHbztkTsS
	E70/aovKIdZM3nDAoXjDsBy131cVxFtr5p7EJlZqyIEUr6+zwo4OCUqDub8LiBvZ
	aI+C7ADKmmmvViv51lm+y/3LYBdjJUTGirSYHGlmXX9pV77Kq5FQDgCIMVNHJzIw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k9r0rv34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:27:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5145i63j021477;
	Tue, 4 Feb 2025 06:27:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j0n19sy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:27:49 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5146RjKf51380598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 06:27:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93C6E20043;
	Tue,  4 Feb 2025 06:27:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5017420082;
	Tue,  4 Feb 2025 06:27:44 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 06:27:44 +0000 (GMT)
Message-ID: <fdf5cec6-54ce-4042-b8a5-2560ce7dd623@linux.ibm.com>
Date: Tue, 4 Feb 2025 11:57:39 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
To: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
 <6322511c-e56a-4f4c-9b13-efec018cb3a7@linux.ibm.com>
 <773fec68e97a408de6871eb3d2c2ac61@linux.ibm.com>
 <c0ace54a-af67-4df5-a284-b96e454869a9@linux.ibm.com>
 <a47286ca0936ea707ed2e80cd276311c@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <a47286ca0936ea707ed2e80cd276311c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w7EI58jMq-uaziGqe73_XtfHnrrhIeFP
X-Proofpoint-GUID: w7EI58jMq-uaziGqe73_XtfHnrrhIeFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=795 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 04/02/25 10:58 am, Avnish Chouhan wrote:
> On 2025-01-31 20:44, Hari Bathini wrote:
>> On 23/01/25 7:54 pm, Avnish Chouhan wrote:
>>> On 2025-01-23 15:26, Hari Bathini wrote:
>>>> On 20/01/25 11:05 pm, Sourabh Jain wrote:
>>>>> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters 
>>>>> for
>>>>> dump capture kernel") introduced the additional parameter feature in
>>>>> fadump for HASH MMU with the understanding that GRUB does not use the
>>>>> memory area between 640MB and 768MB for its operation.
>>>>>
>>>>> However, the patch ("powerpc: increase MIN RMA size for CAS
>>>>> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
>>>>> memory up to 768MB. This makes the fadump reservation for the 
>>>>> additional
>>>>> parameter feature for HASH MMU unreliable.
>>>>>
>>>>> To address this, adjust the memory range for the additional 
>>>>> parameter in
>>>>> fadump for HASH MMU. This will ensure that GRUB does not overwrite the
>>>>> memory reserved for fadump's additional parameter in HASH MMU.
>>>>>
>>>>
>>>>> The new policy for the memory range for the additional parameter in 
>>>>> HASH
>>>>> MMU is that the first memory block must be larger than the MIN_RMA 
>>>>> size,
>>>>> as the bootloader can use memory up to the MIN_RMA size. The range
>>>>> should be between MIN_RMA and the RMA size (ppc64_rma_size), and it 
>>>>> must
>>>>> not overlap with the fadump reserved area.
>>>>
>>>> IIRC, even memory above MIN_RMA is used by the bootloader except for
>>>> 640MB to 768MB (assuming RMA size is >768MB). So, how does this change
>>>> guarantee that the bootloader is not using memory reserved for 
>>>> bootargs?
>>>>
>>>> Avnish, earlier, bootloader was using RUNTIME_MIN_SPACE (128MB) 
>>>> starting
>>>> top-down at 768MB earlier. With MIN_RMA changed to 768MB, is bootloader
>>>> still using the concept of RUNTIME_MIN_SPACE to set aside some memory
>>>> for kernel to use. If yes, where exactly is it allocating this space
>>>> now? Also, rtas instantiates top-down at 768MB. Would that not have
>>>> a conflict with grub allocations without RUNTIME_MIN_SPACE at 768MB?
>>>>
>>>> - Hari
>>>
>>> Hi Hari,
>>
>> Hi Avnish,
>>
>>> The RUNTIME_MIN_SPACE is the space left aside by Grub is within the 
>>> MIN_RMA size. Grub won't use memory beyond the MIN_RMA. With this 
>>> change, we haven't changed the RUNTIME_MIN_SPACE behavior. Grub will 
>>> still keep the 128 MB space in MIN_RMA for loading stock kernel and 
>>> initrd.
>>
>> IIUC, you mean, 640MB to 768MB is not used by Grub even if MIN_RMA
>> is at 768MB? If that is true, this change is not needed, as fadump
>> could still use the memory between 640MB to 768MB, right?
>> Am I missing something here..
> 
> Hari,
> 
> No. As we are changing MIN_RMA to 768 MB, GRUB can use memory till 768 
> MB if required.

Does that mean 'linux_rmo_save' related code in
grub-core/kern/ieee1275/init.c is going to be dead code after this
change. Also, does this imply, there isn't going to be any
RUNTIME_MIN_SPACE support for linux in grub?

- Hari


