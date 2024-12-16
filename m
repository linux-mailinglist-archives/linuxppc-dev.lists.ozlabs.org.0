Return-Path: <linuxppc-dev+bounces-4175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E39F3024
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 13:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBf0B6Mv3z2ytp;
	Mon, 16 Dec 2024 23:10:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734351018;
	cv=none; b=L8Iz3hPw1BIKcjLClNzJC62ec5qjH1CoaU0rO6tPsn2iBPslTTjnT7FIqbvQSBWhZCJi+5DbFjKioRMUjYFs+VL4iGDCfyOdHbIKUzrDp9l8JwUB9vf/exxzNnMvPy8xOM2Ekh04OqaYMR9oTWOrhDgcAM4MMKtPkYPW5/KSOMx7DgM7uo5RdMZQbaumATwhCIJJNahQ671FyxdQuutZGYltSYYSSqHRyV+nNEj17pXDtJdT6AE0Ur6jKo/UjcqcNQCzhgHBFB9pAk+Wko7Kp/IQKj8P63YDpGLahIGOa6kFM8Is2bxMgDDIrBCAVCLRPYZ9stHlOs3SJSjiDyo+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734351018; c=relaxed/relaxed;
	bh=Wuz4gsKVaW4DjMAwLiESzy6Gs2u+27zCq+IljvVahwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfVZ4tFDcmi4ChlObaA8iHlCQ5g95UBXoOAlyKbVjLVahZ6eDzWeGZHb0GHt2LeRLgIm6bBruqZM3VrK9D6h93H56hefyBWKkwDDOuV6EN7PXU7TN0tUEz62xs3iqpFRvuwh5Gx1Q/taVSxfmd2yeX4WYJD+lwys8TZmLssro2EIVAd/qXZd5QWZEX1bgRAAkV9ud09B2DNRvSPzXEB5q1ei86QKuZpq1fKwc9nNf4I5BMzsM9I3IR0dt2C1xAKCpnQN6MetdwgrOTm+D0CiunXMAphJsrsmblJxmQs1b81pbgLJ4VfQakB+1xZPngSeCvRbS5Qfe2DJF4kZq1jvHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTuOrGKX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTuOrGKX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBf094qtMz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 23:10:17 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG85hw2027071;
	Mon, 16 Dec 2024 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Wuz4gs
	KVaW4DjMAwLiESzy6Gs2u+27zCq+IljvVahwM=; b=hTuOrGKXqsvYnUAx7PhGZa
	sR++lIF8lx1bIIqTOO8U67dWMALzhitm3U4nxBYpSRcEQz1Ssjo8GtyjH0MrUnbO
	Nxwj/HRYISMaV7XxOa256v1tmCt3AFkrd8tSUc6JR5yflKRqEp0RIll/oOnTiM3w
	9VoCuFj4oDh91OcsK+AMHjtE9V+DI+FiCqZqdaHy5wNepzxzjY6NdXd/vRkM6Wld
	5Y5Wk3oZGh1MmHpUz2ZXgvnEo0t7jOwLTxfBc2z9+QPoA4DwpcaEpo/k1vN9KYE4
	Uxg+lgg0JZ3xj/vmGVoc0O8w1oQhOHspl8T17mjmtXwXsglU1ZhWgXZ1769W+5Tg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd292nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:10:05 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGC8lDZ014414;
	Mon, 16 Dec 2024 12:10:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd292nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:10:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAMUCl011256;
	Mon, 16 Dec 2024 12:10:04 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjjwjex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:10:04 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGCA3HK2163444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 12:10:03 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A7FA5805D;
	Mon, 16 Dec 2024 12:10:03 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5412758052;
	Mon, 16 Dec 2024 12:09:58 +0000 (GMT)
Received: from [9.43.70.111] (unknown [9.43.70.111])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 12:09:57 +0000 (GMT)
Message-ID: <a47e9b87-c461-4e8f-8503-944e5324d6a7@linux.ibm.com>
Date: Mon, 16 Dec 2024 17:39:55 +0530
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
Subject: Re: [PATCH 2/3] selftest/powerpc/ptrace/ptrace-pkey: Remove duplicate
 macros
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
References: <20241209151418.348085-1-maddy@linux.ibm.com>
 <20241209151418.348085-2-maddy@linux.ibm.com> <87msgv524l.fsf@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87msgv524l.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uxUcUh5mBRklgrIaJNXlElt6Xe7wzHJN
X-Proofpoint-GUID: wp9P2SLpaF_k94JAp7siJABrMF5bUWwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=697 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/16/24 4:24 PM, Ritesh Harjani (IBM) wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> 
>> ptrace-pkey.c test has macros defined which
>> are part of "pkeys.h" header file. Remove those
>> duplicates and include "pkeys.h"
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>  .../testing/selftests/powerpc/ptrace/ptrace-pkey.c | 14 +-------------
>>  1 file changed, 1 insertion(+), 13 deletions(-)
>>
> 
> Similar to previous patch. Cleanup looks good to me. 
> 
> Please feel free to add - 
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> 
> 

Thanks

> -ritesh


