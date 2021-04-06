Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035435590F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 18:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFCTp1t92z3bqZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 02:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fASIU+H1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fASIU+H1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFCTK65fcz2y8B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 02:21:41 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136G7aAp150753; Tue, 6 Apr 2021 12:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8irR3ZwSZ+/j2G1DtNcj8fk37Rd/c7OtNqWduMO/Eek=;
 b=fASIU+H1yJYP7tkbuslT7l5JvwepGnqDTckYeKavo9giE7Kd9iu/D+KgJf14agVt5PAK
 DYlVccK3qiB6gayoyTawWJ1YfdaRG8mg8a+8ffFfpMqvkz2ivVahcOetYIZzdt7B4Kr9
 dMgm7cZQjVYkZCNyF5t7HUoeh2LSZnciZUcMfZhz8ahJOqy2pDfdhaty/5ODqEsZmB4R
 6meytd0P1Cgq3sD3FXhH+7JVf6zCeSAQ9ALFtotIZLgkvTI/h5DdFYqE10HYdCYNWRhN
 kiFlkcw6EwBZY7E+rp8uPDv97wEDKjjoFrrwksnU4wDJ64ChbB81A07JXn0DFvRcQqka cw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5dvgd92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 12:21:29 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136GDUpD021687;
 Tue, 6 Apr 2021 16:21:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37q2q5ja8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 16:21:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 136GL3pF37224714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 16:21:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 861B9A404D;
 Tue,  6 Apr 2021 16:21:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F95CA4051;
 Tue,  6 Apr 2021 16:21:23 +0000 (GMT)
Received: from [9.79.187.191] (unknown [9.79.187.191])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Apr 2021 16:21:23 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] powerpc/perf: prevent mixed EBB and non-EBB events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <F791C89D-E644-43D3-8229-3618AF7DE2C2@linux.vnet.ibm.com>
Date: Tue, 6 Apr 2021 21:51:21 +0530
Message-Id: <0D709DAB-1C5A-4526-9BAB-11BE27E8DBCB@linux.vnet.ibm.com>
References: <20210224122116.221120-1-cascardo@canonical.com>
 <F791C89D-E644-43D3-8229-3618AF7DE2C2@linux.vnet.ibm.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: otPe-JK_96deTIe4c7SmpVOhFaHlCZn2
X-Proofpoint-ORIG-GUID: otPe-JK_96deTIe4c7SmpVOhFaHlCZn2
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_04:2021-04-06,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104030000
 definitions=main-2104060105
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



> On 05-Mar-2021, at 11:20 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> =
wrote:
>=20
>=20
>=20
>> On 24-Feb-2021, at 5:51 PM, Thadeu Lima de Souza Cascardo <cascardo@cano=
nical.com> wrote:
>>=20
>> EBB events must be under exclusive groups, so there is no mix of EBB and
>> non-EBB events on the same PMU. This requirement worked fine as perf core
>> would not allow other pinned events to be scheduled together with exclus=
ive
>> events.
>>=20
>> This assumption was broken by commit 1908dc911792 ("perf: Tweak
>> perf_event_attr::exclusive semantics").
>>=20
>> After that, the test cpu_event_pinned_vs_ebb_test started succeeding aft=
er
>> read_events, but worse, the task would not have given access to PMC1, so
>> when it tried to write to it, it was killed with "illegal instruction".
>>=20
>> Preventing mixed EBB and non-EBB events from being add to the same PMU w=
ill
>> just revert to the previous behavior and the test will succeed.
>=20
>=20
> Hi,
>=20
> Thanks for checking this. I checked your patch which is fixing =E2=80=9Cc=
heck_excludes=E2=80=9D to make
> sure all events must agree on EBB. But in the PMU group constraints, we a=
lready have check for
> EBB events. This is in arch/powerpc/perf/isa207-common.c ( isa207_get_con=
straint function ).
>=20
> <<>>
> mask  |=3D CNST_EBB_VAL(ebb);
> value |=3D CNST_EBB_MASK;
> <<>>
>=20
> But the above setting for mask and value is interchanged. We actually nee=
d to fix here.
>=20

Hi,

I have sent a patch for fixing this EBB mask/value setting.
This is the link to patch:

powerpc/perf: Fix PMU constraint check for EBB events
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D237669

Thanks
Athira

> Below patch should fix this:
>=20
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207=
-common.c
> index e4f577da33d8..8b5eeb6fb2fb 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -447,8 +447,8 @@ int isa207_get_constraint(u64 event, unsigned long *m=
askp, unsigned long *valp,
>         * EBB events are pinned & exclusive, so this should never actually
>         * hit, but we leave it as a fallback in case.
>         */
> -       mask  |=3D CNST_EBB_VAL(ebb);
> -       value |=3D CNST_EBB_MASK;
> +       mask  |=3D CNST_EBB_MASK;
> +       value |=3D CNST_EBB_VAL(ebb);
>=20
>        *maskp =3D mask;
>        *valp =3D value;
>=20
>=20
> Can you please try with this patch.
>=20
> Thanks
> Athira
>=20
>=20
>>=20
>> Fixes: 1908dc911792 (perf: Tweak perf_event_attr::exclusive semantics)
>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
>> ---
>> arch/powerpc/perf/core-book3s.c | 20 ++++++++++++++++----
>> 1 file changed, 16 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-bo=
ok3s.c
>> index 43599e671d38..d767f7944f85 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1010,9 +1010,25 @@ static int check_excludes(struct perf_event **ctr=
s, unsigned int cflags[],
>> 			  int n_prev, int n_new)
>> {
>> 	int eu =3D 0, ek =3D 0, eh =3D 0;
>> +	bool ebb =3D false;
>> 	int i, n, first;
>> 	struct perf_event *event;
>>=20
>> +	n =3D n_prev + n_new;
>> +	if (n <=3D 1)
>> +		return 0;
>> +
>> +	first =3D 1;
>> +	for (i =3D 0; i < n; ++i) {
>> +		event =3D ctrs[i];
>> +		if (first) {
>> +			ebb =3D is_ebb_event(event);
>> +			first =3D 0;
>> +		} else if (is_ebb_event(event) !=3D ebb) {
>> +			return -EAGAIN;
>> +		}
>> +	}
>> +
>> 	/*
>> 	 * If the PMU we're on supports per event exclude settings then we
>> 	 * don't need to do any of this logic. NB. This assumes no PMU has both
>> @@ -1021,10 +1037,6 @@ static int check_excludes(struct perf_event **ctr=
s, unsigned int cflags[],
>> 	if (ppmu->flags & PPMU_ARCH_207S)
>> 		return 0;
>>=20
>> -	n =3D n_prev + n_new;
>> -	if (n <=3D 1)
>> -		return 0;
>> -
>> 	first =3D 1;
>> 	for (i =3D 0; i < n; ++i) {
>> 		if (cflags[i] & PPMU_LIMITED_PMC_OK) {
>> --=20
>> 2.27.0

