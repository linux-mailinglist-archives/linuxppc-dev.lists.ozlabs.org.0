Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B27978BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 18:53:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qHX4mCbJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQLB1tcsz3c4s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 02:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qHX4mCbJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQKL1zBPz3bxS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 02:52:53 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387Ge3ak032728;
	Thu, 7 Sep 2023 16:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MwW+kQNNDgImek+nfpa4eK6m7WTkbvAxkwhoaDFUxr4=;
 b=qHX4mCbJJ650FoWbdzaPE98gWKuWX73UmZpBa4sorKR7ocn8q/OBnv6nc2cvoUG3+rMj
 31coyhpsOg8TXpriuIDgYkZz57bJbsYvNkpmwcY5BGnbsr5Ef0i6FTk+1EGVzpv9sP4V
 rqj72IUBkNzrAl65RpOG4U9Of4qp4teLDJefl0zsartw6+NYwAfDiDk0xR/V1GZST7BU
 LFOk5+u4V2ILYk1gTkPhZuwSMLpcEt3/oq1pUpjhhK4vro+fFOQNgVU7Laa7zNitqn3+
 90qAgx4R+Bgi8f3q/7tyRKM+nnywIMX7+Must/JtOE7VOHs6eS3BoaI1wlwzyITuslpO 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syhdd1vha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:52:47 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387GgK9U004347;
	Thu, 7 Sep 2023 16:52:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syhdd1vgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:52:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387F0CHg001667;
	Thu, 7 Sep 2023 16:52:46 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfct5k77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:52:46 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387Gqjph60162420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 16:52:45 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB2C058065;
	Thu,  7 Sep 2023 16:52:44 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5ABE58052;
	Thu,  7 Sep 2023 16:52:44 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 16:52:44 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC] powerpc/rtas: Make it possible to disable sys_rtas
In-Reply-To: <20230907160134.GZ8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230906120855.28331-1-msuchanek@suse.de>
 <87bkefw0ws.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20230907160134.GZ8826@kitsune.suse.cz>
Date: Thu, 07 Sep 2023 11:52:44 -0500
Message-ID: <878r9ivsbn.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 42skg5C0a2oHAAtJ8oozye09ChG1OzdC
X-Proofpoint-GUID: Psyvk6vp4DbDZRtmDuc8SuV3700ifWAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=429
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070147
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Wed, Sep 06, 2023 at 02:34:59PM -0500, Nathan Lynch wrote:
>> Michal Suchanek <msuchanek@suse.de> writes:
>>=20
>> > Additional patch suggestion to go with the rtas devices:
>> >
>> > -----------------------------------------------------------------------
>> >
>> > With most important rtas functions available through different
>> > interfaces the sys_rtas interface can be disabled completely.
>> >
>> > Do not remove it for now to make it possible to run older versions of
>> > userspace tools that don't support other interfaces.
>>=20
>> Thanks. I hope making sys_rtas on/off-configurable will make sense
>> eventually, and I expect this series to get us closer to that. But to me
>> it seems too early and too coarse. A kernel built with RTAS_SYSCALL=3Dn =
is
>> not something I'd want to support or run in production soon. It would
>> break too many known use cases, and likely some unknown ones as well.
>
> There are about 3 known use cases that absolutely need access by other
> means than sys_rtas to work with lockdown, and about other 3 that would
> work either way.

How do you figure that? I count 11 librtas APIs that use work areas (and
therefore /dev/mem) that are definitely broken under lockdown. Maybe a
couple of them are unused.

> That's not so staggering that it could not be implemented in the kernel
> from the start.
> How long it will take for the known userspace users to catch up is
> anotehr questio but again it's something that can be addressed.
>
> Making it possible to turn off sys_rtas will make it easier to uncover
> the not yet known cases.

This is also true of making the configuration more granular than on or
off. You would be free to disallow all calls if desired.

> What people want to support depends a lot on what is converted, and also
> the situation of the distribution in question. Fast-rollong
> distributions may want only the new interface quite soon, and so may
> distributions that are starting development of new release.
>
> All this makes sense only if there is a plan to discontinue sys_rtas
> entirely. For the simple calls that don't need data buffers it's still
> usable.

I don't understand. How would it remain usable for the simple calls if
it can be completely disabled?

>> It could be more useful in the near term to construct a configurable
>> list of RTAS functions that sys_rtas is allowed to expose.
>
> If we really need this level of datail I guess it is too early.

I'm not sure we do, like I said it's just an idea at this point.
