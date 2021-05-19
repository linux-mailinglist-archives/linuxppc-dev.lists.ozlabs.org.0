Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955F3890C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 16:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlZvf0PYnz3bsc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 00:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlZvJ4cPgz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 00:27:07 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14JEKjJt024903;
 Wed, 19 May 2021 09:20:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14JEKhmf024894;
 Wed, 19 May 2021 09:20:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 19 May 2021 09:20:38 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
Message-ID: <20210519142038.GI10366@gate.crashing.org>
References: <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
 <87a6ork1qp.fsf@mpe.ellerman.id.au>
 <20210519004514.GC10366@gate.crashing.org>
 <20210519120306.GD10366@gate.crashing.org>
 <46cedc01-bca7-236d-9f74-a9cc24391512@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cedc01-bca7-236d-9f74-a9cc24391512@roeck-us.net>
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
Cc: npiggin@gmail.com, linux-mm@kvack.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 06:37:44AM -0700, Guenter Roeck wrote:
> On 5/19/21 5:03 AM, Segher Boessenkool wrote:
> >On Tue, May 18, 2021 at 07:45:14PM -0500, Segher Boessenkool wrote:
> >>And it actually explicitly is undefined behaviour in C90 already
> >>(3.6.6.4 in C90, 6.8.6.4 in C99 and later).
> >
> >... but there is a GCC extension that allows this by default:
> ><https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wreturn-type>
> >   For C only, warn about a 'return' statement with an expression in a
> >   function whose return type is 'void', unless the expression type is
> >   also 'void'.  As a GNU extension, the latter case is accepted
> >   without a warning unless '-Wpedantic' is used.
> 
> In C99:
> 
> "6.8.6.4 The return statement
> Constraints
> 
> A return statement with an expression shall not appear in a function whose 
> return type
> is void. A return statement without an expression shall only appear in a 
> function
> whose return type is void."
> 
> Sounds like invalid to me, not just undefined behavior.

I don't know what "invalid" would mean here other than UB, it isn't a
specific defined term, unlike the latter, which is precisely defined in
3.4.3/1:
  undefined behavior
  behavior, upon use of a nonportable or erroneous program construct or
  of erroneous data, for which this International Standard imposes no
  requirements

This is the strongest thing the standard can say, it is not Law, it does
not prohibit anyone from doing anything :-)

"Shall" and "shall not" X means it is undefined behaviour if X (or its
inverse)  is violated.  See 4.2:
  If a ''shall'' or ''shall not'' requirement that appears outside of a
  constraint or runtime-constraint is violated, the behavior is
  undefined.  Undefined behavior is otherwise indicated in this
  International Standard by the words ''undefined behavior'' or by the
  omission of any explicit definition of behavior.  There is no
  difference in emphasis among these three; they all describe ''behavior
  that is undefined''.
which also explains that what you call "invalid" has undefined behaviour
just as well, most likely.


Segher
