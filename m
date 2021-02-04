Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B430F309
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 13:21:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWd1m1sNBzDsTK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 23:21:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NiRvg44h; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWctW1jHqzDrQP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 23:14:43 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114C2iAR195934; Thu, 4 Feb 2021 07:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=AC/6SFl8Ah8TOlUuDuCa3LjMe8VGm9DpiMsAHY75Gno=;
 b=NiRvg44hBlcvMIm9aLoA4aklhVgv4YLQyHtGkcMhXI+fTY0HkPHQoTebUdvA8w4miaR4
 S4Lk5XPdeMYKB4bu41e3eDjJgdw1xpM4O6FBtFIOWhtocJT3PLHERSQnZmudG592aS2M
 B7EZcFAAvII044ChwanDezU9IHQkDtIxZrroL0LUMLJZDSNjmsozykjkX+/an2Rj7Ykl
 nbu7Xm1WorgsgEAATYYwxun+Sw9yBeqYH7oh9SMrUVbaE+O3kVhixyc6WfAlgr+rmExy
 QJBfhCCNirr0jZKbqpDkyfB0pUlmLz7qVzkA3s+NEm7dFiq2phd136qPvnSfPCsKhh+o 7Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gg9sh7k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 07:14:35 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114CCQ1Y031701;
 Thu, 4 Feb 2021 12:14:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 36fwcw0w18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 12:14:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 114CEL7020447494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 12:14:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8A2B4C044;
 Thu,  4 Feb 2021 12:14:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 158594C046;
 Thu,  4 Feb 2021 12:14:29 +0000 (GMT)
Received: from [9.79.225.8] (unknown [9.79.225.8])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  4 Feb 2021 12:14:28 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 3/3] tools/perf: Add perf tools support to expose
 Performance Monitor Counter SPRs as part of extended regs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210203162520.GG854763@kernel.org>
Date: Thu, 4 Feb 2021 17:44:26 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE16F122-E870-4DEE-91AF-557584545773@linux.vnet.ibm.com>
References: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1612335337-1888-4-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210203162520.GG854763@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_06:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040073
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
Cc: kjain@linux.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 03-Feb-2021, at 9:55 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Wed, Feb 03, 2021 at 01:55:37AM -0500, Athira Rajeev escreveu:
>> To enable presenting of Performance Monitor Counter Registers
>> (PMC1 to PMC6) as part of extended regsiters, patch adds these
>> to sample_reg_mask in the tool side (to use with -I? option).
>>=20
>> Simplified the PERF_REG_PMU_MASK_300/31 definition. Excluded the
>> unsupported SPRs (MMCR3, SIER2, SIER3) from extended mask value for
>> CPU_FTR_ARCH_300.
>=20
> Applied just 3/3, the tooling part, to my local branch, please holler =
if
> I should wait a bit more.
>=20
> - Arnaldo
>=20

Thanks Arnaldo for taking the tool side changes.

Athira.

>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/arch/powerpc/include/uapi/asm/perf_regs.h | 28 =
+++++++++++++++++++------
>> tools/perf/arch/powerpc/include/perf_regs.h     |  6 ++++++
>> tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++
>> 3 files changed, 34 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> index bdf5f10f8b9f..578b3ee86105 100644
>> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> @@ -55,17 +55,33 @@ enum perf_event_powerpc_regs {
>> 	PERF_REG_POWERPC_MMCR3,
>> 	PERF_REG_POWERPC_SIER2,
>> 	PERF_REG_POWERPC_SIER3,
>> +	PERF_REG_POWERPC_PMC1,
>> +	PERF_REG_POWERPC_PMC2,
>> +	PERF_REG_POWERPC_PMC3,
>> +	PERF_REG_POWERPC_PMC4,
>> +	PERF_REG_POWERPC_PMC5,
>> +	PERF_REG_POWERPC_PMC6,
>> 	/* Max regs without the extended regs */
>> 	PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,
>> };
>>=20
>> #define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
>>=20
>> -/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
>> -#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + =
1)) - 1) - PERF_REG_PMU_MASK)
>> -/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
>> -#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + =
1)) - 1) - PERF_REG_PMU_MASK)
>> +/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
>> +#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << =
PERF_REG_POWERPC_MMCR3)
>>=20
>> -#define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
>> -#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
>> +/*
>> + * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
>> + * includes 9 SPRS from MMCR0 to PMC6 excluding the
>> + * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
>> + */
>> +#define PERF_REG_PMU_MASK_300   ((0xfffULL << =
PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
>> +
>> +/*
>> + * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
>> + * includes 12 SPRs from MMCR0 to PMC6.
>> + */
>> +#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
>> +
>> +#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
>> #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
>> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h =
b/tools/perf/arch/powerpc/include/perf_regs.h
>> index 63f3ac91049f..98b6f9eabfc3 100644
>> --- a/tools/perf/arch/powerpc/include/perf_regs.h
>> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
>> @@ -71,6 +71,12 @@
>> 	[PERF_REG_POWERPC_MMCR3] =3D "mmcr3",
>> 	[PERF_REG_POWERPC_SIER2] =3D "sier2",
>> 	[PERF_REG_POWERPC_SIER3] =3D "sier3",
>> +	[PERF_REG_POWERPC_PMC1] =3D "pmc1",
>> +	[PERF_REG_POWERPC_PMC2] =3D "pmc2",
>> +	[PERF_REG_POWERPC_PMC3] =3D "pmc3",
>> +	[PERF_REG_POWERPC_PMC4] =3D "pmc4",
>> +	[PERF_REG_POWERPC_PMC5] =3D "pmc5",
>> +	[PERF_REG_POWERPC_PMC6] =3D "pmc6",
>> };
>>=20
>> static inline const char *perf_reg_name(int id)
>> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c =
b/tools/perf/arch/powerpc/util/perf_regs.c
>> index 2b6d4704e3aa..8116a253f91f 100644
>> --- a/tools/perf/arch/powerpc/util/perf_regs.c
>> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
>> @@ -68,6 +68,12 @@
>> 	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
>> 	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
>> 	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
>> +	SMPL_REG(pmc1, PERF_REG_POWERPC_PMC1),
>> +	SMPL_REG(pmc2, PERF_REG_POWERPC_PMC2),
>> +	SMPL_REG(pmc3, PERF_REG_POWERPC_PMC3),
>> +	SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
>> +	SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
>> +	SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
>> 	SMPL_REG_END
>> };
>>=20
>> --=20
>> 1.8.3.1
>>=20
>=20
> --=20
>=20
> - Arnaldo

