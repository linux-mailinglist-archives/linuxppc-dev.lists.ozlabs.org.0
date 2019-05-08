Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617217BC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 16:42:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zfMN5WRwzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 00:42:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zfL14LhtzDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 00:41:13 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x48Ef0ZK007596;
 Wed, 8 May 2019 09:41:00 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x48Eexn8007593;
 Wed, 8 May 2019 09:40:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 8 May 2019 09:40:58 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: slightly improve cache helpers
Message-ID: <20190508144058.GI8599@gate.crashing.org>
References: <0b460a85319fb89dab2c5d1200ac69a3e1b7c1ef.1557235807.git.christophe.leroy@c-s.fr>
 <20190507151030.GF8599@gate.crashing.org>
 <720e7c77-3f5c-83f3-6013-36b265c1ba73@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <720e7c77-3f5c-83f3-6013-36b265c1ba73@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07, 2019 at 06:53:30PM +0200, Christophe Leroy wrote:
> Le 07/05/2019 à 17:10, Segher Boessenkool a écrit :
> >On Tue, May 07, 2019 at 01:31:39PM +0000, Christophe Leroy wrote:
> >>Cache instructions (dcbz, dcbi, dcbf and dcbst) take two registers
> >>that are summed to obtain the target address. Using '%y0' argument
> >>gives GCC the opportunity to use both registers instead of only one
> >>with the second being forced to 0.
> >
> >That's not quite right.  Sorry if I didn't explain it properly.
> >
> >"m" allows all memory.  But this instruction only allows reg,reg and
> >0,reg addressing.  For that you need to use constraint "Z".
> 
> But gcc help 
> (https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html#Machine-Constraints) 
> says it is better to use 'm':

It says it *usually* is better to use "m".  What it really should say is
it is better to use "m" _when that is valid_.  It is not valid for the
cache block instructions.

I'll fix up the comment...  "es" is ancient, too, nowadays it is
equivalent to just "m" (and you need "m<>" to allow pre-modify addressing).

> Z
> 
>     Memory operand that is an indexed or indirect from a register (it 
> is usually better to use ‘m’ or ‘es’ in asm statements)
> 
> That's the reason why I used 'm', I thought it was equivalent.

Yeah, the manual text could be clearer.


Segher
