Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0C1AD3AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 02:36:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493HG94xZczDsgr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 10:36:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493HDB2sLqzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 10:34:47 +1000 (AEST)
Date: Thu, 16 Apr 2020 20:34:42 -0400
From: Rich Felker <dalias@libc.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200417003442.GD11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <87k12gf32r.fsf@mid.deneb.enyo.de>
 <20200416153509.GT11469@brightrain.aerifal.cx>
 <87sgh3e613.fsf@mid.deneb.enyo.de>
 <20200416165257.GY11469@brightrain.aerifal.cx>
 <87ftd3e1vg.fsf@mid.deneb.enyo.de>
 <20200416230235.GG26902@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416230235.GG26902@gate.crashing.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, Florian Weimer <fw@deneb.enyo.de>,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 06:02:35PM -0500, Segher Boessenkool wrote:
> On Thu, Apr 16, 2020 at 08:12:19PM +0200, Florian Weimer wrote:
> > > I think my choice would be just making the inline syscall be a single
> > > call insn to an asm source file that out-of-lines the loading of TOC
> > > pointer and call through it or branch based on hwcap so that it's not
> > > repeated all over the place.
> > 
> > I don't know how problematic control flow out of an inline asm is on
> > POWER.  But this is basically the -moutline-atomics approach.
> 
> Control flow out of inline asm (other than with "asm goto") is not
> allowed at all, just like on any other target (and will not work in
> practice, either -- just like on any other target).  But the suggestion
> was to use actual assembler code, not inline asm?

Calling it control flow out of inline asm is something of a misnomer.
The enclosing state is not discarded or altered; the asm statement
exits normally, reaching the next instruction in the enclosing
block/function as soon as the call from the asm statement returns,
with all register/clobber constraints satisfied.

Control flow out of inline asm would be more like longjmp, and it can
be valid -- for instance, you can implement coroutines this way
(assuming you switch stack correctly) or do longjmp this way (jumping
to the location saved by setjmp). But it's not what'd be happening
here.

Rich
