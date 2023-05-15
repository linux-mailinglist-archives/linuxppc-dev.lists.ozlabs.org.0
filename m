Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D317040DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 00:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKv3Z54PRz3f7k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 08:21:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=elPtVPZN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=elPtVPZN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKv2h6cpPz3bbZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 08:20:44 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34FM7qoP007760;
	Mon, 15 May 2023 22:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Szxr7opArwsJyrAZ5V+th5ThGtnnIABCLOGA5Dy3vZI=;
 b=elPtVPZN+seDkFMCg2FrONHyEzU26bderJWVCM8e1Lvvpz8P6r+oD84fEcF0ur/KLenv
 gvEnvaEiCUJT9/M6B0/tJ+8g8Iynr0s2KfqpK79eo9NrrQLMbUCL9eJUr/btso9xCdqr
 TryLOH5s0/L4hkDfR02kkVSuP8hLTP/TBE7ZA/oMe6aaDVawzkIMwcc0PAMBhhEgTkw5
 dgflHx5eIk/8Z2wOvZOuEjseWnyJ6TIKH+lu5gSB7pwy3KzcU2ir7DCK/sdvbKbKV8jM
 d7YYLOI9hplJEEtRTJsfXsBqEaydoBUstnaAMMi1QQFEzY5eJUOmHgkp/C7wm0pFXIQI FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkvy00n51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 22:20:30 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FMHjEv011226;
	Mon, 15 May 2023 22:20:30 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkvy00n45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 22:20:30 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F40v4R024749;
	Mon, 15 May 2023 22:20:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qj1tds9h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 22:20:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34FMKP9241812268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 May 2023 22:20:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40DB420067;
	Mon, 15 May 2023 22:20:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B65DD2005A;
	Mon, 15 May 2023 22:20:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 May 2023 22:20:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.22.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6C95860124;
	Tue, 16 May 2023 08:20:16 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 08/11] powerpc: Mark writes registering ipi to host cpu
 through kvm and polling
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CSMM9QLH8BRM.37WYXBTRCYB23@wheely>
Date: Tue, 16 May 2023 08:19:58 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4FE5E62-078B-47CB-B9E6-A6DF3AABDA1E@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-9-rmclure@linux.ibm.com>
 <CSMM9QLH8BRM.37WYXBTRCYB23@wheely>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 90AFQVh8OESO4GcjySV16Wc9BjYVY_dx
X-Proofpoint-ORIG-GUID: nisjDSDFMQ6DSchJAjooUEXgYwZTpEfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=731 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150182
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
Cc: gautam@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 15 May 2023, at 3:53 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
>> Mark writes to hypervisor ipi state so that KCSAN recognises these
>> asynchronous issue of kvmppc_{set,clear}_host_ipi to be intended, =
with
>> atomic writes. Mark asynchronous polls to this variable in
>> kvm_ppc_read_one_intr().
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>=20
> What's the go with accesses in asm? Does it just assume you know
> what you're doing?

Exactly, KCSAN only emits instrumentation calls to around load/store=20
instructions that the compiler itself generated. So by default, asm
accesses are not instrumented.

Thanks

>=20
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>> ---
>> v2: Add read-side annotations to both polling locations in
>> kvm_ppc_read_one_intr().
>> ---
>> arch/powerpc/include/asm/kvm_ppc.h   | 4 ++--
>> arch/powerpc/kvm/book3s_hv_builtin.c | 4 ++--
>> 2 files changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h =
b/arch/powerpc/include/asm/kvm_ppc.h
>> index bc57d058ad5b..d701df006c08 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -548,12 +548,12 @@ static inline void kvmppc_set_host_ipi(int cpu)
>> * pairs with the barrier in kvmppc_clear_host_ipi()
>> */
>> smp_mb();
>> - paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 1;
>> + WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
>> }
>>=20
>> static inline void kvmppc_clear_host_ipi(int cpu)
>> {
>> - paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 0;
>> + WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
>> /*
>> * order clearing of host_ipi flag vs. processing of IPI messages
>> *
>> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c =
b/arch/powerpc/kvm/book3s_hv_builtin.c
>> index da85f046377a..0f5b021fa559 100644
>> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
>> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
>> @@ -406,7 +406,7 @@ static long kvmppc_read_one_intr(bool *again)
>> return 1;
>>=20
>> /* see if a host IPI is pending */
>> - host_ipi =3D local_paca->kvm_hstate.host_ipi;
>> + host_ipi =3D READ_ONCE(local_paca->kvm_hstate.host_ipi);
>> if (host_ipi)
>> return 1;
>>=20
>> @@ -466,7 +466,7 @@ static long kvmppc_read_one_intr(bool *again)
>> * meantime. If it's clear, we bounce the interrupt to the
>> * guest
>> */
>> - host_ipi =3D local_paca->kvm_hstate.host_ipi;
>> + host_ipi =3D READ_ONCE(local_paca->kvm_hstate.host_ipi);
>> if (unlikely(host_ipi !=3D 0)) {
>> /* We raced with the host,
>> * we need to resend that IPI, bummer
>> --=20
>> 2.37.2
>=20

