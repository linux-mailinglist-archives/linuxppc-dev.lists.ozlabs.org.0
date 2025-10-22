Return-Path: <linuxppc-dev+bounces-13168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED5BFC7B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 16:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csBHp20BSz30Vl;
	Thu, 23 Oct 2025 01:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761143062;
	cv=none; b=Zu7n+IMQr9IYQsK04AGdPf+Qyec01Jlza6JnwWsl4ZUawoS3jEzct0oHejh5wANc3dKE0x8JkyvIjMQfbo3uQGkKyASl6Cb4VXvXdYSXqSaaCeu4ZBUARWvMrk+QIe16wrY7NJTjZVYG23xxji55nABNK5yztwPr347xMn6TTxATwpuryZ+fgrxsVHEG3vA9Ovup9yWU+TVaOsWr/3PESYYzzWod6ZyR2XuG5YpTaTcBGK6fZZy0fOogXcRpkBtN1hlKNUsc4HMqQ++DnLJQvKVsZNv/MtH2EE0o7se/6HnG6M4PVCe+JKMoDDhvSmJYk1CJG0xa/vxcJcLOeBa2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761143062; c=relaxed/relaxed;
	bh=dctXkstECTenaZhiUiTAEPs/+u3lBJ+4oLit/DWtNCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1Iv3/mZyZHdvgGg1cIL2ij0+ELOo4tb4tZd6KMwXJkt2apx2rAqCM2zWcsblm5aLBf4CEJ9Gl2T9UOFo5g7hTqB+4mZAsF5rzQ0L1fMioPX07ni6o2HJDXzRWil4cylWxhUAU1KSQ9c5VrhEcWWp9yS7sPJXBWXtPV8K8tFv6q7MzD0AsHk6sRZ9XkcOQhzjS43r8fFWCsQZNlMR3HvdBpp0r/BYm1XltfFs486mFjniZF6T3TJm8DRkFNWnZaJtBurjRhf6mw/Qh/crwSWdjKolu4hb2ENrCMKdeWPloI/jPeYRt2XB/QsT7NVL1AMickWQGY5wNqjsFdueiyShw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=W+uMC0i8; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=W+uMC0i8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csBHl2X2qz2xxS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 01:24:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dctXkstECTenaZhiUiTAEPs/+u3lBJ+4oLit/DWtNCs=; b=W+uMC0i8lkaiKuhkl8eUM+csMP
	zH9Alfil/ggkWS+mff98nPo9bDIMkuW8K5C5+KY2e8934/ExnLSA4XSDvs16qF9TmynNu52oe7tVO
	alhtY8gr8526Ul/GMwiNjT57GxRn6C1/yPzHIibpvNmoPRJeplLP1368i919MkX3vMD0TfWO58XqB
	EaUXdGG6nfjfQNZR1hVFszBgQD2CFgdZfn+DgZnjBkiVlcKh5kkIe9C65p09XP2z5JubaB3DW+xwx
	QnSnO4coWaBJMspnjlZNpjlij/u6mnQPePfu4Nb2uYSAp9cc5ZSqjPHhLdI24izWy1wkOQRbI8Bdl
	/7A8lvtg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZkt-00000007mfm-1HRN;
	Wed, 22 Oct 2025 14:24:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 542B830039F; Wed, 22 Oct 2025 16:23:59 +0200 (CEST)
Date: Wed, 22 Oct 2025 16:23:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251022142359.GQ4067720@noisy.programming.kicks-ass.net>
References: <20251022102427.400699796@linutronix.de>
 <20251022103112.294959046@linutronix.de>
 <20251022152006.4d461c8b@pumpkin>
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
In-Reply-To: <20251022152006.4d461c8b@pumpkin>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025 at 03:20:06PM +0100, David Laight wrote:

> I think that 'feature' should be marked as a 'bug', consider code like:
> 	for (; len >= sizeof (*uaddr); uaddr++; len -= sizeof (*uaddr)) {
> 		scoped_user_read_access(uaddr, Efault) {
> 			int frag_len;
> 			unsafe_get_user(frag_len, &uaddr->len, Efault);
> 			if (!frag_len)
> 				break;
> 			...
> 		}
> 		...
> 	}
> 

All the scoped_* () things are for loops. break is a valid way to
terminate them. 

