Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E322D7DCA81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 11:16:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GSZjLDZg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKQyh670Kz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 21:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GSZjLDZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKQxq2F0sz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 21:15:26 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VAAu37002468;
	Tue, 31 Oct 2023 10:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=OJUS+9KjTbdR5em9rRihDJVrcjq7setQKbZNTOU4ovA=;
 b=GSZjLDZgf+JqpIo8P7Q3l59QzXHlc/Rf2tJ0fqIjixkZluDmN50X6uv+nG1KmS3+mF7m
 Ck72vhiYAHjlksW4im0WwMZai5zXXdeQDbpJ3hy0rzIlZFDJp4tmrpRBNgei37OJmQ+x
 is0yLUYvLS5K4NKZmowq4lHM3H6Zp9ASG05rRNC7CzkoynUJWtyeN/oIyzq1/ftKZBwK
 V7gzQ1CrYERIGWjsvJNp1URzG1uniW1x5JlThyP3c3aMK/tsrwGrbmCe42IpveC6oavC
 XnopMi5rHGjs0hJ4d4P2MQSTOQsIkMQenetb08RWuV6JUht3qJYnzGzaZ1YtITkGqikR /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2xtksqwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 10:15:17 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39VABtuj007412;
	Tue, 31 Oct 2023 10:15:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2xtksqw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 10:15:16 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39V8Ireu011544;
	Tue, 31 Oct 2023 10:15:15 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u1e4kqdve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 10:15:15 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39VAFEYw6554338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Oct 2023 10:15:14 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D0C85805A;
	Tue, 31 Oct 2023 10:15:14 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F0345805C;
	Tue, 31 Oct 2023 10:15:12 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Oct 2023 10:15:11 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by pte_read()
In-Reply-To: <72cbb5be595e9ef884140def73815ed0b0b37010.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <72cbb5be595e9ef884140def73815ed0b0b37010.1695659959.git.christophe.leroy@csgroup.eu>
Date: Tue, 31 Oct 2023 15:45:10 +0530
Message-ID: <877cn39jyp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JCYExBOwiSDD9TKMNTt1BCt2ouAey2KB
X-Proofpoint-ORIG-GUID: ZcNCFHo4s6xeuPC-l20x3XEboXBzRwct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0
 spamscore=0 mlxlogscore=405 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310310080
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> pte_user() is now only used in pte_access_permitted() to check
> access on vmas. User flag is cleared to make a page unreadable.
>
> So rename it pte_read() and remove pte_user() which isn't used
> anymore.
>
> For the time being it checks _PAGE_USER but in the near futur
> all plateforms will be converted to _PAGE_READ so lets support
> both for now.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/nohash/32/pte-8xx.h |  7 -------
>  arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++++++------
>  arch/powerpc/mm/ioremap.c                    |  4 ----
>  3 files changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> index 62c965a4511a..1ee38befd29a 100644
> --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> @@ -112,13 +112,6 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>  
>  #define pte_mkwrite_novma pte_mkwrite_novma
>  
> -static inline bool pte_user(pte_t pte)
> -{
> -	return !(pte_val(pte) & _PAGE_SH);
> -}
> -
> -#define pte_user pte_user
> -
>  static inline pte_t pte_mkhuge(pte_t pte)
>  {
>  	return __pte(pte_val(pte) | _PAGE_SPS | _PAGE_HUGE);
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
> index ee677162f9e6..aba56fe3b1c6 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -160,9 +160,6 @@ static inline int pte_write(pte_t pte)
>  	return pte_val(pte) & _PAGE_WRITE;
>  }
>  #endif
> -#ifndef pte_read
> -static inline int pte_read(pte_t pte)		{ return 1; }
> -#endif
>  static inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
>  static inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SPECIAL; }
>  static inline int pte_none(pte_t pte)		{ return (pte_val(pte) & ~_PTE_NONE_MASK) == 0; }
> @@ -190,10 +187,14 @@ static inline int pte_young(pte_t pte)
>   * and PTE_64BIT, PAGE_KERNEL_X contains _PAGE_BAP_SR which is also in
>   * _PAGE_USER.  Need to explicitly match _PAGE_BAP_UR bit in that case too.
>   */
> -#ifndef pte_user
> -static inline bool pte_user(pte_t pte)
> +#ifndef pte_read
> +static inline bool pte_read(pte_t pte)
>  {
> +#ifdef _PAGE_READ
> +	return (pte_val(pte) & _PAGE_READ) == _PAGE_READ;
> +#else
>  	return (pte_val(pte) & _PAGE_USER) == _PAGE_USER;
> +#endif
>  }
>  #endif
>  
> @@ -208,7 +209,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
>  	 * A read-only access is controlled by _PAGE_USER bit.
>  	 * We have _PAGE_READ set for WRITE and EXECUTE
>  	 */
> -	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
> +	if (!pte_present(pte) || !pte_read(pte))
>  		return false;
>  
>  	if (write && !pte_write(pte))
> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
> index 7823c38f09de..7b0afcabd89f 100644
> --- a/arch/powerpc/mm/ioremap.c
> +++ b/arch/powerpc/mm/ioremap.c
> @@ -50,10 +50,6 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long flags)
>  	if (pte_write(pte))
>  		pte = pte_mkdirty(pte);
>  
> -	/* we don't want to let _PAGE_USER leak out */
> -	if (WARN_ON(pte_user(pte)))
> -		return NULL;
>

This check is still valid right? I understand that we want to remove
_PAGE_USER. But then loosing this check is ok? 

> -
>  	if (iowa_is_active())
>  		return iowa_ioremap(addr, size, pte_pgprot(pte), caller);
>  	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
> -- 
> 2.41.0
