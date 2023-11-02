Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A77DEC68
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 06:40:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SUOr56gu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLXlv35tHz3cTS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 16:40:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SUOr56gu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLXl046jBz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 16:39:55 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A25HmAZ005798;
	Thu, 2 Nov 2023 05:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=RBgfinWgMqkBKLBLRAm2sM9PdeO8ipbYJS1DdXhVd4U=;
 b=SUOr56gu2KYgrcjW1mQ0h8+mWU/SmNlghR0I6pFb/V29srMinlpA7y5wmPKAEQoDTRpi
 mZTR1TlKXm3vapJFbcG/pFFXubkIOCm6nkXwlycuzGFXO3ASX6CNnwnmJ7qBc4Dp2jdY
 wZonlWbbN9A4HHRfJk3IK3hBQDibBBUtVcQ3DMwjF5QLlPS7ofvCY7CHqI0tpVh+POHV
 xdYKgKwc4O4uxThbY+B55mO5W4IxYnZ/PqJrEBpG4pxFT6FE41lCSd8YzEwJRK673ceH
 iIBfkZKc/ncUeBKB6PIJy+/j7WnkxkCL/Ay58Q3OTbvu6IN9pd9T9EDyIsCc8DFGA4+0 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u45g80eyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 05:39:43 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A25PGFr022619;
	Thu, 2 Nov 2023 05:39:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u45g80exx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 05:39:42 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A22ZEvt031452;
	Thu, 2 Nov 2023 05:39:41 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u1fb2bvy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 05:39:41 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A25df3S25297436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Nov 2023 05:39:41 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6070458057;
	Thu,  2 Nov 2023 05:39:41 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 388BB58059;
	Thu,  2 Nov 2023 05:39:39 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Nov 2023 05:39:38 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 37/37] powerpc: Support execute-only on all powerpc
In-Reply-To: <4283ea9cbef9ff2fbee468904800e1962bc8fc18.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <4283ea9cbef9ff2fbee468904800e1962bc8fc18.1695659959.git.christophe.leroy@csgroup.eu>
Date: Thu, 02 Nov 2023 11:09:37 +0530
Message-ID: <874ji4af3a.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9577bBYKCj9KXZKm1Qv7MUoJ15OaEDsU
X-Proofpoint-GUID: txbHpqEf3uG5z7b5bRkUePHFJToqarF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 impostorscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311020043
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
Cc: Kees Cook <keescook@chromium.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Introduce PAGE_EXECONLY_X macro which provides exec-only rights.
> The _X may be seen as redundant with the EXECONLY but it helps
> keep consistancy, all macros having the EXEC right have _X.
>
> And put it next to PAGE_NONE as PAGE_EXECONLY_X is
> somehow PAGE_NONE + EXEC just like all other SOMETHING_X are
> just SOMETHING + EXEC.
>
> On book3s/64 PAGE_EXECONLY becomes PAGE_READONLY_X.
>
> On book3s/64, as PAGE_EXECONLY is only valid for Radix add
> VM_READ flag in vm_get_page_prot() for non-Radix.
>
> And update access_error() so that a non exec fault on a VM_EXEC only
> mapping is always invalid, even when the underlying layer don't
> always generate a fault for that.
>
> For 8xx, set PAGE_EXECONLY_X as _PAGE_NA | _PAGE_EXEC.
> For others, only set it as just _PAGE_EXEC
>
> With that change, 8xx, e500 and 44x fully honor execute-only
> protection.
>
> On 40x that is a partial implementation of execute-only. The
> implementation won't be complete because once a TLB has been loaded
> via the Instruction TLB miss handler, it will be possible to read
> the page. But at least it can't be read unless it is executed first.
>
> On 603 MMU, TLB missed are handled by SW and there are separate
> DTLB and ITLB. Execute-only is therefore now supported by not loading
> DTLB when read access is not permitted.
>
> On hash (604) MMU it is more tricky because hash table is common to
> load/store and execute. Nevertheless it is still possible to check
> whether _PAGE_READ is set before loading hash table for a load/store
> access. At least it can't be read unless it is executed first.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Russell Currey <ruscur@russell.cc>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  4 +---
>  arch/powerpc/include/asm/nohash/32/pte-8xx.h |  1 +
>  arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
>  arch/powerpc/include/asm/nohash/pte-e500.h   |  1 +
>  arch/powerpc/include/asm/pgtable-masks.h     |  2 ++
>  arch/powerpc/mm/book3s64/pgtable.c           | 10 ++++------
>  arch/powerpc/mm/fault.c                      |  9 +++++----
>  arch/powerpc/mm/pgtable.c                    |  4 ++--
>  9 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 244621c88510..52971ee30717 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -425,7 +425,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
>  {
>  	/*
>  	 * A read-only access is controlled by _PAGE_READ bit.
> -	 * We have _PAGE_READ set for WRITE and EXECUTE
> +	 * We have _PAGE_READ set for WRITE
>  	 */
>  	if (!pte_present(pte) || !pte_read(pte))
>  		return false; 
>

Should this now be updated to check for EXEC bit ? 

> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 0fd12bdc7b5e..751b01227e36 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -18,6 +18,7 @@
>  #define _PAGE_WRITE		0x00002 /* write access allowed */
>  #define _PAGE_READ		0x00004	/* read access allowed */
>  #define _PAGE_NA		_PAGE_PRIVILEGED
> +#define _PAGE_NAX		_PAGE_EXEC
>  #define _PAGE_RO		_PAGE_READ
>  #define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
>  #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
> @@ -141,9 +142,6 @@
>  
>  #include <asm/pgtable-masks.h>
>  
> -/* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
> -#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
> -
>  /* Permission masks used for kernel mappings */
>  #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
>  #define PAGE_KERNEL_NC	__pgprot(_PAGE_BASE_NC | _PAGE_KERNEL_RW | _PAGE_TOLERANT)
> diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> index 1ee38befd29a..137dc3c84e45 100644
> --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> @@ -48,6 +48,7 @@
>  
>  #define _PAGE_HUGE	0x0800	/* Copied to L1 PS bit 29 */
>  
> +#define _PAGE_NAX	(_PAGE_NA | _PAGE_EXEC)
>  #define _PAGE_ROX	(_PAGE_RO | _PAGE_EXEC)
>  #define _PAGE_RW	0
>  #define _PAGE_RWX	_PAGE_EXEC
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
> index f922c84b23eb..a50be1de9f83 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -203,7 +203,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
>  {
>  	/*
>  	 * A read-only access is controlled by _PAGE_READ bit.
> -	 * We have _PAGE_READ set for WRITE and EXECUTE
> +	 * We have _PAGE_READ set for WRITE
>  	 */
>  	if (!pte_present(pte) || !pte_read(pte))
>  		return false;
>


Same here. if so I guess book3s/64 also will need an update?

> diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
> index 31d2c3ea7df8..f516f0b5b7a8 100644
> --- a/arch/powerpc/include/asm/nohash/pte-e500.h
> +++ b/arch/powerpc/include/asm/nohash/pte-e500.h
> @@ -57,6 +57,7 @@
>  #define _PAGE_KERNEL_ROX	(_PAGE_BAP_SR | _PAGE_BAP_SX)
>  
>  #define _PAGE_NA	0
> +#define _PAGE_NAX	_PAGE_BAP_UX
>  #define _PAGE_RO	_PAGE_READ
>  #define _PAGE_ROX	(_PAGE_READ | _PAGE_BAP_UX)
>  #define _PAGE_RW	(_PAGE_READ | _PAGE_WRITE)
> diff --git a/arch/powerpc/include/asm/pgtable-masks.h b/arch/powerpc/include/asm/pgtable-masks.h
> index 808a3b9e8fc0..6e8e2db26a5a 100644
> --- a/arch/powerpc/include/asm/pgtable-masks.h
> +++ b/arch/powerpc/include/asm/pgtable-masks.h
> @@ -4,6 +4,7 @@
>  
>  #ifndef _PAGE_NA
>  #define _PAGE_NA	0
> +#define _PAGE_NAX	_PAGE_EXEC
>  #define _PAGE_RO	_PAGE_READ
>  #define _PAGE_ROX	(_PAGE_READ | _PAGE_EXEC)
>  #define _PAGE_RW	(_PAGE_READ | _PAGE_WRITE)
> @@ -20,6 +21,7 @@
>  
>  /* Permission masks used to generate the __P and __S table */
>  #define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_NA)
> +#define PAGE_EXECONLY_X	__pgprot(_PAGE_BASE | _PAGE_NAX)
>  #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_RW)
>  #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_RWX)
>  #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_RO)
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 8f8a62d3ff4d..be229290a6a7 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -635,12 +635,10 @@ pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  	unsigned long prot;
>  
>  	/* Radix supports execute-only, but protection_map maps X -> RX */
> -	if (radix_enabled() && ((vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)) {
> -		prot = pgprot_val(PAGE_EXECONLY);
> -	} else {
> -		prot = pgprot_val(protection_map[vm_flags &
> -						 (VM_ACCESS_FLAGS | VM_SHARED)]);
> -	}
> +	if (!radix_enabled() && ((vm_flags & VM_ACCESS_FLAGS) == VM_EXEC))
> +		vm_flags |= VM_READ;
> +
> +	prot = pgprot_val(protection_map[vm_flags & (VM_ACCESS_FLAGS | VM_SHARED)]);
>  
>  	if (vm_flags & VM_SAO)
>  		prot |= _PAGE_SAO;
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index b1723094d464..9e49ede2bc1c 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -266,14 +266,15 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
>  	}
>  
>  	/*
> -	 * VM_READ, VM_WRITE and VM_EXEC all imply read permissions, as
> -	 * defined in protection_map[].  Read faults can only be caused by
> -	 * a PROT_NONE mapping, or with a PROT_EXEC-only mapping on Radix.
> +	 * VM_READ, VM_WRITE and VM_EXEC may imply read permissions, as
> +	 * defined in protection_map[].  In that case Read faults can only be
> +	 * caused by a PROT_NONE mapping. However a non exec access on a
> +	 * VM_EXEC only mapping is invalid anyway, so report it as such.
>  	 */
>  	if (unlikely(!vma_is_accessible(vma)))
>  		return true;
>  
> -	if (unlikely(radix_enabled() && ((vma->vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)))
> +	if ((vma->vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)
>  		return true;
>  
>  	/*
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 781a68c69c2f..79508c1d15d7 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -492,7 +492,7 @@ const pgprot_t protection_map[16] = {
>  	[VM_READ]					= PAGE_READONLY,
>  	[VM_WRITE]					= PAGE_COPY,
>  	[VM_WRITE | VM_READ]				= PAGE_COPY,
> -	[VM_EXEC]					= PAGE_READONLY_X,
> +	[VM_EXEC]					= PAGE_EXECONLY_X,
>  	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
>  	[VM_EXEC | VM_WRITE]				= PAGE_COPY_X,
>  	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
> @@ -500,7 +500,7 @@ const pgprot_t protection_map[16] = {
>  	[VM_SHARED | VM_READ]				= PAGE_READONLY,
>  	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
>  	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
> -	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_X,
> +	[VM_SHARED | VM_EXEC]				= PAGE_EXECONLY_X,
>  	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
>  	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_X,
>  	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
> -- 
> 2.41.0
