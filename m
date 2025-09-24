Return-Path: <linuxppc-dev+bounces-12551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F1B98173
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 04:46:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWh7D0CSdz302l;
	Wed, 24 Sep 2025 12:46:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758681975;
	cv=none; b=JWZiwltvdXLblFquQYYUCYx1W3qLuThEtIxTR9PTtDW6pT2J3MenSIeaTuPnpzclfLxrvDE6v5vv2jbLkX14sktG6q1yi3i5RJpJdiE6yy5tvWw71yQ35BQI6QW0jyLlSqr1YZik4d2vmn5pVncIChQb0u3Sk/1ABnA9gglH8uSU/BozKPns4OvUCKSb9uZ9QdrGTjOoKRG2Ewt0iW/3ggdTaWSf7mIp7aNp1kuocBOmIYNq8+0YArtStGLptdcSdDFMWULBt4gcqI4iNLEDi/78x0O8mAxOVyqpm45HD32q91T4qA6zP7eEYoXMOzGf4W1tWtfPVHFaBwUIYzbOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758681975; c=relaxed/relaxed;
	bh=wW4iMfNGUAtcsBJNjERvZw0DRaJ64LMuW5E/Lr/ZxoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NAIpczvottcTRIuQ/uAUSqT5z8J7dOU5nzql4aWIqyeRUVmBm+Z5O6SwMhsmBfsnFoQ3f6acSXaLxBEld01m+1MpyG26oUmOr1jFlaeKc5CjFJs1L6Q8OjsbZa1e1V7QNzfVjA0YC1vI51BIYNWeEtWbEx9LAEZbIkwHNzbtDx+Ek9WjKgpDswhma0AZrIddT9pNyribrUi+xgYdpoZSZSrAA1rM+1ZK3tNl70uqBOaHkMp6X3og+j/kGJFdcmB2AqOJVSR56LmwtXitdcMDv/sxobIX7T/QuW8RIOVVsqjPWwZMZhY6m3ZLA8kQS/Cfh3hEsfq3RRNt/0RPQANEWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ttNauNlh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ttNauNlh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWh774bQ3z2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 12:46:10 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NJfVmh023754;
	Wed, 24 Sep 2025 02:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wW4iMf
	NGUAtcsBJNjERvZw0DRaJ64LMuW5E/Lr/ZxoQ=; b=ttNauNlhDa8AIIe73vvKms
	1vrwVneolh7oEQBi+eT2i8DDvmoSd8auyCC4p5C5YZVIZkPUGPsm5Hv8F7huXkrT
	HkMBrt4riyyVU+h6h7ftEPhkKvhE4BpG5lwxSmc0G3peaNAzONSBQIRemlefyGrK
	hmniPTwRQlAxuq45tOnlv0pIvRchJdOYghKgz/F8//L9LWHKRBo/O/SogPahm8HN
	pxPimHWTjJ3Bs3e6QLv48zclPrcE6K4Ak2hpUEDJsPeYoD9Y4ZqanQvtDxGwutJP
	AyxNz8yyEICgj2yypaHesCn8elCkYhuRZxivSA8NOGyrhu1Agv4WOH2mrk7yspNQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499n0jmshs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 02:45:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58O2crBD022142;
	Wed, 24 Sep 2025 02:45:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499n0jmshr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 02:45:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58NNtYcR018899;
	Wed, 24 Sep 2025 02:45:40 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49a7kmpjtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 02:45:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58O2jdhY29753878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 02:45:39 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C43BA58043;
	Wed, 24 Sep 2025 02:45:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5389458055;
	Wed, 24 Sep 2025 02:45:37 +0000 (GMT)
Received: from [9.98.111.108] (unknown [9.98.111.108])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Sep 2025 02:45:36 +0000 (GMT)
Message-ID: <9b2b4b04-83b4-45d7-b5b4-d92b48412ad9@linux.ibm.com>
Date: Wed, 24 Sep 2025 08:15:34 +0530
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
Subject: Re: [PATCH] genirq/msi: Remove msi_post_free()
To: Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
References: <20250916061007.964005-1-namcao@linutronix.de>
 <87wm5p4v6y.fsf@yellow.woof>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87wm5p4v6y.fsf@yellow.woof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX8QCFkUpzqusB
 VydzXN5qPkFGMgQ3c0+s/v22F3U0Achd882pGPWVARTGzzLZv/1g+32eoOja33+psQPhR4Vo8rg
 pwTUIAhV6NPqUJ5Ast3k1UtAKOZ7jvENY/7iCDIsoND0tjZN0+DhClPb0UNf3yJ11W5EdMoSUVX
 m0+PXcwpX0OcVvumNxi4pAHVtlWOQSeKjJd4okzgntHv88+g/syKFESPwHaf9G0dw3r93BzIHps
 CFbu4MQ/B89kNJO8hDf4r9qK06H1DNxcCdKFpqd+o4t1MmzxOk3v/NvQgNdCz64qSAnwXqoDObC
 rSCX74wxN0ZkRSx2xDpUnY1z4rT1I3WOq95eyJPC5mwJw/Bw2Z6npg4tEf6wm9I8ERBiC+Om/9p
 4N0jZBkH
X-Authority-Analysis: v=2.4 cv=TOlFS0la c=1 sm=1 tr=0 ts=68d35b56 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pTsG5kN8B-ToCCdYJSEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pyolL5hsP5bhUyEtnVBU6B6VTKPoDr1g
X-Proofpoint-GUID: V-pmpMIRjwDl995nvG9TXniufYl4AvFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/23/25 10:33 AM, Nam Cao wrote:
> Nam Cao <namcao@linutronix.de> writes:
>> The only user of msi_post_free() - powerpc/pseries - has been changed to
>> use msi_teardown().
>>
>> Remove this unused callback.
>>
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> ---
>> This patch depends on the powerpc/series conversion patch, which is
>> currently in powerpc tree:
>> https://lore.kernel.org/lkml/c7a6d8f27fd217021dea4daad777e81a525ae460.1754903590.git.namcao@linutronix.de/
>>
>> I think it is most convenient to apply this patch to powerpc tree, if
>> everyone is okay with that?
> 
> Maddy, do you mind picking this up?
> 

Yes, will do

Thanks

> Nam


