Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C664EA138
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:15:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS3pm30l9z3c0T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 07:15:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=h9J6gWtL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=h9J6gWtL; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS3p53lCnz3c00
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 07:14:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZitBryn1WWy4JC7Ax6HzXQemEGIW1dW2lNZC6FYpefM=; b=h9J6gWtLbizs6hZuyeiUFCZt9S
 M7+uGk9gFt1AUqZ+rZr6C50cqtp71mwK1jLFnu/x/ZSRFilHkJ9F8Q+K2fTa0/wThEgGwa2zizyOn
 n5uih2fP9/k0FZqcH3T1E/cQUMYidFqRAuaY/pfcwn8UMc544S7ODH108we8ti0HhGXm/nfkwnCnY
 vZ5n9HPQV4tgSe4jTE6eC54JwuakFMJ6kNpDNJERz4/xAZhdrjmjEnxXTVEncoGCamVAjCgIf2cuc
 tKHPR11SOnEK20xSqAsguvwtFqo9cvS9H5DqX7HdYDND/RgjFER3lVwGshCYP/GU64CKlhz9WrOyR
 ocVsy/Gw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYvlC-00HENY-2D; Mon, 28 Mar 2022 20:14:42 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0997B3000E6;
 Mon, 28 Mar 2022 22:14:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CEBCE203E586A; Mon, 28 Mar 2022 22:14:38 +0200 (CEST)
Date: Mon, 28 Mar 2022 22:14:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Message-ID: <YkIXLnAxtPuSDcOW@hirez.programming.kicks-ass.net>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328195920.dqlfra3lcardko6r@treble>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 12:59:20PM -0700, Josh Poimboeuf wrote:

> I'm not making any major changes to the code, just shuffling things
> around to make the interface more modular.  I hope to have something
> soon (this week).  Peter recently added a big feature (Intel IBT) which
> is already in -next.

Hit Linus' tree yesterday :-)

> Some years ago Kamalesh Babulal had a prototype of objtool for ppc64le
> which did the full stack validation.  I'm not sure what ever became of
> that.

I've also heard chatter about s390.

> FWIW, there have been some objtool patches for arm64 stack validation,
> but the arm64 maintainers have been hesitant to get on board with
> objtool, as it brings a certain maintenance burden.  Especially for the
> full stack validation and ORC unwinder.  But if you only want inline
> static calls and/or mcount then it'd probably be much easier to
> maintain.

IIRC the major stumbling block for arm64 is the whole jump-table thing.
Either they need to rely on compiler plugins to provide objtool that
data (yuck, since we support at least 2 different compilers), disable
jump-tables (yuck, for that limits code-gen just to please a tool) or
use DWARF (yuck, because build times).

There was a little talk about an impromptu 'abi' to communicate
jump-table details to objtool without going full on DWARF, but that
seems to have hit a dead end again.
