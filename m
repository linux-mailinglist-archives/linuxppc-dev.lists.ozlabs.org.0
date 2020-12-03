Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDEA2CD1A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 09:47:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmqG32F85zDrMf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 19:47:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=KnUZMR2E; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmqCt6CDyzDrF8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 19:45:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1OEgnGuQFuI6Gn7QkYFIDKg88w72Hop5JzkcqtFY01U=; b=KnUZMR2E0OA212RImg8ZoBoH1N
 fZ6ySlqUg1wR+HXlM4c8Cp66U/6dh/4QnvZU+vB78c5+WlMX+N5BiFhhTRK/TEhm1OnhAXuNPE6wc
 QDN2QO+G5xABTZpTVvsC1W5twZdY1J2bYIpA3UHJD03WwzisN4E+4FPJVx0rIxp8yERdesRdEfiFY
 jlFenRf8dqKXLKdzaE9TPn5S+3MrJbr2Mfe/i5hsXvGnaaE7K5Q8PPB1oKas0GcyHOpxanHe9DFOa
 ijFd9/V+shTG5q/pQr0fMD652yBXv6jrCEDUsUWyL7fmF4i+83NMaxmh7YvIG0Y9IBtO9WjhF/EGX
 +ycKF7MA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkkEO-0000cK-M2; Thu, 03 Dec 2020 08:44:53 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E811E30018A;
 Thu,  3 Dec 2020 09:44:48 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C98D420270BBE; Thu,  3 Dec 2020 09:44:48 +0100 (CET)
Date: Thu, 3 Dec 2020 09:44:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [MOCKUP] x86/mm: Lightweight lazy mm refcounting
Message-ID: <20201203084448.GF2414@hirez.programming.kicks-ass.net>
References: <7c4bcc0a464ca60be1e0aeba805a192be0ee81e5.1606972194.git.luto@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c4bcc0a464ca60be1e0aeba805a192be0ee81e5.1606972194.git.luto@kernel.org>
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
 Rik van Riel <riel@surriel.com>, Will Deacon <will@kernel.org>,
 X86 ML <x86@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 02, 2020 at 09:25:51PM -0800, Andy Lutomirski wrote:

> power: same as ARM, except that the loop may be rather larger since
> the systems are bigger.  But I imagine it's still faster than Nick's
> approach -- a cmpxchg to a remote cacheline should still be faster than
> an IPI shootdown. 

While a single atomic might be cheaper than an IPI, the comparison
doesn't work out nicely. You do the xchg() on every unlazy, while the
IPI would be once per process exit.

So over the life of the process, it might do very many unlazies, adding
up to a total cost far in excess of what the single IPI would've been.


And while I appreciate all the work to get rid of the active_mm
accounting; the worry I have with pushing this all into arch code is
that it will be so very easy to get this subtly wrong.
