Return-Path: <linuxppc-dev+bounces-11275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F93B35272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vBL6D9Sz3d96;
	Tue, 26 Aug 2025 14:02:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756180938;
	cv=none; b=J+E1jZyOYd/aOLIXBpIUYV+kDe+hUYguKyVcUVV+J+97FczYFbVZLaBNof5/6iAt0EsAT18D8OW+zvOi+BIxByMaiTuirSKrXDOYGaTpgz9NKOFWfkE+fye2uPird5zLrF2WWBC+3OhPa6WUojocF29fGijmCV0FYujICoKl1O6n5zWL2J6QVAXaBqJPIYNUCf26aIdYwgxsuj3OHTboxev++eAuc2WFcgwKATWP7VKxFmZMonuLtf5ftAFqXk/Rb4kfRn0NECZWUjw+2NoR6bbOBwqKHiq8MRrO72VpvR2hC8RVeGcRJJiQRjZbbxrxHjZaxQLz3Crh9Yg6QI1EAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756180938; c=relaxed/relaxed;
	bh=YfeP+O6BaUVB+uLXFLt7iv8l0N49hfo+cNYJaKgKXMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mO5XkPHue4q8sBF28iP41I/z3T8N21w/GRW3tmRS/cyW3QqPTQGI48TXmhFeOCqkGWHdTcCBHvjvoi3b36RU3OE3wV3Ipdjm93dLd+yMtCHP1Y4A2cdcJ83hbhLE/3wUcjmt0GFeW5E8OYAXHD+LKJXx8A4pAu9/Bs11blUzBsAy8FFhKXaowdiIVg574Y9hYM+Y4lnTalfDhsWRi1tA/89QTsfiLKqaaHe8G+MuZoPhvPsxi/5o/bGGzVWGwrDuj3xadaVJTpVGAOp8KvZGB6dnWODqFG5xKN8dCtx34qdSIg79Bw+v0qq2+Goyl51QCclq41j/OpjWQsAtSkyk7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEvHDxwV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEvHDxwV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vBL0P6Pz3d8J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:02:17 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PMN3vp009468;
	Tue, 26 Aug 2025 04:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YfeP+O
	6BaUVB+uLXFLt7iv8l0N49hfo+cNYJaKgKXMs=; b=KEvHDxwVkNiPNd4MQzPzkJ
	ZfrLzE+d3ulEzkJgkTfxlZkpjADuH7DGoCYWkSN+SrncPe6itC/+y4dSuUs3ZVo4
	bYDhcOMK05pNwJGxRmVcD4mISI3weUdYQRvRgbW301ei6Gm0RYfUvJetvz2O6YT5
	dx1N3CaxzcXwcr6GAXuOuER+Aq6XPSgZN/jiaQu5H1CFKdPmj9T+iL6b54tEuT34
	mCGTgsmqFnkNfMB97N5hTvKixpk1qrFQAG2YPRKLGipZ2VY2vdq+RDCC1UmMJNGf
	hWYck71xGrfj7PynmLMuZTqAKM6Bs4yM3jpIT64rWTHMragS3+5GRKnuSxOSJiow
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42hveae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 04:02:06 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57Q4258n006480;
	Tue, 26 Aug 2025 04:02:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42hveaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 04:02:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q40HPY002571;
	Tue, 26 Aug 2025 04:02:05 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6m8r4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 04:02:04 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57Q424Tv11338886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Aug 2025 04:02:04 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E91558059;
	Tue, 26 Aug 2025 04:02:04 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E6455804B;
	Tue, 26 Aug 2025 04:02:00 +0000 (GMT)
Received: from [9.43.67.173] (unknown [9.43.67.173])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Aug 2025 04:02:00 +0000 (GMT)
Message-ID: <77eb1eb6-6ccc-451b-a8c6-bb05a8fbb309@linux.ibm.com>
Date: Tue, 26 Aug 2025 09:31:55 +0530
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
Subject: Re: [PATCH 06/11] tools headers: Sync powerpc headers with the kernel
 source
To: Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250825215904.2594216-1-namhyung@kernel.org>
 <20250825215904.2594216-7-namhyung@kernel.org>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250825215904.2594216-7-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMCBTYWx0ZWRfX6+WJqBmcuEjX
 LFMCyXpSS1nfnZMm4Go4qgjTKO2MjMWjUyBZGls7alAIDyx6Qy7GuhuQs85DWtsR8/BPJ+iwL0y
 zRViy0xFOfdmWZmHifhNCiV+cxhvhMeVdlFz1wZ6j3OVUOKBDEj4ZzAcrOC6eXpHKonnqUXRh5j
 LP6hk7HqkZp9SwqTdZNljh82HGx8gqoqlitMofrt7DNUwaqxgUIrnDC2P5KIA4JvH+fWuK6D5YI
 wCeFXJvVIXtYRgDMiDySFoXYEXXXudAuT1oslYgWAxz5Xp0I5uaSd8hpl7E2qXRihwY4F6e2wQL
 pmET4TSF85ev79hLOsfk9ZCszxvlv2f1W0yepFOKzlpfKqW85IYvSxU63IiSW5Rk0JRKIuQ0Bfg
 LHJjkMri
X-Proofpoint-ORIG-GUID: WyYRZnz7c_1Ckcqm9GS_H-jZPMC8XZ1W
X-Proofpoint-GUID: lsKkDTWoiQJ77dGWmuptvpdz28NzaBSw
X-Authority-Analysis: v=2.4 cv=evffzppX c=1 sm=1 tr=0 ts=68ad31be cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8
 a=VwQbUJbxAAAA:8 a=tchKjDB3tBMYg2FPuD4A:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/26/25 3:28 AM, Namhyung Kim wrote:
> To pick up the changes in this cset:
> 
>   69bf2053608423cb powerpc: Drop GPL boilerplate text with obsolete FSF address
> 
> This addresses these perf build warnings:
> 
>   Warning: Kernel ABI header differences:
>     diff -u tools/arch/powerpc/include/uapi/asm/kvm.h arch/powerpc/include/uapi/asm/kvm.h
> 
> Please see tools/include/uapi/README for further details.
> 

Nice catch. I missed to remove in tools side. My bad. 
Thanks for fixing.

Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>


> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/arch/powerpc/include/uapi/asm/kvm.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/powerpc/include/uapi/asm/kvm.h
> index eaeda001784ebb6f..077c5437f5219b05 100644
> --- a/tools/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
> @@ -1,18 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License, version 2, as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> - *
>   * Copyright IBM Corp. 2007
>   *
>   * Authors: Hollis Blanchard <hollisb@us.ibm.com>


