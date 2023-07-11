Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7B74E5D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:28:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QJAmxyqX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0SYY0bC2z3bsd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QJAmxyqX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0SXh1N7Mz30dp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:28:03 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4Hit9001784;
	Tue, 11 Jul 2023 04:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=DLxDXY64JqP8QA4+/ad2fdAWFnHSpvzOz4lYDO0GQkg=;
 b=QJAmxyqXwTBztcO4g6d62Zsmnv5Aohhx1gaMPeBDDzvshyrIszFi7ucY3zaVy8wgbEmm
 K92R2l/9f6EcIRNs4Z6y9I3HT2CbgOLQGcnZ88b9aqTzpg4cfT4MWNal0hWvFelAH60T
 /ft5mmW929xS3QD064WwFHXOBF4QtwzwuTVPL5dJLFP/1GePgwW7I8eIWLZM9brLKnmi
 D5xli7x+mRVM5d5ZX68D75Wvoa6tepTZNFJZW+x/yE6FaZMm58H128PFSLGJSEStXpFV
 huXgFvSCwg5q5zHntQN7behSYJHK4bti0XCvbUZYTvgJ0Xgz8tJRZizydn13N+O0ALuT TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrywv055d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:27:45 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4IEFU004801;
	Tue, 11 Jul 2023 04:27:44 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrywv054w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:27:44 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B1P3Ao014024;
	Tue, 11 Jul 2023 04:27:42 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3rpye5n1pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:27:42 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4Rf7S6947088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:27:41 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 548225804B;
	Tue, 11 Jul 2023 04:27:41 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5139F58055;
	Tue, 11 Jul 2023 04:27:35 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:27:34 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/13] mm/vmemmap: Allow architectures to override
 how vmemmap optimization works
In-Reply-To: <444ec1b2-296e-fee1-bf24-d4e83c825518@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-5-aneesh.kumar@linux.ibm.com>
 <444ec1b2-296e-fee1-bf24-d4e83c825518@csgroup.eu>
Date: Tue, 11 Jul 2023 09:57:32 +0530
Message-ID: <87h6qboyx7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: m2R2_lKBPfx3jPCzuHV82SOmkkewG7AG
X-Proofpoint-GUID: rOJ8KlkbGn0T03Qx2J9EwimvUZaQG3TB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_01,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110036
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 10/07/2023 =C3=A0 18:08, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Architectures like powerpc will like to use different page table allocat=
ors
>> and mapping mechanisms to implement vmemmap optimization. Similar to
>> vmemmap_populate allow architectures to implement
>> vmemap_populate_compound_pages
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/sparse-vmemmap.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>=20
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index a044a130405b..541b3f69a481 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -141,6 +141,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>>   			start, end - 1);
>>   }
>>=20=20=20
>> +#ifndef vmemmap_populate_compound_pages
>>   pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr,=
 int node,
>>   				       struct vmem_altmap *altmap,
>>   				       struct page *reuse)
>
> Should vmemmap_pte_populate() be static ?
>
> It looks odd to exclude a non-static function based on a non related macr=
o.
>
> There are several such function in the block being excluded here. Can=20
> you explain why it is correct to do that ?
>


Those functions can actually be made static. But I will do that as a
part of different patch. I will update this patch and make sure the
 #ifdef will only override the vmemmap_populate_compound_pages.

modified   mm/sparse-vmemmap.c
@@ -141,7 +141,6 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
			start, end - 1);
 }

-#ifndef vmemmap_populate_compound_pages
 pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int=
 node,
				       struct vmem_altmap *altmap,
				       struct page *reuse)
@@ -359,6 +358,7 @@ int __meminit vmemmap_populate_hugepages(unsigned long =
start, unsigned long end,
	return 0;
 }

+#ifndef vmemmap_populate_compound_pages
 /*
  * For compound pages bigger than section size (e.g. x86 1G compound
  * pages with 2M subsection size) fill the rest of sections as tail

-aneesh

