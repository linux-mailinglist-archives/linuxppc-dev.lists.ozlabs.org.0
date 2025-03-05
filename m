Return-Path: <linuxppc-dev+bounces-6718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF08A4F5E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 05:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6zRP70MKz2xyG;
	Wed,  5 Mar 2025 15:02:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741147377;
	cv=none; b=PtH40tIUPD9DaepO6z1P+BZBq4DV7ftOij5jlYAlwr7RBhiIfq0j1NtjizukTmLfxaUTONpwOop4xjdTdA7SOc3BCMbZIZn/nfc0UkV0crwhBCtDhlhWahzcJNGBe7sQsOj9AtZdO48LgqhYFXWYha42YX1VWrF1O1PUwm+dYrXYGSq17FSEbpZswZ6Zl+ANDCK1duitr5vDPIig03e6KbNt0EQJmm1JtZYZ6nMORv/x/2e+XWCrBaVBLT3h744ou0XLCU7QQEQvb0jY9eBjih7gG21+++2MGI3HnVlEL+J107neUQfuhs9KrN3Rtie8WFf72NbY51GP0w3n+Ger+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741147377; c=relaxed/relaxed;
	bh=Ae213PQRzf9waOgXH5DVaQsydxVBpE8KDSh9X9D337U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXVdImv/I46cTTADGFPyO5Fhgtmz2o/dRT8LLCaucrD0rTbFsxhu+Z3wsgGxb/E7/0K8L9YVHObMorvT/lGhhgT94o9wXa9tYmidvUx8UY991KUsXajHs3yNnCp2MdfqiSPzHVioSOc1PDv4Rrt/NoBTbB6ttZfr7FvnoGWUGAHC1mkcZp8uBESwajfAfnrcW+gz57spypTndAesbjq1ZcO1OfJKiEtHml2eGmxa6fHgynnvd0BFMro/pZPDewiCqhDhbOTa45cwKrTmmpPtiBm60SojrsHCG53DA2soMxY5iMosDV2ZQ+bzpTd55t9HFVAGQAbxFG/5Ld2BfrRfjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YRUfquxi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YRUfquxi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6zRN1D6zz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 15:02:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524KqSHT027529;
	Wed, 5 Mar 2025 04:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ae213P
	QRzf9waOgXH5DVaQsydxVBpE8KDSh9X9D337U=; b=YRUfquxi5EhVWe0PQR/gRL
	3AfulRJu+eoNuxcDZgNe9eIl+wTkgWNQ3xF8pq99YziDUN5IdqqUHx1zOxl5n+1E
	ASyuER6qOQDyruqVnd2ipL+BNwyK+FA0dBR1hs2uXaQCNkuYbxYvRfwKEX5+iYmS
	QiX0NKtWLRhwdzCuuYsqmXWneMOObVXw+CO2J9w9Y3nJhzFOEYkRewHLgqbySVb5
	Z1xpLr+FN6uu7cjDn1bkRfnLKU79dkhuge+/YYK0wRqCi5haycF5VTQk9RVg25TG
	s39qo+lG1jP6Tw1YzNh2y2+B8ohKNu83Q6Ro3Q8COrkgAXxjtNUdDD6rDvo7oP1Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568x51ab7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 04:02:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5253srOD022974;
	Wed, 5 Mar 2025 04:02:29 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568x51ab5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 04:02:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52532H2Q020846;
	Wed, 5 Mar 2025 04:02:29 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454djngw54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 04:02:29 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52542RYP27460224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 04:02:27 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9721558064;
	Wed,  5 Mar 2025 04:02:27 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA97A58058;
	Wed,  5 Mar 2025 04:02:22 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Mar 2025 04:02:22 +0000 (GMT)
Message-ID: <78a983a2-d6b4-4a46-9d63-345da92f1bf4@linux.ibm.com>
Date: Wed, 5 Mar 2025 09:32:21 +0530
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
Subject: Re: [PATCH] crypto: powerpc: Mark ghashp8-ppc.o as an
 OBJECT_FILES_NON_STANDARD
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Danny Tsen <dtsen@linux.ibm.com>
Cc: Breno Leitao <leitao@debian.org>, Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AwMebvO9FkBBwqx8fMJ3viKWv-3YaBf9
X-Proofpoint-ORIG-GUID: mP_YQJ2YvnGx3gK7AHJsfI6Qa3yxfbCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_02,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050028
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Christophe,

On 05/03/25 4:32 am, Christophe Leroy wrote:
> The following build warning has been reported:
>
>    arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>
> This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
> for decoding all types of uncond branches")
>
> Disassembly of arch/powerpc/crypto/ghashp8-ppc.o shows:
>
>   arch/powerpc/crypto/ghashp8-ppc.o:     file format elf64-powerpcle
>
>   Disassembly of section .text:
>
>   0000000000000140 <gcm_ghash_p8>:
>     140:    f8 ff 00 3c     lis     r0,-8
>   ...
>     20c:    20 00 80 4e     blr
>     210:    00 00 00 00     .long 0x0
>     214:    00 0c 14 00     .long 0x140c00
>     218:    00 00 04 00     .long 0x40000
>     21c:    00 00 00 00     .long 0x0
>     220:    47 48 41 53     rlwimi. r1,r26,9,1,3
>     224:    48 20 66 6f     xoris   r6,r27,8264
>     228:    72 20 50 6f     xoris   r16,r26,8306
>     22c:    77 65 72 49     bla     1726574 <gcm_ghash_p8+0x1726434>      <==
>   ...
>
> It corresponds to the following code in ghashp8-ppc.o :
>
>   _GLOBAL(gcm_ghash_p8)
>      lis    0,0xfff8
>   ...
>      blr
>   .long    0
>   .byte    0,12,0x14,0,0,0,4,0
>   .long    0
>   .size    gcm_ghash_p8,.-gcm_ghash_p8
>
>   .byte 71,72,65,83,72,32,102,111,114,32,80,111,119,101,114,73,83,65,32,50,46,48,55,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
>   .align    2
>   .align    2
>
> In fact this is raw data that is after the function end and that is
> not text so shouldn't be disassembled as text. But ghashp8-ppc.S is
> generated by a perl script and should have been marked as
> OBJECT_FILES_NON_STANDARD.
>
> Now that 'bla' is understood as a call instruction, that raw data
> is mis-interpreted as an infra-function call.
>
> Mark ghashp8-ppc.o as a OBJECT_FILES_NON_STANDARD to avoid this
> warning.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com
> Cc: Danny Tsen <dtsen@linux.ibm.com>
> Fixes: 109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/crypto/Makefile | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
> index 9b38f4a7bc15..2f00b22b0823 100644
> --- a/arch/powerpc/crypto/Makefile
> +++ b/arch/powerpc/crypto/Makefile
> @@ -51,3 +51,4 @@ $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
>   OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
>   OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
>   OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
> +OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y


Applied this patch on top of linux-next 20250303, and it fixes the below 
reported warning.

   arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call.

Please add below tag:

Tested-By: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.


