Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9AC32E1E5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 06:53:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsH3h6Xx8z3dBj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rL2XB81k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rL2XB81k; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsH3F2bJ6z3cJq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 16:53:28 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1255XoZ8175849; Fri, 5 Mar 2021 00:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=c39ttEjLsLZEOdSgQosfwIEsd54cIco0DQ43D7yu7fA=;
 b=rL2XB81kQCupmXd0iTWZsadMJdeqdC+m7A4PVFgUaNjN12lapL7J0VjfxB+q1flXVfiY
 et2U89+wzYPzFjgAyg6OSTfGxwmEeyXA+QXfpFZfNeT6p1vl79qXDlZ1CAaSUKFtMmqg
 so+MUTMOzJ8b1Y+SmZyugq3q5SMGtWab5m7AGl4X3PM/I6pFNAeMTbFnUHBWoNZuaawE
 IcNruiHp3Otcw6GoP/f7Gq91LWP+JONwggQ1cn6/Gxa/cigYQ0J0EJCizAucyamZ7PWq
 Jt38gqrwP6fbdWlPnQmJR7mLfDChbdl0jl7PT/jjwa8SyWCKnDdEupIDQFjrAlX2X+i6 wg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373dvk1fme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 00:52:39 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1255mtDM002201;
 Fri, 5 Mar 2021 05:52:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37293fspwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 05:52:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1255qZ6U38666590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 05:52:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6703A4040;
 Fri,  5 Mar 2021 05:52:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EF91A4057;
 Fri,  5 Mar 2021 05:52:34 +0000 (GMT)
Received: from [9.195.33.8] (unknown [9.195.33.8])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Mar 2021 05:52:34 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/perf: prevent mixed EBB and non-EBB events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210224122116.221120-1-cascardo@canonical.com>
Date: Fri, 5 Mar 2021 11:20:25 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F791C89D-E644-43D3-8229-3618AF7DE2C2@linux.vnet.ibm.com>
References: <20210224122116.221120-1-cascardo@canonical.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_03:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050026
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24-Feb-2021, at 5:51 PM, Thadeu Lima de Souza Cascardo =
<cascardo@canonical.com> wrote:
>=20
> EBB events must be under exclusive groups, so there is no mix of EBB =
and
> non-EBB events on the same PMU. This requirement worked fine as perf =
core
> would not allow other pinned events to be scheduled together with =
exclusive
> events.
>=20
> This assumption was broken by commit 1908dc911792 ("perf: Tweak
> perf_event_attr::exclusive semantics").
>=20
> After that, the test cpu_event_pinned_vs_ebb_test started succeeding =
after
> read_events, but worse, the task would not have given access to PMC1, =
so
> when it tried to write to it, it was killed with "illegal =
instruction".
>=20
> Preventing mixed EBB and non-EBB events from being add to the same PMU =
will
> just revert to the previous behavior and the test will succeed.


Hi,

Thanks for checking this. I checked your patch which is fixing =
=E2=80=9Ccheck_excludes=E2=80=9D to make
sure all events must agree on EBB. But in the PMU group constraints, we =
already have check for
EBB events. This is in arch/powerpc/perf/isa207-common.c ( =
isa207_get_constraint function ).

<<>>
mask  |=3D CNST_EBB_VAL(ebb);
value |=3D CNST_EBB_MASK;
<<>>

But the above setting for mask and value is interchanged. We actually =
need to fix here.

Below patch should fix this:

diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..8b5eeb6fb2fb 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -447,8 +447,8 @@ int isa207_get_constraint(u64 event, unsigned long =
*maskp, unsigned long *valp,
         * EBB events are pinned & exclusive, so this should never =
actually
         * hit, but we leave it as a fallback in case.
         */
-       mask  |=3D CNST_EBB_VAL(ebb);
-       value |=3D CNST_EBB_MASK;
+       mask  |=3D CNST_EBB_MASK;
+       value |=3D CNST_EBB_VAL(ebb);
=20
        *maskp =3D mask;
        *valp =3D value;


Can you please try with this patch.

Thanks
Athira


>=20
> Fixes: 1908dc911792 (perf: Tweak perf_event_attr::exclusive semantics)
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> ---
> arch/powerpc/perf/core-book3s.c | 20 ++++++++++++++++----
> 1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 43599e671d38..d767f7944f85 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1010,9 +1010,25 @@ static int check_excludes(struct perf_event =
**ctrs, unsigned int cflags[],
> 			  int n_prev, int n_new)
> {
> 	int eu =3D 0, ek =3D 0, eh =3D 0;
> +	bool ebb =3D false;
> 	int i, n, first;
> 	struct perf_event *event;
>=20
> +	n =3D n_prev + n_new;
> +	if (n <=3D 1)
> +		return 0;
> +
> +	first =3D 1;
> +	for (i =3D 0; i < n; ++i) {
> +		event =3D ctrs[i];
> +		if (first) {
> +			ebb =3D is_ebb_event(event);
> +			first =3D 0;
> +		} else if (is_ebb_event(event) !=3D ebb) {
> +			return -EAGAIN;
> +		}
> +	}
> +
> 	/*
> 	 * If the PMU we're on supports per event exclude settings then =
we
> 	 * don't need to do any of this logic. NB. This assumes no PMU =
has both
> @@ -1021,10 +1037,6 @@ static int check_excludes(struct perf_event =
**ctrs, unsigned int cflags[],
> 	if (ppmu->flags & PPMU_ARCH_207S)
> 		return 0;
>=20
> -	n =3D n_prev + n_new;
> -	if (n <=3D 1)
> -		return 0;
> -
> 	first =3D 1;
> 	for (i =3D 0; i < n; ++i) {
> 		if (cflags[i] & PPMU_LIMITED_PMC_OK) {
> --=20
> 2.27.0
>=20

