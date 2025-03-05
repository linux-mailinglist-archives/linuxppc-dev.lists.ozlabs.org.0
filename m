Return-Path: <linuxppc-dev+bounces-6737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0AA4FE06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 12:52:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z79sL3L8fz3btR;
	Wed,  5 Mar 2025 22:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741175558;
	cv=none; b=T5ozdxt0oCNAixC7fljlJOeWxo8dcM/i4lL63Qxb4weVLZ+HlgSW09bsXGxOUGAKOz99QbsU8SFOht4MGTuKFDj7B+NtL9aB0PX2E4W2C8F3kLOceA6tL931QiWL659a3KN3tF5blf1rrOeE+GYiXfUg+7CSNjkHFTzzsGIWGMmhkRbMDRfvjiqiHczz3Tc/xS8yHZS2GruJxgR8MA7/jLYz4tHMfi5FaHdjPxIVFfd64ztJNzaHrvDl6GacAsnRIhivaURYfHLFalI1ko2e3glLE7JsH4y1iOYJLC8ds+S6FdlCadncsKrrm5g4bogxQt5RTC6sPa26h2KT/VAA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741175558; c=relaxed/relaxed;
	bh=CmWgwMXAI84JfO12Ie7NIZL1K4VwQJz7DUej6aLPSqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQ5ALNbENzqXPWJjcQrbTi4nM8BLZWq148NvzhF9StaIS3ZmazsZ44fj54hLooUKRnPG830ZBwefCNMq1YuU1irhY2jjmD5+lgR9yZDoEeXGkJnU4uXxD3eWgyGF/VVao+LQ3flbxIkC9vSm36SIQe0OCZH3JiJQzwU2Z4Js8uISOsfWaJ44n0CwAdw+V6cRSUvJRvmiKMXKv8dbZopeZMRqqcDly2Th1ISV6FVKVlK/UYd5mKH2ezzk+vNjNFuyYK7a2CBlhpRnWXGwHAOkcP4al7DC6pszYc/5nZfUmiQXJKEFo0ByjFfnUC/PiLMBOX3OCrB5AzvmcykMKTfJ6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rLAHfDGZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rLAHfDGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z79sK2j1Tz3bsY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 22:52:36 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5259XmAN026572;
	Wed, 5 Mar 2025 11:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CmWgwM
	XAI84JfO12Ie7NIZL1K4VwQJz7DUej6aLPSqs=; b=rLAHfDGZkwKrfWu7cSHGEO
	JBlPAVr3bH9BUgE/ODLJqeqdax4XdwHW5ewmiwQD4ro7ba42WFh+VqEnzj2/0YkN
	lhIh2+hcpVjfG2jNVpiMYlTv4IZI3COxV2ccaDV9BLfVdjHSgQQd6DClNaf9pGXL
	1HQ5x9LCznEUL+wg6raJtAb41Ch+XljOEswJuf6rzty/WAvIfldd3ANIZfLkCA7O
	daLFxZQ52OLWtkm6OUmJHKyGx4LD8C25JcDvzeUTB0Mc9of4if2N8pVlce4L3FX+
	aeDcmGyyda0P7YGnxQpt5DgCUR2DCOZ81FvXUjkU/88pN8PYV3G/dya4wxpe/avQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568x538gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:52:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 525BnsG6018282;
	Wed, 5 Mar 2025 11:52:30 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568x538gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:52:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5258hciC020928;
	Wed, 5 Mar 2025 11:52:29 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 454esk29qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:52:29 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 525BqPq365798506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 11:52:25 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 876E458050;
	Wed,  5 Mar 2025 11:52:26 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C08F5805F;
	Wed,  5 Mar 2025 11:52:22 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Mar 2025 11:52:21 +0000 (GMT)
Message-ID: <569fed73-20f7-4f54-bcdd-67fa9357aa1d@linux.ibm.com>
Date: Wed, 5 Mar 2025 17:22:20 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/perf/powerpc: Use return code from
 disasm_line__parse
Content-Language: en-GB
To: Athira Rajeev <atrajeev@linux.ibm.com>, acme@kernel.org, jolsa@kernel.org,
        adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        Tejas.Manhas1@ibm.com
References: <20250304154114.62093-1-atrajeev@linux.ibm.com>
 <20250304154114.62093-2-atrajeev@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250304154114.62093-2-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n6wKdJOmpaRpc6VNUbLl-5KBdDuxofiJ
X-Proofpoint-ORIG-GUID: QwBWc00gfUCfNTo0Y7X4NxJ_KdEEMXUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050093
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

I was able to reproduce the issue without this patch.

Applied this patch on next-20250227 kernel and tested the patch and 
issue is fixed.

Please add below tag.

Tested-By: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

On 04/03/25 9:11 pm, Athira Rajeev wrote:
> In disasm_line__parse_powerpc() , return code from function
> disasm_line__parse() is ignored. This will result in bad results
> if the disasm_line__parse fails to disasm the line. Use
> the return code to fix this.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>   tools/perf/util/disasm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index a53e8c4e5bca..8f0eb56c6fc6 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -976,6 +976,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_ar
>   	char *tmp_raw_insn, *name_raw_insn = skip_spaces(line);
>   	char *name = skip_spaces(name_raw_insn + RAW_BYTES);
>   	int disasm = 0;
> +	int ret = 0;
>   
>   	if (args->options->disassembler_used)
>   		disasm = 1;
> @@ -984,7 +985,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_ar
>   		return -1;
>   
>   	if (disasm)
> -		disasm_line__parse(name, namep, rawp);
> +		ret = disasm_line__parse(name, namep, rawp);
>   	else
>   		*namep = "";
>   
> @@ -998,7 +999,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_ar
>   	if (disasm)
>   		dl->raw.raw_insn = be32_to_cpu(dl->raw.raw_insn);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void annotation_line__init(struct annotation_line *al,

