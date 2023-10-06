Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A32667BB009
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 03:20:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BC0oYb8a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1rFq3qnFz3bd6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 12:20:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BC0oYb8a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1rDv4hz7z3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 12:19:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+AiG5RcuIRXjXQBaPipww/shhwqPCseS7Zrsx9WocQ0=; b=BC0oYb8aTYOJBZjE50dd8NPPc7
	/73Cl4ZQ6jjJ90vlAM/EoJxzOd5H/w65Jl40qapwuCR4+7/CbkOci6f1rVTuM95HLFwef0uky/c0+
	TqDERrDka6zstklGFvad7asco2exJ0GDEqADstiBXwuKDeYpkc3b7KBBMGwoZcr0Nryib+rDoYbOw
	5QNF2BuRFcLhOqrspD4pB3oeCChYLLOlZXtGanexFxob6KrLb5WOyZck3ba9KYyauokJmgjcw59qE
	3T0nQGcdq19KhbJd+n5sX6HQYaySrZVymsSwsHO/i1UsiwQn2laYEA51/0V7wGYqXV0xWYwyVINtg
	unnCg4lw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qoZUn-00CWqH-Bv; Fri, 06 Oct 2023 01:19:13 +0000
Date: Fri, 6 Oct 2023 02:19:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG: Unable
 to handle kernel data access at 0xfeffbb62ffec65fe)
Message-ID: <ZR9gkZKafUSNOAEf@casper.infradead.org>
References: <20230929132750.3cd98452@yea>
 <ZR9esG8H17LY2KOX@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR9esG8H17LY2KOX@debian.me>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Linux Regressions <regressions@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 06, 2023 at 08:11:12AM +0700, Bagas Sanjaya wrote:
> Matthew Wilcox, did you miss this regression report? You should look into it
> since it is (apparently) cause by a commit of yours.

No, I didn't miss it.  I'm simply choosing to work on other things.
All this regression tracking nonsense and being told to work on things
by people who've appointed themselves my manager has completely sapped
my motivation to work on bugs.  If you want me to work on things, *don't*
harass me.

