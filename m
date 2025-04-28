Return-Path: <linuxppc-dev+bounces-8131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC2A9F709
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmVRL0T17z30T8;
	Tue, 29 Apr 2025 03:14:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745860445;
	cv=none; b=cVkyZURAzjAw5teDD43NuF4Xy1y26Eht4Fb+Q2RO9YjlGElMcoXON3vm5I7NRsp/bGu2ROnBLnsfq631AX9TmwUZgfTAcdZhRM7XW7clws5rCLQ3+sbnd6uzFg/rqXba5OI89yw2+JNj/dIe9klQw+8r0UfjpcO5neyVtQEBvpBiDOgDiBNeglrfVGrmq0jvoYXRCZWxM0pT7L7QyQxu7yKBL0AR+HZZVqHW4S1f/tEZuYhpDz5n+/w4pJP4pRcQVoQ9HmHsnuTpb5a8LEnFbv60PgkkduPmYmWw08miDhh1/QO08rg7rjBMbnwnluicRxV/ZLWQWHiJsUBN3bDXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745860445; c=relaxed/relaxed;
	bh=KomaKdZjhofElzsKOtg4I+kL2PS3yimbP7HbLJSlulQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQl81Uix4UzryaD7gEAlXhdOoxDHn7ceq7JhbqxaIj5lzGJfjCzAW35ip6kECYgYlNDtB1XWgO0BpyLuO+VkzRvyPlSRtvlsiAwjchLtc+v2hxtGxJToQqHSLTeJc4U+scezg3YZxQC2OKqAtjdNi9T4vDsjMdShzAKUkXYRp80hDkHZsVtZpKgm5OfdebPBJJnCA59nlw57ZrOeumNfGOUVkR3f1xeKqTpWtnsRbAr3v4LsSi6uZI2oZQLpLw7IOYcVvjmJwxF8N/IgktS3bUrtsCJPIPKOy9K8wk3SXe40g7mtYD7JnqgkZTUFs+y/NKk/RT8uXs5m9Ant1nl+uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lxsnSifw; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lxsnSifw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmVRK0cb7z30T3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:14:04 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8vRI4011968;
	Mon, 28 Apr 2025 17:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KomaKd
	ZjhofElzsKOtg4I+kL2PS3yimbP7HbLJSlulQ=; b=lxsnSifwoJMmlWz8KjinGm
	pyb3sVziw0856i6roV0tj3wCP9PhAxQVQEPxpr2ZGmNUC+JS79cPAhyuCqU58WrC
	BYYiNIjTGgnGR6pn+jYvPSXt27JpZEUMlO0bBXFYIBGfQn6ZFVLHbAYCigwowZ5M
	y9Qn/q+kf1lSkMyhXDUb44g9D9AQUeYDEEmqwt6PnM6FBqo4QjP+oTFd0OdgfdHn
	ixfvzBdxmXPMm48N1Sb65hVDmKw6InGQUEzENJNUwZzWHa5ON8yeRqnVPl14/k+U
	6HRIt0P6OBJZ56KrtENGAXE+zxM+FH8/q7ZSd3uYCLBjS55VrqGUdKQHng8wsL1g
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5kmm69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:13:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SG4hau001803;
	Mon, 28 Apr 2025 17:13:45 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bamfcyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:13:45 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SHDiwS31785558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 17:13:44 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7054C58059;
	Mon, 28 Apr 2025 17:13:44 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 762E658058;
	Mon, 28 Apr 2025 17:13:40 +0000 (GMT)
Received: from [9.39.16.18] (unknown [9.39.16.18])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 17:13:40 +0000 (GMT)
Message-ID: <f23608eb-3f4e-453c-bcfc-032f963d310c@linux.ibm.com>
Date: Mon, 28 Apr 2025 22:43:38 +0530
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
Subject: Re: [PATCH 2/2] selftests/mm: Fix a build failure on powerpc
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, Kevin Brodsky <kevin.brodsky@arm.com>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250428131937.641989-1-nysal@linux.ibm.com>
 <20250428131937.641989-2-nysal@linux.ibm.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250428131937.641989-2-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KbhYiEFmmP_tUzB4rpXFNi3_j7M0PyVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNiBTYWx0ZWRfX8vQd+r/NVdK9 fVj89Nk81fj93yIB2WK4uyLM7M2mHWCc2/y4CfPB3vhVEHD61xJsc2tkwaYLeMAo1yZPGG2x6dm N6/occobZIF5tvvDpMBVNLKqwuD0ILpj3AhpKOro+gHjepSmyAR3zwBl4jwSjOC0XFRdJO78IvF
 63cjTo0OVdK2T0jqwU+mT4ZrZpKUZ9IXT4LlK8EaJ5rjawUKpt/6t0aslWBLVTDSR3Q/Oij9URI gbRM6RAky3R5e1w7XWGL+4tZoNYi5BSFK5TvAt5U5U/yjvaXvZL1jx9fj4NrvENMq7KyXXgLXUW eu3eugR/BYKbxdOp951n729X4QIrTsbuJG0jJmbMjsVpG946nf+Pkcdvxipk9dHdfgIAGhD47QW
 8Z7aBlg4v4J8yzNtx5fmE2j6pB8oC35I7r8W4BNQsUCCmMki2/wpZhW72L+YobWf0ODzjd9E
X-Proofpoint-GUID: KbhYiEFmmP_tUzB4rpXFNi3_j7M0PyVQ
X-Authority-Analysis: v=2.4 cv=DvxW+H/+ c=1 sm=1 tr=0 ts=680fb74b cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=QUTIWzIZJQuvQjQnFLoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=906 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280136
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 4/28/25 6:49 PM, Nysal Jan K.A. wrote:
> The compiler is unaware of the size of code generated by the ".rept"
> assembler directive. This results in the compiler emitting branch
> instructions where the offset to branch to exceeds the maximum allowed
> value, resulting in build failures like the following:
>
>    CC       protection_keys
>    /tmp/ccypKWAE.s: Assembler messages:
>    /tmp/ccypKWAE.s:2073: Error: operand out of range (0x0000000000020158
>    is not between 0xffffffffffff8000 and 0x0000000000007ffc)
>    /tmp/ccypKWAE.s:2509: Error: operand out of range (0x0000000000020130
>    is not between 0xffffffffffff8000 and 0x0000000000007ffc)
>
> Fix the issue by manually adding nop instructions using the preprocessor.
>
> Fixes: 46036188ea1f5 ("selftests/mm: build with -O2")
> Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
>   tools/testing/selftests/mm/pkey-powerpc.h | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
> index d8ec906b8120..17bf2d1b0192 100644
> --- a/tools/testing/selftests/mm/pkey-powerpc.h
> +++ b/tools/testing/selftests/mm/pkey-powerpc.h
> @@ -104,8 +104,18 @@ static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
>   	return;
>   }
>   
> +#define REPEAT_8(s) s s s s s s s s
> +#define REPEAT_64(s) REPEAT_8(s) REPEAT_8(s) REPEAT_8(s) REPEAT_8(s) \
> +		     REPEAT_8(s) REPEAT_8(s) REPEAT_8(s) REPEAT_8(s)
> +#define REPEAT_512(s) REPEAT_64(s) REPEAT_64(s) REPEAT_64(s) REPEAT_64(s) \
> +		      REPEAT_64(s) REPEAT_64(s) REPEAT_64(s) REPEAT_64(s)
> +#define REPEAT_4096(s) REPEAT_512(s) REPEAT_512(s) REPEAT_512(s) REPEAT_512(s) \
> +		       REPEAT_512(s) REPEAT_512(s) REPEAT_512(s) REPEAT_512(s)
> +#define REPEAT_16384(s) REPEAT_4096(s) REPEAT_4096(s) \
> +			REPEAT_4096(s) REPEAT_4096(s)
> +


Hi Nysal,

This change looks good to me. I tested in on power and the error is not seen.

   CC       droppable
   CC       guard-regions
   CC       soft-dirty
   CC       protection_keys
   CC       va_high_addr_switch
   CC       virtual_address_range
   CC       write_to_hugetlbfs

Reviewed-by:Donet Tom <donettom@linux.ibm.com>
Tested-by: Donet Tom <donettom@linux.ibm.com>


>   /* 4-byte instructions * 16384 = 64K page */
> -#define __page_o_noops() asm(".rept 16384 ; nop; .endr")
> +#define __page_o_noops() asm(REPEAT_16384("nop\n"))
>   
>   static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
>   {

