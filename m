Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404716ECBA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 13:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4kC11BKbz3f96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 21:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bmiVUYbQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bmiVUYbQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4kB85hyNz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 21:56:32 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OBgXKZ030959;
	Mon, 24 Apr 2023 11:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=b8z86dNIzMRcRZAe/L/inxLhadyIs9p2MJAGtJyHZaE=;
 b=bmiVUYbQ4FqusT524vWglaxTpfhlAHyyGR1fvYx/1rYzp+0gfGADtn8HVI3yzioJbL+N
 e1uGQ+oB17oAcU38EIh2i5nPS4mjOQ1C1BkTGB8R6dE6S9nNw6PWcHlaRet7Q8NdWkPp
 55djUOG9oQLFITHLl7oajhiJF7axdH+uZGV2jceJWcB+KW3WEM/cO+78JRNiu+lNxd22
 c34iq32/v0yh4ru1+nxu4EA0VahwdK+wjkQnb81OaaBwx4hbJ8vzsSsZIKq3Oy9/3kTp
 fMsU4Wv2mGWJfS0lbxWLuuggftSJ8q4BWY+Tdr2BiNdmw1e5ulCq99JpcBBvZ5q8UUxp kg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q461c1yp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 11:56:06 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33NLZCrN029192;
	Mon, 24 Apr 2023 11:56:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug135g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 11:56:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33OBu1Ko11207226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 11:56:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A38792004B;
	Mon, 24 Apr 2023 11:56:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B55820043;
	Mon, 24 Apr 2023 11:56:01 +0000 (GMT)
Received: from localhost (unknown [9.43.54.88])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 11:56:01 +0000 (GMT)
Date: Mon, 24 Apr 2023 17:25:58 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: populate extable entries only during the
 last pass
To: "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20230406073519.75059-1-hbathini@linux.ibm.com>
	<857125b9-90b3-fba1-beed-6ffda703f873@csgroup.eu>
	<0d136b2a-2db8-f2b1-418e-f245e95c921f@linux.ibm.com>
In-Reply-To: <0d136b2a-2db8-f2b1-418e-f245e95c921f@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1682336435.n6cw11rdyx.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: um_vskRnWDYjxGYCoWOcnJXKVKakv3_o
X-Proofpoint-ORIG-GUID: um_vskRnWDYjxGYCoWOcnJXKVKakv3_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240104
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini wrote:
> Hello Christophe,
>=20
> Thanks for the review.
>=20
> On 07/04/23 11:31 am, Christophe Leroy wrote:
>>=20
>>=20
>> Le 06/04/2023 =C3=A0 09:35, Hari Bathini a =C3=A9crit=C2=A0:
>>> Since commit 85e031154c7c ("powerpc/bpf: Perform complete extra passes
>>> to update addresses"), two additional passes are performed to avoid
>>> space and CPU time wastage on powerpc. But these extra passes led to
>>> WARN_ON_ONCE() hits in bpf_add_extable_entry(). Fix it by not adding
>>> extable entries during the extra pass.
>>=20
>> Are you sure this change is correct ?
>=20
> Actually, I was in two minds about that owing to commit 04c04205bc35
> ("bpf powerpc: Remove extra_pass from bpf_jit_build_body()").

Right, but Christophe's series adding complete passes during the=20
extra_pass phase added 'extra_pass' parameter back to=20
bpf_jit_build_body().

>=20
>> During the extra pass the code can get shrinked or expanded (within the
>> limits of the size of the preliminary pass). Shouldn't extable entries
>> be populated during the last pass ?
>=20
> Unlikely, but the intention there was to eliminate a regression in case
> extra_pass ends up being 'false' always in any subsequent change.

But, the current approach risks generating incorrect offsets in the=20
extable. The main motivation for the extra pass is to generate more=20
compact code, so there is a good chance that offsets are going to change=20
(especially with bpf subprogs).

>=20
> - Hari
>=20
>>>
>>> Fixes: 85e031154c7c ("powerpc/bpf: Perform complete extra passes to upd=
ate addresses")
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> ---
>>>    arch/powerpc/net/bpf_jit_comp32.c | 2 +-
>>>    arch/powerpc/net/bpf_jit_comp64.c | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_j=
it_comp32.c
>>> index 7f91ea064c08..e788b1fbeee6 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>>> @@ -977,7 +977,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *im=
age, struct codegen_context *
>>>    			if (size !=3D BPF_DW && !fp->aux->verifier_zext)
>>>    				EMIT(PPC_RAW_LI(dst_reg_h, 0));
>>>   =20
>>> -			if (BPF_MODE(code) =3D=3D BPF_PROBE_MEM) {
>>> +			if (BPF_MODE(code) =3D=3D BPF_PROBE_MEM && !extra_pass) {

It is probably better to pass 'extra_pass' into bpf_add_extable_entry()=20
to keep all those checks together.


- Naveen

