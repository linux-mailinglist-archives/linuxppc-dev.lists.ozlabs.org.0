Return-Path: <linuxppc-dev+bounces-5481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E450A19354
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 15:06:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdQqg3j6Yz2yDr;
	Thu, 23 Jan 2025 01:06:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737554815;
	cv=none; b=DmHsFngta2kX6ppCWNFtnm6K3fF6Q0ysIG9x5UJcRocW3FcM8hkQEunG3G6N1IymWssKkLaWT84teYHJB+299pdhinNFfB+WzqMXaZBf5WeuD6KtHzOIBn5w+IVayk+ilJoPqGl+LuMNOPxjyDquFJgFKLLHV55Blj/49caFphCYKmc0fEkUdGjwgllCteBfCsmGPPqbabfXZ0vFhAsl+uoFaMjKjR3GMybspAGYC/xxmIsOSqNu4OAZML0/rDnq8WjmpW5wl8FRhl7gk4aHGEyO0eHbnp0cqAEGOYUc3mJKQQZVD+4x93NhKKnGfwygkUO1ENeMyOstsJVevtebjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737554815; c=relaxed/relaxed;
	bh=HrfDPtB6F0Jqb/yBIH4KRGfTfXLb38iUnuUeeWv2zUU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOM7Cw/l2eaDXe08JIv1HYSdDoVAhqSpfyA9q925UiBxBJCejzio1r9QmLh/yohGwCKK9hW0waAxWYqx4B55RlIpULEW5qT5mhckH1RA/kLh5SCw1xoeMN1haNBQBOQ5L4lnWkuv3rwmJJh6TL6PT8hhRNnCsWI/JNocqgTDHDvlFiS+cq/3D1GdJ9cLRJiPM4HsdqtFa5tDVhL6jf1pMwaaaqxkRLrhK/IpMsFXMM7VQ5wKrS/4YHN8YcGAdVpog3z56g0rtSVcMSbuXLgkl9aDpfeUYkXk95rMGsJnjdN3r+6ifCwkDcFimJsOxsHL6EzUgdtETbA8+FLAjFLXOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hWLXfoPv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hWLXfoPv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdQqf2mtvz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 01:06:54 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MCcQWf001307;
	Wed, 22 Jan 2025 14:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HrfDPt
	B6F0Jqb/yBIH4KRGfTfXLb38iUnuUeeWv2zUU=; b=hWLXfoPv8WYbZlM8YspVCn
	EIJtBkrMAEkrJE81zLuIm+PhzCovjpv7ZYI3vKq9Uvf3FyhJEcrpb0g0CbSIUM00
	3fl4658vK2JxkKVBOaUYDJBaf4gsTIuhBXlljyN/f7kTQDaLh/DuZdoFaxts9Fok
	Pn7xYlKMf0YIQInVGLx9RxLGsHjOxycv8Ry6OBz6uM2dU3m0DOcOAClBwrGyYui/
	k0VuqHQWnOvbe7EWdIp9GY2e/Wvr1pH6CPhv0Hh3VMj+hwbLmlzmUGl5PsmNn3Xt
	yRie0eaSka5BZjVT92HbwXalHc+DjjGXwAe5mv/STFBJmEG4taJJi1k/HWaWF+ow
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44aduywvfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 14:06:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MDcqGi024225;
	Wed, 22 Jan 2025 14:06:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0y8uwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 14:06:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50ME6GQ518481604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 14:06:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 995582004B;
	Wed, 22 Jan 2025 14:06:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A26FD20040;
	Wed, 22 Jan 2025 14:06:15 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.171.43.183])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 22 Jan 2025 14:06:15 +0000 (GMT)
Date: Wed, 22 Jan 2025 15:06:13 +0100
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: akpm@linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Muchun Song
 <muchun.song@linux.dev>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: bring gigantic page allocation under
 hugepages_supported()
Message-ID: <20250122150613.28a92438@thinkpad-T15>
In-Reply-To: <20250121150419.1342794-1-sourabhjain@linux.ibm.com>
References: <20250121150419.1342794-1-sourabhjain@linux.ibm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XoHM5-spcLtVUau8AXWVPbF0ovvPSGWu
X-Proofpoint-GUID: XoHM5-spcLtVUau8AXWVPbF0ovvPSGWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0 mlxlogscore=975
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220104
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 21 Jan 2025 20:34:19 +0530
Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> Despite having kernel arguments to enable gigantic hugepages, this
> provides a way for the architecture to disable gigantic hugepages on the
> fly, similar to what we do for hugepages.
> 
> Components like fadump (PowerPC-specific) need this functionality to
> disable gigantic hugepages when the kernel is booted solely to collect
> the kernel core dump.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> 
> To evaluate the impact of this change on architectures other than
> PowerPC, I did the following analysis:
> 
> For architectures where hugepages_supported() is not redefined, it
> depends on HPAGE_SHIFT, which is found to be a constant. It is mostly
> initialized to PMD_SHIFT.
> 
> Architecture : HPAGE_SHIFT initialized with
> 
> ARC: PMD_SHIFT (constant)
> ARM: PMD_SHIFT (constant)
> ARM64: PMD_SHIFT (constant)
> Hexagon: 22 (constant)
> LoongArch: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
> MIPS: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
> PARISC: PMD_SHIFT (appears to be constant)
> RISC-V: PMD_SHIFT (constant)
> SH: 16 | 18 | 20 | 22 | 26 (constant)
> SPARC: 23 (constant)
> 
> So seems like this change shouldn't have any impact on above
> architectures.
> 
> On the S390 and X86 architectures, hugepages_supported() is redefined,
> and I am uncertain at what point it is safe to call
> hugepages_supported().

For s390, hugepages_supported() checks EDAT1 machine flag, which is
initialized long before any initcalls. So it is safe to be called
here.

My common code hugetlb skills got a little rusty, but shouldn't
arch_hugetlb_valid_size() already prevent getting here for gigantic
hugepages, in case they are not supported? And could you not use
that for your purpose?

BTW, please also add arch mailing list for such questions.

> 
> ---
>  mm/hugetlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cec4b121193f..48b42b8d26b4 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4629,7 +4629,7 @@ static int __init hugepages_setup(char *s)
>  	 * But we need to allocate gigantic hstates here early to still
>  	 * use the bootmem allocator.
>  	 */
> -	if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
> +	if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate) && hugepages_supported())
>  		hugetlb_hstate_alloc_pages(parsed_hstate);
>  
>  	last_mhp = mhp;


