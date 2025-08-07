Return-Path: <linuxppc-dev+bounces-10707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C690B1D52A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 11:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byMl431sQz2xck;
	Thu,  7 Aug 2025 19:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754560032;
	cv=none; b=jBNxEaWCWQ7+HKVu9sT/JrlLWAzKadYmWgzpb3qdjbK5C9Mju7A/paT8P/epaPMCAtWpd59w+PgA14xQUM3hkNlaLRKc2og30AebeQw/u42G53iIEyBOcEvXl5yfb66aFfKKc/7utpuoLpIWkzl1HPAC6Xd9sBe7fbOP6y/p7Dy6xx2wD2mG7YTx2ghpqvYP6higkf+KFdyd+rndhxMxbldNoWSgY8/rEkjk2BzN0ePJObw+UJK0B53tgU3mD2+cmX6oG8bNL62O9gT+mTBQXjip29SDAvT/vSQNY0HXgLmuEeMZLkP27+32XoYOcdBoQ0lKeSmiuheM6/ULAGfbag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754560032; c=relaxed/relaxed;
	bh=ImRZUe6tVuS8TT869/9J1UoTQ8hVJxjnFHqcKjWzkmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mu72u8uOIiTAz8ITladIy4XGz7HHRIyA1nvxMLMssFjbpALu0s5TMfZ9/aYZ19ZJaLThwe6nM04mtWTYkeLMkmIsch5Z7IkAOaur3S+Z3VqNDoMpA8D/F0ShSygOwZmu0/wO6WDBtb5RckpWfzXTkPgAvQ+IS5JAPU49GDh5p14mS/lSIB1o6FfXiEIP0lcCVDr8U18DWZFLkN9XFt4mhIVo4Qcy9SQKt3LXiOtf/DfAnqHeALfQc7d0VDkQjFSkgoGvEylIYP/Mgk5vEiQaOy2BdSLy0s/k+H/B4T5D19GfXMUAoq07V08OxzpSzhVyx2zTc+0D2nh4fftt7DZa3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=go9qRIE7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=go9qRIE7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byMl26qMZz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 19:47:10 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57790AX3021567;
	Thu, 7 Aug 2025 09:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ImRZUe
	6tVuS8TT869/9J1UoTQ8hVJxjnFHqcKjWzkmg=; b=go9qRIE70CfPyS9Kn8TPsq
	JkZyaxDOMfgvgd9oOkezsaYQ7nO6H1+vyJlxnFf+6IS8gazLQFoHJPSCtC/ozPKm
	6VKICh++4mFIXlvEA+Fv861i489NybwU9awUyTQXXGMIfzvBpYV01KVsDF9Iz4YI
	Ww/eXWrOH1iZah1GKzst8ykQD8OdLbBS52aH5gpTLX9hzYzJnzq1Wj6ghnhGN7K+
	HeSCbGXR0u5BWfqTnzNxp7wSohfiND9Ay/p0FkDgE9Qit35GSbcVN7CqdFOj9pan
	uk5bsEsgRkx16zjIPUzdIH9a6QpTBUGyN7bRfWvIADnQUc0lqNAVn74p649+uPzA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq621brx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 09:46:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779eRBP008042;
	Thu, 7 Aug 2025 09:46:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwmyygs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 09:46:52 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5779kpb241746786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 09:46:51 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 450E158055;
	Thu,  7 Aug 2025 09:46:51 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F5705804E;
	Thu,  7 Aug 2025 09:46:39 +0000 (GMT)
Received: from [9.197.227.8] (unknown [9.197.227.8])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Aug 2025 09:46:38 +0000 (GMT)
Message-ID: <7f4f4d07-38f7-444c-adff-ec2a2387e86b@linux.ibm.com>
Date: Thu, 7 Aug 2025 15:16:35 +0530
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
Subject: Re: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family
 implementations
To: Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-5-kees@kernel.org>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250804164417.1612371-5-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA3MyBTYWx0ZWRfX0unUnmBlk9BR
 JyFnhjGUCcX72+ZTvzudrWhw0DB4YVlTamytH3O0p7bgfe1t3RFHu6oXmijVRlkSINNESQcI2ed
 WV3l/gYRQ2VZynkYP3Tav0+7jWhZaLSgpYND2noyaRsJ968IyHQXslrcztFRDh0MZBgxPGbCx8b
 +uiLKSt+6Y6IffZklEx4VluWHkjrCmfWHrp45aQanh3SGagw7gHzrJqpepYvNT4HS8EbCADH/Wn
 zPt3JFi7B14TKcENIp/5NLm0esF1T5EYGCGzXF9hdI2cf8y7VhMMiJqeZefBkl9p6Z1CLp13muG
 PGN5oX3iZrejuEHJm8J9sJaxrIF5Rg9tb8/6Jc0aiE3VKei/f3z6YRAKdY8HGg4pDBW4p1GLl1f
 BVmzVXfbgFB6avmCIX9UByEecqNiyQFlc4BOgzcQYghhJIGa/JLCPKcNMH7ACy88lL+pl3p9
X-Proofpoint-GUID: _d76WmYcTWXQ7iz_O6QVqZlqoAE5ZdTK
X-Authority-Analysis: v=2.4 cv=BIuzrEQG c=1 sm=1 tr=0 ts=6894760d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=ob59Q8BqYF9JHPHMJZcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _d76WmYcTWXQ7iz_O6QVqZlqoAE5ZdTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070073
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/4/25 10:14 PM, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to PowerPC's implementations of
> fls() function. These are pure mathematical functions that always return
> the same result for the same input with no side effects, making them eligible
> for compiler optimization.
> 
> Build tested ARCH=powerpc defconfig with GCC powerpc-linux-gnu 14.2.0.
> 

Also tested with gcc 8.1.

Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>


> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  arch/powerpc/include/asm/bitops.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
> index 671ecc6711e3..0d0470cd5ac3 100644
> --- a/arch/powerpc/include/asm/bitops.h
> +++ b/arch/powerpc/include/asm/bitops.h
> @@ -276,7 +276,7 @@ static inline void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
>   * fls: find last (most-significant) bit set.
>   * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
>   */
> -static __always_inline int fls(unsigned int x)
> +static __always_inline __attribute_const__ int fls(unsigned int x)
>  {
>  	int lz;
>  
> @@ -294,7 +294,7 @@ static __always_inline int fls(unsigned int x)
>   * 32-bit fls calls.
>   */
>  #ifdef CONFIG_PPC64
> -static __always_inline int fls64(__u64 x)
> +static __always_inline __attribute_const__ int fls64(__u64 x)
>  {
>  	int lz;
>  


