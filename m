Return-Path: <linuxppc-dev+bounces-15533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2798D10C7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 08:03:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqNdK04npz2yv7;
	Mon, 12 Jan 2026 18:03:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768201412;
	cv=none; b=eQhMcTKApjLn0ZVPC68ODGccR3GSCh3Z53lYYTE0hHpRFzn0dlEqN5+euXmFbaZUPSm6l1noMncSdub6UeXXqFXDEUhlMBbS/hBzfTArqmXg2uFOdB1Twz014MZHFKw9qp6B39vZiBqRuqSfUMmPq2hAbC5BO4gRdlYu948hbqlLPSCeioN3FgawAiGS3RFc3dgt/Z5Kg88IlHOyL6A4vmcwCQG/Wo8sLc+LFIkCtt02j0zG4BX9TymwALU1BUclGOI5zCrrLA3SiqTaGI3wxvtyo7bWv26kdlnEYy7Iy5fi125M5uQwqy2HTEoMFQjR3Dt1v0GL9jGuGbamG7FQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768201412; c=relaxed/relaxed;
	bh=DaR8QIrJoPyGAUdK2XoR50gjX3a8JtQ3y3ZpcU0sC3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdIa508H9aknrSHe44MlrJsbh4IywlUvQHVv2huqlwx/6j4cIyCzhWY8dDXf2Y6M/HgK6fNpFM0ijplMNYmuXFvD5Equ7wdxGiWpk0hiv4WNbCiXN8HlmFY0zuDa+EsLgPww9Bd/LHn+S4AGeKuFavastVQVcEJPL74wxFb6GVJWH4E4fiHe9jivb60/lpLAJqelMMkhOxJ6KD4rymjODZaYfIvkSilzrTx0WbdyPTytIHGul9JFMsXIeGn+2zpgXfd4k6pqqrdVe2/F54vQlXZNZPsTlarwqMw0jvDgq+FfegaUcOgfzV7+J1IALwPWSXpEKAP1EuF/wvHQtN3+0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FnlWHg7y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FnlWHg7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqNdJ11cdz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 18:03:31 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60B8SDe5007270;
	Mon, 12 Jan 2026 07:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=DaR8QIrJoPyGAUdK2XoR50gjX3a8Jt
	Q3y3ZpcU0sC3M=; b=FnlWHg7yF0EhltIiIn9ZnFKG/nvLKG/pF1swSGpJYPCijY
	W3Rmt5GG9EndclJOkAjsYj7aziAqVbObyNXQkmpQybP1JTD40KYizrnejvBH5N0R
	uxWhc470C1N521DLBDW/4DIyhAp6m6ddM4POUpDrVis1Hlh6nnlYKZ+MBCseQRuL
	2/T+gL9VYGZJLh0qjYX71ULRHWwG39FOsJ/hdlnDgOBY/V7LzQa8RoX1JtXisNa8
	CSva6dlpDA66CEU6Mn19ZO4lOZMC2xpo5csLamqkyzMu14mWfv6OS/UZ3RdAJtGZ
	P+oSF809jDQ8YtKfRtAb1iHfsp5syvvLc4So3efA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6dwpng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 07:03:00 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60C72xtd026579;
	Mon, 12 Jan 2026 07:02:59 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6dwpne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 07:02:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60C5F3XY014244;
	Mon, 12 Jan 2026 07:02:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fxvq99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 07:02:58 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60C72r9n41288168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 07:02:53 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7F1020040;
	Mon, 12 Jan 2026 07:02:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E39620043;
	Mon, 12 Jan 2026 07:02:50 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.87.151.31])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 12 Jan 2026 07:02:50 +0000 (GMT)
Date: Mon, 12 Jan 2026 08:02:48 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
        Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
        Brian Cain <bcain@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 17/29] s390: introduce arch_zone_limits_init()
Message-ID: <b211f877-f9bb-4892-b67c-d2610048575a-agordeev@linux.ibm.com>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-18-rppt@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111082105.290734-18-rppt@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bCS-OSZblyIq8lvlPyjEILoO8GzzpHGN
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=69649ca4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7WlQhDu6A2usLaOTEWYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1MSBTYWx0ZWRfX59mP2KNE13j0
 a6aegnon1oN4dcuG8YaVOaJhcRG6s3uUJFEsmdkW+MZ5sZ09v9vfZ00cHaM+sNVIGfNSGFA6TA/
 amYWC8VtNTQv0JRk3gc5rBBltZHgc72KTXGu3prlXckbdY0t0zp5Lo5Yhjr8IF/vYaYhc4GEfSU
 Qn3vnNEGmBOVemoTnAoVuUgIbpnnLrr8prY2Jcsedc9458fa4aIErXN9hSBcQEeZAjafXeGIs3U
 PkSTvWywRsb27htzKZSu/lI9i25vaLSZKrrQYY6kqWC0MKkmjKSiCkMGVZp7eE7xKVafOgrDfKv
 /IgXdjJYtIVn8udUlyOpA1x4MgwEQYsjb20V4FINx3F9Zvbn5I4upMwVWMuGSRYRH4uAOicy3EX
 58rNjYtR0Ljy4P0wI73tlEk2VHClT7wveMeVEf9wv8ox2a4bReXLiwz96iuRvRG4P5usk/SQFvy
 YK5patORVNK5OiJVC/A==
X-Proofpoint-ORIG-GUID: Mt_xEhUTi_ZaKY8BdbSWDFf-6SwyebPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601120051
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 11, 2026 at 10:20:51AM +0200, Mike Rapoport wrote:

Hi Mike,

...
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +}
> +
>  /*
>   * paging_init() sets up the page tables
>   */
> @@ -97,8 +103,7 @@ void __init paging_init(void)
>  	sparse_init();
>  	zone_dma_limit = DMA_BIT_MASK(31);
>  	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> -	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
> -	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +	arch_zone_limits_init(max_zone_pfns);

You move initialization of max_zone_pfns[] to a function, name the
function arch_zone_limits_init(), but leave the initializatio of
max_zone_pfns[] to zeroes outside. Should not it be brought along?

>  	free_area_init(max_zone_pfns);
>  }

Thanks!

