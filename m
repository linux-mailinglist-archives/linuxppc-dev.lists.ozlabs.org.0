Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CEF53251F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 10:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6nBm0lwKz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 18:18:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rX/X6cHA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rX/X6cHA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6nB16mB9z2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 18:17:29 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24O7OBup011291;
 Tue, 24 May 2022 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LhRVKKB0DusQKiHLqperXZcxbEcQnxElZXIcFrsIBvM=;
 b=rX/X6cHAs46I7VxQcdX2PSe0W4fpZpGmDJVrTVZV/YbN4BDVLVTX9VP3JYqI+X4bng6x
 f2o7S78xA4zQjC/sy3ExlwfdMZBPD7DEipAxP8YeIGSu+DK2E6SnvLNVV4sqf24ndFI4
 1KxdI1p2uMFRb+hFMjPUWBU62Q72J9sQDzJyqnfjIxXuyUkK2iPE12yG8LNX0GrLLFn9
 nIgv2Tz5H6ANfWIKg2SsT3DB9vSWimlgB2YpUMYsaC6LCp+2fRuXAvjjOTuH54JzEAxc
 4n36PFGX/2d5ZrGEcUiNBPzDHTIOrwbOW2ZJ2/DqZIxd3WDDH0rfXxBeoXitXJ9iZBER qg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8r4g4du8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 08:17:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24O7wtSw025309;
 Tue, 24 May 2022 08:17:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3g6qq8ubd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 08:17:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24O8GQD522741464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 08:16:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD518A405C;
 Tue, 24 May 2022 08:17:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68B0EA4054;
 Tue, 24 May 2022 08:17:14 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 08:17:14 +0000 (GMT)
Message-ID: <3ed0804d-dbcd-f83b-f806-cb979a6a9dfa@linux.ibm.com>
Date: Tue, 24 May 2022 10:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/64s: Only set HAVE_ARCH_UNMAPPED_AREA when
 CONFIG_PPC_64S_HASH_MMU is set
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <e438c6cc09f94085e56733ed2d6e84333c35292a.1653370913.git.christophe.leroy@csgroup.eu>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <e438c6cc09f94085e56733ed2d6e84333c35292a.1653370913.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lBdtqxVQfAZSxcdk_J8UISZlh7-BsUMJ
X-Proofpoint-ORIG-GUID: lBdtqxVQfAZSxcdk_J8UISZlh7-BsUMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_05,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240044
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/05/2022, 07:42:05, Christophe Leroy wrote:
> When CONFIG_PPC_64S_HASH_MMU is not set, slice.c is not built and
> arch_get_unmapped_area() and arch_get_unmapped_area_topdown() are
> not provided because RADIX uses the generic ones.
> 
> Therefore, neither set HAVE_ARCH_UNMAPPED_AREA nor
> HAVE_ARCH_UNMAPPED_AREA_TOPDOWN.
> 
> Reported-by: Laurent Dufour <ldufour@linux.ibm.com>
> Fixes: ab57bd7570d4 ("powerpc/mm: Move get_unmapped_area functions to slice.c")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 

FWIW,
Tested-by: Laurent Dufour <ldufour@linux.ibm.com>

---
>  arch/powerpc/include/asm/book3s/64/slice.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
> index b8eb4ad271b9..5fbe18544cbd 100644
> --- a/arch/powerpc/include/asm/book3s/64/slice.h
> +++ b/arch/powerpc/include/asm/book3s/64/slice.h
> @@ -4,11 +4,13 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#ifdef CONFIG_PPC_64S_HASH_MMU
>  #ifdef CONFIG_HUGETLB_PAGE
>  #define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>  #endif
>  #define HAVE_ARCH_UNMAPPED_AREA
>  #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
> +#endif
>  
>  #define SLICE_LOW_SHIFT		28
>  #define SLICE_LOW_TOP		(0x100000000ul)

