Return-Path: <linuxppc-dev+bounces-94-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5095254F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 00:12:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ym89Oi8C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkjDH6zhwz2xGw;
	Thu, 15 Aug 2024 08:12:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ym89Oi8C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wkg812xHzz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 06:38:41 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Wkg7Z0p2Vz9stT;
	Wed, 14 Aug 2024 22:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1723667898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIsWcyNQLZ1L3dpzsMlhD2bWOPEsXI8zeJwnW7xOHks=;
	b=ym89Oi8CetNeVTN7hd+zs+6xPYpNWxIGNqaj7ze7i2/mDT6AOLEHotp1+e3GemmaUr0gIb
	mCKyAZl4YgJ5CDZAEQbibWs5E1M0+WjK1h4wG/Cgx3x5X5qUEZC6VLvf/wb9I6LpJVnE7S
	AcZalEpL6aDYmvQo0o+Z6fBq09Zxzm17Y/Ibk+y1lmPJerw7DojoINZiX0gJmzqJr9YDOI
	+QkWw25mYaoFJ2BRshhCjmy1MinTO+LTjzygvt+tBnx5GF3LKQkjHhceh3B2dEho6O4ryT
	+8i16GX/g/38NWnOPuo7w4CvVisK0SlcuCHxuwL7Dbahw1JCDBOYvz5YcAe3Ng==
Date: Wed, 14 Aug 2024 22:38:13 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, David Gow
 <davidgow@google.com>, kunit-dev@googlegroups.com
Subject: Re: OVERFLOW_KUNIT_TEST fails with BUG: KASAN: stack-out-of-bounds
 in string_nocheck+0x168/0x1c8 (kernel 6.11-rc2, PowerMac G4 DP)
Message-ID: <20240814223813.7b301ad4@yea>
In-Reply-To: <202408121146.1D02EB6E@keescook>
References: <20240809231537.7c9ee7ea@yea>
	<202408121146.1D02EB6E@keescook>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 7dux6gigon1dmwyopgh45ippfihtjaz6
X-MBO-RS-ID: adbad2d7a6ebe8f9592

On Mon, 12 Aug 2024 11:54:11 -0700
Kees Cook <kees@kernel.org> wrote:

> On Fri, Aug 09, 2024 at 11:15:37PM +0200, Erhard Furtner wrote:
> > Greetings!
> > 
> > When KASAN is enabled the Overflow KUnit test fails:
> > 
> > [...]
> >     ok 16 shift_nonsense_test
> >     # overflow_allocation_test: 11 allocation overflow tests finished
> > ==================================================================
> > BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8
> > Read of size 1 at addr c976be40 by task kunit_try_catch/1843
> > 
> > CPU: 0 UID: 0 PID: 1843 Comm: kunit_try_catch Tainted: G                 N 6.11.0-rc2-PMacG4 #1
> > Tainted: [N]=TEST
> > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> > Call Trace:
> > [c992fb80] [c16651c0] dump_stack_lvl+0x80/0xac (unreliable)
> > [c992fba0] [c04e0420] print_report+0xdc/0x504
> > [c992fc00] [c04e01d8] kasan_report+0xf8/0x108
> > [c992fc80] [c16ae4c8] string_nocheck+0x168/0x1c8
> > [c992fcf0] [c16b37a4] string+0xa8/0xbc
> > [c992fd60] [c16b8134] vsnprintf+0x868/0x1750
> > [c992fdf0] [c0b8490c] kvasprintf+0xa4/0x13c
> > [c992fe60] [c0b84c3c] kasprintf+0xb4/0xc8
> > [c992fed0] [c0f4c954] module_remove_driver+0x1f0/0x2fc
> > [c992ff00] [c0f21628] bus_remove_driver+0x1d0/0x240
> > [c992ff30] [bfd0cd40] kunit_put_resource+0x128/0x134 [kunit]
> > [c992ff50] [bfd0a120] kunit_cleanup+0x140/0x144 [kunit]
> > [c992ff90] [bfd10d64] kunit_generic_run_threadfn_adapter+0xf8/0x148 [kunit]
> > [c992ffc0] [c00f57e0] kthread+0x36c/0x37c
> > [c992fff0] [c0028304] start_kernel_thread+0x10/0x14
> > 
> > The buggy address belongs to the physical page:
> > page: refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0x976b
> > flags: 0x0(zone=0)
> > raw: 00000000 00000000 eef2bb10 00000000 00000000 00000000 ffffffff 00000000
> > raw: 00000000
> > page dumped because: kasan: bad access detected
> > 
> > Memory state around the buggy address:
> >  c976bd00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >  c976bd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  
> > >c976be00: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f2 04 f2  
> >                                    ^
> >  c976be80: 00 04 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
> >  c976bf00: 00 00 f1 f1 f1 f1 00 f3 f3 f3 00 00 00 00 00 00
> > ==================================================================
> > Disabling lock debugging due to kernel taint
> >     not ok 17 overflow_allocation_test
> >     # overflow_size_helpers_test: 43 overflow size helper tests finished
> >     ok 18 overflow_size_helpers_test
> >     # overflows_type_test: 378 overflows_type() tests finished
> >     ok 19 overflows_type_test
> >     # same_type_test: 0 __same_type() tests finished
> >     ok 20 same_type_test
> >     # castable_to_type_test: 75 castable_to_type() tests finished
> >     ok 21 castable_to_type_test
> >     ok 22 DEFINE_FLEX_test
> > # overflow: pass:21 fail:1 skip:0 total:22
> > # Totals: pass:21 fail:1 skip:0 total:22
> > not ok 1 overflow
> > 
> > 
> > This is reproducible on my machine and always happens when running the test via 'modprobe -v overflow_kunit'. Without KASAN enabled (but KFENCE) overflow_allocation_test passes.  
> 
> Hmm, this implies some kind of corruption is sneaking in and the kunit
> resource freeing code is exploding. I don't immediately see the problem,
> though.

Not the 1st memory corruption I got on ppc32 (https://lore.kernel.org/all/20240811165230.91DCFA0660@freki.localdomain/) btw., but this does not seem related.

I just did a kernel build with overflow_kunit statically built in to run at boot. This way I don't get the "BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8" on the PowerMac and on qemu. Run directly at boot the overflow_kunit just passes. As soon as I build it as module and modprobe it later, I hit the issue. Strange...

A hint that not the test itself might cause the stack corruption but another process.

Regards,
Erhard

