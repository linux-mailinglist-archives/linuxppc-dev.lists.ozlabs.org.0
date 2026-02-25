Return-Path: <linuxppc-dev+bounces-17175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGPvC67SnmnwXQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:45:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB5195F47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWSV520Nz3cCr;
	Wed, 25 Feb 2026 21:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772016298;
	cv=none; b=HZ+glJgOjoRxcZ3d27xqccanS+KCllxzRqC8koKKNwNWafRxKZOYEt3cS6m1trDiVQkfYgW/63+Dheic5tvXyo16j/UM2mjWi4JwLV9peaFfipCugwMDOOB0qRaOZuAdA0CzxdBgzw3J3gsoUTod8WkMGqsLmKIBnnrLBd3LeQ2J4mlxdpRDjWEsc3jEqGLAMamxWIuv8onx6R8jMRXvWkr6iYBNWKyYROpyw9C/QNROKFfYLTu4GZVZZalEVlvP8Ja8vXenbMqp2ncwdOEUrsPwAvaSdmzdCD/OVEdWvst8P9vyhX5Pe9/BKHsbR5+7JYq+Ba0uMFaMIpuCUzXWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772016298; c=relaxed/relaxed;
	bh=xp+fmyg5YaGTIeutgO2mg1a+mQgH/dJtT9J5/WJVuzI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=MD67SeF5D2sUVwGoNHQkz2fdpAF+sbnJrgI7yhkfLFuf0sfpb8oXREG8JydhgUzYxVepBv1KQPYOWCu7XEK3uHfrJJZf1SB02NdceNmGC1V0RiajPaPzd6EZfub2zGBXvHkZYLrs1yaN8rWq2RgVa1axCWRC4VRn219iWtF067cKctZD9yzT3VF61ASoCnHMe4aXHl+3JtOL2t9ezAMeJjskEtm2VyJ6FlNH97YOnCYXdjw02C3nGb9tgSKO2zbKXJcoBSgWpbtzzMrGsQbfXhtIMjkL1eUncXL9YVqD+/iAG/nfv1Jf82680vLTjnsKHusHaT30BhgQRJM3bJup6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qiz84T9y; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qiz84T9y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWST5XWnz3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 21:44:57 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2J6eX3390406;
	Wed, 25 Feb 2026 10:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xp+fmy
	g5YaGTIeutgO2mg1a+mQgH/dJtT9J5/WJVuzI=; b=Qiz84T9ycP1e4pYqWJ1Ye0
	C1NZNjPLcOa8pkah40wKF8fzwugly3o2GDQg+rEIoB+jrF6ieS0q9je+wsRmxs3L
	Au2Bwjt1Kvyoy95GuUfvD8rwyMH/N7RBakgbQV9AFYz+KUJ0O71+eqaBXbkotzVT
	0lR9Gq+mhb6pHUmTDDUO1vdH/gArwCEQ1yppxgSV9zK9O3zKB9/pF8ni5BXgEA1z
	8ROi2MOeetqTXNt5DJe5tShO8EYh6m+gdZLJnpsco220njhNyKJ3wa76lmyTJiUr
	PIpt6dWCvrF/fnjpBZcHRxHLcpfLYbT/Q3UO53YzUaMM9Blp+Ke9lFkB6ptQHqzA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471yv6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:44:32 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P7UmXb013419;
	Wed, 25 Feb 2026 10:44:31 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdy5163-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:44:31 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PAiVDB16843314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 10:44:31 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AD9758059;
	Wed, 25 Feb 2026 10:44:31 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16EE958058;
	Wed, 25 Feb 2026 10:44:30 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 10:44:29 +0000 (GMT)
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
Date: Wed, 25 Feb 2026 16:14:29 +0530
From: adubey <adubey@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev, hbathini@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, ast@kernel.org, daniel@iogearbox.net,
        andrii@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
        yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev,
        chleroy@kernel.org
Subject: Re: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private
 stack
In-Reply-To: <202602170316.V2RZWuVa-lkp@intel.com>
References: <20260216152234.36632-1-adubey@linux.ibm.com>
 <202602170316.V2RZWuVa-lkp@intel.com>
Message-ID: <9551528cd98e18e6ee74d781a7ebdcf6@linux.ibm.com>
X-Sender: adubey@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: bNb1eWSlQ6Tiz76DnbRIcTLI9rdZrCoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNCBTYWx0ZWRfX+ZZgqGxBhD6A
 LOJgh36nAYMRmZw4YZST0bhc05zShmMunuSpP+rHxk7EB4e0/bZUmM6HKpm8aFr1d/zYCnnJYr+
 udje6M+++08x3xCtpiqJcNQKrk9iNHINdcZ2TFbXxjmF7A84ftSr9OBOxQNYVBdQHpnIf07AXbS
 KVnpYpOoGWk/Bw9XDHKT3miPC3QOxcr1x1a6o2PylwbgtP+2iiVLrVo6bNRZJnbgxa76HGawbWf
 gC8VO78/Tn4bKtlIbA7b1KaY5sH1cEInIj56GGHM9ceEC4L8z5s/pc7Q5qCU79Pp5fxZ4WDPzpo
 UFVTe8ag6YgSDLts6LtS76EVaF5I9gxYLc3Jy/DfXMHonUSLBSz65KKYLgZSPj9KFfumFdfdr42
 3sO55mTwk+wr4+xk2yq0XhmxhCLap85TF6SrneFfrY6Cun/Gizz4AaXmKEYD2OUoOGFcrWfUwRR
 De9sdTFSO9XvCQnEUxw==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699ed291 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=anyJmfQTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=Z0tam39agOwvZVY3ivQA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: M_C0ralGnt9FeYls6PKf0rnq7QmzJ5r3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250104
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17175-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linux.ibm.com:mid,git-scm.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,01.org:url];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:bpf@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:chleroy@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3FAB5195F47
X-Rspamd-Action: no action

On 2026-02-17 00:44, kernel test robot wrote:
> Hi,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on bpf-next/master]
> [also build test WARNING on bpf/master powerpc/next linus/master 
> next-20260216]
> [cannot apply to bpf-next/net powerpc/fixes v6.19]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:
> https://github.com/intel-lab-lkp/linux/commits/adubey-linux-ibm-com/selftests-bpf-Enable-private-stack-tests-for-powerpc64/20260216-182353
> base:   
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:
> https://lore.kernel.org/r/20260216152234.36632-1-adubey%40linux.ibm.com
> patch subject: [PATCH 1/2] powerpc64/bpf: Implement JIT support for
> private stack
> config: powerpc-randconfig-001-20260217
> (https://download.01.org/0day-ci/archive/20260217/202602170316.V2RZWuVa-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20260217/202602170316.V2RZWuVa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202602170316.V2RZWuVa-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/powerpc/net/bpf_jit_comp.c: In function 'bpf_int_jit_compile':
>>> arch/powerpc/net/bpf_jit_comp.c:266:35: warning: cast from pointer to 
>>> integer of different size [-Wpointer-to-int-cast]
>      cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;
>                                       ^
> 
> 
> vim +266 arch/powerpc/net/bpf_jit_comp.c
> 
>    164
>    165	struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>    166	{
>    167		u32 proglen;
>    168		u32 alloclen;
>    169		u8 *image = NULL;
>    170		u32 *code_base;
>    171		u32 *addrs;
>    172		struct powerpc_jit_data *jit_data;
>    173		struct codegen_context cgctx;
>    174		int pass;
>    175		int flen;
>    176		int priv_stack_alloc_size;
>    177		void __percpu *priv_stack_ptr = NULL;
>    178		struct bpf_binary_header *fhdr = NULL;
>    179		struct bpf_binary_header *hdr = NULL;
>    180		struct bpf_prog *org_fp = fp;
>    181		struct bpf_prog *tmp_fp;
>    182		bool bpf_blinded = false;
>    183		bool extra_pass = false;
>    184		u8 *fimage = NULL;
>    185		u32 *fcode_base;
>    186		u32 extable_len;
>    187		u32 fixup_len;
>    188
>    189		if (!fp->jit_requested)
>    190			return org_fp;
>    191
>    192		tmp_fp = bpf_jit_blind_constants(org_fp);
>    193		if (IS_ERR(tmp_fp))
>    194			return org_fp;
>    195
>    196		if (tmp_fp != org_fp) {
>    197			bpf_blinded = true;
>    198			fp = tmp_fp;
>    199		}
>    200
>    201		jit_data = fp->aux->jit_data;
>    202		if (!jit_data) {
>    203			jit_data = kzalloc(sizeof(*jit_data), GFP_KERNEL);
>    204			if (!jit_data) {
>    205				fp = org_fp;
>    206				goto out;
>    207			}
>    208			fp->aux->jit_data = jit_data;
>    209		}
>    210
>    211		if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
>    212			/*
>    213			 * Allocate private stack of size equivalent to
>    214			 * verifier-calculated stack size plus two memory
>    215			 * guard regions to detect private stack overflow
>    216			 * and underflow.
>    217			 */
>    218			priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
>    219								2 * PRIV_STACK_GUARD_SZ;
>    220			priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size,
> 16, GFP_KERNEL);
>    221			if (!priv_stack_ptr) {
>    222				fp = org_fp;
>    223				goto out_priv_stack;
>    224			}
>    225
>    226			priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
>    227			fp->aux->priv_stack_ptr = priv_stack_ptr;
>    228		}
>    229
>    230		flen = fp->len;
>    231		addrs = jit_data->addrs;
>    232		if (addrs) {
>    233			cgctx = jit_data->ctx;
>    234			/*
>    235			 * JIT compiled to a writable location (image/code_base) 
> first.
>    236			 * It is then moved to the readonly final location 
> (fimage/fcode_base)
>    237			 * using instruction patching.
>    238			 */
>    239			fimage = jit_data->fimage;
>    240			fhdr = jit_data->fhdr;
>    241			proglen = jit_data->proglen;
>    242			hdr = jit_data->hdr;
>    243			image = (void *)hdr + ((void *)fimage - (void *)fhdr);
>    244			extra_pass = true;
>    245			/* During extra pass, ensure index is reset before
> repopulating extable entries */
>    246			cgctx.exentry_idx = 0;
>    247			goto skip_init_ctx;
>    248		}
>    249
>    250		addrs = kcalloc(flen + 1, sizeof(*addrs), GFP_KERNEL);
>    251		if (addrs == NULL) {
>    252			fp = org_fp;
>    253			goto out_addrs;
>    254		}
>    255
>    256		memset(&cgctx, 0, sizeof(struct codegen_context));
>    257		bpf_jit_init_reg_mapping(&cgctx);
>    258
>    259		/* Make sure that the stack is quadword aligned. */
>    260		cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
>    261		cgctx.arena_vm_start = 
> bpf_arena_get_kern_vm_start(fp->aux->arena);
>    262		cgctx.user_vm_start = 
> bpf_arena_get_user_vm_start(fp->aux->arena);
>    263		cgctx.is_subprog = bpf_is_subprog(fp);
>    264		cgctx.exception_boundary = fp->aux->exception_boundary;
>    265		cgctx.exception_cb = fp->aux->exception_cb;
>  > 266		cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;
>    267
>    268		/* Scouting faux-generate pass 0 */
>    269		if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, 
> false)) {
>    270			/* We hit something illegal or unsupported. */
>    271			fp = org_fp;
>    272			goto out_addrs;
>    273		}
>    274
>    275		/*
>    276		 * If we have seen a tail call, we need a second pass.
>    277		 * This is because bpf_jit_emit_common_epilogue() is called
>    278		 * from bpf_jit_emit_tail_call() with a not yet stable 
> ctx->seen.
>    279		 * We also need a second pass if we ended up with too large
>    280		 * a program so as to ensure BPF_EXIT branches are in range.
>    281		 */
>    282		if (cgctx.seen & SEEN_TAILCALL ||
> !is_offset_in_branch_range((long)cgctx.idx * 4)) {
>    283			cgctx.idx = 0;
>    284			if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, 
> false)) {
>    285				fp = org_fp;
>    286				goto out_addrs;
>    287			}
>    288		}
>    289
>    290		bpf_jit_realloc_regs(&cgctx);
>    291		/*
>    292		 * Pretend to build prologue, given the features we've seen.  
> This will
>    293		 * update ctgtx.idx as it pretends to output instructions, then 
> we can
>    294		 * calculate total size from idx.
>    295		 */
>    296		bpf_jit_build_prologue(NULL, &cgctx);
>    297		addrs[fp->len] = cgctx.idx * 4;
>    298		bpf_jit_build_epilogue(NULL, &cgctx);
>    299
>    300		fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
>    301		extable_len = fp->aux->num_exentries * sizeof(struct
> exception_table_entry);
>    302
>    303		proglen = cgctx.idx * 4;
>    304		alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + 
> extable_len;
>    305
>    306		fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, 
> &image,
>    307						      bpf_jit_fill_ill_insns);
>    308		if (!fhdr) {
>    309			fp = org_fp;
>    310			goto out_addrs;
>    311		}
>    312
>    313		if (extable_len)
>    314			fp->aux->extable = (void *)fimage + FUNCTION_DESCR_SIZE +
> proglen + fixup_len;
>    315
>    316	skip_init_ctx:
>    317		code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
>    318		fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);
>    319
>    320		/* Code generation passes 1-2 */
>    321		for (pass = 1; pass < 3; pass++) {
>    322			/* Now build the prologue, body code & epilogue for real. */
>    323			cgctx.idx = 0;
>    324			cgctx.alt_exit_addr = 0;
>    325			bpf_jit_build_prologue(code_base, &cgctx);
>    326			if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, 
> addrs, pass,
>    327					       extra_pass)) {
>    328				bpf_arch_text_copy(&fhdr->size, &hdr->size, 
> sizeof(hdr->size));
>    329				bpf_jit_binary_pack_free(fhdr, hdr);
>    330				fp = org_fp;
>    331				goto out_addrs;
>    332			}
>    333			bpf_jit_build_epilogue(code_base, &cgctx);
>    334
>    335			if (bpf_jit_enable > 1)
>    336				pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
>    337					proglen - (cgctx.idx * 4), cgctx.seen);
>    338		}
>    339
>    340		if (bpf_jit_enable > 1)
>    341			/*
>    342			 * Note that we output the base address of the code_base
>    343			 * rather than image, since opcodes are in code_base.
>    344			 */
>    345			bpf_jit_dump(flen, proglen, pass, code_base);
>    346
Fixed in v2 : 
https://lore.kernel.org/bpf/20260216152234.36632-1-adubey@linux.ibm.com/

-Abhishek

