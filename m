Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8926C00B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 11:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrvHl1YSdzDqRF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 19:02:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrvFg11w6zDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 19:00:39 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40B73ADBD;
 Wed, 16 Sep 2020 09:00:50 +0000 (UTC)
Date: Wed, 16 Sep 2020 11:00:32 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: peterz@infradead.org
Subject: Re: [PATCH] Revert "powerpc/64s: machine check interrupt update NMI
 accounting"
Message-ID: <20200916090032.GO29778@kitsune.suse.cz>
References: <20200915084302.GG29778@kitsune.suse.cz>
 <20200915180659.12503-1-msuchanek@suse.de>
 <20200915181642.GF2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915181642.GF2674@hirez.programming.kicks-ass.net>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Alistair Popple <alistair@popple.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 15, 2020 at 08:16:42PM +0200, peterz@infradead.org wrote:
> On Tue, Sep 15, 2020 at 08:06:59PM +0200, Michal Suchanek wrote:
> > This reverts commit 116ac378bb3ff844df333e7609e7604651a0db9d.
> > 
> > This commit causes the kernel to oops and reboot when injecting a SLB
> > multihit which causes a MCE.
> > 
> > Before this commit a SLB multihit was corrected by the kernel and the
> > system continued to operate normally.
> > 
> > cc: stable@vger.kernel.org
> > Fixes: 116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> 
> Ever since 69ea03b56ed2 ("hardirq/nmi: Allow nested nmi_enter()")
> nmi_enter() supports nesting natively.

And this patch was merged in parallel with this native nesting support
and conflicted with it - hence the explicit nesting in the hunk that did
not conflict.

Either way the bug is present on kernels both with and without
69ea03b56ed2. So besides the conflict 69ea03b56ed2 does not affect this
problem.

Thanks

Michal
