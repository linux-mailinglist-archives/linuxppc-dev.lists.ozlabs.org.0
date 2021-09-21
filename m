Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B2412D2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 05:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD5nF545Qz2yNp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 13:02:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q3CAvHBD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q3CAvHBD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD5md2lRZz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 13:01:36 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L20kxF020635; 
 Mon, 20 Sep 2021 23:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=2EFudWnKapIPu5BwIqyeNMI6nJXI2+uzKHPV/kKu0N8=;
 b=Q3CAvHBDIiDkFOHzs8q+kvdRWkOi9mvBSMik4dNFkE6tePCNEN853RWMSswPDKrXyh/u
 O0/eRQzUw7Ag/Tw1GnR2xnUyFMeqVgoH80nHZ30nBPzYOPj1LhajZfzf9Lse1J16LfA9
 mcAxo1t6RvYRQH/XcHoqODA4DFb2xBEdl0qhlOdrFG/+prMdgCiOPWjv7aZfNcsubvJT
 qAztvRjpHh3HJnDHljY1ZJasEV7ZlOB1mJt489pdNlxmgfKuTQqIQhKpuEFuSMdZ2OiA
 4VFq1Y2W2dOXJ+To7hR85G/1AsNIVnyxmME/+UBO/segm0pCN4CjD7zSsixAlUmCRWZG IQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7680ru69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 23:01:30 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18L2vBTH013896;
 Tue, 21 Sep 2021 03:01:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3b57r95wgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 03:01:27 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18L2ubBD58458506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 02:56:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB6A4204D;
 Tue, 21 Sep 2021 03:01:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB4D34203F;
 Tue, 21 Sep 2021 03:01:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.33.175])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Sep 2021 03:01:22 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] powerpc/perf: Expose instruction and data address
 registers as part of extended regs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87ilyviusy.fsf@mpe.ellerman.id.au>
Date: Tue, 21 Sep 2021 08:31:19 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <EB39E0ED-C1BA-4F67-935D-E765524F8B25@linux.vnet.ibm.com>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1624200360-1429-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87pmtjmysk.fsf@mpe.ellerman.id.au>
 <38CCAAE2-A157-4689-B774-43FC48883699@linux.vnet.ibm.com>
 <87ilyviusy.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BLFsjFpLxOP-7hJB3SkCRQlspvTimY26
X-Proofpoint-GUID: BLFsjFpLxOP-7hJB3SkCRQlspvTimY26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_11,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210017
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, rnsastry@linux.ibm.com,
 kajoljain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20-Sep-2021, at 12:43 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>> On 08-Sep-2021, at 10:47 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>>=20
>>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>>> Patch adds support to include Sampled Instruction Address Register
>>>> (SIAR) and Sampled Data Address Register (SDAR) SPRs as part of =
extended
>>>> registers. Update the definition of PERF_REG_PMU_MASK_300/31 and
>>>> PERF_REG_EXTENDED_MAX to include these SPR's.
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
>>>> arch/powerpc/perf/perf_regs.c             |  4 ++++
>>>> 2 files changed, 11 insertions(+), 5 deletions(-)
>>>>=20
>>> ...
>>>> diff --git a/arch/powerpc/perf/perf_regs.c =
b/arch/powerpc/perf/perf_regs.c
>>>> index b931eed..51d31b6 100644
>>>> --- a/arch/powerpc/perf/perf_regs.c
>>>> +++ b/arch/powerpc/perf/perf_regs.c
>>>> @@ -90,7 +90,11 @@ static u64 get_ext_regs_value(int idx)
>>>> 		return mfspr(SPRN_SIER2);
>>>> 	case PERF_REG_POWERPC_SIER3:
>>>> 		return mfspr(SPRN_SIER3);
>>>> +	case PERF_REG_POWERPC_SDAR:
>>>> +		return mfspr(SPRN_SDAR);
>>>> #endif
>>>> +	case PERF_REG_POWERPC_SIAR:
>>>> +		return mfspr(SPRN_SIAR);
>>>> 	default: return 0;
>>>> 	}
>>>=20
>>> This file is built for all powerpc configs that have PERF_EVENTS. =
Which
>>> includes CPUs that don't have SDAR or SIAR.
>>>=20
>>> Don't we need checks in perf_reg_value() like we do for SIER?
>>=20
>> Hi Michael,
>>=20
>> Thanks for the review.
>>=20
>> SIER is part of PERF_REG_PMU_MASK and hence check is needed to see if =
platform supports SIER.
>> Incase of extended regs, they are part of PERF_REG_EXTENDED_MASK and =
this mask is
>> filled with supported registers while registering the PMU ( ie during =
init_power9/10_pmu ). So these registers will be added
>> only for supported platforms. The validity of extended mask is also =
done in PMU common code=20
>> ( In kernel/events/core.c with PERF_REG_EXTENDED_MASK check ). So an =
unsupported platform requesting for extended
>> registers won=E2=80=99t get it.
>=20
> Right, I'd forgotten how that works.
>=20
> But I think part of the reason I didn't remember is that
> PERF_REG_PMU_MASK_31 doesn't mention those regs by name, it's just a =
hex
> constant, ie:
>=20
> -#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
> +#define PERF_REG_PMU_MASK_31   (0x3fffULL << PERF_REG_POWERPC_MMCR0)
>=20
> Presumably you tested that the added 0x3 there sets the right bits for
> SDAR and SIAR, but it's 1) not obvious and 2) fragile.
>=20
> So I'd like it better if we constructed the PERF_REG_PMU_MASK_31, and
> other similar masks, by or'ing together the actual register value
> constants.
>=20
> eg. something like:
>=20
> #define PERF_REG_PMU_MASK_31	\
> 	((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << =
PERF_REG_POWERPC_MMCR1) | \
> 	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << =
PERF_REG_POWERPC_MMCR3) | \
> 	(1ul << PERF_REG_POWERPC_SIER2) | (1ul << =
PERF_REG_POWERPC_SIER3) | \
> 	(1ul << PERF_REG_POWERPC_PMC1) | (1ul << PERF_REG_POWERPC_PMC2) =
| \
> 	(1ul << PERF_REG_POWERPC_PMC3) | (1ul << PERF_REG_POWERPC_PMC4) =
| \
> 	(1ul << PERF_REG_POWERPC_PMC5) | (1ul << PERF_REG_POWERPC_PMC6))
>=20
>=20
> Also PERF_REG_EXTENDED_MAX should be part of the enum, just like
> PERF_REG_POWERPC_MAX.

Sure Michael,

I will address these changes in next version

Thanks
Athira
>=20
> cheers

