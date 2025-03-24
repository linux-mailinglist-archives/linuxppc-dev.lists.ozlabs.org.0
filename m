Return-Path: <linuxppc-dev+bounces-7311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F7A6D9FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 13:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLsbt5npFz2yb9;
	Mon, 24 Mar 2025 23:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742818890;
	cv=none; b=kKG2/v3Cs/adx+yg3ynSfy23n3wijs7yggV5o6Ona1F2PzVlpUOEmmBcKyssprC4FDEXVuU5BVXF5ujhahCzAKGMkVtYCp2JGE21Y6L1EKaSnZHhlDOXyuMRrxJw/WHp9GhcL3Fou4dsKeOwqApj23FJlFxIcIhiaZVEgJz3cqliTEmKP5ISDdeZlThXlp9yeDQWtgBVQ48YGZL/f46PGfTjnb75NfFMG1tOdT7LfpOikQAuFKxVc02aA3LXXg7GfsYJxqRBIxB3xhwsvIYOqwbGRE4a3lAGZ2G4YQ7jvTu2zYvNrGlApdqNaVIiB2cEMjZnx6JlxhIBuB34M2SlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742818890; c=relaxed/relaxed;
	bh=tKK4zFNmSkotRsLjuamNDkRJDfPiuLV/EgikorDCUjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMd5f8H37w5BukecpwqhpFkxjRemmiPb7J8TMoZxMyrJYAD5AHFXXL0WltQpDWjG/2JPV4IMcy1XJBqOZe1dQKcVGTxiTvZ60FzNhUg+0hDa1A9zYDMADCxp6zvvFyl0nbPr5ZPigTmr5uKGbeqYiFH53aytme9/1b3Mt76+h5RMk9a6Ytx2p91cfeTU4mIgUXUGNt4OWDFWDVg0YXAYT71F6+uJMOcSZ/zIceaeu7jEa2ikssBeVy4bVc1D47tm1wJYHjurTujHkLgk+azcGULAN0MGAr7Q8q9H+dAzxoElDR9vPlSowcP+Erve2nNNcQjvr3K0PKCCQM6WVVQzNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TY/KIMlg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TY/KIMlg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLsbs3H60z2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 23:21:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O3jqLd013503;
	Mon, 24 Mar 2025 12:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tKK4zF
	NmSkotRsLjuamNDkRJDfPiuLV/EgikorDCUjE=; b=TY/KIMlg1GOE/AyU9TMNTJ
	5hea6QwYj8HhwUsYRiQbm4aj44RJ6L7HnHbKElzRhJDYyLhf22JjNvX21cLysX/c
	f6eugF/nHIknF7PxzR6ysUiX6AoWYBq0dnirlZF5Rociz/GYvz9AD6Gz2Yi2G+XS
	nxLZibyAA3jc4UIBs2JjhhzM49Hgu+TQJoJzI8Nu/z+PhFqwCf+c8RmDiT53HuaG
	FeCaIusBBw98I5zlAKUsc/8KkFg5e1uqt4+HVepB7v+VoFlGh2XUx4kMp35Aq/vw
	QDjXihrtiKH7V62XMo3TWiA+XRWhP5ESgglekwrZHmw8bw93NiuyDQSfKm+H+1BA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jys92acx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 12:21:24 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52OCDiXH004835;
	Mon, 24 Mar 2025 12:21:24 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jys92acu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 12:21:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52OCGYDQ020101;
	Mon, 24 Mar 2025 12:21:23 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j8hnp4wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 12:21:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52OCLLrY29164210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Mar 2025 12:21:21 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D71A25805F;
	Mon, 24 Mar 2025 12:21:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDED758060;
	Mon, 24 Mar 2025 12:21:18 +0000 (GMT)
Received: from [9.61.251.240] (unknown [9.61.251.240])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Mar 2025 12:21:18 +0000 (GMT)
Message-ID: <37a5a63f-9a75-4196-bf5e-2106bccab18f@linux.ibm.com>
Date: Mon, 24 Mar 2025 17:51:17 +0530
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
Subject: Re: [PATCH] tools/perf/arch/powerpc/util: Fix is_compat_mode build
 break in ppc64
To: Likhitha Korrapati <likhitha@linux.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.ibm.com
References: <20250321100726.699956-1-likhitha@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250321100726.699956-1-likhitha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8yvRVcxq_rl9a2331xDOSLMSqXJmL2CU
X-Proofpoint-GUID: azvKXTimYo6zs6OFCzhYKi_aEIc7bLuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240087
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 21/03/25 3:37 pm, Likhitha Korrapati wrote:
> Commit 54f9aa1092457 ("tools/perf/powerpc/util: Add support to
> handle compatible mode PVR for perf json events") introduced
> to select proper JSON events in case of compat mode using
> auxiliary vector. But this caused a compilation error in ppc64
> Big Endian.
>
> arch/powerpc/util/header.c: In function 'is_compat_mode':
> arch/powerpc/util/header.c:20:21: error: cast to pointer from
> integer of different size [-Werror=int-to-pointer-cast]
>     20 |         if (!strcmp((char *)platform, (char *)base_platform))
>        |                     ^
> arch/powerpc/util/header.c:20:39: error: cast to pointer from
> integer of different size [-Werror=int-to-pointer-cast]
>     20 |         if (!strcmp((char *)platform, (char *)base_platform))
>        |
>
> Commit saved the getauxval(AT_BASE_PLATFORM) and getauxval(AT_PLATFORM)
> return values in u64 which causes the compilation error.
>
> Patch fixes this issue by changing u64 to "unsigned long".
>
> Fixes: 54f9aa1092457 ("tools/perf/powerpc/util: Add support to handle compatible mode PVR for perf json events")
> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> ---
>   tools/perf/arch/powerpc/util/header.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
> index c7df534dbf8f..0be74f048f96 100644
> --- a/tools/perf/arch/powerpc/util/header.c
> +++ b/tools/perf/arch/powerpc/util/header.c
> @@ -14,8 +14,8 @@
>   
>   static bool is_compat_mode(void)
>   {
> -	u64 base_platform = getauxval(AT_BASE_PLATFORM);
> -	u64 platform = getauxval(AT_PLATFORM);
> +	unsigned long base_platform = getauxval(AT_BASE_PLATFORM);
> +	unsigned long platform = getauxval(AT_PLATFORM);
>   
>   	if (!strcmp((char *)platform, (char *)base_platform))
>   		return false;

Applied this patch on the powerpc kernel and it fixes the issue.


Without this patch:

   INSTALL libsubcmd_headers
   INSTALL libsymbol_headers
   INSTALL libperf_headers
   INSTALL libapi_headers
   CC      /output/arch/powerpc/util/header.o
   CC      /output/arch/powerpc/util/perf_regs.o
   CC      /output/arch/powerpc/util/mem-events.o
   CC      /output/arch/powerpc/util/pmu.o
   CC      /output/arch/powerpc/util/sym-handling.o
   CC      /output/arch/powerpc/util/evsel.o
   CC      /output/arch/powerpc/util/event.o
arch/powerpc/util/header.c: In function 'is_compat_mode':
arch/powerpc/util/header.c:20:21: error: cast to pointer from integer of 
different size [-Werror=int-to-pointer-cast]
    20 |         if (!strcmp((char *)platform, (char *)base_platform))
       |                     ^
arch/powerpc/util/header.c:20:39: error: cast to pointer from integer of 
different size [-Werror=int-to-pointer-cast]
    20 |         if (!strcmp((char *)platform, (char *)base_platform))
       |                                       ^
cc1: all warnings being treated as errors
make[6]: *** [/linux/tools/build/Makefile.build:85: 
/output/arch/powerpc/util/header.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [/linux/tools/build/Makefile.build:138: util] Error 2
make[4]: *** [/linux/tools/build/Makefile.build:138: powerpc] Error 2
make[3]: *** [/linux/tools/build/Makefile.build:138: arch] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile.perf:781: /output/perf-util-in.o] Error 2
make[1]: *** [Makefile.perf:280: sub-make] Error 2
make: *** [Makefile:76: all] Error 2
make: Leaving directory '/linux/tools/perf'


With this patch:

   PERF_VERSION = 6.14.rc4.gbdfd7b9150f1
   INSTALL libapi_headers
   GEN     perf-archive
   GEN     perf-iostat
   INSTALL libperf_headers
   CC      /output/arch/powerpc/util/header.o
   LD      /output/arch/powerpc/util/perf-util-in.o
   LD      /output/arch/powerpc/perf-util-in.o
   LD      /output/arch/perf-util-in.o
   CC      /output/util/header.o
   LD      /output/util/perf-util-in.o
   LD      /output/perf-util-in.o
   AR      /output/libperf-util.a
   LINK    /output/perf
make: Leaving directory '/linux/tools/perf'
## tools/perf build completed rc = 0
## Build completed OK


Please add below tag:

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


