Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D0390280
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 15:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqFK94f4tz3086
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 23:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZeAFvRzL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZeAFvRzL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqFJk3bP2z2xvQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 23:28:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PDEqrh102981; Tue, 25 May 2021 09:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2rS/ykqTqaA/wc0oy+oS97t6lPbGZgbu1+82XXFsbgg=;
 b=ZeAFvRzLnXV2DhIqme79vsBHuO9IY+85YkwhFd0KuFGA8ceiCgxL3xRMB/5knbdJZy4t
 TmMbnA9/LG0TTLLO0b61DVkBuV1rUOLJ+PRxA384K/gq64M5YA+HFphDnebSl0Xf3HbL
 iHx1PpcOs48SUGeKpyQ+dZ/vVtgTXNrP8x2CTRHnSd9yti4L0fwd/2WmqH1/DxVXUkMO
 Sqre+V+7n6EX1OCngEGGmUdpSWQY6xJc3erQlQ4/MGzEG9xbnqXvZPZs+rIoab6vM7em
 a5jnNC8V/p/GwGM4l8hCcKOkacULb35tblbCuuxd9lKEblxvTWzYhXaMQVQBecVSi8qA Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s1xtrehx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:28:03 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PDFN4V105125;
 Tue, 25 May 2021 09:28:03 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s1xtrehe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:28:03 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PDE1Rc026393;
 Tue, 25 May 2021 13:28:02 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 38s1gg0ee4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:28:02 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PDS0x616843160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:28:01 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1BFD136053;
 Tue, 25 May 2021 13:28:00 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B03D913604F;
 Tue, 25 May 2021 13:27:57 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.69.234])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:27:57 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v6 07/11] mm/mremap: Use range flush that does TLB and
 page walk cache flush
In-Reply-To: <CAHk-=wimLWeWmsdkGetYzaASqxdzHmZGXJ51_3qjqyXBAYaw6g@mail.gmail.com>
References: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
 <20210524090114.63446-8-aneesh.kumar@linux.ibm.com>
 <CAHk-=wimLWeWmsdkGetYzaASqxdzHmZGXJ51_3qjqyXBAYaw6g@mail.gmail.com>
Date: Tue, 25 May 2021 18:57:55 +0530
Message-ID: <87mtsj6izo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MiiQgPjX3yUIbyK4DCugCFWFCTmXSa6N
X-Proofpoint-ORIG-GUID: hwTdNsxK0OXOzYQvvj0PzFt0-LEZuTnD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 mlxlogscore=976 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250081
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
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Sun, May 23, 2021 at 11:04 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Add new helper flush_pte_tlb_pwc_range() which invalidates both TLB and
>> page walk cache where TLB entries are mapped with page size PAGE_SIZE.
>
> So I dislike this patch for two reasons:
>
>  (a) naming.
>
> If the ppc people want to use crazy TLA's that have no meaning outside
> of the powerpc community, that's fine. But only in powerpc code.
>
> "pwc" makes no sense to me, or to anybody else that isn't intimately
> involved in low-level powerpc stuff. I assume it's "page walk cache",
> but honestly, outside of this area, PWC is mostly used for a specific
> type of webcam.
>
> So there's no way I'd accept this as-is, simply because of that.
> flush_pte_tlb_pwc_range() is simply not an acceptable name. You would
> have to spell it out, not use an obscure TLA.
>
> But I think you don't even want to do that, because of

How about flush_tlb_and_page_table_cache() ?

>
>  (b) is this even worth it as a public interface?
>
> Why doesn't the powerpc radix TLB flushing code just always flush the
> page table walking cache when the range is larger than a PMD?
>
> Once you have big flush ranges like that, I don't believe it makes any
> sense not to flush the walking cache too.

But such a large range invalidate doesn't imply we are freeing page
tables. Hence forcing a page table cache flush for large range
invalidate can have performance impact. ppc64 don't do a range page
table cache invalidate. Hence we will have to flush the full page table
cache.

>
> NOTE! This is particularly true as "flush the walking cache" isn't a
> well-defined operation anyway. Which _levels_ of the walking cache?
> Again, the size (and alignment) of the flush would actually tell you.
> A new boolean "flush" parameter does *NOT* tell that at all.
>
> So I think this new interface is mis-named, but I also think it's
> pointless. Just DTRT automatically when somebody asks for a flush that
> covers a PMD range (or a PUD range).
>
>               Linus

-aneesh
