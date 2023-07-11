Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079274E5CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:26:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bn5JH8+u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0SVT6hmpz3btP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bn5JH8+u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0STX6mM6z30fB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:25:20 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4HSc5001585;
	Tue, 11 Jul 2023 04:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=CP1sZYrv/hU2iGjV4XjsQ4/icpelpGIEyIqv3O5Bi60=;
 b=bn5JH8+u088j2v/+8T1/un8/0pNaMm0GAkROGZdDrI+kK6OrwCOWTxl5G2dlQWmdN1rD
 gKXW2qm7U8e9f9nnX5rFx5t9PJvCmKpCZcsRZZ233tLCaV0HDHPvDV2B8wMXMxkbhcx5
 TCpUrBguWzGx954NKBHBCcZO7kqLzP0+oRfiVsIDYrph65GsWS9Yt1/MUTSxpMoSMHox
 IqkVgxhSjjnqBEE+ZX25zkQ52JDTphogCCxYSCZulcBydBYZ813MzbHyl0jASikNxngt
 M7TRMBh226dF3MiyvtBtebb2mvWGA5ucKliWedhvXr4NN0Q+KYWrGisfKLDAtOU3i5kq yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrywv03h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:24:56 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4IkSD005297;
	Tue, 11 Jul 2023 04:24:55 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrywv03gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:24:55 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4GOUN016662;
	Tue, 11 Jul 2023 04:24:54 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3rpye649q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:24:54 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4Orl8197138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:24:53 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35E6F5805B;
	Tue, 11 Jul 2023 04:24:53 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 611AE5804B;
	Tue, 11 Jul 2023 04:24:47 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:24:47 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] mm: Add __HAVE_ARCH_PUD_SAME similar to
 __HAVE_ARCH_P4D_SAME
In-Reply-To: <f9a84c8f-614b-bee4-62b7-97aca037abe1@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-6-aneesh.kumar@linux.ibm.com>
 <f9a84c8f-614b-bee4-62b7-97aca037abe1@csgroup.eu>
Date: Tue, 11 Jul 2023 09:54:45 +0530
Message-ID: <87mt03oz1u.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BnI2Wx0NBmk7UaQXN3vBbiQWhPc9dec6
X-Proofpoint-GUID: NvQ_o5RYiDwxuCMrRseOgNlMQpbK_V1V
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
>> This helps architectures to override pmd_same and pud_same independently.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Shouldn't you do it the modern way and use #ifndef pud_same instead of a=
=20
> new __HAVE_ARCH_PUD_SAME like in the old days ?
>

Sure will update. I was following existing pmd_same override. But I also
agree #ifndef pud_same is better.



>
>> ---
>>   include/linux/pgtable.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>=20
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 6fd9b2831338..91def34f7784 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -693,7 +693,9 @@ static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
>>   {
>>   	return pmd_val(pmd_a) =3D=3D pmd_val(pmd_b);
>>   }
>> +#endif
>>=20=20=20
>> +#ifndef __HAVE_ARCH_PUD_SAME
>>   static inline int pud_same(pud_t pud_a, pud_t pud_b)
>>   {
>>   	return pud_val(pud_a) =3D=3D pud_val(pud_b);

-aneesh
