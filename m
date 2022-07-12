Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA0571C02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 16:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj2mS3QZyz3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 00:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj2m26BdBz30LR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 00:13:22 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26CEB93o025896;
	Tue, 12 Jul 2022 09:11:09 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26CEB7M3025895;
	Tue, 12 Jul 2022 09:11:07 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 12 Jul 2022 09:11:07 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220712141107.GM25951@gate.crashing.org>
References: <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali> <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com> <20220708171227.74nbcgsk63y4bdna@pali> <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com> <d9339bb9-2410-bea5-7502-1c7839707f4e@csgroup.eu> <20220711161442.GD25951@gate.crashing.org> <2552726a-cca4-ecd4-6fca-4f73bbf7942e@csgroup.eu> <20220711214840.GJ25951@gate.crashing.org> <aab87b89-3518-f13e-995a-cbe48892e200@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aab87b89-3518-f13e-995a-cbe48892e200@csgroup.eu>
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

On Tue, Jul 12, 2022 at 09:22:12AM +0000, Christophe Leroy wrote:
> Le 11/07/2022 à 23:48, Segher Boessenkool a écrit :
> > I believe the eieio instruction is disabled on some e500 models, because
> > it does not work correctly, so EIEIO_EN=1 cannot work, something like
> > that?
> 
> Don't know.
> 
> It is also disabled on 405 and 440.

BookE does not have the eieio insn.  Instead, it reuses the same opcode
for mbar, which has similar but different semantics.

e500 has that EIEIO_EN thing which makes the insn behave like eieio.

> That's new with GCC 12.

Yup.  In the past we used -many, but that just hides problems in the
best case, and causes more problems itself :-(

There are many mnemonics that cause a different instruction to be
emitted on different targets, and that causes a lot of wasted time
trying to find and fix the problems this causes.

If you hit any remaining problems related to this, please let me know!


Segher
