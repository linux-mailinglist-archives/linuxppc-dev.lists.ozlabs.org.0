Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F3249678
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 09:06:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWf3J1NxQzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 17:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cS4YVKf+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWdnz2pWgzDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 16:55:19 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07J6XXUj110884; Wed, 19 Aug 2020 02:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=C7XeqbggeBaD2Gri2aoVWoHh472g5HoW3i7+WuntM3k=;
 b=cS4YVKf+AsuoT3VC8iNvjTGygGK/6lvwTeHDO2rvqAbjEOFDvtYe4YYioJO7aUE5geVs
 IAsSQQ7zQU5AHBLdU2c5tOaB9DC/JxcPlgVHL6ZxVidRM8BgS1PA/YIPS703flHLF0Io
 1XXpaZuRjFjvuLDj25kHPgdy376m/wxrK+eZyzEn/HLUkdpTFaPtk3AgvVhA41ka7e/A
 xlEsF8KOInbHi3Opk4TrdlHuPEnbzG6Yat+eOpyi8Q/o48Scuq+WMERVIq3WTTeFVjBz
 6LNOOQdb/aZt2WzmSr6Cu00RzxucrmszY+j/Zcmgvk6dKE5kUgbaPx2jBTQMphCr3npd Aw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r47p4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 02:55:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J6idUp004588;
 Wed, 19 Aug 2020 06:55:04 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3304cccgw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 06:55:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07J6t3rs37159278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 06:55:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D39EEAC05B;
 Wed, 19 Aug 2020 06:55:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14E22AC05F;
 Wed, 19 Aug 2020 06:55:01 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.26.142])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 06:55:01 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH 14/16] debug_vm_pgtable/hugetlb: Disable hugetlb test on
 ppc64
In-Reply-To: <08c63a65-cd3f-73f3-1698-5e60f398fbad@arm.com>
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-14-aneesh.kumar@linux.ibm.com>
 <d067c278-6391-72f1-75c2-ccbd52909233@arm.com>
 <efc8f8c8-c16d-0826-9401-a45005ecaf62@linux.ibm.com>
 <83766a01-6ffb-798c-c5b9-46b2d672f618@arm.com>
 <535169b9-f4f0-57ce-0c2b-30afc237d4bd@linux.ibm.com>
 <08c63a65-cd3f-73f3-1698-5e60f398fbad@arm.com>
Date: Wed, 19 Aug 2020 12:24:59 +0530
Message-ID: <87r1s315x8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-18,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190056
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> writes:

> On 08/12/2020 07:22 PM, Aneesh Kumar K.V wrote:
>> On 8/12/20 7:04 PM, Anshuman Khandual wrote:
>>>
>>>
>>> On 08/12/2020 06:46 PM, Aneesh Kumar K.V wrote:
>>>> On 8/12/20 6:33 PM, Anshuman Khandual wrote:
>>>>>
>>>>>
>>>>> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>>>>>> The seems to be missing quite a lot of details w.r.t allocating
>>>>>> the correct pgtable_t page (huge_pte_alloc()), holding the right
>>>>>> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
>>>>>>
>>>>>> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of thes=
e.
>>>>>> Hence disable the test on ppc64.
>>>>>
>>>>> This test is free from any platform specific #ifdefs which should
>>>>> never be broken. If hugetlb_advanced_tests() does not work or is
>>>>> not detailed enough for ppc64, then it would be great if you could
>>>>> suggest some improvements so that it works for all enabled platforms.
>>>>>
>>>>>
>>>>
>>>> As mentioned the test is broken. For hugetlb, the pgtable_t pages shou=
ld be allocated by huge_pte_alloc(). We need to hold huget_pte_lock() befor=
e=C2=A0 updating huge tlb pte. That takes hugepage size, which is mostly de=
rived out of vma. Hence vma need to be a hugetlb vma. Some of the functions=
 also depend on hstate. Also we should use set_huge_pte_at() when setting u=
p hugetlb pte entries. I was tempted to remove that test completely marking=
 it broken. But avoided that by marking it broken on only PPC64.
>>>
>>> The test is not broken, hugetlb helpers on multiple platforms dont comp=
lain about
>>> this at all. The tests here emulate 'enough' MM objects required for th=
e helpers
>>> on enabled platforms, to perform the primary task i.e page table transf=
ormation it
>>> is expected to do. The test does not claim to emulate a perfect MM envi=
ronment for
>>> a given subsystem's (like HugeTLB) arch helpers. Now in this case, the =
MM objects
>>> being emulated for the HugeTLB advanced tests does not seem to be suffi=
cient for
>>> ppc64 but it can be improved. But that does not mean it is broken in it=
's current
>>> form for other platforms.
>>>
>>=20
>> There is nothing ppc64 specific here. It is just that we have CONFIG_DEB=
UG_VM based checks for different possibly wrong usages of these functions. =
This was done because we have different page sizes, two different translati=
ons to support and we want to avoid any wrong usage. IMHO expecting hugetlb=
 page table helpers to work with a non hugetlb VMA and=C2=A0 without holdin=
g hugeTLB pte lock is a clear violation of hugetlb interface.
>
> Do you have a modified version of the test with HugeTLB marked VMA and wi=
th pte lock
> held, which works on ppc664 ?

Nope. That is one of the reason I commented that out. We can sort that
out slowly.

-aneesh
