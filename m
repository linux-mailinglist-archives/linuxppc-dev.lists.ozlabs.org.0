Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5439EDC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 06:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzcx95wmnz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 14:40:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WU89kPye;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WU89kPye; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzcwd5NJ3z2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 14:40:00 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1584WncM091872; Tue, 8 Jun 2021 00:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=y6UKFNAlMeCoqG0SMVNwxsvVLtqOf6seSG2nQiVyHqs=;
 b=WU89kPyejuTszVl5AQlzLfcvWa8l4dk2GVxxIFMf9fZCyet59a8Ks+emWawUiM8U6b3X
 H0zzeVlEDVrtRnLAuKS90reweirxMIS+QfPNAE21/sddsvdoSUNXZ/uyPJWFP7DvJ0Eh
 +Cb31b/6deAGvKdjSsIQoUaLwHXkQvG5C/VGu9SsAo0SeaSfUnB54WArIeS+b9ktX5wY
 aRkOgQCRQkWFjuYYTfbR3J9YxPRxy08Iya+qt9g6upLakzqzhihdCoZ7TurWIryuyThv
 YwRvaB9jeUGMgcua+fvDukfPapkqo6LsnbZu1rsoeU+fRgr6ueT4m72l2QNrFoWL/XzE kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391yr2te6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 00:39:44 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1584XYZx094419;
 Tue, 8 Jun 2021 00:39:44 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391yr2te6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 00:39:44 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1584clEY010183;
 Tue, 8 Jun 2021 04:39:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3900hhgppd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 04:39:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1584ddBY33095952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 04:39:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73E284C059;
 Tue,  8 Jun 2021 04:39:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AD2E4C05C;
 Tue,  8 Jun 2021 04:39:37 +0000 (GMT)
Received: from [9.199.43.138] (unknown [9.199.43.138])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 04:39:37 +0000 (GMT)
Subject: Re: [PATCH v7 00/11] Speedup mremap on ppc64
To: Nick Piggin <npiggin@gmail.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <CAPa8GCAmgUyqqAcuLC7KxDvDepkqhhvVcwgSGJh92PT+LoMQcw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <3f2b7150-eaba-e1ab-bb88-53a3510727b9@linux.ibm.com>
Date: Tue, 8 Jun 2021 10:09:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <CAPa8GCAmgUyqqAcuLC7KxDvDepkqhhvVcwgSGJh92PT+LoMQcw@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yHmOaJINt8dkj1ABM1GO2cyw1fBaP23J
X-Proofpoint-ORIG-GUID: n_ktbhxQyeSJ8-uwD-PcLxBW_JT_-ggm
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_01:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=992 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080030
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "kaleshsingh@google.com" <kaleshsingh@google.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/7/21 3:40 PM, Nick Piggin wrote:
> On Monday, 7 June 2021, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> 
> wrote: This patchset enables MOVE_PMD/MOVE_PUD support on power. This 
> requires the platform to support updating higher-level page tables 
> without updating page table ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
> 
> 
> On Monday, 7 June 2021, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com 
> <mailto:aneesh.kumar@linux.ibm.com>> wrote:
> 
> 
>     This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
>     the platform to support updating higher-level page tables without
>     updating page table entries. This also needs to invalidate the Page Walk
>     Cache on architecture supporting the same.
> 
>     Changes from v6:
>     * Update ppc64 flush_tlb_range to invalidate page walk cache.
> 
> 
> I'd really rather not do this, I'm not sure if micro bench mark captures 
> everything.
> 
> Page tables coming from L2/L3 probably aren't the primary purpose or 
> biggest benefit of intermediate level caches.
> 
> The situation on POWER with nest mmu (coherent accelerators) is 
> magnified. They have huge page walk cashes to make up for the fact they 
> don't have data caches for walking page tables which makes the 
> invalidation more painful in terms of subsequent misses, but also 
> latency to invalidate (can be order of microseconds whereas a page 
> invalidate is a couple of orders of magnitude faster).
> 

If we are using NestMMU, we already upgrade that flush to invalidate 
page walk cache right? ie, if we have > PMD_SIZE range, we would upgrade 
the invalidate to a pid flush via

flush_pid = nr_pages > tlb_single_page_flush_ceiling;
	
and if it is PID flush if we are using NestMMU we already upgrade a 
RIC_FLUSH_TLB to RIC_FLUSH_ALL ?

> Yes it is a deficiency of the ppc invalidation architecture, we are 
> aware and would like to improve it but for now those is what we have.
> 

-aneesh
