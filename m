Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A62868E2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 22:16:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C65G91yrTzDqDy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 07:16:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=khalid.aziz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=FjAO07Pb; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C65D91g7GzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 07:14:58 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 097K9TXd155018;
 Wed, 7 Oct 2020 20:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=0e/WSQywy08TzR1PbeoUl0NQLoa6r1TN03v8dKdC7U0=;
 b=FjAO07Pb2c79haWCsZs0ux00POmzGfuH57r6caG0cGfcojOyTKVFFPuHVW+Yr2RzIT+3
 TB4a36iJNtdmqutsHUDflCeeXakvsA/xWUAX9Fb2Tm2TrmarfvKjzvW25CjSB/BHbFK3
 qpb7E0WXBbuf9SUhgR2ON+APMr7v9HeSPsuyJZyBlc049jKaC0zS5cy/QJgGEAFbrOSG
 HpT74sNrtVAA1n+4SlUp50gV8BUootrJO3Fcxfh2iPuzGgmSbAR10V0h5oNy9jWxo0lR
 W7Wz2ZRsGADnTPa3pQOtAlwgO0kMX8CsETwOwywHoiMIvZy5fxaCG9i42OerZiNoukJt lw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 33xhxn41dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 07 Oct 2020 20:14:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 097KBKgS061221;
 Wed, 7 Oct 2020 20:14:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 33y2vpxjex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Oct 2020 20:14:26 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 097KEBt6031273;
 Wed, 7 Oct 2020 20:14:13 GMT
Received: from [10.65.129.34] (/10.65.129.34)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Oct 2020 13:14:11 -0700
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To: Jann Horn <jannh@google.com>, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
References: <20201007073932.865218-1-jannh@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
X-Pep-Version: 2.0
Message-ID: <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
Date: Wed, 7 Oct 2020 14:14:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007073932.865218-1-jannh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9767
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9767
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501
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
> arch_validate_prot() is a hook that can validate whether a given set of=

> protection flags is valid in an mprotect() operation. It is given the s=
et
> of protection flags and the address being modified.
>=20
> However, the address being modified can currently not actually be used =
in
> a meaningful way because:
>=20
> 1. Only the address is given, but not the length, and the operation can=

>    span multiple VMAs. Therefore, the callee can't actually tell which
>    virtual address range, or which VMAs, are being targeted.
> 2. The mmap_lock is not held, meaning that if the callee were to check
>    the VMA at @addr, that VMA would be unrelated to the one the
>    operation is performed on.
>=20
> Currently, custom arch_validate_prot() handlers are defined by
> arm64, powerpc and sparc.
> arm64 and powerpc don't care about the address range, they just check t=
he
> flags against CPU support masks.
> sparc's arch_validate_prot() attempts to look at the VMA, but doesn't t=
ake
> the mmap_lock.
>=20
> Change the function signature to also take a length, and move the
> arch_validate_prot() call in mm/mprotect.c down into the locked region.=

>=20
> Cc: stable@vger.kernel.org
> Fixes: 9035cf9a97e4 ("mm: Add address parameter to arch_validate_prot()=
")
> Suggested-by: Khalid Aziz <khalid.aziz@oracle.com>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  arch/arm64/include/asm/mman.h   | 4 ++--
>  arch/powerpc/include/asm/mman.h | 3 ++-
>  arch/powerpc/kernel/syscalls.c  | 2 +-
>  arch/sparc/include/asm/mman.h   | 6 ++++--
>  include/linux/mman.h            | 3 ++-
>  mm/mprotect.c                   | 6 ++++--
>  6 files changed, 15 insertions(+), 9 deletions(-)


This looks good to me.

As Chris pointed out, the call to arch_validate_prot() from do_mmap2()
is made without holding mmap_lock. Lock is not acquired until
vm_mmap_pgoff(). This variance is uncomfortable but I am more
uncomfortable forcing all implementations of validate_prot to require
mmap_lock be held when non-sparc implementations do not have such need
yet. Since do_mmap2() is in powerpc specific code, for now this patch
solves a current problem. That leaves open the question of should
generic mmap call arch_validate_prot and return EINVAL for invalid
combination of protection bits, but that is better addressed in a
separate patch.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>

>=20
> diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mma=
n.h
> index 081ec8de9ea6..0876a87986dc 100644
> --- a/arch/arm64/include/asm/mman.h
> +++ b/arch/arm64/include/asm/mman.h
> @@ -23,7 +23,7 @@ static inline pgprot_t arch_vm_get_page_prot(unsigned=
 long vm_flags)
>  #define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags=
)
> =20
>  static inline bool arch_validate_prot(unsigned long prot,
> -	unsigned long addr __always_unused)
> +	unsigned long addr __always_unused, unsigned long len __always_unused=
)
>  {
>  	unsigned long supported =3D PROT_READ | PROT_WRITE | PROT_EXEC | PROT=
_SEM;
> =20
> @@ -32,6 +32,6 @@ static inline bool arch_validate_prot(unsigned long p=
rot,
> =20
>  	return (prot & ~supported) =3D=3D 0;
>  }
> -#define arch_validate_prot(prot, addr) arch_validate_prot(prot, addr)
> +#define arch_validate_prot(prot, addr, len) arch_validate_prot(prot, a=
ddr, len)
> =20
>  #endif /* ! __ASM_MMAN_H__ */
> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm=
/mman.h
> index 7cb6d18f5cd6..65dd9b594985 100644
> --- a/arch/powerpc/include/asm/mman.h
> +++ b/arch/powerpc/include/asm/mman.h
> @@ -36,7 +36,8 @@ static inline pgprot_t arch_vm_get_page_prot(unsigned=
 long vm_flags)
>  }
>  #define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags=
)
> =20
> -static inline bool arch_validate_prot(unsigned long prot, unsigned lon=
g addr)
> +static inline bool arch_validate_prot(unsigned long prot, unsigned lon=
g addr,
> +				      unsigned long len)
>  {
>  	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO=
))
>  		return false;
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/sysca=
lls.c
> index 078608ec2e92..b1fabb97d138 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -43,7 +43,7 @@ static inline long do_mmap2(unsigned long addr, size_=
t len,
>  {
>  	long ret =3D -EINVAL;
> =20
> -	if (!arch_validate_prot(prot, addr))
> +	if (!arch_validate_prot(prot, addr, len))
>  		goto out;
> =20
>  	if (shift) {
> diff --git a/arch/sparc/include/asm/mman.h b/arch/sparc/include/asm/mma=
n.h
> index f94532f25db1..e85222c76585 100644
> --- a/arch/sparc/include/asm/mman.h
> +++ b/arch/sparc/include/asm/mman.h
> @@ -52,9 +52,11 @@ static inline pgprot_t sparc_vm_get_page_prot(unsign=
ed long vm_flags)
>  	return (vm_flags & VM_SPARC_ADI) ? __pgprot(_PAGE_MCD_4V) : __pgprot(=
0);
>  }
> =20
> -#define arch_validate_prot(prot, addr) sparc_validate_prot(prot, addr)=

> -static inline int sparc_validate_prot(unsigned long prot, unsigned lon=
g addr)
> +#define arch_validate_prot(prot, addr, len) sparc_validate_prot(prot, =
addr, len)
> +static inline int sparc_validate_prot(unsigned long prot, unsigned lon=
g addr,
> +				      unsigned long len)
>  {
> +	mmap_assert_write_locked(current->mm);
>  	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI=
))
>  		return 0;
>  	if (prot & PROT_ADI) {
> diff --git a/include/linux/mman.h b/include/linux/mman.h
> index 6f34c33075f9..5b4d554d3189 100644
> --- a/include/linux/mman.h
> +++ b/include/linux/mman.h
> @@ -96,7 +96,8 @@ static inline void vm_unacct_memory(long pages)
>   *
>   * Returns true if the prot flags are valid
>   */
> -static inline bool arch_validate_prot(unsigned long prot, unsigned lon=
g addr)
> +static inline bool arch_validate_prot(unsigned long prot, unsigned lon=
g addr,
> +				      unsigned long len)
>  {
>  	return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM)) =3D=3D=
 0;
>  }
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index ce8b8a5eacbb..e2d6b51acbf8 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -533,14 +533,16 @@ static int do_mprotect_pkey(unsigned long start, =
size_t len,
>  	end =3D start + len;
>  	if (end <=3D start)
>  		return -ENOMEM;
> -	if (!arch_validate_prot(prot, start))
> -		return -EINVAL;
> =20
>  	reqprot =3D prot;
> =20
>  	if (mmap_write_lock_killable(current->mm))
>  		return -EINTR;
> =20
> +	error =3D -EINVAL;
> +	if (!arch_validate_prot(prot, start, len))
> +		goto out;
> +
>  	/*
>  	 * If userspace did not allocate the pkey, do not let
>  	 * them use it here.
>=20
> base-commit: c85fb28b6f999db9928b841f63f1beeb3074eeca
>=20


