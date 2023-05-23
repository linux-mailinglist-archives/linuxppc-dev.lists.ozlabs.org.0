Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968BA70CF50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 02:37:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQFl13GgNz3f6Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 10:37:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UKGr1hdq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UKGr1hdq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQFk70Qm3z2ynp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 10:36:30 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N0MOcD019420;
	Tue, 23 May 2023 00:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=mkxhpB5st0uWEgre5WOH2ED3LF2u2T7ZnLtWY2P5lC0=;
 b=UKGr1hdq4oJC3XCDqqUMvwAXyDXiFgjrHGD99U7FMiAC63mAQT1bUl8sftxmAjhSeoyg
 7MAURV7FIx4t9GX88sPwXmfobl3Vc9hze/rKXqJWh8a+Uic0JY5Gs2kU3PSqATzzcNNQ
 GcMFUtfJ9R+at/8VYFmPtKjW7U3+DQmuzNm6QeV37wJB6pOIQ0fPQ9glwg3G9NDqHdQc
 zxyp28815+04BHc5Tl414/y0rFAPoTVang/Hx9fxKioX/y70JmwX6dqMAU2VdroDS1xa
 cbLiAjEV4FD1b+qjrZVI+t5CbXGVQSGPN8Nq3yKltwVnkY6wb1lmTTWoURVhRCSVXfAU GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrjfv8rfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 00:36:20 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34N0G1pi032101;
	Tue, 23 May 2023 00:36:20 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrjfv8rer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 00:36:20 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34MMlPUS004080;
	Tue, 23 May 2023 00:36:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qppcu96n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 00:36:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34N0aFgi34210424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 00:36:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9561520043;
	Tue, 23 May 2023 00:36:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7BB20040;
	Tue, 23 May 2023 00:36:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 May 2023 00:36:14 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 26B9B600BB;
	Tue, 23 May 2023 10:36:13 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 03/11] asm-generic/mmiowb: Mark accesses to fix KCSAN
 warnings
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <B7DB5697-89CE-4C9A-BA98-F7F3017BE523@linux.ibm.com>
Date: Tue, 23 May 2023 10:36:02 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <25DD62E7-0F18-4BF5-A407-675F0BAC54C9@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-4-rmclure@linux.ibm.com>
 <B7DB5697-89CE-4C9A-BA98-F7F3017BE523@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dRQGlnJVZaggpeW1o9dKBtHU5iaoT9qA
X-Proofpoint-ORIG-GUID: 8i-CeNuqJ_kgoDPTTH2n65gbYeas8BGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230002
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
Cc: gautam@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23 May 2023, at 10:28 am, Rohan McLure <rmclure@linux.ibm.com> wrote:
>=20
> On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
>> Prior to this patch, data races are detectable by KCSAN of the =
following
>> forms:
>>=20
>> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt =
context
>>    or otherwise outside of a critical section
>> [2] Interrupted critical sections, where the interrupt will itself
>>    acquire a lock
>>=20
>> In case [1], calling context does not need an mmiowb() call to be
>> issued, otherwise it would do so itself. Such calls to
>> mmiowb_set_pending() are either idempotent or no-ops.
>>=20
>> In case [2], irrespective of when the interrupt occurs, the interrupt
>> will acquire and release its locks prior to its return, nesting_count
>> will continue balanced. In the worst case, the interrupted critical
>> section during a mmiowb_spin_unlock() call observes an mmiowb to be
>> pending and afterward is interrupted, leading to an extraneous call =
to
>> mmiowb(). This data race is clearly innocuous.
>>=20
>> Mark all potentially asynchronous memory accesses with READ_ONCE or
>> WRITE_ONCE, including increments and decrements to nesting_count. =
This
>> has the effect of removing KCSAN warnings at consumer's callsites.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>> Reported-by: Gautam Menghani <gautam@linux.ibm.com>
>> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> v2: Remove extraneous READ_ONCE in mmiowb_set_pending for =
nesting_count
>> ---
>> include/asm-generic/mmiowb.h | 14 +++++++++-----
>> 1 file changed, 9 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/include/asm-generic/mmiowb.h =
b/include/asm-generic/mmiowb.h
>> index 5698fca3bf56..6dea28c8835b 100644
>> --- a/include/asm-generic/mmiowb.h
>> +++ b/include/asm-generic/mmiowb.h
>> @@ -37,25 +37,29 @@ static inline void mmiowb_set_pending(void)
>> struct mmiowb_state *ms =3D __mmiowb_state();
>>=20
>> if (likely(ms->nesting_count))
>> - ms->mmiowb_pending =3D ms->nesting_count;
>> + WRITE_ONCE(ms->mmiowb_pending, ms->nesting_count);
>> }
>>=20
>> static inline void mmiowb_spin_lock(void)
>> {
>> struct mmiowb_state *ms =3D __mmiowb_state();
>> - ms->nesting_count++;
>> +
>> + /* Increment need not be atomic. Nestedness is balanced over =
interrupts. */
>> + WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) + 1);
>> }
>>=20
>> static inline void mmiowb_spin_unlock(void)
>> {
>> struct mmiowb_state *ms =3D __mmiowb_state();
>> + u16 pending =3D READ_ONCE(ms->mmiowb_pending);
>>=20
>> - if (unlikely(ms->mmiowb_pending)) {
>> - ms->mmiowb_pending =3D 0;
>> + WRITE_ONCE(ms->mmiowb_pending, 0);
>> + if (unlikely(pending)) {
>> mmiowb();
>> }
>>=20
>> - ms->nesting_count--;
>> + /* Decrement need not be atomic. Nestedness is balanced over =
interrupts. */
>> + WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) - 1);
>=20
> Still think the nesting_counts don't need WRITE_ONCE/READ_ONCE.
> data_race() maybe but I don't know if it's even classed as a data
> race. How does KCSAN handle/annotate preempt_count, for example?

Wow sorry my mail client has some unhelpful keybindings - I don=E2=80=99t =
know why it
thought I=E2=80=99d want to resend your last item!

Yeah I agree, we don=E2=80=99t need the compiler guarantees of =
WRITE_ONCE/READ_ONCE, and
yet it=E2=80=99s also not a real data-race. I think I=E2=80=99ll apply =
data_race() and comment as
I=E2=80=99m still seeing KCSAN warnings here.

Just from inspection, it appears as if __preempt_count_{add,sub} are =
unmarked and
so likely to generate KCSAN warnings also, but also =
asm-generic/preempt.h I think
hasn=E2=80=99t been updated to address any such warnings.

>=20
> Thanks,
> Nick


