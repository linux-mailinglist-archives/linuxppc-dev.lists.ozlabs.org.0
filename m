Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA492C0A79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 14:40:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfpDy6fvzzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 00:40:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IDEbVONX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfp4b0mt1zDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 00:33:02 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ANDW1jH132581; Mon, 23 Nov 2020 08:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=uQfPf7lxYWFIzZvo8E+WcGVX9ofWVutTwTDuwcURTg4=;
 b=IDEbVONXsAFAwHLW3t69o4kas+FJH/y9AaAcx/LdBKZqXUuxP6uYBS1XC6vuyMebd7p8
 /hHrfomWI1Lz85M6+5I+Bv+kUcFVQFTvO4izNtZseKN/o13sy3D5+MRllmvTuRKiy1K/
 lmHauxz4PftAXi75hEDk2dYndH3kjckSXm+M03nLUVmZ4xLkd2XdfArDQ2fQNtgl97QR
 XW1gvDIP8aTrMyHIcXVXif19UKRKLrlHUl+IJNJEp+ItrETgMvn8SfPb9olTGjBSqUhr
 OmyqxE1siMhPQoiO0vFE80av7Hq4H4w9gN4H+nOhG4TrZa6FPAHqotmUHsH+KizHbB/X Xg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xyrvjeup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 08:32:55 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ANDWL2k023518;
 Mon, 23 Nov 2020 13:32:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8aj1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 13:32:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ANDWp2u1901058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 13:32:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6641E42042;
 Mon, 23 Nov 2020 13:32:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D05EF42047;
 Mon, 23 Nov 2020 13:32:49 +0000 (GMT)
Received: from [9.79.228.11] (unknown [9.79.228.11])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 23 Nov 2020 13:32:49 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/perf: Fix crash with 'is_sier_available' when pmu
 is not set
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <877dqc1ftj.fsf@mpe.ellerman.id.au>
Date: Mon, 23 Nov 2020 19:02:46 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D64FB8E-0E4C-46FA-A533-CA45B5313CB7@linux.vnet.ibm.com>
References: <1606124997-3358-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <877dqc1ftj.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_09:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=744 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230088
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
Cc: sachinp@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 23-Nov-2020, at 4:49 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Hi Athira,
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On systems without any platform specific PMU driver support =
registered or
>> Generic Compat PMU support registered,
>=20
> The compat PMU is registered just like other PMUs, so I don't see how =
we
> can crash like this if the compat PMU is active?
>=20
> ie. if we're using the compat PMU then ppmu will be non-NULL and point
> to generic_compat_pmu.

Hi Michael,

Thanks for checking the patch.

Crash happens on systems which neither has compat PMU support registered =
nor=20
has Platform specific PMU. This happens when the distro do not have =
either the PMU=20
driver support for that platform or the generic "compat-mode" =
performance monitoring
driver support.=20

So in such cases since compat PMU is in-active, ppmu is not set and
results in crash. Sorry for the confusion with my first line. I will =
correct it.

>=20
>> running 'perf record' with
>> =E2=80=94intr-regs  will crash ( perf record -I <workload> ).
>>=20
>> The relevant portion from crash logs and Call Trace:
>>=20
>> Unable to handle kernel paging request for data at address 0x00000068
>> Faulting instruction address: 0xc00000000013eb18
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> CPU: 2 PID: 13435 Comm: kill Kdump: loaded Not tainted =
4.18.0-193.el8.ppc64le #1
>> NIP:  c00000000013eb18 LR: c000000000139f2c CTR: c000000000393d80
>> REGS: c0000004a07ab4f0 TRAP: 0300   Not tainted  =
(4.18.0-193.el8.ppc64le)
>> NIP [c00000000013eb18] is_sier_available+0x18/0x30
>> LR [c000000000139f2c] perf_reg_value+0x6c/0xb0
>> Call Trace:
>> [c0000004a07ab770] [c0000004a07ab7c8] 0xc0000004a07ab7c8 (unreliable)
>> [c0000004a07ab7a0] [c0000000003aa77c] perf_output_sample+0x60c/0xac0
>> [c0000004a07ab840] [c0000000003ab3f0] =
perf_event_output_forward+0x70/0xb0
>> [c0000004a07ab8c0] [c00000000039e208] =
__perf_event_overflow+0x88/0x1a0
>> [c0000004a07ab910] [c00000000039e42c] =
perf_swevent_hrtimer+0x10c/0x1d0
>> [c0000004a07abc50] [c000000000228b9c] =
__hrtimer_run_queues+0x17c/0x480
>> [c0000004a07abcf0] [c00000000022aaf4] hrtimer_interrupt+0x144/0x520
>> [c0000004a07abdd0] [c00000000002a864] timer_interrupt+0x104/0x2f0
>> [c0000004a07abe30] [c0000000000091c4] decrementer_common+0x114/0x120
>>=20
>> When perf record session started with "-I" option, capture registers
>                          ^
>                          is
>=20
>> via intr-regs,
>=20
> "intr-regs" is just the full name for the -I option, so that kind of
> repeats itself.
>=20
>> on each sample =E2=80=98is_sier_available()'i is called to check
>                                      ^
>                                      extra i
>=20
> The single quotes around is_sier_available() aren't necessary IMO.
>=20
>> for the SIER ( Sample Instruction Event Register) availability in the
>                ^
>                stray space
>> platform. This function in core-book3s access 'ppmu->flags'. If =
platform
>                                               ^                 ^
>                                               es                a
>> specific pmu driver is not registered, ppmu is set to null and =
accessing
>           ^                                            ^
>           PMU                                          NULL
>> its members results in crash. Patch fixes this by returning false in
>                        ^
>                        a
>> 'is_sier_available()' if 'ppmu' is not set.
>=20
> Use the imperative mood for the last sentence which says what the =
patch
> does:
>=20
>  Fix the crash by returning false in is_sier_available() if ppmu is =
not set.

Sure,  I will make all these changes as suggested.

Thanks
Athira
>=20
>=20
>> Fixes: 333804dc3b7a ("powerpc/perf: Update perf_regs structure to =
include SIER")
>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/perf/core-book3s.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 08643cb..1de4770 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -137,6 +137,9 @@ static void pmao_restore_workaround(bool ebb) { }
>>=20
>> bool is_sier_available(void)
>> {
>> +	if (!ppmu)
>> +		return false;
>> +
>> 	if (ppmu->flags & PPMU_HAS_SIER)
>> 		return true;
>>=20
>> --=20
>> 1.8.3.1
>=20
>=20
> cheers

