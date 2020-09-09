Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC52262DB5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 13:18:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmffP28rBzDqTX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 21:18:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iaMEMAKO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmfc90pwRzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 21:16:56 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089B2nJd092122; Wed, 9 Sep 2020 07:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=riUQZa+/LVXf6Ou5pnmw20PmDmt4IrioJwwAUmCDr/A=;
 b=iaMEMAKOq6a3SWW/R67/MPK2hEPA6LY1MbfVPorsKPvvZqLyV4KVRlECm01bDKqCgCFI
 aQcFM56KMHBk6Ag+PZe8M+OmEOLRP5UZ2og3ghQt92WVO5VrPLEc/B6tb30lxK69nOrm
 ZLBFHmuS4Uya0/LsIj6cz7rOGDz0Mi87rZQR3vxr5AcRrk+Sr8qI9sEL4dXi677v/Tjg
 WsOOZYW29FyRlSW8VbDq8b+oPR25QhUBYzL0QGTypHVWA0OmxZX47z7COkOpgaUq2gaM
 FVofmX6Dh2vuGbS4IEWvMWvLPrJU91EeRJW2kyKT2x5bYd7+AFOZgO3Oth1TPKWrb3oR mg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ewhch1ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 07:16:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089BDUkw021098;
 Wed, 9 Sep 2020 11:16:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 33e5gmrput-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 11:16:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 089BGfxa35062080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 11:16:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A47AAE057;
 Wed,  9 Sep 2020 11:16:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FE6EAE045;
 Wed,  9 Sep 2020 11:16:40 +0000 (GMT)
Received: from thinkpad (unknown [9.171.79.102])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Sep 2020 11:16:40 +0000 (GMT)
Date: Wed, 9 Sep 2020 13:16:38 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-ID: <20200909131638.4a95e806@thinkpad>
In-Reply-To: <87wo134h3s.fsf@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad>
 <20200904180115.07ee5f00@thinkpad>
 <20200908173906.30fffaa0@thinkpad> <87wo134h3s.fsf@linux.ibm.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_06:2020-09-08,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090095
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, akpm@linux-foundation.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 09 Sep 2020 11:38:39 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> Gerald Schaefer <gerald.schaefer@linux.ibm.com> writes:
> 
> > On Fri, 4 Sep 2020 18:01:15 +0200
> > Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
> >
> > [...]
> >> 
> >> BTW2, a quick test with this change (so far) made the issues on s390
> >> go away:
> >> 
> >> @@ -1069,7 +1074,7 @@ static int __init debug_vm_pgtable(void)
> >>         spin_unlock(ptl);
> >> 
> >>  #ifndef CONFIG_PPC_BOOK3S_64
> >> -       hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> >> +       hugetlb_advanced_tests(mm, vma, (pte_t *) pmdp, pmd_aligned, vaddr, prot);
> >>  #endif
> >> 
> >>         spin_lock(&mm->page_table_lock);
> >> 
> >> That would more match the "pte_t pointer" usage for hugetlb code,
> >> i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
> >> but I think the root cause is the pte_t pointer.
> >> 
> >> Not entirely sure though if that would really be the correct fix.
> >> I somehow lost whatever little track I had about what these tests
> >> really want to check, and if that would still be valid with that
> >> change.
> >
> > Uh oh, wasn't aware that this (or some predecessor) already went
> > upstream, and broke our debug kernel today.
> 
> Not sure i followed the above. Are you finding that s390 kernel crash
> after this patch series or the original patchset? As noted in my patch
> the hugetlb test is broken and we should fix that. A quick fix is to
> comment out that test for s390 too as i have done for PPC64.

We see it with both, it basically is broken since there is a hugetlb
test using real pte pointers. It doesn't always show, depending on
random vaddr, so it slipped through earlier testing.

I guess we also would have had one or the other chance to notice
that earlier, through better review, or better reading of previous
mails. I must admit that I neglected this a bit.
