Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0275B1FDC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNghR6g04z3c9p
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNgh32QNXz30D0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:58:26 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 288Dm1Ft015930;
	Thu, 8 Sep 2022 08:48:01 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 288Dm0t8015929;
	Thu, 8 Sep 2022 08:48:00 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 8 Sep 2022 08:48:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
Message-ID: <20220908134800.GM25951@gate.crashing.org>
References: <20190621085822.1527-1-malat@debian.org> <7cb1285a-42e6-2b67-664f-7d206bc9fd80@csgroup.eu> <87v8pyemmw.fsf@mpe.ellerman.id.au> <9a5bd7c2-13ee-2517-48f6-e61a6dc9c076@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a5bd7c2-13ee-2517-48f6-e61a6dc9c076@csgroup.eu>
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
Cc: Mathieu Malaterre <malat@debian.org>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 08, 2022 at 06:00:24AM +0000, Christophe Leroy wrote:
> Looking at it more deeply, I see strange things.

I'll have to see full generated machine code to be able to see strange
things, there isn't enough information at all here yet.  Sorry.

Use private mail if it is too big or uninteresting for the list :-)

> What is that frame size ? I thought it was the number of bytes r1 is 
> decremented at the begining of the function, but it seems not, at least 
> on GCC. It seems GCC substrats 112 bytes while clang doesn't.

That is the vars size + the fixed size + the size of the parameter
save area + the size of the regs save area, rounded up to a multiple
of 16.  Fixed size is 8 on 32-bit PowerPC ELF.  Frame size used by GCC
here is just the vars size.

> So it seems that GCC and CLANG don't warn on the same thing, is that 
> expected ? GCC substrats 112 bytes, which is the minimum frame size on a 
> ppc64, but here I'm building a ppc32 kernel, min frame size is 16.

I need to see the generated code to make sense of what is happening
here.  It sounds like it is doing varargs calls or similar expensive
stack juggling.  Or just saving a boatload of registers on the stack.

> And CLANG is still using stack a lot more than GCC.

Good to hear!  Well, good for GCC, anyway ;-)


Segher
