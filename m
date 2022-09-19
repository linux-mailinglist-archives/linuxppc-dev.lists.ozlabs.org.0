Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBC5BCDAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 15:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWR1g6Ymdz3bc5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 23:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WZc9s0LY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WZc9s0LY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWR0t4sslz3bSV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 23:51:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JDiPiR026055;
	Mon, 19 Sep 2022 13:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=X3zqdkGp5J6u8gWAXmGyY0EZphgC32I9VOUpv5JaKfM=;
 b=WZc9s0LYBuqj3RkmGyTprz23pQ20ZKCSWOuj6yF5rKdPwY/RzIo0eBYbQ5I0+ZOqtnlm
 k3gbcQtGCDfaHytXeUwNAue4qtbYEsdK338Ht3ZAAvT5MzAu1v3rTwvBiEcTIRW+csJE
 /HgYtsorvxaXfUARS6037ErRhZ8Q2SDCZ4j57qoGhQcH9mB1n3iTOn98ZUDmzP2OLJ/h
 5yZ33uAIrFIsOA7RxaLyg8g3bz7KMY0gie8EPqrg1zNnWMBfUBD2C/hhW7VGAnXSwTSZ
 zeECRsWfWRzi8kYvmyRhRRBnGCrnD+JN4hwH+9HACw4BFG/T32IPlJ4iOLAQXwAl751P MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpsjrg7gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 13:51:18 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28JDjSmM029853;
	Mon, 19 Sep 2022 13:51:18 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpsjrg7g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 13:51:18 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28JDooZO027922;
	Mon, 19 Sep 2022 13:51:17 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3jn5v95sy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 13:51:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28JDpGJd13238946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 13:51:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F2E66A04F;
	Mon, 19 Sep 2022 13:51:16 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2881A6A04D;
	Mon, 19 Sep 2022 13:51:16 +0000 (GMT)
Received: from localhost (unknown [9.65.100.1])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 19 Sep 2022 13:51:15 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>,
        Leonardo =?utf-8?Q?Br=C3=A1s?=
 <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <87h717t24d.fsf@linux.ibm.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo> <87h717t24d.fsf@linux.ibm.com>
Date: Mon, 19 Sep 2022 08:51:16 -0500
Message-ID: <87illjqxpn.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 84LNHRc5jMhLT5T0-43Q5MmAVJ4GwOtH
X-Proofpoint-ORIG-GUID: H_5hr8JAB8VM23vhBHPfQ93S27R-NBpj
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190091
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Br=C3=A1s wrote:
>>> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
>>> > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>>> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
>>> > > > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>>> > > > > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
>>> > > > > > At the time this was submitted by Leonardo, I confirmed -- or=
 thought
>>> > > > > > I had confirmed -- with PowerVM partition firmware developmen=
t that
>>> > > > > > the following RTAS functions:
>>> > > > > >=20
>>> > > > > > - ibm,get-xive
>>> > > > > > - ibm,int-off
>>> > > > > > - ibm,int-on
>>> > > > > > - ibm,set-xive
>>> > > > > >=20
>>> > > > > > were safe to call on multiple CPUs simultaneously, not only w=
ith
>>> > > > > > respect to themselves as indicated by PAPR, but with arbitrar=
y other
>>> > > > > > RTAS calls:
>>> > > > > >=20
>>> > > > > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm=
.com/
>>> > > > > >=20
>>> > > > > > Recent discussion with firmware development makes it clear th=
at this
>>> > > > > > is not true, and that the code in commit b664db8e3f97 ("power=
pc/rtas:
>>> > > > > > Implement reentrant rtas call") is unsafe, likely explaining =
several
>>> > > > > > strange bugs we've seen in internal testing involving DLPAR a=
nd
>>> > > > > > LPM. These scenarios use ibm,configure-connector, whose inter=
nal state
>>> > > > > > can be corrupted by the concurrent use of the "reentrant" fun=
ctions,
>>> > > > > > leading to symptoms like endless busy statuses from RTAS.
>>> > > > >=20
>>> > > > > Oh, does not it means PowerVM is not compliant to the PAPR spec=
s?
>>> > > >=20
>>> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
>>> > > > Implement reentrant rtas call") change is incorrect. The "reentra=
nt"
>>> > > > property described in the spec applies only to the individual RTAS
>>> > > > functions. The OS can invoke (for example) ibm,set-xive on multip=
le CPUs
>>> > > > simultaneously, but it must adhere to the more general requiremen=
t to
>>> > > > serialize with other RTAS functions.
>>> > > >=20
>>> > >=20
>>> > > I see. Thanks for explaining that part!
>>> > > I agree: reentrant calls that way don't look as useful on Linux tha=
n I
>>> > > previously thought.
>>> > >=20
>>> > > OTOH, I think that instead of reverting the change, we could make u=
se of the
>>> > > correct information and fix the current implementation. (This could=
 help when we
>>> > > do the same rtas call in multiple cpus)
>>> >=20
>>> > Hmm I'm happy to be mistaken here, but I doubt we ever really need to=
 do
>>> > that. I'm not seeing the need.
>>> >=20
>>> > > I have an idea of a patch to fix this.=20
>>> > > Do you think it would be ok if I sent that, to prospect being an al=
ternative to
>>> > > this reversion?
>>> >=20
>>> > It is my preference, and I believe it is more common, to revert to the
>>> > well-understood prior state, imperfect as it may be. The revert can be
>>> > backported to -stable and distros while development and review of
>>> > another approach proceeds.
>>>
>>> Ok then, as long as you are aware of the kdump bug, I'm good.
>>>
>>> FWIW:
>>> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
>>
>> A shame. I guess a reader/writer lock would not be much help because
>> the crash is probably more likely to hit longer running rtas calls?
>>
>> Alternative is just cheat and do this...?

[...]

>
> I wonder - would it be worth making the panic path use a separate
> "emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
> RTAS at panic time, then leaving rtas.args untouched might make the
> ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
> incur on the panic path more likely to succeed.

Regardless, I request that we proceed with the revert while the crash
path hardening gets sorted out. If I understand the motivation behind
commit b664db8e3f97 ("powerpc/rtas: Implement reentrant rtas call"),
then it looks like it was incomplete anyway? rtas_os_term() still takes
the lock when calling ibm,os-term.
