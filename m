Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E91338A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 20:16:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wgLt0bKzzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 04:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wgKR65NtzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 04:15:23 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x43IF9Dv008894;
 Fri, 3 May 2019 13:15:09 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x43IF8rU008889;
 Fri, 3 May 2019 13:15:08 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 3 May 2019 13:15:08 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32: Remove memory clobber asm constraint on
 dcbX() functions
Message-ID: <20190503181508.GQ8599@gate.crashing.org>
References: <20180109065759.4E54B6C73D@localhost.localdomain>
 <e482662f-254c-4ab7-b0a8-966a3159d705@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e482662f-254c-4ab7-b0a8-966a3159d705@c-s.fr>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Fri, May 03, 2019 at 04:14:13PM +0200, Christophe Leroy wrote:
> A while ago I proposed the following patch, and didn't get any comment 
> back on it.

I didn't see it.  Maybe because of holiday :-)

> Do you have any opinion on it ? Is it good and worth it ?

> Le 09/01/2018 à 07:57, Christophe Leroy a écrit :
> >Instead of just telling GCC that dcbz(), dcbi(), dcbf() and dcbst()
> >clobber memory, tell it what it clobbers:
> >* dcbz(), dcbi() and dcbf() clobbers one cacheline as output
> >* dcbf() and dcbst() clobbers one cacheline as input

You cannot "clobber input".

Seen another way, only dcbi clobbers anything; dcbz zeroes it instead,
and dcbf and dcbst only change in what caches the data hangs out.

> >--- a/arch/powerpc/include/asm/cache.h
> >+++ b/arch/powerpc/include/asm/cache.h
> >@@ -82,22 +82,31 @@ extern void _set_L3CR(unsigned long);
> >  
> >  static inline void dcbz(void *addr)
> >  {
> >-	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
> >+	__asm__ __volatile__ ("dcbz 0, %1" :
> >+			      "=m"(*(char (*)[L1_CACHE_BYTES])addr) :
> >+			      "r"(addr) :);
> >  }

The instruction does *not* work on the memory pointed to by addr.  It
works on the cache line containing the address addr.

If you want to have addr always aligned, you need to document this, and
check all callers, etc.

> >  static inline void dcbf(void *addr)
> >  {
> >-	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
> >+	__asm__ __volatile__ ("dcbf 0, %1" :
> >+			      "=m"(*(char (*)[L1_CACHE_BYTES])addr) :
> >+			      "r"(addr), "m"(*(char 
> >(*)[L1_CACHE_BYTES])addr) :
> >+			     );
> >  }

Newline damage...  Was that your mailer?


Also, you may want a "memory" clobber anyway, to get ordering correct
for the synchronisation instructions.

I think your changes make things less robust than they were before.


[ Btw.  Instead of

	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");

you can do

	__asm__ __volatile__ ("dcbf %0" : : "Z"(addr) : "memory");

to save some insns here and there. ]


Segher
