Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141367AD0D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 08:57:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p/55MylD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvDFm39x5z3bqW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 16:57:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p/55MylD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvDDt6xMGz309t
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 16:56:30 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P6acLu024051;
	Mon, 25 Sep 2023 06:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yG4fID0OwV4eSP58yj7XCZWh4TXKHog0Ftalc/TVO0o=;
 b=p/55MylDvikRHRXKzm9LZkxmvNA61Tq9pLjsIXa/DMXT1gxxEtdEDWNOVmIbJLmYRsIL
 vjzfI8xwqOoC73PHmA+bqH+eOgn0WF/q5+kFpeeWKGby7+47ynnSi+pVH3ihUL36ZAvl
 YIqMqDOaZ4Kz+so/jepJl0XytLNlIcfw/M7IvpbjxrTtjo9gWAELMta5xy+9oYvPrsIV
 gEx5EiEht4Lw8HzvY0vA7IJBDpn95ak7KkHX+eyWLVX1xcSA4mokBOPiIVBEeS2mvi1k
 2BW62Yxg9qDxm6I943Yw/YEZFc19c1+TBtBbNxigWoHxbIKwzd1kQfh1avKk7NrioAf5 TQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tapawdw53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 06:56:13 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38P65H3K008250;
	Mon, 25 Sep 2023 06:56:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabbmr5d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 06:56:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38P6uBaJ10814076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 06:56:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36F9120043;
	Mon, 25 Sep 2023 06:56:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B87020040;
	Mon, 25 Sep 2023 06:56:09 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Sep 2023 06:56:09 +0000 (GMT)
Message-ID: <265d1504-2ab7-3aba-16a1-aa7a04f52f89@linux.ibm.com>
Date: Mon, 25 Sep 2023 12:26:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 0/5] powerpc/bpf: use BPF prog pack allocator
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
References: <20230908132740.718103-1-hbathini@linux.ibm.com>
In-Reply-To: <20230908132740.718103-1-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ISXr1o9FcGUitZZcqMwd_ubzZHO1Dlo-
X-Proofpoint-GUID: ISXr1o9FcGUitZZcqMwd_ubzZHO1Dlo-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_03,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=702
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250045
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping!

Comments, please..

On 08/09/23 6:57 pm, Hari Bathini wrote:
> Most BPF programs are small, but they consume a page each. For systems
> with busy traffic and many BPF programs, this may also add significant
> pressure on instruction TLB. High iTLB pressure usually slows down the
> whole system causing visible performance degradation for production
> workloads.
> 
> bpf_prog_pack, a customized allocator that packs multiple bpf programs
> into preallocated memory chunks, was proposed [1] to address it. This
> series extends this support on powerpc.
> 
> Patches 1 & 2 add the arch specific functions needed to support this
> feature. Patch 3 enables the support for powerpc and ensures cleanup
> is handled gracefully. Patch 4 introduces patch_instructions() that
> optimizes some calls while patching more than one instruction. Patch 5
> leverages this new function to improve time taken for JIT'ing BPF
> programs.
> 
> Note that the first 3 patches are sufficient to enable the support
> for bpf_prog_pack on powerpc. Patches 4 & 5 are to improve the JIT
> compilation time of BPF programs on powerpc.
> 
> Changes in v4:
> * Updated bpf_patch_instructions() definition in patch 1/5 so that
>    it doesn't have to be updated again in patch 2/5.
> * Addressed Christophe's comment on bpf_arch_text_invalidate() return
>    value in patch 2/5.
> 
> Changes in v3:
> * Fixed segfault issue observed on ppc32 due to inaccurate offset
>    calculation for branching.
> * Tried to minimize the performance impact for patch_instruction()
>    with the introduction of patch_instructions().
> * Corrected uses of u32* vs ppc_instr_t.
> * Moved the change that introduces patch_instructions() to after
>    enabling bpf_prog_pack support.
> * Added few comments to improve code readability.
> 
> [1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/
> [2] https://lore.kernel.org/all/20230309180028.180200-1-hbathini@linux.ibm.com/
> 
> 
> Hari Bathini (5):
>    powerpc/bpf: implement bpf_arch_text_copy
>    powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
>    powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
>    powerpc/code-patching: introduce patch_instructions()
>    powerpc/bpf: use patch_instructions()
> 
>   arch/powerpc/include/asm/code-patching.h |   1 +
>   arch/powerpc/lib/code-patching.c         |  94 ++++++++++++---
>   arch/powerpc/net/bpf_jit.h               |  12 +-
>   arch/powerpc/net/bpf_jit_comp.c          | 144 ++++++++++++++++++-----
>   arch/powerpc/net/bpf_jit_comp32.c        |  13 +-
>   arch/powerpc/net/bpf_jit_comp64.c        |  10 +-
>   6 files changed, 211 insertions(+), 63 deletions(-)
> 
