Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC52868EC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 22:18:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C65JS3znwzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 07:18:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=khalid.aziz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=gmE2LdZ8; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C65F05mCPzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 07:15:48 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 097K9k4Z155286;
 Wed, 7 Oct 2020 20:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=sEc3+JOY4GEUw7wZjFGU94rrw05aoMQl93fhhWlYcUM=;
 b=gmE2LdZ8E+KF4wjs2C0rOpLG6fnheNQFNiI5jZsAgeMD20tsilNtf+YluYt5qq/uALMI
 +hk9rjugah/1hM1Hjxlr/7pNRCkpKXS4EcgOw8ZH1ZeNcG3lPp8GXOqnwtGgGttnjdIk
 8tkD7VyFl2EqivTy3StxYDikwthvfNjAjGvMbVBEGFxv7E44K0SAiBVmin2r9y4lp+Fm
 GEW/1V1JdfDAdmGxLr+o5Mb0BkbTbR9Cnaafsuf95itcPPqRm8WHm0Lbv2Y2aRcZwxc5
 NQ0HZarITCobHJ6IkCkyVwQeAp5pTucJq9OEM7ujHIHO0D4wls+zDlJCeRif1yEg22L+ LQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 33xhxn41kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 07 Oct 2020 20:15:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 097KBCu4119070;
 Wed, 7 Oct 2020 20:15:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 33yyjhnk1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Oct 2020 20:15:31 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 097KFUlB031996;
 Wed, 7 Oct 2020 20:15:30 GMT
Received: from [10.65.129.34] (/10.65.129.34)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Oct 2020 13:15:29 -0700
Subject: Re: [PATCH 2/2] sparc: Check VMA range in sparc_validate_prot()
To: Jann Horn <jannh@google.com>, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
References: <20201007073932.865218-1-jannh@google.com>
 <20201007073932.865218-2-jannh@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
X-Pep-Version: 2.0
Organization: Oracle Corp
Message-ID: <230d612d-75e8-34e0-00d6-b0f7274e692c@oracle.com>
Date: Wed, 7 Oct 2020 14:15:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007073932.865218-2-jannh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9767
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9767
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070128
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Paul Mackerras <paulus@samba.org>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/7/20 1:39 AM, Jann Horn wrote:
> sparc_validate_prot() is called from do_mprotect_pkey() as
> arch_validate_prot(); it tries to ensure that an mprotect() call can't
> enable ADI on incompatible VMAs.
> The current implementation only checks that the VMA at the start addres=
s
> matches the rules for ADI mappings; instead, check all VMAs that will b=
e
> affected by mprotect().
>=20
> (This hook is called before mprotect() makes sure that the specified ra=
nge
> is actually covered by VMAs, and mprotect() returns specific error code=
s
> when that's not the case. In order for mprotect() to still generate the=

> same error codes for mprotect(<unmapped_ptr>, <len>, ...|PROT_ADI), we =
need
> to *accept* cases where the range is not fully covered by VMAs.)
>=20
> Cc: stable@vger.kernel.org
> Fixes: 74a04967482f ("sparc64: Add support for ADI (Application Data In=
tegrity)")
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> compile-tested only, I don't have a Sparc ADI setup - might be nice if =
some
> Sparc person could test this?
>=20
>  arch/sparc/include/asm/mman.h | 50 +++++++++++++++++++++--------------=

>  1 file changed, 30 insertions(+), 20 deletions(-)


Looks good to me.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>


>=20
> diff --git a/arch/sparc/include/asm/mman.h b/arch/sparc/include/asm/mma=
n.h
> index e85222c76585..6dced75567c3 100644
> --- a/arch/sparc/include/asm/mman.h
> +++ b/arch/sparc/include/asm/mman.h
> @@ -60,31 +60,41 @@ static inline int sparc_validate_prot(unsigned long=
 prot, unsigned long addr,
>  	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI=
))
>  		return 0;
>  	if (prot & PROT_ADI) {
> +		struct vm_area_struct *vma, *next;
> +
>  		if (!adi_capable())
>  			return 0;
> =20
> -		if (addr) {
> -			struct vm_area_struct *vma;
> +		vma =3D find_vma(current->mm, addr);
> +		/* if @addr is unmapped, let mprotect() deal with it */
> +		if (!vma || vma->vm_start > addr)
> +			return 1;
> +		while (1) {
> +			/* ADI can not be enabled on PFN
> +			 * mapped pages
> +			 */
> +			if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> +				return 0;
> =20
> -			vma =3D find_vma(current->mm, addr);
> -			if (vma) {
> -				/* ADI can not be enabled on PFN
> -				 * mapped pages
> -				 */
> -				if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> -					return 0;
> +			/* Mergeable pages can become unmergeable
> +			 * if ADI is enabled on them even if they
> +			 * have identical data on them. This can be
> +			 * because ADI enabled pages with identical
> +			 * data may still not have identical ADI
> +			 * tags on them. Disallow ADI on mergeable
> +			 * pages.
> +			 */
> +			if (vma->vm_flags & VM_MERGEABLE)
> +				return 0;
> =20
> -				/* Mergeable pages can become unmergeable
> -				 * if ADI is enabled on them even if they
> -				 * have identical data on them. This can be
> -				 * because ADI enabled pages with identical
> -				 * data may still not have identical ADI
> -				 * tags on them. Disallow ADI on mergeable
> -				 * pages.
> -				 */
> -				if (vma->vm_flags & VM_MERGEABLE)
> -					return 0;
> -			}
> +			/* reached the end of the range without errors? */
> +			if (addr+len <=3D vma->vm_end)
> +				return 1;
> +			next =3D vma->vm_next;
> +			/* if a VMA hole follows, let mprotect() deal with it */
> +			if (!next || next->vm_start !=3D vma->vm_end)
> +				return 1;
> +			vma =3D next;
>  		}
>  	}
>  	return 1;
>=20


