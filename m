Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25455B802
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 08:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWdfL1Dn5z3cDG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:50:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iq6vbtnC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iq6vbtnC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWddd0Z9jz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 16:50:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R4rOIl020272;
	Mon, 27 Jun 2022 06:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=us9leZJZ7dHIolx7l8Yx4Wg4oMITjBrXn2PD0P6cOQk=;
 b=iq6vbtnC6J7bCZMrts1zXFjkpYl7G3sIlf7U4s7mxX6A1n7e+MnuGxMbPUXl+1sYwc8J
 XjAx6JV+QVqfW9nVntj2SvL9s7mLeet7lDG/yA3Z4XmQLnBOx7mvPuBo51yFzUcG+yvw
 skpGNNSz3c65J9JBnDdEUq8iho7x7ekfGNoKjaVl2aCsunOVVCfgt7Huunu7fjKWSA0f
 m0hFuzwxFFsnOLVDQtj4//SZWc6tl5uu8zA2OdmU4PC0gizM8MelJvDMyim5+2kFsxen
 49sr8Io3WHid/j/77JjIGS1CUk3VSoWc8uF4+7HjrJGhogjOy7wL9SOA6KJPWzdJdgji wQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gy5wpb7b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 06:49:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25R6Ks6r015274;
	Mon, 27 Jun 2022 06:49:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma01dal.us.ibm.com with ESMTP id 3gwt094bn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 06:49:58 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25R6nvXG23003544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 06:49:57 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A745D124054;
	Mon, 27 Jun 2022 06:49:57 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28BDC124052;
	Mon, 27 Jun 2022 06:49:55 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.47.235])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 06:49:54 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
In-Reply-To: <e69ac23f-5847-2acc-418e-5bd93864ed54@csgroup.eu>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
 <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
 <e69ac23f-5847-2acc-418e-5bd93864ed54@csgroup.eu>
Date: Mon, 27 Jun 2022 12:19:52 +0530
Message-ID: <87y1xiy50v.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Eu6wj8NoK-cIgcmkFZPIitDi0K3QPWCw
X-Proofpoint-GUID: Eu6wj8NoK-cIgcmkFZPIitDi0K3QPWCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_05,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=905 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270027
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
>
> What about booke/64 ?
>
> The test will be _addr >=3D 0xc000000000000000 && _addr <=20
> 0x8000000000000000 so the test will be always false.
>

Ok, I didn't realize that booke/64 have vmalloc range below direct map.
I guess we should drop patch 3.

-aneesh
