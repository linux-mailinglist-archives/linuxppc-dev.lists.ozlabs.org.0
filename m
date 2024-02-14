Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DD854978
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 13:43:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZdCM4fD6z3vXx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 23:43:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZdBx0Cd3z3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 23:42:48 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41ECaQmn030022;
	Wed, 14 Feb 2024 06:36:26 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 41ECaO1V030021;
	Wed, 14 Feb 2024 06:36:24 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 14 Feb 2024 06:36:24 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] tty: hvc-iucv: fix function pointer casts
Message-ID: <20240214123624.GB19790@gate.crashing.org>
References: <20240213101756.461701-1-arnd@kernel.org> <20240213191254.GA19790@gate.crashing.org> <57d72e2ccc8245fe99982613a11c461c@AcuMS.aculab.com> <2024021426-unleveled-unhearing-8021@gregkh>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021426-unleveled-unhearing-8021@gregkh>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jiri Slaby <jirislaby@kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, David Laight <David.Laight@aculab.com>, Bill Wendling <morbo@google.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 11:37:21AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 14, 2024 at 09:46:33AM +0000, David Laight wrote:
> > From: Segher Boessenkool
> > > Sent: 13 February 2024 19:13
> > > 
> > > On Tue, Feb 13, 2024 at 11:17:49AM +0100, Arnd Bergmann wrote:
> > > > clang warns about explicitly casting between incompatible function
> > > > pointers:
> > > >
> > > > drivers/tty/hvc/hvc_iucv.c:1100:23: error: cast from 'void (*)(const void *)' to 'void (*)(struct
> > > device *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
> > > >  1100 |         priv->dev->release = (void (*)(struct device *)) kfree;
> > > >       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Such a cast of course is explicitly allowed by 6.3.2.3/8, only calling a
> > > function using a non-compatible type is UB.  This warning message is
> > > quite misleading.  Doubly so because of the -Werror, as always.
> > 
> > But it will get called using the wrong type.
> > And (is it) fine-ibt will reject the incorrect call.
> 
> And rightfully so, this type of casting abuse is just that, abuse.
> 
> Almost no one should be just calling kfree() on a device pointer, I'll
> look at the surrounding code as odds are something odd is going on.  But
> for now, this patch is correct.

Yes, and I said so.  My point is that the warning message pretends the
cast is bad or dangerous.  It is not, similar casts are the only way in
C to do certain things (yes, you can always avoid it completely, by
writing completely different code, like the patch does, and that
sometimes is a better idea even).

But the warning message is misleading and does more damage than it helps
avoid.


Segher
