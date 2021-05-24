Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73938E1EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 09:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpTpL4Ylsz3btZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 17:47:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Aqif/3FK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Aqif/3FK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpTnp60Grz2xts
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 17:47:26 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14O7Xsv8131548; Mon, 24 May 2021 03:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=LJ6Xq5UP8MBtlBD+rRbl7onYtamajg3ULib3v+ViQCQ=;
 b=Aqif/3FKjQRyeC6Upiykjh7cPjDHFmxOWYOgVw2rUziiV4L0LCMdbBEGa3ukXUn8/1I2
 aNqHVgL9F9Di+hz6eK7XrAmtWTNRqbzocl0Br8JuPGoe6w+MPweVfUdu/0HFqK0+Fu0L
 ZqE+LaRtbq5PFl9yCpqN/uEuiiY/rAmb7iMipZWMlSB1Urhyhd275Mf11v/XYFsTNgFj
 j4KHDQWYTRb4yNeFYXNHfhet5wdY/a/dHP+P9DawkoWIjSW5xyDwLTRQGhn30milzxT7
 X8HKLm1H9jFlVMFbdnymF2lPxJ0UU+InpeAKKygMwtWhs2/EoHKg2u9Mz2Kic+hjbDyW /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r7s30dwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 03:47:14 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14O7YTtJ135512;
 Mon, 24 May 2021 03:47:14 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r7s30dwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 03:47:14 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14O7fMaI001439;
 Mon, 24 May 2021 07:47:13 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 38psk8rr3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 07:47:13 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14O7lCQs34013572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 07:47:12 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 471506E04C;
 Mon, 24 May 2021 07:47:12 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84D9C6E053;
 Mon, 24 May 2021 07:47:10 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.1.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 07:47:10 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix reverse map real-mode address
 lookup with huge vmalloc
In-Reply-To: <20210523181054.Horde.1K8Ldhm0aj339_vHlUQCkQ1@messagerie.c-s.fr>
References: <20210523181054.Horde.1K8Ldhm0aj339_vHlUQCkQ1@messagerie.c-s.fr>
Date: Mon, 24 May 2021 13:17:07 +0530
Message-ID: <87zgwkr2tg.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xgoq6IxkD4BWAGRCNvS2zhnNcMz5Q33G
X-Proofpoint-GUID: 5fWoUuN8Z0Ph8mLHNKcATn1OjNKSQ0ZB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_04:2021-05-20,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240060
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Nicholas Piggin <npiggin@gmail.com> a =C3=A9crit=C2=A0:
>
>> real_vmalloc_addr() does not currently work for huge vmalloc, which is
>> what the reverse map can be allocated with for radix host, hash guest.
>>
>> Add huge page awareness to the function.
>>
>> Fixes: 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c=20=20
>> b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
>> index 7af7c70f1468..5f68cb5cc009 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
>> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
>> @@ -26,16 +26,23 @@
>>  static void *real_vmalloc_addr(void *x)
>>  {
>>  	unsigned long addr =3D (unsigned long) x;
>> +	unsigned long mask;
>> +	int shift;
>>  	pte_t *p;
>> +
>>  	/*
>> -	 * assume we don't have huge pages in vmalloc space...
>> -	 * So don't worry about THP collapse/split. Called
>> -	 * Only in realmode with MSR_EE =3D 0, hence won't need irq_save/resto=
re.
>> +	 * This is called only in realmode with MSR_EE =3D 0, hence won't need
>> +	 * irq_save/restore around find_init_mm_pte.
>>  	 */
>> -	p =3D find_init_mm_pte(addr, NULL);
>> +	p =3D find_init_mm_pte(addr, &shift);
>>  	if (!p || !pte_present(*p))
>>  		return NULL;
>> -	addr =3D (pte_pfn(*p) << PAGE_SHIFT) | (addr & ~PAGE_MASK);
>> +	if (!shift)
>> +		shift =3D PAGE_SHIFT;
>> +
>> +	mask =3D (1UL << shift) - 1;
>> +	addr =3D (pte_pfn(*p) << PAGE_SHIFT) | (addr & mask);
>
> Looks strange, before we have ~MASK now we have mask without the ~

#define PAGE_MASK      (~((1 << PAGE_SHIFT) - 1))

-aneesh
