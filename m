Return-Path: <linuxppc-dev+bounces-8552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA3AB6142
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 05:35:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxzWh3HTwz2xS0;
	Wed, 14 May 2025 13:35:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747193744;
	cv=none; b=Ca+1rIMg4RqhnAZ6JkxzMybLCRLRPli7YIf8wOgNvJyoggO8EIkVKAYuSn4wpyB9CGtILcuVJgqeoJSuk7EwlZ9PIFasBrGvqEnXoinysxp/oUE6kTblYlc8542O5au+Nex2d+5hRIhvGb6fqaUvP0tR2igvpJp63QN5f17gLbYisNimk4s73oI/JH8mD+NWsUHM25+Emdv/ITJC2wr94OTJI25DsPJvSMVJbxxIaR1eeBfXvHCb2gLVn2GHCbcHmqeCF9sNbcmYAzdDUrIRC7RJI7sWGNBrmWI0nzvNOGfjSLdtvqMoTnkYCU7r22jyp0i9FmgSLCerSCcekOT25w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747193744; c=relaxed/relaxed;
	bh=SPkwKxRZ0jZWUYWozH5i6AyzMDzsb6UiTpEj0ygaXeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNHv6bijKMCMU1J/kqZQRHtDfCqno/gk6Hlk4dxOJRQsXLXIFquigB3+YOE1KVxKMjx5KTgGW3IaOLh64hjE8jjp2u4bAZ62t0j5mpDdQ4fJ5ctqzWIzrcZWnbPHLego7XdyuSwjIhR0AOBe/0oFGHVPmyr2VOArUbHODbsX7Y1wRyhJS/4OWlkdeOMaS8xtugt1FwpFWu02/lEgDY+B0t83FlMlbMfuiHWpwWkmcSgdRRDHvWQk3l/OKfyEe1fK+p4GIw/dcsJKBsXZgCuUooDvAK+jLCOLefBsQRj6p80b39H849SHJljv998mOzKX2iAtgNgZ7+Hscf+rVR1IVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DvuikcOq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DvuikcOq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxzWg10t7z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 13:35:42 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIsg8S025407;
	Wed, 14 May 2025 03:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SPkwKx
	RZ0jZWUYWozH5i6AyzMDzsb6UiTpEj0ygaXeo=; b=DvuikcOqqeRT+RbKoj6GHC
	wm1rcotG8nxLoJEvZM2GbxUsORFE3saF5cADFMsZWLa04qoeCBSCc9VaH9FINvTv
	7XUzZHsLLH7IhF48fGmefEdWQjUcZytb5qcUC0ydHwoYaI/meg5MGjtfQOklY9h2
	yGuPOFTrBJiqlcPz91OojDd6iPUXTbWD1LMlk3+KEAOID90YrddIy/87Z8RoLsYi
	7dDBdnywbCD/lgvhk3j/DsXawy4uyrWbOURZv6PUTYMGtwYllKSGRmyFTBJtoBll
	Sk1ZywSqoTSmVZz5uHlO6EaF5hJ7QXcj6/QOPvkZTy11Xm3j4JRn6ewfyd7VcJJg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbs6hu27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 03:35:14 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E3ZDRh009700;
	Wed, 14 May 2025 03:35:13 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbs6hu25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 03:35:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E24oM7026656;
	Wed, 14 May 2025 03:35:13 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpa2fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 03:35:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E3ZCPX23920982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 03:35:12 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3281158059;
	Wed, 14 May 2025 03:35:12 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84D0A58055;
	Wed, 14 May 2025 03:35:09 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 03:35:09 +0000 (GMT)
Message-ID: <876dd739-d708-40f1-82ad-45090a26664e@linux.ibm.com>
Date: Wed, 14 May 2025 09:05:08 +0530
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
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
 <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
 <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
 <922be2ed-aed2-4c55-b7b0-37abfc745500@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <922be2ed-aed2-4c55-b7b0-37abfc745500@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyNSBTYWx0ZWRfX2Gd79AK1XC2v 0ROZDxXV0Kh6npqxTTzr/70KAEfsohpa7XqQ/Y9Q7MVDLaNxPxO3u5GnPOOctxOvncZ+oKvfco/ BhaVkTN0wVCOl7FHai/C6jmcYRqRpzE409BQRbEvB4p+mPpy/JLbskjx3Sn/ffx9SlhMG/p9REA
 QRMiIsS0zEDgLSSAgi42ZHe9KGaNQTt6+X3lWZWD6EMLDLk0PIhU/AH6Ttsox7szE+FayRcY6Na 6+u9DpeJgFP7ahHfetlyvxgFpKSvPnBOSeTMIav/I+EK4N/ls6i2k9q5bScaL9v0EiqL6RV3Xdm nAnOc5Nl3I131xKwN90wUwqTIW+f9d3gri3mFo/rqjAMtVtJpnsV8194m/5N66En4UN7ijZAAfk
 MzwLMbD6vtlZ8xs5B7sdrq+W0mBwIEwJhPvxy3gBwaP1nZCVfbYuYni/R9FVs6gxIVBn57T6
X-Proofpoint-ORIG-GUID: RygOFpSGw5FOOlyWFCprbu40DsIUmHJz
X-Authority-Analysis: v=2.4 cv=d5f1yQjE c=1 sm=1 tr=0 ts=68240f72 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=NEAV23lmAAAA:8 a=voM4FWlXAAAA:8 a=1UX6Do5GAAAA:8
 a=gmKdWFfqcPwGhx-9FWsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-GUID: HvOB_mhN5i6zhAb8yKPuvkeo6NcrL5n_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=872 impostorscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/13/25 11:18 PM, Christophe Leroy wrote:
> 
> 
> Le 13/05/2025 à 16:10, Thorsten Blum a écrit :
>> On 7. Jan 2025, at 13:16, Thorsten Blum wrote:
>>> On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
>>>> Isn't our file just a copy of the one from binutils ? Shouldn't we adjust it based on commit https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fbminor%2Fbinutils-gdb%2Fcommit%2F2ce18a16268a&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cab93fab4ad1e43fbaaee08dd9227edf0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638827422381661999%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pYe0b3WZhhmX3IHNh58Ogf%2BFMLYsdA7zn93%2B74D%2F%2FsA%3D&reserved=0 ?
>>>
>>> It looks like it's a copy and the name is spelled the same as in my patch:
>>>
>>>   "Mimi Phuong-Thao Vo"
>>>
>>> What's missing to get this merged?
>>
>> Does it make sense to resubmit this or do we leave the name and the
>> FIXME as is?
> 
> Thanks for the ping, your patch is not lost, it is still here: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20241110162139.5179-2-thorsten.blum@linux.dev/
> 
> Maddy, what do you think about the way forward ?

Was waiting for someone to chime to confirm. But I guess will pull it in .

Thanks.


> 
> Thanks
> Christophe
> 


