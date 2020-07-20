Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2956227020
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 23:04:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Z42683HzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 07:04:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4B9Z2S3bGHzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 07:03:28 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 06KL2tAD003247;
 Mon, 20 Jul 2020 16:02:55 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 06KL2qPF003246;
 Mon, 20 Jul 2020 16:02:52 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 20 Jul 2020 16:02:52 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
Message-ID: <20200720210252.GO30544@gate.crashing.org>
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sat, Jul 18, 2020 at 09:50:50AM +0200, Geert Uytterhoeven wrote:
> On Wed, Jun 24, 2020 at 6:02 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >         /* If we have an image attached to us, it overrides anything
> >          * supplied by the loader. */
> > -       if (_initrd_end > _initrd_start) {
> > +       if (&_initrd_end > &_initrd_start) {
> 
> Are you sure that fix is correct?
> 
>     extern char _initrd_start[];
>     extern char _initrd_end[];
>     extern char _esm_blob_start[];
>     extern char _esm_blob_end[];
> 
> Of course the result of their comparison is a constant, as the addresses
> are constant.  If clangs warns about it, perhaps that warning should be moved
> to W=1?
> 
> But adding "&" is not correct, according to C.

Why not?

6.5.3.2/3
The unary & operator yields the address of its operand.  [...]
Otherwise, the result is a pointer to the object or function designated
by its operand.

This is the same as using the name of an array without anything else,
yes.  It is a bit clearer if it would not be declared as array, perhaps,
but it is correct just fine like this.


Segher
