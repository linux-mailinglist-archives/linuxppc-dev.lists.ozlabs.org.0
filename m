Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748247F9F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 04:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMjbY6hCFz3bmk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 14:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MtCuALaI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMjZp69brz2xth
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 14:19:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=kf/tP0+x+PcG14mcVnYZ+U9SH0RIj9hQSnEdArsxzxY=; b=MtCuALaIeb/dLfa2KTxQ3nYxYH
 Y9BeioyuLk7vFZqvoKiPaCBMIZHldVpK2lDdZkW7oKZuiV4RtT+fXMYMvxqaYZHL5A6XHIazkokN1
 LoxDzngZY6fP1L43ItBwVLJDxggUMPYjISfHrU9fUtzlfP9Wj0Di2G/gVyQabiZG5nDHn/vD4tyGA
 /lUTMmb1Hq18SML0Dv+A7LwSfiAh78sHv+2X4Y9YRFxQzggC5nLcvuh6WoLBBwFaC/EmGN0GaNo8X
 DUPie5mUG+s0d8oeFU4QVSknrOWuJwr3IoJmja6EoxeefrxpjevLinFNSPV7VzLHrS4+DWbvmNkIu
 EAo2JvfQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n1gXg-0076xR-GH; Mon, 27 Dec 2021 03:19:20 +0000
Date: Mon, 27 Dec 2021 03:19:20 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 1/3] mm: vmalloc: Let user to control huge vmalloc
 default behavior
Message-ID: <YckwuA8CWcQpQdGO@casper.infradead.org>
References: <20211226083912.166512-1-wangkefeng.wang@huawei.com>
 <20211226083912.166512-2-wangkefeng.wang@huawei.com>
 <6c4bd989-268e-5899-09a7-ac573bd8b4d9@csgroup.eu>
 <c7037a3a-d0b1-6351-5e31-22be0d8e0e01@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7037a3a-d0b1-6351-5e31-22be0d8e0e01@huawei.com>
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
Cc: "x86@kernel.org" <x86@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 27, 2021 at 09:44:24AM +0800, Kefeng Wang wrote:
> 
> On 2021/12/27 1:36, Christophe Leroy wrote:
> > 
> > Le 26/12/2021 à 09:39, Kefeng Wang a écrit :
> > > Add HUGE_VMALLOC_DEFAULT_ENABLED to let user to choose whether or
> > > not enable huge vmalloc mappings by default, and this could make
> > > more architectures to enable huge vmalloc mappings feature but
> > > don't want to enable it by default.
> > > 
> > > Add hugevmalloc=on/off parameter to enable or disable this feature
> > > at boot time, nohugevmalloc is still supported and equivalent to
> > > hugevmalloc=off.
> > 
> > Is there a real added value to have the user be able to select that ?
> > 
> > If the architecture supports it, is there any good reason to not use it ?
> 
> There are some disadvantages[1],  one of the main concerns is the possible
> 
> memory waste, we have backported this feature to our kernel 5.10, but our
> 
> downstream in our some scenario(especially in embedded), they don't want
> 
> it enabled by default, and others want it, this is why patch1 comes.
> 
> > 
> > Why not just do like PPC and enable it by default ? Why should it be
> > enabled by default on PPC but disabled by default on ARM64 and X86 ?
> 
> The PPC is default enabled, we don't changes this behavior.
> 
> Maybe upstream is not care about this, as I said in cover-letter, if
> arm64/x86
> 
> don't want patch1, we could only just select config to enable it.
> 
> Let's wait for more feedback.

We should not have different defaults by architecture.  Either we change
the default for PPC, or x86 & arm should have the same default as PPC.
