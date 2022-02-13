Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CB4B394A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 05:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxDRR2cFDz3c9t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 15:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uPISaPZ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=uPISaPZ7; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxDQf2zmBz30Ml
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 15:09:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=h9lgENlLH+E/IJinaeOP1R7M6s/XOyGy5yYBeg0uvqY=; b=uPISaPZ7NAppRwSbiaADv/BNro
 v+g5aXjZoUIzbeS68b6zBoMjLRFFI9GYaUH290Pscue04bqDB8K9ppiB2pIqclLYq/IIX2LZNaCYT
 6718HT1Cv0ujzzrEhL2Jz4/YV/wdaER713UmY4KGY7KzG7ecUnK0qOXa4NA5ycSiiYtbyW4F/KKsD
 3fcu3zxxxvmqUBrx9MMqt1q3Mb2NS0w4+3aXK9C3l8eZr9Fpw4wE9zA4w694SkUFvenPGag3z6jis
 jHYpVc2Eo54+xnMlgVzCtVaZCqJiJnNxE2eynAN1VY2hgWRHkBi6dpEhlIphmLIkAughbtTIQhMZC
 bbzEka5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJ6CW-00Blhs-Gg; Sun, 13 Feb 2022 04:09:28 +0000
Date: Sun, 13 Feb 2022 04:09:28 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
Message-ID: <YgiEeHzz4JZFszJD@casper.infradead.org>
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
 <CAABZP2ycCjiZ0CySc2Lgr_DnUfuDf1iagEKnWwNEkVkR9-gADA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2ycCjiZ0CySc2Lgr_DnUfuDf1iagEKnWwNEkVkR9-gADA@mail.gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 13, 2022 at 11:19:09AM +0800, Zhouyi Zhou wrote:
> I think the key to the problem lies in your attached console.log
> (pasted below), at times 0.014987 and 0.015995, I see there are two
> locks (cpu_hotplug_lock and jump_label_mutex)  holded while
> kmem_cache_alloc calls __might_resched (0.023356).

Those are both sleeping locks (a percpu_rwsem and mutex, respectively).
There is no problem with sleeping while holding a mutex or rwsem.
