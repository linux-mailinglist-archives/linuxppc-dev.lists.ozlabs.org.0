Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00F26349C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 19:28:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmprZ3tbkzDqYj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 03:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a0Fn+WGs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmppN2tLTzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 03:26:20 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089HJ2gK051405; Wed, 9 Sep 2020 13:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=cjurvjugr7NYNyJv2e5m0mRxD9kWPQ1Co8p7cVwZgRc=;
 b=a0Fn+WGsOgKb9v9OSCIZ4vTawA6Q4ZWyUk5Zt6IyTNtTXdZySGDE4pfNW4f9sOhvDRO5
 pyaNWhLyJ2qz3kHm1udz4qSWUWaxsbyYzZLNWKFPeYNcxy2qdx0OXkhkTDPLQoBCBK1t
 7YomGSfviJhw2ax52kN9UbRlZeV16c8bRZP4tJOx9BLgNI8eZteBXenPoAxximHCBe3r
 oc3mh8uaZpxgVJjOxB3Kwhe+XjRIXqlbY7UiHRXs8QbI/LmnYJW28BEv9GJIlDCWO9Nn
 BcMJVH24ws0Fur+qARRdqFfpfnTFoGkjKZORJo+fOQcFQTXSPiLNreCZu/z5cCKZzuRh 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33f3b88711-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 13:25:42 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 089HKUCM063750;
 Wed, 9 Sep 2020 13:25:42 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33f3b886y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 13:25:42 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089HLmU7024299;
 Wed, 9 Sep 2020 17:25:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33c2a84w57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 17:25:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 089HPaUJ57147902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 17:25:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A04C5AE058;
 Wed,  9 Sep 2020 17:25:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75DA7AE057;
 Wed,  9 Sep 2020 17:25:35 +0000 (GMT)
Received: from thinkpad (unknown [9.171.79.102])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Sep 2020 17:25:35 +0000 (GMT)
Date: Wed, 9 Sep 2020 19:25:34 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200909192534.442f8984@thinkpad>
In-Reply-To: <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_12:2020-09-09,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090147
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 9 Sep 2020 09:18:46 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 9/9/20 5:29 AM, Gerald Schaefer wrote:
> > This only works well as long there are real pagetable pointers involved,
> > that can also be used for iteration. For gup_fast, or any other future
> > pagetable walkers using the READ_ONCE logic w/o lock, that is not true.
> > There are pointers involved to local pXd values on the stack, because of
> > the READ_ONCE logic, and our middle-level iteration will suddenly iterate
> > over such stack pointers instead of pagetable pointers.
> 
> By "There are pointers involved to local pXd values on the stack", did
> you mean "locate" instead of "local"?  That sentence confused me.
> 
> Which code is it, exactly that allocates these troublesome on-stack pXd
> values, btw?

It is the gup_pXd_range() call sequence in mm/gup.c. It starts in
gup_pgd_range() with "pgdp = pgd_offset(current->mm, addr)" and then
the "pgd_t pgd = READ_ONCE(*pgdp)" which creates the first local
stack variable "pgd".

The next-level call to gup_p4d_range() gets this "pgd" value as
input, but not the original pgdp pointer where it was read from.
This is already the essential difference to other pagetable walkers
like e.g. walk_pXd_range() in mm/pagewalk.c, where the original
pointer is passed through. With READ_ONCE, that pointer must not
be further de-referenced, so instead the value is passed over.

In gup_p4d_range() we then have "p4dp = p4d_offset(&pgd, addr)",
with &pgd being a pointer to the passed over pgd value, so that's
the first pXd pointer that does not point directly to the pXd in
the page table, but a local stack variable.

With folded p4d, p4d_offset(&pgd, addr) will simply return
the passed-in &pgd pointer, so we now also have p4dp point to that.
That continues with "p4d_t p4d = READ_ONCE(*p4dp)", and that second
stack variable passed to gup_huge_pud() and so on. Due to inlining,
all those variables will not really be passed anywhere, but simply
sit on the stack.

So far, IIUC, that would also happen on x86 (or everywhere else
actually) for folded levels, i.e. some pXd_offset() calls would
simply return the passed in (stack) value pointer. This works
as designed, and it will not lead to the "iteration over stack
pointer" for anybody but s390, because the pXd_addr_end()
boundaries usually take care that you always return to pgd
level for iteration, and that is the only level with a real
pagetable pointer. For s390, we stay at the first non-folded
level and do the iteration there, which is fine for other
pagetable walkers using the original pointers, but not for
the READ_ONCE-style gup_fast.

I actually had to draw myself a picture to get some hold of
this, or rather a walk-through with a certain pud-crossing
range in a folded 3-level scenario. Not sure if I would have
understood my explanation above w/o that, but I hope you can
make some sense out of it. Or draw yourself a picture :-)
