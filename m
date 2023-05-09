Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B146FBE2F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 06:28:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFlXC5gs7z3fMZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 14:28:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OLVXtLj3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OLVXtLj3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFlWL08Fyz3chV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 14:27:41 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3493sbBn005936;
	Tue, 9 May 2023 04:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=jB5JRkyF2XWXfvcum99LG5Dt/GmP//3aVQWQP/+QGbE=;
 b=OLVXtLj3ff/BFCB4M6KXtJJTDYJfyIdzwuUABjUYYfHWQZ9BP3nDlgUWMcXd5szx5pt/
 gX2+MYuQFSj1J7qqZJAvNLVhnMZNk0UC3SDdduAqe0ZGsRqIrOHKfSKRzjwi7fia4LDW
 zZIpOEBfxluQEn7dhscs8B6bbtztFV9kwr+85m0y4QcWGDKkcAgW2YFsvh+4cxWlIwKt
 jv7nGESnCATC4Gw4lGYG4S/cR20N52Ga06Xbg9LTOVwoHV/vZYkadRx7Hjinc+xIcDW8
 CTQbB6sgon/Xe659wRfyZhBxhhFxf7gUh/TO8ayVZBZV6RmYGKg2Ay/j8ow+86fVTNKr yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfep3903y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 04:27:27 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3493vRbl014828;
	Tue, 9 May 2023 04:27:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfep39033-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 04:27:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 348N9hd7011689;
	Tue, 9 May 2023 04:27:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh057a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 04:27:24 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3494RMvo38404426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 May 2023 04:27:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1903C20043;
	Tue,  9 May 2023 04:27:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1781B20040;
	Tue,  9 May 2023 04:27:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 May 2023 04:27:21 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.0.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 68D2A60218;
	Tue,  9 May 2023 14:27:14 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 01/12] powerpc: qspinlock: Fix qnode->locked value
 interpretation
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CSHDKOPMRIG3.11WU7D9VOFHWE@wheely>
Date: Tue, 9 May 2023 14:26:59 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <114ACCFD-4CD7-4916-8484-C30F55FC269A@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-2-rmclure@linux.ibm.com>
 <CSHDKOPMRIG3.11WU7D9VOFHWE@wheely>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DysHmYCgDXoHPiKIgfK_fQUdzyzQOsEh
X-Proofpoint-ORIG-GUID: 8O0W8Fd_Mcdwsp7-2xCqrpyy67YKZhSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=926 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090030
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 9 May 2023, at 12:01 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
>> A comment accompanying the locked attribute of a qnode assigns a =
value
>> of 1 to mean that the lock has been acquired. The usages of this
>> variable however assume opposite semantics. Update usages so that the
>> assertions of this comment are reflected in this file.
>=20
> 1 actually means if the lock is acquired for this waiter. The
> previous owner sets it to 1 which means we now have the lock.
> It's slightly confusing but that's how generic qspinlock calls
> it too.
>=20
> It actually doesn't even really mean we have acquired the lock
> though, it means we got through the MCS queue. "Waiting" or
> "released" or something like that might be a better name.

This makes more sense. Seemed pretty unlikely to me that swapped
polarity have gone unnoticed, so glad to have that cleared up.

>=20
> Could change the name or comment to make that a bit clearer, but
> while it'the same as kernel/locking/qspinlock.c then better
> keep polarity the same.

Yeah since =E2=80=98locked=E2=80=99 is an mcs intrinsic I think I=E2=80=99=
d rather keep
the name from kernel/locking/qspinlock.c.

>=20
> Thanks,
> Nick
>=20
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> arch/powerpc/lib/qspinlock.c | 10 +++++-----
>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/powerpc/lib/qspinlock.c =
b/arch/powerpc/lib/qspinlock.c
>> index e4bd145255d0..9cf93963772b 100644
>> --- a/arch/powerpc/lib/qspinlock.c
>> +++ b/arch/powerpc/lib/qspinlock.c
>> @@ -435,7 +435,7 @@ static __always_inline bool yield_to_prev(struct =
qspinlock *lock, struct qnode *
>>=20
>> smp_rmb(); /* See __yield_to_locked_owner comment */
>>=20
>> - if (!node->locked) {
>> + if (node->locked) {
>> yield_to_preempted(prev_cpu, yield_count);
>> spin_begin();
>> return preempted;
>> @@ -566,7 +566,7 @@ static __always_inline void =
queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>> node->lock =3D lock;
>> node->cpu =3D smp_processor_id();
>> node->yield_cpu =3D -1;
>> - node->locked =3D 0;
>> + node->locked =3D 1;
>>=20
>> tail =3D encode_tail_cpu(node->cpu);
>>=20
>> @@ -584,7 +584,7 @@ static __always_inline void =
queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>>=20
>> /* Wait for mcs node lock to be released */
>> spin_begin();
>> - while (!node->locked) {
>> + while (node->locked) {
>> spec_barrier();
>>=20
>> if (yield_to_prev(lock, node, old, paravirt))
>> @@ -693,13 +693,13 @@ static __always_inline void =
queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>> */
>> if (paravirt && pv_prod_head) {
>> int next_cpu =3D next->cpu;
>> - WRITE_ONCE(next->locked, 1);
>> + WRITE_ONCE(next->locked, 0);
>> if (_Q_SPIN_MISO)
>> asm volatile("miso" ::: "memory");
>> if (vcpu_is_preempted(next_cpu))
>> prod_cpu(next_cpu);
>> } else {
>> - WRITE_ONCE(next->locked, 1);
>> + WRITE_ONCE(next->locked, 0);
>> if (_Q_SPIN_MISO)
>> asm volatile("miso" ::: "memory");
>> }
>> --=20
>> 2.37.2
>=20

