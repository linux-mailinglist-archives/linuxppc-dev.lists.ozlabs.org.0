Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68013F9CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 20:48:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zF9Y1S9VzDqHW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 06:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.148; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=TXdczIVs; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound5mad.lav.puc.rediris.es
 [130.206.19.148])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBP12H3JzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:42:59 +1100 (AEDT)
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
 by mx01.puc.rediris.es  with ESMTP id 00GHglZl009885-00GHglZn009885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 16 Jan 2020 18:42:47 +0100
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id 60C2E193D3;
 Thu, 16 Jan 2020 18:42:47 +0100 (CET)
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id 05463193D4;
 Thu, 16 Jan 2020 18:42:46 +0100 (CET)
Received: from lt-gp.iram.es (141.33.223.87.dynamic.jazztel.es [87.223.33.141])
 by sim.rediris.es (Postfix) with ESMTPA id 6A365193D3;
 Thu, 16 Jan 2020 18:42:44 +0100 (CET)
Date: Thu, 16 Jan 2020 18:42:40 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PosibleSpam] Re: z constraint in powerpc inline assembly ?
Message-ID: <20200116174240.GA12574@lt-gp.iram.es>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
 <20200116080608.GA29711@lt-gp.iram.es>
 <20200116135729.GP3191@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200116135729.GP3191@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=uBJ4LYAvCOyrishJ86SwMuHNJrOJPE5oBG87WuTr6Ws=;
 b=TXdczIVsRZsugpG3mUPc8nDQmb540vdL916eYP9F++jx2ELg/R4EiTlb94QEQK5n+TzAHxJ73GOT
 XVA7Ep1vM3zVB3kYroudsd/7zVWnP3Mkfecv8ez1c58inPeZGS28w/+qz3KS57bXgg2IcNQJjSPm
 av5u5xKzxQt8209kJgbiYtSd7u72vsIWHw71N0O6XXnFDV8pFR8Wi+Xy5I1v8Oslh4tuYJ1//KMm
 Dj7k8gvHMpGKKcSxOo/Ab4SVPA6IKmMzZQfzWQk/+UzaflTcPRxpvo3R5c9oTvUkaMNnb+7uatcr
 MTr7Foa8bB9krOlqok0xbU0cLswxpdjgBVSHNg==
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 07:57:29AM -0600, Segher Boessenkool wrote:
> On Thu, Jan 16, 2020 at 09:06:08AM +0100, Gabriel Paubert wrote:
> > On Thu, Jan 16, 2020 at 07:11:36AM +0100, Christophe Leroy wrote:
> > > Hi Segher,
> > > 
> > > I'm trying to see if we could enhance TCP checksum calculations by splitting
> > > inline assembly blocks to give GCC the opportunity to mix it with other
> > > stuff, but I'm getting difficulties with the carry.
> > > 
> > > As far as I can read in the documentation, the z constraint represents
> > > '‘XER[CA]’ carry bit (part of the XER register)'
> > 
> > Well, the documentation is very optimisitic. From the GCC source code
> > (thanks for switching to git last week-end ;-)), it is clear that the
> > carry is not, for the time being, properly modeled. 
> 
> What?  It certainly *is*, I spent ages on that back in 2014 and before.
> See gcc.gnu.org/PR64180 etc.
> 
> You can not put the carry as input or output to an asm, of course: no C
> variable can be assigned to it.
> 
> We don't do the "flag outputs" thing, either, as it is largely useless
> for Power (and using it would often make *worse* code).
> 
> If you want to access a carry, write C code that does that operation.
> The compiler knows how to optimise it well.
> 
> > Right now, in the machine description, all setters and users of the carry
> > are in the same block of generated instructions.
> 
> No, they are not.  For over five years now.  (Since GCC 5).
> 
> > For a start, all single instructions patterns that set the carry (and
> > do not use it) as a side effect should mention the they clobber the 
> > carry, otherwise inserting one between a setter and a user of the carry 
> > would break.
> 
> And they do.
>

Apologies, I don't know how I could misread the .md files this badly.
Indeed I see everything now that you mention it.

I'm still a bit surprised that I have found zero "z" constraints in the
whole gcc/config/rs6000 directory. Everything seems to be CA_REGNO.

> All asms that change the carry should mention that, too, but this is
> automatically done for all inline asms, because there was a lot of code
> in the wild that does not clobber it.

I was not aware of this, anyway I would always put as correct as
possible clobbers for my inline assembly code.

> 
> > This includes all arithmetic right shift (sra[wd]{,i}, 
> > subfic, addic{,\.} and I may have forgotten some.
> 
> {add,subf}{ic,c,e,ze,me} and sra[wd][i] and their dots.  Sure.  And
> mcrxr and mcrxrx and mfxer and mtxer.  That's about it.

Yes, but are last ones (the moves) are ever generated by the compiler?

Looking at the source (again) it seems that even lswi has disappeared.

> 
> We don't model the second carry at all yet btw, in GCC.  Not too many
> people know it exists even, so no big loss there.
> 

Anyway, I couldn't use it. I tried to buy a Talos II at work but
management made it too complex to negotiate. The problem was not the
money, but the paperwork :-(. Now my most powerful PPC machine is a 17" 
Powerbook G4.

> (One nasty was that addi. does not exist, so we used addic. where it was
> wanted before, so that had to change.)
> 
> 
> Segher


	Regards,
	Gabriel
