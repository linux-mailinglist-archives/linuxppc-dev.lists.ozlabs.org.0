Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9A80BF7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 03:54:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AdwrYR4/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRDR1ZQ3z3cXM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 13:54:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AdwrYR4/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRCd1v89z2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 13:54:05 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BAMRQBU010491;
	Mon, 11 Dec 2023 02:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WQ7POFi02CGk/BmO4m3J+1ZTOvt6YbTFqqsSFCaiBRw=;
 b=AdwrYR4/KY2Mp5M9H735DmhreD7h8QrWx4kHFx8D5IVEIpevU2fqshqv4ann4lO0LnuQ
 FD0iDIVqCCjV03ixyG3OrJAgjwH5GF/m5AOLeiA+NU+QuRZo4JNdGNINilN+72rm89Po
 WPgHJM2RI2L1VlbF9JzuzlOkQQreJY4IAr/qDYQPJHL8MZu3JNYInAYKOqDB08KVv6p4
 fmtobNgxPG5ZzqbFpjLvuHJxpmpSo9dY/C8wIkbcCqFH9ZBgwthZBfScmDY+Gv9zGstp
 8DensijOfOku8ynd3VgqA+x5IkmZUdm8Hikq6BO0pr8cGWFdlywCWUyeuKqWtLgqzhBS mA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uvtck4jqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 02:53:53 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB2feFK004390;
	Mon, 11 Dec 2023 02:53:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw4sjx6wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 02:53:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BB2roJJ31392090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Dec 2023 02:53:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5217320040;
	Mon, 11 Dec 2023 02:53:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B1D62004B;
	Mon, 11 Dec 2023 02:53:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Dec 2023 02:53:49 +0000 (GMT)
Received: from [9.177.74.247] (unknown [9.177.74.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9768C6015D;
	Mon, 11 Dec 2023 13:53:44 +1100 (AEDT)
Message-ID: <8ff974c9-994d-7aae-39cb-dfe69646ce9d@linux.ibm.com>
Date: Mon, 11 Dec 2023 13:53:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 4/7] powerpc: mm: Default p{m,u}d_pte implementations
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
 <20231130025404.37179-7-rmclure@linux.ibm.com>
 <5305d752-5161-41ea-9832-c629dc93dc3b@csgroup.eu>
Content-Language: en-US, tr-TR
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <5305d752-5161-41ea-9832-c629dc93dc3b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2mSprlsbzpYEpYs7daA8bFK0MfYF5vrg
X-Proofpoint-GUID: 2mSprlsbzpYEpYs7daA8bFK0MfYF5vrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-10_16,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=959 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312110023
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/30/23 18:35, Christophe Leroy wrote:
>
> Le 30/11/2023 à 03:53, Rohan McLure a écrit :
>> For 32-bit systems which have no usecases for p{m,u}d_pte() prior to
>> page table checking, implement default stubs.
> Is that the best solution ?
>
> If I understand correctly, it is only needed for 
> pmd_user_accessible_page(). Why not provide a stub 
> pmd_user_accessible_page() that returns false on those architectures ?
Yep, this seems reasonable to me.
>
> Same for pud_user_accessible_page()
>
> But if you decide to keep it I think that:
> - It should be squashed with following patch to make it clear it's 
> needed for that only.
> - Remove the WARN_ONCE().
I might however move those WARN_ONCE() calls to the default, false-returning
p{m,u}d_user_accessible_page() implementations, to be consistent with
pud_pfn().
> - Only have a special one for books/64 and a generic only common to he 3 
> others.
>
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> v9: New patch
>> ---
>>   arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +++
>>   arch/powerpc/include/asm/nohash/64/pgtable.h |  2 ++
>>   arch/powerpc/include/asm/pgtable.h           | 17 +++++++++++++++++
>>   3 files changed, 22 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index 8fdb7667c509..2454174b26cb 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -887,6 +887,8 @@ static inline int pud_present(pud_t pud)
>>   
>>   extern struct page *pud_page(pud_t pud);
>>   extern struct page *pmd_page(pmd_t pmd);
>> +
>> +#define pud_pte pud_pte
>>   static inline pte_t pud_pte(pud_t pud)
>>   {
>>   	return __pte_raw(pud_raw(pud));
>> @@ -1043,6 +1045,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
>>   }
>>   #endif
>>   
>> +#define pmd_pte pmd_pte
>>   static inline pte_t pmd_pte(pmd_t pmd)
>>   {
>>   	return __pte_raw(pmd_raw(pmd));
>> diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
>> index f58cbebde26e..09a34fe196ae 100644
>> --- a/arch/powerpc/include/asm/nohash/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
>> @@ -93,6 +93,7 @@ static inline void pmd_clear(pmd_t *pmdp)
>>   	*pmdp = __pmd(0);
>>   }
>>   
>> +#define pmd_pte pmd_pte
>>   static inline pte_t pmd_pte(pmd_t pmd)
>>   {
>>   	return __pte(pmd_val(pmd));
>> @@ -134,6 +135,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>>   
>>   extern struct page *pud_page(pud_t pud);
>>   
>> +#define pud_pte pud_pte
>>   static inline pte_t pud_pte(pud_t pud)
>>   {
>>   	return __pte(pud_val(pud));
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index 9c0f2151f08f..d7d0f47760d3 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -233,6 +233,23 @@ static inline int pud_pfn(pud_t pud)
>>   }
>>   #endif
>>   
>> +#ifndef pmd_pte
>> +#define pmd_pte pmd_pte
>> +static inline pte_t pmd_pte(pmd_t pmd)
>> +{
>> +	WARN_ONCE(1, "pmd: platform does not use pmd entries directly");
>> +	return __pte(pmd_val(pmd));
>> +}
>> +#endif
>> +
>> +#ifndef pud_pte
>> +#define pud_pte pud_pte
>> +static inline pte_t pud_pte(pud_t pud)
>> +{
>> +	WARN_ONCE(1, "pud: platform does not use pud entries directly");
>> +	return __pte(pud_val(pud));
>> +}
>> +#endif
>>   #endif /* __ASSEMBLY__ */
>>   
>>   #endif /* _ASM_POWERPC_PGTABLE_H */

