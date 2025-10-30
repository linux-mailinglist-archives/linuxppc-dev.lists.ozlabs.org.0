Return-Path: <linuxppc-dev+bounces-13571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B7C21358
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 17:34:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy8pZ5yhnz30V1;
	Fri, 31 Oct 2025 03:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761842086;
	cv=none; b=B1X5qXPBjHr6hTzohDwvzmF9KankPLs+BIwYuuZjucuaaNeT4HHKdaGwqNkirZTHmZ/wSok2nMtfZqfvDQ+sT+3g7eIqBixVo3iO5ehc7tX9RGxUeS+CCvCBlZeWNK0NqXT8lKq6Q2hmVuzn6s7TZHdIf5I2vEdZWRyw6MbAYwcjcySWq9Ykp0pOj2zCs0P+gDTh4BBXbWMWoOoYz7b1wBuoTA/V7VXybHex4zwJz2U1CVkoBekkgUFGz5TG32ELYBl23N/3uAYz869A0jA8DZ+jnW38cJ3R6f7NGxdYeP4U031wkWRmgB2Ne6sulqvccWEbIoxilV1wbyLLXTTE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761842086; c=relaxed/relaxed;
	bh=q8xDSEzqv0eO+i7RNgUG5zHxJFTihDqYuVwJgL1tFaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncHCCLEfL1VtsrMmOQ+OM1g/j82JTcIGJp7syE/t0f/eyUCWZ26M4ajOjH2QXpY+v9alvV7RtYf+bnvRcd4YYnUWSsram2TkF4tZgCoB8HKehDq8nj+7z1Tp3Lra4hm3jpX6Gwq+qt49Q4B4Mrhf1FQCaBOEuhyNuaNklw7wIaa5XR9nl8baM5ZUl2vraO2wNe3873drt1FzymfRkf2leKlmRbrP/KFaI0TLyv9a8FE1o8fic3BkCSK3SJ10a0jen7keRolQU7D4cpIIdaaAI0Q+5yTkilVoN2Yf439xaRswxzKoIJMiBiahBEVONoTJH6zS1KvJxJNCpD80/s6SaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Br1VD/7Y; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Br1VD/7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy8pY4QQ4z2yjw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 03:34:45 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59UDJBKn025673;
	Thu, 30 Oct 2025 16:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=q8xDSEzqv0eO+i7RNgUG5zHxJFTihD
	qYuVwJgL1tFaw=; b=Br1VD/7YTed3oUT2iUZzltz2mPXnVAxgbDNLxlg7erZO0Q
	ndcdnpWoXHoUFilySRRpGIi+3NdaYZvtdrCuNelAEGAtrGqT/WKWkRG0++hqoaLl
	U3DO7TF4/SHlyudz6Ux33YMvs4FeaMwoobkrdswr1iH3NTBoydfGcStuaVfZdbDE
	P4zDXX/kY8AqU9LgWKdjwtpl3Llgg9/j/U/Of4egne0bsg/u40oDkXOy3QPdZquQ
	y0CFgu0n6tzgnJiezISNhw7bNixMWitpOdspE2bn/qlvp7I9fj9I5uAhF0vbAX/g
	Yc4wda7lBmeChb4Nq2HY0X5WFh+YjgYS56JDSgYQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afhj8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 16:34:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59UGNfcW026454;
	Thu, 30 Oct 2025 16:34:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afhj8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 16:34:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59UGGqRH023873;
	Thu, 30 Oct 2025 16:34:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a33vx9rqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 16:34:04 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59UGY24U58196474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 16:34:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 510842004B;
	Thu, 30 Oct 2025 16:34:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9ABBB20043;
	Thu, 30 Oct 2025 16:34:01 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Oct 2025 16:34:01 +0000 (GMT)
Date: Thu, 30 Oct 2025 17:34:00 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
Message-ID: <46d9bb24-1603-4c75-8723-84a821b3c46c-agordeev@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ef0cd4bc-1a37-4755-8957-d8a7e5c4564e-agordeev@linux.ibm.com>
 <d0767b70-5686-4f6e-8ca4-10b3f3ff3991@arm.com>
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
In-Reply-To: <d0767b70-5686-4f6e-8ca4-10b3f3ff3991@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9WxMyXTitAyuhGu3vYNyzE5CUF2jkm71
X-Authority-Analysis: v=2.4 cv=WPhyn3sR c=1 sm=1 tr=0 ts=6903937e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=I6XwYfBBfidvHYRsdD8A:9 a=CjuIK1q_8ugA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX7zpOZgRsm3FF
 8AnOBLOsvxptlWohzuosbbLPCFjAwF3xq2alPUZgZex8RCwqzG9eoZNV4NIOfsWBFJyYD+ygoAE
 rnoEx4aGNakZqeQ2SGwR0YJxSMuQm2OcteBULwoWnfyU/cMHNt88ZmCD4rU2jE3gxNJmWV7x33E
 oHSSsHXc4rB3cfyO0+d5kIH2YG18f2CCBQDyLSWgcAzaycIeZ5ROXf5OKaBsuvDDXGa4alxNW1z
 RdE+6Uxgxxzst1nDzVaufGD9/ZfHUthevkdMD9SntX+m955wZ+COJtAyQIs64arQ+vraDde5COT
 gqRLVlcqhoG5cbLpwOoCe3250RDdwFTHwZZLlnTZaB4WOK93liI9EHtPlX5NXI4lD6dhjalTaMQ
 w9GXLDeLcNNdyMoMeG4ROtBVzLwnYQ==
X-Proofpoint-ORIG-GUID: 98PgicvhjO7U-L0VCM0jVX32GpXzOiLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 30, 2025 at 11:28:53AM +0100, Kevin Brodsky wrote:
> On 29/10/2025 17:41, Alexander Gordeev wrote:
> > On Wed, Oct 29, 2025 at 10:09:04AM +0000, Kevin Brodsky wrote:
> >
> > Hi Kevin,
> >
> >> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> >> +static inline bool in_lazy_mmu_mode(void)
> >> +{
> >> +	return current->lazy_mmu_state.active;
> > Whether (nesting_level > 0) is more correct check?
> > Otherwise, it returns false while in paused mode.
> 
> That's exactly the intention. Lazy MMU is disabled while paused. The
> users of that helper want to know if lazy MMU is currently enabled (to
> decide whether to batch updates for instance); whether this is because
> we are paused or not in any lazy_mmu section (nesting_level == 0) makes
> no difference.
> 
> > May be check both nesting_level and active and also introduce
> > in_lazy_mmu_paused_mode() right away to avoid any confusion?
> 
> Can you think of any situation where a caller would specifically want to
> know that lazy MMU is paused?

I thought I do, but in_lazy_mmu_mode() alone works just fine,
as you described (at least for now).

> - Kevin

Thanks!

