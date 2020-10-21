Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A75294EA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 16:27:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGXry2r6lzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 01:27:46 +1100 (AEDT)
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
 header.s=pp1 header.b=qcsnyblp; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGXpZ59PNzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 01:25:42 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LE3RrJ122996; Wed, 21 Oct 2020 10:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=DL04KC57DYhStT+elOirXhVnkDXKA/W9W+m5Q9WWhcg=;
 b=qcsnyblpXYmW3lpC3fHzaT1j4dzx595DdTYfGlPAqR1N9ygcTfW/A13GxVQ2+0+18EmN
 hKkSTZ6H4VxLR6c4R4NkLDT5wMjaKK3Nbbs4VwxSds4raeSEXTS2jqpZvZVpNg1NfCz8
 mTC82qXXrVzx8IsRFaMUedetQuaZhZBv6MHsISn46wKkcn4yvCbfegml2B0XSJD3N+N5
 ySNGQJ5eqqb1uYvbiO/XlXNFPkJD/DCaFxjzNoptdf6O0LieE2GsbKhSIcFgBOGcTchY
 Z76yVzsVFgvDHQObIYmE7IO7lKmM7Db/h3D9/Yzt+TQKaDUaperwN76LPHAefI5M70Oq +Q== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34apcx8vyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 10:25:18 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09LEHFia019299;
 Wed, 21 Oct 2020 14:25:17 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 347r890ma5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:25:17 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09LEPHXF49414552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 14:25:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D3102805C;
 Wed, 21 Oct 2020 14:25:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D49D28059;
 Wed, 21 Oct 2020 14:25:15 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.82.214])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Oct 2020 14:25:14 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/mm: Add mask of always present MMU features
In-Reply-To: <4bc99005-f3c0-045b-e0d5-f8b6f2b2e90d@csgroup.eu>
References: <06bf0e094463533e7aec6900bddd435171e9f44f.1602517171.git.christophe.leroy@csgroup.eu>
 <4bc99005-f3c0-045b-e0d5-f8b6f2b2e90d@csgroup.eu>
Date: Wed, 21 Oct 2020 19:55:11 +0530
Message-ID: <871rhrejw8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_06:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010210107
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 12/10/2020 =C3=A0 17:39, Christophe Leroy a =C3=A9crit=C2=A0:
>> On the same principle as commit 773edeadf672 ("powerpc/mm: Add mask
>> of possible MMU features"), add mask for MMU features that are
>> always there in order to optimise out dead branches.
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: Features must be anded with MMU_FTRS_POSSIBLE instead of ~0, otherwi=
se
>>      MMU_FTRS_ALWAYS is ~0 when no #ifdef matches.
>
> This is still not enough. For BOOK3S/32, MMU_FTRS_POSSIBLE is still too m=
uch.
> We need a #ifdef CONFIG_PPC_BOOK3S_32 with 0.
>
> Christophe
>
>> ---
>>   arch/powerpc/include/asm/mmu.h | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/m=
mu.h
>> index 255a1837e9f7..64e7e7f7cda9 100644
>> --- a/arch/powerpc/include/asm/mmu.h
>> +++ b/arch/powerpc/include/asm/mmu.h
>> @@ -201,8 +201,30 @@ enum {
>>   		0,
>>   };
>>=20=20=20
>> +enum {
>> +	MMU_FTRS_ALWAYS =3D
>> +#ifdef CONFIG_PPC_8xx
>> +		MMU_FTR_TYPE_8xx &
>> +#endif
>> +#ifdef CONFIG_40x
>> +		MMU_FTR_TYPE_40x &
>> +#endif
>> +#ifdef CONFIG_PPC_47x
>> +		MMU_FTR_TYPE_47x &
>> +#elif defined(CONFIG_44x)
>> +		MMU_FTR_TYPE_44x &
>> +#endif
>> +#if defined(CONFIG_E200) || defined(CONFIG_E500)
>> +		MMU_FTR_TYPE_FSL_E &
>> +#endif
>> +		MMU_FTRS_POSSIBLE,
>> +};

Will it be simpler if we make it a #define like below?

#ifdef CONFIG_PPC_8XX
#define MMU_FTR_ALWAYS  MMU_FTR_TYPE_8XX & MMU_FTR_POSSIBLE
#endif



>> +
>>   static inline bool early_mmu_has_feature(unsigned long feature)
>>   {
>> +	if (MMU_FTRS_ALWAYS & feature)
>> +		return true;
>> +
>>   	return !!(MMU_FTRS_POSSIBLE & cur_cpu_spec->mmu_features & feature);
>>   }
>>=20=20=20
>> @@ -231,6 +253,9 @@ static __always_inline bool mmu_has_feature(unsigned=
 long feature)
>>   	}
>>   #endif
>>=20=20=20
>> +	if (MMU_FTRS_ALWAYS & feature)
>> +		return true;
>> +
>>   	if (!(MMU_FTRS_POSSIBLE & feature))
>>   		return false;
>>=20=20=20
>>=20
