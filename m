Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B0054AF78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 13:47:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMmrY6J0Lz3ch5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 21:47:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMmr76cShz301N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 21:47:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25EBhmhF018248;
	Tue, 14 Jun 2022 06:43:48 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25EBhlHZ018247;
	Tue, 14 Jun 2022 06:43:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 14 Jun 2022 06:43:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Message-ID: <20220614114347.GX25951@gate.crashing.org>
References: <20220601054850.250287-1-rmclure@linux.ibm.com> <20220601160023.GV25951@gate.crashing.org> <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com> <d79992ce-d49b-314a-cb64-8804f43f6c03@csgroup.eu> <20220613184830.GW25951@gate.crashing.org> <875yl3dfy2.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yl3dfy2.fsf@mpe.ellerman.id.au>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 02:31:01PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Sat, Jun 11, 2022 at 08:42:27AM +0000, Christophe Leroy wrote:
> >> I'd have a preference for using a verb, for instance ZEROISE_REGS or 
> >> CLEAR_REGS
> >
> > "Zero" is a verb as well (as well as a noun and an adjective) :-)
> 
> And "clear" is also a verb and an adjective, though helpfully the noun
> is "clearing" :D

Yeah.  I don't like "clear" here because it isn't as clear what it
actually will do.  The purpose here is to actually makes those registers
hold the number zero, it isn't just to make it harmless some way.  Which
btw is the context in which "zeroisation" is normally used: in crypto
and other security stuff.

But "zero_regs" can be confusing in other ways, like, if it isn't clear
to the reader it is a verb here.

> We could use "nullify", that has some existing usage in the kernel,
> although I don't really mind, "zeroise" sounds kind of cool :)

That is a benefit yes :-)  And it won't be confusing what it does.


Segher
