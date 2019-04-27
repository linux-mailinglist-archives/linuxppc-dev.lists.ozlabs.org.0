Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD0B2D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 08:01:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rgKw6pzXzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:01:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=walken@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sQgZM+n9"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rgJ431nDzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 16:00:18 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 10so2723743pfo.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 23:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=9mSKg2SIvsOs/xLgAIl2pXj2eMJ9JaMiTd4MI5nAg04=;
 b=sQgZM+n9Be/cWtzN8fNus9HazrNXXo2P9TnRXJ3OGXR/7LV1xuaW4rJA/roFhqf0TY
 mQCS64dg1TtuGiotH0xCet3pe1hS8IOvRcqAhBIgfyzwhLE/9ZwL2Gwe40/zd/NnkU+7
 VrpMs8JFZ+ZUVmL6NL9u579BqupyJRMM5thKTY4byen+ygGpp6uuta11/qVxM0mde7gT
 NUJBfmXhweZUqn604h85jwvMEvFMmU1yG1Zy3ng8ZZlB4JTgg7O9/oy6VPt9CsqUZm4n
 K+HJubSlTziMfSj9ObPIOHOr59uF1HZw9VN8rdH7MqooI+xJn3y98FDtNsW803OpqSrv
 MhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9mSKg2SIvsOs/xLgAIl2pXj2eMJ9JaMiTd4MI5nAg04=;
 b=Nv0J/VkzCUNRlzxOZtou+GbkR7OJcrcPCkFBW0zIyGce4O/eunNLPknAaGN11Gr6TT
 2rLxj9AuZ/kPk2j9j0Dg4DUqc0uwN8sQXohW9Je37s+ayYKlS+oZdDGcr6lxKoybDONJ
 HTetTbM3YmSC+c57JWZ4RWJL457aCJu1uqhfuAw/31MQMW51xoRsxsBHp6+G5mF43Pkk
 95XSFh7hN0ipfqTTbwB7GX5fOVYCT4SgzavBjEgvTw95RvBDiIFddeHJkD6MT4UBNptE
 iJjtX9aTxQroo4Ayo6Ds3LypwkhIWJ+/9k923kw02myfdbdIR+hf+8tgwI4wGdhpeQEW
 cveA==
X-Gm-Message-State: APjAAAUK3ScNFreLrMYx1cglpxsPPYxo+zRWKYSyDoMx+tDksASLmpDO
 upaSZVAeIu7f5kvp9fi2oG8VJw==
X-Google-Smtp-Source: APXvYqxBrLQLYOhjC06ttH0oS4iTEZciWxGcpCjxLxO6REBckClVky6ibhEZSIdbT3pUDWmo5ZD8Gw==
X-Received: by 2002:a65:408b:: with SMTP id t11mr8911128pgp.372.1556344814717; 
 Fri, 26 Apr 2019 23:00:14 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:202:668d:6035:b425:3a3a])
 by smtp.gmail.com with ESMTPSA id u62sm44711410pfa.124.2019.04.26.23.00.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 23:00:13 -0700 (PDT)
Date: Fri, 26 Apr 2019 23:00:10 -0700
From: Michel Lespinasse <walken@google.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v12 00/31] Speculative page faults
Message-ID: <20190427060010.GB174296@google.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <CANN689F1h9XoHPzr_FQY2WfN5bb2TTd6M3HLqoJ-DQuHkNbA7g@mail.gmail.com>
 <aadc7b03-9121-6800-341b-6f2849088a09@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aadc7b03-9121-6800-341b-6f2849088a09@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jan Kara <jack@suse.cz>, sergey.senozhatsky.work@gmail.com,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Punit Agrawal <punitagrawal@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 David Rientjes <rientjes@google.com>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Haiyan Song <haiyanx.song@intel.com>, Nick Piggin <npiggin@gmail.com>,
 sj38.park@gmail.com, Jerome Glisse <jglisse@redhat.com>, dave@stgolabs.net,
 kemi.wang@intel.com, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 vinayak menon <vinayakm.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 24, 2019 at 08:01:20PM +0200, Laurent Dufour wrote:
> Le 22/04/2019 à 23:29, Michel Lespinasse a écrit :
> > Hi Laurent,
> > 
> > Thanks a lot for copying me on this patchset. It took me a few days to
> > go through it - I had not been following the previous iterations of
> > this series so I had to catch up. I will be sending comments for
> > individual commits, but before tat I would like to discuss the series
> > as a whole.
> 
> Hi Michel,
> 
> Thanks for reviewing this series.
> 
> > I think these changes are a big step in the right direction. My main
> > reservation about them is that they are additive - adding some complexity
> > for speculative page faults - and I wonder if it'd be possible, over the
> > long term, to replace the existing complexity we have in mmap_sem retry
> > mechanisms instead of adding to it. This is not something that should
> > block your progress, but I think it would be good, as we introduce spf,
> > to evaluate whether we could eventually get all the way to removing the
> > mmap_sem retry mechanism, or if we will actually have to keep both.
> 
> Until we get rid of the mmap_sem which seems to be a very long story, I
> can't see how we could get rid of the retry mechanism.

Short answer: I'd like spf to be extended to handle file vmas,
populating page tables, and the vm_normal_page thing, so that we
wouldn't have to fall back to the path that grabs (and possibly
has to drop) the read side mmap_sem.

Even doing the above, there are still cases spf can't solve - for
example, gup, or the occasional spf abort, or even the case of a large
mmap/munmap delaying a smaller one. I think replacing mmap_sem with a
reader/writer interval lock would be a very nice generic solution to
this problem, allowing false conflicts to proceed in parallel, while
synchronizing true conflicts which is exactly what we want. But I
don't think such a lock can be implemented efficiently enough to be
put on the page fault fast-path, so I think spf could be the solution
there - it would allow us to skip taking that interval lock on most
page faults. The other places where we use mmap_sem are not as critical
for performance (they normally operate on a larger region at a time)
so I think we could afford the interval lock in those places.

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
