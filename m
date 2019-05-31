Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2E3142A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 19:50:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FsRL53tlzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 03:50:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="EAUDatB5"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FsQ43RHtzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 03:49:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ox5SYttOkOuRXfS7cs3JsHQ+R0GLTw4N6BHjQRoaW9E=; b=EAUDatB5hW46G9M1Ux5rKjKdO
 2gatVjjYZRPlz/Y8yieBJl+NTOqpgatgBKBU0KD4TsTPRHuOAOdASb97lecou22eiM2OapeLCzPgp
 B0i0qPk66SspAy6OJFa1NIO4ol3ItewiiFaxYuuw7LLCg6ihQcITsomL18HAh28KsH655hSpvEaXK
 xELWZ9GoG8dKe0FlwT+BYKfNw7vVZDolyKXu+JXuRall/zajJ1hcm3jvaxeoZ0nnxHMg7OjxSwtOg
 5Emd9DEvLQB4DtO5nEcmw84mXxgWLl2OJrNXW+ggkep9wq+uTLg1JfxZNt1MTnoW7sdnu4+jS5Uxt
 sHxXOWYlg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hWleA-0002Ni-V0; Fri, 31 May 2019 17:48:54 +0000
Date: Fri, 31 May 2019 10:48:54 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC] mm: Generalize notify_page_fault()
Message-ID: <20190531174854.GA31852@bombadil.infradead.org>
References: <1559195713-6956-1-git-send-email-anshuman.khandual@arm.com>
 <20190530110639.GC23461@bombadil.infradead.org>
 <4f9a610d-e856-60f6-4467-09e9c3836771@arm.com>
 <20190530133954.GA2024@bombadil.infradead.org>
 <f1995445-d5ab-f292-d26c-809581002184@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1995445-d5ab-f292-d26c-809581002184@arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Russell King <linux@armlinux.org.uk>, Fenghua Yu <fenghua.yu@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2019 at 02:17:43PM +0530, Anshuman Khandual wrote:
> On 05/30/2019 07:09 PM, Matthew Wilcox wrote:
> > On Thu, May 30, 2019 at 05:31:15PM +0530, Anshuman Khandual wrote:
> >> On 05/30/2019 04:36 PM, Matthew Wilcox wrote:
> >>> The two handle preemption differently.  Why is x86 wrong and this one
> >>> correct?
> >>
> >> Here it expects context to be already non-preemptible where as the proposed
> >> generic function makes it non-preemptible with a preempt_[disable|enable]()
> >> pair for the required code section, irrespective of it's present state. Is
> >> not this better ?
> > 
> > git log -p arch/x86/mm/fault.c
> > 
> > search for 'kprobes'.
> > 
> > tell me what you think.
> 
> Are you referring to these following commits
> 
> a980c0ef9f6d ("x86/kprobes: Refactor kprobes_fault() like kprobe_exceptions_notify()")
> b506a9d08bae ("x86: code clarification patch to Kprobes arch code")
> 
> In particular the later one (b506a9d08bae). It explains how the invoking context
> in itself should be non-preemptible for the kprobes processing context irrespective
> of whether kprobe_running() or perhaps smp_processor_id() is safe or not. Hence it
> does not make much sense to continue when original invoking context is preemptible.
> Instead just bail out earlier. This seems to be making more sense than preempt
> disable-enable pair. If there are no concerns about this change from other platforms,
> I will change the preemption behavior in proposed generic function next time around.

Exactly.

So, any of the arch maintainers know of a reason they behave differently
from x86 in this regard?  Or can Anshuman use the x86 implementation
for all the architectures supporting kprobes?
