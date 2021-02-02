Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDC30D07B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:49:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjkn57TLzDwhR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=NqhZ+rxV; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVMQF02bSzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:04:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=802YQyw4lVaV4w8imGbhpyRRiN1cRZRaz6c+AUsQRWs=; b=NqhZ+rxVp9Yow+TY9AI2amWfAh
 JO+yodkACrvGHvFNxEj/vf3efWCjFGugL4mcteq1H824gd9i5ZlDlIrPW8C3nbAfGuOTpze525HTe
 2xP2W+k+cutQzmlHKYn+anynD+vSanmaYnWGsOsAcw8YJSVWH5TZozhFg2UWFMS8YW0++2p3IQ5Eq
 gcLmL0kBbcttFhP+QBSlrxY3Qnu8tU9accSON4v8hKPXf6bnFbok+V5lEUQ2ZvGoXqkBFbOLEi6xv
 daHIBmL7fak+0wyrIcBNV4VTsrE3kotRk/CWyRWq5I/8320h2+GKvo3JbC3LfcvU3up/oiX+YUqqC
 SyPLOgvA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6tTd-00F5eu-RB; Tue, 02 Feb 2021 11:04:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4BB84301179;
 Tue,  2 Feb 2021 12:04:09 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2F66D2B09FDC9; Tue,  2 Feb 2021 12:04:09 +0100 (CET)
Date: Tue, 2 Feb 2021 12:04:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Message-ID: <YBkxqVrNnWFWmqTo@hirez.programming.kicks-ass.net>
References: <20210131001132.3368247-1-namit@vmware.com>
 <20210131001132.3368247-12-namit@vmware.com>
 <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
 <1612247956.0a1r1yjmm3.astroid@bobo.none>
 <F1C67840-C62F-4583-8593-B621706034F6@vmware.com>
 <YBkb8yKSUKTPJvxk@hirez.programming.kicks-ass.net>
 <9100B8AE-129A-4E13-8F01-7B9C14C98B4C@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9100B8AE-129A-4E13-8F01-7B9C14C98B4C@vmware.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 02, 2021 at 09:54:36AM +0000, Nadav Amit wrote:
> > On Feb 2, 2021, at 1:31 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > On Tue, Feb 02, 2021 at 07:20:55AM +0000, Nadav Amit wrote:
> >> Arm does not define tlb_end_vma, and consequently it flushes the TLB after
> >> each VMA. I suspect it is not intentional.
> > 
> > ARM is one of those that look at the VM_EXEC bit to explicitly flush
> > ITLB IIRC, so it has to.
> 
> Hmm… I don’t think Arm is doing that. At least arm64 does not use the
> default tlb_flush(), and it does not seem to consider VM_EXEC (at least in
> this path):
> 

ARM != ARM64. ARM certainly does, but you're right, I don't think ARM64
does this.


