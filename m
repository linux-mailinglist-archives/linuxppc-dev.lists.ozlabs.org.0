Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A26B279
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 03:55:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rYsN2F3TzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 11:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=walken@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="anuLVemm"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rYqB3z20zDqVf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 11:53:23 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id o5so2340338pls.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 18:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=C0VKk+EAi5u5Uun6wBIN+muqXBgzzEs95GkHwVG5AAA=;
 b=anuLVemm2cS9eYF8xrdrwSlIQY4mMWHdXLDko+6AmctdVHFyF5pQaGa1SeN03K7rrV
 OCNQzJvzftqVbUoLyHTYPZBbUnfJcKDZ5UdXqXHSKsGDdAWUglACEGTREID86yWfbit9
 dVLK7b97qd2DLolrjLXXfo2U5j3jMBwunkG8+NqUhpUllSrofHUg02I7+bbDVIAtTCii
 5/YFx7IoojLdfRZ37NfXOGWRI39lUQQL3a2F9NsFiAS/QJJpqxZCxHBLdMC9oHJWqACB
 PJm6bC6+IXoHRaW55sgvw2UwKZGVHppqkASMv3q6vxVLu3vCMSw2zpVYFG1iFY+IyFsO
 Kfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=C0VKk+EAi5u5Uun6wBIN+muqXBgzzEs95GkHwVG5AAA=;
 b=T/Ank+15rEJz26tYCgRk915xWwdMlw8uuiw7twjKLCLVauysjjxKHTc6sxjr/3o3xi
 oiAxHSkVz+2vBguKB+/lCztM3N+7udb/zWqsCQABmdmAZUdfq9FSONCtsDKIkAmQhdG2
 SEiqjNx9rTEUKy8JMiWY69CpVaE9DfQZJtpZPJPgQwnETGFordodlhoFI1No1z+N8A4P
 F1wNNwLuB4El8FGiOuR5hCiIoHYxeNYGemayJjmrBbXyLKDFKhmcecnph/OfmrpD+XoG
 DlslMdYMu8i5QKdw93tefQbOp/hU9UGaehN7sKdwMI/HjrlMxPXHD2MgbZPlm7NAvbtk
 SIKg==
X-Gm-Message-State: APjAAAWUIa8KI3waM6yZro4hW1kcn18Zh7stsYX7yKNC/OfX3edsWdYG
 Of6Knll32d6sxuLWXdJDgTi/nQ==
X-Google-Smtp-Source: APXvYqzLc91mh/R/1sCU3aj6tk7P3taVwaDKlm61Xk6iVK1dTUs3AnXwhAqNlKEB6ez6miyXsn0kYQ==
X-Received: by 2002:a17:902:7206:: with SMTP id
 ba6mr14556564plb.301.1556330000083; 
 Fri, 26 Apr 2019 18:53:20 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:202:668d:6035:b425:3a3a])
 by smtp.gmail.com with ESMTPSA id f63sm46374543pfc.180.2019.04.26.18.53.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 18:53:17 -0700 (PDT)
Date: Fri, 26 Apr 2019 18:53:15 -0700
From: Michel Lespinasse <walken@google.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v12 00/31] Speculative page faults
Message-ID: <20190427015315.GA174296@google.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <CANN689F1h9XoHPzr_FQY2WfN5bb2TTd6M3HLqoJ-DQuHkNbA7g@mail.gmail.com>
 <20190423093851.GJ11158@hirez.programming.kicks-ass.net>
 <05df6720-7130-62fe-a71f-074b6fafff3e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05df6720-7130-62fe-a71f-074b6fafff3e@linux.ibm.com>
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

On Wed, Apr 24, 2019 at 09:33:44AM +0200, Laurent Dufour wrote:
> Le 23/04/2019 à 11:38, Peter Zijlstra a écrit :
> > On Mon, Apr 22, 2019 at 02:29:16PM -0700, Michel Lespinasse wrote:
> > > The proposed spf mechanism only handles anon vmas. Is there a
> > > fundamental reason why it couldn't handle mapped files too ?
> > > My understanding is that the mechanism of verifying the vma after
> > > taking back the ptl at the end of the fault would work there too ?
> > > The file has to stay referenced during the fault, but holding the vma's
> > > refcount could be made to cover that ? the vm_file refcount would have
> > > to be released in __free_vma() instead of remove_vma; I'm not quite sure
> > > if that has more implications than I realize ?
> > 
> > IIRC (and I really don't remember all that much) the trickiest bit was
> > vs unmount. Since files can stay open past the 'expected' duration,
> > umount could be delayed.
> > 
> > But yes, I think I had a version that did all that just 'fine'. Like
> > mentioned, I didn't keep the refcount because it sucked just as hard as
> > the mmap_sem contention, but the SRCU callback did the fput() just fine
> > (esp. now that we have delayed_fput).
> 
> I had to use a refcount for the VMA because I'm using RCU in place of SRCU
> and only protecting the RB tree using RCU.
> 
> Regarding the file pointer, I decided to release it synchronously to avoid
> the latency of RCU during the file closing. As you mentioned this could
> delayed the umount but not only, as Linus Torvald demonstrated by the past
> [1]. Anyway, since the file support is not yet here there is no need for
> that currently.
>
> [1] https://lore.kernel.org/linux-mm/alpine.LFD.2.00.1001041904250.3630@localhost.localdomain/

Just to make sure I understand this correctly. If a program tries to
munmap a region while page faults are occuring (which means that the
program has a race condition in the first place), before spf the
mmap_sem would delay the munmap until the page fault completes. With
spf the munmap will happen immediately, while the vm_ops->fault()
is running, with spf holding a ref to the file. vm_ops->fault is
expected to execute a read from the file to the page cache, and the
page cache page will never be mapped into the process because after
taking the ptl, spf will notice the vma changed.  So, the side effects
that may be observed after munmap completes would be:

- side effects from reading a file into the page cache - I'm not sure
  what they are, the main one I can think of is that userspace may observe
  the file's atime changing ?

- side effects from holding a reference to the file - which userspace
  may observe by trying to unmount().

Is that the extent of the side effects, or are there more that I have
not thought of ?

> Regarding the file mapping support, the concern is to ensure that
> vm_ops->fault() will not try to release the mmap_sem. This is true for most
> of the file system operation using the generic one, but there is currently
> no clever way to identify that except by checking the vm_ops->fault pointer.
> Adding a flag to the vm_operations_struct structure is another option.
> 
> that's doable as far as the underlying fault() function is not dealing with
> the mmap_sem, and I made a try by the past but was thinking that first the
> anonymous case should be accepted before moving forward this way.

Yes, that makes sense. Updating all of the fault handlers would be a
lot of work - but there doesn't seem to be anything fundamental that
wouldn't work there (except for the side effects of reordering spf
against munmap, as discussed above, which doesn't look easy to fully hide.).

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
