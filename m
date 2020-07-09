Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04721A5E0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 19:33:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2jvG2VGWzDrFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 03:33:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4B2jsS0FP9zDr70
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 03:31:54 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 069HVfAr005816;
 Thu, 9 Jul 2020 12:31:41 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 069HVeeS005815;
 Thu, 9 Jul 2020 12:31:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 9 Jul 2020 12:31:40 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: Failure to build librseq on ppc
Message-ID: <20200709173140.GK3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org>
 <841816533.1735.1594211583710.JavaMail.zimbra@efficios.com>
 <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
 <20200709001003.GB3598@gate.crashing.org>
 <429958629.6348.1594301598584.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429958629.6348.1594301598584.JavaMail.zimbra@efficios.com>
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 09, 2020 at 09:33:18AM -0400, Mathieu Desnoyers wrote:
> > The way this all uses r17 will likely not work reliably.
> 
> r17 is only used as a temporary register within the inline assembler, and it is
> in the clobber list. In which scenario would it not work reliably ?

This isn't clear at all, that is the problem.

> > The way multiple asm statements are used seems to have missing
> > dependencies between the statements.
> 
> I'm not sure I follow here. Note that we are injecting the CPP macros into
> a single inline asm statement as strings.

Yeah...  more trickiness.

> > And done macro-mess this, you want to be able to debug it, and you need
> > other people to be able to read it!
> 
> I understand that looking at macros can be cumbersome from the perspective
> of a reviewer only interested in a single architecture,

No, from the perspective of *any* reviewer.

> However, from my perspective, as a maintainer who must maintain similar code
> for x86 32/64, powerpc 32/64, arm, aarch64, s390, s390x, mips 32/64, and likely
> other architectures in the future, the macros abstracting 32-bit and 64-bit
> allow to eliminate code duplication for each architecture with 32-bit and 64-bit
> variants, which is better for maintainability.

IMNSHO it is MUCH better to just have simple separate implementations
for each.  They differ in *all* details.

Or have static inline functions, with proper dependencies, instead of
nasty text macros.

But it's your code, do what you want :-)


Segher
