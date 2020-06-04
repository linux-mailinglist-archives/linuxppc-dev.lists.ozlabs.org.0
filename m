Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8A1EEE90
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 01:59:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dN794NXszDqkw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 09:59:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pbcl.net (client-ip=2a01:4f8:c2c:5794::1; helo=pbcl.net;
 envelope-from=pb@pbcl.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=pbcl.net
Received: from pbcl.net (pbcl.net [IPv6:2a01:4f8:c2c:5794::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dMmz2hxWzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 09:44:03 +1000 (AEST)
Received: from pb by pbcl.net with local (Exim 4.92)
 (envelope-from <pb@pbcl.net>)
 id 1jgzWb-00005c-OI; Fri, 05 Jun 2020 01:43:53 +0200
Date: Fri, 5 Jun 2020 01:43:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200604234353.GC28641@pbcl.net>
References: <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604215511.GB28641@pbcl.net>
 <20200604230639.GL31009@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604230639.GL31009@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>,
 Will Springer <skirmisher@protonmail.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 06:06:39PM -0500, Segher Boessenkool wrote:
> On Thu, Jun 04, 2020 at 11:55:11PM +0200, Phil Blundell wrote:
> > 1a. Define your own subset of ELFv2 which is interworkable with the full 
> > ABI at the function call interface but doesn't make all the same 
> > guarantees about binary compatibility.  That would mean that a binary 
> > built with your toolchain and conforming to the subset ABI would run on 
> > any system that implements the full ELFv2 ABI, but the opposite is not 
> > necessarily true.
> 
> And you can only use shared objects also built for that subset ABI.  If
> you use some binary distribution, then it will also have to be built for
> that subset, practically anyway.

Right, absolutely.  Any place that I wrote "binary", I meant to include
both DSOs and executables.

> This is very similar to soft-float targets.

Yes, agreed.

> There is more process involved than most open source people are
> comfortable with :-/

Yes, that's unfortunate but it goes with the territory.  I think we have 
to accept that any attempt to define a single ABI where there are 
multiple interests involved will be a significant effort involving 
thousands of person-hours of work, much discussion, and a certain amount 
of politics and compromise.  Inevitably, some people/organisations at 
the margins will decide that the game isn't worth the candle.  If they 
don't participate in the general ABI effort then they can hardly 
complain about the results, but equally there is nothing to stop these 
folks from defining their own ABIs.  If they can attain a critical mass 
to support such a variant ABI then, as far as I'm concerned, that's a 
fine thing and all power to them.

p.
