Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A695B3A52
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 16:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPHnw5Pmcz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 00:05:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eojQrv1T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eojQrv1T;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPHn95zyzz2yWl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 00:05:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289CZ3bE012502
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Sep 2022 14:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gv+vCGpZxyaoJ5E041TWL3cLVuhtMwdcd78GN9Ix54A=;
 b=eojQrv1Th9dnHv01AGa25NqGkOzHRqhFJucde9IxzE/phYH4iTulPzB7QUrN+S1bQWLf
 O1mjxOEyocQbkQCaYsKScJtb0IWtnti1a/e/w0QcVT32i4MmoUrseVEei/EzE35E+ywI
 o/K8j9KKJ0b12vfng7513H5UBauRNkH1HufUziqXo03dLyu4mKWqwyQL/u9U0I3znZ6K
 ozfDJjPKlIyOw+X2Gp4/F85/kE2PPCC8u3pJv83n/YVP2prmZvRnWnaY1CLUpd4d24bE
 2iUDHwUvnBVoPGqk5zCzzozggUV2AMI79joYQl1Njs1610iKZ91Cunxbi2zfk94j6R6b Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4jqvvxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 14:04:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289DDuXn016316
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Sep 2022 14:04:58 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4jqvvxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:04:58 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289E4vUv026836;
	Fri, 9 Sep 2022 14:04:57 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma02wdc.us.ibm.com with ESMTP id 3jbxj9ya4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:04:57 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289E4vbO10748496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 14:04:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 326A9112063;
	Fri,  9 Sep 2022 14:04:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF37E112064;
	Fri,  9 Sep 2022 14:04:56 +0000 (GMT)
Received: from localhost (unknown [9.211.56.220])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 14:04:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
Date: Fri, 09 Sep 2022 09:04:56 -0500
Message-ID: <871qskve2f.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JeM4WN8GlL96bMThTJTm3J5S-AUanjLd
X-Proofpoint-GUID: xvNDjHFathd5KIltYvSS2Io-iHQHubAm
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090049
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

Hi Leonardo,

(restoring the list to the cc, hope that's ok)

Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
>> At the time this was submitted by Leonardo, I confirmed -- or thought
>> I had confirmed -- with PowerVM partition firmware development that
>> the following RTAS functions:
>>=20
>> - ibm,get-xive
>> - ibm,int-off
>> - ibm,int-on
>> - ibm,set-xive
>>=20
>> were safe to call on multiple CPUs simultaneously, not only with
>> respect to themselves as indicated by PAPR, but with arbitrary other
>> RTAS calls:
>>=20
>> https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.com/
>>=20
>> Recent discussion with firmware development makes it clear that this
>> is not true, and that the code in commit b664db8e3f97 ("powerpc/rtas:
>> Implement reentrant rtas call") is unsafe, likely explaining several
>> strange bugs we've seen in internal testing involving DLPAR and
>> LPM. These scenarios use ibm,configure-connector, whose internal state
>> can be corrupted by the concurrent use of the "reentrant" functions,
>> leading to symptoms like endless busy statuses from RTAS.
>
> Oh, does not it means PowerVM is not compliant to the PAPR specs?

No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
Implement reentrant rtas call") change is incorrect. The "reentrant"
property described in the spec applies only to the individual RTAS
functions. The OS can invoke (for example) ibm,set-xive on multiple CPUs
simultaneously, but it must adhere to the more general requirement to
serialize with other RTAS functions.

I don't claim that this is a useful property, at least not for
Linux. Maybe other OSes are better able to exploit it.

I apologize for my role in the confusion here. When reviewing the
original change, I talked to firmware development about the reentrant
property and how we wanted to use it. I've since reviewed that
conversation and concluded that I didn't communicate clearly, and that I
interpreted their responses too eagerly.

In the future, when we (pseries Linux developers at IBM) want to go
beyond the language of the spec, we probably should initiate an
architecture change to make the PAPR eventually align with our
implementation choices.

> I mentioned this in the original Commit, and it's still true to the last =
LoPAR:
>
> ###
> For "ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive".
>
> On LoPAPR Version 1.1 (March 24, 2016), from 7.3.10.1 to 7.3.10.4,
> items 2 and 3 say:
>
> 2 - For the PowerPC External Interrupt option: The * call must be
> reentrant to the number of processors on the platform.
> 3 - For the PowerPC External Interrupt option: The * argument call
> buffer for each simultaneous call must be physically unique.
>
> ###=20
>
> Other than that, IIRC, this change was used to avoid issues that were hap=
pening
> on kdump/kexec:=C2=A0
> If another thread was holding the rtas lock, kdump/kexec would get stuck =
waiting
> for the lock forever and never finish the process, often causing a bug
> reproduction's kdump to not get collected.=20
>
> Is there any other fix for the above bug?=C2=A0

Not that I'm aware of, but if this is a common failure mode for kdump,
then perhaps rtas_call() or related code should be made to ignore the
lock in the crash path, as a more general mitigation.

Then again, maybe it's not that urgent? Only XICS mode guests are
potentially affected. Do we even have this problem with
firmware-assisted dumps on PowerVM?

> Or is that a bug which is acceptable to have back, compared to the new
> one?

It was not acceptable to regress existing functions (DLPAR, LPM) in
exchange for making the crash path more robust. Reverting the change is
the correct tradeoff, unfortunately.
