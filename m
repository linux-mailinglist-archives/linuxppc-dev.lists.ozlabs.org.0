Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928541EAE6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 12:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLR0r26wdz3bXt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 20:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M1IiTZ5a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M1IiTZ5a; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLR012Mh7z2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 20:18:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1919lw43005813; 
 Fri, 1 Oct 2021 06:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ET5dTl0melZO642r57Ft73+CnYCkGIC7Aer0oigetZ0=;
 b=M1IiTZ5ast1vBvb2/AtTqTzynuyNzcjHZMeyjB/YrAzKxiXy8gTv4CXoCix8FKo1SCtG
 SimlsJ+InUcenYwA4c4kwmZJsDbp5HCTtW+dVUJsZrrWoKhhBLKCwoJpH3QwegIYsH9p
 PkL09MhEtaxvMcphBqJFnVehwU5ksMRGlKcnTJ2hnOsNNpVW7c2DBm/x8TjfSbsc8KhF
 O5QhJ2bodNQq16EXtObLjRYh2AgXCnm/yKatWJ7IaAjEqb8FJOCemWnNVgQBXKJuG3Dg
 +rSOPv65xqlHOXop8RVYGRZYazHIDkztwYbf6ilKimFeqA3wB8PGvqcqvJ7hVg2zNWRu HA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bdyrm0vch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 06:18:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 191AGPmb012187;
 Fri, 1 Oct 2021 10:18:13 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3b9udan0tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 10:18:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 191AD2m360359100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Oct 2021 10:13:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 702E14C04A;
 Fri,  1 Oct 2021 10:18:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B27044C050;
 Fri,  1 Oct 2021 10:18:07 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.193.131])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  1 Oct 2021 10:18:07 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [V2 2/4] tools/perf: Refactor the code definition of perf reg
 extended mask in tools side header file
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87o889mfl3.fsf@linkitivity.dja.id.au>
Date: Fri, 1 Oct 2021 15:48:05 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <D220C664-003D-4E7F-94DF-77B69BD29904@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
 <20210930122055.1390-3-atrajeev@linux.vnet.ibm.com>
 <87o889mfl3.fsf@linkitivity.dja.id.au>
To: Daniel Axtens <dja@axtens.net>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9XnxGQPKnPjdEAVgiWLy4I9ugvpYIj8-
X-Proofpoint-ORIG-GUID: 9XnxGQPKnPjdEAVgiWLy4I9ugvpYIj8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-10-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110010067
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>, jolsa@kernel.org,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 01-Oct-2021, at 11:50 AM, Daniel Axtens <dja@axtens.net> wrote:
>=20
> Hi Athira,
>=20
>> PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 defines the mask
>> value for extended registers. Current definition of these mask values
>> uses hex constant and does not use registers by name, making it less
>> readable. Patch refactor the macro values in perf tools side header =
file
>> by or'ing together the actual register value constants.
>>=20
> This looks like a good simplification.
>=20
>> -/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
>> -#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << =
PERF_REG_POWERPC_MMCR3)
>=20
> This file is uAPI - are we allowed to remove a define? Could a program
> built against these headers now fail to compile because we've removed =
it?

Hi Daniel,

Thanks for the review.
My bad, you are right. I will correct this in version3 by retaining this =
define and refactoring the macro.

>=20
>> -
>> /*
>>  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
>>  * includes 9 SPRS from MMCR0 to PMC6 excluding the
>> - * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
>> + * unsupported SPRS MMCR3, SIER2 and SIER3.
>>  */
>> -#define PERF_REG_PMU_MASK_300   ((0xfffULL << =
PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
>> +#define PERF_REG_PMU_MASK_300	\
>> +	((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << =
PERF_REG_POWERPC_MMCR1) | \
>> +	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << PERF_REG_POWERPC_PMC1) =
| \
>> +	(1ul << PERF_REG_POWERPC_PMC2) | (1ul << PERF_REG_POWERPC_PMC3) =
| \
>> +	(1ul << PERF_REG_POWERPC_PMC4) | (1ul << PERF_REG_POWERPC_PMC5) =
| \
>> +	(1ul << PERF_REG_POWERPC_PMC6))
>>=20
>> /*
>>  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
>>  * includes 12 SPRs from MMCR0 to PMC6.
>>  */
>> -#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
>> +#define PERF_REG_PMU_MASK_31	\
>> +	(PERF_REG_PMU_MASK_300 | (1ul << PERF_REG_POWERPC_MMCR3) | \
>> +	(1ul << PERF_REG_POWERPC_SIER2) | (1ul << =
PERF_REG_POWERPC_SIER3))
>>=20
>> -#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
>=20
> Likewise for this define?
>=20
> I think this might also be an issue for some of your other patches =
which
> change an include/uapi/ file.

Though I am removing PERF_REG_EXTENDED_MAX define from end of this uapi =
file, it is moved along with enum definition of perf_event_powerpc_regs.
So we should be good with moving this define from this place.

Thanks
Athira=20
>=20
> Kind regards,
> Daniel
>=20
>> --=20
>> 2.30.1 (Apple Git-130)

