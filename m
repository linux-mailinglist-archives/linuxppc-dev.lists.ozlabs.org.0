Return-Path: <linuxppc-dev+bounces-14830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC0CC6031
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 06:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWMPv60xTz2yZ3;
	Wed, 17 Dec 2025 16:13:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765948387;
	cv=none; b=EiBm739iVnALr444SyawIYr0prIlNeWZvSwMu03R+aQbABDdpB1F7HHc8Krfqf/9LjfjbwXXWaNFK+hSdlBqDUlFLJ94SqdLF1vtynswLhbc1bWgZCgYGMEhUMlvahDOWPt2y3SQfSzlCDd0FwV8cw42zB1ZwzszpzF/kRHfP/zx/Nyuz2N8dLKb14H+MPKSrX4x8BIx8Q4uJvIr6ia4FicRh5nIxnIgo6dakpFd4o/uAXsbNxOpkSOd8+tivSSsmyjL3+6E9UiaoY9hvdoxc5XEsK5oAMSOxwYixBCLh4uJ5wssJJaroPFT6sX8INJ5eRYzagMN4XOVLrHWMjlNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765948387; c=relaxed/relaxed;
	bh=AnESU7T2SRFYil9p+DeIoI/bwHRwyGoGhxfQBvRLIpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0POCjBEYJfu4tAm8YihM1EVwXbrFkTQXDDlsSEAbu7d6Hx5UjJAAADYrL6ytdPxOx3lvMJA7OOXEtdoD93fugksJHcwlCSz1sOy3c/1ypKeW8jpS6QClBVh+vjJ1/VWKwAjZw4KUWFNPeCLOSy6GLg9bjcOr+awU+kesMmPKnMO/8LHglSu955NfJgurldBOadhnu3H88SrQ2BR6JjHCl33KhLqwzlRimQxHq8VuwGtppzK5VLaz3IihvvhZ7ntypntqQA9YtxlyHxxCsi/btGlMiMV+uYZJloIyotctapB1WKpvD3xXDbqkezfjr9GRNcZ7idVu0cYBptp0L7mQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRumAIMB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRumAIMB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWMPt61z7z2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 16:13:06 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGL1gUu026434;
	Wed, 17 Dec 2025 05:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AnESU7
	T2SRFYil9p+DeIoI/bwHRwyGoGhxfQBvRLIpU=; b=TRumAIMBIHGnep8uFYoONy
	8NTUw/GI9SDarudESiPfyw9BpXCQZ9xVrOokZL0ii6ufU+ggiB7So74AlL+YN2hF
	LeDpAQySQsyKM31YuvvK1poyV6QksMIfagi2Zhm56bLEXFa7E5gEbgNAgnI9gQwB
	BJLqjUFzaHN+GYjObW6h9xQWut4KN6108wq5rFnRUetnqmC8MMgpeXHE+iEy62c8
	o7LGovl+nrPi4/GJqCgsN55E1271XI4JdoweHYXwlBiW2s2ikKMmUmiuSI3ccvZ0
	HcU6gF6c1sogbNw4B6rsOlTDdmb8jVu/NZuxhRr5Mmdnb/yOhMIO1DakU73wzcCA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8k5n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:12:21 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BH5CKu7013342;
	Wed, 17 Dec 2025 05:12:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8k5n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:12:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH35pQi002976;
	Wed, 17 Dec 2025 05:12:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kykrbur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:12:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BH5CFQ947251868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 05:12:15 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFFC720043;
	Wed, 17 Dec 2025 05:12:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 265E320040;
	Wed, 17 Dec 2025 05:12:11 +0000 (GMT)
Received: from [9.109.222.214] (unknown [9.109.222.214])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 05:12:10 +0000 (GMT)
Message-ID: <a8345e11-d0b4-4000-9f2c-b02f01c8df44@linux.ibm.com>
Date: Wed, 17 Dec 2025 10:42:10 +0530
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
Subject: Re: [PATCH bpf-next v4 2/2] powerpc64/bpf: Inline
 bpf_get_smp_processor_id() and bpf_get_current_task/_btf()
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com
References: <cover.1765343385.git.skb99@linux.ibm.com>
 <89abfdd6f6721fbe7897865e74f2f691e5f7824a.1765343385.git.skb99@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <89abfdd6f6721fbe7897865e74f2f691e5f7824a.1765343385.git.skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfX3mb8lah68yaY
 CBtzFRGOzfDPyxHJEx5BaYo5pv/8V/rUXZfqL94DiW7BMgXqZf0idoXWvam6rmIhW72/SF8N5FL
 8vdrE7E1KAhvQdY2rSJKBpBX+gEXaf5AqraeS5Q46AbWj9nYLSfyDyWvdyY6kQKNjcC6+HdDZ0/
 pFC+/DH3lyhulf1MoLimdEoelGM4qd1oxGieFn9NUs7kkd7pjTbYnDtwte2opQBccbZBujz/W58
 Nt+9W7hDRaZZFstBTu7LyFyrOA1ttcdnP86VRp78JfvzCMSjWUwvDhuIUxWtarbqxmBhB0X/H+j
 Hpli29y3uf4jKbPEe2kBJVsp7KHFKO5r30iVsxhXxMiJeQO5SpLL8MpKPRBza4i5Ecv/DEEtpvz
 nC1w7XUyXQ0yCEf5CjvAQacCsGtqPA==
X-Proofpoint-GUID: Y-kpQC9UTbw1JdLIk6nmtGVNGd8K9mFq
X-Proofpoint-ORIG-GUID: WV4EmMHsCkRlKqMhvUjCFXhos04Kvy5J
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=69423bb5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=PRnckvQuzlTHD8o7MjgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/12/25 12:20 pm, Saket Kumar Bhaskar wrote:
> Inline the calls to bpf_get_smp_processor_id() and bpf_get_current_task/_btf()
> in the powerpc bpf jit.
> 
> powerpc saves the Logical processor number (paca_index) and pointer
> to current task (__current) in paca.
> 
> Here is how the powerpc JITed assembly changes after this commit:
> 
> Before:
> 
> cpu = bpf_get_smp_processor_id();
> 
> addis 12, 2, -517
> addi 12, 12, -29456
> mtctr 12
> bctrl
> mr	8, 3
> 
> After:
> 
> cpu = bpf_get_smp_processor_id();
> 
> lhz 8, 8(13)
> 
> To evaluate the performance improvements introduced by this change,
> the benchmark described in [1] was employed.
> 
> +---------------+-------------------+-------------------+--------------+
> |      Name     |      Before       |        After      |   % change   |
> |---------------+-------------------+-------------------+--------------|
> | glob-arr-inc  | 40.701 ± 0.008M/s | 55.207 ± 0.021M/s |   + 35.64%   |
> | arr-inc       | 39.401 ± 0.007M/s | 56.275 ± 0.023M/s |   + 42.42%   |
> | hash-inc      | 24.944 ± 0.004M/s | 26.212 ± 0.003M/s |   +  5.08%   |
> +---------------+-------------------+-------------------+--------------+
> 
> [1] https://github.com/anakryiko/linux/commit/8dec900975ef
> 

Looks good.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>


> Reviewed-by: Puranjay Mohan <puranjay@kernel.org>
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp.c   | 12 ++++++++++++
>   arch/powerpc/net/bpf_jit_comp64.c | 11 +++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index d53e9cd7563f..b243ee205885 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -471,6 +471,18 @@ bool bpf_jit_supports_percpu_insn(void)
>   	return IS_ENABLED(CONFIG_PPC64);
>   }
>   
> +bool bpf_jit_inlines_helper_call(s32 imm)
> +{
> +	switch (imm) {
> +	case BPF_FUNC_get_smp_processor_id:
> +	case BPF_FUNC_get_current_task:
> +	case BPF_FUNC_get_current_task_btf:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   void *arch_alloc_bpf_trampoline(unsigned int size)
>   {
>   	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 37723ee9344e..6c827e7aa691 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -1400,6 +1400,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   		case BPF_JMP | BPF_CALL:
>   			ctx->seen |= SEEN_FUNC;
>   
> +			if (src_reg == bpf_to_ppc(BPF_REG_0)) {
> +				if (imm == BPF_FUNC_get_smp_processor_id) {
> +					EMIT(PPC_RAW_LHZ(src_reg, _R13, offsetof(struct paca_struct, paca_index)));
> +					break;
> +				} else if (imm == BPF_FUNC_get_current_task ||
> +					   imm == BPF_FUNC_get_current_task_btf) {
> +					EMIT(PPC_RAW_LD(src_reg, _R13, offsetof(struct paca_struct, __current)));
> +					break;
> +				}
> +			}
> +
>   			ret = bpf_jit_get_func_addr(fp, &insn[i], extra_pass,
>   						    &func_addr, &func_addr_fixed);
>   			if (ret < 0)


