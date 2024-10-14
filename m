Return-Path: <linuxppc-dev+bounces-2233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37B99D3D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 17:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS1pc6Qjcz3bbp;
	Tue, 15 Oct 2024 02:48:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728920888;
	cv=none; b=Ha9d1XBhtIrSaKdRSl+HXqry8A3jOqHmhUHF/qwT9qupeo3wd81aTyl0y2KQryZb9fIn+5zLxVUMKE7MBxHs3c4aLdbBjOnIwFkoFu7alwA5vLEBFyKOafLTtNnLjZyE3ZuYO9Ai+PLiVMDtAaF/GLW6rzW9FusPO3he1z2Ii1HKY/sWlEx6Zh4RO4PYzjSnxbiSjXiWREzX9BDnChzwsr2aXvjQ838/MHaQkFO7MnNVXCWfftvYl+dCs3GXISz4OvM669fCIPbfcIzxIFMPRyZlQy03/27QwQY2SZQJJj/E5sA0ZDyURo58a8t8K06sUVkRBht+fys4OrelmqRNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728920888; c=relaxed/relaxed;
	bh=mqTXyRWMB3w0HH0XDXzBsU9A4VKm9qePpWykY6DK43Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5PerCfF+G+rLXZn02jR89gGi7MoGyS5u03zGSfOmcs3KiLoJp+VXR3b+Lnkv4dqvaGlxiCQjJ7xZUahUCuQmPEbNkBMGWmt/BC8KI6AfpjB0G/gxymADSg08t4z7PwO2wlAS/nxPokbc5oayaLHk8LvJOoGngbKfI7iibCOVIp0hl3zy2qOSyedNAK+v29ToFJOT9APfFeyYxMdnv1GPgkEz5NpqZIJiBHO405JZUiVBqzkOd/y8k+nU6dTAh+5jWZ1PPdSSze1d87l6qHPy5F2HLd8oZtpTqfQYgkQ6eK94A63+9sTDEp6MCV9fKTwoZScbQhLrJsrgnZaEL6NEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H4y6RVpg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H4y6RVpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS1pb6jcrz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 02:48:07 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EEPArw027489;
	Mon, 14 Oct 2024 15:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=m
	qTXyRWMB3w0HH0XDXzBsU9A4VKm9qePpWykY6DK43Q=; b=H4y6RVpgiYsGQPpOt
	gCmJWd1gzeYNZXLvt79UsOUMjRQdZ+WMQ/53slT8i3a38gIhXaFemfkm0zyYL2TS
	P5P4D3iM0Q+ap9Z4LcjU6eyqcRBcZ+zfIC8wrAmF7z0hjDzPLR68TjQcViLj0m2B
	6Q+toG7DuodZPn44U974gKIG43fRx55fyfCgtDDULyu/MC0PxKWap7OV1uSc3P/F
	vfeoOdiNwWBGPMs9ReMQBE/isePJG/b1bepAlYtfgmbL9HAepNZhoTDQlc/tTCBi
	QOHnn1FGyKqkqYsXGViVAUXQvxWc0kNFXdouKCQ+1D+2uWSDh+vLjMMImLXuX/PQ
	C9zhg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42951u8d9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:47:05 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49EFggWY013650;
	Mon, 14 Oct 2024 15:47:05 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42951u8d98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:47:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49ECgom4005930;
	Mon, 14 Oct 2024 15:47:03 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 428650q0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:47:03 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EFl2FM41484626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 15:47:02 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43ED75805E;
	Mon, 14 Oct 2024 15:47:02 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1171758050;
	Mon, 14 Oct 2024 15:46:41 +0000 (GMT)
Received: from [9.43.6.16] (unknown [9.43.6.16])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 15:46:40 +0000 (GMT)
Message-ID: <43eacfd6-e1a3-4d2c-9511-9b5a5707bdcf@linux.ibm.com>
Date: Mon, 14 Oct 2024 21:16:38 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>,
        Sean Christopherson <seanjc@google.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
References: <20240920174740.781614-1-coltonlewis@google.com>
 <20240920174740.781614-4-coltonlewis@google.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240920174740.781614-4-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jwz0y2srETrJq5vnDrTRMrnGUJsrEiit
X-Proofpoint-ORIG-GUID: ZjFOQbPfI4aepiuQmLev7nPPg0fy7QCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140113
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 9/20/24 11:17 PM, Colton Lewis wrote:
> Make sure powerpc uses the arch-specific function now that those have
> been reorganized.
>

Changes looks fine to me.
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/powerpc/perf/callchain.c    | 2 +-
>  arch/powerpc/perf/callchain_32.c | 2 +-
>  arch/powerpc/perf/callchain_64.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index 6b4434dd0ff3..26aa26482c9a 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -51,7 +51,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>  
>  	lr = regs->link;
>  	sp = regs->gpr[1];
> -	perf_callchain_store(entry, perf_instruction_pointer(regs));
> +	perf_callchain_store(entry, perf_arch_instruction_pointer(regs));
>  
>  	if (!validate_sp(sp, current))
>  		return;
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> index ea8cfe3806dc..ddcc2d8aa64a 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -139,7 +139,7 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>  	long level = 0;
>  	unsigned int __user *fp, *uregs;
>  
> -	next_ip = perf_instruction_pointer(regs);
> +	next_ip = perf_arch_instruction_pointer(regs);
>  	lr = regs->link;
>  	sp = regs->gpr[1];
>  	perf_callchain_store(entry, next_ip);
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> index 488e8a21a11e..115d1c105e8a 100644
> --- a/arch/powerpc/perf/callchain_64.c
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -74,7 +74,7 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>  	struct signal_frame_64 __user *sigframe;
>  	unsigned long __user *fp, *uregs;
>  
> -	next_ip = perf_instruction_pointer(regs);
> +	next_ip = perf_arch_instruction_pointer(regs);
>  	lr = regs->link;
>  	sp = regs->gpr[1];
>  	perf_callchain_store(entry, next_ip);


