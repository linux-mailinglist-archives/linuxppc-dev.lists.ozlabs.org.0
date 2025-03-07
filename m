Return-Path: <linuxppc-dev+bounces-6801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94262A56C04
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 16:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8VZH5V0Cz2yPG;
	Sat,  8 Mar 2025 02:29:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741361351;
	cv=none; b=VcDx02ncJTd3/VWmQKcXh7MkpjeOEu1mNz3Yyd/+M4g1RpwgWqWQ/gz4xahkWHopv8/Bl2HdfEXEF6V9h5qsaLmKcccT4B7qM/UU+3UbxjmNJfVfENShzBVvVp/sEr5FkgHTkpLBlpaweflJNxCAdQcV5JtulA1HyT/VBHxP/BuEiIIlZwSRo0cs+462A0SfrdVt3aXQgZYVy5zXtLd3xQBgoX9ezC5Z0EqNX9AbThcxOIqLuaz9ETx+9NIND1fOI7HGC6Mn8sATooshy0d/IS7VSeOnMluhQnVdfj5bicxC2L5tpn+gLzoRh8TWDu+fFXYQM/v3OzitmXI1hysGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741361351; c=relaxed/relaxed;
	bh=Y0KvhWxi6k4smjT1a6uHtK0WLe6VaKHOV2hSoWFI5bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l980yZppEOqAl0WwUvpZ400x+EUKk3qbihLS3c2HRE9K0hHm2wb4AHQPnsjtqt1Xpwmm4L+warXKJBbzZtRJXIDrtP7uZFrjVrSFb/q9S9H3LJeJKXl80MC6Mr9wuOr3uZLa3IopXm6ye3sJpNmyp+Dz14ovM4eoSGp/h5RCm1bIDqz6plqL8AxoNPziH1V9wRXemZnk4TvxnaEWMCoEqeMEWKOV+rurIQ38xSMl7IwNLrYUsBueCxg1CN1L4DXjlVI0KqqfRK9RwIE/YLLLcmsQrCPCKtZ3cXzkw9bf0oyPCsHJI/t6kzk0JrRcODcr6HT1JAfqr4UhHmlgdPdxSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKQQC8sC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKQQC8sC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8VZG5gQnz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 02:29:09 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527E3AWH028905;
	Fri, 7 Mar 2025 15:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Y0KvhWxi6k4smjT1a6uHtK0WLe6VaK
	HOV2hSoWFI5bI=; b=qKQQC8sCg9pR0Rgf2U4SjNR+davwX5FjEufMomgRsB00fg
	zyRoTfxYxXh4Y8vuiZOJjrJtRUBqHxyVXsqcdfStADiDsVoEhvGXke2IzKBOI/hb
	WiESqINaMWZlctFARnqnvnWiPTNBO/qTgrLVOx+veNXvwWI6SMXfFRzUxY07Dh9Y
	p4E9rDCnukHT+Y6EVG26BlOZ16mHO3x7KhgMU6qM64BlKcUlVNv2REetqaorOfxE
	Hv9tuR0tLZlF0MsbPIllc5+326ZsUeYtZPM3HYRousN2gYIQuhJdn4OFhBw8Ldam
	BqYL6oneEKifef2Z24hvK1SLIU1JVnxU0/X7HqUg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45827p8e9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 15:28:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 527FOGZe009112;
	Fri, 7 Mar 2025 15:28:26 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45827p8e9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 15:28:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 527CW0hk013724;
	Fri, 7 Mar 2025 15:28:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2m7eh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 15:28:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 527FSKc034669078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 15:28:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BC592004D;
	Fri,  7 Mar 2025 15:28:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CBC420040;
	Fri,  7 Mar 2025 15:28:17 +0000 (GMT)
Received: from osiris (unknown [9.171.2.237])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  7 Mar 2025 15:28:17 +0000 (GMT)
Date: Fri, 7 Mar 2025 16:28:15 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
Message-ID: <20250307152815.9880Gbd-hca@linux.ibm.com>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-8-rppt@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306185124.3147510-8-rppt@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A6EZhWyKm6a7TATSJL5pnfOrX3P29DY0
X-Proofpoint-GUID: Cc95RTw9axkwgZElLQM4IM54NfQR-ck-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 mlxlogscore=334
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070115
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Allocating the zero pages from memblock is simpler because the memory is
> already reserved.
> 
> This will also help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/s390/mm/init.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

> -	empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> +	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
>  	if (!empty_zero_page)
>  		panic("Out of memory in setup_zero_pages");

This could have been converted to memblock_alloc_or_panic(), but I
guess this can also be done at a later point in time.

