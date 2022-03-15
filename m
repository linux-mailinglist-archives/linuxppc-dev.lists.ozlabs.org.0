Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB904DA0FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 18:18:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0Tz0cP8z30KL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:17:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q/SP7h0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q/SP7h0x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ0TG28K7z2x9R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 04:17:22 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FGEdvf014433
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NWHVZ1J39HrOTRvZeYGv0Mmr1Pr3n1VA3de0l9YyZpQ=;
 b=Q/SP7h0xfqyV3Y4pHZ4nfMTIdXI9rbeuRrB0c4T+1V5ajLaciA7zl92FXgUVin+d9gd2
 ir3h+Wj9wZBAekQ4D1Cmj6FQ8jJ+O9zyaGH4Sm7TQgsQw0//nbeGc9M+gnaUrStS9G23
 R83IdXEAXNrqLOyDfsMxqk7EaIdQBLhsEVDuJrx9v1rZN/N9c/PfRjniEQo2Vo9nqysd
 nXPeGJESeoh5NiR9tA/pvuawds1KsM2+ofExuqhdgF+9IVvCI0ct1CVw12e8DBUxwquM
 Sx6NoREcmGjemO7VfcBKwjfhIfoTfMi6lIwZD2yUBU0+WgIF1gjQc4laPvHWEKt351hP yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etx2kssju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:17:18 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22FGHf9n033343
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:17:18 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etx2kssj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:17:18 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22FHD8DF023563;
 Tue, 15 Mar 2022 17:17:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3erk58p313-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:17:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22FHHDl952166914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 17:17:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFA64AE053;
 Tue, 15 Mar 2022 17:17:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC502AE04D;
 Tue, 15 Mar 2022 17:17:13 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Mar 2022 17:17:13 +0000 (GMT)
Message-ID: <cc9e5add-a87b-edea-c259-0525e18ce06c@linux.ibm.com>
Date: Tue, 15 Mar 2022 18:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 12/14] powerpc/rtas: Close theoretical memory leak
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-13-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-13-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4HJghT0hM56OnPlHWuJKUXYV4Y-oFpNb
X-Proofpoint-GUID: 5swF1XJIeJM5pYPexvxqLsXlznrES-NZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150104
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/03/2022, 14:50:45, Nicholas Piggin wrote:
> If buff_copy allocation failed then there was an error and the errbuf
> allocation succeeded, it will not be logged or freed.

Good catch!

Since you're dealing with the error log buffer allocation/free, I think it
would be better to not make this allocation in __fetch_rtas_last_error()
and to rely on the caller to allocate it before taking the rtas lock.

This way, the allocation is done without holding the rtas lock, as done in
rtas().

This would simplify __fetch_rtas_last_error() and the caller logic to free
the buffer too.

Laurent.

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/rtas.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index e047793cbb80..1fc22138e3ab 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1239,9 +1239,10 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  
>  	unlock_rtas(flags);
>  
> -	if (buff_copy) {
> -		if (errbuf)
> -			log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);
> +	if (errbuf) {
> +		log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);
> +		kfree(errbuf);
> +	} else if (buff_copy) {
>  		kfree(buff_copy);
>  	}
>  

