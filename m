Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C56FBEA3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:28:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFms73TVfz3fLy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 15:28:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJEmtRoJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJEmtRoJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFmrD3XQ3z3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 15:27:24 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3495LoQs023822;
	Tue, 9 May 2023 05:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=qSxxuaqvCmjnJ3ncCrXV3ua5ghBl9PrWAOlAD9VXYTM=;
 b=NJEmtRoJdaTow4B00iWmFK8AUE5gnK43iI2iMHsG0e6aRrIJ/lW9Pjsl4KKVuE/6wzgG
 1hTGP0+xkqTJgsn7BYqiChc8NM1DvnE5xDo0f8eiB2eW0cK+PKQHpHMvqsoNwc3fhlml
 hFdK8V841QhWtAtaB/fZ6dFs5Y1MczOGEiUuxoXpVzWkblry6ur/kFLm9td/rRvCx0aM
 NXoes11NQksGUPou8Z2v4xCJeUR3Ok9JAr9diVPfmTnon8/bLzDQwyELEmaG3G+K9Avk
 GLI0rMWAVG05AMiGdyvHCW6PywYSigLFikPoXRrYWpaL+OatfrOg2LSSvPt+PXmpJ71p /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qffya83kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 05:27:13 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3495Lp58023873;
	Tue, 9 May 2023 05:27:12 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qffya83gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 05:27:12 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3495ORAA005484;
	Tue, 9 May 2023 05:27:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qf7mhg4w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 05:27:08 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3495R52T66584876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 May 2023 05:27:05 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9088D20043;
	Tue,  9 May 2023 05:27:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14DB320040;
	Tue,  9 May 2023 05:27:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 May 2023 05:27:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.0.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 74A75602FD;
	Tue,  9 May 2023 15:26:58 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 03/12] powerpc: qspinlock: Enforce qnode writes prior to
 publishing to queue
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CSHDN1VV09RD.2UWTR4MET4V2S@wheely>
Date: Tue, 9 May 2023 15:26:43 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <46600B7B-1E59-4B82-82DF-27D3B0473EEF@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-4-rmclure@linux.ibm.com>
 <CSHDN1VV09RD.2UWTR4MET4V2S@wheely>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L_tPeWqXQthG8ZZv84h3mku8hhWRFjm8
X-Proofpoint-ORIG-GUID: pdXKDtaSKcS9Ujrc0lnTK5GvM7IxuRo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090038
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 9 May 2023, at 12:04 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
>> Use a compiler barrier to enforce that all fields of a new struct =
qnode
>> be written to (especially the lock value) before publishing the qnode =
to
>> the waitqueue.
>=20
> publish_tail_cpu is the release barrier for this and includes the =
memory
> clobber there. Can we annotate that instead?

Got it, I see that one now.

On another note though, it looks like the memory clobber doesn=E2=80=99t =
serve
to squash KCSAN warnings here.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KCSAN: data-race in queued_spin_lock_slowpath / =
queued_spin_lock_slowpath

write (marked) to 0xc000000ff3790b20 of 1 bytes by task 1045 on cpu 64:

write (reordered) to 0xc000000ff3790b20 of 1 bytes by task 1063 on cpu =
31:
  |
  +-> reordered to: queued_spin_lock_slowpath+0xcec/0x1b70

Reported by Kernel Concurrency Sanitizer on:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The one byte memory access has to be =E2=80=98locked=E2=80=99 in this =
instance. KCSAN
takes issue with how the assignment of locked is unmarked in this
instance, even while during the epoch at which this assignment can =
occur,
the node is inaccessible. Looks like I=E2=80=99ll have to issue a =
data_race, even
while there is no capacity for a real data race.

>=20
> Thanks,
> Nick
>=20
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> arch/powerpc/lib/qspinlock.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/arch/powerpc/lib/qspinlock.c =
b/arch/powerpc/lib/qspinlock.c
>> index 579290d55abf..d548001a86be 100644
>> --- a/arch/powerpc/lib/qspinlock.c
>> +++ b/arch/powerpc/lib/qspinlock.c
>> @@ -567,6 +567,10 @@ static __always_inline void =
queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>> node->cpu =3D smp_processor_id();
>> node->yield_cpu =3D -1;
>> node->locked =3D 1;
>> + /*
>> + * Assign all attributes of a node before it can be published.
>> + */
>> + barrier();
>>=20
>> tail =3D encode_tail_cpu(node->cpu);
>>=20
>> --=20
>> 2.37.2
>=20

