Return-Path: <linuxppc-dev+bounces-13878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8181C3AE88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 13:36:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2MB6369cz2xS2;
	Thu,  6 Nov 2025 23:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762432574;
	cv=none; b=YtLZyn45kU2z5vmUP0xC9cdDLK191cY09iFIBErht13/JA9B7ENFgQDBq6/rH5gi3GOkcoiFqhfxnznSSu5johfeK+cPmXATDtPBI0FwACCuH60+GRdKMRId0IK+2ATr2cU6rAdiZpinPNUaVG0kQApKFeYs7/eZGGkM/5TvZm/eQK2WxRkbp8ZeY8w7bCkt2GI2eZ+mZFghAdZ8wna9xZ0ZsUaRqfYTGW9JmU7apWo1NeSXXuwNg5hPevTu6EKZIN9z5iZocKAsB5JUDc2wxbH7/iCrulleqeCe/FUotUtz5QJXEzBVN/STowz28v5vmSmYNMFpMgT7mLbIs/6N0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762432574; c=relaxed/relaxed;
	bh=P2+mwakpkR3t3QcCj/dC68/r4KbhQXtZfj7SVCBR+W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTLsMZbzkjorGuK3i+a5Lygw11EHpahTVUXz4Oy2IWDRcjIcSg/AFxkTXXIL9JLSeBSBSQDq342uFb1Gm+k+x0GdAV69FHpz+mw1RYmvHdueYVHIkq4vyRzrvxWu6aRRVNQlNR859j2tEf1sTkRL9oKNUbXPrekoYrjHpZleGcH1Nz61zyBPviyp5Y9Lehk6dkqsKaGZ7HOagCT5ICCkd9OV9xWxc4x4MobbkIvjKJqoNjGvF4RhzDyd+pbyVxxd6iqAs5ZfJWpv28kbL1cBgFTaC1Gx/113uCf/SBOj+uvXCJj4HIf3YckW2VHQzGjllu9QrGlB8TvUf1ZaB6x7hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2M9y57MDz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 23:36:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P2+mwakpkR3t3QcCj/dC68/r4KbhQXtZfj7SVCBR+W0=; b=WvH0SWXrZ7oUYfvCr1Xw3Jf9RO
	owX4C7Y67ZD+vIWCz0sM5vppn6YgKdTqsYkDmKlnJXoBApckZ8YEDkYzB54yTO5/J9+md1lF0Zdtv
	/GoMMIhsUhRXO+hvYEaKuwHt/wZ1G30YIbRzrxxqHVqRO1/+LndvF0pW0PH/rxQhgiSn/kqv/E9+y
	fW0SfBcoA/t9vBNhR3M3RxhxGimxKWmU0zVSVIQnGMUcBORsSmcq3cE8PjM/nnTkMWi1WxhXcArLN
	PqJT/yxoScCodUlU6M7uMxu0pzlpacwgJz2U+TFRJnhIXeKP2a70OUlez9x2y3rOZgE0YK/MHDulA
	eaQHasGg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGyLl-00000004GSz-45lA;
	Thu, 06 Nov 2025 11:40:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 71E85300230; Thu, 06 Nov 2025 13:35:50 +0100 (CET)
Date: Thu, 6 Nov 2025 13:35:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Andre Almeida <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 10/10] powerpc/uaccess: Implement masked user access
Message-ID: <20251106123550.GX4067720@noisy.programming.kicks-ass.net>
References: <cover.1762427933.git.christophe.leroy@csgroup.eu>
 <5c80dddf8c7b1e75f08b3f42bddde891d6ea3f64.1762427933.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c80dddf8c7b1e75f08b3f42bddde891d6ea3f64.1762427933.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 12:31:28PM +0100, Christophe Leroy wrote:

> On 32 bits it is more tricky. In theory user space can go up to
> 0xbfffffff while kernel will usually start at 0xc0000000. So a gap
> needs to be added in-between. Allthough in theory a single 4k page
> would suffice, it is easier and more efficient to enforce a 128k gap
> below kernel, as it simplifies the masking.

Do we have the requirement that the first access of a masked pointer is
within 4k of the initial address?

Suppose the pointer is to an 16k array, and the memcpy happens to like
going backwards. Then a 4k hole just won't do.



