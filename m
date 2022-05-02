Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB109517138
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 16:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsPxg6Fxwz3bWD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pz2TcaKG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pz2TcaKG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsPwx4kPjz3bVH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 00:04:49 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242E1xes006582;
 Mon, 2 May 2022 14:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=pa3Y8njUgOpmxlb35vPiYLCiL63dwiQj0l9BRN8zD7Y=;
 b=pz2TcaKG09iPWvjb8QT+j50Yq/fjYuV2BbisWIzf7sFeQmk7HocWYItceAG6H8sh3g6q
 AdlRZxpsr5YFu38WbvzT5fbiz17a9xGPu8DBT9NVpih8czdyQc8Hm4CUtEEqAHfU500I
 J2kCZOXOiUxe6p8q9zLw026UfSKfc+DUStFqbOskx2R93/+fhQimCCv8zsOHnCy+RXuS
 YaymiLl/K0xslk0P57DJIhR4Yf9ZbNo+lzQgataaunD6lWOoYZVfWwXYbMWCuAJ4Gx7X
 Iuz/AT5jsuC/dXuUtr6gZLh318HoWCyXwiYFAvjNLLzRIGDZ78c/I03oBs7qIq6pryDU 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftgq400qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 14:02:42 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 242E2GTs007491;
 Mon, 2 May 2022 14:02:41 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftgq400pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 14:02:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 242DwVPB016037;
 Mon, 2 May 2022 14:02:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3frvr8t992-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 14:02:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 242E2bdp26476826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 May 2022 14:02:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D2B9A4051;
 Mon,  2 May 2022 14:02:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4016A4040;
 Mon,  2 May 2022 14:02:34 +0000 (GMT)
Received: from thinkpad (unknown [9.171.50.173])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  2 May 2022 14:02:34 +0000 (GMT)
Date: Mon, 2 May 2022 16:02:32 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Message-ID: <20220502160232.589a6111@thinkpad>
In-Reply-To: <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <20220429220214.4cfc5539@thinkpad>
 <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XuufQO1q4HTBDbV5Aeg2IfsJiDYUZ4kF
X-Proofpoint-ORIG-GUID: wX4sYDOGP4Gb-gqEiz4w3Jylk1LdzAUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_04,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205020110
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, svens@linux.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 30 Apr 2022 11:22:33 +0800
Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> 
> 
> On 4/30/2022 4:02 AM, Gerald Schaefer wrote:
> > On Fri, 29 Apr 2022 16:14:43 +0800
> > Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> > 
> >> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> >> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> >> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> >> size specified.
> >>
> >> When unmapping a hugetlb page, we will get the relevant page table
> >> entry by huge_pte_offset() only once to nuke it. This is correct
> >> for PMD or PUD size hugetlb, since they always contain only one
> >> pmd entry or pud entry in the page table.
> >>
> >> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> >> since they can contain several continuous pte or pmd entry with
> >> same page table attributes, so we will nuke only one pte or pmd
> >> entry for this CONT-PTE/PMD size hugetlb page.
> >>
> >> And now we only use try_to_unmap() to unmap a poisoned hugetlb page,
> >> which means now we will unmap only one pte entry for a CONT-PTE or
> >> CONT-PMD size poisoned hugetlb page, and we can still access other
> >> subpages of a CONT-PTE or CONT-PMD size poisoned hugetlb page,
> >> which will cause serious issues possibly.
> >>
> >> So we should change to use huge_ptep_clear_flush() to nuke the
> >> hugetlb page table to fix this issue, which already considered
> >> CONT-PTE and CONT-PMD size hugetlb.
> >>
> >> Note we've already used set_huge_swap_pte_at() to set a poisoned
> >> swap entry for a poisoned hugetlb page.
> >>
> >> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> ---
> >>   mm/rmap.c | 34 +++++++++++++++++-----------------
> >>   1 file changed, 17 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index 7cf2408..1e168d7 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1564,28 +1564,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >>   					break;
> >>   				}
> >>   			}
> >> +			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> > 
> > Unlike in your patch 2/3, I do not see that this (huge) pteval would later
> > be used again with set_huge_pte_at() instead of set_pte_at(). Not sure if
> > this (huge) pteval could end up at a set_pte_at() later, but if yes, then
> > this would be broken on s390, and you'd need to use set_huge_pte_at()
> > instead of set_pte_at() like in your patch 2/3.
> 
> IIUC, As I said in the commit message, we will only unmap a poisoned 
> hugetlb page by try_to_unmap(), and the poisoned hugetlb page will be 
> remapped with a poisoned entry by set_huge_swap_pte_at() in 
> try_to_unmap_one(). So I think no need change to use set_huge_pte_at() 
> instead of set_pte_at() for other cases, since the hugetlb page will not 
> hit other cases.
> 
> if (PageHWPoison(subpage) && !(flags & TTU_IGNORE_HWPOISON)) {
> 	pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
> 	if (folio_test_hugetlb(folio)) {
> 		hugetlb_count_sub(folio_nr_pages(folio), mm);
> 		set_huge_swap_pte_at(mm, address, pvmw.pte, pteval,
> 				     vma_mmu_pagesize(vma));
> 	} else {
> 		dec_mm_counter(mm, mm_counter(&folio->page));
> 		set_pte_at(mm, address, pvmw.pte, pteval);
> 	}
> 
> }

OK, but wouldn't the pteval be overwritten here with
pteval = swp_entry_to_pte(make_hwpoison_entry(subpage))?
IOW, what sense does it make to save the returned pteval from
huge_ptep_clear_flush(), when it is never being used anywhere?
