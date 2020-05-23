Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA51DF97A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 19:28:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Tr142nbqzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 03:28:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Tqxr69gZzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 03:25:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CVNRhNLnfmlc2qa/qQiHI89PDUvBGY/AKeK4xvPMuyA=; b=UCHXLaK1YXp36y/WDD9cfsgfbN
 q54HO+/Y1Gem3JnXF8A7Qw33ZANMQEd4bL344Y8D2kBovzFVSHBVrajRPNX1KprdiEPCXgjvMujSH
 +E4gYyfQ1olJkeMcGn1BCieZSHDIGpcBU02O+4+VWWiKGGdGQHhQifrU4wb4PR3Rp4KevpLdNl4/b
 q4tpWZBFoEtKcjmRvPyBjQXe0C292c7A6fBUDivplEOpxv5wr464i6p5pepBW8XFCjTeDUx7BoiJ0
 qDBwA+/cZrAFMOVCIE8YsMVccyXo2Vr0MeMI2zR76BC1CtRI7Z8J0t2Ba+9HltIw5oNOgC4VbsCsx
 QwNAlymw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jcXtf-0000Up-7w; Sat, 23 May 2020 17:25:19 +0000
Date: Sat, 23 May 2020 10:25:19 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [linux-next RFC] mm/gup.c: Convert to use
 get_user_pages_fast_only()
Message-ID: <20200523172519.GA17206@bombadil.infradead.org>
References: <1590252072-2793-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590252072-2793-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: mark.rutland@arm.com, sfr@canb.auug.org.au, kvm@vger.kernel.org,
 pbonzini@redhat.com, linux-mm@kvack.org, peterz@infradead.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, acme@kernel.org,
 rppt@linux.ibm.com, alexander.shishkin@linux.intel.com, mingo@redhat.com,
 aneesh.kumar@linux.ibm.com, John Hubbard <jhubbard@nvidia.com>,
 namhyung@kernel.org, akpm@linux-foundation.org, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 23, 2020 at 10:11:12PM +0530, Souptick Joarder wrote:
> Renaming the API __get_user_pages_fast() to get_user_pages_
> fast_only() to align with pin_user_pages_fast_only().

Please don't split a function name across lines.  That messes
up people who are grepping for the function name in the changelog.

> As part of this we will get rid of write parameter.
> Instead caller will pass FOLL_WRITE to get_user_pages_fast_only().
> This will not change any existing functionality of the API.
> 
> All the callers are changed to pass FOLL_WRITE.
> 
> Updated the documentation of the API.

Everything you have done here is an improvement, and I'd be happy to
see it go in (after fixing the bug I note below).

But in reading through it, I noticed almost every user ...

> -	if (__get_user_pages_fast(hva, 1, 1, &page) == 1) {
> +	if (get_user_pages_fast_only(hva, 1, FOLL_WRITE, &page) == 1) {

passes '1' as the second parameter.  So do we want to add:

static inline bool get_user_page_fast_only(unsigned long addr,
		unsigned int gup_flags, struct page **pagep)
{
	return get_user_pages_fast_only(addr, 1, gup_flags, pagep) == 1;
}

> @@ -2797,10 +2803,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  	 * FOLL_FAST_ONLY is required in order to match the API description of
>  	 * this routine: no fall back to regular ("slow") GUP.
>  	 */
> -	unsigned int gup_flags = FOLL_GET | FOLL_FAST_ONLY;
> -
> -	if (write)
> -		gup_flags |= FOLL_WRITE;
> +	gup_flags = FOLL_GET | FOLL_FAST_ONLY;

Er ... gup_flags |=, surely?

