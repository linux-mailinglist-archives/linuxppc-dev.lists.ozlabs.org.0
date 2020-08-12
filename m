Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B62425DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 09:08:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRLQc5m9dzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 17:08:40 +1000 (AEST)
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
 header.s=pp1 header.b=f0rbBm9B; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRKt54NPkzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 16:43:56 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C6WjJ1170814; Wed, 12 Aug 2020 02:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=41NMuwmiUwCh/DJ0c8voSQKonpg6IHjOFHHggpKMA/s=;
 b=f0rbBm9BvMWLUmht2o9tbJy5qT8Tzb+rwhziZBIw4agMLbwlnvefoB0yZor31cGa8fwQ
 y9yvZilDokhjowDH0P/Azi1NxkcpPpL6BIwcbU6Y/JUDmomKDJ+5KoE8Fhud9NiOrdqe
 bnpk93nVGzMMcN1gZuAngh/9rIIh+fWrLay9pngAXFaGfCMy5qMq9CV8a8aJSHPVj/3L
 1HBZlBzk9c6my/p08b/P1pYxV0VCYdyVeUTzcZoGe4QnK+g61NbKvAQsipf/tCp14qNC
 nq56SNoCTawSxXugB93EiwtzINQWnMjLn6aHn2OCMA0wzXi0djL3YmRLXCLP8gKrepQ7 wg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32t93s0fnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 02:43:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C6VWix013455;
 Wed, 12 Aug 2020 06:43:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 32skahc3sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 06:43:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C6hWgr25624866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 06:43:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB775A4040;
 Wed, 12 Aug 2020 06:43:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA032A4053;
 Wed, 12 Aug 2020 06:43:30 +0000 (GMT)
Received: from [9.85.71.109] (unknown [9.85.71.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 06:43:30 +0000 (GMT)
Subject: Re: [PATCH 02/16] debug_vm_pgtable/ppc64: Avoid setting top bits in
 radom value
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-2-aneesh.kumar@linux.ibm.com>
 <24b1e523-e87e-161b-3dc9-60bd11c8f461@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <d196a2e1-3d6a-6c6b-fc6d-8cc32095b269@linux.ibm.com>
Date: Wed, 12 Aug 2020 12:13:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24b1e523-e87e-161b-3dc9-60bd11c8f461@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=980 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120047
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/12/20 12:10 PM, Christophe Leroy wrote:
> 
> 
> Le 12/08/2020 à 08:33, Aneesh Kumar K.V a écrit :
>> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting 
>> that bit in
>> random value.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 086309fb9b6f..4c32063a8acf 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -45,9 +45,12 @@
>>    * pxx_clear() because of how dynamic page table folding works on 
>> s390. So
>>    * while loading up the entries do not change the lower 4 bits. It 
>> does not
>>    * have affect any other platform.
>> + *
>> + * Also avoid the 62nd bit on ppc64 that is used to mark a pte entry.
>>    */
>>   #define S390_MASK_BITS    4
>> -#define RANDOM_ORVALUE    GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
>> +#define PPC_MASK_BITS    2
>> +#define RANDOM_ORVALUE    GENMASK(BITS_PER_LONG - 1 - PPC_MASK_BITS, 
>> S390_MASK_BITS)
> 
> Do you mean:
> 
> #define RANDOM_ORVALUE    GENMASK(BITS_PER_LONG - 1, PPC_MASK_BITS | 
> S390_MASK_BITS)


IIUC GENMASK(hi, low) generate a mask from hi to low bits. Since i want 
to avoid bit 62, I am forcing it to generate bits from (61, 4)


-aneesh
