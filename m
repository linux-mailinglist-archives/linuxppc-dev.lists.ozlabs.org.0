Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id EFAB88D2D65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 08:36:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SQ09H8HL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpzxt11vtz7993
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 16:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SQ09H8HL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vpzx625xwz3vb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 16:28:57 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44T6FdfC013776;
	Wed, 29 May 2024 06:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=+9ciCvK01Z1vwRn+uCkI0yr1rl0idUx0MxgT/mBTRp8=;
 b=SQ09H8HLx9M78yQKlYrmKQm3yRxz1UsM0yOx61dlY2w+9sF8O+xHQhR9iABxbxsT+7gO
 s+LrGy67cIxS6LjHK+sxpjTOW44tKZOwE9W6+seZUgjQMkYIC7bY1V8EjBKDSPa24dv0
 sywA3JHM33X3ibL7DgFJvo/y2rAqjlzx2svhLtZlHBoTORB7o3QoVEcDBDTRTtt3WL3j
 cjv37MFKCUJWtJsSriNhlIOOkKRDRDRZLlY2Wz1eBmpDGlBoH2WY1WxeLf8tQrFMJU1S
 gzUrI6MwKduWFKEOQjpuQd4HUxfYJe9d8up06QTVJHvmHLfgAfjhfVZpypusiYyJsGfq rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydxr601rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 06:28:26 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44T6SQbX000843;
	Wed, 29 May 2024 06:28:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydxr601ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 06:28:26 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44T4AE7O009841;
	Wed, 29 May 2024 06:28:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpbbj886-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 06:28:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44T6SLGc52166990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 May 2024 06:28:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C67C20040;
	Wed, 29 May 2024 06:28:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 028962004B;
	Wed, 29 May 2024 06:28:20 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.179.17.188])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 29 May 2024 06:28:19 +0000 (GMT)
Date: Wed, 29 May 2024 08:28:18 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v3] mm/mm_init: use node's number of cpus in
 deferred_page_init_max_threads
Message-ID: <ZlbLAg94/2SC24Qz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20240528185455.643227-4-echanude@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528185455.643227-4-echanude@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z22Gsl5oLmrdkoQNWXaaSgLxF8vW1NJ4
X-Proofpoint-ORIG-GUID: TLy3r68G42Y8NzR4SwGlMiiYEiCLM0KP
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1011 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405290040
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Baoquan He <bhe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Nick Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2024 at 02:54:58PM -0400, Eric Chanudet wrote:
> When DEFERRED_STRUCT_PAGE_INIT=y, use a node's cpu count as maximum
> thread count for the deferred initialization of struct pages via padata.
> This should result in shorter boot times for these configurations by
> going through page_alloc_init_late() faster as systems tend not to be
> under heavy load that early in the bootstrap.
> 
> Only x86_64 does that now. Make it archs agnostic when
> DEFERRED_STRUCT_PAGE_INIT is set. With the default defconfigs, that
> includes powerpc and s390.
> 
> It used to be so before offering archs to override the function for
> tuning with commit ecd096506922 ("mm: make deferred init's max threads
> arch-specific").
> 
> Setting DEFERRED_STRUCT_PAGE_INIT and testing on a few arm64 platforms
> shows faster deferred_init_memmap completions:
> |         | x13s        | SA8775p-ride | Ampere R137-P31 | Ampere HR330 |
> |         | Metal, 32GB | VM, 36GB     | VM, 58GB        | Metal, 128GB |
> |         | 8cpus       | 8cpus        | 8cpus           | 32cpus       |
> |---------|-------------|--------------|-----------------|--------------|
> | threads |  ms     (%) | ms       (%) |  ms         (%) |  ms      (%) |
> |---------|-------------|--------------|-----------------|--------------|
> | 1       | 108    (0%) | 72      (0%) | 224        (0%) | 324     (0%) |
> | cpus    |  24  (-77%) | 36    (-50%) |  40      (-82%) |  56   (-82%) |
> 
> Michael Ellerman on a powerpc machine (1TB, 40 cores, 4KB pages) reports
> faster deferred_init_memmap from 210-240ms to 90-110ms between nodes.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> ---
> - v1: https://lore.kernel.org/linux-arm-kernel/20240520231555.395979-5-echanude@redhat.com
> - Changes since v1:
>  - Make the generic function return the number of cpus of the node as
>    max threads limit instead overriding it for arm64.
>  - Drop Baoquan He's R-b on v1 since the logic changed.
>  - Add CCs according to patch changes (ppc and s390 set
>    DEFERRED_STRUCT_PAGE_INIT by default).
> 
> - v2: https://lore.kernel.org/linux-arm-kernel/20240522203758.626932-4-echanude@redhat.com/
> - Changes since v2:
>  - deferred_page_init_max_threads returns unsigned and use max instead
>    of max_t.
>  - Make deferred_page_init_max_threads static since there are no more
>    override.
>  - Rephrase description.
>  - Add T-b and report from Michael Ellerman.
> 
>  arch/x86/mm/init_64.c    | 12 ------------
>  include/linux/memblock.h |  2 --
>  mm/mm_init.c             |  5 ++---
>  3 files changed, 2 insertions(+), 17 deletions(-)

It does speed up. For s390:

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
