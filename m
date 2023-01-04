Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB965DBE8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 19:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnHjS6Yt7z3c8x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 05:11:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fyiW6W2U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fyiW6W2U;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnHhT0yBJz3bNw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 05:10:32 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304HUcG8032586;
	Wed, 4 Jan 2023 18:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=7GBPF88wzdVZ7ar1F+eZ3hgfidY5D8srQT8J/QpDwvc=;
 b=fyiW6W2UUN8LX92+pUjeVSnvz51f7TnyzFENkpC9v/GweDqnRwuxyoh215RVbC/DJ/AQ
 2wbVM+EzRWCEAmzmwiojm3CpchC0Y8ZmWUr1x10H5LHQra4UxToTRms7RUKFtnV9AOT/
 Nb1EvDzNT8pngUWXgk/d80u62D8s23dr5qfuFmBlayG9GXKDrOZVg3URBzBXPtLQBjAm
 POr66aqy4XecphxqgSsuXd3HzdYxrH1T1/If1l4gIJ0mkfKSF51Yi2sMMITiJbHYqDg/
 mUP2q/DTQrLrpbJM2eyJGE7hMsZNxNfDs5JzW+bUeZyXPTic79NtgHeaIb5XEvYJuVWR 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwdwy0xas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 18:09:53 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 304I7i4V017758;
	Wed, 4 Jan 2023 18:09:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwdwy0x9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 18:09:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30486XjM001864;
	Wed, 4 Jan 2023 18:09:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbfdpdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 18:09:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 304I9l4M48759224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 18:09:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B830520043;
	Wed,  4 Jan 2023 18:09:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E85E20040;
	Wed,  4 Jan 2023 18:09:46 +0000 (GMT)
Received: from osiris (unknown [9.179.28.126])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Jan 2023 18:09:46 +0000 (GMT)
Date: Wed, 4 Jan 2023 19:09:44 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
Message-ID: <Y7XA6JEUOgOkz988@osiris>
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k9qXecJ4RRKrWMjkiEzD557REdxr7RO2
X-Proofpoint-GUID: QiYQILsN1_8J76fc1D6yWsOXcnh_ZlS9
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040151
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Rik van Riel <riel@surriel.com>, Vlastimil Babka <vbabka@suse.cz>, Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 03, 2023 at 04:27:32PM -0800, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
> RFC->v1 Created zap_vma_pages to zap entire vma (Christoph Hellwig)
>         Did not add Acked-by's as routine was changed.
> 
>  arch/arm64/kernel/vdso.c                |  6 ++---
>  arch/powerpc/kernel/vdso.c              |  4 +---
>  arch/powerpc/platforms/book3s/vas-api.c |  2 +-
>  arch/powerpc/platforms/pseries/vas.c    |  3 +--
>  arch/riscv/kernel/vdso.c                |  6 ++---
>  arch/s390/kernel/vdso.c                 |  4 +---
>  arch/s390/mm/gmap.c                     |  2 +-
>  arch/x86/entry/vdso/vma.c               |  4 +---
>  drivers/android/binder_alloc.c          |  2 +-
>  include/linux/mm.h                      |  7 ++++--
>  mm/memory.c                             | 30 -------------------------
>  mm/page-writeback.c                     |  2 +-
>  net/ipv4/tcp.c                          |  7 +++---
>  13 files changed, 21 insertions(+), 58 deletions(-)

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
