Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805F4043BB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 04:49:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4k4N03Qzz2yhd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 12:49:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JzkDxYmy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JzkDxYmy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4k3W1mr1z2xY2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 12:48:54 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1892XY2g048577; Wed, 8 Sep 2021 22:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=jW2BZNBaq/UGvO3DPAd/IdZfvok54pwN90LZ2Az/gZo=;
 b=JzkDxYmyaC59gZVrDEG9i0TpvSrzLSUyd+r1lTyb9AXlHLSPv5WmfwFgkqM/UXHKkXB+
 bMKW778nsCPBIBvvAr2XcVh1ETUIJhYy2xF/QvupB7LAmzsquwLamGOSffojqkPdfA10
 NpInmJM43NOsE/OVUw5cDf+NWfvQ8Ns1LG94cSkpDO3CIgP0FsMnCVsoOSFbttWCh0un
 d9GuIBIhk4Dg5udcZHgjGIUgZHZBSxvaqTMAd7tsW/7AAYLB0hgqYE7XU/teIqG+BaO2
 JUqUuBHU9SAbMmNsKCaeAFXy9wOfO43z9YC73e6q7CQ8r08nLgahiRHpaT/KGYhS5Mte yg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ay9hr892m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 22:48:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1892lZnA017512;
 Thu, 9 Sep 2021 02:48:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3axcnpfgqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 02:48:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1892iOoI49545578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Sep 2021 02:44:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34ED74C052;
 Thu,  9 Sep 2021 02:48:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 761554C044;
 Thu,  9 Sep 2021 02:48:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.177.172])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Sep 2021 02:48:39 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] powerpc/perf: Expose instruction and data address
 registers as part of extended regs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87pmtjmysk.fsf@mpe.ellerman.id.au>
Date: Thu, 9 Sep 2021 08:18:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <38CCAAE2-A157-4689-B774-43FC48883699@linux.vnet.ibm.com>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1624200360-1429-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87pmtjmysk.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yt3ZJr0kOGaIrwzgQww7WuuqAwI2lvvY
X-Proofpoint-ORIG-GUID: yt3ZJr0kOGaIrwzgQww7WuuqAwI2lvvY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_10:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090014
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



> On 08-Sep-2021, at 10:47 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> Patch adds support to include Sampled Instruction Address Register
>> (SIAR) and Sampled Data Address Register (SDAR) SPRs as part of =
extended
>> registers. Update the definition of PERF_REG_PMU_MASK_300/31 and
>> PERF_REG_EXTENDED_MAX to include these SPR's.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
>> arch/powerpc/perf/perf_regs.c             |  4 ++++
>> 2 files changed, 11 insertions(+), 5 deletions(-)
>>=20
> ...
>> diff --git a/arch/powerpc/perf/perf_regs.c =
b/arch/powerpc/perf/perf_regs.c
>> index b931eed..51d31b6 100644
>> --- a/arch/powerpc/perf/perf_regs.c
>> +++ b/arch/powerpc/perf/perf_regs.c
>> @@ -90,7 +90,11 @@ static u64 get_ext_regs_value(int idx)
>> 		return mfspr(SPRN_SIER2);
>> 	case PERF_REG_POWERPC_SIER3:
>> 		return mfspr(SPRN_SIER3);
>> +	case PERF_REG_POWERPC_SDAR:
>> +		return mfspr(SPRN_SDAR);
>> #endif
>> +	case PERF_REG_POWERPC_SIAR:
>> +		return mfspr(SPRN_SIAR);
>> 	default: return 0;
>> 	}
>=20
> This file is built for all powerpc configs that have PERF_EVENTS. =
Which
> includes CPUs that don't have SDAR or SIAR.
>=20
> Don't we need checks in perf_reg_value() like we do for SIER?

Hi Michael,

Thanks for the review.

SIER is part of PERF_REG_PMU_MASK and hence check is needed to see if =
platform supports SIER.
Incase of extended regs, they are part of PERF_REG_EXTENDED_MASK and =
this mask is
filled with supported registers while registering the PMU ( ie during =
init_power9/10_pmu ). So these registers will be added
only for supported platforms. The validity of extended mask is also done =
in PMU common code=20
( In kernel/events/core.c with PERF_REG_EXTENDED_MASK check ). So an =
unsupported platform requesting for extended
registers won=E2=80=99t get it.

Thanks
Athira
>=20
> I guess we already got this wrong when we added the Power10 registers,
> SIER2/3 etc.
>=20
> cheers

