Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAF83162
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 14:33:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462vFT6VCkzDqyS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 22:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462vC738lHzDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 22:31:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 462vC71Kb7z8tT3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 22:31:47 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 462vC66wqpz9sN1; Tue,  6 Aug 2019 22:31:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.15; helo=mta-05-3.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 462vC60kTSz9sMr
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Aug 2019 22:31:44 +1000 (AEST)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id CB00260055;
 Tue,  6 Aug 2019 08:31:40 -0400 (EDT)
Received: from APP-02 (unknown [10.20.147.152])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id A7A696004E;
 Tue,  6 Aug 2019 12:31:40 +0000 (UTC)
Date: Tue, 6 Aug 2019 07:31:40 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Message-ID: <1634129787.146655.1565094700660@privateemail.com>
In-Reply-To: <87r25yv6cc.fsf@concordia.ellerman.id.au>
References: <20190802042233.20835-1-cmr@informatik.wtf>
 <20190802042233.20835-4-cmr@informatik.wtf>
 <877e7vlruk.fsf@concordia.ellerman.id.au>
 <850780620.61430.1564758724962@privateemail.com>
 <87r25yv6cc.fsf@concordia.ellerman.id.au>
Subject: Re: [PATCH v2 3/3] powerpc/spinlocks: Fix oops in shared-processor
 spinlocks
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: ajd@linux.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On August 6, 2019 at 7:14 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
> 
> Christopher M Riedl <cmr@informatik.wtf> writes:
> >> On August 2, 2019 at 6:38 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> "Christopher M. Riedl" <cmr@informatik.wtf> writes:
> >> 
> >> This leaves us with a double test of is_shared_processor() doesn't it?
> >
> > Yep, and that's no good. Hmm, executing the barrier() in the non-shared-processor
> > case probably hurts performance here?
> 
> It's only a "compiler barrier", so it shouldn't generate any code.
> 
> But it does have the effect of telling the compiler it can't optimise
> across that barrier, which can be important.
> 
> In those spin loops all we're doing is checking lock->slock which is
> already marked volatile in the definition of arch_spinlock_t, so the
> extra barrier shouldn't really make any difference.
> 
> But still the current code doesn't have a barrier() there, so we should
> make sure we don't introduce one as part of this refactor.

Thank you for taking the time to explain this. I have some more reading to
do about compiler-barriers it seems :)

> 
> So I think you just want to change the call to spin_yield() above to
> splpar_spin_yield(), which avoids the double check, and also avoids the
> barrier() in the SPLPAR=n case.
> 
> And then arch_spin_relax() calls spin_yield() etc.

I submitted a v3 before your reply with this change already - figured this
is the best way to avoid the double check and maintain legacy behavior.

> 
> cheers
