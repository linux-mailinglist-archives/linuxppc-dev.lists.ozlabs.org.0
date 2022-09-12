Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C96255B61F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRHTw5mp5z3bbP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 05:58:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqcoWYJ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqcoWYJ5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRHTC5XVXz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 05:58:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CJcQIa016630
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=V53urCkEGPI61kwtfevl9Bu8PZtDphsLIhXIx4nyHfA=;
 b=jqcoWYJ5zjF+8jL1ikj7jGdUHAz8WOJrmstqGYb0k1NfNUP29X54QjnmBtoLTAQaHMZu
 7G6dfteW7aULNDvMLzD5CB1/P2b5MNtSYEqXWJZBrCxk+O310iXReDprExoHGD7s1nMj
 N5v7u7sf49w0G3qgP4r2iqJ4UHwQZQw79s5BG784hp0TJM6aIij5j+3nBuIXfMOxCz4H
 EHTJ7eKt8wrRI4D+b2bop+jjz/gHc/W89s5zqfb3L+peIXekWfRjl6BqEfd+k4htmlSK
 YboHoZFz1ZD5kBvBnE23T7oFXEhYGlUKZyXXLcSrrFmNd82MGTSs+NFQfR94pAdrR07o EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjb3urh46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:58:03 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CJuCiT006798
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:58:03 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjb3urh3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 19:58:03 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CJe39a004686;
	Mon, 12 Sep 2022 19:58:02 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma04wdc.us.ibm.com with ESMTP id 3jgj797h4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 19:58:02 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28CJw1bq33685940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 19:58:01 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AABD7136053;
	Mon, 12 Sep 2022 19:58:01 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79D66136051;
	Mon, 12 Sep 2022 19:58:01 +0000 (GMT)
Received: from localhost (unknown [9.65.107.251])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 19:58:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
Date: Mon, 12 Sep 2022 14:58:01 -0500
Message-ID: <87y1uotlfa.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e1rFPhJoBshvH9FT3C6xGp_f0rBlxI6s
X-Proofpoint-ORIG-GUID: Q-f9tfHgkTvvMS7NdHFyzGCBb08LWKrZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_14,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 mlxlogscore=779 spamscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120066
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

Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
>> Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>> > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
>> > > At the time this was submitted by Leonardo, I confirmed -- or thought
>> > > I had confirmed -- with PowerVM partition firmware development that
>> > > the following RTAS functions:
>> > >=20
>> > > - ibm,get-xive
>> > > - ibm,int-off
>> > > - ibm,int-on
>> > > - ibm,set-xive
>> > >=20
>> > > were safe to call on multiple CPUs simultaneously, not only with
>> > > respect to themselves as indicated by PAPR, but with arbitrary other
>> > > RTAS calls:
>> > >=20
>> > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.com/
>> > >=20
>> > > Recent discussion with firmware development makes it clear that this
>> > > is not true, and that the code in commit b664db8e3f97 ("powerpc/rtas:
>> > > Implement reentrant rtas call") is unsafe, likely explaining several
>> > > strange bugs we've seen in internal testing involving DLPAR and
>> > > LPM. These scenarios use ibm,configure-connector, whose internal sta=
te
>> > > can be corrupted by the concurrent use of the "reentrant" functions,
>> > > leading to symptoms like endless busy statuses from RTAS.
>> >=20
>> > Oh, does not it means PowerVM is not compliant to the PAPR specs?
>>=20
>> No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
>> Implement reentrant rtas call") change is incorrect. The "reentrant"
>> property described in the spec applies only to the individual RTAS
>> functions. The OS can invoke (for example) ibm,set-xive on multiple CPUs
>> simultaneously, but it must adhere to the more general requirement to
>> serialize with other RTAS functions.
>>=20
>
> I see. Thanks for explaining that part!
> I agree: reentrant calls that way don't look as useful on Linux than I
> previously thought.
>
> OTOH, I think that instead of reverting the change, we could make use of =
the
> correct information and fix the current implementation. (This could help =
when we
> do the same rtas call in multiple cpus)

Hmm I'm happy to be mistaken here, but I doubt we ever really need to do
that. I'm not seeing the need.

> I have an idea of a patch to fix this.=20
> Do you think it would be ok if I sent that, to prospect being an alternat=
ive to
> this reversion?

It is my preference, and I believe it is more common, to revert to the
well-understood prior state, imperfect as it may be. The revert can be
backported to -stable and distros while development and review of
another approach proceeds.
