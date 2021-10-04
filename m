Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5E342165D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNTg84hy6z305C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 05:25:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UzFhQAXc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UzFhQAXc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNTfQ3v0fz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:25:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194H1MWS011419; 
 Mon, 4 Oct 2021 14:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=Pl5iP64CnTF7p0Wxkz7yOkwu80bYUUeszEQxZ2OyMUI=;
 b=UzFhQAXcahoZtupa7X3ZxurtJwQY92zMF72frBA033//4dBWnDaO3n7O4OavckYPfGhT
 rtuswqTIcWcd+/BsT9Us8mt7VQTHmGucnKZNGSsWyKNyQ4QD/6DoB5uo3NStQXr1r421
 nbqZH4+ylMht8NNSPTdR2qAD39N3WrTHWhplPwAYyZB/J+0F5uwAO4bIxKPf239eQGWg
 P5kV+x+y+Pmc5luKbW3wAoHHkTaAhx0Qdr6Iqv+Lq3y/AXZyCdoNtn2i9a9KMFSasmhl
 SxB2uPL72t9jgDFUq67o0DxMgS22P62g+bLDEw5qqFPOwjmnErGwG60BbRAcxx29OSRz 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg5n79u9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:24:58 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 194HRUbP025774;
 Mon, 4 Oct 2021 14:24:58 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg5n79u8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:24:58 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194ICXrq019180;
 Mon, 4 Oct 2021 18:24:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3bef29rv52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 18:24:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194IOrVd49611050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 18:24:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 035F04204D;
 Mon,  4 Oct 2021 18:24:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 305694204B;
 Mon,  4 Oct 2021 18:24:52 +0000 (GMT)
Received: from localhost (unknown [9.43.21.28])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 18:24:51 +0000 (GMT)
Date: Mon, 04 Oct 2021 23:54:50 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/9] powerpc/bpf: Handle large branch ranges with BPF_EXIT
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <e37766fd-8c52-6961-39a8-2de44a769204@csgroup.eu>
In-Reply-To: <e37766fd-8c52-6961-39a8-2de44a769204@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1633371632.j9hqy0kjhu.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xfX-r1t2JByKJmy5wUfnRDmGYI1eJasj
X-Proofpoint-ORIG-GUID: lJkn2ohIE0lk1U1IVM9pPq17djx9E4FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040125
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
> Le 01/10/2021 =C3=A0 23:14, Naveen N. Rao a =C3=A9crit=C2=A0:
>> In some scenarios, it is possible that the program epilogue is outside
>> the branch range for a BPF_EXIT instruction. Instead of rejecting such
>> programs, emit an indirect branch. We track the size of the bpf program
>> emitted after the initial run and do a second pass since BPF_EXIT can
>> end up emitting different number of instructions depending on the
>> program size.
>>=20
>> Suggested-by: Jordan Niethe <jniethe5@gmail.com>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit.h        |  3 +++
>>   arch/powerpc/net/bpf_jit_comp.c   | 22 +++++++++++++++++++++-
>>   arch/powerpc/net/bpf_jit_comp32.c |  2 +-
>>   arch/powerpc/net/bpf_jit_comp64.c |  2 +-
>>   4 files changed, 26 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>> index 89bd744c2bffd4..4023de1698b9f5 100644
>> --- a/arch/powerpc/net/bpf_jit.h
>> +++ b/arch/powerpc/net/bpf_jit.h
>> @@ -126,6 +126,7 @@
>>  =20
>>   #define SEEN_FUNC	0x20000000 /* might call external helpers */
>>   #define SEEN_TAILCALL	0x40000000 /* uses tail calls */
>> +#define SEEN_BIG_PROG	0x80000000 /* large prog, >32MB */
>>  =20
>>   #define SEEN_VREG_MASK	0x1ff80000 /* Volatile registers r3-r12 */
>>   #define SEEN_NVREG_MASK	0x0003ffff /* Non volatile registers r14-r31 *=
/
>> @@ -179,6 +180,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *ima=
ge, struct codegen_context *
>>   void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
>>   void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
>>   void bpf_jit_realloc_regs(struct codegen_context *ctx);
>> +int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
>> +					int tmp_reg, unsigned long exit_addr);
>>  =20
>>   #endif
>>  =20
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_=
comp.c
>> index fcbf7a917c566e..3204872fbf2738 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -72,6 +72,21 @@ static int bpf_jit_fixup_subprog_calls(struct bpf_pro=
g *fp, u32 *image,
>>   	return 0;
>>   }
>>  =20
>> +int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
>> +					int tmp_reg, unsigned long exit_addr)
>> +{
>> +	if (!(ctx->seen & SEEN_BIG_PROG) && is_offset_in_branch_range(exit_add=
r)) {
>> +		PPC_JMP(exit_addr);
>> +	} else {
>> +		ctx->seen |=3D SEEN_BIG_PROG;
>> +		PPC_FUNC_ADDR(tmp_reg, (unsigned long)image + exit_addr);
>> +		EMIT(PPC_RAW_MTCTR(tmp_reg));
>> +		EMIT(PPC_RAW_BCTR());
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   struct powerpc64_jit_data {
>>   	struct bpf_binary_header *header;
>>   	u32 *addrs;
>> @@ -155,12 +170,17 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *fp)
>>   		goto out_addrs;
>>   	}
>>  =20
>> +	if (!is_offset_in_branch_range((long)cgctx.idx * 4))
>> +		cgctx.seen |=3D SEEN_BIG_PROG;
>> +
>>   	/*
>>   	 * If we have seen a tail call, we need a second pass.
>>   	 * This is because bpf_jit_emit_common_epilogue() is called
>>   	 * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
>> +	 * We also need a second pass if we ended up with too large
>> +	 * a program so as to fix branches.
>>   	 */
>> -	if (cgctx.seen & SEEN_TAILCALL) {
>> +	if (cgctx.seen & (SEEN_TAILCALL | SEEN_BIG_PROG)) {
>>   		cgctx.idx =3D 0;
>>   		if (bpf_jit_build_body(fp, 0, &cgctx, addrs, false)) {
>>   			fp =3D org_fp;
>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_ji=
t_comp32.c
>> index a74d52204f8da2..d2a67574a23066 100644
>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>> @@ -852,7 +852,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *ima=
ge, struct codegen_context *
>>   			 * we'll just fall through to the epilogue.
>>   			 */
>>   			if (i !=3D flen - 1)
>> -				PPC_JMP(exit_addr);
>> +				bpf_jit_emit_exit_insn(image, ctx, tmp_reg, exit_addr);
>=20
> On ppc32, if you use tmp_reg you must flag it. But I think you could use=20
> r0 instead.

Indeed. Can we drop tracking of the temp registers and using them while
remapping registers? Are you seeing significant benefits with re-use of=20
those temp registers?

- Naveen

