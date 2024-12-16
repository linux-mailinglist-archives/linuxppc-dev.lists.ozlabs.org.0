Return-Path: <linuxppc-dev+bounces-4133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE09F2888
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 03:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBPPh4LvZz2xWT;
	Mon, 16 Dec 2024 13:43:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734316984;
	cv=none; b=VSBu5s3nivj/ZNdbLrlaAEY7NQuh9gN31x4SKHw+FBy2/Izk3mnkiq0dG6LZOpJcGZllGQ/2bLuYqk89DF0mWbcTyns7z/tzqmESI16DwH0P6/9RT4K4wLxQeifqgT677jPcqdxuf/NtMReVdiCuJ+iyPCNBUsTkg1ZGXgVMhUNZVM5dfxreTGky8+0N0WrktxsRH11yMYgE8Opf2ji/UZBfOEWkidEcwLDs5LLdy6L0m1Rj8gOL7VtI/D8AcKDI/Joc0tAtND+LMnQ8XrGHMY7nSqRBImoeQPax5dIUt2mGYgl5Q1Lveg2KvLtFHKstCX9wznGmkQf3bCxXG10Lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734316984; c=relaxed/relaxed;
	bh=DJWD5IHTprnQJpizlbbYq4Y/m24+PEuLlbPIF09EXVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyOmhtXV2k8upZcEqTfP8MqIl6EQptsNec1jNELhtV2hjBYJ2Xix3nKhPAsaEiDkSYSeR+xEy45EEcjl/lXyOQslvh+/2kxIgS8kyu13m2dsPgNCg/iWIh//KlI0FSH1VLVbj0oSoeF/NaX5y2jTV/bDXsHYM5Q39WRbNpbyjarsBhQIxjgNqtbe+pwer9jeR7WgmSLJSR/9afEwuzBRu9xBxQa36oy8+qsj1w2PmkcRovPUk4cW4Bps2AxasPS0DRu62/5MQfpmaboWzf4xMfgfQFH1HrjCq8HNmsoAfpqOlg/peKJPMz51EqV2vrjXoCsnrcAPPVEl9WyaX9r3jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IOPb3Evw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IOPb3Evw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBPPg14psz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 13:43:01 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BFLkmFc007226;
	Mon, 16 Dec 2024 02:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DJWD5I
	HTprnQJpizlbbYq4Y/m24+PEuLlbPIF09EXVM=; b=IOPb3EvwmZ4Dg6Yzfh75ho
	Tzav8GSJ5iGcc6e/ixi8SD7vroTtOlxem4v861Bfh/eo4WqbQlPODS1XOCgJvkwT
	/DiypU8K/WaXzaPTCDM5SpIJDIYI3esYIKrZs6pt50+5AZnmRYuilTnG7G5tfQ9F
	P3Nki1YqPknyKJGVI9QCY2Wo+zcUlmmx1zswXBwyCmrvu9VpOxQZ5JVJcA66S72J
	GsLT/0PzI6bMONHpzXkEokiccErYsTGR8vXIB79iAzwWqdlsB/8Rol5HukUqobpR
	59LbakUVigy/y5Hb8Fc2AAZrF1ZzV893d3Snjh3GTL4vECJTndNFmRaYjuGBsYLw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j0k49p8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:42:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BG2gdsX025538;
	Mon, 16 Dec 2024 02:42:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j0k49p8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:42:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BFNg83j005694;
	Mon, 16 Dec 2024 02:42:38 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnbmv1et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:42:38 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BG2gcFN45810240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 02:42:38 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 387CF58056;
	Mon, 16 Dec 2024 02:42:38 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F93E58052;
	Mon, 16 Dec 2024 02:42:34 +0000 (GMT)
Received: from [9.43.66.47] (unknown [9.43.66.47])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 02:42:33 +0000 (GMT)
Message-ID: <629f23f0-5b2a-4d6f-a047-41bf2fc9daf4@linux.ibm.com>
Date: Mon, 16 Dec 2024 08:12:29 +0530
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
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <514964ea-0795-41d6-91d3-f3d4f193fc6d@csgroup.eu>
 <Z1sOTf6UZbruptnl@smile.fi.intel.com>
 <991aee8b-fb10-4152-89fb-6ac542ee87c1@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <991aee8b-fb10-4152-89fb-6ac542ee87c1@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yoBKrrLQGOVttaVwZ1mnMNXBnWCRwgZu
X-Proofpoint-ORIG-GUID: r-YDKyCtZxYSWOhqNWg273Mubikm9I24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=768
 clxscore=1011 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160019
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/13/24 11:58 AM, Christophe Leroy wrote:
> 
> 
> Le 12/12/2024 à 17:24, Andy Shevchenko a écrit :
>> On Mon, Nov 18, 2024 at 03:10:09PM +0100, Christophe Leroy wrote:
>>> Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
>>>> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
>>>> file provides an OF API that's deprecated. There is no agnostic
>>>> alternatives to it and we have to open code the logic which was
>>>> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
>>>> drivers are using their own labeling schemas and resource retrieval
>>>> that only a few may gain of the code deduplication, so whenever
>>>> alternative is appear we can move drivers again to use that one.
>>>>
>>>> As a side effect this change fixes a potential memory leak on
>>>> an error path, if of_mm_gpiochip_add_data() fails.
>>>>
>>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>
>>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>> Thanks, what's next?
>>

Yes, will take this via powerpc tree

Maddy

> 
> Next step is that Michael or Madhavan apply it I guess ?
> 
> Christophe




