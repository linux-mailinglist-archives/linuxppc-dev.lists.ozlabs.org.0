Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3263E8F1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 12:55:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gl6D03ffWz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 20:55:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JgrYeYc4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JgrYeYc4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gl6CC1PZKz3019
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 20:54:30 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BAo4T2013162; Wed, 11 Aug 2021 06:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=sP32XbgQ5CzhWUiPsAQPXt4hxK55ieZaoOqPmBgd5MA=;
 b=JgrYeYc4pktKOkOylJfmQM4pkn17+Xlhbw0e1dKyJrT2zFQoe1/VuPE1uTWI6/2Gslxr
 MAxUke+v8IYhIVzv01h2ZVYtgq1mBUpuet+Aft5dW/dfW33MsDj8BeiBt31ZYngyW/XI
 7Ya5PbnWkjsC66hI3awviLs9YP0c0NtyHAw/Q6bCXjFK9NG+wrHzm5BGiRvPi6aZnltw
 cBmyad9l5bLC/k4z9OmLyz7Io9TSw846ijm9IpzuM9PhgmgdT7dWRpVsn7ocQLb8CkrQ
 EDRGMOfu5S8iKK7EeaWh6MUA6yt+r/svBoLc3bXplXW0t6okdA7/G+Nmh/HWl5UTfF18 jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abt14cekx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 06:54:26 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BArBKZ023058;
 Wed, 11 Aug 2021 06:54:25 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abt14cekb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 06:54:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BAr4sp028293;
 Wed, 11 Aug 2021 10:54:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3abtdnhpv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 10:54:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17BApAwW34210182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 10:51:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7759D42081;
 Wed, 11 Aug 2021 10:54:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95E6C42067;
 Wed, 11 Aug 2021 10:54:20 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.182.59])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 11 Aug 2021 10:54:20 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1 16/55] powerpc/64s: Implement PMU override command line
 option
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1628246339.762vtrxskz.astroid@bobo.none>
Date: Wed, 11 Aug 2021 16:24:16 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C3CA279-F9C6-463A-BE1E-8FC6BB5BDA21@linux.vnet.ibm.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-17-npiggin@gmail.com>
 <4600EC62-5505-4856-AE23-939ED62287B3@linux.vnet.ibm.com>
 <1628246339.762vtrxskz.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: izhRoOFnlzz4boZxfT_GGZvAxv1oN5N8
X-Proofpoint-GUID: S8ncV2I4xh-wkazU7b9daDzKZcqKM3H2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_03:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110069
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Aug-2021, at 4:12 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Athira Rajeev's message of August 6, 2021 7:28 pm:
>>=20
>>=20
>>> On 26-Jul-2021, at 9:19 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>>>=20
>>> It can be useful in simulators (with very constrained environments)
>>> to allow some PMCs to run from boot so they can be sampled directly
>>> by a test harness, rather than having to run perf.
>>>=20
>>> A previous change freezes counters at boot by default, so provide
>>> a boot time option to un-freeze (plus a bit more flexibility).
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>> .../admin-guide/kernel-parameters.txt         |  7 ++++
>>> arch/powerpc/perf/core-book3s.c               | 35 =
+++++++++++++++++++
>>> 2 files changed, 42 insertions(+)
>>>=20
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt =
b/Documentation/admin-guide/kernel-parameters.txt
>>> index bdb22006f713..96b7d0ebaa40 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -4089,6 +4089,13 @@
>>> 			Override pmtimer IOPort with a hex value.
>>> 			e.g. pmtmr=3D0x508
>>>=20
>>> +	pmu=3D		[PPC] Manually enable the PMU.
>>> +			Enable the PMU by setting MMCR0 to 0 (clear FC =
bit).
>>> +			This option is implemented for Book3S =
processors.
>>> +			If a number is given, then MMCR1 is set to that =
number,
>>> +			otherwise (e.g., 'pmu=3Don'), it is left 0. The =
perf
>>> +			subsystem is disabled if this option is used.
>>> +
>>> 	pm_debug_messages	[SUSPEND,KNL]
>>> 			Enable suspend/resume debug messages during boot =
up.
>>>=20
>>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>>> index 65795cadb475..e7cef4fe17d7 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -2428,8 +2428,24 @@ int register_power_pmu(struct power_pmu *pmu)
>>> }
>>>=20
>>> #ifdef CONFIG_PPC64
>>> +static bool pmu_override =3D false;
>>> +static unsigned long pmu_override_val;
>>> +static void do_pmu_override(void *data)
>>> +{
>>> +	ppc_set_pmu_inuse(1);
>>> +	if (pmu_override_val)
>>> +		mtspr(SPRN_MMCR1, pmu_override_val);
>>> +	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
>>=20
>> Hi Nick
>>=20
>> Here, we are not doing any validity check for the value used to set =
MMCR1.=20
>> For advanced users, the option to pass value for MMCR1 is fine. But =
other cases, it could result in
>> invalid event getting used. Do we need to restrict this boot time =
option for only PMC5/6 ?
>=20
> Depends what would be useful. We don't have to prevent the admin =
shooting=20
> themselves in the foot with options like this, but if we can make it=20=

> safer without making it less useful then that's always a good option.

Hi Nick

I checked back on my comment and it will be difficult to add/maintain =
validity check for MMCR1 considering different platforms that we have.
We can go ahead with present approach you have in this patch. Changes =
looks good to me.

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

>=20
> Thanks,
> Nick

