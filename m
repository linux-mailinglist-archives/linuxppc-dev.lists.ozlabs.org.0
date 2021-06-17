Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177323ABAEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 19:54:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5V7X4z2Dz3c4g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 03:54:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PxP6EC39;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PxP6EC39; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5V711DDMz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 03:54:19 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HHZ8YL186500; Thu, 17 Jun 2021 13:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=JIQJtg5D7iE1qi4pqSB3x9Xsmprcy0BA7EgdTc21EHs=;
 b=PxP6EC39H4wh4dPSaC1vv8A6x832pVhJgvxCfzRWwx+OHvG1N74UZtE54XugqBeHLYfe
 wX7noqoIir4Oz9kOEHKsrmkwsiGVYE7Q6QU4MVpMfZcALPR5kd/XaT/aOk+WGxQqdKyF
 NvtWkuzCl/M+ZJPjN6F3BtyATJMYXVUUOKXBIfWQHCYuDNcarERC0MXjaxKIlFk2c9Gt
 dAHihhN50AErgqH3Pmz4dwFANte9SYUmZUILU4PD+zVlyOycuhT08ZUldTe3mAjfCJpz
 xtzww9qaaRpuP5uu425HwqbRntaM6j00bJX3J8fp39KxGjWtkBKXmSTkmOLRCnOs9uuj zQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3989rganhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 13:54:10 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HHs8GX005458;
 Thu, 17 Jun 2021 17:54:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 394mj8sk90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 17:54:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HHs54H29163824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 17:54:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E9084C040;
 Thu, 17 Jun 2021 17:54:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4091D4C044;
 Thu, 17 Jun 2021 17:54:04 +0000 (GMT)
Received: from [9.195.40.41] (unknown [9.195.40.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Jun 2021 17:54:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <549cda2e-a7cf-5c69-d459-02ac62e75f24@csgroup.eu>
Date: Thu, 17 Jun 2021 23:21:54 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <851B12D3-2716-4F90-B393-0D7F96DDB689@linux.vnet.ibm.com>
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
 <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
 <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
 <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
 <2F349581-2E44-4C63-A75C-966FA32F26C2@linux.vnet.ibm.com>
 <549cda2e-a7cf-5c69-d459-02ac62e75f24@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ySBqEiEOma0Qr7-GfEnCvhXtEYkXsDhW
X-Proofpoint-GUID: ySBqEiEOma0Qr7-GfEnCvhXtEYkXsDhW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170110
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 17-Jun-2021, at 10:05 PM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 17/06/2021 =C3=A0 08:36, Athira Rajeev a =C3=A9crit :
>>> On 16-Jun-2021, at 11:56 AM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>>>=20
>>>=20
>>>=20
>>> Le 16/06/2021 =C3=A0 05:40, Athira Rajeev a =C3=A9crit :
>>>>> On 16-Jun-2021, at 8:53 AM, Madhavan Srinivasan =
<maddy@linux.ibm.com> wrote:
>>>>>=20
>>>>>=20
>>>>> On 6/15/21 8:35 PM, Christophe Leroy wrote:
>>>>>> For your information, I'm getting the following Oops. Detected =
with 5.13-rc6, it also oopses on 5.12 and 5.11.
>>>>>> Runs ok on 5.10. I'm starting bisecting now.
>>>>>=20
>>>>>=20
>>>>> Thanks for reporting, got the issue. What has happened in this =
case is that, pmu device is not registered
>>>>> and trying to access the instruction point which will land in =
perf_instruction_pointer(). And recently I have added
>>>>> a workaround patch for power10 DD1 which has caused this breakage. =
My bad. We are working on a fix patch
>>>>> for the same and will post it out. Sorry again.
>>>>>=20
>>>> Hi Christophe,
>>>> Can you please try with below patch in your environment and test if =
it works for you.
>>>> =46rom 55d3afc9369dfbe28a7152c8e9f856c11c7fe43d Mon Sep 17 00:00:00 =
2001
>>>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> Date: Tue, 15 Jun 2021 22:28:11 -0400
>>>> Subject: [PATCH] powerpc/perf: Fix crash with =
'perf_instruction_pointer' when
>>>> pmu is not set
>>>> On systems without any specific PMU driver support registered, =
running
>>>> perf record causes oops:
>>>> [   38.841073] NIP [c00000000013af54] =
perf_instruction_pointer+0x24/0x100
>>>> [   38.841079] LR [c0000000003c7358] =
perf_prepare_sample+0x4e8/0x820
>>>> [   38.841085] --- interrupt: 300
>>>> [   38.841088] [c00000001cf03440] [c0000000003c6ef8] =
perf_prepare_sample+0x88/0x820 (unreliable)
>>>> [   38.841096] [c00000001cf034a0] [c0000000003c76d0] =
perf_event_output_forward+0x40/0xc0
>>>> [   38.841104] [c00000001cf03520] [c0000000003b45e8] =
__perf_event_overflow+0x88/0x1b0
>>>> [   38.841112] [c00000001cf03570] [c0000000003b480c] =
perf_swevent_hrtimer+0xfc/0x1a0
>>>> [   38.841119] [c00000001cf03740] [c0000000002399cc] =
__hrtimer_run_queues+0x17c/0x380
>>>> [   38.841127] [c00000001cf037c0] [c00000000023a5f8] =
hrtimer_interrupt+0x128/0x2f0
>>>> [   38.841135] [c00000001cf03870] [c00000000002962c] =
timer_interrupt+0x13c/0x370
>>>> [   38.841143i] [c00000001cf038d0] [c000000000009ba4] =
decrementer_common_virt+0x1a4/0x1b0
>>>> [   38.841151] --- interrupt: 900 at copypage_power7+0xd4/0x1c0
>>>> During perf record session, perf_instruction_pointer() is called to
>>>> capture the sample ip. This function in core-book3s accesses =
ppmu->flags.
>>>> If a platform specific PMU driver is not registered, ppmu is set to =
NULL
>>>> and accessing its members results in a crash. Fix this crash by =
checking
>>>> if ppmu is set.
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>=20
>>> Fixes: 2ca13a4cc56c ("powerpc/perf: Use regs->nip when SIAR is =
zero")
>>> Cc: stable@vger.kernel.org
>>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Hi Christophe,
>> Thanks for testing with the change. I have a newer version where I =
have added braces around the check.
>> Can you please check once and can I add your tested-by for the below =
patch.
>=20
> Yes it works, you can add my Tested-by:
> Please also add Cc: stable@vger.kernel.org, this needs to be =
backported as soon as possible.

Sure Christophe, will add Cc also. Thanks for testing.

Athira
>=20
> Thanks
> Christophe

