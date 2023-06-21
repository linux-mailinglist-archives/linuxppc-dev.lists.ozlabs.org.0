Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F002737AF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 08:01:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T62lQdZ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmCYb10Wxz3bm2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 16:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T62lQdZ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmCXf2h0Mz30GX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 16:00:33 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L5wEcq001963;
	Wed, 21 Jun 2023 05:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WPQjNtE2YsxVjLWlMSF8UHkB9Z4pur1qmDuM07XpIwA=;
 b=T62lQdZ9mp+hPFhZ4HJAXK/HlTCDM0vCF9Q/d6JeYfFvL4ivlWe2r3y0sGJ1iJiLuzZq
 M+6o2bjA7nangIzTokIfxO50KSNTGC/MR65LVQK1sBwBwiN9B3wmc8Kt60j8A3qs6B8Y
 OUevlMTDeLlCu+GSg8XJe7peqxS9OPkAuDx7V00O+hiM4XOGdPu5gdUecV4cifL+5oEK
 RKyfYGTIPzgQOKchHzbqPY2d9cta5rjMmxoCrvqEHZ7amXeMZ0HX3Eomc+jHo1M0MS5a
 Ga5N2psmMzSTVxrelwJ15Dxcmx4GAQS6lkDCwO4cJFKaDmLXHz8hjn3mqhcs9jnfWL+I uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbuh5r0fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 05:59:36 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L5wlnN004403;
	Wed, 21 Jun 2023 05:59:35 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbuh5r0f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 05:59:35 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L5ZZ2V030905;
	Wed, 21 Jun 2023 05:59:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r94f51x7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 05:59:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L5xU8L27198038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 05:59:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B512B2004D;
	Wed, 21 Jun 2023 05:59:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3EE220043;
	Wed, 21 Jun 2023 05:59:24 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 05:59:24 +0000 (GMT)
Message-ID: <3229ba7d-d929-87c8-96f6-4b5d25a9f540@linux.ibm.com>
Date: Wed, 21 Jun 2023 11:29:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/16] powerpc/book3s64/mm: mmu_vmemmap_psize is used by
 radix
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
        akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
 <20230606045608.55127-3-aneesh.kumar@linux.ibm.com>
 <87bkh9pidi.fsf@mail.lhotse>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87bkh9pidi.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WFzyjy-3TXTpH5ZXb9N24WBSgdAVUXhF
X-Proofpoint-ORIG-GUID: fZ5ABlUgBu8CWh6D40QdbpZpfLhN9Y7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_03,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=859
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210048
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
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/23 9:38 AM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> This should not be within CONFIG_PPC_64S_HASHS_MMU. We use mmu_vmemmap_psize
>> on radix while mapping the vmemmap area.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 --
>>  1 file changed, 2 deletions(-)
> 
> This breaks microwatt_defconfig, which does not enable CONFIG_PPC_64S_HASH_MMU:
> 
>   ../arch/powerpc/mm/book3s64/radix_pgtable.c: In function ‘radix__early_init_mmu’:
>   ../arch/powerpc/mm/book3s64/radix_pgtable.c:601:27: error: lvalue required as left operand of assignment
>     601 |         mmu_virtual_psize = MMU_PAGE_4K;
>         |                           ^
>   make[5]: *** [../scripts/Makefile.build:252: arch/powerpc/mm/book3s64/radix_pgtable.o] Error 1
>   make[4]: *** [../scripts/Makefile.build:494: arch/powerpc/mm/book3s64] Error 2
>   make[3]: *** [../scripts/Makefile.build:494: arch/powerpc/mm] Error 2
>   make[2]: *** [../scripts/Makefile.build:494: arch/powerpc] Error 2
>   make[2]: *** Waiting for unfinished jobs....
>   make[1]: *** [/home/michael/linux/Makefile:2026: .] Error 2
>   make: *** [Makefile:226: __sub-make] Error 2
> 
> Because mmu_virtual_psize is defined in hash_utils.c, which isn't built.
> 

Ok i missed the mmu_virtual_psize dependency there. Will add microwatt_defconfig to build configs. 


modified   arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -594,12 +594,14 @@ void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 #ifdef CONFIG_PPC_64K_PAGES
 	/* PAGE_SIZE mappings */
 	mmu_virtual_psize = MMU_PAGE_64K;
 #else
 	mmu_virtual_psize = MMU_PAGE_4K;
 #endif
+#endif
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 	/* vmemmap mapping */



> cheers

