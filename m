Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524F4DAE8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 11:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJS1Z5ykxz3bSq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 21:58:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qyq/3FcT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qyq/3FcT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJS0p11YTz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 21:57:45 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GAkNhe029949; 
 Wed, 16 Mar 2022 10:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=pqEtRRluTdcqyicuZ3uViocrXZh7WOAHX11wx61Vhzs=;
 b=qyq/3FcT7lW08wy86AfF5YcyJ4M2Xfa8xUImtiANcjURw+I5Kli3Vy30gDfzTvslBbnY
 xRG9tc6FV2PFw9acgFVZqCXmWejAgM0pN33TYrJhxDf7H5hJS6v9+qkMJB9dlUCJg1na
 CaxdnWteUBEUWmCFeObXJQV/KgLRbH+NQ5Ysu2w3tEadW75kJt+7AbFi98npqwi2VqIg
 Di68f/hoJ62wecZiNlKTatqsuW90kjmz2OhBCrBS5b3e6bq/CAOP4mOYVvALDIWUFmTJ
 RQtgwdTPl+Cng7e3BzSmbUg20zE/eBhNNUYJwATKzu+/S4YYEnYcthpc9azC75ErC3FB ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eueef8656-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 10:57:04 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22GAqaOw021546;
 Wed, 16 Mar 2022 10:57:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eueef864b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 10:57:03 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22GAqwHQ004747;
 Wed, 16 Mar 2022 10:57:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3et95wv4d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 10:57:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22GAuwnT23789856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 10:56:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 071CDA404D;
 Wed, 16 Mar 2022 10:56:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C6D9A4053;
 Wed, 16 Mar 2022 10:56:56 +0000 (GMT)
Received: from thinkpad (unknown [9.171.18.20])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Mar 2022 10:56:56 +0000 (GMT)
Date: Wed, 16 Mar 2022 11:56:54 +0100
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/7] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <20220316115654.12823b78@thinkpad>
In-Reply-To: <55b6b582-51ca-b869-2055-674fe4c563e6@redhat.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-6-david@redhat.com>
 <20220315172102.771bd2cf@thinkpad>
 <c8229082-e8f1-e605-25c2-0ec9d23efd9e@redhat.com>
 <8b13b6c0-78d4-48e3-06f0-ec0680d013a9@redhat.com>
 <55b6b582-51ca-b869-2055-674fe4c563e6@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LNrEZRUbiCjvuMs3vypCO_bwoZe7D75W
X-Proofpoint-ORIG-GUID: L41oykoEMXECEBvnbt61pfruSn_s2QSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203160064
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oded Gabbay <oded.gabbay@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Mar 2022 18:12:16 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 15.03.22 17:58, David Hildenbrand wrote:
> > 
> >>> This would mean that it is not OK to have bit 52 not zero for swap PTEs.
> >>> But if I read the POP correctly, all bits except for the DAT-protection
> >>> would be ignored for invalid PTEs, so maybe this comment needs some update
> >>> (for both bits 52 and also 55).
> >>>
> >>> Heiko might also have some more insight.
> >>
> >> Indeed, I wonder why we should get a specification exception when the
> >> PTE is invalid. I'll dig a bit into the PoP.
> > 
> > SA22-7832-12 6-46 ("Translation-Specification Exception") is clearer
> > 
> > "The page-table entry used for the translation is
> > valid, and bit position 52 does not contain zero."
> > 
> > "The page-table entry used for the translation is
> > valid, EDAT-1 does not apply, the instruction-exe-
> > cution-protection facility is not installed, and bit
> > position 55 does not contain zero. It is model
> > dependent whether this condition is recognized."
> > 
> 
> I wonder if the following matches reality:
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 008a6c856fa4..6a227a8c3712 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1669,18 +1669,16 @@ static inline int has_transparent_hugepage(void)
>  /*
>   * 64 bit swap entry format:
>   * A page-table entry has some bits we have to treat in a special way.
> - * Bits 52 and bit 55 have to be zero, otherwise a specification
> - * exception will occur instead of a page translation exception. The
> - * specification exception has the bad habit not to store necessary
> - * information in the lowcore.
>   * Bits 54 and 63 are used to indicate the page type.
>   * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
> - * This leaves the bits 0-51 and bits 56-62 to store type and offset.
> - * We use the 5 bits from 57-61 for the type and the 52 bits from 0-51
> - * for the offset.
> - * |                     offset                        |01100|type |00|
> + * |                     offset                        |XX1XX|type |S0|
>   * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
>   * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
> + *
> + * Bits 0-51 store the offset.
> + * Bits 57-62 store the type.
> + * Bit 62 (S) is used for softdirty tracking.
> + * Bits 52, 53, 55 and 56 (X) are unused.
>   */
>  
>  #define __SWP_OFFSET_MASK      ((1UL << 52) - 1)
> 
> 
> I'm not sure why bit 53 was indicated as "1" and bit 55 was indicated as
> "0". At least for 52 and 55 there was a clear description.

Bit 53 is the invalid bit, and that is always 1 for swap ptes, in addition
to protection bit 54. Bit 55, along with bit 52, has to be zero according
to the (potentially deprecated) comment.

It is interesting that bit 56 seems to be unused, at least according
to the comment, but that would also mention bit 62 as unused, so that
clearly needs some update.

If bit 56 could be used for _PAGE_SWP_EXCLUSIVE, that would be better
than stealing a bit from the offset, or using potentially dangerous
bit 52. It is defined as _PAGE_UNUSED and only used for kvm, not sure
if this is also relevant for swap ptes, similar to bit 62.

Adding Christian on cc, maybe he has some insight on _PAGE_UNUSED
bit 56 and swap ptes.
