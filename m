Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7B51551B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 22:03:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqk2d01JLz3brq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 06:03:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i8go9k8/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i8go9k8/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kqk1r56Gmz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 06:03:11 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23THsqDN037937;
 Fri, 29 Apr 2022 20:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=14eJcFY+2G1yPd/GPynKoYcbLehqc8WKf4Xd1nmgPxU=;
 b=i8go9k8/O3TYt6fhXSbXc27xMdIzhzvaC0NWFMMWqXENVJ7AxYr46+Er8PWlkeAJLDyO
 ZO2ercMXLNiCXhSbdix64mLCtXG1ATrcK3C7cPoWv+57fROkaLPV/Wsg6AZ6CUqZ38Rt
 2X4Oe/j8mipmxDsexu+lrmePaxDow2VjXDJ4JutZxUtoDtx/JZlyZgpXO+2+NPgMPu2n
 gD45clSxRToDqp/c4IyEP5tDz9T+ttRU0kderKIh4qqOMRksSt4l1UE1DxhZQWWWyaWj
 q931e9Hw0/OtZe02quNLpOSyFRLVIGLVL1Y/Hc6Jlg1XeztQiZL5G5n4MsIfLFRcRLeb 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqvaq9hfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 20:02:25 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23TJj4ja031851;
 Fri, 29 Apr 2022 20:02:24 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqvaq9hen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 20:02:24 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23TJwbLB009239;
 Fri, 29 Apr 2022 20:02:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3fm938yk3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 20:02:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23TK2INw16646532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 20:02:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0AD411C052;
 Fri, 29 Apr 2022 20:02:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0C3D11C04A;
 Fri, 29 Apr 2022 20:02:16 +0000 (GMT)
Received: from thinkpad (unknown [9.171.14.38])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 29 Apr 2022 20:02:16 +0000 (GMT)
Date: Fri, 29 Apr 2022 22:02:14 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Message-ID: <20220429220214.4cfc5539@thinkpad>
In-Reply-To: <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n2vn77eQpm8aX1Cpvjq3u5xP5rzhtMFB
X-Proofpoint-GUID: EUMNoVhafVgUobVSsm-XN0dmOW2Sxm3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_09,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290107
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

On Fri, 29 Apr 2022 16:14:43 +0800
Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> size specified.
> 
> When unmapping a hugetlb page, we will get the relevant page table
> entry by huge_pte_offset() only once to nuke it. This is correct
> for PMD or PUD size hugetlb, since they always contain only one
> pmd entry or pud entry in the page table.
> 
> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> since they can contain several continuous pte or pmd entry with
> same page table attributes, so we will nuke only one pte or pmd
> entry for this CONT-PTE/PMD size hugetlb page.
> 
> And now we only use try_to_unmap() to unmap a poisoned hugetlb page,
> which means now we will unmap only one pte entry for a CONT-PTE or
> CONT-PMD size poisoned hugetlb page, and we can still access other
> subpages of a CONT-PTE or CONT-PMD size poisoned hugetlb page,
> which will cause serious issues possibly.
> 
> So we should change to use huge_ptep_clear_flush() to nuke the
> hugetlb page table to fix this issue, which already considered
> CONT-PTE and CONT-PMD size hugetlb.
> 
> Note we've already used set_huge_swap_pte_at() to set a poisoned
> swap entry for a poisoned hugetlb page.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/rmap.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 7cf2408..1e168d7 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1564,28 +1564,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  					break;
>  				}
>  			}
> +			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);

Unlike in your patch 2/3, I do not see that this (huge) pteval would later
be used again with set_huge_pte_at() instead of set_pte_at(). Not sure if
this (huge) pteval could end up at a set_pte_at() later, but if yes, then
this would be broken on s390, and you'd need to use set_huge_pte_at()
instead of set_pte_at() like in your patch 2/3.

Please note that huge_ptep_get functions do not return valid PTEs on s390,
and such PTEs must never be set directly with set_pte_at(), but only with
set_huge_pte_at().

Background is that, for hugetlb pages, we are of course not really dealing
with PTEs at this level, but rather PMDs or PUDs, depending on hugetlb size.
On s390, the layout is quite different for PTEs and PMDs / PUDs, and
unfortunately the hugetlb code is not properly reflecting this by using
PMD or PUD types, like the THP code does.

So, as work-around, on s390, the huge_ptep_xxx functions will return
only fake PTEs, which must be converted again to a proper PMD or PUD,
before writing them to the page table, which is what happens in
set_huge_pte_at(), but not in set_pte_at().
