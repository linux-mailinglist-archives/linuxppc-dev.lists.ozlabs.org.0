Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C813570CFE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 23:51:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhcz32Cxfz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 07:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhcyb3Xrhz3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 07:51:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26BLmgGA018033;
	Mon, 11 Jul 2022 16:48:42 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26BLmeGc018032;
	Mon, 11 Jul 2022 16:48:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 11 Jul 2022 16:48:40 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220711214840.GJ25951@gate.crashing.org>
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali> <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali> <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com> <20220708171227.74nbcgsk63y4bdna@pali> <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com> <d9339bb9-2410-bea5-7502-1c7839707f4e@csgroup.eu> <20220711161442.GD25951@gate.crashing.org> <2552726a-cca4-ecd4-6fca-4f73bbf7942e@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2552726a-cca4-ecd4-6fca-4f73bbf7942e@csgroup.eu>
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Jul 11, 2022 at 05:32:09PM +0000, Christophe Leroy wrote:
> Le 11/07/2022 à 18:14, Segher Boessenkool a écrit :
> >>     CC      arch/powerpc/kernel/irq.o
> >> {standard input}: Assembler messages:
> >> {standard input}:3535: Error: unrecognized opcode: `wrteei'
> >> {standard input}:5608: Error: unrecognized opcode: `wrteei'
> > 
> > What -mcpu= did it use here?
> 
> -mcpu=powerpc64
> 
> > wrteei is not a PowerPC insn (it is BookE, instead), so it is not
> > recognised without an appropriate -mcpu=.
> > 
> >> If I select the e5500 (without altivec) or e6500 I get:
> >>
> >>     CC      arch/powerpc/kernel/io.o
> >> {standard input}: Assembler messages:
> >> {standard input}:381: Error: unrecognized opcode: `eieio'
> > 
> > Same question.  eieio is a base PowerPC instruction, so this one is
> > "interesting" :-)
> 
> -mcpu=e500mc64 (for e5500)
> -mcpu=e6500 (for e6500)
> 
> I had to replace 'eieio' instruction by 'mbar' instruction.

I saw some patches fly by...  you have it all fixed with that?

> Seems like binutils added 'eieio' to e500 in 2010 via commit 
> e01d869a3be, but it seems it is only for the 85xx, not for the others.

I believe the eieio instruction is disabled on some e500 models, because
it does not work correctly, so EIEIO_EN=1 cannot work, something like
that?


Segher
