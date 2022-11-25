Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559763838A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 06:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJNxC2fXdz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 16:40:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lwZBvza2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lwZBvza2;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJNwF3Jn4z2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 16:39:25 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP4Z4j9025893;
	Fri, 25 Nov 2022 05:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=w13mrymH4KYWhX8C+By/LPifLb1Xs84nwMRyXQGfR8A=;
 b=lwZBvza23Gn/mg/txSJCisZHQpv6+Uopd0lWQLew06bgYAJTWzj1FXYmP6Z7hF+tuDDH
 BEJ8WWVvDdbmu64w2L9mzBgA+giYRKSBXXNiDyIvOOQWYwy5T8S4OmkHw6POdsp7YDyy
 SSfdlc7lOTvBCdRa1DUuxjVZiOXd3VaFNkdEg7FXVJSS3FU0JKoTZ29hxL42dyEmjJby
 VMouEe5slRmrrGwvgpwMhzZTx8QF95EIlzLkalKgOKQrMbxL9HYgOwimCocowVFsM2/x
 pliN9G6y8uNWvkp9g4uVqb/IRCgkpFEQJd8l4MZWdR+deHo7JP5FMkaJf0yfNxx0Dnbx tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2ptdh5wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 05:38:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP5BEEW021794;
	Fri, 25 Nov 2022 05:38:58 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2ptdh5vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 05:38:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP5Zkph025155;
	Fri, 25 Nov 2022 05:38:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdj141q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 05:38:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP5crHO5243642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 05:38:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8098FAE051;
	Fri, 25 Nov 2022 05:38:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED1F7AE045;
	Fri, 25 Nov 2022 05:38:52 +0000 (GMT)
Received: from localhost (unknown [9.43.63.150])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 05:38:52 +0000 (GMT)
Date: Fri, 25 Nov 2022 11:08:51 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when
 it is an address
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman
	<mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: 	<3f6d302a2068d9e357efda2d92c8da99a0f2d0b2.1669278892.git.christophe.leroy@csgroup.eu>
	<1669284441.66eunvaboi.naveen@linux.ibm.com>
	<9f17237f-94da-f58f-4f4b-0068851b4123@csgroup.eu>
	<1669297066.kxu8xl391n.naveen@linux.ibm.com>
	<ba982820-0a22-1180-7b3c-b32acae6e9f7@csgroup.eu>
In-Reply-To: <ba982820-0a22-1180-7b3c-b32acae6e9f7@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1669354227.c0iu04jq2o.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MPwV45oJxt6nvxGUXCJBoDMQoQBIf8Mj
X-Proofpoint-ORIG-GUID: cFq-2K3Ph9aPUQxSd6n8YrznpOMIP-Gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211250044
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, =?iso-8859-1?q?Yonghong=0A?= Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 24/11/2022 =C3=A0 14:49, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>>
>>>
>>> Le 24/11/2022 =C3=A0 11:13, Naveen N. Rao a =C3=A9crit=C2=A0:
>>>> Christophe Leroy wrote:
>>>
>>> In what direction could that change in the future ?
>>>
>>> For me if they change that it becomes an API change.
>>=20
>> More of an extension, which is exactly what we had when BPF_PSEUDO_FUNC=20
>> was introduced. Took us nearly a year before we noticed.
>>=20
>> Because we do not do a full JIT during the extra pass today like other=20
>> architectures, we are the exception - there is always the risk of bpf=20
>> core changes breaking our JIT. So, I still think it is better if we do a=
=20
>> full JIT during extra pass.
>>=20
>=20
> I like the idea of a full JIT during extra passes and will start looking=20
> at it.
>=20
> Will it also allow us to revert your commit fab07611fb2e=20
> ("powerpc32/bpf: Fix codegen for bpf-to-bpf calls") ?

Not entirely. We still need those extra nops during the initial JIT so=20
that we can estimate the maximum prog size. During extra pass, we can=20
only emit the necessary instructions and skip extra nops. We may need to=20
do two passes during extra_pass to adjust the branch targets though.

Thanks,
Naveen

