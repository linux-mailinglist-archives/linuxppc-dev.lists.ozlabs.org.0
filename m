Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C744559809
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 12:43:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTtxg0HSVz3cGf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 20:43:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FglWVjZr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FglWVjZr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTtww1Stvz3bYd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 20:42:23 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OALx0j015133;
	Fri, 24 Jun 2022 10:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=/ReY4q8LSwkqVJLz/FiVwZsbdICwkTULS923eQ5fhec=;
 b=FglWVjZrAhKI72+l4guaX07i4DBl40HiT4pN4vgiQFAsNJhHkpCO9NqUNe5ticavJVhi
 vErC0eGN75OcfR5j7t/cjugD/evnZDtJ9hEtS2Dl77QLHbuGHmC4pWKICQMMH6/zj7vI
 auAM3UyvMjOQjTvxmPAOUmWVikcbwu2NBmfPOoBDPR9hwITb/aFhJATvxJOHb6ympj0X
 edVtdjXoKq5e1i4H5Pb7hLMmt6+Z/YsqaBad6g2cBTfJWp5wOEwQOOOQCo30ikCfqoDH
 bGvjVzTBHfbF1ppPZK6zsHYlqLeC4u+LVtEoq+iyI+BLnWFDwBR/snwwkTeNpMzDg7sb sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwbf18dau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 10:42:04 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OAUkYC024049;
	Fri, 24 Jun 2022 10:42:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwbf18d9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 10:42:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OAcTgI009034;
	Fri, 24 Jun 2022 10:42:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b98um9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 10:42:01 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25OAf8fn14352716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 10:41:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F066C4C04E;
	Fri, 24 Jun 2022 10:41:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 504984C040;
	Fri, 24 Jun 2022 10:41:58 +0000 (GMT)
Received: from localhost (unknown [9.43.19.217])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jun 2022 10:41:58 +0000 (GMT)
Date: Fri, 24 Jun 2022 16:11:57 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2 5/5] bpf ppc32: Add instructions for atomic_[cmp]xchg
To: "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
	<20220610155552.25892-6-hbathini@linux.ibm.com>
	<f09b59ee-c965-a140-4d03-723830cba66d@csgroup.eu>
	<3d5f05d1-448f-58a6-20b0-3e9f0b13df03@linux.ibm.com>
	<bb492bb1-e9e4-76fb-4c5f-2a0a2537d544@linux.ibm.com>
In-Reply-To: <bb492bb1-e9e4-76fb-4c5f-2a0a2537d544@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1656067094.lxf6wftwai.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nZ8FQ679B7xbpHdpQd3Hs0z4UdBqLv8J
X-Proofpoint-GUID: PbzvuLvRUIF4mEVX6aF9Q6qR-cfltJkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206240041
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Jordan Niethe <jniethe5@gmail.com>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini wrote:
>=20
>=20
> On 14/06/22 12:41 am, Hari Bathini wrote:
>>=20
>>=20
>> On 11/06/22 11:04 pm, Christophe Leroy wrote:
>>>
>>>
>>> Le 10/06/2022 =C3=A0 17:55, Hari Bathini a =C3=A9crit=C2=A0:
>>>> This adds two atomic opcodes BPF_XCHG and BPF_CMPXCHG on ppc32, both
>>>> of which include the BPF_FETCH flag.=C2=A0 The kernel's atomic_cmpxchg
>>>> operation fundamentally has 3 operands, but we only have two register
>>>> fields. Therefore the operand we compare against (the kernel's API
>>>> calls it 'old') is hard-coded to be BPF_REG_R0. Also, kernel's
>>>> atomic_cmpxchg returns the previous value at dst_reg + off. JIT the
>>>> same for BPF too with return value put in BPF_REG_0.
>>>>
>>>> =C2=A0=C2=A0=C2=A0 BPF_REG_R0 =3D atomic_cmpxchg(dst_reg + off, BPF_RE=
G_R0, src_reg);
>>>>
>>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> * Moved variable declaration to avoid late declaration error on
>>>> =C2=A0=C2=A0=C2=A0 some compilers.
>>>> * Tried to make code readable and compact.
>>>>
>>>>
>>>> =C2=A0=C2=A0 arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++++++++++++=
++++---
>>>> =C2=A0=C2=A0 1 file changed, 22 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c=20
>>>> b/arch/powerpc/net/bpf_jit_comp32.c
>>>> index 28dc6a1a8f2f..43f1c76d48ce 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>>>> @@ -297,6 +297,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32=20
>>>> *image, struct codegen_context *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 ax_re=
g =3D bpf_to_ppc(BPF_REG_AX);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 tmp_r=
eg =3D bpf_to_ppc(TMP_REG);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 size =
=3D BPF_SIZE(code);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 save_reg, ret_reg;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s16 off =
=3D insn[i].off;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s32 imm =
=3D insn[i].imm;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool func=
_addr_fixed;
>>>> @@ -799,6 +800,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32=20
>>>> *image, struct codegen_context *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * B=
PF_STX ATOMIC (atomic ops)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case BPF_=
STX | BPF_ATOMIC | BPF_W:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sa=
ve_reg =3D _R0;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t_reg =3D src_reg;
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bpf_set_seen_register(ctx, tmp_reg);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bpf_set_seen_register(ctx, ax_reg);
>>>> @@ -829,6 +833,21 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32=20
>>>> *image, struct codegen_context *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 case BPF_XOR | BPF_FETCH:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EMIT(PPC_RAW_XOR(_R0, _R0, src_reg)=
);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se BPF_CMPXCHG:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Return old value in BPF_REG_0 for BPF_CMPXCHG=
 &
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in src_reg for other cases.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret_reg =3D bpf_to_ppc(BPF_REG_0);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Compare with old value in BPF_REG_0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), _R0));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Don't set if different from old value */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
se BPF_XCHG:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 save_reg =3D src_reg;
>>>
>>> I'm a bit lost, when save_reg is src_reg, don't we expect the upper par=
t
>>> (ie src_reg - 1) to be explicitely zeroised ?
>>>
>>=20
>> For BPF_FETCH variants, old value is returned in src_reg (ret_reg).
>> In all such cases, higher 32-bit is zero'ed. But in case of BPF_CMPXCHG,
>> src_reg is untouched as BPF_REG_0 is used instead. So, higher 32-bit
>> remains untouched for that case alone..
>>=20
>>=20
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 default:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err_ratelimited("eBPF filter ato=
mic op code=20
>>>> %02x (@%d) unsupported\n",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code, i);
>>>> @@ -836,15 +855,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32=20
>>>> *image, struct codegen_context *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* store new value */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EM=
IT(PPC_RAW_STWCX(_R0, tmp_reg, dst_reg));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EM=
IT(PPC_RAW_STWCX(save_reg, tmp_reg, dst_reg));
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* we're done if this succeeded */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PPC_BCC_SHORT(COND_NE, tmp_idx);
>=20
>>=20
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* For the BPF_FETCH variant, get old data into=20
>>>> src_reg */
>>=20
>> With this commit, this comment is not true for BPF_CMPXCHG. So, this
>> comment should not be removed..
>=20
> Sorry, the above should read:
>    "should be removed" instead of "should not be removed"..
>=20

Or, just add BPF_REG_0 at the end:
  /* For the BPF_FETCH variant, get old data into src_reg/BPF_REG_0 */

The comment in CMPXCHG anyway details the difference. In any case, we=20
can clean this up subsequently.


- Naveen

