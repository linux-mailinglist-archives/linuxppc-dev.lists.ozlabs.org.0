Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7171376CD4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 00:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcQ6d5THRz308F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 08:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YTiVJ92s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=YTiVJ92s; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcQ634NXRz2yRG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 08:26:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TMAOrchJ574+p8mABfnmoQIls2NAAdgSZt4ZC3wBlL0=; b=YTiVJ92sMwItWvIlOZ+WzVy4kh
 wzcU30Dwuc0iywK61axkEIgcBmlE54da330UTreFCiR/Na7qmf0BwMdeojxK7POELZl91L2LnHZ57
 P86fno0hRZOviYRzjLN1h/xQb/EEaYo7hwYQ8tvq+DF6PsRuScoiQ8x9MFb+lm14r7cxeSv9GxMC1
 UfvCbDuXwc6xPs/Zxj4gEW0cvzxPa/3zBJvSxLKklRMfhsEyupuytJ9T6QNEQl+uyqNbsF1qsD0+V
 CmqblHCNITjGy9cOxLgg9fZHg+tUCe+/bHxaNeUNdWVnWAYMVdlspQJiH9UZK47x5aMI7TPm5W/Y8
 xdfD+PKg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lf8vP-008Ba4-EE; Fri, 07 May 2021 22:26:23 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id ED2E330022C;
 Sat,  8 May 2021 00:26:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D7CA429D3FE81; Sat,  8 May 2021 00:26:21 +0200 (CEST)
Date: Sat, 8 May 2021 00:26:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Christopher M. Riedl" <cmr@linux.ibm.com>
Subject: Re: [RESEND PATCH v4 10/11] powerpc: Protect patching_mm with a lock
Message-ID: <YJW+jZT7Us8g2fmj@hirez.programming.kicks-ass.net>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-11-cmr@linux.ibm.com>
 <YJPKNSNVf34a39qC@hirez.programming.kicks-ass.net>
 <CB7A6IWZTDUL.17HEAW6KQEYCD@oc8246131445.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB7A6IWZTDUL.17HEAW6KQEYCD@oc8246131445.ibm.com>
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
Cc: tglx@linutronix.de, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hardening@vger.kernel.org, keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 07, 2021 at 03:03:51PM -0500, Christopher M. Riedl wrote:
> On Thu May 6, 2021 at 5:51 AM CDT, Peter Zijlstra wrote:
> > On Wed, May 05, 2021 at 11:34:51PM -0500, Christopher M. Riedl wrote:
> > > Powerpc allows for multiple CPUs to patch concurrently. When patching
> > > with STRICT_KERNEL_RWX a single patching_mm is allocated for use by all
> > > CPUs for the few times that patching occurs. Use a spinlock to protect
> > > the patching_mm from concurrent use.
> > > 
> > > Modify patch_instruction() to acquire the lock, perform the patch op,
> > > and then release the lock.
> > > 
> > > Also introduce {lock,unlock}_patching() along with
> > > patch_instruction_unlocked() to avoid per-iteration lock overhead when
> > > patch_instruction() is called in a loop. A follow-up patch converts some
> > > uses of patch_instruction() to use patch_instruction_unlocked() instead.
> >
> > x86 uses text_mutex for all this, why not do the same?
> 
> I wasn't entirely sure if there is a problem with potentially going to
> sleep in some of the places where patch_instruction() is called - the
> spinlock avoids that (hypothetical) problem.

So I'm not saying you like have to do this; but I did wonder if there's
a reason not to, and given you didn't mention it, I had to ask.

> I just tried switching to text_mutex and at least on a P9 machine the
> series boots w/ the Hash and Radix MMUs (with some lockdep errors). I
> can rework this in the next version to use text_mutex if I don't find
> any new problems with more extensive testing. It does mean more changes
> to use patch_instruction_unlocked() in kprobe/optprobe/ftace in
> arch/powerpc since iirc those are called with text_mutex already held.

The x86 text_poke() has a lockdep_assert_held(&text_mutex) in to make
sure nobody 'forgets' :-)
