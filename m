Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE303A5736
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 11:06:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2pcF3f0hz305q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 19:06:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VQs8MrO/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VQs8MrO/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2pbm4zkTz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:06:27 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15D936Cf132807; Sun, 13 Jun 2021 05:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=mcQQrBfatJvWY0TUbiycVjKBVWxR5pTrer8Ia7/qIbE=;
 b=VQs8MrO/Lk3241gSPZXxpmpdhzk9F/0EvEaj0gbWn3DZDJ4lFhD9I9gppmu5ERlN3t4S
 TQsJNV4+CB9dcOxWVRNxiwHXS7u/7kbHYxTDXBG9pTz8IIcJwtJlmSaiduFlhIOr0zwX
 SzkYnPkOydeUZnGXQIeeqVn25te5Qg8/OBnLbvebFtxLOCQU/Wofzt2fnbkd3DGczOgs
 gpLrA3nizypwqb13MV7OqkVH/cDBI3iAkofvOs2wfMc2Hhl5CtuaU17yQUJrryHRgiG2
 keiOlZodWb/f1RRch8lktOHpJHRURjH7Hbp1dStB+66J90vLI3eMlcZR6SNT6eVJ1RTF bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395ag7vfta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 05:06:21 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15D93Zr4133873;
 Sun, 13 Jun 2021 05:06:21 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395ag7vfsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 05:06:21 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15D8x8qE008939;
 Sun, 13 Jun 2021 09:06:20 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3954gjk5t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 09:06:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15D96Jax6685324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 09:06:19 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFCF26E053;
 Sun, 13 Jun 2021 09:06:19 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11E626E050;
 Sun, 13 Jun 2021 09:06:16 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.68.237])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 13 Jun 2021 09:06:16 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 5/6] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
In-Reply-To: <CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com>
References: <20210610083549.386085-1-aneesh.kumar@linux.ibm.com>
 <20210610083549.386085-6-aneesh.kumar@linux.ibm.com>
 <CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com>
Date: Sun, 13 Jun 2021 14:36:13 +0530
Message-ID: <87wnqy9lru.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f6bq_NqM1FAasdARPBVq1mgly4dFAy7I
X-Proofpoint-ORIG-GUID: qn8Gd8lSPxy5AYVYjFF5q24RMxjOaVQK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_02:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106130067
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Thu, Jun 10, 2021 at 1:36 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> @@ -306,8 +306,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>>
>>         VM_BUG_ON(!pud_none(*new_pud));
>>
>> -       /* Set the new pud */
>> -       set_pud_at(mm, new_addr, new_pud, pud);
>> +       pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
>>         flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
>>         if (new_ptl != old_ptl)
>>                 spin_unlock(new_ptl);
>
> That "(pmd_t *)pud_page_vaddr(pud)" looks a bit odd and doesn't match
> the pattern.
>
> Should we perhaps have a wrapper for it? Maybe called "pud_pgtable()",
> the same way we have pmd_pgtable()?

IIUC the reason why we do have pmd_pgtable() is that pgtable_t type
is arch dependent. On some architecture it is pte_t * and on the other
struct page *. The reason being highmem and level 4 page table can
be located in highmem. 

The above is not true with the level 3 table and hence we didn't add an
extra type to point to level 3 table.

We could add pud_pgtable(), but then it will essentially be a typecast
as I did above?

Even if we want to do that, that should be done as a separate patch than
this series?

>
> And that wrapper would be good to have a comment or two about what it
> actually is. The same way that pmd_pgtable() should but doesn't ;(
>
>             Linus
