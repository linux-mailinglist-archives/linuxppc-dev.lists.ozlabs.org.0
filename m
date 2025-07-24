Return-Path: <linuxppc-dev+bounces-10390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03711B104BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 10:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnl9J2KZcz30T8;
	Thu, 24 Jul 2025 18:51:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753347092;
	cv=none; b=l6wYW1vB7hhOy5iOlAeCfZlWkb4v5Zn260+05uucIstRecsvTHHyG/KNIlWwgGUaiItGtI/98SaIQfLhDag4dsq39CFZP75w/HSszEs6DDOwUN6FPlJd5nDe6B1VjlcSRQ7wgoBrNuyZd9vvpHtEsDAmRdJAjIolUGb15H8BcyJwrCRzkXP7SB1syZOqWVqvLJdwD9/vwyh+i7CuENEQRE3KHcoPOxI4zpmx+Wry8MQvOGfj9WLCEmdWJHq9A4J0m9WTvvyAMpe5aSMeJ1jI+UiybpsryZKf3IjLpEal2XJjDOX++SP3uZpvrkLeXPO0tU6TYVKj0pLegolcs6mxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753347092; c=relaxed/relaxed;
	bh=n92gCPYKqUn9oqdCdQ5K3RlevuRCRcWkQrIPWGpmEmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfQS62EaLUR3H9RETBs1ecX6TXET2ozH1HTkLPyB+lNbluwW9ZLD3lVvzCJTMqR6BABpJKM+82kVD91yaycbrNwkhYNfkyXIFaIbugvLsGWhk8iQRGHjmwFjAL66bdu0j+Ue1DHC82Mx6SPWMfn4mHIS89oFKsV6AGF+Vz/eYRDUVNuxGgfm1XqxEWFDn6qVjb99wv9FZ/56kz5upwV1e6VtEKiR35D1JwGbkqMyt1xlBY5Q8NQGcUOi8x8Jzs2Efetktx8geHQQhQppQOU4Jco53ZchaZhfsX/DajmibydU0hN4Hhep3D4Bqil9Wb/xPMbitMc/QE6eQf/7fdY+kQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W78g9qSc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W78g9qSc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnl9H0Nb3z2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 18:51:30 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O1AGYS005222;
	Thu, 24 Jul 2025 08:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=n92gCP
	YKqUn9oqdCdQ5K3RlevuRCRcWkQrIPWGpmEmQ=; b=W78g9qScQQkAQFJ6d8Ug8O
	af27fE/fqTYRhb+T8tdBxHld/7g6cvBqI0TKJSGkZJk55oc5EbmZEX5K8tSDdyXV
	Fw+uPf/hPKI0CYlk/cW5ZXvA1UeGAmbv1pzYfc9wpJ2tPyUnp6abtee4m+LxiFEg
	etQtqVVIJr/bayf85Wjb9BLe4Ebk594U0IWBRqilKEclJdHboiJshNiJDM0vT+g6
	cobEDp/E1tY9cS7dTkDOvXhy06nP5hxV93sw6uOo3xJQZkXHOslMCxEqgrnV5UNq
	1uoY/CX1PwCR47omex79AWxds5TFcdngT8n1WdhvcUF2RDyOGbhYD2YGjWM5f7dg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff51keu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 08:50:58 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56O8FDLw007624;
	Thu, 24 Jul 2025 08:50:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff51ker-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 08:50:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6xOHK012827;
	Thu, 24 Jul 2025 08:50:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 480p30buth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 08:50:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56O8otRF58130866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 08:50:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2039520082;
	Thu, 24 Jul 2025 08:50:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA73B2007B;
	Thu, 24 Jul 2025 08:50:42 +0000 (GMT)
Received: from [9.78.106.34] (unknown [9.78.106.34])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Jul 2025 08:50:42 +0000 (GMT)
Message-ID: <ae8baaa9-663f-4fba-8b40-57eba1c682d2@linux.ibm.com>
Date: Thu, 24 Jul 2025 14:20:40 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next 1/1] powerpc64/bpf: Add jit support for
 load_acquire and store_release
To: Puranjay Mohan <puranjay@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau
 <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Naveen N Rao <naveen@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
        Peilin Ye <yepeilin@google.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
        lkmm@lists.linux.dev
References: <20250717202935.29018-1-puranjay@kernel.org>
 <20250717202935.29018-2-puranjay@kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250717202935.29018-2-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iXf2YxhVeJ319PJmuBS5rxiXfn10jUK7
X-Proofpoint-ORIG-GUID: 8O37o38N0DPrHy9R_NglF9Wz2gkm3eQ6
X-Authority-Analysis: v=2.4 cv=Ae2xH2XG c=1 sm=1 tr=0 ts=6881f3f2 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=2PSJxq-1W1kRQNEbKWkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA2MyBTYWx0ZWRfX5NMzEbxAeeZe
 yt4hCPKWlJU/Q342pQF1mRGP4jWl79t2RO+sSvz0qPAxwZnVx1tTmnGHrW2YjxmScx17y27t+2M
 R6G/xD7IOmftO3IkWuP4c+fAKvvTfu3oPxAhhnEL3xTT0J843G1l5HijXJDBTS9N5c6gRmaFw4k
 dsvh/QKuv66DszSeemZInRGKDjHxxRJvkCETjo5msnOUoQ1kdtAcO+iYYCEctOXiGMNgWef1+mk
 OaZxdBnuxcN508l+EbVHUU+vBQ73CjZQw3yn39SKU+kcs9a5MewMnl9d83ccYh6/DakAgFbt4y1
 crBAgKlmX1Uk5+K9bfT02Ax7de2hvAPh+7d9ZS3c9cBdqIy0RpcEN/DrgNpBi3WBGdTkIsVQAbf
 FEsQEAyovJEc8xtWAAQ6EFkgwHe7925S7uFIzRdDRgsHOjOn7w+LswlEVzwtSWVFFBdHJCb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240063
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 18/07/25 1:59 am, Puranjay Mohan wrote:
> Add JIT support for the load_acquire and store_release instructions. The
> implementation is similar to the kernel where:
> 
>          load_acquire  => plain load -> lwsync
>          store_release => lwsync -> plain store
> 
> To test the correctness of the implementation, following selftests were
> run:
> 
>    [fedora@linux-kernel bpf]$ sudo ./test_progs -a \
>    verifier_load_acquire,verifier_store_release,atomics
>    #11/1    atomics/add:OK
>    #11/2    atomics/sub:OK
>    #11/3    atomics/and:OK
>    #11/4    atomics/or:OK
>    #11/5    atomics/xor:OK
>    #11/6    atomics/cmpxchg:OK
>    #11/7    atomics/xchg:OK
>    #11      atomics:OK
>    #519/1   verifier_load_acquire/load-acquire, 8-bit:OK
>    #519/2   verifier_load_acquire/load-acquire, 8-bit @unpriv:OK
>    #519/3   verifier_load_acquire/load-acquire, 16-bit:OK
>    #519/4   verifier_load_acquire/load-acquire, 16-bit @unpriv:OK
>    #519/5   verifier_load_acquire/load-acquire, 32-bit:OK
>    #519/6   verifier_load_acquire/load-acquire, 32-bit @unpriv:OK
>    #519/7   verifier_load_acquire/load-acquire, 64-bit:OK
>    #519/8   verifier_load_acquire/load-acquire, 64-bit @unpriv:OK
>    #519/9   verifier_load_acquire/load-acquire with uninitialized
>    src_reg:OK
>    #519/10  verifier_load_acquire/load-acquire with uninitialized src_reg
>    @unpriv:OK
>    #519/11  verifier_load_acquire/load-acquire with non-pointer src_reg:OK
>    #519/12  verifier_load_acquire/load-acquire with non-pointer src_reg
>    @unpriv:OK
>    #519/13  verifier_load_acquire/misaligned load-acquire:OK
>    #519/14  verifier_load_acquire/misaligned load-acquire @unpriv:OK
>    #519/15  verifier_load_acquire/load-acquire from ctx pointer:OK
>    #519/16  verifier_load_acquire/load-acquire from ctx pointer @unpriv:OK
>    #519/17  verifier_load_acquire/load-acquire with invalid register R15:OK
>    #519/18  verifier_load_acquire/load-acquire with invalid register R15
>    @unpriv:OK
>    #519/19  verifier_load_acquire/load-acquire from pkt pointer:OK
>    #519/20  verifier_load_acquire/load-acquire from flow_keys pointer:OK
>    #519/21  verifier_load_acquire/load-acquire from sock pointer:OK
>    #519     verifier_load_acquire:OK
>    #556/1   verifier_store_release/store-release, 8-bit:OK
>    #556/2   verifier_store_release/store-release, 8-bit @unpriv:OK
>    #556/3   verifier_store_release/store-release, 16-bit:OK
>    #556/4   verifier_store_release/store-release, 16-bit @unpriv:OK
>    #556/5   verifier_store_release/store-release, 32-bit:OK
>    #556/6   verifier_store_release/store-release, 32-bit @unpriv:OK
>    #556/7   verifier_store_release/store-release, 64-bit:OK
>    #556/8   verifier_store_release/store-release, 64-bit @unpriv:OK
>    #556/9   verifier_store_release/store-release with uninitialized
>    src_reg:OK
>    #556/10  verifier_store_release/store-release with uninitialized src_reg
>    @unpriv:OK
>    #556/11  verifier_store_release/store-release with uninitialized
>    dst_reg:OK
>    #556/12  verifier_store_release/store-release with uninitialized dst_reg
>    @unpriv:OK
>    #556/13  verifier_store_release/store-release with non-pointer
>    dst_reg:OK
>    #556/14  verifier_store_release/store-release with non-pointer dst_reg
>    @unpriv:OK
>    #556/15  verifier_store_release/misaligned store-release:OK
>    #556/16  verifier_store_release/misaligned store-release @unpriv:OK
>    #556/17  verifier_store_release/store-release to ctx pointer:OK
>    #556/18  verifier_store_release/store-release to ctx pointer @unpriv:OK
>    #556/19  verifier_store_release/store-release, leak pointer to stack:OK
>    #556/20  verifier_store_release/store-release, leak pointer to stack
>    @unpriv:OK
>    #556/21  verifier_store_release/store-release, leak pointer to map:OK
>    #556/22  verifier_store_release/store-release, leak pointer to map
>    @unpriv:OK
>    #556/23  verifier_store_release/store-release with invalid register
>    R15:OK
>    #556/24  verifier_store_release/store-release with invalid register R15
>    @unpriv:OK
>    #556/25  verifier_store_release/store-release to pkt pointer:OK
>    #556/26  verifier_store_release/store-release to flow_keys pointer:OK
>    #556/27  verifier_store_release/store-release to sock pointer:OK
>    #556     verifier_store_release:OK
>    Summary: 3/55 PASSED, 0 SKIPPED, 0 FAILED
> 

Thanks for the patch. Looks good.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>   arch/powerpc/include/asm/ppc-opcode.h        |  1 +
>   arch/powerpc/net/bpf_jit_comp64.c            | 82 ++++++++++++++++++++
>   tools/testing/selftests/bpf/progs/bpf_misc.h |  3 +-
>   3 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
> index 4312bcb913a42..8053b24afc395 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -425,6 +425,7 @@
>   #define PPC_RAW_SC()			(0x44000002)
>   #define PPC_RAW_SYNC()			(0x7c0004ac)
>   #define PPC_RAW_ISYNC()			(0x4c00012c)
> +#define PPC_RAW_LWSYNC()		(0x7c2004ac)
>   
>   /*
>    * Define what the VSX XX1 form instructions will look like, then add
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index a25a6ffe7d7cc..025524378443e 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -409,6 +409,71 @@ asm (
>   "		blr				;"
>   );
>   
> +static int emit_atomic_ld_st(const struct bpf_insn insn, struct codegen_context *ctx, u32 *image)
> +{
> +	u32 code = insn.code;
> +	u32 dst_reg = bpf_to_ppc(insn.dst_reg);
> +	u32 src_reg = bpf_to_ppc(insn.src_reg);
> +	u32 size = BPF_SIZE(code);
> +	u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
> +	u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
> +	s16 off = insn.off;
> +	s32 imm = insn.imm;
> +
> +	switch (imm) {
> +	case BPF_LOAD_ACQ:
> +		switch (size) {
> +		case BPF_B:
> +			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> +			break;
> +		case BPF_H:
> +			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
> +			break;
> +		case BPF_W:
> +			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
> +			break;
> +		case BPF_DW:
> +			if (off % 4) {
> +				EMIT(PPC_RAW_LI(tmp1_reg, off));
> +				EMIT(PPC_RAW_LDX(dst_reg, src_reg, tmp1_reg));
> +			} else {
> +				EMIT(PPC_RAW_LD(dst_reg, src_reg, off));
> +			}
> +			break;
> +		}
> +		EMIT(PPC_RAW_LWSYNC());
> +		break;
> +	case BPF_STORE_REL:
> +		EMIT(PPC_RAW_LWSYNC());
> +		switch (size) {
> +		case BPF_B:
> +			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
> +			break;
> +		case BPF_H:
> +			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
> +			break;
> +		case BPF_W:
> +			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
> +			break;
> +		case BPF_DW:
> +			if (off % 4) {
> +				EMIT(PPC_RAW_LI(tmp2_reg, off));
> +				EMIT(PPC_RAW_STDX(src_reg, dst_reg, tmp2_reg));
> +			} else {
> +				EMIT(PPC_RAW_STD(src_reg, dst_reg, off));
> +			}
> +			break;
> +		}
> +		break;
> +	default:
> +		pr_err_ratelimited("unexpected atomic load/store op code %02x\n",
> +				   imm);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   /* Assemble the body code between the prologue & epilogue */
>   int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
>   		       u32 *addrs, int pass, bool extra_pass)
> @@ -898,8 +963,25 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   		/*
>   		 * BPF_STX ATOMIC (atomic ops)
>   		 */
> +		case BPF_STX | BPF_ATOMIC | BPF_B:
> +		case BPF_STX | BPF_ATOMIC | BPF_H:
>   		case BPF_STX | BPF_ATOMIC | BPF_W:
>   		case BPF_STX | BPF_ATOMIC | BPF_DW:
> +			if (bpf_atomic_is_load_store(&insn[i])) {
> +				ret = emit_atomic_ld_st(insn[i], ctx, image);
> +				if (ret)
> +					return ret;
> +
> +				if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
> +					addrs[++i] = ctx->idx * 4;
> +				break;
> +			} else if (size == BPF_B || size == BPF_H) {
> +				pr_err_ratelimited(
> +					"eBPF filter atomic op code %02x (@%d) unsupported\n",
> +					code, i);
> +				return -EOPNOTSUPP;
> +			}
> +
>   			save_reg = tmp2_reg;
>   			ret_reg = src_reg;
>   
> diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
> index 530752ddde8e4..c1cfd297aabf1 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_misc.h
> +++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
> @@ -229,7 +229,8 @@
>   
>   #if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) &&		\
>   	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
> -	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
> +	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) || \
> +	  (defined(__TARGET_ARCH_powerpc))
>   #define CAN_USE_LOAD_ACQ_STORE_REL
>   #endif
>   


