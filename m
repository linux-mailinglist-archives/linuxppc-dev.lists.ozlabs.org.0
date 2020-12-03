Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C42CDDCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 19:36:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn4L55Cv8zDrFj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 05:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NfVpGea8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn4HL4j6czDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 05:34:06 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3IVt3E020708; Thu, 3 Dec 2020 13:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=TZJYX0Xz4UjLTS/rfkcr8IlGL0o4uzxTOtku92jtwoI=;
 b=NfVpGea8w/urP+0xgSu8wxf+gdvh/U9VpdAgRmDV/BYhdSkDTgZuI5WETvZMzmQH0f0s
 6aodtW5hM+tXF1P1ifdywCxCWC739OrsJym2RAyBb8JynxWz5GlcnN5vA3evZorrsORu
 r3tm7YWaKF+GTGtna0a/TQ8xxljtbOffZk4walLTYWRylxkl2LN1mm2jWuGv6OS9j9ZQ
 icpOh09siL9FBldltwygdBtXOyZj7JQbYWSYpO/+GSpfkqF4qKSurnWaLY6pnN8AD8Kk
 fZGhPeQ5U74AgwZpXFo5fw/G71TwLj8rHaQ+uz7tRCePeC7u3JUg7kD+tkpxPC3CeVvQ IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3573jf3ppm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 13:33:48 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B3IWmnw024120;
 Thu, 3 Dec 2020 13:33:48 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3573jf3png-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 13:33:48 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B3ICY7q021745;
 Thu, 3 Dec 2020 18:33:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 35693xhgu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 18:33:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B3IXg9c24314226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 18:33:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79EE6AE051;
 Thu,  3 Dec 2020 18:33:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86250AE04D;
 Thu,  3 Dec 2020 18:33:41 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.157.245])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Dec 2020 18:33:41 +0000 (GMT)
Date: Thu, 3 Dec 2020 19:33:40 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
Message-ID: <20201203183339.GA29470@oc3871087118.ibm.com>
References: <20201203170332.GA27195@oc3871087118.ibm.com>
 <E6BC2596-6087-49F2-8758-CA5598998BBE@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E6BC2596-6087-49F2-8758-CA5598998BBE@amacapital.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_10:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030107
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 09:14:22AM -0800, Andy Lutomirski wrote:
> 
> 
> > On Dec 3, 2020, at 9:09 AM, Alexander Gordeev <agordeev@linux.ibm.com> wrote:
> > 
> > ﻿On Mon, Nov 30, 2020 at 10:31:51AM -0800, Andy Lutomirski wrote:
> >> other arch folk: there's some background here:
> 
> > 
> >> 
> >> power: Ridiculously complicated, seems to vary by system and kernel config.
> >> 
> >> So, Nick, your unconditional IPI scheme is apparently a big
> >> improvement for power, and it should be an improvement and have low
> >> cost for x86.  On arm64 and s390x it will add more IPIs on process
> >> exit but reduce contention on context switching depending on how lazy
> > 
> > s390 does not invalidate TLBs per-CPU explicitly - we have special
> > instructions for that. Those in turn initiate signalling to other
> > CPUs, completely transparent to OS.
> 
> Just to make sure I understand: this means that you broadcast flushes to all CPUs, not just a subset?

Correct.
If mm has one CPU attached we flush TLB only for that CPU.
If mm has more than one CPUs attached we flush all CPUs' TLBs.

In fact, details are bit more complicated, since the hardware
is able to flush subsets of TLB entries depending on provided
parameters (e.g page tables used to create that entries).
But we can not select a CPU subset.

> > Apart from mm_count, I am struggling to realize how the suggested
> > scheme could change the the contention on s390 in connection with
> > TLB. Could you clarify a bit here, please?
> 
> I’m just talking about mm_count. Maintaining mm_count is quite expensive on some workloads.
> 
> > 
> >> TLB works.  I suppose we could try it for all architectures without
> >> any further optimizations.  Or we could try one of the perhaps
> >> excessively clever improvements I linked above.  arm64, s390x people,
> >> what do you think?
> > 
> > I do not immediately see anything in the series that would harm
> > performance on s390.
> > 
> > We however use mm_cpumask to distinguish between local and global TLB
> > flushes. With this series it looks like mm_cpumask is *required* to
> > be consistent with lazy users. And that is something quite diffucult
> > for us to adhere (at least in the foreseeable future).
> 
> You don’t actually need to maintain mm_cpumask — we could scan all CPUs instead.
> 
> > 
> > But actually keeping track of lazy users in a cpumask is something
> > the generic code would rather do AFAICT.
> 
> The problem is that arches don’t agree on what the contents of mm_cpumask should be.  Tracking a mask of exactly what the arch wants in generic code is a nontrivial operation.

It could be yet another cpumask or the CPU scan you mentioned.
Just wanted to make sure there is no new requirement for an arch
to maintain mm_cpumask ;)

Thanks, Andy!
