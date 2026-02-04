Return-Path: <linuxppc-dev+bounces-16580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ChcNIo8g2ngjwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 13:33:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D47E5D65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 13:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5fs10KWKz2xpk;
	Wed, 04 Feb 2026 23:33:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770208388;
	cv=none; b=iWC/LrIv2fEqDsDjreaDP/1SpuBrn1Gbr98KvaQzFa2c2pA+BafokodVdOPm0rP9077fHCwgHrt3tpDAn8AkKCsdChR7yl6hnDHkW1cVoTk1IqV4Y1EqyPQ7OoGPltGPjCgEIupHB5QZW1gQiAvcn6mslUqyzALzyLNlPykCbzkbHTKe4DSQHsI6DDlta1hT18z9vmvD8xS17IjwCEUBMl6XkJ0GCiP0OmdfUnVr0u3If6dA4uloGfQfRoUjh0WCDUay/NeBWZUCxGUbMOQ94R9oLNsRjsL18kXu2f4a4PcI5Psygvm+T+zV7aFNaoC1eRL/GfzRWmqwR6NsBvjUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770208388; c=relaxed/relaxed;
	bh=/WjOQJOxjCz9b7568NZ1KiO04eRUEtJaSiJEwAqNhC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZNxU+zXn2W33dDZVV6Z5IADoHwyVYvk/NjJseM/kCScTdu22LHqWt30wx0wVXGgH4z0vtgNFQSIdN6MbPiWI6OnN0N1lEf+mEUQInxK848nyLGec2A6MvC175p9u9lGfsRHFB1wVtdsMkiVPRhCLNhnWSeB0jwd6tHui52PurLbHI5+tieTh4XBRk9xd/0ZDX+PnFgOis4Gd5LJt3ayssnLzUD1w/tgRnz/UMPhFOVZ6EDckH3RRydaXB7MNzfHGctaX7pXzv+xjczevLkHmFSQ19CIMTg0HWVb6hECZ8sHLkfCPXQYHyhVH+KpMTn6VchlYGtzUwMbmgq77KAH/DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aINz4J+n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aINz4J+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5frz5x1Sz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 23:33:07 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 613NOF86016796;
	Wed, 4 Feb 2026 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/WjOQJ
	OxjCz9b7568NZ1KiO04eRUEtJaSiJEwAqNhC0=; b=aINz4J+nAJchZD60P7x6yn
	Y80BMMYgXUV2rk3OCU7gThEJc7jJt7C4OVLdBaragjs9y3/sCwA+lKQaO71h6sUK
	30RnklnGftd4+314ykdab5XRDAeyOxY6MCKaH2dMOx9VcGN0PBvQuLzOLW5kJWv5
	CrygHp4vhmFozJtrLYZSv5vx4jy9ebP03WmDZWqKul1bAdBV2E7IRc++1FyRbtLP
	PAxWJKGcQF/DMwk/bB3IplqYwPFKE6hGMFUnCc/B5Gv/B0nrRrpLrl3HpjA+ecFk
	AcoWFhJzoje4howWH0DGSxnhe9cr3LXHY9xiUua0on+Votrfqh0v+jn8WFD/+Z5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19dt9sdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 12:32:30 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 614CWTDw018272;
	Wed, 4 Feb 2026 12:32:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19dt9sdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 12:32:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 614COMvG009156;
	Wed, 4 Feb 2026 12:32:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c1vey59cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 12:32:28 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 614CWQxm25231688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Feb 2026 12:32:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DCBF20040;
	Wed,  4 Feb 2026 12:32:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5492D20043;
	Wed,  4 Feb 2026 12:32:17 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Feb 2026 12:32:17 +0000 (GMT)
Message-ID: <4dc944c7-20ad-4e92-b05e-28a9e0c5a2b8@linux.ibm.com>
Date: Wed, 4 Feb 2026 18:02:16 +0530
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
Subject: Re: [PATCH v3 1/3] crash: Exclude crash kernel memory in crash core
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
        bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com,
        pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
        kees@kernel.org, elver@google.com, arnd@arndb.de, lirongqing@baidu.com,
        fvdl@google.com, leitao@debian.org, rppt@kernel.org,
        cfsworks@gmail.com, osandov@fb.com, ardb@kernel.org,
        ryan.roberts@arm.com, tangyouling@kylinos.cn, ritesh.list@gmail.com,
        bjorn@rivosinc.com, songshuaishuai@tinylab.org,
        samuel.holland@sifive.com, kevin.brodsky@arm.com,
        junhui.liu@pigmoral.tech, vishal.moola@gmail.com, coxu@redhat.com,
        jbohac@suse.cz, liaoyuanhong@vivo.com, brgerst@gmail.com,
        fuqiang.wang@easystack.cn, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260204093728.1447527-1-ruanjinjie@huawei.com>
 <20260204093728.1447527-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260204093728.1447527-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5NCBTYWx0ZWRfX6ODk9iRwaOwq
 z85XGL+iniru1rhf6ipyJewvuFXN1lmnpa5+l3gRtkr/4IxTqNCob97FiJfAMvoksu46eqyFn/T
 w05rt9BWyRN8ILjmribgV83lvOL1SPZSgi+AFFbPS8bsxNyxZkH6VLF4apCIRJVlJVGXWUvHQHy
 9Vqxv4kzrFNyUdGnw2jVp4El5iuWbKgFlNEKNZ+tb58CSeesRfopgLyvR9Urbp110slWyQHa647
 2f0Id5koO4EcvIkMnIkcXY/O9kutqkytktvM6MZukOcbt9UjvPTU3RAcXlkqMPsnUziWfcv0AoE
 sMRW3V6yTRc5PC4kUuzP3QnQzhcjMFuN3ybj1DtYgD+irVy/xIjSUlBVR4/MSkkvP2mJvhVmPhH
 QHYcDTMA3fERMKRu1ifPVbRqN8N3hzSig5UtY30Qx8aS3N+kQH5+l6f/2ZpWXSNMq8amCLMcivZ
 0mDRgkuhedbOfFPEkDw==
X-Proofpoint-GUID: 0SuIx6qwYi7MaL-ogiWBSNhOs5EXr_YM
X-Proofpoint-ORIG-GUID: l4ciZUr_L7U0E0rs8abUq6bBK46dkESu
X-Authority-Analysis: v=2.4 cv=LesxKzfi c=1 sm=1 tr=0 ts=69833c5e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=i0EeH86SAAAA:8 a=FDmX_dieBizYas7WUKAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_03,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2602040094
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16580-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,suse.cz,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:pawan.kumar.gupta@linux.intel.com,m:feng.tang@linux.alibaba.com,m:kees@kernel.org,m:elver@google.com,m:arnd@arndb.de,m:lirongqing@baidu.com,m:fvdl@google.com,m:leitao@debian.org,m:rppt@kernel.org,m:cfsworks@gmail.com,m:osandov@fb.com,m:ardb@kernel.org,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:bjorn@rivosinc.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:junhui.liu@pigmoral.tech,m:vishal.moola@gmail.com,m:coxu@redhat.com,m
 :jbohac@suse.cz,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:fuqiang.wang@easystack.cn,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 40D47E5D65
X-Rspamd-Action: no action



On 04/02/26 15:07, Jinjie Ruan wrote:
> The exclude of crashk_res, crashk_low_res and crashk_cma memory
> are almost identical across different architectures, so handling them
> in the crash core would eliminate a lot of duplication, so do
> them in the common code.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   arch/arm64/kernel/machine_kexec_file.c     | 12 -------
>   arch/loongarch/kernel/machine_kexec_file.c | 12 -------
>   arch/powerpc/kexec/ranges.c                | 16 ++-------
>   arch/riscv/kernel/machine_kexec_file.c     |  5 +--
>   arch/x86/kernel/crash.c                    | 39 ++--------------------
>   kernel/crash_core.c                        | 28 ++++++++++++++++
>   6 files changed, 34 insertions(+), 78 deletions(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index 410060ebd86d..ed2c45007158 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -64,20 +64,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>   		cmem->nr_ranges++;
>   	}
>   
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret)
> -		goto out;
> -
> -	if (crashk_low_res.end) {
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> -		if (ret)
> -			goto out;
> -	}
> -
>   	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>   
> -out:
>   	kfree(cmem);
>   	return ret;
>   }
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index fb57026f5f25..26f867e53955 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -80,20 +80,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>   		cmem->nr_ranges++;
>   	}
>   
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret < 0)
> -		goto out;
> -
> -	if (crashk_low_res.end) {
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> -		if (ret < 0)
> -			goto out;
> -	}
> -
>   	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>   
> -out:
>   	kfree(cmem);
>   	return ret;
>   }
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 867135560e5c..3f76dd266b1f 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -553,9 +553,7 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>   #endif /* CONFIG_KEXEC_FILE */
>   
>   #ifdef CONFIG_CRASH_DUMP
> -static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
> -					   unsigned long long mstart,
> -					   unsigned long long mend)
> +static int crash_realloc_mem_range_guarded(struct crash_mem **mem_ranges)
>   {
>   	struct crash_mem *tmem = *mem_ranges;
>   
> @@ -566,7 +564,7 @@ static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
>   			return -ENOMEM;
>   	}
>   
> -	return crash_exclude_mem_range(tmem, mstart, mend);
> +	return 0;
>   }
>   
>   /**
> @@ -604,18 +602,10 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>   			sort_memory_ranges(*mem_ranges, true);
>   	}
>   
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
> +	ret = crash_realloc_mem_range_guarded(mem_ranges);

What if max_nr_ranges - nr_ranges = 1, then no realloc will happen here. 
And in
elf_header_exclude_ranges we may not enough space to store additional 
memory ranges needed while excluding one or more CMA ranges.

>   	if (ret)
>   		goto out;
>   
> -	for (i = 0; i < crashk_cma_cnt; ++i) {
> -		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
> -					      crashk_cma_ranges[i].end);
> -		if (ret)
> -			goto out;
> -	}
> -
>   	/*
>   	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>   	 *        regions are exported to save their context at the time of
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index dd9d92a96517..fec3622a13c9 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -74,10 +74,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>   	if (ret)
>   		goto out;
>   
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (!ret)
> -		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> +	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>   
>   out:
>   	kfree(cmem);
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 335fd2ee9766..d8341a48f6b3 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -186,41 +186,6 @@ static struct crash_mem *fill_up_crash_elf_data(void)
>   	return cmem;
>   }
>   
> -/*
> - * Look for any unwanted ranges between mstart, mend and remove them. This
> - * might lead to split and split ranges are put in cmem->ranges[] array
> - */
> -static int elf_header_exclude_ranges(struct crash_mem *cmem)
> -{
> -	int ret = 0;
> -	int i;
> -
> -	/* Exclude the low 1M because it is always reserved */
> -	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
> -	if (ret)
> -		return ret;
> -
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret)
> -		return ret;
> -
> -	if (crashk_low_res.end)
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
> -					      crashk_low_res.end);
> -	if (ret)
> -		return ret;
> -
> -	for (i = 0; i < crashk_cma_cnt; ++i) {
> -		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> -					      crashk_cma_ranges[i].end);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>   {
>   	struct crash_mem *cmem = arg;
> @@ -247,8 +212,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz,
>   	if (ret)
>   		goto out;
>   
> -	/* Exclude unwanted mem ranges */
> -	ret = elf_header_exclude_ranges(cmem);
> +	/* Exclude the low 1M because it is always reserved */
> +	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
>   	if (ret)
>   		goto out;
>   
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 99dac1aa972a..5c0de111ddc3 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -18,6 +18,7 @@
>   #include <linux/memblock.h>
>   #include <linux/kmemleak.h>
>   #include <linux/crash_core.h>
> +#include <linux/crash_reserve.h>
>   #include <linux/reboot.h>
>   #include <linux/btf.h>
>   #include <linux/objtool.h>
> @@ -161,8 +162,30 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
>   	return !res->end ? 0 : resource_size(res);
>   }
>   
> +static int crash_exclude_mem_ranges(struct crash_mem *cmem)
> +{
> +	int ret, i;
> +
> +	/* Exclude crashkernel region */
> +	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> +	if (ret)
> +		return ret;
> +
> +	if (crashk_low_res.end) {
> +		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> +		if (ret)
> +			return ret;
> +	}
>   
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;
> +	}
>   
> +	return ret;
> +}
>   
>   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>   			  void **addr, unsigned long *sz)
> @@ -174,6 +197,11 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>   	unsigned int cpu, i;
>   	unsigned long long notes_addr;
>   	unsigned long mstart, mend;
> +	int ret;
> +
> +	ret = crash_exclude_mem_ranges(mem);

I think the assumption here is that mem should have enough space
to hold the extra ranges created while excluding crash memory ranges.
Right now, this is not happening on powerpc for the case I mentioned
in the above comment.

Also, if crashk_cma_cnt changes in the future, or if a new type of
crash memory is added, then every architecture would need to adjust
the mem allocation accordingly. Instead, could we handle this in
generic code rather than in architecture-specific code, so that we
always ensure mem has enough space?

> +	if (ret)
> +		return ret;
>   
>   	/* extra phdr for vmcoreinfo ELF note */
>   	nr_phdr = nr_cpus + 1;


