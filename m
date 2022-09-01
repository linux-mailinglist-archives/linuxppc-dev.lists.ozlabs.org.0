Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1AB5A9EB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 20:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTgV2TTYz30L5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 04:13:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTg45H4hz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 04:13:04 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 281I7qru032240;
	Thu, 1 Sep 2022 13:07:52 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 281I7phS032237;
	Thu, 1 Sep 2022 13:07:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 1 Sep 2022 13:07:51 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and irq_soft_mask_return() with sanitizer
Message-ID: <20220901180751.GH25951@gate.crashing.org>
References: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu> <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo> <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu> <CMJ8P06JA9OY.1S8VDV2XRU3W5@bobo> <7c11b659-5b8e-256c-508e-39395041fccb@csgroup.eu> <20220831224522.GX25951@gate.crashing.org> <ad5ebb37-6b6f-372c-dd07-fc4cfc5f5fe5@csgroup.eu> <YxBhRtTuJ4Ut7wUt@lt-gp.iram.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxBhRtTuJ4Ut7wUt@lt-gp.iram.es>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 09:37:42AM +0200, Gabriel Paubert wrote:
> On Thu, Sep 01, 2022 at 05:22:32AM +0000, Christophe Leroy wrote:
> > Le 01/09/2022 à 00:45, Segher Boessenkool a écrit :
> > > I would have used real assembler code here (in a .s file).  But there
> > > probably are reasons to do things this way, performance probably?
> > 
> > We changed it to inline asm in order to ... inline it in the caller.
> 
> And there is a single caller it seems. Typically GCC inlines function
> with a single call site, but it may be confused by asm statements.

"Confused"...  It might estimate the assembler statement to be
significantly more expensive than it really is.  The compiler has to be
somewhat conservative, to be able to generate code that can be assembled
without errors.  It counts instructions by counting newlines and semis
and that kind of thing.  Since GCC 7 there is "asm inline", to make the
compiler think for inlining purposes that the asm outputs minimum size
code.  You can use asm_inline in the kernel for this.

> > I also find that those operand names make it awull more difficult to 
> > read that traditional numbering. I really dislike that new trend.

Yup.  All the extra markup it needs doesn't benefit readability either.

> > And same with those // comments, better use meaningfull C variable names.

I wrote:

> > > Comments like "// Inputs" are just harmful.  As is the "creative"
> > > indentation here.  Both harm readability and do not help understanding
> > > in any other way either.

This is a comment trying to explain (GNU) C syntax.  I certainly agree
that variable naming is very important, but this was meant as commentary
on a worse comment offence :-)


Segher
