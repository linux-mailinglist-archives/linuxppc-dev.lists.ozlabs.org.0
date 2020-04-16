Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3C1AD012
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 21:04:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4937vB2pwkzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 05:04:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4937rT6fdLzDrT3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 05:02:17 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03GJ20UU003931;
 Thu, 16 Apr 2020 14:02:00 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03GJ1wgI003930;
 Thu, 16 Apr 2020 14:01:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 16 Apr 2020 14:01:58 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
Message-ID: <20200416190158.GC26902@gate.crashing.org>
References: <c9abd91e9bb0b3dd6e3470015e92b98bc2483780.1586942304.git.christophe.leroy@c-s.fr>
 <20200415223747.GX26902@gate.crashing.org>
 <f797e5ac-a29a-0eb0-89c8-ff0a9f537ccf@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f797e5ac-a29a-0eb0-89c8-ff0a9f537ccf@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 02:41:56PM +0200, Christophe Leroy wrote:
> Le 16/04/2020 à 00:37, Segher Boessenkool a écrit :
> >>+	__put_user_nocheck_goto((__typeof__(*(ptr)))(x), (ptr), 
> >>sizeof(*(ptr)), label)
> >
> >This line gets too long, can you break it up somehow?
> 
> This line has 86 chars.

(And your mail program has wrapped it ;-) )

> powerpc arch tolerates lines with up to 90 chars, see 
> arch/powerpc/tools/checkpatch.sh

I *tolerate* it as well, sure, but long lines are bad for readability.
Like, I noticed it because it wrapped :-)

That "90" thing is just dumb, we should get rid of it.  Sometimes you
can have long lines, if that is better than the alternatives.  There
does not need to be a ridiculous "rule" that is unhappy *both* ways!

(This is true for many things in checkpatch, btw...  Rules of thumb,
not rules).


Segher
