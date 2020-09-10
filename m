Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02A2648B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 17:28:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnN7X3qVFzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 01:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BnN3h6ckWzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 01:24:48 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 08AFKVl2000394;
 Thu, 10 Sep 2020 10:20:31 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 08AFKUG8000392;
 Thu, 10 Sep 2020 10:20:30 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 10 Sep 2020 10:20:30 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: remove the last set_fs() in common code,
 and remove it for x86 and powerpc v3
Message-ID: <20200910152030.GJ28786@gate.crashing.org>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142803.GM1236603@ZenIV.linux.org.uk>
 <CAHk-=wgQNyeHxXfckd1WtiYnoDZP1Y_kD-tJKqWSksRoDZT=Aw@mail.gmail.com>
 <20200909184001.GB28786@gate.crashing.org>
 <CAHk-=whu19Du_rZ-zBtGsXAB-Qo7NtoJjQjd-Sa9OB5u1Cq_Zw@mail.gmail.com>
 <3beb8b019e4a4f7b81fdb1bc68bd1e2d@AcuMS.aculab.com>
 <186a62fc-042c-d6ab-e7dc-e61b18945498@csgroup.eu>
 <59a64e9a210847b59f70f9bd2d02b5c3@AcuMS.aculab.com>
 <5050b43687c84515a49b345174a98822@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5050b43687c84515a49b345174a98822@AcuMS.aculab.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 12:26:53PM +0000, David Laight wrote:
> Actually this is pretty sound:
> 	__label__ label;
> 	register int eax asm ("eax");
> 	// Ensure eax can't be reloaded from anywhere
> 	// In particular it can't be reloaded after the asm goto line
> 	asm volatile ("" : "=r" (eax));

This asm is fine.  It says it writes the "eax" variable, which lives in
the eax register *in that asm* (so *not* guaranteed after it!).

> 	// Provided gcc doesn't save eax here...
> 	asm volatile goto ("xxxxx" ::: "eax" : label);

So this is incorrect.

> 	// ... and reload the saved value here.
> 	// The input value here will be that modified by the 'asm goto'.
> 	// Since this modifies eax it can't be moved before the 'asm goto'.
> 	asm volatile ("" : "+r" (eax));
> 	// So here eax must contain the value set by the "xxxxx" instructions.

No, the register eax will contain the value of the eax variable.  In the
asm; it might well be there before or after the asm as well, but none of
that is guaranteed.


Segher
