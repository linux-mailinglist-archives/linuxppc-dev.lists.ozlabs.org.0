Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA72C4FAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 08:46:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChVFH3bHmzDr9H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 18:46:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RwIS0pGo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChVCY5xpLzDr0L
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 18:44:57 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ71MD8081509; Thu, 26 Nov 2020 02:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version : content-type
 : content-transfer-encoding; s=pp1;
 bh=wm27rQX9a+X/VijUyQgvSo7VWBTbg2gFt+a/BhQeLjQ=;
 b=RwIS0pGoUXEOVrQmPKHw12j3AEzznjEuKJ/3SoDWwno6osDVWAmGH4ngbmCs2SCFUNq5
 +AUlr7eYmiwOpjIqqeQ/GTWhsUiBslioR5i4+Zxt7Qcxo0Gtznmj5o3xJvBWUPAoyKqu
 NNzadXvIhuUmSqSUCRptoUv1sW0nrEWV5aJW4eZg6S4d/DDunkZAcxuRHQW/pTTgQUcX
 /rG/2NckcybL6ZjgU9xOEGLp/m/4MkBZhtCZMaWkRF7TDrWryzwzfn2H4rw4KEEoapU7
 m8+aCNTBCEWfpNQP0fHz5jw5RjBxH9VOR0u9bbrbPnO47rQMfrxlEkcmhbzFIRR3aEzI Ng== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3526npacjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:44:44 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ7hYPA002583;
 Thu, 26 Nov 2020 07:44:44 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 34xth9ddry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 07:44:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ7ihDb21627272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 07:44:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBCBFAE05C;
 Thu, 26 Nov 2020 07:44:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DB58AE05F;
 Thu, 26 Nov 2020 07:44:41 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.75.69])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 07:44:41 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v6 16/22] powerpc/book3s64/kuap: Improve error reporting
 with KUAP
In-Reply-To: <bd854266-6cb5-3a04-ae80-a53e03f1e1d3@csgroup.eu>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-17-aneesh.kumar@linux.ibm.com>
 <bd854266-6cb5-3a04-ae80-a53e03f1e1d3@csgroup.eu>
Date: Thu, 26 Nov 2020 13:14:38 +0530
Message-ID: <87h7pctvdl.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_01:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260037
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 25/11/2020 =C3=A0 06:16, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> With hash translation use DSISR_KEYFAULT to identify a wrong access.
>> With Radix we look at the AMR value and type of fault.
>>=20
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/32/kup.h     |  4 +--
>>   arch/powerpc/include/asm/book3s/64/kup.h     | 27 ++++++++++++++++----
>>   arch/powerpc/include/asm/kup.h               |  4 +--
>>   arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 +--
>>   arch/powerpc/mm/fault.c                      |  2 +-
>>   5 files changed, 29 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/inc=
lude/asm/book3s/32/kup.h
>> index 32fd4452e960..b18cd931e325 100644
>> --- a/arch/powerpc/include/asm/book3s/32/kup.h
>> +++ b/arch/powerpc/include/asm/book3s/32/kup.h
>> @@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned long=
 flags)
>>   		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
>>   }
>>=20=20=20
>> -static inline bool
>> -bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_wri=
te)
>> +static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long a=
ddress,
>> +				  bool is_write, unsigned long error_code)
>>   {
>>   	unsigned long begin =3D regs->kuap & 0xf0000000;
>>   	unsigned long end =3D regs->kuap << 28;
>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/inc=
lude/asm/book3s/64/kup.h
>> index 4a3d0d601745..2922c442a218 100644
>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>> @@ -301,12 +301,29 @@ static inline void set_kuap(unsigned long value)
>>   	isync();
>>   }
>>=20=20=20
>> -static inline bool
>> -bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_wri=
te)
>> +#define RADIX_KUAP_BLOCK_READ	UL(0x4000000000000000)
>> +#define RADIX_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
>> +
>> +static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long a=
ddress,
>> +				  bool is_write, unsigned long error_code)
>>   {
>> -	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
>> -		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_R=
EAD)),
>> -		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>> +	if (!mmu_has_feature(MMU_FTR_KUAP))
>> +		return false;
>> +
>> +	if (radix_enabled()) {
>> +		/*
>> +		 * Will be a storage protection fault.
>> +		 * Only check the details of AMR[0]
>> +		 */
>> +		return WARN((regs->kuap & (is_write ? RADIX_KUAP_BLOCK_WRITE : RADIX_=
KUAP_BLOCK_READ)),
>> +			    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>
> I think it is pointless to keep the WARN() here.
>
> I have a series aiming at removing them. See=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cc9129bdda1dbc2f0=
a09cf45fece7d0b0e690784.1605541983.git.christophe.leroy@csgroup.eu/

Can we do this as a spearate patch as you posted above? We can drop the
WARN in that while keeping the hash branch to look at DSISR value.

-aneesh
