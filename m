Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B955B64B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 06:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWZz84q3Mz3cdf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 14:50:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO5L9H41;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qO5L9H41;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWZyT6ZzZz30F8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 14:49:37 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R4LaLE010535;
	Mon, 27 Jun 2022 04:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=JpJuBX2vFVsMsvuKQXAILOvGWYGtgo/zBIirL9yJNzM=;
 b=qO5L9H41VYn2xm4Pggy4nMuI5ojZu5T180s0AAabrFygs6W8CAd28ku1L/x7a0LGuP/M
 9JN+nwgqC2DhiU/elxFgFuxgjhPXZ2s7BRL3I6Rmz4jdEFXMP2nnLy0M/lLFja5ABM+0
 faeUAhtbbN45s9nQeizlQ5H05qWIymfYlFkv4LHwsvpXmepPQgQalGSbgSo6DsJySnKH
 5LEFgyxQfz2KNN94vzNtHaqbWS77/M8uthIOdS/vhZEy4HiKP1HMf0yooMyYx5GO/7WR
 e6h5/HId4JaQN/jL0hlEOXiJEnUPGmiw/3xYbHgtVcMSdaJ2jaHpQDQsgT7FNzo/EeuJ Rg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gy5f20hyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 04:49:21 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25R4aFiI012664;
	Mon, 27 Jun 2022 04:49:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02dal.us.ibm.com with ESMTP id 3gwt09hxwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 04:49:21 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25R4nK3S29688146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 04:49:20 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06B00136055;
	Mon, 27 Jun 2022 04:49:20 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 979FB13604F;
	Mon, 27 Jun 2022 04:49:17 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.47.235])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 04:49:17 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
In-Reply-To: <0a024d97-93d3-18c7-a14c-818b698a8516@csgroup.eu>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
 <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
 <0a024d97-93d3-18c7-a14c-818b698a8516@csgroup.eu>
Date: Mon, 27 Jun 2022 10:19:15 +0530
Message-ID: <874k06zp6c.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XJqNkVIZ3mrsGvGOjWctKlfY_ZyqrsDR
X-Proofpoint-ORIG-GUID: XJqNkVIZ3mrsGvGOjWctKlfY_ZyqrsDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_02,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 mlxlogscore=785 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270020
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, Michal Hocko <mhocko@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 23/06/2022 =C3=A0 14:29, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Instead of high_memory use VMALLOC_START to validate that the address is
>> not in the vmalloc range.
>
> What's the reason for using VMALLOC_START instead ?
> The gap between high_memory and VMALLOC_START should not be seen as=20
> valid memory either, should it ?

Yes and that invalid range should be captured by the pfn_valid check.
Commit ffa0b64e3be5 intended to skip the vmalloc range.
Unfortunately, that resulted in kernel crash due to architecture not
updating high_memory after a memory hotplug. That should be fixed by
patch 1 in this series. patch 3 was added merely as a cleanup to
switch from high_memory to a more familiar VMALLOC_START variable.

>
> If the problem is book3s/64, commit ffa0b64e3be5 ("powerpc: Fix=20
> virt_addr_valid() for 64-bit Book3E & 32-bit") says that those=20
> additional tests are superfluous for boo3s/64. Maybe it's time to drop=20
> unnecessary tests for book3s/64 ?

They are not specific book3s/64. IIUC virt_addr_valid will return false
for an addr after memory hotplug on other platforms too. Patch 1
describe those details.

>
>>=20
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/page.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/=
page.h
>> index e5f75c70eda8..256cad69e42e 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -134,7 +134,7 @@ static inline bool pfn_valid(unsigned long pfn)
>>=20=20=20
>>   #define virt_addr_valid(vaddr)	({					\
>>   	unsigned long _addr =3D (unsigned long)vaddr;			\
>> -	_addr >=3D PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
>> +	_addr >=3D PAGE_OFFSET && _addr < (unsigned long)VMALLOC_START &&	\
>>   	pfn_valid(virt_to_pfn(_addr));					\
>>   })
>>=20=20=20
