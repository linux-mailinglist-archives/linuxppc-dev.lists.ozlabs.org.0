Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994487EC1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 16:27:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FrTTbSbk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyzH753dKz3vX3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 02:26:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FrTTbSbk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyzGM5sylz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 02:26:18 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42IEU2ET004178;
	Mon, 18 Mar 2024 15:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=LTyaVbUGtkogZpiM7ZHtLWhoDufzenk7urITMARSRiY=;
 b=FrTTbSbkH4RI/yxLi6QBZl0lNv7LmfNH1QRocjoPDNIRIsTlNAAYcdtUXmSsmFr/eSkY
 q52RqTsj0Qpc5kDeUAuK9ORzKwTe6+eFa192Q37Z9tmVjFpjPETab1MWyNrckbNUOL+a
 4u3hlInkGoMjueN4K1gxbLrVgezDDwg0cHC/O1BIiKHGrmVidxCuZdwX/ygF4Zzwqxbw
 2m8WfAqydCyg2nY08n8bZ351Um1RlT05dr9vqfe+Wqrd1ZfmpJuFDSKMF9qSCQuCYwFt
 rfJFGE8c/VomGbOhoCoo3FcMiWVnBtTXsTwgLvZ/ZHJ8nIxva+8ip9dRgWWvF2Hs/gpX uw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wxqdure9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 15:25:57 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42IDjCw2019843;
	Mon, 18 Mar 2024 15:25:56 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wwqyk9cn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 15:25:56 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42IFPr2F42336700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Mar 2024 15:25:56 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADF5C5806A;
	Mon, 18 Mar 2024 15:25:53 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9682358064;
	Mon, 18 Mar 2024 15:25:53 +0000 (GMT)
Received: from localhost (unknown [9.61.169.147])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Mar 2024 15:25:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Breno Leitao <leitao@debian.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
In-Reply-To: <874jdb4sj9.fsf@mail.lhotse>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
 <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
 <ZfAa59Z8njiGUnRW@gmail.com> <874jdb4sj9.fsf@mail.lhotse>
Date: Mon, 18 Mar 2024 10:25:53 -0500
Message-ID: <875xxj36ke.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RzFIBg-8hyJLAn6HWalxE4e-Mi30qkr0
X-Proofpoint-ORIG-GUID: RzFIBg-8hyJLAn6HWalxE4e-Mi30qkr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_06,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403180114
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Breno Leitao <leitao@debian.org> writes:
>> On Tue, Mar 12, 2024 at 08:17:42AM +0000, Christophe Leroy wrote:
>>> +Nathan as this is RTAS related.

Thanks!

>>> Le 21/08/2018 =C3=A0 20:42, Breno Leitao a =C3=A9crit=C2=A0:
>>> > The rtas syscall reads a value from a user-provided structure and use=
s it
>>> > to index an array, being a possible area for a potential spectre v1 a=
ttack.
>>> > This is the code that exposes this problem.
>>> >=20
>>> > 	args.rets =3D &args.args[nargs];
>>> >=20
>>> > The nargs is an user provided value, and the below code is an example=
 where
>>> > the 'nargs' value would be set to XX.
>>> >=20
>>> > 	struct rtas_args ra;
>>> > 	ra.nargs =3D htobe32(XX);
>>> > 	syscall(__NR_rtas, &ra);
>>>=20
>>>=20
>>> This patch has been hanging around in patchwork since 2018 and doesn't=
=20
>>> apply anymore. Is it still relevant ? If so, can you rebase et resubmit=
 ?
>>
>> This seems to be important, since nargs is a user-provided value. I can
>> submit it if the maintainers are willing to accept. I do not want to
>> spend my time if no one is willing to review it.
>
> My memory is that I didn't think it was actually a problem, because all
> we do is memset args.rets to zero.

This is also my initial reaction to this. I suppose if the memset()
implementation performs some validation of the destination buffer
contents (comparing to a known poison value or something) that could
load the CPU cache then there is a more plausible issue?

> Anyway we should probably just fix it to be safe and keep the static
> checkers happy.

Here is the relevant passage in its current state:

        if (copy_from_user(&args, uargs, 3 * sizeof(u32)) !=3D 0)
                return -EFAULT;

        nargs =3D be32_to_cpu(args.nargs);
        nret  =3D be32_to_cpu(args.nret);
        token =3D be32_to_cpu(args.token);

        if (nargs >=3D ARRAY_SIZE(args.args)
            || nret > ARRAY_SIZE(args.args)
            || nargs + nret > ARRAY_SIZE(args.args))
                return -EINVAL;

        /* Copy in args. */
        if (copy_from_user(args.args, uargs->args,
                           nargs * sizeof(rtas_arg_t)) !=3D 0)
                return -EFAULT;

        /*
         * If this token doesn't correspond to a function the kernel
         * understands, you're not allowed to call it.
         */
        func =3D rtas_token_to_function_untrusted(token);
        if (!func)
                return -EINVAL;

        args.rets =3D &args.args[nargs];
        memset(args.rets, 0, nret * sizeof(rtas_arg_t));

Some questions:

1. The patch sanitizes 'nargs' immediately before the call to memset(),
   but shouldn't that happen before 'nargs' is used as an input to
   copy_from_user()?

2. If 'nargs' needs this treatment, then why wouldn't the user-supplied
   'nret' and 'token' need them as well? 'nret' is used to index the
   same array as 'nargs'. And at least conceptually, 'token' is used to
   index a data structure (xarray) with array-like semantics (to be
   fair, this is a relatively recent development and was not the case
   when this change was submitted).
