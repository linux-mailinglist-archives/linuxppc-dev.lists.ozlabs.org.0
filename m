Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49276745E39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:11:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NYx3tbzk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvnsm1Sx7z3bWy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 00:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NYx3tbzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvnrr2hprz3bPG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 00:10:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NHgmW4jYFfefymgeKSK963KNOIaZu3e0HaLSnjpA4qM=; b=NYx3tbzkHNtzymbdVxK26tzRKE
	y0U7bussB88S4hawbqgi2OXu/Ixc+msp825EhkTymOzlJky3Gk/RlnBAehXzBvS1sq955fAUKa/v2
	QQBlUMEJ/QRVaeHZAtkbH8ySND/v6mkmXm5uQ4FF10C11cZe2Sntk1huT1PSd8iZgXW0UKui5Q3hN
	JtrAvZIp0VCWHgN068CLdTXLcDz2LG7D7aXqVSieR9/PQ1X06rFtnKlBi46GPzz3iI6rv7f+giIk5
	+Y+GTc0g+aOregoiGO/nItUYI4TiikK0ofkhQUtESUDqXpgz8RK+yOtDEDZEKulMxxnY3PExB5JTN
	7z9m/yyg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qGKFT-008Ifc-M6; Mon, 03 Jul 2023 14:09:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7282730005E;
	Mon,  3 Jul 2023 16:09:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 59B5E2028FBD3; Mon,  3 Jul 2023 16:09:50 +0200 (CEST)
Date: Mon, 3 Jul 2023 16:09:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v2 0/2] send tlb_remove_table_smp_sync IPI only to
 necessary CPUs
Message-ID: <20230703140950.GL4253@hirez.programming.kicks-ass.net>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230621074337.GF2046280@hirez.programming.kicks-ass.net>
 <ZJRC2s4sIuJ9V3A0@tpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJRC2s4sIuJ9V3A0@tpad>
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
Cc: geert+renesas@glider.be, david@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, paulmck@kernel.org, x86@kernel.org, linux@armlinux.org.uk, ppandit@redhat.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 09:47:22AM -0300, Marcelo Tosatti wrote:

> > there's patches that cure the thp abuse of this.
> 
> The other case where the IPI can happen is:
> 
> CPU-0                                   CPU-1
> 
> tlb_remove_table
> tlb_remove_table_sync_one
> IPI
>                                         local_irq_disable
>                                         gup_fast
>                                         local_irq_enable
> 
> 
> So its not only the THP case.

(your CPU-1 thing is wholly irrelevant)

Well, I know, but this case *should* be exceedingly rare. Last time
around I asked why you all were tripping this, you pointed at the THP
case.

The THP case should be fixed along the lines of Jann's original patches.

If you can trip this at any significant rate, then we should probably
look at a better allocation scheme. It means you're really low on
memory.
