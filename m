Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC617023D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKTB41S1Qz3f6j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b98jN5yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b98jN5yp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKT8r73NLz3fFh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:54:36 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F5FMHt011001;
	Mon, 15 May 2023 05:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9RtHnblCI7UBu/c1/5fTC3c6+g4vBjyxX43t8vUwvUM=;
 b=b98jN5ypiT4j83hCUpzNxixlpWRvR7pyMV320lZ8Bf+W2S9uMKEE4f63dvsDYQ2s1kfb
 C2BEFTi1P6CwA2wMnjz4fiu4OCAx/DqXQg8h8q0Zb9Hnzit5NlXSs2wd2gjx6sj2zgOP
 1fZHnFh0Ag4Z0VorMowSH/4n05/On96U5BkzAk+vLeU4nOvyXw5V+q0vWJzj7mFAVv58
 qCjGJmFzxR+ySsc7VLZGPk/jaXLm2mUZLDjWXkQyjO2lFpeofXZT/dkRWTJgmKmFjUGS
 LTeTf1c099ZSjU7AOBsRvpyfmDoh7CRb+C10aYFPaHNttpyylcXmeEDvrETk1AISwweT IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qk6p7taer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 05:54:30 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34F5ma2I023860;
	Mon, 15 May 2023 05:54:30 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qk6p7taeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 05:54:30 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F3c41w025392;
	Mon, 15 May 2023 05:54:29 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qj265m1d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 05:54:29 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34F5sRFR27132420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 May 2023 05:54:27 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70D8B58056;
	Mon, 15 May 2023 05:54:27 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC86358060;
	Mon, 15 May 2023 05:54:25 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.204.255])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 May 2023 05:54:25 +0000 (GMT)
X-Mailer: emacs 29.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s/radix: Fix soft dirty tracking
In-Reply-To: <20230511114224.977423-1-mpe@ellerman.id.au>
References: <20230511114224.977423-1-mpe@ellerman.id.au>
Date: Mon, 15 May 2023 11:24:23 +0530
Message-ID: <87zg66dtrk.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rzX33nCbNPFeOMwYPUVMwjNHWUgbZUg0
X-Proofpoint-ORIG-GUID: CllUFLHZaHPe65veMAx-xyXK3X9vdk0C
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=960 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150048
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
Cc: dan@danny.cz, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> It was reported that soft dirty tracking doesn't work when using the
> Radix MMU.
>
> The tracking is supposed to work by clearing the soft dirty bit for a
> mapping and then write protecting the PTE. If/when the page is written
> to, a page fault occurs and the soft dirty bit is added back via
> pte_mkdirty(). For example in wp_page_reuse():
>
> 	entry =3D maybe_mkwrite(pte_mkdirty(entry), vma);
> 	if (ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1))
> 		update_mmu_cache(vma, vmf->address, vmf->pte);
>
> Unfortunately on radix _PAGE_SOFTDIRTY is being dropped by
> radix__ptep_set_access_flags(), called from ptep_set_access_flags(),
> meaning the soft dirty bit is not set even though the page has been
> written to.
>
> Fix it by adding _PAGE_SOFTDIRTY to the set of bits that are able to be
> changed in radix__ptep_set_access_flags().
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: b0b5e9b13047 ("powerpc/mm/radix: Add radix pte #defines")
> Cc: stable@vger.kernel.org # v4.7+
> Reported-by: Dan Hor=C3=A1k <dan@danny.cz>
> Link: https://lore.kernel.org/r/20230511095558.56663a50f86bdc4cd97700b7@d=
anny.cz
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 26245aaf12b8..2297aa764ecd 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1040,8 +1040,8 @@ void radix__ptep_set_access_flags(struct vm_area_st=
ruct *vma, pte_t *ptep,
>  				  pte_t entry, unsigned long address, int psize)
>  {
>  	struct mm_struct *mm =3D vma->vm_mm;
> -	unsigned long set =3D pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED |
> -					      _PAGE_RW | _PAGE_EXEC);
> +	unsigned long set =3D pte_val(entry) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY |
> +					      _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
>=20=20
>  	unsigned long change =3D pte_val(entry) ^ pte_val(*ptep);
>  	/*
> --=20
> 2.40.1
