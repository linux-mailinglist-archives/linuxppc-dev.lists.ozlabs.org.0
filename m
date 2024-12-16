Return-Path: <linuxppc-dev+bounces-4176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A19F3028
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 13:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBf106qh0z2yvl;
	Mon, 16 Dec 2024 23:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734351060;
	cv=none; b=PTr21sHkLSxRPONlEYo7AC2jukliCelQq2fF5ot3A6WQfDFBoXzNl3Kefyyn/Lf/0sfsKl0wXpZfCNbhjfX+WMXQ4vf9h2gEGItoZg8MJ0OljRXRfnDb9ilh8I3fbMkcGiMMD5IXiSavK2HtZw0QYU/IG1tJuZPldy8/DLEjL3ck62HY7NvtwPUymUrhDOBeWkIYVnC0iewXQiHQVgCSiFJMA8jSWT/cpv1SYq6jynfETFdi8nIZwaN+6TVuacT3+giYOVosBKPWWdb92ABi+9yaYxGjPPHyp/UiIYo4R2qNbz/J0bl7pWr0HKUTljYgMInybse/+fVWXnPcF9R9og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734351060; c=relaxed/relaxed;
	bh=ClZtK3mMvsr7AVybM8tkBamqH7g5AIBNqnhgAu16474=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ta4K0HsDaokWzfEhZp1PAptyUkAy62d3MaLu4xeTadlcUyrMMKUdiqiqGc7MBg4kKFIcEYOrsji4WvEaxTiVEsXHdegw3xbbuhetD807/kAFUsaAEwdqD/40ljM7lpZezPD0EFqhi5ZAS3OERaUe8+DkGSEhzWVhWBTyP9D9ipOTanrPV8MVfx9hiZaDCcKnkaQlR6Dce156+R7e5fUXFH9G4n39VkxhwR8m6Iq4jW/6st+vV8Sp99lBDo2xmIFCtPRSPx4wYXRdbOQcY0yGdB7WRAlZIV0xtmNWhFKV4Rj+CoOP1qOdTZsXN3hTRN4ue8Fhx8ObWhCeiog31FkAOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+oE9KTC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+oE9KTC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBf0z37Jwz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 23:10:59 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG8dsZG007099;
	Mon, 16 Dec 2024 12:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ClZtK3
	mMvsr7AVybM8tkBamqH7g5AIBNqnhgAu16474=; b=h+oE9KTC1AU2a0LEbCiQVz
	8aCiCp2I35XSWgJy8cEIT66bq7VkcnFOreeKiytouWp8DTC/gp2FBNKOeP+fQD/3
	6RnnXFkosGGbwEbLVPayWzbICHiqA8ilf1b8/oQtnSfYIfxlEn2UZusXpfxrv6Bj
	KB7JoyvsMt8+k8oGt7rip1BssN2u6n65Ti+a77Q7vCcwrnIJkEoODKIkKfZ7fRvY
	VdvFew0iR21epRO1NvEImoxF5bHNx2YLBzPef8PpvxfK7Eyyd30otrwkTjiqp04z
	nBBoL5xcLVRuZl2v4oVSqLmhQmaZQ6fo1m4wD4zBdST52G3SaJC5twQp0UTuYUOg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j0k4bv41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:10:47 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGCAlKj019031;
	Mon, 16 Dec 2024 12:10:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j0k4bv40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:10:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGBQ0pD014412;
	Mon, 16 Dec 2024 12:10:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21de4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:10:46 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGCAk9h27787854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 12:10:46 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18C4F5805D;
	Mon, 16 Dec 2024 12:10:46 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E55B58052;
	Mon, 16 Dec 2024 12:10:41 +0000 (GMT)
Received: from [9.43.70.111] (unknown [9.43.70.111])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 12:10:40 +0000 (GMT)
Message-ID: <694d99f3-cef2-4eb4-8248-6a01b5ddf4f7@linux.ibm.com>
Date: Mon, 16 Dec 2024 17:40:38 +0530
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
Subject: Re: [PATCH 1/3] selftest/powerpc/ptrace/core-pkey: Remove duplicate
 macros
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
References: <20241209151418.348085-1-maddy@linux.ibm.com>
 <87pllr52g3.fsf@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87pllr52g3.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vj_INFJjcZ0oYEQFLcfoJDMpJqOdyJqO
X-Proofpoint-ORIG-GUID: MF0g3TMi7soBnOS_x2ZsX2W0uHbP_c7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=950
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/16/24 4:17 PM, Ritesh Harjani (IBM) wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> 
>> core-pkey.c test has couple of macros defined which
>> are part of "pkeys.h" header file. Remove those
>> duplicates and include "pkeys.h"
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>  .../selftests/powerpc/ptrace/core-pkey.c      | 19 +------------------
>>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> .../powerpc/ptrace/Makefile includes flags.mk. In
> .../powerpc/flags.mk we anyways add -I$(selfdir)/powerpc/include in
> CFLAGS - so it will pick up the header files defined in powerpc/include.
> 
> It make sense to clean this up and consolidate the common header definitions
> into pkeys.h header file. The changes looks good to me. Please feel free
> to add - 
> 
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks

> 
> -ritesh


