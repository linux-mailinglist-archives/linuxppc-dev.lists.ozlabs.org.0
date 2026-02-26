Return-Path: <linuxppc-dev+bounces-17225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF42BA3tn2nYewQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:49:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1D1A16ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2BZ69qVz2yFd;
	Thu, 26 Feb 2026 17:49:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772088582;
	cv=none; b=g6uzroJRdgAGm0DmJTSxeiWGBRiYy2jpD1lPFKR4GQSkUcsqOBMRmDtD2vpgEO5gX2dXNQo1EDcJAdQc6EF7sivXfdfRxc8SU/H98hQdN//PEbMZfzVLM2YKRm5tq9hoKp4x0Qo+OHgrDDe3DzcQDPr/W8k7eZE7rcP5nhPnq/UUmF9PnhX1dpttMdODqIJOgoQ01FmYobge2wbhhm7egDQWizz3FoIrpjpflPzOn0thhJu78Q+gHi+UIDl/YvrKBkw95p/o2jiA9mKbsxVIOtqM5gzI2kW+v++04GMWd2D8flGBwMb0UZiCBpzfxhidsCOEEV+85R2g4WNqV0abcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772088582; c=relaxed/relaxed;
	bh=aeMVtm5jQqL+C7LwizqA09r6wpmz+X49FJWI+VZa0WU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MY6m9Yd/9J3cR4/xxloiF4Ub0QE6LqsdMBMH8XmrP+gX9JnvW6F38V8ZrqB183ah/XWZl4COpKsZRvaMfsSLd8ogTU0D6R7hLqIGDGG3gI+6fBj5CIGc64nl+K+iQ5Z57gatdyLk+H4h7cfXIelG/VgEGRCDHvYs31zRWoFd738zAvt4H+lkBLufzNn+Go7s1B3H0keDjCddz0IWM44ilYuHZOC8J1hSfgHJQSrN4qH12iQqpe0QcFL3z0Ssdt7VXQgY+2hG80OVMiOKDjJWaAyiXeKllkUqptFm+WNC/lSedwXLgbn3KGj+JTxRQjnt5CGdWuLkaUtVl3e2iH5ikg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CfARhJs/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CfARhJs/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2BY4gcTz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 17:49:40 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PMUDFQ2785927;
	Thu, 26 Feb 2026 06:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aeMVtm
	5jQqL+C7LwizqA09r6wpmz+X49FJWI+VZa0WU=; b=CfARhJs/lo7vV5lZ/ilqil
	5YoS+poRnAtcs2YHTSQWaJQPlmA8sHMlZ+nkEj0SHKOoxQnlMnMIDUFlSQCK4H9G
	tNimYhO0cEAGE8N0Y35yZOJfo3dE2o6K5WgLjMBKFp45uV+32/o3kViGSUq+QK7T
	KrX8cj2/AfUob+UlwACpZKgTgrwj08KDSTJafFmxKjYH9k/EfhnIn6o8QFC/U/jt
	J+9SexcIYsVHregFm/gaEVY8mBxC5Box88WpJVRNufI3ceOQZp3oxtajV73Eo6N/
	JfZgFjxNtq6FBUmZjzRa9TQzYQcPDpgQSPCenxqLr73zVeI7haQm2C/mRCBp1ZQA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4cr4quy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:49:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61Q6kKem001653;
	Thu, 26 Feb 2026 06:49:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1n9r45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:49:23 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61Q6nMbV13107810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 06:49:22 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10FF758050;
	Thu, 26 Feb 2026 06:49:22 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E0E058045;
	Thu, 26 Feb 2026 06:49:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.98.108.141])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 26 Feb 2026 06:49:18 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 1/2] powerpc64/bpf: Implement JIT support for private
 stack
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260226031324.17352-1-adubey@linux.ibm.com>
Date: Thu, 26 Feb 2026 12:19:05 +0530
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, hbathini@linux.ibm.com,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        maddy@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4402442D-445A-4BC5-81F6-6D7069DE670A@linux.ibm.com>
References: <20260226031324.17352-1-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XqQci_T2G495WMSigZSuGrcD1Xoq60gs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1NyBTYWx0ZWRfX8D08Ff/l/iDu
 lOKULRjzbzmN8Bbvf5Na1NId2BvP5RLFKsyjEH0WUpMSUVcp0ppGxpyxJJ6665NtbYpopRYaeMM
 i6FGbyxn06QeSLFJbF3Bxha7qKp7NTkRf/gqmOyrCdQHYcT8nwlVSg9+mFCCeGZZ+++yJg8btta
 yUNivi5p6XkK7PioCaP6wOSfzy6kU56XihUaWGlAMROXjhepjGmHhd2bPM7Zp0dC73F4bcjlCSF
 ziYXuBZRFdkVLpplXjU65jpnGVLcVKXQZpMy4g7ktoBvFWIojwfiBuPhFeuWgTsoeTIQY34Kc7y
 1o1WhCNXAjO6qt0cdRkoNW8Vmz/KrXpKQDjHiHfpmgdvlX15G9tFZTKGE4NTxdgTGrg7IfTcn3T
 1oLcUP7mzS/g00cf1Ofx05VLRjfYByVK1fKMnrYMeVYJ9jtOIk+RYy2Mwryl2S42eU0qZOMlf+/
 dCPJsEwmytwddjhKDdg==
X-Proofpoint-GUID: XqQci_T2G495WMSigZSuGrcD1Xoq60gs
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=699fecf4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=50cvxZhhKeXfJUF7ksgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260057
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_FROM(0.00)[bounces-17225-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7BB1D1A16ED
X-Rspamd-Action: no action



> On 26 Feb 2026, at 8:43=E2=80=AFAM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> Provision the private stack as a per-CPU allocation during
> bpf_int_jit_compile(). Align the stack to 16 bytes and place guard
> regions at both ends to detect runtime stack overflow and underflow.
>=20
> Round the private stack size up to the nearest 16-byte boundary.
> Make each guard region 16 bytes to preserve the required overall
> 16-byte alignment. When private stack is set, skip bpf stack size
> accounting in kernel stack.
>=20
> There is no stack pointer in powerpc. Stack referencing during JIT
> is done using frame pointer. Frame pointer calculation goes like:
>=20
> BPF frame pointer =3D Priv stack allocation start address +
>                    Overflow guard +
>                    Actual stack size defined by verifier
>=20
> Memory layout:
>=20
> High Addr          =
+--------------------------------------------------+
>                   |                                                  |
>                   | 16 bytes Underflow guard (0xEB9F12345678eb9fULL) |
>                   |                                                  |
>         BPF FP -> +--------------------------------------------------+
>                   |                                                  |
>                   | Private stack - determined by verifier           |
>                   | 16-bytes aligned                                 |
>                   |                                                  |
>                   +--------------------------------------------------+
>                   |                                                  |
> Lower Addr         | 16 byte Overflow guard (0xEB9F12345678eb9fULL)   =
|
>                   |                                                  |
> Priv stack alloc =
->+--------------------------------------------------+
> start
>=20
> Update BPF_REG_FP to point to the calculated offset within the
> allocated private stack buffer. Now, BPF stack usage reference
> in the allocated private stack.
>=20
> The patch is rebase over fixes by Hari:
> =
https://lore.kernel.org/bpf/20260220063933.196141-1-hbathini@linux.ibm.com=
/
>=20
> v1->v2:
>  Fix ci-bot warning for percpu pointer casting
>  Minor refactoring
> v2->v3:
>  Fix ci-bot bug targeting clobbered NVRs on stack rollback
> v3->v4:
>  Added new field to fix priv_stack allocation
>=20
> [v3]: =
https://lore.kernel.org/bpf/20260226005440.9570-1-adubey@linux.ibm.com
> [v2]: =
https://lore.kernel.org/bpf/20260225153950.15331-1-adubey@linux.ibm.com
> [v1]: =
https://lore.kernel.org/bpf/20260216152234.36632-1-adubey@linux.ibm.com
>=20
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

> ---
> arch/powerpc/net/bpf_jit.h        |  6 ++
> arch/powerpc/net/bpf_jit_comp.c   | 97 +++++++++++++++++++++++++++++--
> arch/powerpc/net/bpf_jit_comp64.c | 29 ++++++++-
> 3 files changed, 124 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 7354e1d72f79..a232f3fb73be 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -178,8 +178,14 @@ struct codegen_context {
> bool is_subprog;
> bool exception_boundary;
> bool exception_cb;
> + void __percpu *priv_sp;
> + unsigned int priv_stack_size;
> };
>=20
> +/* Memory size & magic-value to detect private stack =
overflow/underflow */
> +#define PRIV_STACK_GUARD_SZ    16
> +#define PRIV_STACK_GUARD_VAL   0xEB9F12345678eb9fULL
> +
> #define bpf_to_ppc(r) (ctx->b2p[r])
>=20
> #ifdef CONFIG_PPC32
> diff --git a/arch/powerpc/net/bpf_jit_comp.c =
b/arch/powerpc/net/bpf_jit_comp.c
> index 278e09b57560..ad70c3e1294e 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -129,25 +129,60 @@ bool bpf_jit_needs_zext(void)
> return true;
> }
>=20
> +static void priv_stack_init_guard(void __percpu *priv_stack_ptr, int =
alloc_size)
> +{
> + int cpu, underflow_idx =3D (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
> + u64 *stack_ptr;
> +
> + for_each_possible_cpu(cpu) {
> + stack_ptr =3D per_cpu_ptr(priv_stack_ptr, cpu);
> + stack_ptr[0] =3D PRIV_STACK_GUARD_VAL;
> + stack_ptr[1] =3D PRIV_STACK_GUARD_VAL;
> + stack_ptr[underflow_idx] =3D PRIV_STACK_GUARD_VAL;
> + stack_ptr[underflow_idx + 1] =3D PRIV_STACK_GUARD_VAL;
> + }
> +}
> +
> +static void priv_stack_check_guard(void __percpu *priv_stack_ptr, int =
alloc_size,
> + struct bpf_prog *fp)
> +{
> + int cpu, underflow_idx =3D (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
> + u64 *stack_ptr;
> +
> + for_each_possible_cpu(cpu) {
> + stack_ptr =3D per_cpu_ptr(priv_stack_ptr, cpu);
> + if (stack_ptr[0] !=3D PRIV_STACK_GUARD_VAL ||
> + stack_ptr[1] !=3D PRIV_STACK_GUARD_VAL ||
> + stack_ptr[underflow_idx] !=3D PRIV_STACK_GUARD_VAL ||
> + stack_ptr[underflow_idx + 1] !=3D PRIV_STACK_GUARD_VAL) {
> + pr_err("BPF private stack overflow/underflow detected for prog =
%s\n",
> + bpf_jit_get_prog_name(fp));
> + break;
> + }
> + }
> +}
> +
> struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> {
> u32 proglen;
> u32 alloclen;
> u8 *image =3D NULL;
> - u32 *code_base;
> - u32 *addrs;
> - struct powerpc_jit_data *jit_data;
> + u32 *code_base =3D NULL;
> + u32 *addrs =3D NULL;
> + struct powerpc_jit_data *jit_data =3D NULL;
> struct codegen_context cgctx;
> int pass;
> int flen;
> + int priv_stack_alloc_size;
> + void __percpu *priv_stack_ptr =3D NULL;
> struct bpf_binary_header *fhdr =3D NULL;
> struct bpf_binary_header *hdr =3D NULL;
> struct bpf_prog *org_fp =3D fp;
> - struct bpf_prog *tmp_fp;
> + struct bpf_prog *tmp_fp =3D NULL;
> bool bpf_blinded =3D false;
> bool extra_pass =3D false;
> u8 *fimage =3D NULL;
> - u32 *fcode_base;
> + u32 *fcode_base =3D NULL;
> u32 extable_len;
> u32 fixup_len;
>=20
> @@ -173,6 +208,26 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *fp)
> fp->aux->jit_data =3D jit_data;
> }
>=20
> + priv_stack_ptr =3D fp->aux->priv_stack_ptr;
> + if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
> + /*
> + * Allocate private stack of size equivalent to
> + * verifier-calculated stack size plus two memory
> + * guard regions to detect private stack overflow
> + * and underflow.
> + */
> + priv_stack_alloc_size =3D round_up(fp->aux->stack_depth, 16) +
> + 2 * PRIV_STACK_GUARD_SZ;
> + priv_stack_ptr =3D __alloc_percpu_gfp(priv_stack_alloc_size, 16, =
GFP_KERNEL);
> + if (!priv_stack_ptr) {
> + fp =3D org_fp;
> + goto out_priv_stack;
> + }
> +
> + priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
> + fp->aux->priv_stack_ptr =3D priv_stack_ptr;
> + }
> +
> flen =3D fp->len;
> addrs =3D jit_data->addrs;
> if (addrs) {
> @@ -209,6 +264,19 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *fp)
> cgctx.is_subprog =3D bpf_is_subprog(fp);
> cgctx.exception_boundary =3D fp->aux->exception_boundary;
> cgctx.exception_cb =3D fp->aux->exception_cb;
> + cgctx.priv_sp =3D priv_stack_ptr;
> + cgctx.priv_stack_size =3D 0;
> + if (priv_stack_ptr) {
> + /*
> + * priv_stack_size required for setting bpf FP inside
> + * percpu allocation.
> + * stack_size is marked 0 to prevent allocation on
> + * general stack and offset calculation don't go for
> + * a toss in bpf_jit_stack_offsetof() & bpf_jit_stack_local()
> + */
> + cgctx.priv_stack_size =3D cgctx.stack_size;
> + cgctx.stack_size =3D 0;
> + }
>=20
> /* Scouting faux-generate pass 0 */
> if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -306,6 +374,11 @@ struct bpf_prog *bpf_int_jit_compile(struct =
bpf_prog *fp)
> }
> bpf_prog_fill_jited_linfo(fp, addrs);
> out_addrs:
> + if (!image && priv_stack_ptr) {
> + fp->aux->priv_stack_ptr =3D NULL;
> + free_percpu(priv_stack_ptr);
> + }
> +out_priv_stack:
> kfree(addrs);
> kfree(jit_data);
> fp->aux->jit_data =3D NULL;
> @@ -419,6 +492,8 @@ void bpf_jit_free(struct bpf_prog *fp)
> if (fp->jited) {
> struct powerpc_jit_data *jit_data =3D fp->aux->jit_data;
> struct bpf_binary_header *hdr;
> + void __percpu *priv_stack_ptr;
> + int priv_stack_alloc_size;
>=20
> /*
> * If we fail the final pass of JIT (from jit_subprogs),
> @@ -432,6 +507,13 @@ void bpf_jit_free(struct bpf_prog *fp)
> }
> hdr =3D bpf_jit_binary_pack_hdr(fp);
> bpf_jit_binary_pack_free(hdr, NULL);
> + priv_stack_ptr =3D fp->aux->priv_stack_ptr;
> + if (priv_stack_ptr) {
> + priv_stack_alloc_size =3D round_up(fp->aux->stack_depth, 16) +
> + 2 * PRIV_STACK_GUARD_SZ;
> + priv_stack_check_guard(priv_stack_ptr, priv_stack_alloc_size, fp);
> + free_percpu(priv_stack_ptr);
> + }
> WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(fp));
> }
>=20
> @@ -453,6 +535,11 @@ bool bpf_jit_supports_kfunc_call(void)
> return true;
> }
>=20
> +bool bpf_jit_supports_private_stack(void)
> +{
> + return IS_ENABLED(CONFIG_PPC64);
> +}
> +
> bool bpf_jit_supports_arena(void)
> {
> return IS_ENABLED(CONFIG_PPC64);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c =
b/arch/powerpc/net/bpf_jit_comp64.c
> index 640b84409687..4d997da242fe 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -183,6 +183,22 @@ void bpf_jit_realloc_regs(struct codegen_context =
*ctx)
> {
> }
>=20
> +static void emit_fp_priv_stack(u32 *image, struct codegen_context =
*ctx)
> +{
> + /* Load percpu data offset */
> + EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R13,
> + offsetof(struct paca_struct, data_offset)));
> + PPC_LI64(bpf_to_ppc(BPF_REG_FP), (__force long)ctx->priv_sp);
> + /*
> + * Load base percpu pointer of private stack allocation.
> + * Runtime per-cpu address =3D (base + data_offset) + (guard + =
stack_size)
> + */
> + EMIT(PPC_RAW_ADD(bpf_to_ppc(BPF_REG_FP),
> + bpf_to_ppc(TMP_REG_1), bpf_to_ppc(BPF_REG_FP)));
> + EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), bpf_to_ppc(BPF_REG_FP),
> + PRIV_STACK_GUARD_SZ + round_up(ctx->priv_stack_size, 16)));
> +}
> +
> /*
>  * For exception boundary & exception_cb progs:
>  *     return increased size to accommodate additional NVRs.
> @@ -307,9 +323,16 @@ void bpf_jit_build_prologue(u32 *image, struct =
codegen_context *ctx)
> * Exception_cb not restricted from using stack area or arena.
> * Setup frame pointer to point to the bpf stack area
> */
> - if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
> - EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
> - STACK_FRAME_MIN_SIZE + ctx->stack_size));
> + if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
> + if (ctx->priv_sp) {
> + /* Set up fp in private stack */
> + emit_fp_priv_stack(image, ctx);
> + } else {
> + /* Setup frame pointer to point to the bpf stack area */
> + EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
> + STACK_FRAME_MIN_SIZE + ctx->stack_size));
> + }
> + }
>=20
> if (ctx->arena_vm_start)
> PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
> --=20
> 2.52.0
>=20


