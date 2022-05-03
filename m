Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36505181FE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 12:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KswZG3pM5z3bqG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 20:05:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bCNiQRVY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bCNiQRVY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KswYX221gz2xnG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 20:04:47 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2439Huei015493;
 Tue, 3 May 2022 10:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=HjtbuUEJ0/ZOlcQ3ufnF7LffEr7p00FRRLGE0m3GQmI=;
 b=bCNiQRVYJ0UtJ/P6wwlt+FxTWqgWKs/XNm3CA1W/s3Fj9VvL8Q4WSDIP+68Sa969QX1W
 yW7FRxTEsNiKJwAN9JFJG2YDdhch7vIfoB1daQ0D1iW4v4zxe2TjCu6lipYVkySJWUMU
 I+fPcPK3B7o9kboRbYNrfEWIxo2AYtBHQhPdZPnBeTCKtFP7Aibqvn3LGllXmJwv4E3u
 HkUl1qh9qoP3kc6/6MF3SkUgO0AorSuTurSD097OWTyD+88Rs1GK6y+CTL/mKiEjTxm2
 lxrvPDCsi4kz/ZqWslXBDo2B0ICLy7AhnLngCvsSn3DJnn8cp4c2rYiKYvA7H/jNO7lc Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu1mx8nf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 10:03:52 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243A0EYM002520;
 Tue, 3 May 2022 10:03:51 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu1mx8nek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 10:03:51 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2439wHgD022505;
 Tue, 3 May 2022 10:03:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3frvr8u79v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 10:03:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 243A3k3X26411316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 10:03:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C36DAE057;
 Tue,  3 May 2022 10:03:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25EF4AE053;
 Tue,  3 May 2022 10:03:45 +0000 (GMT)
Received: from thinkpad (unknown [9.171.25.226])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  3 May 2022 10:03:45 +0000 (GMT)
Date: Tue, 3 May 2022 12:03:43 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Message-ID: <20220503120343.6264e126@thinkpad>
In-Reply-To: <48a05075-a323-e7f1-9e99-6c0d106eb2cb@linux.alibaba.com>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <20220429220214.4cfc5539@thinkpad>
 <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
 <20220502160232.589a6111@thinkpad>
 <48a05075-a323-e7f1-9e99-6c0d106eb2cb@linux.alibaba.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vqe6Y27bbncJ_7Ur6Jm01zeitq883Jn7
X-Proofpoint-ORIG-GUID: UMZQHcP4UgI5USN1f2T3MDEwggwnF1jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_03,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030076
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

On Tue, 3 May 2022 10:19:46 +0800
Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> 
> 
> On 5/2/2022 10:02 PM, Gerald Schaefer wrote:
> > On Sat, 30 Apr 2022 11:22:33 +0800
> > Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> > 
> >>
> >>
> >> On 4/30/2022 4:02 AM, Gerald Schaefer wrote:
> >>> On Fri, 29 Apr 2022 16:14:43 +0800
> >>> Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> >>>
> >>>> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> >>>> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> >>>> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> >>>> size specified.
> >>>>
> >>>> When unmapping a hugetlb page, we will get the relevant page table
> >>>> entry by huge_pte_offset() only once to nuke it. This is correct
> >>>> for PMD or PUD size hugetlb, since they always contain only one
> >>>> pmd entry or pud entry in the page table.
> >>>>
> >>>> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> >>>> since they can contain several continuous pte or pmd entry with
> >>>> same page table attributes, so we will nuke only one pte or pmd
> >>>> entry for this CONT-PTE/PMD size hugetlb page.
> >>>>
> >>>> And now we only use try_to_unmap() to unmap a poisoned hugetlb page,
> >>>> which means now we will unmap only one pte entry for a CONT-PTE or
> >>>> CONT-PMD size poisoned hugetlb page, and we can still access other
> >>>> subpages of a CONT-PTE or CONT-PMD size poisoned hugetlb page,
> >>>> which will cause serious issues possibly.
> >>>>
> >>>> So we should change to use huge_ptep_clear_flush() to nuke the
> >>>> hugetlb page table to fix this issue, which already considered
> >>>> CONT-PTE and CONT-PMD size hugetlb.
> >>>>
> >>>> Note we've already used set_huge_swap_pte_at() to set a poisoned
> >>>> swap entry for a poisoned hugetlb page.
> >>>>
> >>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>> ---
> >>>>    mm/rmap.c | 34 +++++++++++++++++-----------------
> >>>>    1 file changed, 17 insertions(+), 17 deletions(-)
> >>>>
> >>>> diff --git a/mm/rmap.c b/mm/rmap.c
> >>>> index 7cf2408..1e168d7 100644
> >>>> --- a/mm/rmap.c
> >>>> +++ b/mm/rmap.c
> >>>> @@ -1564,28 +1564,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >>>>    					break;
> >>>>    				}
> >>>>    			}
> >>>> +			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> >>>
> >>> Unlike in your patch 2/3, I do not see that this (huge) pteval would later
> >>> be used again with set_huge_pte_at() instead of set_pte_at(). Not sure if
> >>> this (huge) pteval could end up at a set_pte_at() later, but if yes, then
> >>> this would be broken on s390, and you'd need to use set_huge_pte_at()
> >>> instead of set_pte_at() like in your patch 2/3.
> >>
> >> IIUC, As I said in the commit message, we will only unmap a poisoned
> >> hugetlb page by try_to_unmap(), and the poisoned hugetlb page will be
> >> remapped with a poisoned entry by set_huge_swap_pte_at() in
> >> try_to_unmap_one(). So I think no need change to use set_huge_pte_at()
> >> instead of set_pte_at() for other cases, since the hugetlb page will not
> >> hit other cases.
> >>
> >> if (PageHWPoison(subpage) && !(flags & TTU_IGNORE_HWPOISON)) {
> >> 	pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
> >> 	if (folio_test_hugetlb(folio)) {
> >> 		hugetlb_count_sub(folio_nr_pages(folio), mm);
> >> 		set_huge_swap_pte_at(mm, address, pvmw.pte, pteval,
> >> 				     vma_mmu_pagesize(vma));
> >> 	} else {
> >> 		dec_mm_counter(mm, mm_counter(&folio->page));
> >> 		set_pte_at(mm, address, pvmw.pte, pteval);
> >> 	}
> >>
> >> }
> > 
> > OK, but wouldn't the pteval be overwritten here with
> > pteval = swp_entry_to_pte(make_hwpoison_entry(subpage))?
> > IOW, what sense does it make to save the returned pteval from
> > huge_ptep_clear_flush(), when it is never being used anywhere?
> 
> Please see previous code, we'll use the original pte value to check if 
> it is uffd-wp armed, and if need to mark it dirty though the hugetlbfs 
> is set noop_dirty_folio().
> 
> pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);

Uh, ok, that wouldn't work on s390, but we also don't have
CONFIG_PTE_MARKER_UFFD_WP / HAVE_ARCH_USERFAULTFD_WP set, so
I guess we will be fine (for now).

Still, I find it a bit unsettling that pte_install_uffd_wp_if_needed()
would work on a potential hugetlb *pte, directly de-referencing it
instead of using huge_ptep_get().

The !pte_none(*pte) check at the beginning would be broken in the
hugetlb case for s390 (not sure about other archs, but I think s390
might be the only exception strictly requiring huge_ptep_get()
for de-referencing hugetlb *pte pointers).

> 
> /* Set the dirty flag on the folio now the pte is gone. */
> if (pte_dirty(pteval))
> 	folio_mark_dirty(folio);

Ok, that should work fine, huge_ptep_clear_flush() will return
a pteval properly de-referenced and converted with huge_ptep_get(),
and that would contain the hugetlb pmd/pud dirty information.
