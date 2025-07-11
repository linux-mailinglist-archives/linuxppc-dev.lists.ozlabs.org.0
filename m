Return-Path: <linuxppc-dev+bounces-10198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A5DB02789
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jul 2025 01:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf6wb5zn8z30Vq;
	Sat, 12 Jul 2025 09:14:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752275647;
	cv=none; b=cFE1hPJgzFQwjP2RP0txMTliMjEJI4NAEZxBJ2gCUFR/o6ioyoRVeTqnQehkfplZHvnO8a4j4ZuHO+uZ0lm8nCju014aJdWfabYGSAI+Obl7GPWDO6uQyfLEZCEgLw26K1+5eRgJ0BQp8CU1/wnOBS32Fef8NyNuOwek9lF8jKQ3cBhz73UbH/wxInLSmjovpw42vrMTGFHmDewWTekzjt0aNHQ63YBwyhFgTRMbgB8BePe5q4Yheiscls5oQfuW1nIRMcMDyz/9WGR+z+WH3W2ZO0st+D+KgCaoh8bNmBb7kajJasyQk+UH2NyhnIs8elRLD4Z1mku67xrDmZlyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752275647; c=relaxed/relaxed;
	bh=g5oEdeuDOuviJkNydM1e+9KadvB9kDXjh19Zd7GD6dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOFDRXOZStRzXwfNe/dejeP2y4lQnBB+3rRQjQJxUmcBsNhSKmwte80+KKdlWAEhDKSxB4KTL/zTf74dCYmi43SriK+Qrw74lJWBnMX7jbpa/klEMWegBy29/kw4l/o/bwrcXTaQX8JASSjJNZwtwRGTfjEYsGH99+1eqS844ZCjST5HQunoH6sCMH1Vch0N9KK6t78p0GJU01PZu08QwS6Rcjz6QZZC25chBHvnV6fg3KCxdjr8bxKGu+9147ncCDxzGCPG2vLetZLLjja+j0drG3HER667pgvgbRZceV4p3jrOPzc6lem7lBiKDUtaYVvVQS9f7MRNKAb231GZ+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf6wZ39p6z2yrj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 09:14:05 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 56BND41k624388;
	Fri, 11 Jul 2025 18:13:04 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 56BND1e0624384;
	Fri, 11 Jul 2025 18:13:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 11 Jul 2025 18:13:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Richard Fontana <rfontana@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>, Thomas Huth <thuth@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-spdx@vger.kernel.org,
        J Lovejoy <opensource@jilayne.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <aHGafTZTcdlpw1gN@gate>
References: <20250711053509.194751-1-thuth@redhat.com>
 <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
 <2025071152-name-spoon-88e8@gregkh>
 <aHC-Ke2oLri_m7p6@infradead.org>
 <2025071119-important-convene-ab85@gregkh>
 <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 05:02:18PM -0400, Richard Fontana wrote:
> On Fri, Jul 11, 2025 at 3:38 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jul 11, 2025 at 12:32:57AM -0700, Christoph Hellwig wrote:
> > > On Fri, Jul 11, 2025 at 09:30:31AM +0200, Greg Kroah-Hartman wrote:
> > > > That's a crazy exception, and one that should probably be talked about
> > > > with the FSF to determine exactly what the SPDX lines should be.
> > >
> > > It is called the libgcc exception and has been around forever for the
> > > files in libgcc.a that a lot of these low-level kernel helpers were
> > > copied from as the kernel doesn't link libgcc.
> >
> > Ah, so it would be something like this exception:
> >         https://spdx.org/licenses/GCC-exception-2.0.html
> > but the wording doesn't seem to match.
> >
> > I'll let the license lawyers figure this out, thanks for the hint!
> 
> This one
> 
>  * In addition to the permissions in the GNU General Public License, the
>  * Free Software Foundation gives you unlimited permission to link the
>  * compiled version of this file with other programs, and to distribute
>  * those programs without any restriction coming from the use of this
>  * file.  (The General Public License restrictions do apply in other
>  * respects; for example, they cover modification of the file, and
>  * distribution when not linked into another program.)
> 
> is `GCC-exception-2.0`
> 
> while this one:
> 
>  *    As a special exception, if you link this library with files
>  *    compiled with GCC to produce an executable, this does not cause
>  *    the resulting executable to be covered by the GNU General Public License.
>  *    This exception does not however invalidate any other reasons why
>  *    the executable file might be covered by the GNU General Public License.
> 
> does not seem to be in the SPDX exception list. It is very similar to
> `GNU-compiler-exception` except it specifically mentions GCC instead
> of saying "a GNU compiler".

https://spdx.org/licenses/GNU-compiler-exception.html

is exactly this.


Segher

