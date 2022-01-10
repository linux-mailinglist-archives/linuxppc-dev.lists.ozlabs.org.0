Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 634424896D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 11:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXW4L2ljpz3bPJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 21:57:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UMsxO53P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UMsxO53P; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXW3d1xSbz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 21:56:44 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AAfcGu000504; 
 Mon, 10 Jan 2022 10:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z9PIOk5OSfvkCcLHoYuf6a5UEgLLXezVWqVw10IlVpY=;
 b=UMsxO53P5KIGxPIswgzxJZme7d3Uv3T4ByWe+4G/d5BDA6BDNqh4Hz2ltOG6LB2NdJEF
 0E1j7bEAr9N8Enep44alEBYPAmO8wUN7jcHaPJAeyMxxTvBSKm1v+7LanxDIhMsXhnnO
 jNYeZdzN3ZTacNgNaXH2Q1tKBKUUVmOr2/N8qQUEhTo4aXuofY2XhChCnPnv54E1pGmW
 Hc675Dv+4lEAa2LwEWoodORZq5tSXmIe1nFB3DF7sMqml9fEGjJCONi18xJC87v+siLN
 9RAo1tCZgVOxXriGHd3hsmSg15PMQ7l5DGfTQpOwswLRH4SB77y+sL43V/3ew60+Nry5 dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfmjdy4fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:56:25 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AATeCr028177;
 Mon, 10 Jan 2022 10:56:25 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfmjdy4em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:56:24 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AAm3jJ015162;
 Mon, 10 Jan 2022 10:56:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3df2892v5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:56:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AAuKaG36438278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 10:56:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7738D11C050;
 Mon, 10 Jan 2022 10:56:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1519311C073;
 Mon, 10 Jan 2022 10:56:20 +0000 (GMT)
Received: from localhost (unknown [9.43.115.31])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 10:56:19 +0000 (GMT)
Date: Mon, 10 Jan 2022 16:26:19 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 03/13] powerpc/bpf: Update ldimm64 instructions during
 extra pass
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <7cc162af77ba918eb3ecd26ec9e7824bc44b1fae.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <09ec6f6f-291f-a6be-24e4-818033178ed2@csgroup.eu>
In-Reply-To: <09ec6f6f-291f-a6be-24e4-818033178ed2@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641811947.w307613f1g.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S4YMxrNqpsKGfMnwaP16PdXWrgpTxd_h
X-Proofpoint-ORIG-GUID: W9gql7l27naBaAFU19gkoMTCRS8hwCNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_04,2022-01-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201100074
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 Jiri Olsa <jolsa@redhat.com>, "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 06/01/2022 =C3=A0 12:45, Naveen N. Rao a =C3=A9crit=C2=A0:
>> These instructions are updated after the initial JIT, so redo codegen
>> during the extra pass. Rename bpf_jit_fixup_subprog_calls() to clarify
>> that this is more than just subprog calls.
>>=20
>> Fixes: 69c087ba6225b5 ("bpf: Add bpf_for_each_map_elem() helper")
>> Cc: stable@vger.kernel.org # v5.15
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit_comp.c   | 29 +++++++++++++++++++++++------
>>   arch/powerpc/net/bpf_jit_comp32.c |  6 ++++++
>>   arch/powerpc/net/bpf_jit_comp64.c |  7 ++++++-
>>   3 files changed, 35 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_=
comp.c
>> index d6ffdd0f2309d0..56dd1f4e3e4447 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -23,15 +23,15 @@ static void bpf_jit_fill_ill_insns(void *area, unsig=
ned int size)
>>   	memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
>>   }
>>  =20
>> -/* Fix the branch target addresses for subprog calls */
>> -static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
>> -				       struct codegen_context *ctx, u32 *addrs)
>> +/* Fix updated addresses (for subprog calls, ldimm64, et al) during ext=
ra pass */
>> +static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
>> +				   struct codegen_context *ctx, u32 *addrs)
>>   {
>>   	const struct bpf_insn *insn =3D fp->insnsi;
>>   	bool func_addr_fixed;
>>   	u64 func_addr;
>>   	u32 tmp_idx;
>> -	int i, ret;
>> +	int i, j, ret;
>>  =20
>>   	for (i =3D 0; i < fp->len; i++) {
>>   		/*
>> @@ -66,6 +66,23 @@ static int bpf_jit_fixup_subprog_calls(struct bpf_pro=
g *fp, u32 *image,
>>   			 * of the JITed sequence remains unchanged.
>>   			 */
>>   			ctx->idx =3D tmp_idx;
>> +		} else if (insn[i].code =3D=3D (BPF_LD | BPF_IMM | BPF_DW)) {
>> +			tmp_idx =3D ctx->idx;
>> +			ctx->idx =3D addrs[i] / 4;
>> +#ifdef CONFIG_PPC32
>> +			PPC_LI32(ctx->b2p[insn[i].dst_reg] - 1, (u32)insn[i + 1].imm);
>> +			PPC_LI32(ctx->b2p[insn[i].dst_reg], (u32)insn[i].imm);
>> +			for (j =3D ctx->idx - addrs[i] / 4; j < 4; j++)
>> +				EMIT(PPC_RAW_NOP());
>> +#else
>> +			func_addr =3D ((u64)(u32)insn[i].imm) | (((u64)(u32)insn[i + 1].imm)=
 << 32);
>> +			PPC_LI64(b2p[insn[i].dst_reg], func_addr);
>> +			/* overwrite rest with nops */
>> +			for (j =3D ctx->idx - addrs[i] / 4; j < 5; j++)
>> +				EMIT(PPC_RAW_NOP());
>> +#endif
>=20
> #ifdefs should be avoided as much as possible.
>=20
> Here it seems we could easily do an
>=20
> 	if (IS_ENABLED(CONFIG_PPC32)) {
> 	} else {
> 	}
>=20
> And it looks like the CONFIG_PPC64 alternative would in fact also work=20
> on PPC32, wouldn't it ?

We never implemented PPC_LI64() for ppc32:
  /linux/arch/powerpc/net/bpf_jit_comp.c: In function=20
  'bpf_jit_fixup_addresses':
  /linux/arch/powerpc/net/bpf_jit_comp.c:81:5: error: this decimal constant=
 is unsigned only in ISO C90 [-Werror]
     81 |     PPC_LI64(b2p[insn[i].dst_reg], func_addr);
	|     ^~~~~~~~
  /linux/arch/powerpc/net/bpf_jit_comp.c:81:5: error: this decimal constant=
 is unsigned only in ISO C90 [-Werror]
  In file included from /linux/arch/powerpc/net/bpf_jit_comp.c:19:
  /linux/arch/powerpc/net/bpf_jit.h:78:40: error: right shift count >=3D wi=
dth of type [-Werror=3Dshift-count-overflow]
     78 |     EMIT(PPC_RAW_LI(d, ((uintptr_t)(i) >> 32) &   \
	|                                        ^~


We should move that out from bpf_jit.h


- Naveen

