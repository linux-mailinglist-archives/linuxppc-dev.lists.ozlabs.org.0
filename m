Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0563B418
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 22:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLdfS6dk3z3dvZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 08:20:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ECaYyu7E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ECaYyu7E;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLddV2JFPz2xkx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 08:19:25 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASJsafj001194
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 21:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ek3oHTkxELsTqH32dxGb57jq4fLJSchwZqBQWwlrgNs=;
 b=ECaYyu7EOnlDV7f65lZ5kHtlYzKzvUjAjJpYWura0O/eY3ZlW+URZbgFf+PeM+2XRpRb
 N8Mfo+qgvhPV0xj17SQBRSPuneX2F1JRUlTzFAs0zA/LI3DKSS25E39q7tmfBNMBdfFR
 6zHahOwpFrV4DCD+826x+xYh6RduQzyq/6MusBJzsX9Aja+N7bzYaAwrOjywD/h7XjQi
 Of1VwjYUWatwSD00Sf4QxvMyCczi5JVkV4JCjp8Xm4W4pNwz8zB28SdKZqFMjTtmNYqM
 CvGFElc2Z+Crxt7Pul1GD7q47WOFtvFM+WpyLas3U83ZOvSwz4uPew9ugidS1GhizgyW ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m53je1ue1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 21:19:22 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASKOkDD032661
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 21:19:22 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m53je1udq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 21:19:22 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASL5t5o021548;
	Mon, 28 Nov 2022 21:19:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma04dal.us.ibm.com with ESMTP id 3m3ae9v39g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 21:19:21 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ASLJJeG8061444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 21:19:20 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B65E5805B;
	Mon, 28 Nov 2022 21:19:19 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DB5458063;
	Mon, 28 Nov 2022 21:19:19 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 21:19:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, Nick Child
 <nnac123@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
In-Reply-To: <2ba2809a545d0f84b336f78baf2dbe2ff20dc105.camel@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-11-nathanl@linux.ibm.com>
 <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
 <c183a039-2001-eb3a-7028-f8a0813987cf@linux.ibm.com>
 <2ba2809a545d0f84b336f78baf2dbe2ff20dc105.camel@linux.ibm.com>
Date: Mon, 28 Nov 2022 15:19:18 -0600
Message-ID: <87zgca93qh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZDYcCVl9B-8PsWvNIYl-ea1IaIlH4I4q
X-Proofpoint-ORIG-GUID: GEIr2GEJLWZsM0LFqDQWB7uYL_-JrokT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280151
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On Wed, 2022-11-23 at 13:32 -0600, Nick Child wrote:
>> On 11/22/22 20:51, Andrew Donnellan wrote:
>> > On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
>> > > +enum rtas_function_flags {
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RTAS_FN_FLAG_BANNED_FOR_S=
YSCALL_ON_LE =3D (1 << 0),
>> > > +};
>> >=20
>> > This seems to be new, what's the justification?
>> >=20
>>=20
>> Seems to be a run-time replacement of:
>> #ifdef CONFIG_CPU_BIG_ENDIAN
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ibm,suspend-me", -1, =
-1, -1, -1, -1 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ibm,update-nodes", -1=
, 0, -1, -1, -1, 4096 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ibm,update-properties=
", -1, 0, -1, -1, -1, 4096 },
>> #endif
>>=20
>> It looks to be handled logically:
>> + if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (func->fla=
gs & RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err;
>>=20
>> Perhaps, also allow the addition of any future special cases
>> for rtas functions easier to maintain?
>
> Makes sense, though I'm slightly confused about the original rationale
> for the ifdef and why it's not being fixed in userspace.

Nick C's explanation is correct. I will make the commit message more
explicit about the conversion, and document the flag in the code.

The original rationale:

commit de0f7349a0dd072e54b5fc04c305907b22d28a5f
Author: Nathan Lynch <nathanl@linux.ibm.com>
Date:   Mon Dec 7 15:51:33 2020 -0600

    powerpc/rtas: prevent suspend-related sys_rtas use on LE

    While drmgr has had work in some areas to make its RTAS syscall
    interactions endian-neutral, its code for performing partition
    migration via the syscall has never worked on LE. While it is able to
    complete ibm,suspend-me successfully, it crashes when attempting the
    subsequent ibm,update-nodes call.

    drmgr is the only known (or plausible) user of ibm,suspend-me,
    ibm,update-nodes, and ibm,update-properties, so allow them only in
    big-endian configurations.

To summarize: we know these functions have never had working users via
sys_rtas on ppc64le, and we want to keep it that way.

> Slightly clunky name though, something like
> RTAS_FN_FLAG_SYSCALL_BE_ONLY might be less clunky?

RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE is verbose, but I think it
communicates better that we are consciously imposing a policy in a
specific context.
