Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F32F3D0862
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 07:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV4Bv0Zmwz3bg8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 15:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WXoS460m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WXoS460m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV4BL6DNSz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 15:38:34 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L5Y2Lc033965
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 01:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=XLBV2v7vgvPjtxonQOulTbcxWTDxjtgB3nTPNB9u4Ac=;
 b=WXoS460mFhSrz2GxImUeeis4vblyEdV8iFEwmkgM+ofbcibEEYtstte9wcgllOe6Jpdr
 YBCn5hyFb/oJLrrrivoKFbTeoZJ/dHwODrFDHJzVTctgSa6WVV+YhB/uCdrk8mLJD2mg
 +FZhBF12RvgRfKLuYqrx1EBNlak2hJDCdfeSdVyisBdjVpp06HkVrxSutNFVNmAXqyMo
 i7PooIUYaIpY1TRnFngumlJp85BFgPd0LeyvkweSf30/yn64tWGxfns9smxOPOezddR1
 4vC0mzVI0znkJO1McUey3cq6UguTLP3BM6SCPDbS81qhCYCtuZYzGQNMSqnbWK0P1Euw JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xcjchbnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 01:38:30 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16L5bG0A052553
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 01:38:29 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xcjchbn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 01:38:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16L5bDf8030284;
 Wed, 21 Jul 2021 05:38:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39upu89p7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 05:38:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16L5a0ZM18219278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 05:36:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE7F35204F;
 Wed, 21 Jul 2021 05:38:23 +0000 (GMT)
Received: from [9.79.181.237] (unknown [9.79.181.237])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id BC4F752052;
 Wed, 21 Jul 2021 05:38:22 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [PATCH] powerpc/64s/perf: Always use SIAR for kernel interrupts
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210720141504.420110-1-npiggin@gmail.com>
Date: Wed, 21 Jul 2021 11:06:13 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3B701B8E-5C49-49A6-BAF7-246F42F7B0E7@linux.vnet.ibm.com>
References: <20210720141504.420110-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k-4EWvewWTS_8ilSwCEdBTnaBvEHII-Z
X-Proofpoint-GUID: tNVEEk2x67TGpgQuy8BaVAjZSlKZhmP7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_02:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210027
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20-Jul-2021, at 7:45 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> If an interrupt is taken in kernel mode, always use SIAR for it rather =
than
> looking at regs_sipr. This prevents samples piling up around interrupt
> enable (hard enable or interrupt replay via soft enable) in PMUs / =
modes
> where the PR sample indication is not in synch with SIAR.
>=20
> This results in better sampling of interrupt entry and exit in =
particular.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/perf/core-book3s.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index bb0ee716de91..91203ed9d0ff 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -340,6 +340,13 @@ static inline void perf_read_regs(struct pt_regs =
*regs)
> 	 * If the PMU doesn't update the SIAR for non marked events use
> 	 * pt_regs.
> 	 *
> +	 * If regs is a kernel interrupt, always use SIAR. Some PMUs =
have an
> +	 * issue with regs_sipr not being in synch with SIAR in =
interrupt entry
> +	 * and return sequences, which can result in regs_sipr being =
true for
> +	 * kernel interrupts and SIAR, which has the effect of causing =
samples
> +	 * to pile up at mtmsrd MSR[EE] 0->1 or pending irq replay =
around
> +	 * interrupt entry/exit.
> +	 *
> 	 * If the PMU has HV/PR flags then check to see if they
> 	 * place the exception in userspace. If so, use pt_regs. In
> 	 * continuous sampling mode the SIAR and the PMU exception are
> @@ -356,6 +363,8 @@ static inline void perf_read_regs(struct pt_regs =
*regs)
> 		use_siar =3D 1;
> 	else if ((ppmu->flags & PPMU_NO_CONT_SAMPLING))
> 		use_siar =3D 0;
> +	else if (!user_mode(regs))
> +		use_siar =3D 1;


Tested the change.

Workload used: Testcase that runs a loop of =E2=80=9Cscv=E2=80=9D =
syscalls

Before the patch:
# perf record <test>
# perf report|grep replay
     3.90%  scvonly  [kernel.vmlinux]            [k] =
replay_soft_interrupts

Samples were present around interrupt replay code.

After the fix, perf report didn=E2=80=99t had samples pointing to replay =
code.

Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> 	else if (!(ppmu->flags & PPMU_NO_SIPR) && regs_sipr(regs))
> 		use_siar =3D 0;
> 	else
> --=20
> 2.23.0
>=20

