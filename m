Return-Path: <linuxppc-dev+bounces-17226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H60Mx7un2nYewQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:54:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C11A1766
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 07:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2Hv0rbzz2yFd;
	Thu, 26 Feb 2026 17:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772088858;
	cv=none; b=CyUnpnlbXpO6FzaCazgpZXFIu8wo+vHg2O6bb+xuVDPE7sdVURDAuEzo6l8EvCiMXh4b1KRzMF0NjJto2ubAqOgI6NwmBLSJgwYp67qxUKYO/Ce0F8OtfW8r2a/W1ElHScLvc9iQY5RlQspuMVJIJKFGniijrKnDvjgrfRITAPkpeqx//kNBxjvmIyIVERTymHBWTb4XrkwNwy3XHyqnf7i1QDuo7GHVq8c5S9S8gBuN73E36f0NbnG4dkeUOpW0fFp5mituPFm7IjTdMwgCOjmwuJljfXHAku9+OTust4RJRgyfT8zOc6TM+BjtwuxIbfwXZEtCASJzfBYF8bHOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772088858; c=relaxed/relaxed;
	bh=6CiQ8cU9Qw/LrOQ4q/E5dn8+/GuLbDq2GSEjd6++62k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LDCB6FjqNNQyXKPH8bzFaV38U9gL45N+BTCj4JOp7456Mp72GwSNhJWY9uCzdi9ENPtshSwPmsR8BXF+Vf14nHNEhEs9O03CTia13I7W4TICEqxa0P2+CxgyciYfQbryzLOUSxWPzsxrYti/IVxn5v08H600TRXG5p938KyDsXKxDDCCy+eAGfJa4pppNGpr0dxju8sbX4eGw0N8vJ47+Rj4PkCG+D9CiK/DLiXgRTXuYhdUrRNiUd1aISzomV3c2cg0kar/H7DADgUsFd1DXifg8LJ/OvR2axe9iTgXVJfpDGJTASkySNzlgwBAUe9V8DGxgY5uKhw0vz35ig9tiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SSk0c2rN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SSk0c2rN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2Ht1LJ4z2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 17:54:17 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q0BrH83015564;
	Thu, 26 Feb 2026 06:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6CiQ8c
	U9Qw/LrOQ4q/E5dn8+/GuLbDq2GSEjd6++62k=; b=SSk0c2rN6Su6AFEh+cZevi
	Gl7/EOhcewH0AOW1oK/6CAkivcx8tiBRLnJ3VXpMH8WZ1n0nJ29n4Y81zpzJ00EX
	T53GE72K+xjYUouVgm38Ir4pZ2x1H3oCDMS1juUhus6rQWuLPV9MS1pHHvuaRupv
	2WhcyM1kGWFAdYpVwceQELTYvstJDxtfILbVVYzBhWiaJG8a3+UP7hgnEiDmb7y9
	W3SZgxCjitDj599zewIBmCQ8pkdZ7S+87zKVTxt5xzA6OGqTBJS+yrN/UK907TkV
	gIekXnlcnNAnRO3ZO1m83Y3oPgl5aWkIjotBWmDfMX19BsuIgEvjA/3MZmLqbnSg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4bs3wky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:53:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61Q65dqK014012;
	Thu, 26 Feb 2026 06:53:58 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdy9tuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:53:58 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61Q6raHl29622874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 06:53:36 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FF2958055;
	Thu, 26 Feb 2026 06:53:57 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A0A658043;
	Thu, 26 Feb 2026 06:53:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.98.108.141])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 26 Feb 2026 06:53:54 +0000 (GMT)
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
Subject: Re: [PATCH v2 1/3] powerpc64/bpf: Implement fsession support
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260226041217.18059-1-adubey@linux.ibm.com>
Date: Thu, 26 Feb 2026 12:23:41 +0530
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, hbathini@linux.ibm.com,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        maddy@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3443178-0C2C-4687-8F07-FBF313627347@linux.ibm.com>
References: <20260226041217.18059-1-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tHxiHHkfSEOfboizACOLUig2WR5HpJfl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1NyBTYWx0ZWRfX9pG+Z+mHbLWG
 acyBujWn3x5bbGuKfOrMViSt/zp9iX1E4ldEQXklCycH6r8WOM7NWgat0c5ctRRVThqaOwLdN1h
 xia7IrdQIFgUzXwNFt6Arxo1SmLibaWmuBHIjUdWJN2QPWVkQ8VtzQS6VX45Kgq5c/KY6QdBKHZ
 5y2VoOTZnCAm05cZjPlMvYb2Nl7ahnGorm+TgjyN0r5OwjWhb+Zo6Is0nj9lXXApkKWD2X5cLlD
 7osDh0yHuoqWjL12BpVjZj2O4w59x5a0PEbtcgiWP4JlwG6u2XomJERQW8cwvlKXVQbVMZzYwen
 OS5kbyV7w/wOPzpR7izJ3mup1TL5Zv3lnxPNf2Ygk8L97A3roZZW8IgZETMwrgZKGE+TCvpAACH
 BvDN/QQVPFQj4hdfG5oHQdGPiAvnqfFcbHcsTI6ZSIiqNLxFNYrN2TLcAqipfLyvm1CUYcwiAzj
 +Yy6/tx2k7LxJUhAu/Q==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=699fee07 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=s5SKcktKaC8GU2IdLBEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tHxiHHkfSEOfboizACOLUig2WR5HpJfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260057
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17226-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E82C11A1766
X-Rspamd-Action: no action



> On 26 Feb 2026, at 9:42=E2=80=AFAM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> Implement JIT support for fsession in powerpc64 trampoline.
> The trampoline stack now accommodate session cookies and
> function metadata in place of function argument. fentry/fexit
> programs consume corresponding function metadata. This mirrors
> existing x86 behavior and enable session cookies on powerpc64.
>=20
> Patch rebased over:
> =
https://lore.kernel.org/bpf/20260220063933.196141-1-hbathini@linux.ibm.com=

>=20
> v1->v2:
>  No change since v1
>=20
> [v1]: =
https://lore.kernel.org/bpf/20260216155310.38457-1-adubey@linux.ibm.com
>=20
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

> ---
> arch/powerpc/net/bpf_jit.h        |  4 +-
> arch/powerpc/net/bpf_jit_comp.c   | 69 ++++++++++++++++++++++++++-----
> arch/powerpc/net/bpf_jit_comp64.c | 25 +++++++++++
> 3 files changed, 87 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index a232f3fb73be..f32de8704d4d 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -218,7 +218,9 @@ void bpf_jit_build_epilogue(u32 *image, struct =
codegen_context *ctx);
> void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context =
*ctx);
> void bpf_jit_realloc_regs(struct codegen_context *ctx);
> int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, =
int tmp_reg, long exit_addr);
> -
> +void prepare_for_fsession_fentry(u32 *image, struct codegen_context =
*ctx, int cookie_cnt,
> + int cookie_off, int retval_off);
> +void store_func_meta(u32 *image, struct codegen_context *ctx, u64 =
func_meta, int func_meta_off);
> int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 =
*fimage, int pass,
>  struct codegen_context *ctx, int insn_idx,
>  int jmp_off, int dst_reg, u32 code);
> diff --git a/arch/powerpc/net/bpf_jit_comp.c =
b/arch/powerpc/net/bpf_jit_comp.c
> index 08c992436ace..6d334c0c3d85 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -540,6 +540,11 @@ bool bpf_jit_supports_private_stack(void)
> return IS_ENABLED(CONFIG_PPC64);
> }
>=20
> +bool bpf_jit_supports_fsession(void)
> +{
> + return IS_ENABLED(CONFIG_PPC64);
> +}
> +
> bool bpf_jit_supports_arena(void)
> {
> return IS_ENABLED(CONFIG_PPC64);
> @@ -812,12 +817,16 @@ static int __arch_prepare_bpf_trampoline(struct =
bpf_tramp_image *im, void *rw_im
> struct bpf_tramp_links *tlinks,
> void *func_addr)
> {
> - int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, =
alt_lr_off, r4_off =3D 0;
> + int regs_off, func_meta_off, ip_off, run_ctx_off, retval_off;
> + int nvr_off, alt_lr_off, r4_off =3D 0;
> struct bpf_tramp_links *fmod_ret =3D &tlinks[BPF_TRAMP_MODIFY_RETURN];
> struct bpf_tramp_links *fentry =3D &tlinks[BPF_TRAMP_FENTRY];
> struct bpf_tramp_links *fexit =3D &tlinks[BPF_TRAMP_FEXIT];
> int i, ret, nr_regs, retaddr_off, bpf_frame_size =3D 0;
> struct codegen_context codegen_ctx, *ctx;
> + int cookie_off, cookie_cnt, cookie_ctx_off;
> + int fsession_cnt =3D bpf_fsession_cnt(tlinks);
> + u64 func_meta;
> u32 *image =3D (u32 *)rw_image;
> ppc_inst_t branch_insn;
> u32 *branches =3D NULL;
> @@ -853,9 +862,11 @@ static int __arch_prepare_bpf_trampoline(struct =
bpf_tramp_image *im, void *rw_im
> *                              [ reg argN          ]
> *                              [ ...               ]
> *       regs_off               [ reg_arg1          ] prog ctx context
> - *       nregs_off              [ args count        ] ((u64 =
*)prog_ctx)[-1]
> + *       func_meta_off          [ args count        ] ((u64 =
*)prog_ctx)[-1]
> *       ip_off                 [ traced function   ] ((u64 =
*)prog_ctx)[-2]
> + *                              [ stack cookieN     ]
> *                              [ ...               ]
> + *       cookie_off             [ stack cookie1     ]
> *       run_ctx_off            [ bpf_tramp_run_ctx ]
> *                              [ reg argN          ]
> *                              [ ...               ]
> @@ -887,16 +898,21 @@ static int __arch_prepare_bpf_trampoline(struct =
bpf_tramp_image *im, void *rw_im
> run_ctx_off =3D bpf_frame_size;
> bpf_frame_size +=3D round_up(sizeof(struct bpf_tramp_run_ctx), SZL);
>=20
> + /* room for session cookies */
> + cookie_off =3D bpf_frame_size;
> + cookie_cnt =3D bpf_fsession_cookie_cnt(tlinks);
> + bpf_frame_size +=3D cookie_cnt * 8;
> +
> /* Room for IP address argument */
> ip_off =3D bpf_frame_size;
> if (flags & BPF_TRAMP_F_IP_ARG)
> bpf_frame_size +=3D SZL;
>=20
> - /* Room for args count */
> - nregs_off =3D bpf_frame_size;
> + /* Room for function metadata, arg regs count */
> + func_meta_off =3D bpf_frame_size;
> bpf_frame_size +=3D SZL;
>=20
> - /* Room for args */
> + /* Room for arg egs */
> regs_off =3D bpf_frame_size;
> bpf_frame_size +=3D nr_regs * SZL;
>=20
> @@ -990,9 +1006,9 @@ static int __arch_prepare_bpf_trampoline(struct =
bpf_tramp_image *im, void *rw_im
> EMIT(PPC_RAW_STL(_R3, _R1, retaddr_off));
> }
>=20
> - /* Save function arg count -- see bpf_get_func_arg_cnt() */
> - EMIT(PPC_RAW_LI(_R3, nr_regs));
> - EMIT(PPC_RAW_STL(_R3, _R1, nregs_off));
> + /* Save function arg regs count -- see bpf_get_func_arg_cnt() */
> + func_meta =3D nr_regs;
> + store_func_meta(image, ctx, func_meta, func_meta_off);
>=20
> /* Save nv regs */
> EMIT(PPC_RAW_STL(_R25, _R1, nvr_off));
> @@ -1006,10 +1022,28 @@ static int =
__arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
> return ret;
> }
>=20
> - for (i =3D 0; i < fentry->nr_links; i++)
> + if (fsession_cnt) {
> + /*
> + * Clear all the session cookies' values
> + * Clear the return value to make sure fentry always get 0
> + */
> + prepare_for_fsession_fentry(image, ctx, cookie_cnt, cookie_off, =
retval_off);
> + }
> +
> + cookie_ctx_off =3D (regs_off - cookie_off) / 8;
> +
> + for (i =3D 0; i < fentry->nr_links; i++) {
> + if (bpf_prog_calls_session_cookie(fentry->links[i])) {
> + u64 meta =3D func_meta | (cookie_ctx_off << =
BPF_TRAMP_COOKIE_INDEX_SHIFT);
> +
> + store_func_meta(image, ctx, meta, func_meta_off);
> + cookie_ctx_off--;
> + }
> +
> if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, =
retval_off,
>    run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET))
> return -EINVAL;
> + }
>=20
> if (fmod_ret->nr_links) {
> branches =3D kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
> @@ -1071,12 +1105,27 @@ static int =
__arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
> image[branches[i]] =3D ppc_inst_val(branch_insn);
> }
>=20
> - for (i =3D 0; i < fexit->nr_links; i++)
> + /* set the "is_return" flag for fsession */
> + func_meta |=3D (1ULL << BPF_TRAMP_IS_RETURN_SHIFT);
> + if (fsession_cnt)
> + store_func_meta(image, ctx, func_meta, func_meta_off);
> +
> + cookie_ctx_off =3D (regs_off - cookie_off) / 8;
> +
> + for (i =3D 0; i < fexit->nr_links; i++) {
> + if (bpf_prog_calls_session_cookie(fexit->links[i])) {
> + u64 meta =3D func_meta | (cookie_ctx_off << =
BPF_TRAMP_COOKIE_INDEX_SHIFT);
> +
> + store_func_meta(image, ctx, meta, func_meta_off);
> + cookie_ctx_off--;
> + }
> +
> if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, =
retval_off,
>    run_ctx_off, false)) {
> ret =3D -EINVAL;
> goto cleanup;
> }
> + }
>=20
> if (flags & BPF_TRAMP_F_CALL_ORIG) {
> if (ro_image) /* image is NULL for dummy pass */
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c =
b/arch/powerpc/net/bpf_jit_comp64.c
> index 17aec341f5eb..1e2ac6c4f331 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -179,6 +179,31 @@ static int bpf_jit_stack_offsetof(struct =
codegen_context *ctx, int reg)
> BUG();
> }
>=20
> +void prepare_for_fsession_fentry(u32 *image, struct codegen_context =
*ctx, int cookie_cnt,
> + int cookie_off, int retval_off)
> +{
> + EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
> +
> + for (int i =3D 0; i < cookie_cnt; i++)
> + EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, cookie_off + 8 * i));
> + EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, retval_off));
> +}
> +
> +void store_func_meta(u32 *image, struct codegen_context *ctx,
> + u64 func_meta, int func_meta_off)
> +{
> + /*
> + * Store func_meta to stack at [R1 + func_meta_off] =3D func_meta
> + *
> + * func_meta :
> + * bit[63]: is_return flag
> + * byte[1]: cookie offset from ctx
> + * byte[0]: args count
> + */
> + PPC_LI64(bpf_to_ppc(TMP_REG_1), func_meta);
> + EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, func_meta_off));
> +}
> +
> void bpf_jit_realloc_regs(struct codegen_context *ctx)
> {
> }
> --=20
> 2.52.0
>=20


