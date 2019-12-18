Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE131244C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 11:37:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dBK340QQzDqjk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 21:37:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="RnuZHUl2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dBGj5TBmzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 21:35:09 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3894C218AC;
 Wed, 18 Dec 2019 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576665307;
 bh=InLIC5wnYFQUlY2vdlncOvZyGEgx+3dlq1B0ax8mV58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RnuZHUl2OrLt+yKpn9nIh3wwmEddSGzlKWqc1qQQRkfnROQSVfzbRKViVL2j3ia2e
 3PWMNQ9sUJRemWmeprajZ1lMxEG+g9HWBeQFK3a7Krhk2Y7n7x+Zdqkq076B94RUZj
 QtwM5QK1MpfXpULva2PsYj9ZGb2qxVvKeqm1w3Ek=
Date: Wed, 18 Dec 2019 10:35:01 +0000
From: Will Deacon <will@kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191218103501.GA15021@willie-the-truck>
References: <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
 <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
 <fb4bba85-1f83-435e-b84e-ee29770d7090@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb4bba85-1f83-435e-b84e-ee29770d7090@de.ibm.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 11:22:05AM +0100, Christian Borntraeger wrote:
> On 12.12.19 21:49, Linus Torvalds wrote:
> > On Thu, Dec 12, 2019 at 11:34 AM Will Deacon <will@kernel.org> wrote:
> >>
> >> The root of my concern in all of this, and what started me looking at it in
> >> the first place, is the interaction with 'typeof()'. Inheriting 'volatile'
> >> for a pointer means that local variables in macros declared using typeof()
> >> suddenly start generating *hideous* code, particularly when pointless stack
> >> spills get stackprotector all excited.
> > 
> > Yeah, removing volatile can be a bit annoying.
> > 
> > For the particular case of the bitops, though, it's not an issue.
> > Since you know the type there, you can just cast it.
> > 
> > And if we had the rule that READ_ONCE() was an arithmetic type, you could do
> > 
> >     typeof(0+(*p)) __var;
> > 
> > since you might as well get the integer promotion anyway (on the
> > non-volatile result).
> > 
> > But that doesn't work with structures or unions, of course.
> 
> We do have a READ_ONCE on the following union in s390 code.
> 
> union ipte_control {
>         unsigned long val;
>         struct {
>                 unsigned long k  : 1;
>                 unsigned long kh : 31;
>                 unsigned long kg : 32;
>         }; 
> };
> 
> 
> In fact this one was the original failure case why we change ACCESS_ONCE.
> 
> see arch/s390/kvm/gaccess.c

Thanks. I think we should be ok just using the 'val' field instead of the
whole union but, then again, when bitfields are involved who knows what the
compiler might do. I thought we usually shied away from using them to mirror
hardware structures like this?

Will
