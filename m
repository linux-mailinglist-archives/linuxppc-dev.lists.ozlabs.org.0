Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724694876BA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 12:47:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVhKK0qK5z3bV0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 22:47:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OrzAJ68z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OrzAJ68z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVhJT1QCqz30Lt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 22:46:32 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207BP1dh027912; 
 Fri, 7 Jan 2022 11:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=mGKiDuRc5bC7QQ7mWyoVdLNEa8i9qNcU4cPDdJsw1AQ=;
 b=OrzAJ68zfoAoVdnf9QUBhutaztOMIYU6rly0NG2ALp6LgfWxflOE/i29VHwb2d52YnDa
 zKIignn1ufaI7oGyhNKAkv5xptfIP6XH6Sg8h4IalLNRxuXaqid3gSffEI60Mdx+LiaJ
 0dCGuh617qJE//uqBxJSLQb6q9IreAB9BpJHQrYfhy/QXPo3GWeG2bdWnOif8HbFCMpq
 +nvkFyRD8my/rj/czOg4JqLqFvtFx9fT8XyIKZ1b/6JAjkztlp3hPoRYKBwdpXouoRVC
 aSHE2F3qSKFYRk6cCqNsSVBNEbQPGwSu1hq8eqqNJ1C3lRC57gY0i0MdeKOOvpI1wplW oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de52gfjn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 11:46:12 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207BYjvM007752;
 Fri, 7 Jan 2022 11:46:12 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de52gfjmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 11:46:12 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207Bbfqd010460;
 Fri, 7 Jan 2022 11:46:10 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3de5m0wb02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 11:46:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207Bk8Nd29622602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 11:46:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11BB24204B;
 Fri,  7 Jan 2022 11:46:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97BFE42041;
 Fri,  7 Jan 2022 11:46:07 +0000 (GMT)
Received: from localhost (unknown [9.43.90.227])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 11:46:07 +0000 (GMT)
Date: Fri, 07 Jan 2022 17:16:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/9] powerpc/bpf: Handle large branch ranges with BPF_EXIT
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <e37766fd-8c52-6961-39a8-2de44a769204@csgroup.eu>
 <1633371632.j9hqy0kjhu.naveen@linux.ibm.com>
 <a63a7b97-08cd-b93e-bc12-d17cd6e94229@csgroup.eu>
In-Reply-To: <a63a7b97-08cd-b93e-bc12-d17cd6e94229@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641554890.61dcuqimpl.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XbcQI94qix6OGdb2Ay5f6kA5s_d7-5_d
X-Proofpoint-ORIG-GUID: Chn8inCcpALSSiob79T9Fxlh2cgcuhWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_04,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070078
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 04/10/2021 =C3=A0 20:24, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>>
>>>
>>> Le 01/10/2021 =C3=A0 23:14, Naveen N. Rao a =C3=A9crit=C2=A0:
>>>> In some scenarios, it is possible that the program epilogue is outside
>>>> the branch range for a BPF_EXIT instruction. Instead of rejecting such
>>>> programs, emit an indirect branch. We track the size of the bpf progra=
m
>>>> emitted after the initial run and do a second pass since BPF_EXIT can
>>>> end up emitting different number of instructions depending on the
>>>> program size.
>>>>
>>>> Suggested-by: Jordan Niethe <jniethe5@gmail.com>
>>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>>> ---
>>>> =C2=A0 arch/powerpc/net/bpf_jit.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 +++
>>>> =C2=A0 arch/powerpc/net/bpf_jit_comp.c=C2=A0=C2=A0 | 22 ++++++++++++++=
+++++++-
>>>> =C2=A0 arch/powerpc/net/bpf_jit_comp32.c |=C2=A0 2 +-
>>>> =C2=A0 arch/powerpc/net/bpf_jit_comp64.c |=C2=A0 2 +-
>>>> =C2=A0 4 files changed, 26 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>>>> index 89bd744c2bffd4..4023de1698b9f5 100644
>>>> --- a/arch/powerpc/net/bpf_jit.h
>>>> +++ b/arch/powerpc/net/bpf_jit.h
>>>> @@ -126,6 +126,7 @@
>>>> =C2=A0 #define SEEN_FUNC=C2=A0=C2=A0=C2=A0 0x20000000 /* might call ex=
ternal helpers */
>>>> =C2=A0 #define SEEN_TAILCALL=C2=A0=C2=A0=C2=A0 0x40000000 /* uses tail=
 calls */
>>>> +#define SEEN_BIG_PROG=C2=A0=C2=A0=C2=A0 0x80000000 /* large prog, >32=
MB */
>>>> =C2=A0 #define SEEN_VREG_MASK=C2=A0=C2=A0=C2=A0 0x1ff80000 /* Volatile=
 registers r3-r12 */
>>>> =C2=A0 #define SEEN_NVREG_MASK=C2=A0=C2=A0=C2=A0 0x0003ffff /* Non vol=
atile registers=20
>>>> r14-r31 */
>>>> @@ -179,6 +180,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32=20
>>>> *image, struct codegen_context *
>>>> =C2=A0 void bpf_jit_build_prologue(u32 *image, struct codegen_context =
*ctx);
>>>> =C2=A0 void bpf_jit_build_epilogue(u32 *image, struct codegen_context =
*ctx);
>>>> =C2=A0 void bpf_jit_realloc_regs(struct codegen_context *ctx);
>>>> +int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tmp_reg, unsigned long ex=
it_addr);
>>>> =C2=A0 #endif
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp.c=20
>>>> b/arch/powerpc/net/bpf_jit_comp.c
>>>> index fcbf7a917c566e..3204872fbf2738 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>>>> @@ -72,6 +72,21 @@ static int bpf_jit_fixup_subprog_calls(struct=20
>>>> bpf_prog *fp, u32 *image,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 }
>>>> +int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tmp_reg, unsigned long ex=
it_addr)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 if (!(ctx->seen & SEEN_BIG_PROG) &&=20
>>>> is_offset_in_branch_range(exit_addr)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PPC_JMP(exit_addr);
>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->seen |=3D SEEN_BIG_PR=
OG;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PPC_FUNC_ADDR(tmp_reg, (un=
signed long)image + exit_addr);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EMIT(PPC_RAW_MTCTR(tmp_reg=
));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EMIT(PPC_RAW_BCTR());
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> =C2=A0 struct powerpc64_jit_data {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct bpf_binary_header *header;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 *addrs;
>>>> @@ -155,12 +170,17 @@ struct bpf_prog *bpf_int_jit_compile(struct=20
>>>> bpf_prog *fp)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_addrs;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 if (!is_offset_in_branch_range((long)cgctx.idx * 4=
))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cgctx.seen |=3D SEEN_BIG_P=
ROG;
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If we have seen a tail call, we=
 need a second pass.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This is because bpf_jit_emit_co=
mmon_epilogue() is called
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from bpf_jit_emit_tail_call() w=
ith a not yet stable ctx->seen.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We also need a second pass if we ended up =
with too large
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * a program so as to fix branches.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0 if (cgctx.seen & SEEN_TAILCALL) {
>>>> +=C2=A0=C2=A0=C2=A0 if (cgctx.seen & (SEEN_TAILCALL | SEEN_BIG_PROG)) =
{
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cgctx.idx =3D 0=
;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bpf_jit_bui=
ld_body(fp, 0, &cgctx, addrs, false)) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fp =3D org_fp;
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c=20
>>>> b/arch/powerpc/net/bpf_jit_comp32.c
>>>> index a74d52204f8da2..d2a67574a23066 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>>>> @@ -852,7 +852,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32=20
>>>> *image, struct codegen_context *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * we'll just fall through to the epilogue.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (i !=3D flen - 1)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PPC_JMP(exit_addr);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bpf_jit_emit_exit_insn(image, ctx, tmp_reg, exit_addr=
);
>>>
>>> On ppc32, if you use tmp_reg you must flag it. But I think you could=20
>>> use r0 instead.
>>=20
>> Indeed. Can we drop tracking of the temp registers and using them while
>> remapping registers? Are you seeing significant benefits with re-use of=20
>> those temp registers?
>>=20
>=20
> I'm not sure to follow you.
>=20
> On ppc32, all volatile registers are used for function arguments, so=20
> temp registers are necessarily non-volatile so we track them as all=20
> non-volatile registers we use.
>=20
> I think saving on stack only the non-volatile registers we use provides=20
> real benefit, otherwise you wouldn't have implemented it would you ?

You're right. I was wary of having to track temporary register usage,=20
which is a bit harder and prone to mistakes like the above. A related=20
concern was that the register remapping is only used if there are no=20
helper calls, which looks like a big limitation.

But, I do agree that it is worth the trouble for ppc32 given the=20
register usage.

>=20
> Anyway here you should use _R0 instead of tmp_reg.


Thanks,
Naveen
