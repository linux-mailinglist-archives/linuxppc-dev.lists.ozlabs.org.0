Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A4293B72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:23:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFt7r6CzKzDqbY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 23:23:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4CFsTY6y4czDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 22:53:37 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 09KBpIuN022840;
 Tue, 20 Oct 2020 06:51:18 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 09KBpGRn022835;
 Tue, 20 Oct 2020 06:51:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 20 Oct 2020 06:51:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 3/3] powerpc: Fix pre-update addressing in inline assembly
Message-ID: <20201020115116.GY2672@gate.crashing.org>
References: <5ffcb064f695d5285bf1faab91bffa3f9245fc26.1603109522.git.christophe.leroy@csgroup.eu>
 <fbcdb173cc42da62f00285dfef8c2f7d4960b5c7.1603109522.git.christophe.leroy@csgroup.eu>
 <20201019202441.GU2672@gate.crashing.org>
 <ff158583-4e25-a5e6-5131-359423037e4f@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff158583-4e25-a5e6-5131-359423037e4f@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 20, 2020 at 09:44:33AM +0200, Christophe Leroy wrote:
> Le 19/10/2020 à 22:24, Segher Boessenkool a écrit :
> >>but the associated "<>" constraint is missing.
> >
> >But that is just fine.  Pointless, sure, but not a bug.
> 
> Most of those are from prehistoric code. So at some point in time it was 
> effective. Then one day GCC changed it's way and they became pointless. So, 
> not a software bug, but still a regression at some point.
> 
> >>Use UPD_CONSTR macro everywhere %Un modifier is used.
> >
> >Eww.  My poor stomach.
> 
> There are not that many :)

Heh, your pain threshold is much higher than mine I guess :-)

> >Have you verified that update form is *correct* in all these, and that
> >we even *want* this there?
> 
> I can't see anything that would militate against it, do you ?
> 
> I guess if the elders have put %Us there, it was wanted.

On old CPUs, update form load/stores actually executed faster than a
"normal" memory access and an addi (or plain add).  But on more recent
stuff it mostly saves code size.  Which is nice of course, and can speed
up your code a bit, in theory at least.

It is quite hard to trigger the compiler to generate update form insns
in asm, sigh.  So testing will probably not show anything either way.
Oh well :-)


Segher
